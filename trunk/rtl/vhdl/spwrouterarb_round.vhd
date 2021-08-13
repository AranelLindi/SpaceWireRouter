----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 31.07.2021 22:38
-- Design Name: SpaceWire Router Package
-- Module Name: spwrouterarb_round
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
use ieee.numeric_std.all;
--USE work.spwrouterpkg.ALL;

ENTITY spwrouterarb_round IS
    GENERIC (
        -- Number of SpaceWire ports.
        numports : INTEGER RANGE 0 TO 31
    );
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Asynchronous reset.
        rst : IN STD_LOGIC;

        -- High if relevant port is already being used by another
        -- process. Low when the port is unused.
        occ : IN STD_LOGIC;

        -- Corresponding bit is high when respective port sends
        -- a request to the port which is defined under occ.
        req : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Bit sequence that indicates the access of another port.
        grnt : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
        
        lst : out std_logic_vector(4 downto 0) -- debug
    );
END spwrouterarb_round;

ARCHITECTURE spwrouterarb_round_arch OF spwrouterarb_round IS
    -- Output registers
    SIGNAL s_granted : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_request : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_occupied : STD_LOGIC;

    -- Last granted port.
    SIGNAL s_lstgrnt : std_logic_vector(4 downto 0); -- (5 bits for 0-31 ports)
BEGIN
    -- Intermediate signals
    s_request <= req;
    s_occupied <= occ;

    -- Drive output.
    grnt <= s_granted;
    
    -- Debug
    lst <= s_lstgrnt;
    
    PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            s_granted <= (OTHERS => '0');
            s_lstgrnt <= std_logic_vector(to_unsigned(0, s_lstgrnt'length));

        ELSIF rising_edge(clk) THEN
            -- Roll out arbitration logic for every port.
            arbitration : FOR i IN 0 TO numports LOOP
                IF (s_lstgrnt = std_logic_vector(to_unsigned(i, s_lstgrnt'length))) THEN

                    -- Following ports in line (0..numports..0) are given prefered access to current
                    -- port. Normally in if-statements early conditions takes priority over later.
                    -- Through rolling out for-loops, many seperate if statements will be
                    -- created. Therefore the highes priority must be listed last in order to
                    -- be able to overwrite any previous decision with lower priority.

                    lowerpriority : FOR j IN i DOWNTO 0 LOOP
                        IF (s_request(j) = '1' AND s_occupied = '0') THEN
                            s_granted <= (j => '1', OTHERS => '0');
                            s_lstgrnt <= std_logic_vector(to_unsigned(j, s_lstgrnt'length));
                        END IF;
                    END LOOP lowerpriority;
                    higherpriority : FOR k IN numports DOWNTO (i + 1) LOOP
                        IF (s_request(k) = '1' AND s_occupied = '0') THEN
                            s_granted <= (k => '1', OTHERS => '0');
                            s_lstgrnt <= std_logic_vector(to_unsigned(k, s_lstgrnt'length));
                        END IF;
                    END LOOP higherpriority;
                END IF;
            END LOOP arbitration;

            -- Probably to reset s_granted signal in case that none request was applied.
            FOR i IN 0 TO numports LOOP
                IF (s_request(i) = '0' AND s_granted(i) = '1') THEN
                    s_granted(i) <= '0';
                END IF;
            END LOOP;
        END IF;
    END PROCESS;

END ARCHITECTURE spwrouterarb_round_arch;