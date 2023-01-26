----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 11.08.2021 21:27
-- Design Name: SpaceWire Router - SpaceWire Port (Container for spwstream)
-- Module Name: spwrouterport
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA
-- Target Devices: Xilinx FPGAs
-- Tool Versions: -/-
-- Description: Container of SpaceWire IP Core Light (spwstream) for SpaceWire
-- Router Implementation.
--
-- Dependencies: spwpkg, spwrouterpkg
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.SPWROUTERPKG.ALL;
USE WORK.SPWPKG.ALL;

ENTITY spwrouterport IS
    GENERIC (
        -- Number of SpaceWire ports.
        numports : INTEGER RANGE 1 TO 32;

        -- Bit length to map number of ports (ceil(log2((numports-1)))).
        blen : INTEGER RANGE 0 TO 5; -- (max 5 bits for 0-31 ports)

        -- System clock frequency in Hz.
        -- This must be set to the frequency of "clk". It is used to setup
        -- counter for reset timing, disconnect timeout and to transmit
        -- at 10 Mbit/s during the link handshake.
        sysfreq : real;

        -- Transmit clock frequency in Hz (only if tximpl = impl_fast).
        -- This must be set to the frequency of "txclk". It is used to 
        -- transmit at 10 Mbit/s during the link handshake.
        txclkfreq : real := 0.0;

        -- Selection of a receiver front-end implementation.
        rximpl : spw_implementation_type_rec;

        -- Maximum number of bits received per system clock
        -- (must be 1 in case of impl_generic).
        rxchunk : INTEGER RANGE 1 TO 4 := 1;

        -- Width of shift registers in clock recovery front-end 
        -- (only needed if impl_clkrec is used); added: SL
        WIDTH : INTEGER RANGE 1 TO 3 := 2;

        -- Selection of a transmitter implementation.
        tximpl : spw_implementation_type_xmit;

        -- size of the receive FIFO as the 2-logarithm of the number of bytes.
        -- Must be at least 6 (64 bytes).
        rxfifosize_bits : INTEGER RANGE 6 TO 14 := 11;

        -- Size of the transmit FIFO as the 2-logarithm of the number of bytes.
        txfifosize_bits : INTEGER RANGE 2 TO 14 := 11
    );
    PORT (
        -- ====================================
        --      SPACEWIRE PORT (spwstream)
        -- ====================================
        -- System clock.
        clk : IN STD_LOGIC;

        -- Receiver sample clock (only for impl_fast).
        rxclk : IN STD_LOGIC;

        -- Transmit clock (only for impl_fast).
        txclk : IN STD_LOGIC;

        -- Synchronous reset.
        rst : IN STD_LOGIC;

        -- Enables automatic link start on receipt of a NULL character.
        autostart : IN STD_LOGIC;

        -- Enables link start once the Ready state is reached.
        -- Without autostart or linkstart, the link remains in state Ready.
        linkstart : IN STD_LOGIC;

        -- Do not start link (overrides linkstart and autostart) and/or
        -- disconnect a running link.
        linkdis : IN STD_LOGIC;

        -- Scaling factor minus 1, used to scale the transmit base clock into
        -- the transmission bit rate. The system clock (for impl_generic) or
        -- the txclk (for impl_fast) is divided by (unsigned(txdivcnt) + 1).
        -- Changing this signal will immediately change the transmission rate.
        -- During link setup, the transmission rate is always 10 Mbit/s.
        txdivcnt : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- High for one clock cycle to request transmission of a TimeCode.
        -- The request is registered inside the entity until it can be processed.
        tick_in : IN STD_LOGIC;

        -- Time-code (control bits and counter value) to be send. Must be valid 
        -- when tick_in is high.
        time_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- Control flag and data byte so to be sent. Set control flag low to send
        -- a data byte, or high and data to 0x00 to send EOP or 0x01 for EEP.
        txdata : IN STD_LOGIC_VECTOR(8 DOWNTO 0); -- contains txflag and txdata

        -- High if port is ready to accept an N-Char for transmission FIFO.
        txrdy : OUT STD_LOGIC;

        -- High if the transmit FIFO is at least half full.
        txhalff : OUT STD_LOGIC;

        -- High for one clock cycle if a time-code was just received.
        tick_out : OUT STD_LOGIC;

        -- Control bits and counter value of last received time-code.
        time_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- High if the receive FIFO is at least half full.
        rxhalff : OUT STD_LOGIC;

        -- Received byte and control flag. Control flag is high if the received 
        -- character is EOP (data is 0x00) or EEP (0x01); low if received character
        -- is a data byte.
        rxdata : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);

        -- High if the link state machine is in the started state.
        started : OUT STD_LOGIC;

        -- High if the link state machine is in the connecting state.
        connecting : OUT STD_LOGIC;

        -- High if the link state machine is in the run state, indicating that the 
        -- link is operational. If started, connecting and rannung are all low,
        -- the link is in an initial state with the transmitter disabled.
        running : OUT STD_LOGIC;

        -- Disconnection detected in the run state. Triggers a link reset; auto-clearing.
        errdisc : OUT STD_LOGIC;

        -- Parity error detected in the run state. Trigger a link reset; auto-clearing.
        errpar : OUT STD_LOGIC;

        -- Invalid escape sequence detected in the run state. Triggers a link reset; auto-clearing.
        erresc : OUT STD_LOGIC;

        -- Credit error detected. Triggers a link reset; auto-clearing
        errcred : OUT STD_LOGIC;

        -- SpaceWire data in.
        spw_di : IN STD_LOGIC;

        -- SpaceWire strobe in.
        spw_si : IN STD_LOGIC;

        -- SpaceWire data out.
        spw_do : OUT STD_LOGIC;

        -- SpaceWire strobe out.
        spw_so : OUT STD_LOGIC;

        -- ====================================
        --           ROUTER SIGNALS
        -- ====================================
        -- Shows which port is in running-state.
        linkstatus : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- High as long as a packet is sent from this port to another.
        request_out : OUT STD_LOGIC;

        -- High as long as packet ist sent to this port.
        request_in : IN STD_LOGIC;

        -- First byte of a packet (address byte) with destination port (both physical and logical addressing).
        destination_port : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- High if the port gets permission from router arbiter for data transfer.
        arb_granted : IN STD_LOGIC;

        -- High if data byte or EOP/EEP is ready to transfer to destination port.
        strobe_out : OUT STD_LOGIC;

        -- High if transmission via this port should be performed (new byte still on txdata).
        strobe_in : IN STD_LOGIC;

        -- High if destination port is ready to accept next N-Char.
        ready_in : IN STD_LOGIC;

        -- ====================================
        --            INTERNAL BUS
        -- ====================================
        -- The memory address to access the router register.
        bus_address : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- Routing table entry for requested logical port.
        bus_data_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- TODO: For debugging purposes only ! 

        -- Defines which byte (1-4) in the router control register is to be read.
        bus_dByte : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);

        -- High if a write process; low is a read process should be performed into router registers.
        bus_readwrite : OUT STD_LOGIC;

        -- Strobe signal to routing table.
        bus_strobe : OUT STD_LOGIC;

        -- In this context also strobe signal to routing table.
        bus_request : OUT STD_LOGIC;

        -- Acknowledgment for granted access to routing table.
        bus_ack_in : IN STD_LOGIC;

        -- ====================================
        --      PORT STATUS & CONTROL BUS
        -- ====================================
        -- Contains port status (see manual).
        portstatus : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- Control information for port (see manual).
        portcontrol : IN STD_LOGIC_VECTOR(31 DOWNTO 0) -- Not used yet inside this entity !
    );
