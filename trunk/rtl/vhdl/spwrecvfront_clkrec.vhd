----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 03.06.2021 21:42
-- Design Name: Clock Recovery Front-End Module for SpaceWire Light IP Core
-- Module Name: spwrecvfront_clkrec
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on a FPGA
-- Target Devices: 
-- Tool Versions: Created for SpW Light IP Core Version from 05.12.2018
-- Description: extracts a clock pulse from the Data-Strobe signals of a SpaceWire
-- connection (clock recovery) and uses it to decode the data input bits and forwards them
-- to the receiver module of the IP Core.
--
-- Dependencies: SpaceWire Light IP Core from https://opencores.org/projects/spacewire_light
-- 
-- Revision:
-- Revision 0.1 - Behavior and Timing Simulation worked, not yet tested on Hardware
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY spwrecvfront_clkrec IS
    GENERIC (
        -- Width of shift registers for synchronization (depending on
        -- bitrate to avoid metastability)
        -- Default Value: 2
        WIDTH : INTEGER RANGE 1 TO 3
    );
    PORT (
        -- System clock (for Validation of recovered clock signal).
        clk : IN STD_LOGIC;

        -- Data In signal from SpaceWire bus.
        spw_di : IN STD_LOGIC;

        -- Strobe In signal from SpaceWire bus.
        spw_si : IN STD_LOGIC;

        -- High to enable receiver; low to disable and reset receiver
        rxen : IN STD_LOGIC;

        -- High if there has been recent activity on the input lines.
        inact : OUT STD_LOGIC;

        -- High if inbits contains a valid received bit.
        -- If inbvalid='1', the application must sample inbits on
        -- the rising edge of clk.
        inbvalid : OUT STD_LOGIC;

        -- Received bit.
        inbits : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
    );
END spwrecvfront_clkrec;

ARCHITECTURE spwrecvfront_clkrec_arch OF spwrecvfront_clkrec IS
    -- recovered clock signal.
    SIGNAL recclk : STD_ULOGIC;

    -- asynchronous phased switching (Latch)...
    -- ... for rising edges.
    --  Latch 1: (Equal)
    SIGNAL ff_EQ_data : STD_ULOGIC;
    -- Set
    SIGNAL s_EQ_set : STD_ULOGIC;
    -- Reset
    SIGNAL s_EQ_reset : STD_ULOGIC;

    -- ... for falling edges. 
    --  Latch 2: (Unequal)
    SIGNAL ff_UEQ_data : STD_ULOGIC;
    -- Set
    SIGNAL s_UEQ_set : STD_ULOGIC;
    -- Reset
    SIGNAL s_UEQ_reset : STD_ULOGIC;

    -- Data In - shift registers...
    -- ... for rising edges
    SIGNAL ff_rising_data : STD_ULOGIC_VECTOR((WIDTH - 1) DOWNTO 0);

    -- ... for falling edges
    --  One ff is activated on falling edge ...
    SIGNAL ff_falling_data_0 : STD_ULOGIC;
    -- ... rest on rising edge
    SIGNAL ff_falling_data : STD_ULOGIC_VECTOR((WIDTH - 2) DOWNTO 0);

    -- output register (receiver signal)
    SIGNAL s_inbvalid : STD_ULOGIC;
BEGIN

    -- Clock recovery process.
    ClkRec : recclk <= spw_di XOR spw_si;

    -- Drive outputs
    inact <= s_inbvalid;
    inbvalid <= s_inbvalid;

    -- Latch 1: Data XNOR Strobe
    s_EQ_set <= '1' WHEN (spw_di = '1' AND spw_si = '1') ELSE
        '0';
    s_EQ_reset <= '1' WHEN (spw_di = '0' AND spw_si = '0') ELSE
        '0';
    Latch1 : PROCESS (s_EQ_set, s_EQ_reset)
    BEGIN
        IF (s_EQ_reset = '1') THEN
            -- Reset
            ff_EQ_data <= '0';

        ELSIF (s_EQ_set = '1') THEN
            -- Set
            ff_EQ_data <= '1';

        END IF;
    END PROCESS;

    -- Latch 2: Data XOR Strobe
    s_UEQ_set <= '1' WHEN (spw_di = '1' AND spw_si = '0') ELSE
        '0';
    s_UEQ_reset <= '1' WHEN (spw_di = '0' AND spw_si = '1') ELSE
        '0';
    Latch2 : PROCESS (s_UEQ_set, s_UEQ_reset)
    BEGIN
        IF (s_UEQ_reset = '1') THEN
            -- Reset
            ff_UEQ_data <= '0';

        ELSIF (s_UEQ_set = '1') THEN
            -- Set
            ff_UEQ_data <= '1';

        END IF;
    END PROCESS;

    -- Validates recclk-signal for receiver.
    ClkRecValidation : PROCESS (clk)
        VARIABLE switch : BOOLEAN; -- (default value: false)
    BEGIN
        -- Detects clock edge change in recclk and activates then
        -- the signal for a valid received bit.
        IF rising_edge(clk) THEN
            IF switch = true THEN
                IF recclk = '1' THEN
                    switch := NOT switch;

                    IF rxen = '1' THEN
                        s_inbvalid <= '1';
                        -- (else case not necessary!)
                    END IF;

                ELSE
                    -- reset receiver
                    s_inbvalid <= '0';

                END IF;
            ELSIF switch = false THEN
                IF recclk = '0' THEN
                    switch := NOT switch;

                    IF rxen = '1' THEN
                        s_inbvalid <= '1';
                        -- (else case not necessary!)
                    END IF;

                ELSE
                    -- reset receiver
                    s_inbvalid <= '0';

                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- Drives shift registers on rising clock edge.
    ClkRecRisingEdge : PROCESS (recclk)
    BEGIN
        IF rising_edge(recclk) THEN
            -- shift register construct
            ff_rising_data(0) <= ff_EQ_data;

            FOR i IN 0 TO (WIDTH - 2) LOOP
                ff_rising_data(i + 1) <= ff_rising_data(i);
            END LOOP;

            -- generic shift register construct
            IF (WIDTH > 1) THEN -- (pre-compiled statement)
                ff_falling_data(0) <= ff_falling_data_0;

                FOR i IN 0 TO (WIDTH - 3) LOOP
                    ff_falling_data(i + 1) <= ff_falling_data(i);
                END LOOP;

            END IF;

        END IF;
    END PROCESS;

    -- Drives shift registers on falling clock edge.
    ClkRecFallingEdge : PROCESS (recclk)
    BEGIN
        IF falling_edge(recclk) THEN
            -- 
            ff_falling_data_0 <= ff_UEQ_data;
        END IF;
    END PROCESS;

    -- Takes bits from both paths alternately, depending on clock signal.
    ClkRecMultiplexer : PROCESS (recclk)
    BEGIN
        IF (recclk = '0') THEN
            inbits(0) <= ff_rising_data(WIDTH - 1);

        ELSIF (recclk = '1') THEN
            IF (WIDTH > 1) THEN -- (pre-compiled statement)
                inbits(0) <= ff_falling_data(WIDTH - 2);

            ELSE
                inbits(0) <= ff_falling_data_0;

            END IF;
        END IF;
    END PROCESS;
END spwrecvfront_clkrec_arch;
