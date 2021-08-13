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
-- Description: Simulate Router Table Arbiter.
--
-- Dependencies: spwrouterpkg
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.Std_logic_1164.ALL;
USE IEEE.Numeric_Std.ALL;

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
            req : IN STD_LOGIC_VECTOR((numports + 1) DOWNTO 0);
            grnt : OUT STD_LOGIC_VECTOR((numports + 1) DOWNTO 0)
        );
    END COMPONENT;

    -- TODO: Initial values...

    -- Number of SpaceWire ports.
    CONSTANT numports : INTEGER RANGE 0 TO 31 := 5;

    -- System clock.
    SIGNAL clk : STD_LOGIC;

    -- Asynchronous reset.
    SIGNAL rst : STD_LOGIC := '0';

    -- Requests from all ports. (Bit corresponds to port)
    SIGNAL req : STD_LOGIC_VECTOR((numports + 1) DOWNTO 0) := (0 => '1', OTHERS => '0');

    -- Contains which port gets access.
    SIGNAL grnt : STD_LOGIC_VECTOR((numports + 1) DOWNTO 0);
    -- Clock period. (100 MHz)
    CONSTANT clock_period : TIME := 10 ns;
    SIGNAL stop_the_clock : BOOLEAN;
    --- TODO: Number of simulated ports.
    CONSTANT sim_numports : INTEGER RANGE 0 TO 31 := 4;

    -- TODO: Testbench switcher.
    SHARED VARIABLE sw_rst : BOOLEAN := true; -- constrols reset.

BEGIN

    -- Design under test.
    dut : spwrouterarb_table GENERIC MAP(numports => sim_numports)
    PORT MAP(
        clk => clk,
        rst => rst,
        req => req,
        grnt => grnt);

    -- Changes requesting ports.
    reqPorts : PROCESS (clk)
        VARIABLE ports : INTEGER RANGE 0 TO sim_numports := 0;
    BEGIN
        IF rising_edge(clk) THEN
            req <= STD_LOGIC_VECTOR(to_unsigned(ports, req'Length));

            IF ports = sim_numports THEN
                ports := 0;
            END IF;
        END IF;
    END PROCESS;

    -- Set simulation time.
    stimulus : PROCESS
    BEGIN
        WAIT FOR 10 sec;

        stop_the_clock <= true;
        WAIT;
    END PROCESS;

    -- Creates clock.
    clocking : PROCESS
    BEGIN
        WHILE NOT stop_the_clock LOOP
            clk <= '0', '1' AFTER clock_period / 2;
            WAIT FOR clock_period;
        END LOOP;
        WAIT;
    END PROCESS;
END spwrouterarb_table_tb_arch;