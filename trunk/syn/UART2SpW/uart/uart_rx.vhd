----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 29.07.2021 10:50
-- Design Name: Receiver for Uart
-- Module Name: uart_rx
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: 
-- Tool Versions: based on code from: https://www.nandland.com/vhdl/modules/module-uart-serial-port-rs232.html
-- Description: This file contains the Uart Receiver. It is able to receive 8 bits of serial data,
-- one start bit, one stop bit and no parity bit. When receive is complete rxvalid will be driven
-- 'High' for one clock cycle.
-- Dependencies: none
-- 
-- Revision:
-- Revision 1.0 - Implementation tested with uart_impl on Hardware
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

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

        rst : IN STD_LOGIC;

        -- Incoming data bits (serial stream).
        rx_port : IN STD_LOGIC;

        -- 'High' if rx_data containts a valid received byte.
        -- 'Low' when less than 8 bits or nothing was received.
        rx_rdy : OUT STD_LOGIC := '0';

        rx_ack : IN STD_LOGIC;

        -- Received data byte.
        rx_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END uart_rx;

ARCHITECTURE uart_rx_arch OF uart_rx IS
    -- Finite machine states.
    TYPE state_type IS (S_Idle, S_Rx_Start_Bit, S_Rx_Data_Bits, S_Rx_Stop_Bit, S_Cleanup);

    -- Current state.
    SIGNAL state : state_type := S_Idle;

    -- Data sampling shift register.
    SIGNAL s_shiftreg : STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '0');

    -- Internal counters.
    SIGNAL s_clk_count : INTEGER RANGE 0 TO (clk_cycles_per_bit - 1) := 0;
    SIGNAL s_bit_index : INTEGER RANGE 0 TO 7 := 0; -- 8 bits total

    -- Initialize outputs with standard values.
    SIGNAL s_rx_data : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL s_rx_rdy : STD_LOGIC := '0';

BEGIN
    -- Drive outputs.
    rx_rdy <= s_rx_rdy;
    rx_data <= s_rx_data;

    -- Samples incoming data bits into shift register to avoid metastability issues.
    Data_Sampling : PROCESS (clk, rst)
    BEGIN
        IF rising_edge(clk) THEN
            IF rst = '1' THEN
                -- Synchronous reset.
                s_shiftreg(0) <= '1';
                s_shiftreg(1) <= '1';
            ELSE
                s_shiftreg(0) <= rx_port;
                s_shiftreg(1) <= s_shiftreg(0);
            END IF;
        END IF;
    END PROCESS;

    -- Finite state machine of receiver.
    fsm_recv : PROCESS (clk, rst)
    BEGIN
        IF rising_edge(clk) THEN
            IF rst = '1' THEN
                -- Synchronous reset.
                s_clk_count <= 0;
                s_bit_index <= 0;
                s_rx_data <= (OTHERS => '0');
                s_rx_rdy <= '0';
                state <= S_Idle;
            ELSE
                CASE state IS
                    WHEN S_Idle =>
                        IF (s_shiftreg(1) <= '0') THEN -- Start bit detected.
                            state <= S_Rx_Start_Bit;
                            s_rx_rdy <= '0';
                        ELSE
                            state <= S_Idle;
                        END IF;

                    -- Check middle of start bit to make sure its still low.
                    WHEN S_Rx_Start_Bit =>
                        IF s_clk_count = ((clk_cycles_per_bit - 1) / 2) THEN
                            IF (s_shiftreg(1) = '0') THEN
                                s_clk_count <= 0; -- reset counter since we found the middle.
                                state <= s_Rx_Data_Bits;
                            ELSE
                                state <= S_Idle;
                            END IF;
                        ELSE
                            s_clk_count <= (s_clk_count + 1);
                            state <= S_Rx_Start_Bit;
                        END IF;

                    -- Wait (clk_cycles_per_bit - 1) clock cycles to sample serial data.
                    WHEN S_Rx_Data_Bits =>
                        IF (s_clk_count < clk_cycles_per_bit - 1) THEN
                            s_clk_count <= (s_clk_count + 1);
                            state <= s_Rx_Data_Bits;
                        ELSE
                            s_clk_count <= 0;
                            s_rx_data(s_bit_index) <= s_shiftreg(1);

                            -- Check if we have send out all bits.
                            IF (s_bit_index < 7) THEN
                                s_bit_index <= (s_bit_index + 1);
                                state <= S_Rx_Data_Bits;
                            ELSE
                                s_bit_index <= 0;
                                state <= S_Rx_Stop_Bit;
                            END IF;
                        END IF;

                    -- Receive Stop bit. Stop bit = 1
                    WHEN S_Rx_Stop_Bit =>
                        -- Wait (clk_cycles_per_bit - 1) clock cycles for Stop bit to finish.
                        IF (s_clk_count < (clk_cycles_per_bit - 1)) THEN
                            s_clk_count <= (s_clk_count + 1);
                            state <= S_Rx_Stop_Bit;
                        ELSE
                            s_rx_rdy <= '1';
                            s_clk_count <= 0;
                            state <= S_Cleanup;
                        END IF;

                    -- Stay here for one clock cycle.
                    WHEN S_Cleanup =>
                        IF rx_ack = '1' THEN
                            s_rx_rdy <= '0';
                            state <= S_Idle;
                        END IF;

                END CASE;
            END IF;
        END IF;
    END PROCESS;
END uart_rx_arch;