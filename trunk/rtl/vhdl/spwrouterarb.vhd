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
-- Dependencies: array_t (spwrouterpkg)
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

        -- Synchronous reset (spwrouterarb_round).
        rst : IN STD_LOGIC;

        -- Shows desired destination port each port (byte coded !)
        destport : IN array_t(numports DOWNTO 0)(7 DOWNTO 0); -- dest

        -- Request of port x.
        request : IN STD_LOGIC_VECTOR(numports DOWNTO 0); -- req

        -- Granted to port x.
        granted : OUT STD_LOGIC_VECTOR(numports DOWNTO 0); -- grnt

        -- Routing switch matrix.
        routing_matrix : OUT array_t(numports DOWNTO 0)(numports DOWNTO 0) -- Falls es hier probleme gibt, auf matrix wechseln! -- rout
    );
END spwrouterarb;

ARCHITECTURE spwrouterarb_arch OF spwrouterarb IS
    -- Routing switch matrix: Containts decision ultimately made byte the arbiter as to which port is allowed to send over another port.
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

    -- Checks for each port whether one or more ports want to access it. If so, this port is occupied.
    Occ: FOR i IN 0 TO numports GENERATE
        s_occupied(i) <= OR s_routing(i); -- Operator overloading (or) -- Wofür wird das benötigt?
    END GENERATE;

    -- Source port number which requests port as destination port.
    columnloop : FOR i IN 0 TO numports GENERATE
        rowloop : FOR j IN 0 TO numports GENERATE
            s_request(j, i) <= '1' WHEN request(i) = '1' AND to_integer(unsigned(destport(i))) = j ELSE
            '0'; -- TODO: Wofür wird das benötigt? Hier stand mal potenzielle Fehlerquelle, kann weg oder?
        END GENERATE rowloop;
    END GENERATE columnloop;

    -- Generate spwrouterarb_round for every port.
    rowloopI : FOR i IN 0 TO numports GENERATE
        SIGNAL s_request_vec : STD_LOGIC_VECTOR(numports DOWNTO 0); -- TODO: Wofür wird das benötigt?
    BEGIN

        -- Intermediate step: convert matrix row into vector.
        columnloopI : FOR j IN numports DOWNTO 0 GENERATE
            s_request_vec(j) <= s_request(i, j);
        END GENERATE columnloopI;

        -- Instantiate round robin.
        RoundRobin : spwrouterarb_round GENERIC MAP(
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
    END GENERATE rowloopI;

    -- Connection enabling signal -- TODO: Was macht das hier?
    rowloopII : FOR i IN 0 TO numports GENERATE
        SIGNAL s_transform : STD_LOGIC_VECTOR(numports DOWNTO 0);
    BEGIN
        columnloopII : FOR j IN numports DOWNTO 0 GENERATE
            s_transform(j) <= s_routing(j)(i);
        END GENERATE columnloopII;
        s_granted(i) <= OR s_transform; -- Operator overloading (or)
    END GENERATE rowloopII;
END ARCHITECTURE spwrouterarb_arch;