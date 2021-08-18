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
        blen : INTEGER RANGE 0 TO 4; -- (max 5 bits for 0-31 ports)

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
        clk : IN STD_LOGIC; -- clock -- fertig

        -- Receiver sample clock (only for impl_fast)
        rxclk : IN STD_LOGIC; -- receiveclock -- fertig

        -- Transmit clock (only for impl_fast)
        txclk : IN STD_LOGIC; -- transmitclock -- fertig

        -- Synchronous reset (active-high).
        rst : IN STD_LOGIC; -- reset -- fertig

        -- Enables automatic link start on receipt of a NULL character.
        autostart : IN STD_LOGIC; -- autoStart -- fertig

        -- Enables link start once the Ready state is reached.
        -- Without autostart or linkstart, the link remains in state Ready.
        linkstart : IN STD_LOGIC; -- linkStart -- fertig

        -- Do not start link (overrides linkstart and autostart) and/or
        -- disconnect a running link.
        linkdis : IN STD_LOGIC; -- linkDisable -- fertig

        -- Scaling factor minus 1, used to scale the transmit base clock into
        -- the transmission bit rate. The system clock (for impl_generic) or
        -- the txclk (for impl_fast) is divided by (unsigned(txdivcnt) + 1).
        -- Changing this signal will immediately change the transmission rate.
        -- During link setup, the transmission rate is always 10 Mbit/s.
        txdivcnt : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- transmitClockDivide -- fertig

        -- High for one clock cycle to request transmission of a TimeCode.
        -- The request is registered inside the entity until it can be processed.
        tick_in : IN STD_LOGIC; -- tickIn -- fertig

        time_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- enthält ctrl_in und time_in -- fertig

        --txwrite : IN STD_LOGIC; -- Port eventuell nicht benötigt

        txdata : IN STD_LOGIC_VECTOR(8 DOWNTO 0); -- enthält txflag und txdata -- fertig

        --txrdy : OUT STD_LOGIC; -- Port eventuell nicht benötigt

        tick_out : OUT STD_LOGIC; -- fertig

        time_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- enthält ctrl_out und time_out -- fertig

        --rxvalid : OUT STD_LOGIC; -- Port eventuell nicht benötigt

        rxdata : OUT STD_LOGIC_VECTOR(8 DOWNTO 0); -- enthält rxflag und rxdata -- fertig

        --rxread : IN STD_LOGIC; -- Port eventuell nicht benötigt

        started : OUT STD_LOGIC; -- fertig

        connecting : OUT STD_LOGIC; -- fertig

        running : OUT STD_LOGIC; -- fertig

        errparr : OUT STD_LOGIC; -- fertig

        erresc : OUT STD_LOGIC; -- fertig

        errcred : OUT STD_LOGIC; -- fertig

        linkUp : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

        req_out : OUT STD_LOGIC; -- requestOut

        destport : OUT STD_LOGIC_VECTOR(numports DOWNTO 0); -- destinationPortOut

        srcport : OUT STD_LOGIC_VECTOR(numports DOWNTO 0); -- sourcePortOut

        grnt : IN STD_LOGIC; -- grantedIn

        busy_out : OUT STD_LOGIC; -- strobeOut

        --rdy_in : IN STD_LOGIC; -- readyIn -- wird eventuell nicht gebraucht

        req_in : IN STD_LOGIC; -- requestIn

        busy_in : IN STD_LOGIC; -- strobeIn

        --rdy_out : OUT STD_LOGIC; -- readyOut -- wird eventuell nicht gebraucht

        baddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- busMasterAddressOut

        bdat_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- busMasterDataIn

        bdat_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- busMasterDataOut

        dByte : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- busMasterByteEnableOut

        readwrite : OUT STD_LOGIC; -- busMasterWriteEnableOut

        bstrobe : OUT STD_LOGIC; -- busMasterStrobeOut

        breq_out : OUT STD_LOGIC; -- busMasterRequestOut

        bproc : IN STD_LOGIC; -- busMasterAcknowledgeIn

        spw_di : IN STD_LOGIC; -- fertig

        spw_si : IN STD_LOGIC; -- fertig

        spw_do : OUT STD_LOGIC; -- fertig

        spw_so : OUT STD_LOGIC -- fertig
    );
