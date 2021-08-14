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
-- Description: Simulation time: 55 ns
--
-- Dependencies: none
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.Std_logic_1164.ALL;
USE IEEE.Numeric_Std.ALL;
USE IEEE.MATH_REAL.all;
--use work.spwrouterpkg.all;

ENTITY spwrouterarb_round_tb IS
END;

ARCHITECTURE spwrouterarb_round_tb_arch OF spwrouterarb_round_tb IS

    COMPONENT spwrouterarb_round
        GENERIC (
            numports : INTEGER RANGE 0 TO 31;
            blen : INTEGER RANGE 0 TO 4
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            occ : IN STD_LOGIC;
            req : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
            grnt : OUT STD_LOGIC_VECTOR(numports DOWNTO 0)
        );
    END COMPONENT;

    -- TODO: Initial values...

    -- Number of SpaceWire ports.
    CONSTANT numports : INTEGER RANGE 0 TO 31 := 2; -- 3 ports
    
    -- Bit length to map all ports.
    CONSTANT blen : INTEGER RANGE 0 TO 4 := INTEGER(ceil(log2(real(numports))));

    -- System clock.
    SIGNAL clk : STD_LOGIC;

    -- Asynchronous reset.
    SIGNAL rst : STD_LOGIC := '0'; -- Caution! It may be necessary to set rst at beginning to high for short period of time. 

    -- High if the relevant port is already being used by another transfer process. Low when the port is unused.
    SIGNAL occ : STD_LOGIC := '0'; -- Port is not occupied.

    -- Corresponding bit is High when respective port sends a request to the port.
    SIGNAL req : STD_LOGIC_VECTOR(numports DOWNTO 0) := (OTHERS => '0'); -- No access request was made from any port.

    -- Bit sequence that indicates the access of another port.
    SIGNAL grnt : STD_LOGIC_VECTOR(numports DOWNTO 0);
    

    -- Clock period. (100 MHz)
    CONSTANT clock_period : TIME := 10 ns;
    SIGNAL stop_the_clock : BOOLEAN;
BEGIN

    -- Design under test.
    dut : spwrouterarb_round GENERIC MAP(numports => numports, blen => blen)
    PORT MAP(
        clk => clk,
        rst => rst,
        occ => occ,
        req => req,
        grnt => grnt);

    -- Simulation.
    stimulus : PROCESS
    BEGIN
        rst <= '1';
    
        WAIT FOR clock_period/4;
        
        rst <= '0';       
        occ <= '0';
        req <= (2 => '1', others => '0');
        
        WAIT FOR clock_period/4;
        wait for clock_period/2;
        
        req <= (others => '1');
        
        wait for clock_period/2;
        wait for clock_period;
        
        occ <= '0';
        req <= (others => '0');
        
        wait for clock_period;
        
        occ <= '1';
        req <= (others => '1');
        
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