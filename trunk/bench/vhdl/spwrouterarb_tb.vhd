----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 05.08.2021 18:47
-- Design Name: Testbench for SpaceWire Router Arbiter
-- Module Name: spwrouterarb_tb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: Simulates Router Arbiter.
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
    -- Design under test.
    COMPONENT spwrouterarb
        GENERIC (
            numports : INTEGER RANGE 0 TO 31
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            dest : IN array_t(0 DOWNTO numports)(7 DOWNTO 0);
            req : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
            grnt : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
            rout : OUT array_t(0 DOWNTO numports)(numports DOWNTO 0)
        );
    END COMPONENT;

    -- Number of SpaceWire ports.
    CONSTANT numports : INTEGER RANGE 0 TO 31 := 2;

    -- System clock.
    SIGNAL clk : STD_LOGIC;

    -- Asynchronous reset.
    SIGNAL rst : STD_LOGIC;

    -- Destination of port x.
    SIGNAL dest : array_t(numports DOWNTO 0)(7 DOWNTO 0);

    -- Request of port x.
    SIGNAL req : STD_LOGIC_VECTOR(numports DOWNTO 0);-- := (numports => '1', OTHERS => '0');

    -- Granted to port x.
    SIGNAL grnt : STD_LOGIC_VECTOR(numports DOWNTO 0);

    -- Routing switch matrix.
    SIGNAL rout : array_t(numports DOWNTO 0)(numports DOWNTO 0);

    -- Clock period. (10 MHz)
    CONSTANT clock_period : TIME := 100 ns;

    -- Internal counter.
    SIGNAL counter : INTEGER := 0;
BEGIN
    -- Design under test.
    dut : spwrouterarb GENERIC MAP(numports => numports)
    PORT MAP(
        clk => clk,
        rst => rst,
        dest => dest,
        req => req,
        grnt => grnt,
        rout => rout);

    -- Set simulation time.
    stimulus : PROCESS
    BEGIN
        rst <= '1', '0' AFTER 100 ns;

        WAIT UNTIL rst = '0';

        req <= "110";
        dest <= (1 => STD_LOGIC_VECTOR(to_unsigned(0, 8)), 2 => STD_LOGIC_VECTOR(to_unsigned(0, 8)), OTHERS => "00000000");

        WAIT FOR clock_period; -- Adressbyte wird weggelassen, also wird ab jetzt Cargo behandelt:

        -- req bleibt konstant, dest ebenfalls.

        WAIT FOR clock_period; -- Port 0 erhält ebenfalls ein Paket

        req <= "111";
        dest(0) <= STD_LOGIC_VECTOR(to_unsigned(1, 8));

        WAIT FOR clock_period;

        WAIT FOR clock_period;

        req <= "101";
        dest(1) <= "00000000";

        WAIT FOR clock_period;

        --dest <= (1 => (1 => '1', OTHERS => '0'), OTHERS => (OTHERS => '0'));
        --req <= (1 => '1', OTHERS => '0');

        --	dest <= (1 => (std_logic_vector(to_unsigned(2, 8))), others => (others => '0'));
        --	req <= (1 => '1', others => '0');

        --	wait for 2 * clock_period;

        --	dest <= (0 => (std_logic_vector(to_unsigned(1, 8))), 2 => (std_logic_vector(to_unsigned(1, 8))), others => (others => '0'));
        --	req <= (0 => '1', 2 => '1', others => '0');

        --	wait for 2 * clock_period;

        --	req <= (others => '0');

        --	wait for 2 * clock_period;

        --	dest <= (others => (others => '1'));
        --	req <= (others => '1');

        --	wait for 3 * clock_period;

        --	dest <= (others => (others => '0'));
        --	req <= (others => '0');

        WAIT;
    END PROCESS;

    -- Creates clock and controls counter.
    clocking : PROCESS
    BEGIN
        clk <= '0', '1' AFTER clock_period / 2;
        WAIT FOR clock_period;
    END PROCESS;
END spwrouterarb_tb_arch;