END spwrouterport;

ARCHITECTURE spwrouterport_arch OF spwrouterport IS
    -- Finite state machine states.
    SIGNAL state : spwrouterportstates := S_Idle; -- check 

    -- SpaceWire Buffer Status/Control
    SIGNAL s_txwrite : STD_LOGIC; -- check -- iTransmitFIFOWriteEnable -- MUSS NOCH VERKABELT WERDEN
    signal s_txrdy : std_logic; -- iTransmitFIFOReady;; kein äquivalent; High wenn bereit für Aufnahme von transmit daten in queue. -- MUSS NOCH VERKABELT WERDEN

    SIGNAL s_rxread : STD_LOGIC; -- check -- iReceiveFIFOReadEnable

    -- Daten für der Ausgabeport:
    SIGNAL s_rxdata : STD_LOGIC_VECTOR(8 DOWNTO 0); -- check -- iDataOut
    -- Daten die als nächstes in Transmit Queue geschrieben werden sollen:
    signal s_rxdata_buffer: std_logic_vector(8 downto 0); -- receiveFIFODataOut



    SIGNAL s_req_out : STD_LOGIC; -- check -- iRequestOut
    SIGNAL s_destport : STD_LOGIC_VECTOR(7 DOWNTO 0); -- check -- iDestinationPortOut
    SIGNAL s_strobe_out : STD_LOGIC; -- check -- iStrobeOut
    SIGNAL s_rout_addr : STD_LOGIC_VECTOR(7 DOWNTO 0); -- check -- iRoutingTableAddress
    SIGNAL s_rout_req : STD_LOGIC; -- check -- iRoutingTableRequest
    --
    -- Eigene Signale
    SIGNAL s_bool_destports : STD_LOGIC; -- check
    SIGNAL s_rxvalid : STD_LOGIC; -- check
