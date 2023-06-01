----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer, Frederik Pilz
-- 
-- Create Date: 31.07.2021 21:26
-- Design Name: SpaceWire Router - Router Arbiter (Logic & Preperation)
-- Module Name: spwrouterarb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA,
--              Bachelor Thesis: Extension and Validation of a SpaceWire router on an FPGA
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
        numports : INTEGER RANGE 1 TO 32;

        -- Bit length to map number of ports (ceil(log2((numports-1)))).
        blen : INTEGER RANGE 0 TO 5 -- (max 5 bits for 0-31 ports)
    );
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Synchronous reset.
        rst : IN STD_LOGIC;

        -- Contains desired destination port for each port (number coded in binary !).
        destport : IN array_t((numports - 1) DOWNTO 0)((numports -1) DOWNTO 0);

        -- Shows for each port whether access to another port is required.
        request : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- Contains ports that have granted access to the port that is specified in destports.
        granted : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- Routing switch matrix: Maps source ports (row) to target ports (column)
        routing_matrix : OUT array_t((numports - 1) DOWNTO 0)((numports - 1) DOWNTO 0)
    );
END spwrouterarb;

ARCHITECTURE spwrouterarb_arch OF spwrouterarb IS
    PACKAGE spwrouterfunc IS NEW work.spwrouterfunc
        GENERIC MAP (numports => numports); -- Imports operator overloading and functions
    
    -- Constants.
    CONSTANT c_neg_one : int_array((numports - 1) DOWNTO 0) := (OTHERS => -1);
    

    -- Routing switch matrix: Containts arbiters final decision which port may send over another port.
    SIGNAL s_routing : array_t((numports - 1) DOWNTO 0)((numports - 1) DOWNTO 0);

    -- Shows which ports are currently occupied.
    SIGNAL s_occupied : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

    -- Contains which ports want to access other ports.
    SIGNAL s_request : matrix_t((numports - 1) DOWNTO 0, (numports - 1) DOWNTO 0);

    -- Contains ports that are allowed to send (not destination ports).
    SIGNAL s_granted : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

    -- Multi/Broadcast specific signals.
    -- Contains ports that want to multicast/broadcast.
    SIGNAL s_multicast : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

    -- Signals regarding the granting process of broad/multicast requests.
    SIGNAL s_multicast_granted : array_t((numports - 1) DOWNTO 0)((numports - 1) DOWNTO 0);
    SIGNAL s_mc_granteds : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

    -- Contains ports that are included in the multicast arbitration (all destination ports are either granted to itself or other multicast ports)
    SIGNAL s_multicast_arb : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

    -- Broad/Multicast arbitration signal.
    SIGNAL s_portarb_override : int_array((numports - 1) DOWNTO 0);

    -- Last granted port with broad/multicast request.
    SIGNAL s_last_granted : INTEGER RANGE 0 TO (numports - 1);
BEGIN
    -- Drive outputs.
    granted <= s_granted;
    routing_matrix <= s_routing;

    -- Multi/Broadcast.
    s_mc_granteds <= spwrouterfunc."OR"(s_multicast_granted);

    -- Checks for each port whether one or more ports want access it. If so, this port is occupied.
    Occupation : FOR i IN 0 TO (numports - 1) GENERATE
        s_occupied(i) <= OR s_routing(i); -- Operator overloading (or)
    END GENERATE Occupation;

    -- Maps which ports make requests to other ports.
    Request_Column : FOR i IN 0 TO (numports - 1) GENERATE
        Request_Row : FOR j IN 0 TO (numports - 1) GENERATE
            s_request(j, i) <= '1' WHEN request(i) = '1' AND destport(i)(j) = '1' ELSE
                               '0';
        END GENERATE Request_Row;
    END GENERATE Request_Column;

    -- Generate spwrouterarb_round for every port.
    RoundRobin_Row : FOR i IN 0 TO (numports - 1) GENERATE
        SIGNAL s_request_vec : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
    BEGIN

        -- Intermediate step: Convert matrix row into vector.
        RoundRobin_Column : FOR j IN (numports - 1) DOWNTO 0 GENERATE
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
                override => s_portarb_override(i),
                granted => s_routing(i)
            );
    END GENERATE RoundRobin_Row;

    -- Based on routing result of all ports, creates a list of
    -- which source ports are allowed to execute their request.
    Granted_Row : FOR i IN 0 TO (numports - 1) GENERATE
        SIGNAL s_transform : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
    BEGIN
        -- Intermediate step: Transpose every vector in matrix (for operator overloading).
        Granted_Column : FOR j IN (numports - 1) DOWNTO 0 GENERATE
            s_transform(j) <= s_routing(j)(i);
        END GENERATE Granted_Column;

        s_multicast_granted(i) <= s_transform WHEN (s_multicast(i) = '1' AND NOT (s_transform = destport(i))) ELSE (OTHERS => '0');
        
        -- This may deadlock, if more than one multicast request exists at the same time!!! TODO: CHECK!
        s_granted(i) <= '1' when ((s_transform = destport(i)) AND (OR s_transform = '1')) ELSE '0';
    END GENERATE Granted_Row;

    -- Multi/Broadcast section.
    Multicast : FOR i IN 0 TO (numports - 1) GENERATE
        s_multicast(i) <= '1' WHEN spwrouterfunc.two_or_more(destport(i)) AND request(i) ELSE '0';
    END GENERATE Multicast;

    Multicast_Arb_Participants : FOR i IN 0 TO (numports - 1) GENERATE
        s_multicast_arb(i) <= '1' WHEN ((s_mc_granteds AND destport(i)) = destport(i)) AND (request(i) = '1') ELSE '0';
    END GENERATE Multicast_Arb_Participants;

    -- Arbiter for broad/multicast transmissions.
    PROCESS(clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF rst = '1' THEN
                -- Synchronous reset.
                s_portarb_override <= (OTHERS => -1);
                s_last_granted <= 0;
            ELSE
                IF spwrouterfunc.two_or_more(s_multicast_arb) THEN
                    FOR i IN (numports - 1) DOWNTO 0 LOOP -- lower priority (0 to last_granted)
                        IF i <= s_last_granted THEN
                            FOR j in (numports - 1) DOWNTO 0 LOOP
                                IF (s_multicast_arb(i) = '1') AND (request(i) = '1') AND (s_portarb_override = c_neg_one) THEN
                                    s_portarb_override(j) <= i WHEN destport(i)(j) ELSE -1;
                                    s_last_granted <= i;
                                ELSIF (s_multicast_arb(i) = '0') AND (request(i) = '1') THEN
                                    s_portarb_override(j) <= -1 WHEN destport(i)(j); -- reset override, when no longer needed
                                END IF;
                            END LOOP;
                        END IF;
                    END LOOP;
                    FOR i IN (numports - 1) DOWNTO 0 LOOP -- higher priority (last_granted+1 to numports)
                        IF i >= s_last_granted + 1 THEN
                            FOR j in (numports - 1) DOWNTO 0 LOOP
                                IF (s_multicast_arb(i) = '1') AND (request(i) = '1') AND (s_portarb_override = c_neg_one) THEN
                                    s_portarb_override(j) <= i WHEN destport(i)(j) ELSE -1;
                                    s_last_granted <= i;
                                ELSIF (s_multicast_arb(i) = '0') AND (request(i) = '1') THEN
                                    s_portarb_override(j) <= -1 WHEN destport(i)(j); -- reset override, when no longer needed
                                END IF;
                            END LOOP;
                        END IF;
                    END LOOP;
                ELSE
                    s_portarb_override <= (OTHERS => -1);
                END IF;

            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE spwrouterarb_arch;