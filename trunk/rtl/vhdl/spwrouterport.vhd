----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 11.08.2021 21:27
-- Design Name: SpaceWire Router -- SpaceWire Port (Container for spwstream)
-- Module Name: spwrouterport
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA
-- Target Devices: Xilinx FPGAs
-- Tool Versions: -/-
-- Description: Container of SpaceWire IP Core Light (spwstream) for SpaceWire
-- Router Implementation.
--
-- Dependencies: spwstream (spwpkg), spwrouterportstates (spwrouterpkg)
-- 
-- Revision: 0.9
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.SPWROUTERPKG.ALL;
USE WORK.SPWPKG.ALL;

ENTITY spwrouterport IS
    GENERIC (
        -- Number of SpaceWire ports.
        numports : INTEGER RANGE 0 TO 31;

        -- Bit length to map number of ports (ceil(log2(numports))).
        blen : INTEGER RANGE 0 TO 5; -- (max 5 bits for 0-31 ports)

        -- Number of this port (0 to numports).
        --pnum : INTEGER RANGE 0 TO 31;

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

        -- Synchronous reset (active-high).
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
        -- Shows which port is in running state (is able to receive or transmit data).
        linkstatus : IN STD_LOGIC_VECTOR(numports DOWNTO 0); -- linkUp

        -- High as long as a packet is sent from this port via the router to another port.
        request_out : OUT STD_LOGIC; -- requestOut

        -- High as long as packet ist sent via this port.
        request_in : IN STD_LOGIC; -- requestIn

        -- First byte of a packet (address byte) with destination port (both physical
        -- and logical addressing).
        destination_port : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- destinationPortOut

        -- The binary form (number) of the this port.
        --source_port : OUT STD_LOGIC_VECTOR(blen DOWNTO 0); -- sourcePortOut

        -- High if the port gets permission from router arbiter for data transfer.
        arb_granted : IN STD_LOGIC; -- grantedIn

        -- High if data byte or EOP/EEP is ready to transfer to destination port.
        strobe_out : OUT STD_LOGIC; -- strobeOut

        -- High if transmission via this port should be performed (new byte still on txdata).
        strobe_in : IN STD_LOGIC; -- strobeIn

        -- High if destination port is ready to accept next N-Char.
        ready_in : IN STD_LOGIC; -- readyIn

        -- ====================================
        --            INTERNAL BUS
        -- ====================================
        -- The address to access the router control register.
        bus_address : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- busMasterAddressOut

        -- Routing table entry for requested logical port.
        bus_data_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- busMasterDataIn

        -- Data to be written into router control register. Is always 0x0000_0000.
        --bus_data_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- busMasterDataOut (wenn ausblenden nicht funktioniert oder undurchsichtig ist, wieder entkommentieren und einfach 'open' machen)

        -- Defines which byte (1-4) in the router control register is to be read.
        bus_dByte : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- busMasterByteEnableOut

        -- High if a write process; low is a read process shall be performed
        -- in router registers.
        bus_readwrite : OUT STD_LOGIC; -- busMasterWriteEnableOut

        -- Strobe signal to routing table.
        bus_strobe : OUT STD_LOGIC; -- busMasterStrobeOut

        -- In this context also strobe signal to routing table.
        bus_request : OUT STD_LOGIC; -- busMasterRequestOut

        -- Acknowledgment to get access to routing table.
        bus_ack_in : IN STD_LOGIC -- busMasterAcknowledgeIn
    );
END spwrouterport;

