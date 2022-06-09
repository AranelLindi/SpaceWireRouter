----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 31.07.2021 12:53
-- Design Name: SpaceWire Router Top Module
-- Module Name: spwrouter
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: Complete router implementation which contains all necessary entities.
-- (Active autostart but no linkstart! Router is waiting for an attemption of an incoming connection)
--
-- Dependencies: spwpkg, spwrouterpkg
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;
USE WORK.SPWROUTERPKG.ALL;
USE WORK.SPWPKG.ALL;

ENTITY spwrouter IS
    GENERIC (
        -- Number of SpaceWire ports.
        numports : INTEGER RANGE 0 TO 31 := 2;

        -- System clock frequency in Hz.
        sysfreq : real := 10.0e6;

        -- txclk frequency in Hz (if tximpl = impl_fast)
        txclkfreq : real := 10.0e6;

        -- Selection of receiver front-end implementation.
        rx_impl : rximpl_array(numports DOWNTO 0) := (others => impl_fast);

        -- Selection of transmitter implementation.
        tx_impl : tximpl_array(numports DOWNTO 0) := (others => impl_fast)
    );
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Receiver sample clock (only for impl_fast).
        rxclk : IN STD_LOGIC;

        -- Transmit clock (only for impl_fast).
        txclk : IN STD_LOGIC;

        -- Router reset signal.
        rst : IN STD_LOGIC;

        -- Corresponding bit is High if the port is in started state.
        started : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Corresponding bit is High if the port is in connecting state.
        connecting : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Corresponding bit is High if the port is in running state.
        running : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- High if the corresponding port has a disconnect error.
        errdisc : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- High if the corresponding port has a parity error.
        errpar : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- High if the corresponding port detected an invalid escape sequence.
        erresc : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- High if the corresponding port detected a credit error.
        errcred : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Data In signals from SpaceWire bus.
        spw_di : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Strobe In signals from SpaceWire bus.
        spw_si : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Data Out signals from SpaceWire bus.
        spw_do : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Strobe Out signals from SpaceWire bus.
        spw_so : OUT STD_LOGIC_VECTOR(numports DOWNTO 0)
    );
END spwrouter;

