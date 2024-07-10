----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 31.07.2021 12:53
-- Design Name: SpaceWire Router - Top Module
-- Module Name: spwrouter
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA
-- Target Devices: Xilinx FPGAs
-- Tool Versions: -/-
-- Description: Top router entity.
--
-- Dependencies: spwpkg (spwstream), spwrouterpkg
-- 
-- Revision:
--
-- CAUTION ! For development reasons, default value of 'linkstart' was set to HIGH
-- for all ports. So every port will start connection attempts by themself which 
-- makes testing a lot easier. 
-- In release version, 'linkstart' MUST set to LOW again (standard
-- register value) ! (Will be changeable through registers or Link Interface)
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
        numports : INTEGER RANGE 1 TO 32;

        -- System clock frequency in Hz.
        sysfreq : real;

        -- txclk frequency in Hz (if tximpl = impl_fast)
        txclkfreq : real;

        -- True if extended register and Port A shall be used, False if original register is sufficient.
        externPort : BOOLEAN := True;

        -- Selection of receiver front-end implementation.
        rx_impl : rximpl_array((numports - 1) DOWNTO 0);-- := (OTHERS => impl_fast);
        
        rxchunk : integer range 1 to 4 := 1;

        -- Selection of transmitter implementation.
        tx_impl : tximpl_array((numports - 1) DOWNTO 0)-- := (OTHERS => impl_fast)
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
        started : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- Corresponding bit is High if the port is in connecting state.
        connecting : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- Corresponding bit is High if the port is in running state.
        running : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- High if the corresponding port has a disconnect error.
        errdisc : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- High if the corresponding port has a parity error.
        errpar : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- High if the corresponding port detected an invalid escape sequence.
        erresc : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- High if the corresponding port detected a credit error.
        errcred : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- Data In signals from SpaceWire bus.
        spw_di : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- Strobe In signals from SpaceWire bus.
        spw_si : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- Data Out signals from SpaceWire bus.
        spw_do : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- Strobe Out signals from SpaceWire bus.
        spw_so : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
        
        -- Interrupt signals.
        -- Bus clock. Necessary for resetting the status_intr signals.
        clk_intr : in std_logic;
        
        -- Status interrupt signal. Is assigned if the connection state of a port changes.
        status_intr : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- PORTA (extern port for CPU access, if externPort = TRUE it must be implemented
        -- to intialize memory, for externPort = FALSE the port has no meaning)
        -- Clock of port A.
        clka : IN STD_LOGIC := '0';

        -- Addresses the memory spaces for port A. Read and write operations.
        addra : IN STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');

        -- Data input to be written into the memory through port A.
        dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');

        -- Data output from read operations through port A.
        douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- Enables read, write and reset operations through port A.
        ena : IN STD_LOGIC := '0';

        -- Resets the port A memory output latch or output register
        rsta : IN STD_LOGIC := '0';

        -- Enables write operations through port A.
        wea : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0')
    );
END spwrouter;

