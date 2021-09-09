----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 05.08.2021 19:14
-- Design Name: Testbench for SpaceWire Router Table Arbiter
-- Module Name: spwrouterarb_table_tb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: Simulation time: 55 ns.
--
-- Dependencies: none
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY spwrouterarb_table_tb IS
END;

ARCHITECTURE spwrouterarb_table_tb_arch OF spwrouterarb_table_tb IS

    COMPONENT spwrouterarb_table
        GENERIC (
            numports : INTEGER RANGE 0 TO 31
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            req : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
            grnt : OUT STD_LOGIC_VECTOR(numports DOWNTO 0)
        );
    END COMPONENT;

    -- TODO: Initial values...

    -- Number of SpaceWire ports.
    CONSTANT numports : INTEGER RANGE 0 TO 31 := 2;

    -- System clock.
    SIGNAL clk : STD_LOGIC;

    -- Asynchronous reset.
    SIGNAL rst : STD_LOGIC := '1'; -- Caution! It may be necessary to set rst at beginning to high for short period of time. 

    -- Requests from all ports. (Bit corresponds to port)
    SIGNAL req : STD_LOGIC_VECTOR(numports DOWNTO 0) := (OTHERS => '0'); -- No access request was made from any port.

    -- Contains which port gets access.
    SIGNAL grnt : STD_LOGIC_VECTOR(numports DOWNTO 0);
    
    -- Clock period. (10 MHz)
    CONSTANT clock_period : TIME := 100 ns;
BEGIN

    -- Design under test.
    dut : spwrouterarb_table GENERIC MAP(numports => numports)
    PORT MAP(
        clk => clk,
        rst => rst,
        req => req,
        grnt => grnt);

    -- Simulation.
    stimulus : PROCESS
    BEGIN
        WAIT FOR clock_period;

        -- Set initial values for simulation.
        rst <= '0';
        req <= (OTHERS => '0'); -- No port wants access.

        WAIT FOR clock_period;

        req <= (1 => '1', 0 => 'U', 2 => '0'); -- Port0 requieres access.

        WAIT FOR clock_period;

        req <= (1 => '1', 2 => '1', OTHERS => '0'); -- More ports wants access, watch control logic.

        WAIT FOR clock_period;

        req <= (OTHERS => '1'); -- All ports ask for access. No change should take place.

        WAIT FOR clock_period;

        req <= (2 => '1', OTHERS => '0'); -- Port2 wants access, system should grant it.

        --rst <= '1';        

        --WAIT FOR clock_period;

        --stop_the_clock <= true;
        WAIT;
    END PROCESS;

    -- Creates clock.
    clocking : PROCESS
    BEGIN
        clk <= '0', '1' AFTER clock_period / 2;
        WAIT FOR clock_period;
    END PROCESS;
END spwrouterarb_table_tb_arch;