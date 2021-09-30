----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 11.08.2021 21:27
-- Design Name: SpaceWire Router Port
-- Module Name: spwrouterport
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on a FPGA
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
        -- Number of SpaceWire ports.
        numports : INTEGER RANGE 0 TO 31;

        -- Bit length to map ports.
        blen : INTEGER RANGE 0 TO 5; -- (max 5 bits for 0-31 ports)

        -- Port number.
        pnum : INTEGER RANGE 0 TO 31;

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

        -- Time-code (control bits and counter value) to be send. Must be valid when tick_in is high.
        time_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- enthält ctrl_in und time_in

        -- Control flag and data byte so to be sent. Set control flag low to send a data byte, or
        -- high and data to 0x00 to send EOP or 0x01 for EEP. Must be valid while txwrite is high.
        txdata : IN STD_LOGIC_VECTOR(8 DOWNTO 0); -- contains txflag and txdata

        -- High for one clock cycle if a time-code was just received.
        tick_out : OUT STD_LOGIC; -- check

        -- Control bits and counter value of last received time-code.
        time_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- contains ctrl_out and time_out

        -- Received byte and control flag. Control flag is high if the received character is EOP (data
        -- is 0x00) or EEP (0x01); low if received character is a data byte. Valid if rxvalid is high. 
        rxdata : OUT STD_LOGIC_VECTOR(8 DOWNTO 0); -- contains rxflag and rxdata

        -- High if the link state machine is in the started state.
        started : OUT STD_LOGIC;

        -- High if the link state machine is in the connecting state.
        connecting : OUT STD_LOGIC;

        -- High if the link state machine is in the run state, indicating that the link is operational.
        -- If started, connecting and rannung are all low, the link is in an initial state with the
        -- transmitter disabled.
        running : OUT STD_LOGIC;

        -- Disconnection detected in the run state. Triggers a link reset; auto-clearing.
        errdisc : OUT STD_LOGIC;

        -- Parity error detected in the run state. Trigger a link reset; auto-clearing.
        errpar : OUT STD_LOGIC;

        -- Invalid escape sequence detected in the run state. Triggers a link reset; auto-clearing.
        erresc : OUT STD_LOGIC;

        -- Credit error detected. Triggers a link reset; auto-clearing
        errcred : OUT STD_LOGIC;

        -- Shows which port is in the running state.
        linkUp : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Makes a data transfer request for a new packet.
        requestOut : OUT STD_LOGIC; -- requestOut

        -- Contains the binary code of the destination port of the packet.
        -- Applies to both physical and logical addressing.
        destinationPortOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- destinationPortOut

        -- The binary form (number) of the this port.
        sourcePortOut : OUT STD_LOGIC_VECTOR(blen DOWNTO 0); -- sourcePortOut

        -- High if the port gets permission for data transfer.
        grantedIn : IN STD_LOGIC; -- grantedIn

        -- Indicates whether a data transfer is currently taking place.
        strobeOut : OUT STD_LOGIC; -- strobeOut

        -- Indicates whether a data transfer is allowed to be carried out.
        readyIn : IN STD_LOGIC; -- readyIn

        -- Is used to signal in port whether writing can be done in transmission memory.
        requestIn : IN STD_LOGIC; -- requestIn

        -- Show when a data transfer takes place. High at the same time when dataOut
        -- receives a new byte.
        strobeIn : IN STD_LOGIC; -- strobeIn

        -- Indicates whether the transmission fifo is ready to accept data.
        readyOut : OUT STD_LOGIC; -- readyOut

        -- The address to access the router control register.
        busMasterAddressOut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- busMasterAddressOut

        -- Is in this entity exclusively from the routing table and contains the 
        -- assignment of a logical port to the physical output.
        busMasterDataIn : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- busMasterDataIn

        -- Data to be written into router control register. Is always 0x0000_0000.
        busMasterDataOut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- busMasterDataOut

        -- Defines which byte (1-4) in the router control register is to be 
        -- overwritten. Is always 1111.
        busMasterByteEnableOut : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- busMasterByteEnableOut

        -- High if a write process; low is a read process is to be carried out into
        -- router control register.
        busMasterWriteEnableOut : OUT STD_LOGIC; -- busMasterWriteEnableOut

        -- Shows activity / occupation of the routing table.
        busMasterStrobeOut : OUT STD_LOGIC; -- busMasterStrobeOut

        -- Indicates whether this port needs access to the routing table.
        busMasterRequestOut : OUT STD_LOGIC; -- busMasterRequestOut

        -- 
        busMasterAcknowledgeIn : IN STD_LOGIC; -- busMasterAcknowledgeIn

        -- SpaceWire data in.
        spw_di : IN STD_LOGIC; -- check

        -- SpaceWire strobe in.
        spw_si : IN STD_LOGIC; -- check

        -- SpaceWire data out.
        spw_do : OUT STD_LOGIC; -- check

        -- SpaceWire strobe out.
        spw_so : OUT STD_LOGIC -- check
    );