ARCHITECTURE spwrouter_arch OF spwrouter IS
    PACKAGE spwrouterfunc IS NEW work.spwrouterfunc
        GENERIC MAP(numports => numports); -- Import package with various functions.

    -- ====================================
    -- General constants and signals.
    -- ====================================
    CONSTANT blen : INTEGER RANGE 0 TO 5 := INTEGER(ceil(log2(real((numports - 1))))); -- Necessary number of bits to represent [numport]-ports
    CONSTANT intr_stretch_length : POSITIVE := 9; -- Necessary to stretch an interrupt signal otherwise the Generic Interrupt Controller would not recognise it

    -- ====================================
    -- TIME CODES (Bus I)
    -- ====================================

    -- Time Code specific signals.
    -- Time Codes are routed via separate bus and have highest priority.
    SIGNAL s_tick_from_tcc_to_ports : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- High for one clock cycle if transmission of Time Code is requested
    SIGNAL s_tick_from_ports_to_tcc : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- High for one clock cycle if Time Code was received
    SIGNAL s_tc_from_tcc_to_ports : array_t((numports - 1) DOWNTO 0)(7 DOWNTO 0); -- Time Code (control flag & counter value) of Time Code to sent
    SIGNAL s_tc_from_ports_to_tcc : array_t((numports - 1) DOWNTO 0)(7 DOWNTO 0); -- Time Code (control flag & coutner value) of received Time Code

    -- Time Codes & Register.
    SIGNAL s_auto_tc : STD_LOGIC_VECTOR(7 DOWNTO 0); -- Contains last automatically generated Time Code
    SIGNAL s_auto_cycle : STD_LOGIC_VECTOR(31 DOWNTO 0); -- Time period for automatically Time Code generation
    SIGNAL s_last_tc : STD_LOGIC_VECTOR(7 DOWNTO 0); -- Contains last received (valid) Time Code -- TODO: Noch nicht korrekt eingebunden, soll das zuletzt empfangene TC speichern


    -- ====================================
    -- ARBITRATION (physical addressing, Bus II)
    -- ====================================

    -- Arbitration-specific signals (spwrouterarb).
    SIGNAL s_routing_matrix_transposed : array_t((numports - 1) DOWNTO 0)((numports - 1) DOWNTO 0); -- Transposed routing_matrix from arbiter
    SIGNAL s_routing_matrix : array_t((numports - 1) DOWNTO 0)((numports - 1) DOWNTO 0); -- Routing switch matrix: Maps source ports (row) to target ports (column)
    SIGNAL s_source_port_row : array_t((numports - 1) DOWNTO 0)((numports - 1) DOWNTO 0); -- Copy of routing_matrix for easier further processing
    SIGNAL s_request_out : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- High for any port currently transferring data
    SIGNAL s_destination_ports : array_t((numports - 1) DOWNTO 0)((numports - 1) DOWNTO 0); -- First byte of packet (address byte) with destination port (both physical and logical addressing (after mapping to physical port))
    SIGNAL s_granted : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- Contains ports that have granted access to port that is specified in destport

    -- SpaceWire-port-specific signals (spwrouterport).
    SIGNAL s_ready_in : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- High if destination port is ready to accept next N-Char
    SIGNAL s_rxdata : array_t((numports - 1) DOWNTO 0)(8 DOWNTO 0); -- Received byte (7 downto 0) and control flag (8)
    SIGNAL s_strobe_out : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- High if data byte or EOP/EEP of one port is ready to transfer to destination port
    SIGNAL s_request_in : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- High as long as a packet is sent via any port
    SIGNAL s_txdata : array_t((numports - 1) DOWNTO 0)(8 DOWNTO 0); -- Data byte and flag to transmit
    SIGNAL s_strobe_in : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- High if transmission via one port should be performed (new byte still on txdata)
    SIGNAL s_txrdy : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- High if port is ready to accept an N-Char for transmission FIFO
    SIGNAL s_running : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- High if any port is in running-state
    

    -- ====================================
    -- INTERNAL BUS (logical addressing & register, Bus III)
    -- ====================================

    -- Master (m) bus signals.
    -- Each port acts as a master. An internal arbiter controls access to registers and routing table (logical addressing only !).
    SIGNAL s_bus_m_address : array_t((numports - 1) DOWNTO 0)(31 DOWNTO 0); -- Contains register destination address (routing table only) for each port
    SIGNAL s_bus_m_data : array_t((numports - 1) DOWNTO 0)(31 DOWNTO 0); -- Contains data word to be written into register for each port (currently unused !)
    SIGNAL s_bus_m_dByte : array_t((numports - 1) DOWNTO 0)(3 DOWNTO 0); -- Determines for each port which byte (1-4) is to be written into register or read from it
    SIGNAL s_bus_m_readwrite : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- Determines for each port whether a read (0) or write (1) operation into register should be performed
    SIGNAL s_bus_m_request : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- Contains for each port whether there is a request to access routing table
    SIGNAL s_bus_m_granted : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- Contains for each port whether requested access to routing table is granted
    SIGNAL s_bus_m_ack : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- Contains for each port whether there is an acknowledgement of register for its operation
    SIGNAL s_bus_m_strobe : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- Contains strobe signal for each port related to register access/routing table

    -- Slave (s) bus signals.
    -- The access_control-process controls which master (port) has granted access to internal bus from round robin arbiter and is allowed
    -- to take control of the slave. The slave takes over communication with register and/or routing table.
    SIGNAL s_bus_s_address : STD_LOGIC_VECTOR(31 DOWNTO 0); -- Copy of allowed port destination address (s_bus_m_address)
    SIGNAL s_bus_s_request : STD_LOGIC; -- High if access to internal bus is required from any port
    SIGNAL s_bus_s_strobe : STD_LOGIC; -- High if any port performs an operation in register/routing table

    SIGNAL s_bus_s_register_data_out : STD_LOGIC_VECTOR(31 DOWNTO 0); -- Contains data word from data_out_buffer
    SIGNAL s_register_data_out_buffer : STD_LOGIC_VECTOR(31 DOWNTO 0); -- Word taken from routing table (register) with current address of granted port
    SIGNAL s_bus_s_register_data_in : STD_LOGIC_VECTOR(31 DOWNTO 0); -- Data word to write into register of current granted port
    SIGNAL s_bus_s_ack : STD_LOGIC; -- Contains acknowledgment from register (mapping to port is done in access_control)
    SIGNAL s_bus_s_readwrite : STD_LOGIC; -- Contains which kind of operation shall be performed in register (0 : read, 1 : write)
    SIGNAL s_bus_s_dByte : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Determines which byte (1-4) of data word in register should be read or overwritten
    --SIGNAL iBusSlaveOriginalPortIn : STD_LOGIC_VECTOR(7 DOWNTO 0); -- TODO: diesen Port mal noch dort lassen, wird in aktueller Version nicht verwendet, ist aber nützlich um Registerzugriff neu zu regeln


    -- ====================================
    -- CONTROLE & STATE (port information bus, Bus IV)
    -- ====================================        
    SIGNAL s_watchcycle : STD_LOGIC_VECTOR(31 DOWNTO 0); -- Contains watchdog time period to break up an inactive wormhole connection
    SIGNAL s_portstatus : array_t((numports - 1) DOWNTO 0)(31 DOWNTO 0); -- Contains status of each port
    SIGNAL s_portcontrol : array_t((numports - 1) DOWNTO 0)(31 DOWNTO 0); -- Contains control information for each port 
    SIGNAL s_timecode_en : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- Contains time code enable flag for each port
    

    -- ====================================
    -- INTERRUPTS (STATUS & ERRORS)
    -- ====================================
    -- 1. State interrupt.
    -- Signal to reset pulse.
    SIGNAL s_rst_pulse_state : std_logic_vector((numports - 1) DOWNTO 0) := (OTHERS => '0');
    -- Shiftregister to stretch pulse.
    signal s_pulse_reg_state : array_t((numports - 1) DOWNTO 0)((intr_stretch_length - 1) downto 0) := (OTHERS => (OTHERS => '0'));
    -- Actual pulse transport signal.
    signal s_pulse_state : std_logic_vector((numports - 1) DOWNTO 0) := (OTHERS => '0');
    -- Data signal
    signal s_state : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
    
    -- 2. Error interrupt.
    -- Signal to reset pulse.
    signal s_rst_pulse_error : std_logic_vector((numports - 1) downto 0) := (OTHERS => '0');
    -- Shiftregister to stretch pulse.
    signal s_pulse_reg_error : array_t((numports - 1) downto 0)((intr_stretch_length - 1) downto 0) := (OTHERS => (OTHERS => '0'));
    -- Actual pulse transport signal.
    signal s_pulse_error : std_logic_vector((numports - 1) downto 0) := (OTHERS => '0');
    -- Data signal.
    signal s_error : std_logic_vector((numports - 1) downto 0);