ARCHITECTURE spwrouter_arch OF spwrouter IS
    PACKAGE function_pkg IS NEW work.spwrouterfunc
        GENERIC MAP(numports => numports); -- Import package with various functions.

        -- Necessary number of bits to represent numport-ports.
        CONSTANT blen : INTEGER RANGE 0 TO 5 := INTEGER(ceil(log2(real(numports))));

        SIGNAL iSelectDestinationPort : array_t(numports DOWNTO 0)(numports DOWNTO 0);
        SIGNAL iSwitchPortNumber : array_t(numports DOWNTO 0)(numports DOWNTO 0);

        SIGNAL requestOut : STD_LOGIC_VECTOR(numports DOWNTO 0);
        SIGNAL destinationPort : array_t(numports DOWNTO 0)(7 DOWNTO 0);
        SIGNAL sourcePortOut : array_t(numports DOWNTO 0)(blen DOWNTO 0);
        SIGNAL granted : STD_LOGIC_VECTOR(numports DOWNTO 0);
        SIGNAL iReadyIn : STD_LOGIC_VECTOR(numports DOWNTO 0);
        SIGNAL dataOut : array_t(numports DOWNTO 0)(8 DOWNTO 0);
        SIGNAL strobeOut : STD_LOGIC_VECTOR(numports DOWNTO 0);
        SIGNAL iRequestIn : STD_LOGIC_VECTOR(numports DOWNTO 0);

        SIGNAL iDataIn : array_t(numports DOWNTO 0)(8 DOWNTO 0);
        SIGNAL iStrobeIn : STD_LOGIC_VECTOR(numports DOWNTO 0);
        SIGNAL readyOut : STD_LOGIC_VECTOR(numports DOWNTO 0);

        SIGNAL routingSwitch : array_t(numports DOWNTO 0)(numports DOWNTO 0);

        SIGNAL routerTimeCode : STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- Bus System I.
        SIGNAL busMasterAddressOut : array_t(numports DOWNTO 0)(31 DOWNTO 0);
        SIGNAL busMasterDataOut : array_t(numports DOWNTO 0)(31 DOWNTO 0);
        SIGNAL busMasterByteEnableOut : array_t(numports DOWNTO 0)(3 DOWNTO 0);
        SIGNAL busMasterWriteEnableOut : STD_LOGIC_VECTOR(numports DOWNTO 0);
        SIGNAL busMasterRequestOut : STD_LOGIC_VECTOR(numports DOWNTO 0);
        SIGNAL busMasterGranted : STD_LOGIC_VECTOR(numports DOWNTO 0);
        SIGNAL busMasterAcknowledgeIn : STD_LOGIC_VECTOR(numports DOWNTO 0);
        SIGNAL busMasterStrobeOut : STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Bus System II.
        SIGNAL iBusSlaveCycleIn : STD_LOGIC;
        SIGNAL iBusSlaveStrobeIn : STD_LOGIC;
        SIGNAL iBusSlaveAddressIn : STD_LOGIC_VECTOR(31 DOWNTO 0);
        SIGNAL busSlaveDataOut : STD_LOGIC_VECTOR(31 DOWNTO 0);
        SIGNAL iBusSlaveDataIn : STD_LOGIC_VECTOR(31 DOWNTO 0);
        SIGNAL iBusSlaveAcknowledgeOut : STD_LOGIC;
        SIGNAL iBusSlaveWriteEnableIn : STD_LOGIC;
        SIGNAL iBusSlaveByteEnableIn : STD_LOGIC_VECTOR(3 DOWNTO 0);
        SIGNAL iBusSlaveOriginalPortIn : STD_LOGIC_VECTOR(7 DOWNTO 0);

        SIGNAL ibusMasterDataOut : STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- All ports that are in running state.
        SIGNAL iLinkUp : STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Time Codes.
        SIGNAL s_tick_from_tcc_to_ports : std_logic_vector(numports downto 0); -- High for one clock cycle if transmission of Time Code is requested
        signal s_tick_from_ports_to_tcc : std_logic_vector(numports downto 0); -- High for one clock cycle if Time Code was received
        signal s_tc_from_tcc_to_ports : array_t(numports downto 0)(7 downto 0); -- Time Code (control flag & counter value) of Time Code to sent
        signal s_tc_from_ports_to_tcc : array_t(numports downto 0)(7 downto 0); -- Time Code (control flag & coutner value) of received Time Code

        -- TimeCodes & Register.
        SIGNAL autoTimeCodeValue : STD_LOGIC_VECTOR(7 DOWNTO 0);
        SIGNAL autoTimeCodeCycleTime : STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- Eigene Signale
        SIGNAL s_running : STD_LOGIC_VECTOR(numports DOWNTO 0);
    BEGIN
        -- Drive outputs.
        running <= s_running;
        iLinkUp <= s_running;
        
        -- Crossbar Switch - Router Arbiter.
        arb : spwrouterarb
        GENERIC MAP(
            numports => numports,
            blen => blen
        )
        PORT MAP(
            clk => clk,
            rst => rst,
            destport => destinationPort,
            request => requestOut,
            granted => granted,
            routing_matrix => routingSwitch
        );

        -- The destination PortNo regarding to the source PortNo (creates transposed matrix of routingSwitch).
        rowloop : FOR i IN 0 TO numports GENERATE
            columnloop : FOR j IN 0 TO numports GENERATE
                iSelectDestinationPort(i)(j) <= routingSwitch(j)(i);
            END GENERATE columnloop;
        END GENERATE rowloop;

        -- The source to the destination PortNo PortNo.
        srcPort : FOR i IN 0 TO numports GENERATE
            iSwitchPortNumber(i) <= routingSwitch(i);
        END GENERATE srcPort;

        -- Routing process: Assigns information to ports from the routing process.
        spx : FOR i IN 0 TO numports GENERATE
            iReadyIn(i) <= function_pkg.select1(iSelectDestinationPort(i), readyOut);
            iRequestIn(i) <= function_pkg.select1(iSwitchPortNumber(i), requestOut);
            --iSourcePortIn(i) <= select7x1xVector8(iSwitchPortNumber(i), sourcePortOut); -- wohl nur für RMAP nötig
            iDataIn(i) <= function_pkg.select9(iSwitchPortNumber(i), dataOut);
            iStrobeIn(i) <= function_pkg.select1(iSwitchPortNumber(i), strobeOut);
        END GENERATE spx;
        -- SpaceWirePort LinkUP Signal. (dropped)

        -- Internal Configuration Port.
        port0 : spwrouterport
        GENERIC MAP(
            numports => numports,
            blen => blen,
            --pnum => 0,
            sysfreq => sysfreq,
            txclkfreq => txclkfreq,
            rximpl => rx_impl(0),
            tximpl => tx_impl(0)
            -- (Generics that are not listed here have default values !)
        )
        PORT MAP(
            clk => clk,
            rxclk => rxclk,
            txclk => txclk,
            rst => rst,
            autostart => '1',
            linkstart => '0',
            linkdis => '0',
            txdivcnt => "00000001",
            tick_in => s_tick_from_tcc_to_ports(0),--tick_in(0),
            time_in => s_tc_from_tcc_to_ports(0),--time_in(0),
            txdata => iDataIn(0),
            txhalff => open,
            tick_out => s_tick_from_ports_to_tcc(0),--tick_out(0),
            time_out => s_tc_from_ports_to_tcc(0),--time_out(0),
            txrdy => readyOut(0),
            rxhalff => open,
            rxdata => dataOut(0),
            started => started(0),
            connecting => connecting(0),
            running => s_running(0),
            errdisc => errdisc(0),
            errpar => errpar(0),
            erresc => erresc(0),
            errcred => errcred(0),
            spw_di => spw_di(0),
            spw_si => spw_si(0),
            spw_do => spw_do(0),
            spw_so => spw_so(0),            
            linkstatus => iLinkUp,
            request_in => iRequestIn(0),
            request_out => requestOut(0),
            destination_port => destinationPort(0),
            --sourcePortOut => sourcePortOut(0),
            arb_granted => granted(0),
            strobe_out => strobeOut(0),
            strobe_in => iStrobeIn(0),
            ready_in => iReadyIn(0),
            --readyOut => readyOut(0),
            bus_address => busMasterAddressOut(0),
            bus_data_in => busSlaveDataOut,
            --busMasterDataOut => busMasterDataOut(0),
            bus_dByte => busMasterByteEnableOut(0),
            bus_readwrite => busMasterWriteEnableOut(0),
            bus_strobe => busMasterStrobeOut(0),
            bus_request => busMasterRequestOut(0),
            bus_ack_in => busMasterAcknowledgeIn(0)
        );

        -- Other ports (numport-1)-ports.
        spwports : FOR i IN 1 TO numports GENERATE
            spwport : spwrouterport GENERIC MAP(
                numports => numports,
                blen => blen,
                --pnum => i,
                sysfreq => sysfreq,
                txclkfreq => txclkfreq,
                rximpl => rx_impl(i),
                tximpl => tx_impl(i)
                -- Generics that are not listed here have default values!
            )
            PORT MAP(
                clk => clk,
                rxclk => rxclk,
                txclk => txclk,
                rst => rst,
                autostart => '1', -- active autostart but none linkstart! Router is waiting for incoming connection attempt.
                linkstart => '0',
                linkdis => '0',
                txdivcnt => "00000001",
                tick_in => s_tick_from_tcc_to_ports(i),--tick_in(i),
                time_in => s_tc_from_tcc_to_ports(i),--time_in(i),
                txhalff => open,
                txdata => iDataIn(i),
                tick_out => s_tick_from_ports_to_tcc(i),--tick_out(i),
                time_out => s_tc_from_ports_to_tcc(i),--time_out(i),
                txrdy => readyOut(i),
                rxhalff => open,
                rxdata => dataOut(i),
                started => started(i),
                connecting => connecting(i),
                running => s_running(i),
                errdisc => errdisc(i),
                errpar => errpar(i),
                erresc => erresc(i),
                errcred => errcred(i),
                spw_di => spw_di(i),
                spw_si => spw_si(i),
                spw_do => spw_do(i),
                spw_so => spw_so(i),
                linkstatus => iLinkUp,
                request_out => requestOut(i),
                request_in => iRequestIn(i),
                destination_port => destinationPort(i),
                --sourcePortOut => sourcePortOut(i),
                arb_granted => granted(i),
                strobe_out => strobeOut(i),
                strobe_in => iStrobeIn(i),
                ready_in => iReadyIn(i),
                bus_address => busMasterAddressOut(i),
                bus_data_in => busSlaveDataOut,
                --busMasterDataOut => busMasterDataOut(i),
                bus_dByte => busMasterByteEnableOut(i),
                bus_readwrite => busMasterWriteEnableOut(i),
                bus_strobe => busMasterStrobeOut(i),
                bus_request => busMasterRequestOut(i),
                bus_ack_in => busMasterAcknowledgeIn(i)
            );
        END GENERATE;

        -- Router Link Control, Status Register and Routing Table
        routerControlRegister : spwrouterregs
        GENERIC MAP(
            numports => numports
        )
        PORT MAP(
            clk => clk,
            rst => rst,
            writeData => iBusSlaveDataIn,
            readData => ibusMasterDataOut,
            readwrite => iBusSlaveWriteEnableIn,
            dByte => iBusSlaveByteEnableIn,
            addr => iBusSlaveAddressIn,
            proc => iBusSlaveAcknowledgeOut,
            strobe => iBusSlaveStrobeIn,
            cycle => iBusSlaveCycleIn,
            portstatus => (OTHERS => (OTHERS => '0')), -- TODO!
            receiveTimeCode => routerTimeCode,
            autoTimeCodeValue => autoTimeCodeValue,
            autoTimeCodeCycleTime => autoTimeCodeCycleTime
        );

        -- Bus arbiter & Router table arbiter
        arb_table : spwrouterarb_table
        GENERIC MAP(
            numports => numports
        )
        PORT MAP(
            clk => clk,
            rst => rst,
            request => busMasterRequestOut,
            granted => busMasterGranted
        );

        -- Timing adjustment. BusSlaveAccessSelector
        PROCESS (clk)
        BEGIN
            IF rising_edge(clk) THEN

                iBusSlaveCycleIn <= OR busMasterRequestOut;
                -- Reversed priority conditioned through if-statements. (Erklärung noch hierzu!)
                FOR i IN numports DOWNTO 1 LOOP
                    IF (busMasterGranted(i) = '1') THEN
                        iBusSlaveStrobeIn <= busMasterStrobeOut(i);
                        iBusSlaveAddressIn <= busMasterAddressOut(i);
                        iBusSlaveByteEnableIn <= busMasterByteEnableOut(i);
                        iBusSlaveWriteEnableIn <= busMasterWriteEnableOut(i);
                        iBusSlaveOriginalPortIn <= x"ff";
                        iBusSlaveDataIn <= (OTHERS => '0');
                        busMasterAcknowledgeIn <= (i => iBusSlaveAcknowledgeOut, OTHERS => '0');
                    END IF;
                END LOOP;

                -- Port0 is special case so handling outside for loop
                IF (busMasterGranted(0) = '1') THEN
                    iBusSlaveStrobeIn <= busMasterStrobeOut(0);
                    iBusSlaveAddressIn <= busMasterAddressOut(0);
                    iBusSlaveByteEnableIn <= busMasterByteEnableOut(0);
                    iBusSlaveWriteEnableIn <= busMasterWriteEnableOut(0);
                    iBusSlaveDataIn <= busMasterDataOut(0);
                    busMasterAcknowledgeIn <= (0 => iBusSlaveAcknowledgeOut, OTHERS => '0');
                END IF;

                busSlaveDataOut <= ibusMasterDataOut;
            END IF;
        END PROCESS;
        
        -- Time Code Control.
        TimeCodeControl : spwroutertcc
        GENERIC MAP(
            numports => numports
        )
        PORT MAP(
            clk => clk,
            rst => rst,
            running => iLinkUp,
            tc_enable => (OTHERS => '1'), -- Time Codes are always activated on all available ports
            tc_last => routerTimeCode,            
            tick_out => s_tick_from_tcc_to_ports,--tick_out,
            tick_in => s_tick_from_ports_to_tcc,--tick_in,
            tc_out => s_tc_from_tcc_to_ports,--time_out,
            tc_in => s_tc_from_ports_to_tcc,--time_in,
            auto_tc_out => autoTimeCodeValue,
            auto_interval => autoTimeCodeCycleTime
        );
    END ARCHITECTURE spwrouter_arch;