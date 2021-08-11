----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 11.08.2021 21:27
-- Design Name: SpaceWire Router Port
-- Module Name: spwrouterport
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: Container of SpaceWire IP Core Light for Router Implementation.
--
-- Dependencies: none
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.spwrouterpkg.ALL;
USE work.spwpkg.ALL;

ENTITY spwrouterport IS
    GENERIC (
        -- Number of SpaceWire ports. (evtl. nicht benötigt)
        numports : INTEGER RANGE 0 TO 31;

        -- Port number.
        portnum : INTEGER RANGE 0 TO 31;

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

        -- Width of shift registers in clock recovery front-end; added: SL
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
        -- System clock.
        clk : IN STD_LOGIC; -- clock

        -- Receiver sample clock (only for impl_fast)
        rxclk : IN STD_LOGIC; -- receiveclock

        -- Transmit clock (only for impl_fast)
        txclk : IN STD_LOGIC; -- transmitclock

        -- Synchronous reset (active-high).
        rst : IN STD_LOGIC; -- reset

        -- Enables automatic link start on receipt of a NULL character.
        autostart : IN STD_LOGIC; -- autoStart

        -- Enables link start once the Ready state is reached.
        -- Without autostart or linkstart, the link remains in state Ready.
        linkstart : IN STD_LOGIC; -- linkStart

        -- Do not start link (overrides linkstart and autostart) and/or
        -- disconnect a running link.
        linkdis : IN STD_LOGIC; -- linkDisable

        -- Scaling factor minus 1, used to scale the transmit base clock into
        -- the transmission bit rate. The system clock (for impl_generic) or
        -- the txclk (for impl_fast) is divided by (unsigned(txdivcnt) + 1).
        -- Changing this signal will immediately change the transmission rate.
        -- During link setup, the transmission rate is always 10 Mbit/s.
        txdivcnt : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- transmitClockDivide

        -- High for one clock cycle to request transmission of a TimeCode.
        -- The request is registered inside the entity until it can be processed.
        tick_in : IN STD_LOGIC; -- tickIn

        -- Last received TimeCode.
        tc_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- Pulled high by the application to write an N-Char to the transmit
        -- queue. If "txwrite" and "txrdy" are both high on the rising edge
        -- of "clk", a character is added to the transmit queue.
        -- This signal has no effect if "txrdy" is low.
        --txwrite : IN STD_LOGIC; -- requestOut

        -- Control flag and data byte to be send.
        data_in : IN STD_LOGIC_VECTOR(8 DOWNTO 0);

        -- High if the entity is ready to accept an N-Char for transmission.
        txrdy : OUT STD_LOGIC; -- readyOut

        -- High if the transmission queue is at least half full.
        --txhalff : OUT STD_LOGIC; -- OPEN

        -- High for one clock cycle if a TimeCode was just received.
        tick_out : OUT STD_LOGIC; -- tickOut

        -- TimeCode to transmit.
        tc_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- High if "rxflag" and "rxdata" contain valid data.
        -- This signal is high unless the receive FIFO is empty.
        --rxvalid : OUT STD_LOGIC; -- readyIn

        -- High if the receive FIFO is at least half full.
        --rxhalff : OUT STD_LOGIC; -- OPEN

        -- Received control flag and data byte.
        data_out : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);

        -- Pulled high by the application to accept a received character.
        -- If "rxvalid" and "rxread" are both high on the rising edge of "clk",
        -- a character is removed from the receive FIFO and "rxvalid", "rxflag"
        -- and "rxdata" are updated.
        -- This signal has no effect if "rxvalid" is low.
        --rxread : IN STD_LOGIC; -- requestIn

        -- High if the link state machine is currently in the Started state.
        started : OUT STD_LOGIC; -- linkStatus

        -- High if the link state machine is currently in the Connecting state.
        connecting : OUT STD_LOGIC; -- linkStatus

        -- High if the link state machine is currently in the Run state, indicating
        -- that the link is fully operational. If none of started, connecting or running
        -- is high, the link is in an initial state and the transmitter is not yet enabled.
        running : OUT STD_LOGIC; -- linkStatus

        -- Disconnect detected in state Run. Triggers a reset and reconnect of the link.
        -- This indication is auto-clearing.
        errdisc : OUT STD_LOGIC; -- errorStatus

        -- Parity error detected in state Run. Triggers a reset and reconnect of the link.
        -- This indication is auto-clearing.
        errpar : OUT STD_LOGIC; -- errorStatus

        -- Invalid escape sequence detected in state Run. Triggers a reset and reconnect of
        -- the link. This indication is auto-clearing.
        erresc : OUT STD_LOGIC; -- errorStatus

        -- Credit error detected. Triggers a reset and reconnect of the link.
        -- This indication is auto-clearing.
        errcred : OUT STD_LOGIC; -- errorStatus

        -- Data In signal from SpaceWire bus.
        spw_di : IN STD_LOGIC; -- spaceWireDataIn

        -- Strobe In signal from SpaceWire bus.
        spw_si : IN STD_LOGIC; -- spaceWireStrobeIn

        -- Data Out signal to SpaceWire bus.
        spw_do : OUT STD_LOGIC; -- spaceWireDataOut

        -- Strobe Out signal to SpaceWire bus.
        spw_so : OUT STD_LOGIC; -- spaceWireStrobeOut
        -- Neu hinzukommende Ports
        --
        linkUp : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
        destinationPortOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        sourcePortOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        strobeOut : OUT STD_LOGIC;
        strobeIn : IN STD_LOGIC;
        --
        busMasterAddressOut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        busMasterDataIn : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        busMasterDataOut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        busMasterWriteEnableOut : OUT STD_LOGIC;
        busMasterByteEnableOut : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        busMasterStrobeOut : OUT STD_LOGIC;
        busMasterRequestOut : OUT STD_LOGIC;
        busMasterAcknowledgeIn : IN STD_LOGIC;
        --
        requestOut : OUT STD_LOGIC
    );
