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
-- Description: 
--
-- Dependencies: none
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
--USE work.spwpkg.ALL;
USE WORK.SPWROUTERPKG.ALL;

ENTITY spwrouter IS
    GENERIC (
        -- Number of SpaceWire ports.
        numports : INTEGER RANGE 0 TO 31;

        -- System clock frequency in Hz.
        sysfreq : real;

        -- txclk frequency in Hz (if tximpl = impl_fast)
        txclkfreq : real
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

        -- Data In signal from SpaceWire bus.
        spw_di : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Strobe In signal from SpaceWire bus.
        spw_si : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Data Out signal from SpaceWire bus.
        spw_do : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Strobe Out signal from SpaceWire bus.
        spw_so : OUT STD_LOGIC_VECTOR(numports DOWNTO 0)
    );
END spwrouter;

ARCHITECTURE spwrouter_arch OF spwrouter IS
    -- Enthält eine 1 wenn der betreffende Port einen TimeCode senden soll. (Achtung: Index verschoben! Port0 ist nicht dabei!)
    SIGNAL s_tick_out : STD_LOGIC_VECTOR(0 TO (numports - 1)); -- check

    -- Enthält eine 1 wenn der betreffende Port ein TimeCode empfangen hat (Achtung! Index verschoben, port0 ist nicht dabei!)
    SIGNAL s_tick_in : STD_LOGIC_VECTOR(0 TO (numports - 1)); -- check

    -- Matrix mit TimeCodes für jeden Port (achtung! Index verschoben, ist nicht dabei!)
    SIGNAL s_time_out : array_t(0 TO (numports - 1))(7 DOWNTO 0); -- check

    -- Matrix mit empfangenen TimeCodes aller Ports (außer port0, index verschoben!)
    SIGNAL s_time_in : matrix_t(0 TO (numports - 1), 7 DOWNTO 0); -- check

    SIGNAL iSelectDestinationPort : array_t(0 TO numports)(numports DOWNTO 0); -- check -- potenzielle fehlerquelle: im usprungscode steht hier 'gNumberOfInternalPort - 1 downto 0' -- vielleicht doch von numports-1 downto 0 ?
    
    SIGNAL iSwitchPortNumber : array_t(0 TO numports)(numports DOWNTO 0); -- check


    -- Dateneingang für Port.
    signal iDataIn : array_t(0 to numports)(8 downto 0); -- check -- txdata
    signal iDataOut : array_t(0 to numports)(8 downto 0); -- check -- rxdata


    -- Register Port Status
    signal s_prtstat : array_t(0 to 31)(31 downto 0) := (others => (others => '0'));
    signal iBusMasterDataOut : std_logic_vector(31 downto 0);
    signal iBusSlaveAcknowledgeOut : std_logic;
    signal iBusSlaveAddressIn : std_logic_vector(31 downto 0);
    signal iBusSlaveStrobeIn: std_logic;
    signal iBusSlaveCycleIn : std_logic;
    signal iBusSlaveWriteEnableIn : std_logic;
    signal iBusSlaveByteEnableIn: std_logic_vector(3 downto 0);
    signal iBusSlaveOriginalPort: std_logic_vector(numports downto 0);
    signal iBusSlaveDataIn: std_logic_vector(31 downto 0);


    signal busSlaveDataOut : std_logic_vector(31 downto 0);



    signal busMasterAddressOut : array_t(0 to numports)(31 downto 0);

    signal busMasterDataOut : array_t(0 TO numports)(31 downto 0);

    signal busMasterByteEnableOut : array_t(0 to numports)(3 downto 0);


    signal busMasterWriteEnableOut : std_logic_vector(0 TO numports);

    signal busMasterStrobeOut : std_logic_vector(0 to numports);

    signal busMasterAcknowledgeIn: std_logic_vector(0 to numports);


    -- Arbiter
    SIGNAL iLinkUp : STD_LOGIC_VECTOR(numports DOWNTO 0);
    -- spwrouterarb_table
    SIGNAL busMasterRequestOut : STD_LOGIC_VECTOR(0 TO numports);
    SIGNAL busMasterGranted : STD_LOGIC_VECTOR(numports DOWNTO 0);

    SIGNAL s_dest : array_t(0 TO numports)(numports DOWNTO 0); -- check -- destinationPort
    SIGNAL s_req_out : STD_LOGIC_VECTOR(numports downto 0); -- check -- requestOut
    signal s_req_in : std_logic_vector(numports downto 0); -- chec -- requestIn
    SIGNAL s_grnt : STD_LOGIC_VECTOR(numports DOWNTO 0); -- check -- granted
    SIGNAL s_rout : array_t(numports DOWNTO 0)(numports DOWNTO 0); -- check -- routingSwitch


    signal s_src : array_t(0 TO numports)(numports downto 0); -- sourcePortOut (sorcePortrOut)

    signal s_busy_out : std_logic_vector(numports downto 0); -- strobeOut
    signal s_busy_in : std_logic_vector(numports downto 0); -- strobeIn

    -- timecode (timecode control -> register)
    SIGNAL s_lst_time : STD_LOGIC_VECTOR(7 DOWNTO 0); -- check
    SIGNAL autoTimeCodeValue : STD_LOGIC_VECTOR(7 DOWNTO 0); -- check
    SIGNAL autoTimeCodeCycleTime : STD_LOGIC_VECTOR(31 DOWNTO 0); -- check

