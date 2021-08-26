----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 31.07.2021 21:26
-- Design Name: SpaceWire Router Package
-- Module Name: spwrouterarb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: Framework of a round robin arbiter which controls access between
-- the ports.
--
-- Dependencies: spwrouterpkg
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.Math_real.ALL;
USE work.spwrouterpkg.ALL;

ENTITY spwrouterarb IS
    GENERIC (
        -- Number of SpaceWire ports.
        numports : INTEGER RANGE 0 TO 31
    );
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Asynchronous reset.
        rst : IN STD_LOGIC;

        -- Destination of port x (0-254 are always addressable, therefore 8 bits are necessary!)
        dest : IN array_t(0 TO numports)(7 DOWNTO 0);

        -- Request of port x.
        req : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Granted to port x.
        grnt : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Routing switch matrix.
        rout : OUT array_t(0 TO numports)(numports DOWNTO 0) -- Falls es hier probleme gibt, auf matrix wechseln!
    );
END spwrouterarb;

ARCHITECTURE spwrouterarb_arch OF spwrouterarb IS
    -- Bit length to map all ports (for spwrouterarb_round).
    CONSTANT blen : INTEGER RANGE 0 TO 4 := INTEGER(ceil(log2(real(numports))));

    -- Router switch matrix.
    SIGNAL s_routing : array_t(0 TO numports)(numports DOWNTO 0); -- hängt mit out port zusammen! siehe oben

    -- Occupied port x.
    SIGNAL s_occupied : STD_LOGIC_VECTOR(numports DOWNTO 0);

    -- Requests to port x.
    SIGNAL s_request : matrix_t(numports DOWNTO 0, numports DOWNTO 0); -- potenzielle fehlerquelle!

    -- Granted to port x.
    SIGNAL s_granted : STD_LOGIC_VECTOR(numports DOWNTO 0); -- initialisierung in ursprungscode nicht vorgehsehen! evtl fehlerquelle!
BEGIN
    -- Drive outputs.
    grnt <= s_granted;
    rout <= s_routing;

    -- Route occupation signal
    occSig : FOR i IN 0 TO numports GENERATE
        -- unten: hier inner loop nur nötig wenn mit rout(i) nicht eine ganze Zeile angesprochen werden kann!! Operatoren sind so definiert, dass sie auch eine komplete Zeile verarbeiten!
        s_occupied(i) <= OR rout(i); -- hoffentlich richtig addressiert
    END GENERATE;

    -- Source port number which requests port as destination port.
    outererloop : FOR i IN 0 TO numports GENERATE
        innerloop : FOR j IN 0 TO numports GENERATE
            s_request(i, j) <= '1' WHEN req(i) = '1' AND to_integer(unsigned(dest(i))) = j ELSE
            '0'; -- potenzielle fehlerquelle!
        END GENERATE;
    END GENERATE;

    -- Generate Arbiter_Round for every port.
    spwrouterarbiter_roundrobin : FOR i IN 0 TO numports GENERATE
        SIGNAL s_request_vec : STD_LOGIC_VECTOR(numports DOWNTO 0);
    BEGIN

        -- Convert matrix line into vector.
        Conv : FOR j IN numports DOWNTO 0 GENERATE
            s_request_vec(j) <= s_request(i, j);
        END GENERATE;

        Roundx : spwrouterarb_round GENERIC MAP(
            numports => numports,
            blen => blen
        )
        PORT MAP(
            clk => clk,
            rst => rst,
            occ => s_occupied(i),
            req => s_request_vec, -- vorher: s_request(i)
            grnt => s_routing(i) -- hier evtl. eine Fehlerquelle wegen falscher zuordnung?
        );
    END GENERATE spwrouterarbiter_roundrobin;

    -- Connection enabling signal
    rowloop : FOR i IN 0 TO numports GENERATE
	 SIGNAL s_Test : std_logic_vector(numports downto 0);
	BEGIN

        columnloop : FOR j IN numports DOWNTO 0 GENERATE
		s_Test(j) <= s_routing(j)(i);
        END GENERATE columnloop;
	s_granted(i) <= OR s_Test;
    END GENERATE rowloop;
END ARCHITECTURE spwrouterarb_arch;