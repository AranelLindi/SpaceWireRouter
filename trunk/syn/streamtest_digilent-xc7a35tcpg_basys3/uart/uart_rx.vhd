----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 29.07.2021 10:50
-- Design Name: Receiver for Uart
-- Module Name: uart_rx
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Dependencies: none
-- 
-- Revision:
-- Revision 1.0 - Implementation tested with uart_impl on Hardware
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY uart_rx IS
    GENERIC (
        -- frequency clk / frequency Uart
        -- Example: 10 MHz Clock, 115200 baud rate Uart
        -- 10000000 / 115200 = 87
        clk_cycles_per_bit : INTEGER
    );
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Reset.
        rst : IN STD_LOGIC;

        -- Incoming data bits (serial stream).
        rx_port : IN STD_LOGIC;

        -- HIGH if receiver got new byte; LOW when nothing was received
        rx_ack : IN STD_LOGIC;

        -- HIGH if receiver is busy; LOW when in idle-mode
        rx_rdy : OUT STD_LOGIC;

        -- Received data byte.
        rx_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END uart_rx;

ARCHITECTURE uart_rx_arch OF uart_rx IS
    -- Constants for frequency
    CONSTANT freq : INTEGER := clk_cycles_per_bit;

    -- Counter needed for baud_rate
    SIGNAL s_rx_counter : NATURAL RANGE 0 TO freq := freq - 1;
    SIGNAL s_rx_strobe : STD_LOGIC := '0';
    SIGNAL s_rx_bitno : NATURAL RANGE 0 TO 8 := 0;

    -- FSM for rx operation
    TYPE fsm_state IS (s_Idle, s_Start, s_Data, S_Stop, s_Full);
    SIGNAL state : fsm_state := s_Idle;
BEGIN
    rx_fsm : PROCESS (clk) IS
    BEGIN
        -- handle normal operation
        IF rising_edge(clk) THEN
            IF (rst = '1') THEN
                -- synchronous reset.
                state <= s_Idle;
                s_rx_bitno <= 0;
            ELSE
                -- handle rx fsm
                CASE state IS
                    WHEN s_Idle =>
                        IF (rx_port = '0') THEN
                            state <= s_Start;
                        END IF;

                    WHEN s_Start =>
                        IF (s_rx_strobe = '1') THEN
                            state <= s_Data;
                        END IF;

                    WHEN s_Data =>
                        IF (s_rx_strobe = '1') THEN
                            rx_data(s_rx_bitno) <= rx_port;
                            s_rx_bitno <= s_rx_bitno + 1;
                            IF (s_rx_bitno = 7) THEN
                                state <= S_Stop;
                            END IF;
                        END IF;

                    WHEN s_Stop =>
                        IF (s_rx_strobe = '1' AND rx_port = '1') THEN
                            s_rx_bitno <= 0;
                            rx_rdy <= '1';
                            state <= s_Full;
                        END IF;

                    WHEN s_Full =>
                        IF (rx_ack = '1') THEN
                            rx_rdy <= '0';
                            state <= s_Idle;
                        END IF;
                END CASE;
            END IF;
        END IF;
    END PROCESS rx_fsm;

    counters : PROCESS (clk) IS
    BEGIN
        IF rising_edge(clk) THEN
            IF (rst = '1') THEN
                s_rx_counter <= freq - 1;
                s_rx_strobe <= '0';
            ELSE
                -- handle counter
                IF (state = s_Idle AND rx_port = '0') THEN
                    s_rx_counter <= freq / 2;
                ELSE
                    IF (s_rx_counter = 0) THEN
                        s_rx_counter <= freq - 1;
                    ELSE
                        s_rx_counter <= s_rx_counter - 1;
                    END IF;
                END IF;

                -- handle rx_strobe
                IF (s_rx_counter = 1) THEN
                    s_rx_strobe <= '1';
                ELSE
                    s_rx_strobe <= '0';
                END IF;
            END IF;
        END IF;
    END PROCESS counters;
END uart_rx_arch;