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
USE work.spwrouterpkg.ALL;

ENTITY spwrouterarb IS
    GENERIC (
        -- Number of SpaceWire ports (1 to 31; 0 is internal port)
        numports : INTEGER RANGE 1 TO 32
    );
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Reset.
        rst : IN STD_LOGIC;

        -- Destination of port x.
        dest : IN logic_vector_array((numports - 1) DOWNTO 0) OF STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- Request of port x.
        request : IN logic_array((numports - 1) DOWNTO 0);

        -- Granted to port x.
        granted : OUT logic_array((numports - 1) DOWNTO 0);

        -- Routing switch matrix.
        routing : OUT logic_matrix((numports - 1) DOWNTO 0, (numports - 1) DOWNTO 0)
    );
END spwrouterarb;

architecture spwrouterarb_arch of spwrouterarb is
    -- Router switch matrix.
    signal s_routing: logic_matrix((numports-1) downto 0, (numports-1) downto 0);
    
    -- Occupied port x.
    signal s_occupied: logic_array((numports-1) downto 0);
    
    -- Requests to port x.
    signal s_request: logic_vector_array((numports-1) downto 0) of std_logic_vector((numports-1) downto 0);

    -- Granted to port x.
    signal s_granted: logic_array((numports-1) downto 0);

    -- hier weitermachen!    
end architecture spwrouterarb_arch;