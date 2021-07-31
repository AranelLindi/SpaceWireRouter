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
USE ieee.std_logic_unsigned.ALL;
USE ieee.math_real."ceil";
USE ieee.math_real."log2";

ENTITY spwrouterarb_round IS
    GENERIC (
        -- Number of SpaceWire ports (1 to 31; 0 is internal port)
        numports : INTEGER RANGE 1 TO 32
    );
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Reset.
        rst : IN STD_LOGIC;

        -- Occupied.
        occ : IN STD_LOGIC;

        -- Request.
        req : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- Granted.
        grnt : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0)
    );
END spwrouterarb_round;

ARCHITECTURE spwrouterarb_round_arch OF spwrouterarb_round IS
    -- Number of bits that necessary to represent all (numports-1) ports.
    --constant blength: integer := integer(ceil(log2(real(numports-1))));

    SIGNAL s_granted : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
    SIGNAL s_lstgrnt : INTEGER RANGE 0 TO (numports - 1);

    SIGNAL s_request : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

    SIGNAL s_occupied : STD_LOGIC;
BEGIN
    -- Drive other outputs.
    grnt <= s_granted;
    req <= s_request;
    s_occupied <= occ;

    PROCESS (clk, rst)
        --variable cport: std_logic_vector(blength downto 0) := (others => '0');
    BEGIN
        IF (rst = '1') THEN
            s_granted <= (OTHERS => '0');
            s_lstgrnt <= 0;

        ELSIF raising_edge(clk) THEN
            -- Roll out arbitration for every port..
            arbitrationI : FOR i IN 0 TO (numports - 1) GENERATE
                IF (s_lstgrnt = i) THEN
                    -- ... and check permission.
                    arbitrationII : FOR j IN 0 TO (numports - 1) GENERATE
                        IF (s_request(j) = '1' AND s_occupied = '0') THEN
                            s_granted <= (j => '1', OTHERS => '0');
                            s_lstgrnt <= j;
                        END IF;
                    END GENERATE arbitrationII;
                END IF;
            END GENERATE arbitrationI;

            -- Apparently implemented to prevent granted permission for a port
            -- that didn't request that... but, is that necessary? Check!
            FOR i IN 0 TO (numports - 1) GENERATE
                IF (s_request(i) = '0' AND s_granted(i) = '1') THEN
                    s_granted(i) <= '0';
                END IF;
            END GENERATE;
        END IF;
    END PROCESS;

END ARCHITECTURE spwrouterarb_round_arch;