BEGIN
    -- Drive outputs.
    running <= s_running;

    -- Router arbiter (crossbar switch).
    roundrobin_arbiter : spwrouterarb
    GENERIC MAP(
        numports => numports,
        blen => blen
    )
    PORT MAP(
        clk => clk,
        rst => rst,
        destport => s_destination_ports,
        request => s_request_out,
        granted => s_granted,
        routing_matrix => s_routing_matrix
    );


    -- ((numports-1))-SpaceWire ports.
    -- Determine which type of register is to synthesize and how to initialize all ports depending on that (default value (immutable) or register initialization (port control, see manual p. 3))
    spw_port_config : IF externPort = TRUE GENERATE
        spw_ports : FOR i IN 0 TO (numports - 1) GENERATE
            spw_port : spwrouterport GENERIC MAP(
                numports => numports,
                blen => blen,
                sysfreq => sysfreq,
                txclkfreq => txclkfreq,
                rximpl => rx_impl(i),
                rxchunk => rxchunk,
                tximpl => tx_impl(i)
                -- (Generics that are not listed here have default values !)
            )
            PORT MAP(
                -- SpaceWire (spwstream) IO:
                clk => clk, -- I
                rxclk => rxclk, -- I
                txclk => txclk, -- I
                rst => rst, -- I
                autostart => s_portcontrol(i)(3), -- I -- via register
                linkstart => s_portcontrol(i)(2), -- I -- via register
                linkdis => s_portcontrol(i)(1), --'0', -- I -- via register
                txdivcnt => s_portcontrol(i)(15 downto 8), -- I -- via register -- before "00000001"
                tick_in => s_tick_from_tcc_to_ports(i), -- I
                time_in => s_tc_from_tcc_to_ports(i), -- I
                txdata => s_txdata(i), -- I
                tick_out => s_tick_from_ports_to_tcc(i), -- O
                time_out => s_tc_from_ports_to_tcc(i), -- O
                txrdy => s_txrdy(i), -- O
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
                linkstatus => s_running, -- I
                request_out => s_request_out(i), -- O
                request_in => s_request_in(i), -- I
                destination_ports => s_destination_ports(i),
                arb_granted => s_granted(i), -- I
                strobe_out => s_strobe_out(i), -- O
                strobe_in => s_strobe_in(i), -- I
                ready_in => s_ready_in(i), -- I
                -- Internal Bus IO:
                bus_address => s_bus_m_address(i), -- O
                bus_data_in => s_bus_s_register_data_out, -- I
                bus_dByte => s_bus_m_dByte(i), -- O
                bus_readwrite => s_bus_m_readwrite(i), -- O
                bus_strobe => s_bus_m_strobe(i), -- O
                bus_request => s_bus_m_request(i), -- O
                bus_ack_in => s_bus_m_ack(i), -- I
                -- Port Control/Status Bus IO:
                portstatus => s_portstatus(i), -- O
                watchdog_cycle => s_watchcycle -- I
            );
        END GENERATE spw_ports;
    ELSE GENERATE
        spw_ports_const : FOR i IN 0 TO (numports - 1) GENERATE
            spw_port : spwrouterport GENERIC MAP(
                numports => numports,
                blen => blen,
                sysfreq => sysfreq,
                txclkfreq => txclkfreq,
                rximpl => rx_impl(i),
                rxchunk => rxchunk,
                tximpl => tx_impl(i)
                -- (Generics that are not listed here have default values !)
            )
            PORT MAP(
                -- SpaceWire (spwstream) IO:
                clk => clk, -- I
                rxclk => rxclk, -- I
                txclk => txclk, -- I
                rst => rst, -- I
                autostart => '1', -- I -- active autostart but none linkstart! Router is waiting for incoming connection attempt.
                linkstart => '1', -- I
                linkdis => '0', --'0', -- I
                txdivcnt => "00000001", -- I
                tick_in => s_tick_from_tcc_to_ports(i), -- I
                time_in => s_tc_from_tcc_to_ports(i), -- I
                txdata => s_txdata(i), -- I
                tick_out => s_tick_from_ports_to_tcc(i), -- O
                time_out => s_tc_from_ports_to_tcc(i), -- O
                txrdy => s_txrdy(i), -- O
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
                linkstatus => s_running, -- I
                request_out => s_request_out(i), -- O
                request_in => s_request_in(i), -- I
                destination_ports => s_destination_ports(i),
                arb_granted => s_granted(i), -- I
                strobe_out => s_strobe_out(i), -- O
                strobe_in => s_strobe_in(i), -- I
                ready_in => s_ready_in(i), -- I
                -- Internal Bus IO:
                bus_address => s_bus_m_address(i), -- O
                bus_data_in => s_bus_s_register_data_out, -- I
                bus_dByte => s_bus_m_dByte(i), -- O
                bus_readwrite => s_bus_m_readwrite(i), -- O
                bus_strobe => s_bus_m_strobe(i), -- O
                bus_request => s_bus_m_request(i), -- O
                bus_ack_in => s_bus_m_ack(i), -- I
                -- Port Control/Status Bus IO:
                portstatus => OPEN, -- O -- wont be needed when externPort = FALSE!
                watchdog_cycle => (OTHERS => '0') -- watchdog cycle is disabled
            );
        END GENERATE spw_ports_const;
    END GENERATE spw_port_config;
    
    -- Status & Error interrupts.
    state_intr0 : status_intr <= s_pulse_state;    
    state_intr_gen : FOR i in 0 TO (numports - 1) GENERATE
        -- 1. Status interrupt.
        state_intr1 : s_rst_pulse_state(i) <= s_pulse_reg_state(i)((s_pulse_reg_state(i)'length - 1));
            
        state_intr2 : process(clk)
            variable prev : std_logic;
            variable curr : std_logic;
        begin
            if rising_edge(clk) then
                curr := s_running(i);
                
                if prev /= curr then
                    s_state(i) <= '1';
                else
                    s_state(i) <= '0';
                end if;
                
                prev := curr;
            end if;        
        end process;
        
        state_intr3 : process(clk)
        begin
            if s_rst_pulse_state(i) = '1' then
                -- Asynchronous reset.
                s_pulse_state(i) <= '0';
            elsif rising_edge(s_state(i)) then
                s_pulse_state(i) <= '1';
            end if;
        end process;
        
        state_intr4 : process(clk_intr)
        begin
            if rising_edge(clk_intr) then
                if s_pulse_state(i) = '0' then
                    -- Synchronous reset.
                    s_pulse_reg_state(i) <= (OTHERS => '0');
                else
                    s_pulse_reg_state(i)(0) <= '1';
                    
                    for j in 0 to s_pulse_reg_state(i)'length - 2 loop
                        s_pulse_reg_state(i)(j + 1) <= s_pulse_reg_state(i)(j);
                    end loop;
                end if;
            end if;
        end process;
    END GENERATE;

    -- Router register:
    router_registers : IF externPort = TRUE GENERATE
        -- Contains router link control, port status and routing table additional extern port for extern CPU bus system.
        reg_extended : spwrouterregs_extended
        GENERIC MAP(
            numports => numports
        )
        PORT MAP(
            clk => clk, -- I
            rst => rst, -- I
            readTable => s_register_data_out_buffer, -- O
            addrTable => s_bus_s_address, -- I
            ackTable => s_bus_s_ack, -- O
            strobeTable => s_bus_s_strobe, -- I
            requestTable => s_bus_s_request, -- I
            portstatus => s_portstatus, -- I
            portcontrol => s_portcontrol, -- O
            running => STD_LOGIC_VECTOR(resize(unsigned(s_running), 32)), -- I (vector is resized to fit into 32-bit register !)
            watchcycle => s_watchcycle, -- O
            timecycle => s_auto_cycle, -- O
            lasttime => s_last_tc, -- I
            lastautotime => s_auto_tc, -- I
            clka => clka, -- I
            addra => addra, -- I
            dina => dina, -- I
            douta => douta, -- O
            ena => ena, -- I
            rsta => rsta, -- I
            wea => wea -- I
        );
    ELSE GENERATE
            -- Contains router link control, port status register and routing table.
            reg_original : spwrouterregs
            PORT MAP(
                clk => clk, -- I
                rst => rst, -- I
                writeData => s_bus_s_register_data_in, -- I
                readData => s_register_data_out_buffer, -- O
                addr => s_bus_s_address, -- I
                ack => s_bus_s_ack, -- O
                strobe => s_bus_s_strobe, -- I
                request => s_bus_s_request, -- I
                autoTimeCodeCycleTime => s_auto_cycle -- O
            );
    END GENERATE router_registers;


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


    timecode_control_config : IF externPort = TRUE GENERATE
        -- Collect Time Code enable flag for each port.
        TC_en : FOR i IN 0 TO (numports - 1) GENERATE
            s_timecode_en(i) <= s_portcontrol(i)(5);
        END GENERATE TC_en;

        -- Time Code control.
        timecode_control_reg : spwroutertcc
        GENERIC MAP(
            numports => numports
        )
        PORT MAP(
            clk => clk, -- I
            rst => rst, -- I
            running => s_running, -- I
            tc_enable => s_timecode_en, -- I -- Time Codes are enabled through register flag only !
            tc_last => s_last_tc, -- O
            tick_out => s_tick_from_tcc_to_ports, -- O
            tick_in => s_tick_from_ports_to_tcc, -- I
            tc_out => s_tc_from_tcc_to_ports, -- O
            tc_in => s_tc_from_ports_to_tcc, -- I
            auto_tc_out => s_auto_tc, -- O
            auto_interval => s_auto_cycle -- I
        );        
    ELSE GENERATE   
        -- Time Code control.
        timecode_control_all : spwroutertcc
        GENERIC MAP(
            numports => numports
        )
        PORT MAP(
            clk => clk, -- I
            rst => rst, -- I
            running => s_running, -- I
            tc_enable => (OTHERS => '1'), -- I -- Time Codes are enabled on all ports !
            tc_last => s_last_tc, -- O
            tick_out => s_tick_from_tcc_to_ports, -- O
            tick_in => s_tick_from_ports_to_tcc, -- I
            tc_out => s_tc_from_tcc_to_ports, -- O
            tc_in => s_tc_from_ports_to_tcc, -- I
            auto_tc_out => s_auto_tc, -- O
            auto_interval => s_auto_cycle -- I
        );
    END GENERATE timecode_control_config;


    -- Creates transposed matrix of s_routing_matrix: Shows for every port (row) which port (column) requests access to it.
    routing_matrix_row : FOR i IN 0 TO (numports - 1) GENERATE
        routing_matrix_column : FOR j IN 0 TO (numports - 1) GENERATE
            s_routing_matrix_transposed(i)(j) <= s_routing_matrix(j)(i);
        END GENERATE routing_matrix_column;
    END GENERATE routing_matrix_row;


    -- Stores every row of s_routing_matrix which maps source ports (row) to destination ports (column).
    source_port_rows : FOR i IN 0 TO (numports - 1) GENERATE
        s_source_port_row(i) <= s_routing_matrix(i);
    END GENERATE source_port_rows;


    -- Routing process: Assigns information from source ports to destination ports to ports.
    crossbar : FOR i IN 0 TO (numports - 1) GENERATE
        --s_ready_in(i) <= spwrouterfunc.select_port(s_routing_matrix_transposed(i), s_txrdy);
        s_ready_in(i) <= '1' WHEN (s_routing_matrix_transposed(i) = (s_txrdy AND s_routing_matrix_transposed(i))) ELSE '0'; -- multi-/broadcast
        s_request_in(i) <= spwrouterfunc.select_port(s_source_port_row(i), s_request_out);
        s_txdata(i) <= spwrouterfunc.select_nchar(s_source_port_row(i), s_rxdata);
        s_strobe_in(i) <= spwrouterfunc.select_port(s_source_port_row(i), s_strobe_out);
    END GENERATE crossbar;


    -- Controls which master gets access to bus.
    access_control : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            s_bus_s_request <= OR s_bus_m_request;
            s_bus_s_register_data_out <= s_register_data_out_buffer;

            -- Caution ! Reversed priority conditioned through if-statements !
            -- For loop first rolls out (numports-1) downto 0. Since no if..elsif statements
            -- can be generated via GENERATE-keyword, the block has to be translated into
            -- independent if statements. The order is reversed because of the changed 
            -- priority: previously, first if statement had highes priority (the first
            -- elsif, etc.). Now hightest priority must be at the end in order to be able
            -- to overwrite a previously made decision.
            FOR i IN (numports - 1) DOWNTO 0 LOOP
                IF (s_bus_m_granted(i) = '1') THEN
                    s_bus_s_strobe <= s_bus_m_strobe(i);
                    s_bus_s_address <= s_bus_m_address(i);
                    s_bus_s_dByte <= s_bus_m_dByte(i);
                    s_bus_s_readwrite <= s_bus_m_readwrite(i);
                    s_bus_s_register_data_in <= s_bus_m_data(i);
                    s_bus_m_ack <= (i => s_bus_s_ack, OTHERS => '0');
                END IF;
            END LOOP;
        END IF;
    END PROCESS access_control;
END ARCHITECTURE spwrouter_arch;