END spwrouterport;

ARCHITECTURE spwrouterport_arch OF spwrouterport IS
    -- Finite state machine state.
    SIGNAL state : spwrouterportstates := S_Idle;

    -- Packet cargo (excluding first byte (address byte)).
    -- According to spwstream: flag = 0 -> data byte
    --                         flag = 1 -> EOP / EEP
    SIGNAL s_packet_cargo : STD_LOGIC_VECTOR(8 DOWNTO 0); -- Contains every byte (and flag) of current packet

    -- Routing table.
    SIGNAL s_logical_address : STD_LOGIC_VECTOR(7 DOWNTO 0); -- Contains logical port address (32-254)
    SIGNAL s_routing_table_request : STD_LOGIC; -- High if data from router table is requested. Is hold until routing table has confirmed that data is available by handshake

    -- xmit signals.
    SIGNAL s_txwrite : STD_LOGIC; -- Set High to write a character to Tx-FIFO of the port.
    SIGNAL s_txrdy : STD_LOGIC; -- High if spwstream is ready to accept a character for transmit FIFO.
    SIGNAL s_txhalff : STD_LOGIC; -- s. txhalff port of spwstream

    -- Recv signals.
    SIGNAL s_rxread : STD_LOGIC; -- Set High to accept a received character. A character is removed also from the Rx-FIFO
    SIGNAL s_rxvalid : STD_LOGIC; -- High if rxflag and rxdata contain valid data
    SIGNAL s_rxdata : STD_LOGIC_VECTOR(8 DOWNTO 0); -- Used to identify received data (single EOP/EEP, N-Char, ...)
    SIGNAL s_rxflag_buffer : STD_LOGIC; -- Buffers flag of received N-chars
    SIGNAL s_rxdata_buffer : STD_LOGIC_VECTOR(7 DOWNTO 0); -- Fetches received bytes from the port and buffers them
    SIGNAL s_rxhalff : STD_LOGIC; -- s. rxhalff port of spwstream

    -- Bus & router signals.
    SIGNAL s_strobe_out : STD_LOGIC; -- Strobe signal to destination port when cargo/EOP/EEP byte need to be transmitted
    SIGNAL s_request_out : STD_LOGIC; -- High as long as a packet is started and sent but not yet completed
    SIGNAL s_destination_port : STD_LOGIC_VECTOR(7 DOWNTO 0); -- Contains first byte of a packet (address byte)

    -- Register status signals.
    SIGNAL s_discardedcounter : unsigned(17 DOWNTO 0);
