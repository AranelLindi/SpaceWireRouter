----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 31.07.2021 12:53
-- Design Name: SpaceWire Router Top Module
-- Module Name: spwrouter
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: Top router entity.
--
-- Dependencies: spwstream (spwpkg), spwrouterpkg
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
        rx_impl : rximpl_array(numports DOWNTO 0) := (OTHERS => impl_fast);

        -- Selection of transmitter implementation.
        tx_impl : tximpl_array(numports DOWNTO 0) := (OTHERS => impl_fast)
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
    PACKAGE spwrouterfunc IS NEW work.spwrouterfunc
        GENERIC MAP(numports => numports); -- Import package with various functions.

        -- Necessary number of bits to represent numport-ports.
        CONSTANT blen : INTEGER RANGE 0 TO 5 := INTEGER(ceil(log2(real(numports))));

        -- Arbitration-specific signals.
        SIGNAL s_routing_matrix_transposed : array_t(numports DOWNTO 0)(numports DOWNTO 0); -- Transposed routing_matrix from arbiter.
        SIGNAL s_routing_matrix : array_t(numports DOWNTO 0)(numports DOWNTO 0); -- Routing switch matrix: Maps source ports (row) to target ports (column).
        SIGNAL s_source_port_row : array_t(numports DOWNTO 0)(numports DOWNTO 0); -- Copy of routing_matrix.
        SIGNAL s_request_out : STD_LOGIC_VECTOR(numports DOWNTO 0); -- requestOut -- High if a port transfers a packet.        
        SIGNAL s_destination_port : array_t(numports DOWNTO 0)(7 DOWNTO 0); -- destinationPort -- First byte of a packet (address byte) with destination port (both physical and logical addressing).
        --SIGNAL sourcePortOut : array_t(numports DOWNTO 0)(blen DOWNTO 0);
        SIGNAL s_granted : STD_LOGIC_VECTOR(numports DOWNTO 0); -- granted -- Contains ports that have granted access to the port that is specified in destport.

        -- Port-specific signals.
        SIGNAL s_ready_in : STD_LOGIC_VECTOR(numports DOWNTO 0); -- readyIn -- High if destination port is ready to accept next N-Char.
        SIGNAL s_rxdata : array_t(numports DOWNTO 0)(8 DOWNTO 0); -- dataOut -- Received byte and control flag.
        SIGNAL s_strobe_out : STD_LOGIC_VECTOR(numports DOWNTO 0); -- strobeOut -- High if data byte or EOP/EEP of one port is ready to transfer to destination port.
        SIGNAL s_request_in : STD_LOGIC_VECTOR(numports DOWNTO 0); -- requestIn -- High as long as a packet is sent via one port.
        SIGNAL s_txdata : array_t(numports DOWNTO 0)(8 DOWNTO 0); -- iDataIn -- Data byte and flag to transmit.
        SIGNAL s_strobe_in : STD_LOGIC_VECTOR(numports DOWNTO 0); -- strobeIn -- High if transmission via one port should be performed (new byte still on txdata).
        SIGNAL s_txrdy : STD_LOGIC_VECTOR(numports DOWNTO 0); -- readyOut -- High if port is ready to accept an N-Char for transmission FIFO.
        
        -- Time Code specific signals.
        SIGNAL s_tick_from_tcc_to_ports : STD_LOGIC_VECTOR(numports DOWNTO 0); -- High for one clock cycle if transmission of Time Code is requested
        SIGNAL s_tick_from_ports_to_tcc : STD_LOGIC_VECTOR(numports DOWNTO 0); -- High for one clock cycle if Time Code was received
        SIGNAL s_tc_from_tcc_to_ports : array_t(numports DOWNTO 0)(7 DOWNTO 0); -- Time Code (control flag & counter value) of Time Code to sent
        SIGNAL s_tc_from_ports_to_tcc : array_t(numports DOWNTO 0)(7 DOWNTO 0); -- Time Code (control flag & coutner value) of received Time Code
        -- TimeCodes & Register.
        SIGNAL s_auto_tc : STD_LOGIC_VECTOR(7 DOWNTO 0); -- autoTimeCodeValue
        SIGNAL s_auto_cycle : STD_LOGIC_VECTOR(31 DOWNTO 0); -- autoTimeCodeCycle
        SIGNAL s_last_tc : STD_LOGIC_VECTOR(7 DOWNTO 0); -- TODO: Noch nicht korrekt eingebunden, soll das zuletzt empfangene TC speichern.

        -- Bus System I. -- HIER WEITERMACHEN!
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



        -- Eigene Signale
        SIGNAL s_running : STD_LOGIC_VECTOR(numports DOWNTO 0);
    BEGIN
        -- Drive outputs.
        running <= s_running;
        iLinkUp <= s_running;

        -- Router arbiter (crossbar switch).
        roundrobin_arbiter : spwrouterarb
        GENERIC MAP(
            numports => numports,
            blen => blen
        )
        PORT MAP(
            clk => clk,
            rst => rst,
            destport => s_destination_port,
            request => s_request_out,
            granted => s_granted,
            routing_matrix => s_routing_matrix
        );

        -- Internal configuration port 0.
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
            txdivcnt => "00000001", -- via register
            tick_in => s_tick_from_tcc_to_ports(0), --tick_in(0),
            time_in => s_tc_from_tcc_to_ports(0), --time_in(0),
            txdata => s_txdata(0),
            txhalff => OPEN,
            tick_out => s_tick_from_ports_to_tcc(0), --tick_out(0),
            time_out => s_tc_from_ports_to_tcc(0), --time_out(0),
            txrdy => s_txrdy(0),
            rxhalff => OPEN,
            rxdata => s_rxdata(0),
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
            request_in => s_request_in(0),
            request_out => s_request_out(0),
            destination_port => s_destination_port(0),
            --sourcePortOut => sourcePortOut(0),
            arb_granted => s_granted(0),
            strobe_out => s_strobe_out(0),
            strobe_in => s_strobe_in(0),
            ready_in => s_ready_in(0),
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

        -- Remaining (normal) SpaceWire ports.
        ports : FOR i IN 1 TO numports GENERATE
            port_i : spwrouterport GENERIC MAP(
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
                txdivcnt => "00000001", -- via register
                tick_in => s_tick_from_tcc_to_ports(i), --tick_in(i),
                time_in => s_tc_from_tcc_to_ports(i), --time_in(i),
                txhalff => OPEN,
                txdata => s_txdata(i),
                tick_out => s_tick_from_ports_to_tcc(i), --tick_out(i),
                time_out => s_tc_from_ports_to_tcc(i), --time_out(i),
                txrdy => s_txrdy(i),
                rxhalff => OPEN,
                rxdata => s_rxdata(i),
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
                request_out => s_request_out(i),
                request_in => s_request_in(i),
                destination_port => s_destination_port(i),
                --sourcePortOut => sourcePortOut(i),
                arb_granted => s_granted(i),
                strobe_out => s_strobe_out(i),
                strobe_in => s_strobe_in(i),
                ready_in => s_ready_in(i),
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

        -- Contains router link control, port status register and routing table.
        Reg : spwrouterregs
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
            receiveTimeCode => s_last_tc,
            autoTimeCodeValue => s_auto_tc,
            autoTimeCodeCycleTime => s_auto_cycle
        );

        -- Bus arbiter & routing table arbiter
        internalbus_routingtable_arbiter : spwrouterarb_table
        GENERIC MAP(
            numports => numports
        )
        PORT MAP(
            clk => clk,
            rst => rst,
            request => busMasterRequestOut,
            granted => busMasterGranted
        );

        -- Time code control.
        timecode_control : spwroutertcc
        GENERIC MAP(
            numports => numports
        )
        PORT MAP(
            clk => clk,
            rst => rst,
            running => iLinkUp,
            tc_enable => (OTHERS => '1'), -- Time Codes are always activated on all available ports
            tc_last => s_last_tc,
            tick_out => s_tick_from_tcc_to_ports, --tick_out,
            tick_in => s_tick_from_ports_to_tcc, --tick_in,
            tc_out => s_tc_from_tcc_to_ports, --time_out,
            tc_in => s_tc_from_ports_to_tcc, --time_in,
            auto_tc_out => s_auto_tc,
            auto_interval => s_auto_cycle
        );

        -- Creates transposed matrix of s_routing_matrix: Shows for every port (row) which port (column) requests access to it.
        routing_matrix_row : FOR i IN 0 TO numports GENERATE
            routing_matrix_column : FOR j IN 0 TO numports GENERATE
                s_routing_matrix_transposed(i)(j) <= s_routing_matrix(j)(i);
            END GENERATE routing_matrix_column;
        END GENERATE routing_matrix_row;

        -- Stores every row of s_routing_matrix which maps source ports (row) to destination ports (column)
        source_port_rows : FOR i IN 0 TO numports GENERATE
            s_source_port_row(i) <= s_routing_matrix(i);
        END GENERATE source_port_rows;

        -- Routing process: Assigns information to ports from the routing process.
        spx : FOR i IN 0 TO numports GENERATE
            s_ready_in(i) <= spwrouterfunc.select_port(s_routing_matrix_transposed(i), s_txrdy);
            s_request_in(i) <= spwrouterfunc.select_port(s_source_port_row(i), s_request_out);
            --iSourcePortIn(i) <= select7x1xVector8(s_source_port_row(i), sourcePortOut); -- wohl nur für RMAP nötig
            s_txdata(i) <= spwrouterfunc.select_nchar(s_source_port_row(i), s_rxdata);
            s_strobe_in(i) <= spwrouterfunc.select_port(s_source_port_row(i), s_strobe_out);
        END GENERATE spx;
        -- SpaceWirePort LinkUP Signal. (dropped)

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

                -- Port0 is special case so handling outside of for-loop.
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
    END ARCHITECTURE spwrouter_arch;