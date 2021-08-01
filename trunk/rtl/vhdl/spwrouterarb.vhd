----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 31.07.2021 21:26
-- Design Name: SpaceWire Router Package
-- Module Name: spwrouterarb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- Dependencies: none
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.spwrouterpkg.ALL;

ENTITY spwrouterarb IS
    GENERIC (
        -- Number of SpaceWire ports.
        numports : INTEGER RANGE 0 TO 31
    );
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Reset.
        rst : IN STD_LOGIC;

        -- Destination of port x. -- why 8 bits?? (must bei changed in pkg too!!)
        dest : IN larray(numports DOWNTO 0) OF STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- Request of port x.
        req : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Granted to port x.
        grnt : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Routing switch matrix.
        rout : OUT larray(numports DOWNTO 0) OF STD_LOGIC_VECTOR(numports DOWNTO 0) -- Falls es hier probleme gibt, auf matrix wechseln!
    );
END spwrouterarb;

ARCHITECTURE spwrouterarb_arch OF spwrouterarb IS
    -- Router switch matrix.
    SIGNAL s_routing : larray(numports DOWNTO 0) OF STD_LOGIC_VECTOR(numports DOWNTO 0); -- hängt mit out port zusammen! siehe oben

    -- Occupied port x.
    SIGNAL s_occupied : logic_array(numports DOWNTO 0) := (OTHERS => '0');

    -- Requests to port x.
    SIGNAL s_request : logic_vector_array(numports DOWNTO 0) OF STD_LOGIC_VECTOR(numports DOWNTO 0);

    -- Granted to port x.
    SIGNAL s_granted : logic_array(numports DOWNTO 0) := (OTHERS => '0'); -- initialisierung in ursprungscode nicht vorgehsehen! evtl fehlerquelle!
BEGIN
    -- Drive outputs.
    grnt <= s_granted;
    rout <= s_routing;

    -- Route occupation signal
    FOR i IN 0 TO numports LOOP
        -- inner loop nur nötig wenn mit rout(i) nicht eine ganze Zeile angesprochen werden kann!! Operatoren sind so definiert, dass sie auch eine komplete Zeile verarbeiten!
        s_occupied(i) <= OR rout(i); -- hoffentlich richtig addressiert
    END LOOP;

    -- Source port number which requests port as destination port.
    FOR i IN 0 TO numports LOOP
        FOR j IN 0 TO numports LOOP
            s_request(i, j) <= '1' WHEN req(i) = '1' AND to_integer(unsigned(dest(i))) = j ELSE
            '0'; -- potenzielle fehlerquelle!
        END LOOP;
    END LOOP;

    -- Generate Arbiter_Round for every port.
    spwrouterarbiter_round : FOR i IN 0 TO numports GENERATE
        PORT MAP(
            clk => clk,
            rst => rst,
            occ => s_occupied(i),
            req => s_request,
            grnt => s_routing(i) -- hier evtl. eine Fehlerquelle wegen falscher zuordnung?
        );
    END GENERATE spwrouterarbiter_round;

    -- Connection enabling signal
    FOR i IN 0 TO numports LOOP
        FOR j IN 0 TO numports LOOP
            s_granted(i) <= OR s_routing(j, i); -- potenzielle Fehlerquelle! SOLL: Immer spaltenweise nach unten!
        END LOOP;
    END LOOP;
END ARCHITECTURE spwrouterarb_arch;