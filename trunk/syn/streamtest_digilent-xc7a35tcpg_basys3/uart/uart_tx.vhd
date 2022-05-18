----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 29.07.2021 18:24
-- Design Name: Transmiter for Uart
-- Module Name: uart_tx
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Dependencies: none
-- 
-- Revision:
-- Revision 0.1 - Code implementation, formatting, commenting; not yet tested or simulated!
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY uart_tx IS
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

        -- Byte to transmit throug UART.
        tx_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- HIGH if byte on tx_data will be sent; LOW when nothing should be send.
        tx_ack : IN STD_LOGIC;

        -- Outgoing data bits (serial stream).
        tx_port : OUT STD_LOGIC := '1';

        -- HIGH if transmitter is ready to send; LOW transmitter is processing.
        tx_rdy : OUT STD_LOGIC := '1'
    );
END uart_tx;

ARCHITECTURE uart_tx_arch OF uart_tx IS
    CONSTANT freq : INTEGER := clk_cycles_per_bit;

    -- Counter needed for baud_rate
    SIGNAL s_tx_counter : NATURAL RANGE 0 TO freq := freq - 1;
    SIGNAL s_tx_strobe : STD_LOGIC := '0';
    SIGNAL s_tx_bitno : NATURAL RANGE 0 TO 8 := 0;

    -- to latch the input
    SIGNAL s_tx_latch : STD_LOGIC_VECTOR(7 DOWNTO 0);

    -- fsm for tx operation
    TYPE fsm_state IS (s_Idle, s_Start, s_Data, s_Stop);
    SIGNAL state : fsm_state := S_Idle;
BEGIN
    tx_fsm : PROCESS (clk) IS
    BEGIN
        -- handle normal operation
        IF rising_edge(clk) THEN
            IF (rst = '1') THEN
                -- synchronous reset.
                state <= s_Idle;
                s_tx_bitno <= 0;
            Else
                -- handle tx fsm
                CASE state IS
                    WHEN s_Idle =>
                        IF (tx_ack <= '1') THEN
                            tx_rdy <= '0';
                            s_tx_latch <= tx_data;
                            state <= s_Start;
                        END IF;
    
                    WHEN s_Start =>
                        IF (s_tx_strobe = '1') THEN
                            tx_port <= '0';
                            state <= s_Data;
                        END IF;
    
                    WHEN s_Data =>
                        IF (s_tx_strobe = '1') THEN
                            tx_port <= s_tx_latch(s_tx_bitno);
                            s_tx_bitno <= s_tx_bitno + 1;
                            IF (s_tx_bitno = 7) THEN
                                state <= s_Stop;
                            END IF;
                        END IF;
    
                    WHEN s_Stop =>
                        IF (s_tx_strobe = '1') THEN
                            s_tx_bitno <= 0;
                            tx_port <= '1';
                            tx_rdy <= '1';
                            state <= s_Idle;
                        END IF;
                END CASE;
        END IF;
        end if;
    END PROCESS tx_fsm;

    counters : PROCESS (clk) IS
    BEGIN
        IF rising_edge(clk) THEN
            IF (rst = '1') THEN
                s_tx_counter <= freq - 1;
                s_tx_strobe <= '0';
            ELSE
            -- handle counter
            IF (state = s_Idle AND tx_ack = '1') THEN
                s_tx_counter <= freq - 1;
            ELSE
                IF (s_tx_counter = 0) THEN
                    s_tx_counter <= freq - 1;
                ELSE
                    s_tx_counter <= s_tx_counter - 1;
                END IF;

                -- handle rx_strobe
                IF (s_tx_counter = 1) THEN
                    s_tx_strobe <= '1';
                ELSE
                    s_tx_strobe <= '0';
                END IF;
            END IF;
         end if;
         end if;
        END PROCESS counters;
    END uart_tx_arch;