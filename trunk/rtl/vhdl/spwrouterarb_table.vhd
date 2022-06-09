----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 03.08.2021 20:15
-- Design Name: SpaceWire Router Table Arbiter
-- Module Name: spwrouterarb_table
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: Grants permission to router table and registers.
--
-- Dependencies: spwrouterpkg
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

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
        request : IN STD_LOGIC_VECTOR(numports DOWNTO 0); -- req

        -- Containts which port gets access.
        granted : OUT STD_LOGIC_VECTOR(numports DOWNTO 0) -- grnt
    );
END spwrouterarb_table;

ARCHITECTURE spwrouterarb_table_arch OF spwrouterarb_table IS
    SIGNAL s_granted : STD_LOGIC_VECTOR(numports DOWNTO 0);
BEGIN
    -- Drive output
    granted <= s_granted;

    -- Arbitration process
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF rst = '1' THEN
                -- Synchronous reset.
                s_granted <= (0 => '1', OTHERS => '0'); -- Assign increased priority for port0 (internal configuration port).
            ELSE
                -- Check each ports (except current) wheather access is required.
                -- Method: First subsequent ones and then previous ones.
                -- Since individual, independent if-conditions are generated by for-loops,
                -- that order must be reversed to keep same priority list if-elsif-conditions would have.
                -- Example: Port4: 5..6..7..0..1..2..3 --> 1..0..7..6..5

                -- To have the right priority the order was changed in unusual order

                arbitrationaccess : FOR i IN numports DOWNTO 0 LOOP
                    IF (s_granted(i) = '1' AND request(i) = '0') THEN
                        preports : FOR j IN (i - 1) DOWNTO 0 LOOP
                            IF (request(j) = '1') THEN
                                s_granted <= STD_LOGIC_VECTOR(to_unsigned(2 ** j, s_granted'length));
                            END IF;
                        END LOOP preports;
                        -- except current port i
                        seqports : FOR k IN numports DOWNTO (i + 1) LOOP
                            IF (request(k) = '1') THEN
                                s_granted <= STD_LOGIC_VECTOR(to_unsigned(2 ** k, s_granted'length));
                            END IF;
                        END LOOP seqports;
                    END IF;
                END LOOP arbitrationaccess;
            END IF;
        END IF;
    END PROCESS;
END spwrouterarb_table_arch;