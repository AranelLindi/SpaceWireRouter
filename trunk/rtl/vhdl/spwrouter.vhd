----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 31.07.2021 12:53
-- Design Name: SpaceWire Router Top Module
-- Module Name: spwrouter
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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
        txclkfreq : real;

        -- 2-log of division factor from system clock freq to timecode freq.
        tickdiv : INTEGER RANGE 12 TO 24 := 20;

        -- Receiver front-end implementation for every port. (Used syntax requires VHDL-2008!)
        rximpl : rximpl_array(numports DOWNTO 0) := (OTHERS => impl_generic);

        -- Maximum number of bits received per system clock (impl_fast only).
        rxchunk : INTEGER RANGE 1 TO 4 := 1;

        -- Width of shift registers for synchronization depending on transmission rate (impl_clkrec only).
        WIDTH : INTEGER RANGE 1 TO 3 := 2;

        -- Transmitter implementation for every port. (Used syntax requires VHDL-2008!)
        tximpl : tximpl_array(numports DOWNTO 0) := (OTHERS => impl_generic);

        -- Size of the receive FIFO as the 2-logarithm of the number of bytes.
        -- Must be at least 6 (64 bytes)
        rxfifosize_bits : INTEGER RANGE 6 TO 14 := 11;

        -- Size of the transmit FIFO as the 2-logarithm of the number of bytes.
        txfifosize_bits : INTEGER RANGE 2 TO 14 := 11
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
        -- More ports eventually in further development process
    );
END spwrouter;

ARCHITECTURE spwrouter_arch OF spwrouter IS
    -- Define signals here!

    -- Enthält eine 1 wenn der betreffende Port den "running"-status besitzt
    SIGNAL s_running : STD_LOGIC_VECTOR(numports DOWNTO 0);

    -- Enthält eine 1 wenn der betreffende Port einen TimeCode senden soll. (Achtung: Index verschoben! Port0 ist nicht dabei!)
    SIGNAL s_reqTimeCode : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

    -- Enthält eine 1 wenn der betreffende Port ein TimeCode empfangen hat (Achtung! Index verschoben, port0 ist nicht dabei!)
    SIGNAL s_recTimeCode : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

    -- Matrix mit TimeCodes für jeden Port (achtung! Index verschoben, ist nicht dabei!)
    SIGNAL s_TimeCodes : matrix_t((numports - 1) DOWNTO 0, 7 DOWNTO 0);

    -- Matrix mit empfangenen TimeCodes aller Ports (außer port0, index verschoben!)
    SIGNAL s_recTimeCodesList : matrix_t((numports - 1) DOWNTO 0, 7 DOWNTO 0);

    SIGNAL iSelectDestinationPort : array_t(numports DOWNTO 0)(numports DOWNTO 0); -- potenzielle fehlerquelle: im usprungscode steht hier 'gNumberOfInternalPort - 1 downto 0' -- vielleicht doch von numports-1 downto 0 ?
    SIGNAL iSwitchPortNumber : array_t(numports DOWNTO 0)(numports DOWNTO 0);

    -- Arbiter
    SIGNAL s_dest : array_t(numports DOWNTO 0)(numports DOWNTO 0); -- destinationPort
    SIGNAL s_req : STD_LOGIC_VECTOR(numports DOWNTO 0); -- requestOut
    SIGNAL s_grnt : STD_LOGIC_VECTOR(numports DOWNTO 0); -- granted
    SIGNAL s_rout : array_t(numports DOWNTO 0)(numports DOWNTO 0); -- routingSwitch
BEGIN
    -- Generate (numports-1) physical ports including port 0 (internal port)
    gen_ports : FOR i IN 1 TO numports GENERATE
        portX : spwrouterport GENERIC MAP(
            
        )
        PORT MAP(
            
        );
    END GENERATE gen_ports;

    -- Internal port 0
    port0 : spwrouterport
    GENERIC MAP(
        
    )
    PORT MAP(
        -- TODO: Hier konfigurieren!
        tick_in => '0'; -- TimeCodes in Port0 deaktivieren!
    ); -- nach und nach noch vervollständigen!

    -- Arbiter
    Arbiter : spwrouterarb
    GENERIC MAP(
        numports => numports
    )
    PORT MAP(
        clk => clk,
        rst => rst,
        dest => s_dest,
        req => s_req,
        grnt => s_grnt,
        rout => s_rout
    ); -- CHECK soweit alles!

    -- The destination PortNo regarding to the source PortNo.
    destPort : FOR i IN 0 TO numports GENERATE
        FOR j IN 0 TO numports LOOP
            -- Matrix transponieren: Potenzielle Fehlerquelle!
            iSelectDestinationPort(i, j) <= s_rout(j, i);
        END LOOP;
    END GENERATE destPort;

    -- The source to the destination PortNo PortNo.
    srcPort : FOR i IN 0 TO numports GENERATE
        iSwitchPortNumber(i) <= s_rout(i);
    END GENERATE srcPort;

    spx : --for i in 0 to numports generate -- was ist spx?
    -- glaube das brauche ich nicht, da bei mir der Port
    -- das managt.
    --end generate spx;

    -- Router Control Register here!!
    ControlRegister : spwrouterregs
    generic map (
        numports => numports
    )
    port map (
        clk => clk,
        rst => rst,
        writeData => iBusSlaveDataIn,
        readData => ibusMasterDataOut,
        readwrite => iBusSlaveWriteEnableIn,
        dByte => iBusSlaveByteEnableIn,
        addr => address,
        proc => iBusSlaveAcknowledgeOut,
        strobe => iBusSlaveStrobeIn,
        cycle => iBusSlaveWriteEnableIn, 
        portstatus => ,
        receiveTimeCode => routerTimeCode,
        autoTimeCodeValue => autoTimeCodeValue,
        autoTimeCodeCycleTime => autoTimeCodeCycleTime
    );

    -- Bus arbiter
    busArbiter : spwrouterarb_table
    GENERIC MAP(
        numports => numports
    )
    PORT MAP(
        clk => clk,
        rst => rst,
        req = >, -- nicht s_req !!
        grnt => -- muss irgendwas mit bus system sein!
    );
    -- Timing adjustmend. BusSlaveAccessSelector
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN

            -- Hier fehlt noch was


            FOR i IN numports DOWNTO 0 LOOP
                -- hier fehlt noch was

                
            END LOOP;
        END IF;
    END PROCESS;

    -- timeCode forwarding logic
    TimeCodeControl : spwroutertcc
    GENERIC MAP(
        numports => numports
    )
    PORT MAP(
        clk => clk,
        rst => rst,
        running => s_running, -- CHECK!
        lst_time = >, -- register access
        tc_en => (OTHERS => '1'), -- TimeCodes sind für alle Ports aktiviert und können nicht deaktiviert werden. Eventuell dieses Port in spwroutertcc streichen?
        tick_out => s_reqTimeCode, -- CHECK aber fehler möglich!
        time_out => s_TimeCodes, -- CHECK aber fehler möglich
        tick_in => s_recTimeCode, -- CHECK
        time_in => s_recTimeCodeList, -- CHECK aber fehler möglich
        auto_time_out => , -- register access (wird in register gespeichert)
        auto_cycle => -- register access (wird in register gespeichert)
    );
END ARCHITECTURE spwrouter_arch;