END spwrouterport;

ARCHITECTURE spwrouterport_arch OF spwrouterport IS
    -- Finite state machine states.
    SIGNAL state : spwrouterportstates;-- := S_Idle; -- check 

    -- Contains paket cargo only (none port addresses) -- Enthält nur Datenbytes, nicht das erste Byte das die Zielportadresse darstellt
    SIGNAL iDataOut : STD_LOGIC_VECTOR(8 DOWNTO 0);

    -- Routing Tabelle
    -- De facto logical port number (32-254).
    SIGNAL iRoutingTableAddress : STD_LOGIC_VECTOR(7 DOWNTO 0);-- := (others => '0');
    -- Anfrage an Routing Tabelle.
    SIGNAL iRoutingTableRequest : STD_LOGIC;

    -- Transmission-specific signals.
    SIGNAL iTransmitFIFOWriteEnable : STD_LOGIC; -- txwrite
    SIGNAL iTransmitFIFODataIn : STD_LOGIC_VECTOR(8 DOWNTO 0); -- txdata
    SIGNAL iTransmitFIFOReady : STD_LOGIC; -- txrdy

    -- Reception-specific signals.
    SIGNAL iReceiveFIFOReadEnable : STD_LOGIC; -- rxread
    SIGNAL iReceiveFIFOReady : STD_LOGIC; -- rxvalid
    SIGNAL receiveFIFODataOut : STD_LOGIC_VECTOR(8 DOWNTO 0);-- := (others => '0'); -- rxdata -- testweise initialisiert!

    -- Intermediate signals (werden nur an Ausgänge unter 'Drive outputs' drangehängt)
    SIGNAL iStrobeOut : STD_LOGIC;
    SIGNAL iReadyOut : STD_LOGIC;
    SIGNAL iRequestOut : STD_LOGIC;
    SIGNAL iDestinationPortOut : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL s_txrdy : STD_LOGIC;

    SIGNAL s_rxflag : STD_LOGIC; -- speichert das Flag eines packets zwischen
    SIGNAL s_rxdata : STD_LOGIC_VECTOR(7 DOWNTO 0); -- dito
