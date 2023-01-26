----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 05.08.2021 19:14
-- Design Name: Testbench for SpaceWire Router Table Arbiter
-- Module Name: spwrouterarb_table_tb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA
-- Target Devices: Xiling FPGAs
-- Tool Versions: -/-
-- Description: Simulation time:
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
    -- Design under test.
    COMPONENT spwrouterarb_table
        GENERIC (
            numports : integer range 1 to 32
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            request : IN STD_LOGIC_VECTOR((numports-1) DOWNTO 0);
            granted : OUT STD_LOGIC_VECTOR((numports-1) DOWNTO 0)
        );
    END COMPONENT;

    -- Number of SpaceWire ports.
    CONSTANT numports : integer range 1 to 32 := 2; -- 3 ports (0 - 2)

    -- System clock.
    SIGNAL clk : STD_LOGIC;

    -- Asynchronous reset.
    SIGNAL s_rst : STD_LOGIC; -- Caution! It may be necessary to set rst at beginning to high for short period of time. 

    -- Requests from all ports. (Bit corresponds to port)
    SIGNAL s_request : STD_LOGIC_VECTOR((numports-1) DOWNTO 0);

    -- Contains which port gets access.
    SIGNAL s_granted : STD_LOGIC_VECTOR((numports-1) DOWNTO 0);

    -- Clock period. (100 MHz)
    CONSTANT clock_period : TIME := 10 ns;
BEGIN
    -- Design under test.
    dut : spwrouterarb_table
    GENERIC MAP(
        numports => numports
    )
    PORT MAP(
        clk => clk,
        rst => s_rst,
        request => s_request,
        granted => s_granted);

    -- Simulation.
    stimulus : PROCESS
    BEGIN
        -- Initialization
        s_rst <= '1', '0' after clock_period;
        s_request <= (others => '0');

        wait for 2 * clock_period; -- nothing should happen

        -- Start simulation

        s_request(0) <= '1';
        wait for clock_period; -- port 0 requests access, should be granted

        s_request <= (others => '0'); -- reset signal
        wait for clock_period;

        s_request <= (others => '1'); -- all ports requests access. last granted port was port 0 so granted shouldn't change
        wait for clock_period;

        s_request(0) <= '0'; -- Port 0 has finished its access. Next granted port should be port 1
        wait for clock_period;

        s_request(1) <= '0'; -- Port 1 has finished its access, port 2 is now the turn
        wait for clock_period;

        s_request(2) <= '0'; -- No port is requesting access
        wait for 2 * clock_period;

        s_rst <= '1', '0' after clock_period; -- reset intern s_granted signal (last granted port is now port 0)

        s_request <= (1 => '0', others => '1'); -- all ports except port 1 request access therefore port 0 gets granted
        wait for clock_period;

        s_request(0) <= '0'; -- Port 0 withdraws its request, now port 2 should get access
        wait for clock_period;

        s_request(1) <= '1'; -- Port 1 wants request now but port 2 got already 
        wait for clock_period;

        s_request(2) <= '0'; -- Port 2 withdraws request now port 1 should get access
        wait for clock_period;

        s_request <= (others => '0'); -- Fin !
    END PROCESS;

    -- Creates clock.
    clocking : PROCESS
    BEGIN
        clk <= '0', '1' AFTER clock_period / 2;
        WAIT FOR clock_period;
    END PROCESS;
END spwrouterarb_table_tb_arch;