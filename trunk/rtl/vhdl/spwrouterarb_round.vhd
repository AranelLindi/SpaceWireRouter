----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 31.07.2021 22:38
-- Design Name: SpaceWire Router - Router Arbiter Round Robin
-- Module Name: spwrouterarb_round
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA
-- Target Devices: Xilinx FPGAs
-- Tool Versions: -/-
-- Description: A ring is constructed that contains all (source) ports.
-- Starting from a specific port, it gives next higher priority in ascending order
-- (0..numports-1..0). The starting point is always the port to which 
-- access was granted last.
--
-- Dependencies: none
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY spwrouterarb_round IS
    GENERIC (
        -- Number of SpaceWire ports.
        numports : integer range 1 to 32;

        -- Bit length to map ports.
        blen : INTEGER RANGE 0 TO 5 -- (max 5 bits for 0-31 ports)
    );
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Synchronous reset.
        rst : IN STD_LOGIC;

        -- High if this port is already being occupied, low when the port is unused.
        occupied : IN STD_LOGIC;

        -- Shows which ports making an transfer request to this port.
        request : IN STD_LOGIC_VECTOR(numports-1 DOWNTO 0);

        -- Shows which port has been guaranteed access to this port.
        granted : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0)
    );
END spwrouterarb_round;

ARCHITECTURE spwrouterarb_round_arch OF spwrouterarb_round IS
    -- Output registers.
    SIGNAL s_granted : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
    SIGNAL s_request : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
    SIGNAL s_occupied : STD_LOGIC;

    -- Last granted port (for internal purposes).
    SIGNAL s_last_granted : STD_LOGIC_VECTOR(blen DOWNTO 0);
BEGIN
    -- Drive output.
    granted <= s_granted;

    -- Read inputs.
    s_request <= request;
    s_occupied <= occupied;

    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF rst = '1' THEN
                -- Synchronous reset.
                s_granted <= (OTHERS => '0');
                s_last_granted <= STD_LOGIC_VECTOR(to_unsigned(0, s_last_granted'length));
            ELSE
                -- Roll-out arbitration logic for every port.
                arbitration : FOR i IN numports-1 DOWNTO 0 LOOP
                    IF (s_last_granted = STD_LOGIC_VECTOR(to_unsigned(i, s_last_granted'length))) THEN

                        -- The following ports in the line (0..1..numports-1..0) will give prefered access to current
                        -- port. Normally in if-statements early conditions takes priority above later.
                        -- Through rolling out for-loops, many seperate if-statements will be
                        -- created. Therefore the highes priority must be listed in the last order to
                        -- be able to overwrite any previous decision with lower priority.

                        lowerpriority : FOR j IN i DOWNTO 0 LOOP -- [i <= j <= 0]
                            IF (s_request(j) = '1' AND s_occupied = '0') THEN
                                s_granted <= std_logic_vector(to_unsigned(2 ** j, s_granted'length));
                                s_last_granted <= STD_LOGIC_VECTOR(to_unsigned(j, s_last_granted'length));
                            END IF;
                        END LOOP lowerpriority;
                        
                        higherpriority : FOR k IN numports-1 DOWNTO (i + 1) LOOP -- [numports-1 <= k <= (i+1)]
                            IF (s_request(k) = '1' AND s_occupied = '0') THEN
                                s_granted <= std_logic_vector(to_unsigned(2 ** k, s_granted'length));
                                s_last_granted <= STD_LOGIC_VECTOR(to_unsigned(k, s_last_granted'length));
                            END IF;
                        END LOOP higherpriority;
                    END IF;
                END LOOP arbitration;

                -- Revoke previously granted access that is no longer required.
                FOR i IN 0 TO numports-1 LOOP
                    IF (s_request(i) = '0' AND s_granted(i) = '1') THEN
                        s_granted(i) <= '0';
                    END IF;
                END LOOP;
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE spwrouterarb_round_arch;
