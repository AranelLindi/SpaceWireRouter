----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 05.08.2021 17:52
-- Design Name: Testbench for SpaceWire Router TimeCode Control
-- Module Name: spwroutertcc_tb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: Simulate TimeCode Control with different inputs and error provokion.
-- It is necessary to carry out stress tests here because the module produces complex outputs.
--
-- Dependencies: spwrouterpkg
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.Std_logic_1164.ALL;
USE IEEE.Numeric_Std.ALL;
USE work.spwrouterpkg.ALL;

ENTITY spwroutertcc_tb IS
END;

ARCHITECTURE spwroutertcc_tb_arch OF spwroutertcc_tb IS

    COMPONENT spwroutertcc
        GENERIC (
            numports : INTEGER RANGE 0 TO 31
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            running : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
            lst_time : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            tc_en : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            tick_out : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            time_out : OUT array_t((numports - 1) DOWNTO 0)(7 DOWNTO 0);
            tick_in : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            time_in : IN array_t((numports - 1) DOWNTO 0)(7 DOWNTO 0);
            auto_time_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            auto_cycle : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
    END COMPONENT;

    -- TODO: Initial values...

    -- Number of SpaceWire ports.
    CONSTANT numports : INTEGER RANGE 0 TO 31 := 5;

    -- System clock.
    SIGNAL clk : STD_LOGIC;

    -- Asynchronous reset.
    SIGNAL rst : STD_LOGIC := '0';

    -- High if corresponding port is running or low when its in another state.
    SIGNAL running : STD_LOGIC_VECTOR(numports DOWNTO 0) := (OTHERS => '1');

    -- Last Timecode that was received.
    SIGNAL lst_time : STD_LOGIC_VECTOR(7 DOWNTO 0);

    -- High if port has enabled TimeCode feature - except port0!
    SIGNAL tc_en : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0) := (2 => '0', OTHERS => '1'); -- 2nd port disabled TCs, others activated

    -- High if corresponding port requests a TimeCode transmission - except port0!
    SIGNAL tick_out : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

    -- Contains for every port TimeCode to send - except port0!
    SIGNAL time_out : array_t((numports - 1) DOWNTO 0)(7 DOWNTO 0);

    -- High if corresponding port received a TimeCode - except port0!
    SIGNAL tick_in : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0) := (OTHERS => '0');

    -- Received TimeCodes from all ports - except port0!
    SIGNAL time_in : array_t((numports - 1) DOWNTO 0)(7 DOWNTO 0) := (OTHERS => (OTHERS => '0'));

    -- TimeCode that is send from Host.
    SIGNAL auto_time_out : STD_LOGIC_VECTOR(7 DOWNTO 0);

    -- Transmission interval for automatic TimeCode sending.
    SIGNAL auto_cycle : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0'); -- start with deactivated auto TC generation.
    -- Clock period. (100 MHz)
    CONSTANT clock_period : TIME := 10 ns;
    SIGNAL stop_the_clock : BOOLEAN;

    -- TODO: Testbench switcher.
    SIGNAL sw_rst : BOOLEAN := true; -- controls reset.
    SIGNAL sw_TC_incoming : BOOLEAN := true; -- controls incoming TC.
    SIGNAL sw_wrong_TC : BOOLEAN := true; -- incoming TC is smaller or bigger than it should be.
    -- Counter: Helps to raise events.
    SIGNAL counter : INTEGER := 0;

    -- Auxiliary variables
    SIGNAL internTC : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0'); -- saves last TC.

BEGIN
    -- Design under test.
    dut : spwroutertcc GENERIC MAP(numports => numports)
    PORT MAP(
        clk => clk,
        rst => rst,
        running => running,
        lst_time => lst_time,
        tc_en => tc_en,
        tick_out => tick_out,
        time_out => time_out,
        tick_in => tick_in,
        time_in => time_in,
        auto_time_out => auto_time_out,
        auto_cycle => auto_cycle);

    -- Produce reset.
    reset : PROCESS
    BEGIN
        -- TODO: Change counter values.
        IF ((counter = 12 OR counter = 28) AND sw_rst = true) THEN
            rst <= '1';
        ELSE
            rst <= '0';
        END IF;
    END PROCESS;

    -- Creates periodic incoming TCs.
    incomingTC : PROCESS
        -- TODO: Change ports here to simulate different incomming TCs.
        VARIABLE iport : INTEGER := 1;
    BEGIN
        IF (counter MOD 10 = 0 AND sw_TC_incoming = true) THEN
            FOR i IN 0 TO 7 LOOP
                time_in(iport)(i) <= internTC(i);
            END LOOP;

            -- Changing MSB to make the number larger or smaller and provoke an error.
            IF (sw_wrong_TC = true) THEN
                time_in(iport)(iport) <= NOT time_in(iport)(iport); -- flip MSB.
            END IF;

            tick_in <= (iport => '1', OTHERS => '0');
        END IF;
    END PROCESS;

    -- Set simulation time.
    stimulus : PROCESS
    BEGIN
        WAIT FOR 10 sec; -- Simulation time before clock stops.

        stop_the_clock <= true;
        WAIT;
    END PROCESS;

    -- Creates clock and controls counter.
    clocking : PROCESS
    BEGIN
        WHILE NOT stop_the_clock LOOP
            clk <= '0', '1' AFTER clock_period / 2;

            IF counter = 100 THEN
                counter <= 0;
            END IF;
            counter <= counter + 1;
            WAIT FOR clock_period;
        END LOOP;
        WAIT;
    END PROCESS;
END spwroutertcc_tb_arch;