BEGIN
    -- Generate (numports-1) physical ports (excluding port0).
    ports : FOR i IN 1 TO numports GENERATE
        portx : spwrouterport GENERIC MAP(

        )
        PORT MAP(
            clk => clk, -- check
            rxclk => rxclk, -- check
            txclk => txclk, -- check
            rst => rst, -- check
            autostart => '1', -- check -- autostart is always active
            linkstart => '0', -- check
            linkdis => '0', -- check -- link disabling is always deactivated
            txdivcnt => s_prtstat(i)(15 downto 0), -- check aber eventuell wieder auf "00000000" setzen weil unnötig
            tick_in => s_tick_in(i - 1), -- check (-1, weil index verschoben; port0 ist nicht dabei!)
            time_in => s_time_out(i - 1), -- check
            txdata => iDataIn(i), -- check -- enthält flag und daten (9 bits)
            tick_out => s_tick_out(i - 1), -- check (-1, weil index verschoben; port0 ist nicht dabei!)
            time_out => s_time_in(i - 1), -- check (-1, ...)
            rxdata => iDataOut(i), -- check -- enthält flag und daten (9 bits) 
            started => s_prtstat(i)(24), -- check
            connecting => s_prtstat(i)(25), -- check
            running => (iLinkUp(i), s_prtstat(i)(26)), -- check, falls syntax ok ist
            errparr => s_prtstat(i)(27), -- check
            erresc => s_prtstat(i)(28), -- check
            errcred => s_prtstat(i)(29), -- check
            linkUp => iLinkUp, -- (eingang) -- check
            req_out => s_req_out(i), -- check
            destport => s_dest(i), -- check
            srcport => s_src(i), -- check
            grnt => s_grnt(i), -- check
            busy_out => s_busy_out(i),
            req_in => s_req_in(i), -- check
            busy_in => s_busy_in(i), -- check
            baddr => busMasterAddressOut(i), -- check
            bdat_in => busSlaveDataOut, -- check
            bdat_out => busMasterDataOut(i), -- check
            dByte => busMasterByteEnableOut(i), -- check
            readwrite => busMasterWriteEnableOut(i), -- check
            bstrobe => busMasterStrobeOut(i), -- check
            breq_out => busMasterRequestOut(i), -- check
            bproc => busMasterAcknowledgeIn(i), -- check
            spw_di => spw_di(i), -- check
            spw_si => spw_si(i), -- check
            spw_do => spw_do(i), -- check
            spw_so => spw_so(i) -- check
        );
    END GENERATE ports;

    -- Timing adjustment.
    -- BusSlaveAccessSelector.
    PROCESS (clk)
        SIGNAL s_bool_busMasterRequestOut : STD_LOGIC;
    BEGIN
        IF rising_edge(clk) THEN
            FOR i IN 0 TO numports LOOP
                s_bool_busMasterRequestOut <= OR (busMasterRequestOut(i) = '1');
            END LOOP;

            IF (s_bool_busMasterRequestOut = '1') THEN
                iBusSlaveCycleIn <= '1';
            ELSE
                iBusSlaveCycleIn <= '0';
            END IF;

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
            IF (busMasterGranted(0) = '1') THEN
                iBusSlaveStrobeIn <= busMasterStrobeOut(0);
                iBusSlaveAddressIn <= busMasterAddressOut(0);
                iBusSlaveByteEnableIn <= busMasterByteEnableOut(0);
                iBusSlaveWriteEnableIn <= busMasterWriteEnableOut(0);
                iBusSlaveOriginalPortIn <= busMasterOriginalPortOut(0);
                iBusSlaveDataIn <= busMasterDataOut(0);
                busMasterAcknowledgeIn <= (0 => iBusSlaveAcknowledgeOut, OTHERS => '0');
            END IF;

            busSlaveDataOut <= ibusMasterDataOut;
            busMasterUserDataOut <= ibusMasterDataOut; -- kann womöglich gelöscht werden; warum?
            busMasterUserAcknowledgeOut <= iBusMasterUserAcknowledgeOut;
        END IF;
    END PROCESS;

    -- Internal port 0
    port0 : spwrouterport
    GENERIC MAP(

    )
    PORT MAP(
        spw_di => spw_di(0),
        spw_si => spw_si(0),
        spw_do => spw_do(0),
        spw_so => spw_so(0)
    ); -- nach und nach noch vervollständigen!

    -- Arbiter
    Arbiter : spwrouterarb
    GENERIC MAP(
        numports => numports
    )
    PORT MAP(
        clk => clk, -- check
        rst => rst, -- check
        dest => s_dest, -- check
        req => s_req_out, -- check
        grnt => s_grnt, -- check
        rout => s_rout -- check
    ); -- CHECK

    -- The destination PortNo regarding to the source PortNo.
    destPort : FOR i IN 0 TO numports GENERATE
        FOR j IN 0 TO numports LOOP
            -- Matrix transponieren: Potenzielle Fehlerquelle!
            iSelectDestinationPort(i, j) <= s_rout(j, i);
        END LOOP;
    END GENERATE destPort; -- check (vorläufig)

    -- The source to the destination PortNo PortNo.
    srcPort : FOR i IN 0 TO numports GENERATE
        iSwitchPortNumber(i) <= s_rout(i);
    END GENERATE srcPort; -- check (vorläufig)

    --spx : --for i in 0 to numports generate -- was ist spx?
    -- glaube das brauche ich nicht, da bei mir der Port
    -- das managt.
    --end generate spx;

    -- Router Control Register here!!
    ControlRegister : spwrouterregs
    GENERIC MAP(
        numports => numports
    )
    PORT MAP(
        clk => clk, -- check
        rst => rst, -- check
        writeData => iBusSlaveDataIn, -- check
        readData => iBusMasterDataOut, -- check
        readwrite => iBusSlaveWriteEnableIn, -- check
        dByte => iBusSlaveByteEnableIn, -- check
        addr => iBusSlaveAddressIn, -- check
        proc => iBusSlaveAcknowledgeOut, -- check
        strobe => iBusSlaveStrobeIn, -- check
        cycle => iBusSlaveWriteEnableIn, -- check
        portstatus => s_prtstat, -- check
        receiveTimeCode => s_lst_time, -- check
        autoTimeCodeValue => autoTimeCodeValue, -- check
        autoTimeCodeCycleTime => autoTimeCodeCycleTime -- check
    ); -- vorläufiger check

    -- Bus arbiter
    busArbiter : spwrouterarb_table
    GENERIC MAP(
        numports => numports
    )
    PORT MAP(
        clk => clk, -- check
        rst => rst, -- check
        req => busMasterRequestOut, -- check (achtung, nicht s_req_out!)
        grnt => busMasterGranted -- check
    ); -- check

    -- timeCode forwarding logic
    TimeCodeControl : spwroutertcc
    GENERIC MAP(
        numports => numports
    )
    PORT MAP(
        clk => clk, -- check
        rst => rst, -- check
        running => iLinkUp, -- CHECK!
        lst_time => s_lst_time, -- check
        tc_en => (OTHERS => '1'), -- TimeCodes sind für alle Ports aktiviert und können nicht deaktiviert werden.
        tick_out => s_tick_out, -- CHECK
        time_out => s_time_out, -- check
        tick_in => s_tick_in, -- check
        time_in => s_recTimeCodeList, -- CHECK aber fehler möglich
        auto_time_out => autoTimeCodeValue, -- check
        auto_cycle => autoTimeCodeCycleTime -- check
    ); -- check
END ARCHITECTURE spwrouter_arch;