END spwrouterport;

ARCHITECTURE spwrouterport_arch OF spwrouterport IS
    -- Finite state machine states.
    SIGNAL state : spwrouterportstates := S_Idle; -- check 

    -- SpaceWire Buffer Status/Control
    SIGNAL s_txwrite : STD_LOGIC; -- check -- iTransmitFIFOWriteEnable
    SIGNAL s_data_in : STD_LOGIC_VECTOR(8 DOWNTO 0); -- check -- iTransmitFIFODataIn

    SIGNAL s_rxread : STD_LOGIC;
    SIGNAL s_data_out : STD_LOGIC_VECTOR(8 DOWNTO 0); -- check -- receiveFIFODataOut

    SIGNAL s_req_out : STD_LOGIC; -- check -- iRequestOut
    SIGNAL s_destport : STD_LOGIC_VECTOR(7 DOWNTO 0); -- iDestinationPortOut
    SIGNAL s_data_out : STD_LOGIC_VECTOR(8 DOWNTO 0); -- iDataOut -- check
    SIGNAL s_strobe_out : STD_LOGIC; -- iStrobeOut
    SIGNAL s_RoutingTable_addr : STD_LOGIC_VECTOR(7 DOWNTO 0); -- iRoutingTableAddress
    SIGNAL s_RoutingTable_req : STD_LOGIC; -- iRoutingTableRequest
    --
    -- Eigene Signale
    SIGNAL s_bool_destports : STD_LOGIC; -- check
    SIGNAL s_rxvalid : STD_LOGIC; -- check