BEGIN
    -- Drive outputs
    srcport <= STD_LOGIC_VECTOR(to_unsigned(portnum, srcport'length)); -- check
    destport <= s_destport; -- check
    req_out <= s_req_out; -- check
    busy_out <= s_strobe_out; -- check
    rxdata <= s_rxdata; -- check
    (breq_out, bstrobe) <= s_rout_req; -- check
    baddr <= x"0000" & "000000" & s_rout_addr & "00";
    readwrite <= '0'; -- read
    dByte <= "1111";
    bdat_out <= (OTHERS => '0'); -- Hä? Wird nirgends sonst geändert?!
    -- busMaster... signale erst umbennenen wenn deren bedeutung eindeutig geklärt ist!!

    -- Intermediate steps. (16.08.21)
    s_txwrite <= busy_in when req_in = '1' else '0'; -- vorläufig check (genauso wie original)

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
        ctrl_in => time_in(7 DOWNTO 6), -- check
        time_in => time_in(5 DOWNTO 0), -- check
        txflag => txdata(8), -- check
        txwrite => s_txwrite, -- vorläufig check
        txdata => txdata(7 DOWNTO 0), -- check
        txrdy => OPEN, -- wir u.U. nicht benötigt, da kein Workaround für nicht annehmbare Datenpakete durch den Transmit FIFO existiert und deshalb die Abfrage dieses Signals keinen Sinn macht.
        txhalff => OPEN, -- check
        tick_out => tick_out, -- check
        ctrl_out => time_out(7 DOWNTO 6), -- check
        time_out => time_out(5 DOWNTO 0), -- check
        rxvalid => s_rxvalid, -- check
        rxhalff => OPEN, -- check
        rxflag => s_rxdata_buffer(8), -- check
        rxdata => s_rxdata_buffer(7 DOWNTO 0), -- check
        rxread => s_rxread, -- check
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

    -- Synchronous update. -- Auskommentiert, da rdy_out / readyOut augenscheinlich nicht benötigt wird
--    PROCESS (clk)
--    BEGIN
--        IF rising_edge(clk) THEN
--            rdy_out <= s_txrdy; -- check
--        END IF;
--    END PROCESS;

    -- Finite state machine.
    PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            state <= S_Idle;
            s_rxread <= '0';
            s_req_out <= '0';
            s_destport <= x"00";
            s_rxdata <= (OTHERS => '0');
            s_strobe_out <= '0';
            s_rout_addr <= (OTHERS => '0');
            s_rout_req <= '0';

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
                    IF (s_rxdata_buffer (8) = '0') THEN
                        IF (s_rxdata_buffer(7 DOWNTO 5) = "000") THEN
                            -- Physical port addressed.
                            s_destport <= s_rxdata_buffer(7 DOWNTO 0); -- enthält die Portnummer als erstes Byte eines Pakets!!
                            IF (s_rxdata_buffer(7 DOWNTO 0) > STD_LOGIC_VECTOR(to_unsigned(numports, s_rxdata_buffer'length))) THEN
                                -- Discard invalid addressed packet. (destination port does not exist)
                                state <= S_Dummy0;
                            ELSE
                                state <= S_Dest2;
                            END IF;
                        ELSE
                            -- Logical port is addressed. Routing table is used.
                            s_rout_addr <= s_rxdata_buffer(7 DOWNTO 0);
                            s_rout_req <= '1';
                            state <= S_RT0;
                        END IF;
                    ELSE
                        -- Single EOP / EEP.
                        state <= S_Idle;
                    END IF;

                WHEN S_Dest2 =>
                    -- Transmit request to destination port.
                    FOR i IN 1 TO numports LOOP
                        s_bool_destports <= OR (linkUp(i) = '1' AND s_destport(blen DOWNTO 0) = STD_LOGIC_VECTOR(to_unsigned(i, s_destport'length)));
                    END LOOP;

                    IF ((s_destport(blen DOWNTO 0) = STD_LOGIC_VECTOR(to_unsigned(0, s_destport'length)))) OR s_bool_destports THEN
                        s_req_out <= '1';
                        state <= S_Data0;
                    ELSE
                        -- Discard invalid addressed packet.
                        state <= S_Dummy0;
                    END IF;

                WHEN S_Table0 =>
                    -- Wait acknowledge.
                    IF (bproc = '1') THEN
                        state <= S_RT1; -- RT == Routing table
                    END IF;

                WHEN S_RT1 =>
                    -- Logical addressing: Request to data which is read from routing table.
                    s_rout_req <= '0';

                    FOR i IN numports DOWNTO 0 LOOP
                        IF (linkUp(i) = '1' AND bdat_in(i) = '1') THEN
                            s_destport <= STD_LOGIC_VECTOR(to_unsigned(i, s_destport'length));
                            s_req_out <= '1';
                            state <= S_RT2;
                        END IF;
                    END LOOP;

                    IF (state /= S_RT2) THEN -- discard invalid addressed packet if none if statement before was executed.
                        state <= S_Dummy0;
                    END IF;

                WHEN S_RT2 =>
                    -- Wait to permit (grnt) from arbiter (logical address access).
                    IF (grnt = '1') THEN
                        state <= S_Data2;
                    END IF;

                WHEN S_Data0 =>
                    -- Wait to permit (grnt) from arbiter (physical address access).
                    s_strobe_out <= '0';
                    IF (grnt = '1' AND s_rxvalid = '1') THEN
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
                        s_rxdata <= s_rxdata_buffer;
                        IF (s_rxdata_buffer(8) = '1') THEN
                            state <= S_Data3;
                        ELSIF (grnt = '1' AND s_rxvalid = '1') THEN
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
                    IF (s_rxdata_buffer(8) = '1') THEN
                        state <= S_Idle;
                    ELSE
                        state <= S_Dummy0;
                    END IF;

                when others =>  -- Because of unused state problem.
                    state <= S_Idle;
            END CASE;
        END IF;
    END PROCESS;
END spwrouterport_arch;