BEGIN
    -- Drive outputs.
    -- Bus & router signals.
    destination_port <= s_destination_port;
    request_out <= s_request_out;
    strobe_out <= s_strobe_out;
    rxdata <= s_packet_cargo;
    bus_request <= s_routing_table_request;
    bus_strobe <= s_routing_table_request;
    bus_address <= (9 DOWNTO 2 => s_logical_address, OTHERS => '0'); -- Necessary so that the correct entry is addressed in router table
    bus_readwrite <= '0'; -- performs read operations only
    bus_dByte <= (OTHERS => '1'); -- always select all four bytes
    -- Port signals.
    rxhalff <= s_rxhalff;
    txhalff <= s_txhalff;

    -- Read input.
    s_txwrite <= strobe_in WHEN request_in = '1' ELSE
        '0';

    -- Drive port status (register).
    portstatus(0) <= started;
    portstatus(1) <= connecting;
    portstatus(2) <= running;
    portstatus(3) <= s_request_out; -- Not sure this signal is right here ...
    portstatus(4) <= errdisc;
    portstatus(5) <= errpar;
    portstatus(6) <= erresc;
    portstatus(7) <= errcred;
    portstatus(9) <= rxhalff;
    portstatus(12) <= txhalff;
    portstatus(31 DOWNTO 14) <= STD_LOGIC_VECTOR(s_discardedcounter);
    --portstatus(31 downto 8) <= (others => '0');

    -- SpaceWire port.
    spwport : spwstream
    GENERIC MAP(
        sysfreq => sysfreq,
        txclkfreq => txclkfreq,
        rximpl => rximpl,
        rxchunk => rxchunk,
        WIDTH => WIDTH,
        tximpl => tximpl,
        rxfifosize_bits => rxfifosize_bits,
        txfifosize_bits => txfifosize_bits
    )
    PORT MAP(
        clk => clk,
        rxclk => rxclk,
        txclk => txclk,
        rst => rst,
        autostart => autostart,
        linkstart => linkstart,
        linkdis => linkdis,
        txdivcnt => txdivcnt,
        tick_in => tick_in,
        ctrl_in => time_in(7 DOWNTO 6), -- ctrl flag
        time_in => time_in(5 DOWNTO 0), -- counter value
        txflag => txdata(8), -- s_txdata(8) -- flag
        txdata => txdata(7 DOWNTO 0), -- s_txdata(7 downto 0) -- data byte
        txwrite => s_txwrite,
        txrdy => s_txrdy,
        txhalff => s_txhalff,
        tick_out => tick_out,
        ctrl_out => time_out(7 DOWNTO 6), -- ctrl flag
        time_out => time_out(5 DOWNTO 0), -- counter value
        rxvalid => s_rxvalid,
        rxhalff => s_rxhalff,
        rxflag => s_rxflag_buffer,
        rxdata => s_rxdata_buffer,
        rxread => s_rxread,
        started => started,
        connecting => connecting,
        running => running,
        errpar => errpar,
        erresc => erresc,
        errcred => errcred,
        errdisc => errdisc,
        spw_di => spw_di,
        spw_si => spw_si,
        spw_do => spw_do,
        spw_so => spw_so
    );

    -- Infers a latch, but is necessary to hold the signal so that the FSM of receiving port has enough time to react to it. TODO: Bad design, either rebuild in future or test thoroughly !
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            txrdy <= s_txrdy;
        END IF;
    END PROCESS;

    -- Port state machine.
    PROCESS (clk)
        VARIABLE v_validport : STD_LOGIC; -- S_Dest2; for boolean operationen
        VARIABLE v_reqports : STD_LOGIC; -- S_RT1
    BEGIN
        IF rising_edge(clk) THEN
            IF (rst = '1') THEN
                -- Synchronous reset.
                v_validport := '0';
                v_reqports := '0';
                s_destination_port <= (OTHERS => '0');
                s_packet_cargo <= (OTHERS => '0');
                s_logical_address <= (OTHERS => '0');
                s_rxdata <= (OTHERS => '0');
                s_rxread <= '0';
                s_request_out <= '0';
                s_routing_table_request <= '0';
                s_strobe_out <= '0';
                s_discardedcounter <= (OTHERS => '0');
                state <= S_Idle;
            ELSE
                CASE state IS
                    WHEN S_Idle =>
                        -- If receive buffer is not empty, activate handshake to get packet byte by byte.

                        s_strobe_out <= '0';

                        IF (s_rxvalid = '1') THEN
                            s_rxread <= '1';
                            state <= S_Dest0;
                        END IF;

                    WHEN S_Dest0 =>
                        -- Wait to read first data byte from buffer.

                        s_rxdata(8) <= s_rxflag_buffer;
                        s_rxdata(7 DOWNTO 0) <= s_rxdata_buffer;
                        s_rxread <= '0'; -- take over via handshake
                        state <= S_Dest1;

                    WHEN S_Dest1 =>
                        -- Look at first byte of new packet.

                        IF (s_rxdata(8) = '0') THEN -- Data byte
                            IF (s_rxdata(7 DOWNTO 5) = "000") THEN -- [DestPort] < 32 (physical port)
                                -- Physical port is addressed.
                                s_destination_port <= s_rxdata(7 DOWNTO 0); -- Destination port number (first byte of packet)

                                IF (unsigned(s_rxdata(7 DOWNTO 0)) > (numports - 1)) THEN
                                    -- Discard invalid addressed packet (destination port does not exist).
                                    state <= S_Dummy0;
                                ELSE
                                    -- Destination port exists, packet can be delivered.
                                    state <= S_Dest2;
                                END IF;
                            ELSE -- DestPort >= 32 (logical port)
                                -- Logical port is addressed: Send request to routing table to get port assignment.
                                -- Because of this evaluation, it is not necessary for routing table or register to 
                                -- carry out a new interval check. Because an injury is hereby excluded.
                                s_logical_address <= s_rxdata(7 DOWNTO 0);
                                s_routing_table_request <= '1';
                                state <= S_RT0;
                            END IF;
                        ELSE
                            -- Single EOP / EEP.
                            state <= S_Idle;
                        END IF;

                    WHEN S_Dest2 =>
                        v_validport := '0'; -- (Reset variable for next iteration)

                        -- Check if target port is addressable.
                        FOR i IN 1 TO (numports - 1) LOOP -- Auf Port0 kann hiernach nicht gesendet werden, bitte überprüfen!
                            IF (linkstatus(i) = '1' AND s_destination_port(blen DOWNTO 0) = STD_LOGIC_VECTOR(to_unsigned(i, blen + 1))) THEN
                                v_validport := '1'; -- potenzielle Fehlerquelle mit blen+1 !! Im Original Code werden hier 5 Bits (4 downto 0) abgefragt. falls blen == 4 ist, muss folglich blen+1 für 5 gelten!
                            END IF;
                        END LOOP;

                        IF ((s_destination_port(blen DOWNTO 0) = STD_LOGIC_VECTOR(to_unsigned(0, blen + 1))) OR (v_validport = '1')) THEN
                            -- Packet address matches available physical ports, packet can be sent through router.
                            s_request_out <= '1';
                            state <= S_Data0;
                        ELSE
                            -- Discard invalid addressed packet.
                            state <= S_Dummy0;
                        END IF;

                    WHEN S_RT0 =>
                        -- Wait for acknowledgement from routing table.
                        IF (bus_ack_in = '1') THEN
                            state <= S_RT1;
                        END IF;

                    WHEN S_RT1 =>
                        v_reqports := '0'; -- (Reset variable for new iteration)

                        -- Withdraw routing table request signal.
                        s_routing_table_request <= '0';

                        -- Changed priority ! Usual order with If...Elsif would be from zero ascending.
                        -- Since only single unconnected if statements can be generated, the order must be
                        -- reversed (descending), therefore the last if query has the highes priority. (Can
                        -- overwrite result again.)
                        FOR i IN (numports - 1) DOWNTO 0 LOOP
                            IF (linkstatus(i) = '1' AND bus_data_in(i) = '1') THEN
                                s_destination_port <= STD_LOGIC_VECTOR(to_unsigned(i, s_destination_port'length));
                                s_request_out <= '1';
                                state <= S_RT2;

                                -- Check if mapped physical port is addressable.
                                v_reqports := '1';
                            END IF;
                        END LOOP;

                        IF (v_reqports = '0') THEN -- discard invalid addressed packet (TODO: Warning ! Packet addressed to port which is currently not connected will be deleted ! No usefull behaviour ! Change !)
                            state <= S_Dummy0;
                        END IF;

                    WHEN S_RT2 =>
                        -- Wait for permission from arbiter (logical addresses access only).
                        IF (arb_granted = '1') THEN
                            state <= S_Data2;
                        END IF;

                    WHEN S_Data0 =>
                        -- Wait for permission from arbiter and/or for new received N-chars of current packet (physical addresses only).
                        s_strobe_out <= '0';

                        IF (arb_granted = '1' AND s_rxvalid = '1') THEN
                            s_rxread <= '1';
                            state <= S_Data1;
                        END IF;

                    WHEN S_Data1 =>
                        -- Wait to read from data receive buffer.
                        s_strobe_out <= '0';
                        s_rxdata(8) <= s_rxflag_buffer; -- take over N-char via handshake
                        s_rxdata(7 DOWNTO 0) <= s_rxdata_buffer;
                        s_rxread <= '0';
                        state <= S_Data2;

                    WHEN S_Data2 =>
                        -- Send data that is read from rx buffer to destination port.
                        IF (ready_in = '1') THEN
                            s_strobe_out <= '1';
                            s_packet_cargo <= s_rxdata;

                            IF (s_rxdata(8) = '1') THEN
                                -- EOP/EEP means packet is complete.
                                state <= S_Data3;
                            ELSIF (arb_granted = '1' AND s_rxvalid = '1') THEN
                                -- Continue reading bytes according to current packet.
                                s_rxread <= '1';
                                state <= S_Data1;
                            ELSE
                                -- None further byte available yet, wait for next data byte or an EOP/EEP.
                                state <= S_Data0;
                            END IF;
                        END IF;

                    WHEN S_Data3 =>
                        -- Completed transferring packet to destination port.
                        s_strobe_out <= '0';
                        s_request_out <= '0';
                        state <= S_Idle;

                    WHEN S_Dummy0 =>
                        -- Dummie states exist to throw away a packet that cannot be delivered.
                        -- dummy read (may block forever) -- TODO: Evaluate risk of deadlock !
                        s_request_out <= '0';

                        IF (s_rxvalid = '1') THEN
                            s_discardedcounter <= s_discardedcounter + 1;
                            s_rxread <= '1';
                            state <= S_Dummy1;
                        END IF;

                    WHEN S_Dummy1 =>
                        -- Wait to read data from receive buffer.
                        s_rxdata(8) <= s_rxflag_buffer; -- take over by handshake mechanism
                        s_rxdata(7 DOWNTO 0) <= s_rxdata_buffer;
                        s_rxread <= '0';
                        state <= S_Dummy2;

                    WHEN S_Dummy2 =>
                        -- Read data from receive buffer until the control flag is '1' (means EOP/EEP).
                        IF (s_rxdata(8) = '1') THEN
                            state <= S_Idle;
                        ELSE
                            state <= S_Dummy0;
                        END IF;

                    WHEN OTHERS => -- (Necessary because of unused state problem)
                        state <= S_Idle;

                END CASE;
            END IF;
        END IF;
    END PROCESS;
END spwrouterport_arch;