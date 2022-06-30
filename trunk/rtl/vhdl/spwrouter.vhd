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
        numports : INTEGER RANGE 0 TO 31;

        -- System clock frequency in Hz.
        sysfreq : real;

        -- txclk frequency in Hz (if tximpl = impl_fast)
        txclkfreq : real;

        -- Selection of receiver front-end implementation.
        rx_impl : rximpl_array(numports DOWNTO 0);-- := (OTHERS => impl_fast);

        -- Selection of transmitter implementation.
        tx_impl : tximpl_array(numports DOWNTO 0)-- := (OTHERS => impl_fast)
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

        -- ====================================
        -- General constants and signals.
        -- ====================================
        CONSTANT blen : INTEGER RANGE 0 TO 5 := INTEGER(ceil(log2(real(numports)))); -- Necessary number of bits to represent numport-ports


        -- ====================================
        -- TIME CODES (Bus I)
        -- ====================================

        -- Time Code specific signals.
        -- Time codes are forwareded via a separate bus and always have hightest priority.
        SIGNAL s_tick_from_tcc_to_ports : STD_LOGIC_VECTOR(numports DOWNTO 0); -- High for one clock cycle if transmission of Time Code is requested
        SIGNAL s_tick_from_ports_to_tcc : STD_LOGIC_VECTOR(numports DOWNTO 0); -- High for one clock cycle if Time Code was received
        SIGNAL s_tc_from_tcc_to_ports : array_t(numports DOWNTO 0)(7 DOWNTO 0); -- Time Code (control flag & counter value) of Time Code to sent
        SIGNAL s_tc_from_ports_to_tcc : array_t(numports DOWNTO 0)(7 DOWNTO 0); -- Time Code (control flag & coutner value) of received Time Code

        -- TimeCodes & Register.
        SIGNAL s_auto_tc : STD_LOGIC_VECTOR(7 DOWNTO 0); -- autoTimeCodeValue
        SIGNAL s_auto_cycle : STD_LOGIC_VECTOR(31 DOWNTO 0); -- autoTimeCodeCycle
        SIGNAL s_last_tc : STD_LOGIC_VECTOR(7 DOWNTO 0); -- TODO: Noch nicht korrekt eingebunden, soll das zuletzt empfangene TC speichern.


        -- ====================================
        -- ARBITRATION (physical addressing, Bus II)
        -- ====================================

        -- Arbitration-specific signals (spwrouterarb).
        SIGNAL s_routing_matrix_transposed : array_t(numports DOWNTO 0)(numports DOWNTO 0); -- Transposed routing_matrix from arbiter.
        SIGNAL s_routing_matrix : array_t(numports DOWNTO 0)(numports DOWNTO 0); -- Routing switch matrix: Maps source ports (row) to target ports (column).
        SIGNAL s_source_port_row : array_t(numports DOWNTO 0)(numports DOWNTO 0); -- Copy of routing_matrix.
        SIGNAL s_request_out : STD_LOGIC_VECTOR(numports DOWNTO 0); -- requestOut -- High if a port transfers a packet.        
        SIGNAL s_destination_port : array_t(numports DOWNTO 0)(7 DOWNTO 0); -- destinationPort -- First byte of a packet (address byte) with destination port (both physical and logical addressing).
        --SIGNAL sourcePortOut : array_t(numports DOWNTO 0)(blen DOWNTO 0);
        SIGNAL s_granted : STD_LOGIC_VECTOR(numports DOWNTO 0); -- granted -- Contains ports that have granted access to the port that is specified in destport.
        -- SPACEWIRE PORTS
        -- Port-specific signals (physical addressing only !).
        -- Pysical addressing is controlled using a crossbar and a round robin arbiter. Acess to routing table is not necessary,
        -- this type of addressing is processed faster than logical adressing.
        SIGNAL s_ready_in : STD_LOGIC_VECTOR(numports DOWNTO 0); -- readyIn -- High if destination port is ready to accept next N-Char.
        SIGNAL s_rxdata : array_t(numports DOWNTO 0)(8 DOWNTO 0); -- dataOut -- Received byte and control flag.
        SIGNAL s_strobe_out : STD_LOGIC_VECTOR(numports DOWNTO 0); -- strobeOut -- High if data byte or EOP/EEP of one port is ready to transfer to destination port.
        SIGNAL s_request_in : STD_LOGIC_VECTOR(numports DOWNTO 0); -- requestIn -- High as long as a packet is sent via one port.
        SIGNAL s_txdata : array_t(numports DOWNTO 0)(8 DOWNTO 0); -- iDataIn -- Data byte and flag to transmit.
        SIGNAL s_strobe_in : STD_LOGIC_VECTOR(numports DOWNTO 0); -- strobeIn -- High if transmission via one port should be performed (new byte still on txdata).
        SIGNAL s_txrdy : STD_LOGIC_VECTOR(numports DOWNTO 0); -- readyOut -- High if port is ready to accept an N-Char for transmission FIFO.

        SIGNAL s_running : STD_LOGIC_VECTOR(numports DOWNTO 0); -- Contains running-state of every port


        -- ====================================
        -- INTERNAL BUS (logical addressing & register, Bus III)
        -- ====================================

        -- Master (m) bus signals.
        -- Each port acts as a master. An internal arbiter controls access to registers and routing table (logical addressing only !)
        SIGNAL s_bus_m_address : array_t(numports DOWNTO 0)(31 DOWNTO 0); -- busMasterAddressOut -- Contains register destination address (routing table only) for each port
        SIGNAL s_bus_m_data : array_t(numports DOWNTO 0)(31 DOWNTO 0); -- busMasterDataOut -- Contains data word to be written into register for each port (currently unused)
        SIGNAL s_bus_m_dByte : array_t(numports DOWNTO 0)(3 DOWNTO 0); -- busMasterByteEnableOut -- Determines for each port which byte (1-4) is to be written into register or read from it
        SIGNAL s_bus_m_readwrite : STD_LOGIC_VECTOR(numports DOWNTO 0); -- busMasterWriteEnableOut -- Determines for each port whether a read (0) or write (1) operation into register should be performed
        SIGNAL s_bus_m_request : STD_LOGIC_VECTOR(numports DOWNTO 0); -- busMasterRequestOut -- Contains for each port whether there is a request to access routing table
        SIGNAL s_bus_m_granted : STD_LOGIC_VECTOR(numports DOWNTO 0); -- busMasterGranted -- Contains for each port whether desired access to routing table is granted
        SIGNAL s_bus_m_ack : STD_LOGIC_VECTOR(numports DOWNTO 0); -- busMasterAcknowledgeIn -- Contains for each port whether there is an acknowledgement of register for its operation
        SIGNAL s_bus_m_strobe : STD_LOGIC_VECTOR(numports DOWNTO 0); -- busMasterStrobeOut -- Contains strobe signal for each port related to register access/routing table

        -- Slave (s) bus signals.
        -- The access_control process controls which master (port) has received access to internal bus from round robin arbiter and is allowed
        -- to take control of the slave. The slave takes over communication with register and/or routing table.
        SIGNAL s_bus_s_address : STD_LOGIC_VECTOR(31 DOWNTO 0); -- iBusSlaveAddressIn -- Copy of allowed port destination address (s_bus_m_address)
        SIGNAL s_bus_s_request : STD_LOGIC; -- iBusSlaveCycleIn -- High if access to internal bus is required from a port, otherwise low
        SIGNAL s_bus_s_strobe : STD_LOGIC; -- iBusSlaveStrobeIn -- High if a port performs an operation in register/routing table, otherwise low

        SIGNAL s_bus_s_register_data_out : STD_LOGIC_VECTOR(31 DOWNTO 0); -- busSlaveDataOut -- Contains data word from data_out_buffer
        SIGNAL s_register_data_out_buffer : STD_LOGIC_VECTOR(31 DOWNTO 0); -- ibusMasterDataOut -- Word taken from routing table (register) with current address of granted port
        SIGNAL s_bus_s_register_data_in : STD_LOGIC_VECTOR(31 DOWNTO 0); -- iBusSlaveDataIn -- Data word to write into register of current granted port
        SIGNAL s_bus_s_ack : STD_LOGIC; -- iBusSlaveAcknowledgeOut -- Contains acknowledgment from register (mapping to port is done in access_control)
        SIGNAL s_bus_s_readwrite : STD_LOGIC; -- iBusSlaveWriteEnableIn -- Contains which kind of operation shall be performed in register
        SIGNAL s_bus_s_dByte : STD_LOGIC_VECTOR(3 DOWNTO 0); -- iBusSlaveByteEnableIn -- Determines which byte (1-4) of data word in register should be read or overwritten

        SIGNAL iBusSlaveOriginalPortIn : STD_LOGIC_VECTOR(7 DOWNTO 0); -- iBusSlaveOriginalPortIn -- diesen Port mal noch dort lassen, wird in aktueller Version nicht verwendet, ist aber nützlich um Registerzugriff neu zu regeln
    BEGIN
        -- Drive outputs.
        running <= s_running;
        --        iLinkUp <= s_running;

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
        --        port0 : spwrouterport
        --        GENERIC MAP(
        --            numports => numports,
        --            blen => blen,
        --            --pnum => 0,
        --            sysfreq => sysfreq,
        --            txclkfreq => txclkfreq,
        --            rximpl => rx_impl(0),
        --            tximpl => tx_impl(0)
        --            -- (Generics that are not listed here have default values !)
        --        )
        --        PORT MAP(
        --            clk => clk,
        --            rxclk => rxclk,
        --            txclk => txclk,
        --            rst => rst,
        --            autostart => '1',
        --            linkstart => '0',
        --            linkdis => '0',
        --            txdivcnt => "00000001", -- via register
        --            tick_in => s_tick_from_tcc_to_ports(0), --tick_in(0),
        --            time_in => s_tc_from_tcc_to_ports(0), --time_in(0),
        --            txdata => s_txdata(0),
        --            txhalff => OPEN,
        --            tick_out => s_tick_from_ports_to_tcc(0), --tick_out(0),
        --            time_out => s_tc_from_ports_to_tcc(0), --time_out(0),
        --            txrdy => s_txrdy(0),
        --            rxhalff => OPEN,
        --            rxdata => s_rxdata(0),
        --            started => started(0),
        --            connecting => connecting(0),
        --            running => s_running(0),
        --            errdisc => errdisc(0),
        --            errpar => errpar(0),
        --            erresc => erresc(0),
        --            errcred => errcred(0),
        --            spw_di => spw_di(0),
        --            spw_si => spw_si(0),
        --            spw_do => spw_do(0),
        --            spw_so => spw_so(0),
        --            linkstatus => s_running, --iLinkUp,
        --            request_in => s_request_in(0),
        --            request_out => s_request_out(0),
        --            destination_port => s_destination_port(0),
        --            --sourcePortOut => sourcePortOut(0),
        --            arb_granted => s_granted(0),
        --            strobe_out => s_strobe_out(0),
        --            strobe_in => s_strobe_in(0),
        --            ready_in => s_ready_in(0),
        --            --readyOut => readyOut(0),
        --            bus_address => s_bus_m_address(0),
        --            bus_data_in => s_bus_s_register_data_out,
        --            --bus_data_out => s_bus_m_data(0),
        --            bus_dByte => s_bus_m_dByte(0),
        --            bus_readwrite => s_bus_m_readwrite(0),
        --            bus_strobe => s_bus_m_strobe(0),
        --            bus_request => s_bus_m_request(0),
        --            bus_ack_in => s_bus_m_ack(0)
        --        );

        -- Remaining (normal) SpaceWire ports.
        ports : FOR i IN 0 TO numports GENERATE
            port_i : spwrouterport GENERIC MAP(
                numports => numports,
                blen => blen,
                --pnum => i,
                sysfreq => sysfreq,
                txclkfreq => txclkfreq,
                rximpl => rx_impl(i),
                tximpl => tx_impl(i)
                -- (Generics that are not listed here have default values !)
            )
            PORT MAP(
                -- SpaceWire IO:
                clk => clk, -- I
                rxclk => rxclk, -- I
                txclk => txclk, -- I
                rst => rst, -- I
                autostart => '1', -- I -- active autostart but none linkstart! Router is waiting for incoming connection attempt.
                linkstart => '0', -- I
                linkdis => '0', -- I
                txdivcnt => "00000001", -- I -- via register
                tick_in => s_tick_from_tcc_to_ports(i), -- I --tick_in(i),
                time_in => s_tc_from_tcc_to_ports(i), -- I --time_in(i),
                txhalff => OPEN, -- O
                txdata => s_txdata(i), -- I
                tick_out => s_tick_from_ports_to_tcc(i), -- O --tick_out(i),
                time_out => s_tc_from_ports_to_tcc(i), -- O --time_out(i),
                txrdy => s_txrdy(i), -- O
                rxhalff => OPEN, -- O
                rxdata => s_rxdata(i), -- O
                started => started(i), -- O
                connecting => connecting(i), -- O
                running => s_running(i), -- O
                errdisc => errdisc(i), -- O
                errpar => errpar(i), -- O
                erresc => erresc(i), -- O
                errcred => errcred(i), -- O
                spw_di => spw_di(i), -- I
                spw_si => spw_si(i), -- I
                spw_do => spw_do(i), -- O
                spw_so => spw_so(i), -- O
                -- Router IO:
                linkstatus => s_running, -- I --iLinkUp,
                request_out => s_request_out(i), -- O
                request_in => s_request_in(i), -- I
                destination_port => s_destination_port(i),
                --sourcePortOut => sourcePortOut(i),
                arb_granted => s_granted(i), -- I
                strobe_out => s_strobe_out(i), -- O
                strobe_in => s_strobe_in(i), -- I
                ready_in => s_ready_in(i), -- I
                -- Internal Bus IO:
                bus_address => s_bus_m_address(i), -- O
                bus_data_in => s_bus_s_register_data_out, -- I
                --bus_data_out => s_bus_m_data(i),
                bus_dByte => s_bus_m_dByte(i), -- O
                bus_readwrite => s_bus_m_readwrite(i), -- O
                bus_strobe => s_bus_m_strobe(i), -- O
                bus_request => s_bus_m_request(i), -- O
                bus_ack_in => s_bus_m_ack(i) -- I
            );
        END GENERATE ports;

        -- Contains router link control, port status register and routing table.
        Reg : spwrouterregs
        GENERIC MAP(
            numports => numports
        )
        PORT MAP(
            clk => clk, -- I
            rst => rst, -- I
            writeData => s_bus_s_register_data_in, -- I
            readData => s_register_data_out_buffer, -- O
            readwrite => s_bus_s_readwrite, -- I
            dByte => s_bus_s_dByte, -- I
            addr => s_bus_s_address, -- I
            proc => s_bus_s_ack, -- O
            strobe => s_bus_s_strobe, -- I
            cycle => s_bus_s_request, -- I
            portstatus => (OTHERS => (OTHERS => '0')), -- I -- TODO!
            receiveTimeCode => s_last_tc, -- I
            autoTimeCodeValue => s_auto_tc, -- I
            autoTimeCodeCycleTime => s_auto_cycle -- O
        );

        -- Bus arbiter & routing table arbiter
        internalbus_arbiter : spwrouterarb_table
        GENERIC MAP(
            numports => numports
        )
        PORT MAP(
            clk => clk, -- I
            rst => rst, -- I
            request => s_bus_m_request, -- I
            granted => s_bus_m_granted -- O
        );

        -- Time code control.
        timecode_control : spwroutertcc
        GENERIC MAP(
            numports => numports
        )
        PORT MAP(
            clk => clk,
            rst => rst,
            running => s_running, -- iLinkUp,
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
        crossbar : FOR i IN 0 TO numports GENERATE
            s_ready_in(i) <= spwrouterfunc.select_port(s_routing_matrix_transposed(i), s_txrdy);
            s_request_in(i) <= spwrouterfunc.select_port(s_source_port_row(i), s_request_out);
            --iSourcePortIn(i) <= select7x1xVector8(s_source_port_row(i), sourcePortOut); -- wohl nur für RMAP nötig
            s_txdata(i) <= spwrouterfunc.select_nchar(s_source_port_row(i), s_rxdata);
            s_strobe_in(i) <= spwrouterfunc.select_port(s_source_port_row(i), s_strobe_out);
        END GENERATE crossbar;
        -- SpaceWirePort LinkUP Signal. (dropped)

        -- Controls which master gets access to bus.
        access_control : PROCESS (clk)
        BEGIN
            IF rising_edge(clk) THEN
                s_bus_s_request <= OR s_bus_m_request;
                s_bus_s_register_data_out <= s_register_data_out_buffer;

                -- Caution ! Reversed priority conditioned through if-statements !
                -- For loop first rolls out numports, last 0. Since no if..elsif statements
                -- can be generated via GENERATE-keyword, the block hat to be translated into
                -- independent if statements. The order is reversed because of the changed 
                -- priority: previously, first if statement had highes priority (the first
                -- elsif, etc.). Now hightest priority must be at the end in order to be able
                -- to overwrite a previously made decision.
                FOR i IN numports DOWNTO 0 LOOP
                    IF (s_bus_m_granted(i) = '1') THEN
                        s_bus_s_strobe <= s_bus_m_strobe(i);
                        s_bus_s_address <= s_bus_m_address(i);
                        s_bus_s_dByte <= s_bus_m_dByte(i);
                        s_bus_s_readwrite <= s_bus_m_readwrite(i);
                        --iBusSlaveOriginalPortIn <= x"ff"; -- Zeile macht aktuell noch keinen Sinn
                        s_bus_s_register_data_in <= s_bus_m_data(i); --(OTHERS => '0');
                        s_bus_m_ack <= (i => s_bus_s_ack, OTHERS => '0');
                    END IF;
                END LOOP;

                -- Port0 is special case so handling outside of for-loop. -- No, it is not anymore.
                --                IF (s_bus_m_granted(0) = '1') THEN
                --                    s_bus_s_strobe <= s_bus_m_strobe(0);
                --                    s_bus_s_address <= s_bus_m_address(0);
                --                    s_bus_s_dByte <= s_bus_m_dByte(0);
                --                    s_bus_s_readwrite <= s_bus_m_readwrite(0);
                --                    s_bus_s_register_data_in <= s_bus_m_data(0);
                --                    s_bus_m_ack <= (0 => s_bus_s_ack, OTHERS => '0');
                --                END IF;
            END IF;
        END PROCESS access_control;
    END ARCHITECTURE spwrouter_arch;