----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 31.07.2021 21:26
-- Design Name: SpaceWire Router - Router Arbiter (Logic & Preperation)
-- Module Name: spwrouterarb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA
-- Target Devices: Xilinx FPGAs
-- Tool Versions: -/-
-- Description: Framework of a round robin arbiter which controls access between
-- the ports.
--
-- Dependencies: spwrouterpkg
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;
USE WORK.SPWROUTERPKG.ALL;

ENTITY spwrouterarb IS
    GENERIC (
        -- Number of SpaceWire ports.
        numports : INTEGER RANGE 0 TO 31;

        -- Bit length to map number of ports (ceil(log2(numports))).
        blen : INTEGER RANGE 0 TO 5 -- (max 5 bits for 0-31 ports)
    );
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Synchronous reset.
        rst : IN STD_LOGIC;

        -- Contains desired destination port for each port (number coded in binary !).
        destport : IN array_t(numports DOWNTO 0)(7 DOWNTO 0);

        -- Shows for each port whether access to another port is required.
        request : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Contains ports that have granted access to the port that is specified in destport.
        granted : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Routing switch matrix: Maps source ports (row) to target ports (column)
        routing_matrix : OUT array_t(numports DOWNTO 0)(numports DOWNTO 0)
    );
END spwrouterarb;

ARCHITECTURE spwrouterarb_arch OF spwrouterarb IS
    -- Routing switch matrix: Containts arbiters final decision which port may send over another port.
    SIGNAL s_routing : array_t(numports DOWNTO 0)(numports DOWNTO 0);

    -- Shows which ports are currently occupied.
    SIGNAL s_occupied : STD_LOGIC_VECTOR(numports DOWNTO 0);

    -- Contains which ports want to access other ports.
    SIGNAL s_request : matrix_t(numports DOWNTO 0, numports DOWNTO 0);

    -- Contains ports that are allowed to send (not destination ports).
    SIGNAL s_granted : STD_LOGIC_VECTOR(numports DOWNTO 0);
BEGIN
    -- Drive outputs.
    granted <= s_granted;
    routing_matrix <= s_routing;

    -- Checks for each port whether one or more ports want access it. If so, this port is occupied.
    Occupation : FOR i IN 0 TO numports GENERATE
        s_occupied(i) <= OR s_routing(i); -- Operator overloading (or)
    END GENERATE Occupation;

    -- Maps which ports make requests to other ports.
    Request_Column : FOR i IN 0 TO numports GENERATE
        Request_Row : FOR j IN 0 TO numports GENERATE
            s_request(j, i) <= '1' WHEN request(i) = '1' AND to_integer(unsigned(destport(i))) = j ELSE
            '0';
        END GENERATE Request_Row;
    END GENERATE Request_Column;

    -- Generate spwrouterarb_round for every port.
    RoundRobin_Row : FOR i IN 0 TO numports GENERATE
        SIGNAL s_request_vec : STD_LOGIC_VECTOR(numports DOWNTO 0);
    BEGIN

        -- Intermediate step: Convert matrix row into vector.
        RoundRobin_Column : FOR j IN numports DOWNTO 0 GENERATE
            s_request_vec(j) <= s_request(i, j);
        END GENERATE RoundRobin_Column;

        -- Instantiate round robin for every port i.
        RoundRobin_Inst : spwrouterarb_round
        GENERIC MAP(
            numports => numports,
            blen => blen
        )
        PORT MAP(
            clk => clk,
            rst => rst,
            occupied => s_occupied(i),
            request => s_request_vec,
            granted => s_routing(i)
        );
    END GENERATE RoundRobin_Row;

    -- Based on routing result of all ports, creates a list of
    -- which source ports are allowed to execute their request.
    Granted_Row : FOR i IN 0 TO numports GENERATE
        SIGNAL s_transform : STD_LOGIC_VECTOR(numports DOWNTO 0);
    BEGIN
        -- Intermediate step: Transpose every vector in matrix (for operator overloading).
        Granted_Column : FOR j IN numports DOWNTO 0 GENERATE
            s_transform(j) <= s_routing(j)(i);
        END GENERATE Granted_Column;

        s_granted(i) <= OR s_transform; -- Operator overloading (or)
    END GENERATE Granted_Row;
END ARCHITECTURE spwrouterarb_arch;
