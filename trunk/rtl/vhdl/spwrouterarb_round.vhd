----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 31.07.2021 22:38
-- Design Name: SpaceWire Router - Router Arbiter Round Robin
-- Module Name: spwrouterarb_round
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: Ein Ring wird konstruiert, der alle Ports enthält und dem numerisch
-- darauffolgendem Port die höchste Priorität einräumt (numports..0). Ausgehend dabei ist der
-- Port, dem zuletzt der Zugriff gewährt wurde. Bsp für 1 bei insgesamt 3 Ports: 2..0..1
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
        numports : INTEGER RANGE 0 TO 31;

        -- Bit length to map ports.
        blen : INTEGER RANGE 0 TO 5 -- (max 5 bits for 0-31 ports)
    );
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Synchronous reset.
        rst : IN STD_LOGIC;

        -- High if relevant port is already being used by another
        -- transfer process. Low when the port is unused.
        occupied : IN STD_LOGIC; -- occ

        -- Corresponding bit is high when respective port sends
        -- a request to the port.
        request : IN STD_LOGIC_VECTOR(numports DOWNTO 0); -- req

        -- Bit sequence that indicates the access of another port.
        granted : OUT STD_LOGIC_VECTOR(numports DOWNTO 0) -- granted
    );
END spwrouterarb_round;

ARCHITECTURE spwrouterarb_round_arch OF spwrouterarb_round IS
    -- Output registers.
    SIGNAL s_granted : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_request : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_occupied : STD_LOGIC;

    -- Last granted port.
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
                arbitration : FOR i IN numports DOWNTO 0 LOOP
                    IF (s_last_granted = STD_LOGIC_VECTOR(to_unsigned(i, s_last_granted'length))) THEN

                        -- The following ports in the line (0..1..numports..0) will give prefered access to current
                        -- port. Normally in if-statements early conditions takes priority above later.
                        -- Through rolling out for-loops, many seperate if-statements will be
                        -- created. Therefore the highes priority must be listed in the  last order to
                        -- be able to overwrite any previous decision with lower priority.

                        lowerpriority : FOR j IN i DOWNTO 0 LOOP
                            IF (s_request(j) = '1' AND s_occupied = '0') THEN
                                s_granted <= (j => '1', OTHERS => '0');
                                s_last_granted <= STD_LOGIC_VECTOR(to_unsigned(j, s_last_granted'length));
                            END IF;
                        END LOOP lowerpriority;
                        
                        higherpriority : FOR k IN numports DOWNTO (i + 1) LOOP
                            IF (s_request(k) = '1' AND s_occupied = '0') THEN
                                s_granted <= (k => '1', OTHERS => '0');
                                s_last_granted <= STD_LOGIC_VECTOR(to_unsigned(k, s_last_granted'length));
                            END IF;
                        END LOOP higherpriority;
                    END IF;
                END LOOP arbitration;

                -- Revoke previously granted access that is no longer required.
                FOR i IN 0 TO numports LOOP
                    IF (s_request(i) = '0' AND s_granted(i) = '1') THEN
                        s_granted(i) <= '0';
                    END IF;
                END LOOP;
            END IF;
        END IF;
    END PROCESS;

END ARCHITECTURE spwrouterarb_round_arch;