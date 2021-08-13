----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 31.07.2021 22:38
-- Design Name: Testbench for SpaceWire Router Arbiter Round (submodule for SpaceWire Router Arbiter)
-- Module Name: spwrouterarb_round_tb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--
-- Dependencies: none
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.Std_logic_1164.ALL;
USE IEEE.Numeric_Std.ALL;
--use work.spwrouterpkg.all;

ENTITY spwrouterarb_round_tb IS
END;

ARCHITECTURE spwrouterarb_round_tb_arch OF spwrouterarb_round_tb IS

    COMPONENT spwrouterarb_round
        GENERIC (
            numports : INTEGER RANGE 0 TO 31
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            occ : IN STD_LOGIC;
            req : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
            grnt : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
            lst : out std_logic_vector(4 downto 0)
        );
    END COMPONENT;

    -- TODO: Initial values...

    -- Number of SpaceWire ports.
    CONSTANT numports : INTEGER RANGE 0 TO 31 := 1;

    -- System clock.
    SIGNAL clk : STD_LOGIC;

    -- Asynchronous reset.
    SIGNAL rst : STD_LOGIC := '0';

    -- High if relevant port is already being used by another
    -- process. Low when the port is unused.
    SIGNAL occ : STD_LOGIC := '0';

    -- Corresponding bit is High when respective port sends
    -- a request to the port which is defined under occ.
    SIGNAL req : STD_LOGIC_VECTOR(numports DOWNTO 0) := (OTHERS => '0');

    -- Bit sequence that indicates the access of another port.
    SIGNAL grnt : STD_LOGIC_VECTOR(numports DOWNTO 0);
    
    signal lst : std_logic_vector(4 downto 0);

    -- Clock period. (100 MHz)
    CONSTANT clock_period : TIME := 10 ns;
    SIGNAL stop_the_clock : BOOLEAN;
    
    -- TODO: Testbench switcher.
    SIGNAL sw_rst : BOOLEAN := false; -- controls reset.
    -- Counter: Helps to raise events.
    SIGNAL counter : INTEGER := 0;
BEGIN

    -- Design under test.
    dut : spwrouterarb_round GENERIC MAP(numports => numports)
    PORT MAP(
        clk => clk,
        rst => rst,
        occ => occ,
        req => req,
        grnt => grnt,
        lst => lst);

    -- Produce reset.
--    reset : PROCESS
--    BEGIN
--        -- TODO: Change counter values.
--        IF ((counter = 40 OR counter = 68) AND sw_rst = true) THEN
--            rst <= '1';
--        ELSE
--            rst <= '0';
--        END IF;
--    END PROCESS;

--    -- Performs test actions.
--    Seq : PROCESS
--        VARIABLE cnt : INTEGER RANGE 0 TO sim_numports := 0;
--    BEGIN
--        occ <= NOT occ;
--        req <= (cnt => '1', OTHERS => '0');
--        WAIT FOR clock_period;
--    END PROCESS;

    -- Set simulation time.
    stimulus : PROCESS
    BEGIN
        rst <= '1';
    
        WAIT FOR clock_period;
        
        rst <= '0';
        
        occ <= '0';
        req <= (0 => '1', others => '0');
        
        wait for clock_period;
        
        --occ <= '1';
        req <= (1 => '1', others => '0');
        
        wait for clock_period;
        
        occ <= '0';
        req <= (others => '1');
        
        wait for clock_period;
        
        occ <= '0';
        req <= (others => '0');
        
        wait for clock_period;
        
        stop_the_clock <= true;
        WAIT;
    END PROCESS;

    -- Creates clock and controls counter.
    clocking : PROCESS
    BEGIN
        WHILE NOT stop_the_clock LOOP
            clk <= '0', '1' AFTER clock_period / 2;
            WAIT FOR clock_period;
        END LOOP;
        WAIT;
    END PROCESS;
END spwrouterarb_round_tb_arch;