ARCHITECTURE spwrouterport_arch OF spwrouterport IS
    -- Finite state machine state.
    SIGNAL state : spwrouterportstates := S_Idle; -- check 

    -- Packet cargo (excluding first byte (address byte)).
    -- According to spwstream: flag = 0 -> data byte
    --                         flag = 1 -> EOP / EEP
    SIGNAL s_packet_cargo : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0'); -- iDataOut

    -- Routing table.
    SIGNAL s_logical_address : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0'); -- iRoutingTableAddress -- Contains logical port address (32-254)
    SIGNAL s_routing_table_request : STD_LOGIC; -- iRoutingTableRequest -- High if data from router table is requested. Is maintained until routing table has confirmed via handshake that data is available

    -- Xmit signals.
    SIGNAL s_txwrite : STD_LOGIC; -- txwrite -- Set High to write a character to transmit FIFO of the port.
    --SIGNAL s_txdata : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0'); -- txdata -- Contains control flag (txflag) and data byte (txdata) (for more information see spwstream). (Wird augenscheinlich nicht benötigt, direkt vom Eingangsport lesen!)
    SIGNAL s_txrdy : STD_LOGIC; -- iTransmitFIFOReady gelöscht! -- High if spwstream is ready to accept a character for transmit FIFO.
    SIGNAL s_txhalff : STD_LOGIC;

    -- Recv signals.
    SIGNAL s_rxread : STD_LOGIC; -- rxread -- Set High to accept a received character. A character is removed from the receive FIFO.
    SIGNAL s_rxvalid : STD_LOGIC; -- rxvalid -- High if rxflag and rxdata contain valid data.
    SIGNAL s_rxdata : STD_LOGIC_VECTOR(8 DOWNTO 0); -- rxdata -- Used to identify received data (single EOP/EEP, N-Char, ...)
    SIGNAL s_rxflag_buffer : STD_LOGIC; -- Buffers flag of received N-chars
    SIGNAL s_rxdata_buffer : STD_LOGIC_VECTOR(7 DOWNTO 0); -- Fetches received bytes from the port and buffers them
    SIGNAL s_rxhalff : STD_LOGIC; --

    -- Bus & router signals.
    SIGNAL s_strobe_out : STD_LOGIC; -- iStrobeOut -- Strobe signal to destination port when cargo/EOP/EEP byte need to be transmitted.
    --SIGNAL s_ready_out : STD_LOGIC; -- iReadyOut -- Scheint das gleiche wie s_txrdy zu sein. (erstmal gestrichen, wegoptimiert, mal schauen ob das ein fehler war)
    SIGNAL s_request_out : STD_LOGIC; -- iRequestOut -- High as long as a packet is started and sent, not yet completed.
    SIGNAL s_destination_port : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0'); -- iDestinationPortOut -- Contains first byte of a packet (address byte)