BEGIN
    -- Drive outputs
    sourcePortOut <= STD_LOGIC_VECTOR(to_unsigned(portnum, sourcePortOut'length)); -- check
    destinationPortOut <= s_destport; -- check
    requestOut <= s_req_out; -- check
    strobeOut <= s_strobe_out; -- check
    data_out <= s_data_out; -- check
    (busMasterRequestOut, busMasterStrobeOut) <= s_RoutingTable_req;
    busMasterAddressOut <= x"0000" & "000000" & s_RoutingTable_addr & "00";
    busMasterWriteEnableOut <= '0';
    busMasterByteEnableOut <= "1111";
    busMasterDataOut <= (OTHERS => '0');
    -- busMaster... signale erst umbennenen wenn deren bedeutung eindeutig geklärt ist!!

    -- Intermediate steps.
    s_txwrite <= strobeIn WHEN requestIn = '1' ELSE
        '0'; -- check
    s_data_in <= data_in; -- check

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
        clk => clk, -- check
        rxclk => rxclk, -- check
        txclk => txclk, -- check
        rst => rst, -- check
        autostart => autostart, -- check
        linkstart => linkstart, -- check
        linkdis => linkdis, -- check
        txdivcnt => txdivcnt, -- check
        tick_in => tick_in, -- check
        ctrl_in => tc_in(7 DOWNTO 6), -- check
        time_in => tc_in(5 DOWNTO 0), -- check
        txflag => s_data_in(8), -- check
        txwrite => s_txwrite, -- check
        txdata => s_data_in(7 DOWNTO 0), -- check
        txrdy => txrdy, -- check
        txhalff => OPEN, -- check
        tick_out => tick_out, -- check
        ctrl_out => tc_out(7 DOWNTO 6), -- check
        time_out => tc_out(5 DOWNTO 0), -- check
        rxvalid => s_rxvalid, -- TODO: Könnte passen, aber bin nicht sicher!
        rxhalff => OPEN, -- check
        rxflag => s_data_out(8), -- check
        rxdata => s_data_out(7 DOWNTO 0), -- check
        rxread => s_rxread, -- Achtung! Genau testen, könnte sein, dass das länger auf '1' gehalten werden muss bis die Daten abgeholt wurden!
        started => started, -- check
        connecting => connecting, -- check
        running => running, -- check
        errparr => errparr, -- check
        erresc => erresc, -- check
        errcred => errcred, -- check
        spw_di => spw_di, -- check
        spw_si => spw_si, -- check
        spw_do => spw_do, -- check
        spw_so => spw_so -- check
    );

    -- Update registers on rising edge of system clock. 
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            txrdy <= s_txrdy; -- readyOut (o)

        END IF;
    END PROCESS;

    -- Finite state machine.
    PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            state <= S_Idle;
            s_rxread <= '0';
            s_req_out <= '0';
            s_destport <= x"00";
            s_data_out <= (OTHERS => '0');
            s_strobe_out <= '0';
            s_RoutingTable_addr <= (OTHERS => '0');
            s_RoutingTable_req <= '0';

        ELSIF rising_edge(clk) THEN
            CASE state IS
                WHEN S_Idle =>
                    -- If receive buffer is not empty, read data from the buffer.
                    IF (s_rxvalid = '1') THEN
                        s_rxread <= '1';
                        state <= S_Dest0;
                    END IF;
                    s_strobe_out <= '0';

                WHEN S_Dest0 =>
                    -- Wait to read data from buffer.
                    s_rxread <= '0';
                    state <= S_Dest1;

                WHEN S_Dest1 =>
                    -- Confirm first data logical address or physical port address.
                    IF (s_data_out (8) = '0') THEN
                        IF (s_data_out(7 DOWNTO 5) = "000") THEN
                            -- Physical port addressed.
                            s_destport <= s_data_out(7 DOWNTO 0);
                            IF (s_data_out(7 DOWNTO 0) > STD_LOGIC_VECTOR(to_unsigned(numports, s_data_out'length))) THEN
                                -- Discard invalid addressed packet. (destination port does not exist)
                                --iPacketDropped <= '1';
                                state <= S_Dummy0;
                            ELSE
                                state <= S_Dest2;
                            END IF;
                        ELSE
                            -- Logical port is addressed. Routing table is used.
                            s_RoutingTable_addr <= s_data_out(7 DOWNTO 0);
                            s_RoutingTable_req <= '1';
                            state <= S_RT0;
                        END IF;
                    ELSE
                        -- Single EOP / EEP.
                        state <= S_Idle;
                    END IF;

                WHEN S_Dest2 =>
                    -- Transmit request to destination port.
                    FOR i IN 1 TO numports LOOP
                        s_bool_destports <= OR (linkUp(i) = '1' AND s_destport(4 DOWNTO 0) = STD_LOGIC_VECTOR(to_unsigned(i, s_destport'length)));
                    END LOOP;
                    IF ((s_destport(4 DOWNTO 0) = "00000")) OR s_bool_destports THEN
                        s_req_out <= '1';
                        state <= S_Data0;
                    ELSE
                        -- Discard invalid addressed packet.
                        state <= S_Dummy0;
                    END IF;

                WHEN S_Table0 =>
                    -- Wait acknowledge.
                    IF (busMasterAcknowledgeIn = '1') THEN
                        state <= S_RT1; -- RT == Routing table
                    END IF;

                WHEN S_RT1 =>
                    -- Logical addressing: Request to data which is read from routing table.
                    s_RoutingTable_req <= '0';

                    FOR i IN numports DOWNTO 0 LOOP
                        IF (linkUp(i) = '1' AND busMasterDataIn(i) = '1') THEN
                            s_destport <= STD_LOGIC_VECTOR(to_unsigned(i, s_destport'length));
                            s_req_out <= '1';
                            state <= S_RT2;
                        END IF;
                    END LOOP;

                    IF (state /= S_RT2) THEN -- discard invalid addressed packet if none if statement before was executed.
                        state <= S_Dummy0;
                    END IF;

                WHEN S_RT2 =>
                    -- Wait to permit (grantedIn) from arbiter (logical address access).
                    IF (grantedIn = '1') THEN
                        state <= S_Data2;
                    END IF;

                WHEN S_Data0 =>
                    -- Wait to permit (grantedIn) from arbiter (physical address access).
                    s_strobe_out <= '0';
                    IF (grantedIn = '1' AND s_rxvalid = '1') THEN
                        s_rxread <= '1';
                        state <= S_Data1;
                    END IF;

                WHEN S_Data1 =>
                    -- Wait to read from data receive buffer.
                    s_strobe_out <= '0';
                    s_rxread <= '0';
                    state <= S_Data2;

                WHEN S_Data2 =>
                    -- Send data which is read from rx buffer to destination port.
                    IF (s_rxvalid = '1') THEN
                        s_strobe_out <= '1';
                        s_data_out <= s_data_out;
                        IF (s_data_out(8) = '1') THEN
                            state <= S_Data3;
                        ELSIF (grantedIn = '1' AND s_rxvalid = '1') THEN
                            s_rxread <= '1';
                            state <= S_Data1;
                        ELSE
                            state <= S_Data0;
                        END IF;
                    END IF;

                WHEN S_Data3 =>
                    -- Complete sending to destination port.
                    s_strobe_out <= '0';
                    s_req_out <= '0';
                    state <= S_Idle;

                WHEN S_Dummy0 =>
                    -- dummy read (may block forever)
                    iPacketDropped <= '0';
                    s_req_out <= '0';
                    iWatchdogClear <= '1';
                    IF (s_rxvalid = '1') THEN
                        s_rxread <= '1';
                        state <= S_Dummy1;
                    END IF;

                WHEN S_Dummy1 =>
                    -- Wait to read data from receive buffer.
                    s_rxread <= '0';
                    state <= S_Dummy2;

                WHEN S_Dummy2 =>
                    -- Read data from receive buffer until the control flag.
                    IF (s_data_out(8) = '1') THEN
                        state <= S_Idle;
                    ELSE
                        state <= S_Dummy0;
                    END IF;

                    --when others =>  -- Eventuell durch when others => state <= S_Idle; ersetzen! (Problem der ungenutzen Zustände!)
                    --    state <= S_Idle;
            END CASE;
        END IF;
    END PROCESS;
END spwrouterport_arch;