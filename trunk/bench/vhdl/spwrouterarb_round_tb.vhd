----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 31.07.2021 22:38
-- Design Name: Testbench for SpaceWire Router Arbiter Round (spwrouterarb_round)
-- Module Name: spwrouterarb_round_tb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA
-- Target Devices: Xilinx FPGAs
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
USE IEEE.MATH_REAL.ALL;

ENTITY spwrouterarb_round_tb IS
END;

ARCHITECTURE spwrouterarb_round_tb_arch OF spwrouterarb_round_tb IS
    -- Design under test.
    COMPONENT spwrouterarb_round
        GENERIC (
            numports : integer range 1 to 32;
            blen : INTEGER RANGE 0 TO 5
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            occupied : IN STD_LOGIC;
            request : IN STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
            granted : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0)
        );
    END COMPONENT;

    -- Number of SpaceWire ports.
    CONSTANT numports : integer range 1 to 32 := 2; -- 3 ports (0 - 2)

    -- Bit length to map all ports.
    CONSTANT blen : INTEGER RANGE 0 TO 5 := INTEGER(ceil(log2(real(numports-1))));

    -- System clock.
    SIGNAL s_clk : STD_LOGIC;

    -- Asynchronous reset.
    SIGNAL s_rst : STD_LOGIC := '0'; -- Caution! It may be necessary to perform initial reset.

    -- High if the relevant port is already being used by another transfer process. Low when the port is unused.
    SIGNAL s_occupied : STD_LOGIC := '0'; -- Port is not occupied.

    -- Corresponding bit is High when respective port sends a request to the port.
    SIGNAL s_request : STD_LOGIC_VECTOR(numports-1 DOWNTO 0) := (OTHERS => '0'); -- No access request was made from any port.

    -- Bit sequence that indicates the access of another port.
    SIGNAL s_granted : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);

    -- Clock period. (100 MHz)
    CONSTANT clock_period : TIME := 10 ns;
BEGIN
    -- Design under test.
    dut : spwrouterarb_round GENERIC MAP(numports => numports, blen => blen)
    PORT MAP(
        clk => s_clk,
        rst => s_rst,
        occupied => s_occupied,
        request => s_request,
        granted => s_granted);

    -- Simulation.
    stimulus : PROCESS
    BEGIN
         -- Reset to initialize signals in dut.
        s_rst <= '1';
        WAIT FOR clock_period;
        s_rst <= '0';
        Wait for 0.5 * clock_period;

        -- Start simulation

        -- 1. Current Port is not occupied ! (s_requested is evaluated every clock cycle)
        s_occupied <= '0';

        -- 1.1. Port 2 is making a request to send over current port
        s_request <= (2 => '1', others => '0'); -- last granted port is now: 2 !
        wait for clock_period;
        s_request <= (others => '0'); -- reset signal
        wait for clock_period;

        -- 1.1. Port 0 and Port 1 making a request
        s_request <= (0 => '1', 1 => '1', others => '0'); -- Port 0 should be granted & be last granted port
        wait for clock_period;
        -- Port 0 and Port 1 are still making requests (Port 1 should be granted now and last granted port)
        wait for clock_period;
        s_request <= (others => '0'); -- reset signal
        wait for clock_period;

        -- 1.2. Port 1 and port 2 are making requests now (last granted port: 1)
        s_request <= (1 => '1', 2 => '1', others => '0'); -- Port 2 should be granted & be last granted port
        wait for clock_period;
        s_request <= (others => '0'); -- reset signal

        -- 2. Port is now occupied !
        s_occupied <= '1';

        wait for clock_period;

        -- 2.1. Port 0 is making a request.
        s_request <= (0 => '1', others => '0'); -- should not be granted, port is occupied
        wait for clock_period;
        s_request <= (others => '0'); -- reset signal

        -- 2.2. Port 1 and Port 2 are making request.
        s_request <= (1 => '1', 2 => '1', others => '0'); -- Again no port should be granted, port is still occupied
        wait for clock_period;
        -- no reset
        wait for clock_period;

        -- Reset all relevant signals.
        s_request <= (others => '0');
        s_occupied <= '0';        

        -- End of simulation.
    END PROCESS;

    -- Creates clock and controls counter.
    clocking : PROCESS
    BEGIN
        s_clk <= '0', '1' AFTER clock_period / 2;
        WAIT FOR clock_period;
    END PROCESS;
END spwrouterarb_round_tb_arch;