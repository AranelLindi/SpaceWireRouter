----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 03.08.2021 20:15
-- Design Name: SpaceWire Router Table Arbiter
-- Module Name: spwrouterarb_table
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: Grants permission to router table and registers.
--
-- CAUTION! 'req' and 'grnt' have one more field than ports exist!
-- Thats due the arbitration architecture.
--
-- Dependencies: spwrouterpkg
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.spwrouterpkg.ALL;

ENTITY spwrouterarb_table IS
    GENERIC (
        -- Number of SpaceWire ports.
        numports : INTEGER RANGE 0 TO 31
    );
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Synchronous reset.
        rst : IN STD_LOGIC;

        -- Requests from all ports. (Bit corresponds to port)
        req : IN STD_LOGIC_VECTOR((numports + 1) DOWNTO 0); -- (numports+1) ist augenscheinlich korrekt! Origin Code verwendet einen Port mehr als eigentlich da sind.

        -- Containts which port gets access.
        grnt : OUT STD_LOGIC_VECTOR((numports + 1) DOWNTO 0) -- siehe reg-Kommentar!
    );
END spwrouterarb_table;

ARCHITECTURE spwrouterarb_table_arch OF spwrouterarb_table IS
    SIGNAL s_granted : STD_LOGIC_VECTOR((numports + 1) DOWNTO 0);
BEGIN
    -- Drive output
    grnt <= s_granted;

    -- Arbitration process
    PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            s_granted <= (OTHERS => '0');

        ELSIF rising_edge(clk) THEN

            -- Check each ports (except current) wheather access is required.
            -- Method: First subsequent ones and then previous ones.
            -- Since individual, independent if-conditions are generated by for-loops,
            -- that order must be reversed to keep same priority list if-elsif-conditions would have.
            -- Example: Port4: 5..6..7..0..1..2..3 --> 1..0..7..6..5

            arbitrationaccess : FOR i IN (numports + 1) DOWNTO 0 LOOP
                IF (grnt(i) = '1' AND req(i) = '0') THEN
                    preports : FOR j IN (i - 1) DOWNTO 0 LOOP
                        IF (req(j) = '1') THEN
                            s_granted <= ((j => '1'), (OTHERS => '0'));
                        END IF;
                    END LOOP preports;
                    -- except current port i
                    seqports : FOR k IN (numports + 1) DOWNTO (i + 1) LOOP
                        IF (req(k) = '1') THEN
                            s_granted <= ((k => '1'), (OTHERS => '0'));
                        END IF;
                    END LOOP seqports;
                END IF;
            END LOOP arbitrationaccess;
        END IF;
    END PROCESS;
END spwrouterarb_table_arch;