BEGIN
    -- Drive outputs
    sourcePortOut <= STD_LOGIC_VECTOR(to_unsigned(pnum, sourcePortOut'length));
    destinationPortOut <= iDestinationPortOut;
    requestOut <= iRequestOut;
    strobeOut <= iStrobeOut;
    rxdata <= iDataOut; -- dataOut
    busMasterRequestOut <= iRoutingTableRequest;
    busMasterStrobeOut <= iRoutingTableRequest;
    busMasterAddressOut <= (9 DOWNTO 2 => iRoutingTableAddress, OTHERS => '0');
    busMasterWriteEnableOut <= '0';
    busMasterByteEnableOut <= (OTHERS => '1');
    busMasterDataOut <= (OTHERS => '0');

    -- Intermediate steps.
    iTransmitFIFOWriteEnable <= strobeIn WHEN requestIn = '1' ELSE
        '0';
    iTransmitFIFODataIn <= txdata; -- dataIn
    iTransmitFIFOReady <= s_txrdy;
    iReadyOut <= s_txrdy;
    
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
        ctrl_in => time_in(7 DOWNTO 6),
        time_in => time_in(5 DOWNTO 0),
        txflag => iTransmitFIFODataIn(8),
        txdata => iTransmitFIFODataIn(7 DOWNTO 0),
        txwrite => iTransmitFIFOWriteEnable,
        txrdy => s_txrdy,
        txhalff => OPEN,
        tick_out => tick_out,
        ctrl_out => time_out(7 DOWNTO 6),
        time_out => time_out(5 DOWNTO 0),
        rxvalid => iReceiveFIFOReady,
        rxhalff => OPEN,
        rxflag => s_rxflag,
        rxdata => s_rxdata,
        rxread => iReceiveFIFOReadEnable,
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

    -- Synchronous update.
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            readyOut <= iReadyOut; -- check
        END IF;
    END PROCESS;

    -- Finite state machine.
    PROCESS (clk, rst)
        VARIABLE v_validport : STD_LOGIC; -- S_Dest2; for boolean operationen
        VARIABLE v_reqports : STD_LOGIC; -- S_RT1
    BEGIN
        IF (rst = '1') THEN -- reset
            state <= S_Idle;
            iReceiveFIFOReadEnable <= '0';
            iRequestOut <= '0';
            iDestinationPortOut <= (OTHERS => '0');
            iDataOut <= (OTHERS => '0');
            iStrobeOut <= '0';
            iRoutingTableAddress <= (OTHERS => '0');
            iRoutingTableRequest <= '0';
            receiveFIFODataOut <= (OTHERS => '0');

        ELSIF rising_edge(clk) THEN
            CASE state IS
                WHEN S_Idle =>
                    -- If receive buffer is not empty, read data from the buffer.
                    IF (iReceiveFIFOReady = '1') THEN
                        iReceiveFIFOReadEnable <= '1'; -- rxread

                        state <= S_Dest0;

                    END IF;

                    iStrobeOut <= '0';

                WHEN S_Dest0 =>
                    -- Wait to read data from buffer.
                    receiveFIFODataOut(8) <= s_rxflag; -- per Handshake übernehmen
                    receiveFIFODataOut(7 DOWNTO 0) <= s_rxdata;
                    iReceiveFIFOReadEnable <= '0'; -- rxread
                    state <= S_Dest1;

                WHEN S_Dest1 =>
                    -- Confirm first data logical address or physical port address.

                    IF (receiveFIFODataOut(8) = '0') THEN -- vorher: receiveFIFODataOut(8)
                        IF (receiveFIFODataOut(7 DOWNTO 5) = "000") THEN
                            -- Physical port addressed.
                            iDestinationPortOut <= receiveFIFODataOut(7 DOWNTO 0); -- enthält die Portnummer als erstes Byte eines Pakets!!

                            IF (unsigned(receiveFIFODataOut(7 DOWNTO 0)) > numports) THEN
                                -- Discard invalid addressed packet. (destination port does not exist)
                                state <= S_Dummy0;

                            ELSE
                                state <= S_Dest2;

                            END IF;
                        ELSE
                            -- Logical port is addressed. Send request to routing table to get port assignment.
                            iRoutingTableAddress <= receiveFIFODataOut(7 DOWNTO 0);
                            iRoutingTableRequest <= '1';
                            state <= S_RT0;

                        END IF;
                    ELSE
                        -- Single EOP / EEP.
                        state <= S_Idle;

                    END IF;

                WHEN S_Dest2 =>
                    -- Reset variable for new iteration.
                    v_validport := '0';

                    -- Transmit request to destination port.
                    FOR i IN 1 TO numports LOOP
                        IF (linkUp(i) = '1' AND iDestinationPortOut(blen DOWNTO 0) = STD_LOGIC_VECTOR(to_unsigned(i, blen + 1))) THEN
                            v_validport := '1'; -- potenzielle Fehlerquelle mit blen+1 !! Im Original Code werden hier 5 Bits (4 downto 0) abgefragt. falls blen == 4 ist, muss folglich blen+1 für 5 gelten!
                        END IF;
                    END LOOP;

                    IF ((iDestinationPortOut(blen DOWNTO 0) = STD_LOGIC_VECTOR(to_unsigned(0, blen + 1))) OR (v_validport = '1')) THEN
                        iRequestOut <= '1';
                        state <= S_Data0;

                    ELSE
                        -- Discard invalid addressed packet.
                        state <= S_Dummy0;

                    END IF;

                WHEN S_RT0 =>
                    -- Wait acknowledge. (Hat wohl was damit zu tun, dass die gewünschte Information von der RT eingetroffen ist)
                    IF (busMasterAcknowledgeIn = '1') THEN
                        state <= S_RT1; -- RT == Routing table

                    END IF;

                WHEN S_RT1 =>
                    -- Logical addressing: Request to data which is read from routing table.
                    iRoutingTableRequest <= '0';

                    -- Reset variable for new iteration.
                    v_reqports := '0';

                    -- Changed priority!
                    FOR i IN numports DOWNTO 0 LOOP
                        IF (linkUp(i) = '1' AND busMasterDataIn(i) = '1') THEN
                            iDestinationPortOut <= STD_LOGIC_VECTOR(to_unsigned(i, iDestinationPortOut'length));
                            iRequestOut <= '1';
                            state <= S_RT2;

                            -- Variable to compare in same cycle whether a port can be selected at all.
                            v_reqports := '1';

                        END IF;
                    END LOOP;

                    IF (v_reqports = '0') THEN -- discard invalid addressed packet if none 'if-statement' before was executed.
                        state <= S_Dummy0;

                    END IF;

                WHEN S_RT2 =>
                    -- Wait to permit (grnt) from arbiter (logical address access).
                    IF (grantedIn = '1') THEN
                        state <= S_Data2;

                    END IF;

                WHEN S_Data0 =>
                    -- Wait to permit (grnt) from arbiter (physical address access).
                    iStrobeOut <= '0';

                    IF (grantedIn = '1' AND iReceiveFIFOReady = '1') THEN
                        iReceiveFIFOReadEnable <= '1';
                        state <= S_Data1;

                    END IF;

                WHEN S_Data1 =>
                    -- Wait to read from data receive buffer.
                    iStrobeOut <= '0';

                    receiveFIFODataOut(8) <= s_rxflag; -- per Handshake übernehmen
                    receiveFIFODataOut(7 DOWNTO 0) <= s_rxdata;

                    iReceiveFIFOReadEnable <= '0';
                    state <= S_Data2;

                WHEN S_Data2 =>
                    -- Send data which is read from rx buffer to destination port.
                    IF (readyIn = '1') THEN
                        iStrobeOut <= '1';
                        iDataOut <= receiveFIFODataOut;
                        IF (receiveFIFODataOut(8) = '1') THEN
                            -- EOP/EEP, packet is finished.
                            state <= S_Data3;

                        ELSIF (grantedIn = '1' AND iReceiveFIFOReady = '1') THEN
                            -- Continue reading bytes according to this packet.
                            iReceiveFIFOReadEnable <= '1';
                            state <= S_Data1;

                        ELSE
                            -- None further byte available yet, wait for it or an EOP/EEP.
                            state <= S_Data0;

                        END IF;
                    END IF;

                WHEN S_Data3 =>
                    -- Complete sending to destination port.
                    iStrobeOut <= '0';
                    iRequestOut <= '0';
                    state <= S_Idle;

                WHEN S_Dummy0 =>
                    -- Dummie-states are there to throw away packets that cannot be delivered.
                    -- dummy read (may block forever)
                    iRequestOut <= '0';

                    IF (iReceiveFIFOReady = '1') THEN
                        iReceiveFIFOReadEnable <= '1';
                        state <= S_Dummy1;

                    END IF;

                WHEN S_Dummy1 =>
                    -- Wait to read data from receive buffer.

                    receiveFIFODataOut(8) <= s_rxflag; -- take over by handshake mechanism
                    receiveFIFODataOut(7 DOWNTO 0) <= s_rxdata;

                    iReceiveFIFOReadEnable <= '0';
                    state <= S_Dummy2;

                WHEN S_Dummy2 =>
                    -- Read data from receive buffer until the control flag.
                    IF (receiveFIFODataOut(8) = '1') THEN -- vorher: receiveFIFODataOut(8)
                        state <= S_Idle;

                    ELSE
                        state <= S_Dummy0;

                    END IF;

                    --WHEN OTHERS => -- Because of unused state problem.
                    --    state <= S_Idle;
            END CASE;
        END IF;
    END PROCESS;
END spwrouterport_arch;