----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 05.08.2021 18:47
-- Design Name: Testbench for SpaceWire Router Arbiter
-- Module Name: spwrouterarb_tb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA
-- Target Devices: Xilinx FPGAs
-- Tool Versions: -/-
-- Description: Simulates Router Arbiter.
-- The module supplies bit sequences that indicate which port
-- has access to other ports. Outputs are relatively simple, no
-- major stress tests necessary. Note that another module
-- is integrated: spwrouterarb_table ! (Also testbench available)
--
-- Dependencies: array_t (spwrouterpkg)
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;
USE WORK.SPWROUTERPKG.ALL;

ENTITY spwrouterarb_tb IS
END;

ARCHITECTURE spwrouterarb_tb_arch OF spwrouterarb_tb IS
    -- Design under test.
    COMPONENT spwrouterarb
        GENERIC (
            numports : INTEGER RANGE 0 TO 31;
            blen : INTEGER RANGE 0 TO 5
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            destport : IN array_t(0 DOWNTO numports)(7 DOWNTO 0);
            request : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
            granted : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
            routing_matrix : OUT array_t(0 DOWNTO numports)(numports DOWNTO 0)
        );
    END COMPONENT;

    -- Number of SpaceWire ports.
    CONSTANT numports : INTEGER RANGE 0 TO 31 := 2; -- 3 ports (0 - 2)
    -- Number of bits to represent all ports.
    CONSTANT blen : INTEGER RANGE 0 TO 5 := INTEGER(ceil(log2(real(numports))));

    -- System clock.
    SIGNAL clk : STD_LOGIC;

    -- Asynchronous reset.
    SIGNAL s_rst : STD_LOGIC;

    -- Destination of port x.
    SIGNAL s_destport : array_t(numports DOWNTO 0)(7 DOWNTO 0);

    -- Request of port x.
    SIGNAL s_request : STD_LOGIC_VECTOR(numports DOWNTO 0);-- := (numports => '1', OTHERS => '0');

    -- Granted to port x.
    SIGNAL s_granted : STD_LOGIC_VECTOR(numports DOWNTO 0);

    -- Routing switch matrix.
    SIGNAL s_routing_matrix : array_t(numports DOWNTO 0)(numports DOWNTO 0);

    -- Clock period. (10 MHz)
    CONSTANT clock_period : TIME := 10 ns; -- 100 MHz
BEGIN
    -- Design under test.
    dut : spwrouterarb GENERIC MAP(
        numports => numports,
        blen => blen
    )
    PORT MAP(
        clk => clk,
        rst => s_rst,
        destport => s_destport,
        request => s_request,
        granted => s_granted,
        routing_matrix => s_routing_matrix
    );

    stimulus : PROCESS
    BEGIN
        -- Initial reset.
        s_rst <= '1';
        WAIT FOR clock_period;
        s_rst <= '0';
        WAIT FOR 0.5 * clock_period;

        -- Start simulation

        -- 1. Fill destport-matrix but set no requests so granted and routing_matrix should be zero (A'LENGTH(N)  is the number of elements of dimension N of array A.)
        s_destport(0) <= STD_LOGIC_VECTOR(to_unsigned(0, 8)); -- 0 -> 0
        s_destport(1) <= STD_LOGIC_VECTOR(to_unsigned(2, 8)); -- 1 -> 2
        s_destport(2) <= STD_LOGIC_VECTOR(to_unsigned(1, 8)); -- 2 -> 1
        WAIT FOR clock_period; -- nothing should happen        

        -- 1.1. Now set request signal to archive reaction from arbiter
        s_request(0) <= '0';
        s_request(1) <= '1';
        s_request(2) <= '1';
        WAIT FOR 2 * clock_period; -- every request should be granted (except port 0)

        -- 1.2. Port 0 now wants access to port 2
        s_destport(0) <= STD_LOGIC_VECTOR(to_unsigned(2, 8)); -- 0 -> 2
        s_request(0) <= '1';
        -- Because port 1 got already access to port 2, port 0 has to wait until port 1 has finished his transfer.
        WAIT FOR 2 * clock_period; -- nothing should change

        -- 1.3. Port 1 finished his transfer and withdraw request.
        s_request(1) <= '0';
        WAIT FOR clock_period; -- Now port 0 should get access to port 2 (but it doesn't get it, why?)
        s_destport <= (OTHERS => (OTHERS => '0')); -- reset signal
        s_request <= (OTHERS => '0'); -- reset signal
        WAIT FOR clock_period;

        -- 2. Create stress situation
        -- To do so reset design under test (dut) to get unaffected result (s_last_granted is now zero).
        s_rst <= '1', '0' AFTER clock_period / 2;

        -- 2.1. Every port requests access to port 0
        s_request <= (OTHERS => '1');
        WAIT FOR 3 * clock_period; -- wait little bit longer

        -- 2.2. Withdraw request from that port that got granted to port 0 in cycle before.
        s_request(1) <= '0'; -- Port 1 should get access as first port
        WAIT FOR 2 * clock_period;
        s_request(2) <= '0'; -- Port 2 should get access as second port
        WAIT FOR 2 * clock_period;
        s_request(0) <= '0'; -- Port 0 should get access as third port
    END PROCESS;

    -- Creates clock and controls counter.
    clocking : PROCESS
    BEGIN
        clk <= '0', '1' AFTER clock_period / 2;
        WAIT FOR clock_period;
    END PROCESS;
END spwrouterarb_tb_arch;