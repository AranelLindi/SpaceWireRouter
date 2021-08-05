----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 05.08.2021 18:47
-- Design Name: Testbench for SpaceWire Router Arbiter
-- Module Name: spwrouterarb_tb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: Simulate Router Arbiter.
-- The module supplies bit sequences that indicate which port
-- has access to other ports. Issues are relatively simple, no
-- major stress tests necessary. Note that another module is
-- is integrated: spwrouterarb_table !
--
-- Dependencies: spwrouterpkg, spwrouterarb_table
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.Std_logic_1164.ALL;
USE IEEE.Numeric_Std.ALL;
USE work.spwrouterpkg.ALL;

ENTITY spwrouterarb_tb IS
END;

ARCHITECTURE spwrouterarb_tb_arch OF spwrouterarb_tb IS

    COMPONENT spwrouterarb
        GENERIC (
            numports : INTEGER RANGE 0 TO 31
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            dest : IN array_t(numports DOWNTO 0) OF STD_LOGIC_VECTOR(numports DOWNTO 0);
            req : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
            grnt : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
            rout : OUT array_t(numports DOWNTO 0) OF STD_LOGIC_VECTOR(numports DOWNTO 0)
        );
    END COMPONENT;

    -- System clock.
    SIGNAL clk : STD_LOGIC;

    -- Asynchronous reset.
    SIGNAL rst : STD_LOGIC;

    -- Destination of port x.
    SIGNAL dest : array_t(numports DOWNTO 0) OF STD_LOGIC_VECTOR(numports DOWNTO 0);

    -- Request of port x.
    SIGNAL req : STD_LOGIC_VECTOR(numports DOWNTO 0);

    -- Granted to port x.
    SIGNAL grnt : STD_LOGIC_VECTOR(numports DOWNTO 0);

    -- Routing switch matrix.
    SIGNAL rout : array_t(numports DOWNTO 0) OF STD_LOGIC_VECTOR(numports DOWNTO 0);


    -- Clock period. (100 MHz)
    CONSTANT clock_period : TIME := 10 ns;
    SIGNAL stop_the_clock : BOOLEAN;
    
    
    -- TODO: Number of simulated ports.
    CONSTANT sim_numports : INTEGER RANGE 0 TO 31 := 4;

    -- TODO: Testbench switcher.
    VARIABLE sw_rst : BOOLEAN := true; -- controls reset.
    
    
    -- TODO: Initial values.
    rst <= '0';
    dest <= ((1, 1) => '1', (2, 1) => '1', (OTHERS => (OTHERS => '0'))); -- potenzielle fehlerquelle! syntax vermutlich falsch und was soll hier überhaupt rein?
    req <= (numports => '1', (OTHERS => '0'));
BEGIN
    -- Design under test.
    dut : spwrouterarb GENERIC MAP(numports => sim_numports)
    PORT MAP(
        clk => clk,
        rst => rst,
        dest => dest,
        req => req,
        grnt => grnt,
        rout => rout);

    -- Produce reset.
    reset : PROCESS
    BEGIN
        -- TODO: Change counter values.
        IF ((counter = 12 OR counter = 28) AND sw_rst = true) THEN
            rst <= '1' AFTER 10 * clock_period;
        END IF;
    END PROCESS;

    -- Set simulation time.
    stimulus : PROCESS
    BEGIN
        WAIT 10 sec;

        WAIT; -- wait forever.
    END PROCESS;

    -- Creates clock and controls counter.
    clocking : PROCESS
    BEGIN
        WHILE NOT stop_the_clock LOOP
            clk <= '0', '1' AFTER clock_period / 2;

            IF counter = 100 THEN
                counter = 0;
            END IF;
            counter = counter + 1;
            WAIT FOR clock_period;
        END LOOP;
        WAIT;
    END PROCESS;
END spwrouterarb_tb_arch;