BEGIN
    -- Drive outputs.
    -- Bus & router signals.
    --source_port <= STD_LOGIC_VECTOR(to_unsigned(pnum, source_port'length));
    destination_port <= s_destination_port;
    request_out <= s_request_out;
    strobe_out <= s_strobe_out;
    rxdata <= s_packet_cargo; -- dataOut
    bus_request <= s_routing_table_request;
    bus_strobe <= s_routing_table_request;
    bus_address <= (9 DOWNTO 2 => s_logical_address, OTHERS => '0'); -- Necessary so that the correct entry is addressed in router table
    bus_readwrite <= '0'; -- perform read operations only
    bus_dByte <= (OTHERS => '1'); -- always select all four bytes
    --bus_data_out <= (OTHERS => '0'); -- Keine Ahnung wieso das nötig ist (wird mal auf null gesetzt)
    -- Port signals.
    rxhalff <= s_rxhalff;
    txhalff <= s_txhalff;    
    txrdy <= s_txrdy;
    
    -- Read inputs.
    s_txwrite <= strobe_in WHEN request_in = '1' ELSE
        '0';
    --s_txdata <= txdata; -- dataIn
    --iTransmitFIFOReady <= s_txrdy;
    --s_ready_out <= s_txrdy;

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

    -- Dieses hier mal noch nicht löschen! Implementierung hat ergeben, dass es auch ohne diesen Abschnitt geht (sah so aus als würde s_txrdy hier um einen Takt verzögert). ist aber wohl nicht nötig. Noch einige commits lang hier auskommentiert lassen, danach kann es entfernt werden - sofern bis dahin keine Fehlfunktion auftrat.
    -- Synchronous update. (Wenn readyOut das gleiche wie txrdy macht, dann kann dieser Process hier ebenfalls gestrichen werden, weil s_txrdy schon synchron geliefert wird)
    --    PROCESS (clk)
    --    BEGIN
    --        IF rising_edge(clk) THEN
    --            txrdy <= s_txrdy;--s_ready_out; -- s_ready_out
    --        END IF;
    --    END PROCESS;

    -- Finite state machine.
    PROCESS (clk, rst)
        VARIABLE v_validport : STD_LOGIC; -- S_Dest2; for boolean operationen
        VARIABLE v_reqports : STD_LOGIC; -- S_RT1
    BEGIN
        IF rising_edge(clk) THEN
            IF (rst = '1') THEN
                -- Synchronous reset.
                s_destination_port <= (OTHERS => '0');
                s_packet_cargo <= (OTHERS => '0');
                s_logical_address <= (OTHERS => '0');
                s_rxdata <= (OTHERS => '0');
                s_rxread <= '0';
                s_request_out <= '0';
                s_routing_table_request <= '0';
                s_strobe_out <= '0';
                state <= S_Idle;
            ELSE
                CASE state IS
                    WHEN S_Idle =>
                        -- If receive buffer is not empty, activate handshake to get packet byte by byte.

                        s_strobe_out <= '0';

                        IF (s_rxvalid = '1') THEN
                            s_rxread <= '1'; -- rxread
                            state <= S_Dest0;
                        END IF;

                    WHEN S_Dest0 =>
                        -- Wait to read first data byte from buffer.

                        s_rxdata(8) <= s_rxflag_buffer;
                        s_rxdata(7 DOWNTO 0) <= s_rxdata_buffer;
                        s_rxread <= '0'; -- rxread -- take over via handshake
                        state <= S_Dest1;

                    WHEN S_Dest1 =>
                        -- Look at first byte of a packet.

                        IF (s_rxdata(8) = '0') THEN -- vorher: receiveFIFODataOut(8) -- Data byte
                            IF (s_rxdata(7 DOWNTO 5) = "000") THEN -- DestPort <= 31 (physical port)
                                -- Physical port addressed.
                                s_destination_port <= s_rxdata(7 DOWNTO 0); -- Destination port number (first byte of packet)

                                IF (unsigned(s_rxdata(7 DOWNTO 0)) > numports) THEN
                                    -- Discard invalid addressed packet (destination port does not exist).
                                    state <= S_Dummy0;
                                ELSE
                                    -- Destination port exists, packet can be delivered.
                                    state <= S_Dest2;
                                END IF;
                            ELSE -- DestPort > 31 (logical port)
                                -- Logical port is addressed: Send request to routing table to get port assignment.
                                s_logical_address <= s_rxdata(7 DOWNTO 0);
                                s_routing_table_request <= '1';
                                state <= S_RT0;
                            END IF;
                        ELSE
                            -- Single EOP / EEP.
                            state <= S_Idle;
                        END IF;

                    WHEN S_Dest2 =>
                        -- (Reset variable for new iteration.)
                        v_validport := '0';

                        -- Transmit request to destination port.
                        FOR i IN 1 TO numports LOOP -- Auf Port0 kann hiernach nicht gesendet werden, bitte überprüfen!
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
                        -- Wait acknowledge. (Hat wohl was damit zu tun, dass die gewünschte Information von der RT eingetroffen ist)

                        IF (bus_ack_in = '1') THEN
                            state <= S_RT1; -- RT == Routing table
                        END IF;

                    WHEN S_RT1 =>
                        -- (Reset variable for new iteration.)
                        v_reqports := '0';

                        -- Logical addressing: Request to data which is read from routing table.

                        s_routing_table_request <= '0';

                        -- Changed priority! Normal order with If...Elsif would be from zero ascending.
                        -- Since only single unconnected if queries can be generated, the order must be
                        -- reversed (descending), since the last if query has the highes priority. (Can
                        -- overwrite result again.)
                        FOR i IN numports DOWNTO 0 LOOP
                            IF (linkstatus(i) = '1' AND bus_data_in(i) = '1') THEN
                                s_destination_port <= STD_LOGIC_VECTOR(to_unsigned(i, s_destination_port'length));
                                s_request_out <= '1';
                                state <= S_RT2;

                                -- Variable to compare in same cycle whether a port can be selected at all.
                                v_reqports := '1';
                            END IF;
                        END LOOP;

                        IF (v_reqports = '0') THEN -- discard invalid addressed packet if none 'if-statement' before was executed.
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
                        -- Send data which is read from rx buffer to destination port.

                        IF (ready_in = '1') THEN
                            s_strobe_out <= '1';
                            s_packet_cargo <= s_rxdata;
                            IF (s_rxdata(8) = '1') THEN
                                -- EOP/EEP, means packet is complete.
                                state <= S_Data3;
                            ELSIF (arb_granted = '1' AND s_rxvalid = '1') THEN
                                -- Continue reading bytes according to this packet.
                                s_rxread <= '1';
                                state <= S_Data1;
                            ELSE
                                -- None further byte available yet, wait for next data byte or an EOP/EEP.
                                state <= S_Data0;
                            END IF;
                        END IF;

                    WHEN S_Data3 =>
                        -- Complete sending to destination port.

                        s_strobe_out <= '0';
                        s_request_out <= '0';
                        state <= S_Idle;

                    WHEN S_Dummy0 =>
                        -- Dummie states are there to throw away a packet that cannot be delivered.
                        -- dummy read (may block forever) (Wie kann hier ein Deadlock konstruiert werden?)

                        s_request_out <= '0';

                        IF (s_rxvalid = '1') THEN
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

                        IF (s_rxdata(8) = '1') THEN -- vorher: receiveFIFODataOut(8)
                            state <= S_Idle;
                        ELSE
                            state <= S_Dummy0;
                        END IF;

                    WHEN OTHERS => -- Because of unused state problem.
                        state <= S_Idle;
                END CASE;
            END IF;
        END IF;
    END PROCESS;
END spwrouterport_arch;