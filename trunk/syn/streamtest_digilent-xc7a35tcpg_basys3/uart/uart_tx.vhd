----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 29.07.2021 18:24
-- Design Name: Transmiter for Uart
-- Module Name: uart_tx
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: 
-- Tool Versions: based on code from: https://www.nandland.com/vhdl/modules/module-uart-serial-port-rs232.html
-- Description: This file contains the Uart Transmitter. This transmitter is able to transmit
-- 8 bits of serial data, one start bit, one stop bit and no parity bit. When transmit is
-- complete txdone will be driven 'High' for one clock cycle.
-- Dependencies: none
-- 
-- Revision:
-- Revision 0.1 - Code implementation, formatting, commenting; not yet tested or simulated!
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

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

        -- 'High' if transmitter shall start to send tx_byte.
        -- 'Low' when nothing should be send.
        txwrite : IN STD_LOGIC;

        -- Data byte to be send.
        txdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- 'High' if transmitting process has started.
        -- 'Low' when system is in idle mode.
        txactive : OUT STD_LOGIC;

        -- Outgoing serial data stream.
        txstream : OUT STD_LOGIC;

        -- 'High' if transmitting process for one byte is complete.
        -- 'Low' when transmitter is in idle or transmitting mode.
        txdone : OUT STD_LOGIC
    );
END uart_tx;

ARCHITECTURE uart_tx_arch OF uart_tx IS
    -- Finite machine states.
    TYPE state_type IS (S_Idle, S_Tx_Start_Bit, S_Tx_Data_Bits, S_Tx_Stop_Bit, S_Cleanup);

    -- Current state.
    SIGNAL state : state_type := S_Idle;

    -- Internal counters.
    SIGNAL s_clk_count : INTEGER RANGE 0 TO (clk_cycles_per_bit - 1) := 0;
    SIGNAL s_bit_index : INTEGER RANGE 0 TO 7 := 0; -- 8 Bits total

    -- Initialize outputs with standard values.
    SIGNAL s_txdata : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL s_txdone : STD_LOGIC := '0';
BEGIN
    -- Drive other output.
    txdone <= s_txdone;

    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            CASE state IS
                WHEN S_Idle =>
                    txactive <= '0';
                    txstream <= '1'; -- Drive line 'High' for Idle.
                    s_txdone <= '0';
                    s_clk_count <= 0;
                    s_bit_index <= 0;

                    IF (txwrite = '1') THEN
                        s_txdata <= txdata;
                        state <= S_Tx_Start_Bit;
                    ELSE
                        state <= S_Idle;
                    END IF;

                -- Send out Start Bit. Start bit = 0
                WHEN S_Tx_Start_Bit =>
                    txactive <= '1';
                    txstream <= '0';

                    -- Wait (clk_cycles_per_bit - 1) clock cycles for start bit to finish.
                    IF (s_clk_count < (clk_cycles_per_bit - 1)) THEN
                        s_clk_count <= (s_clk_count + 1);
                        state <= S_Tx_Start_Bit;
                    ELSE
                        s_clk_count <= 0;
                        state <= S_Tx_Data_Bits;
                    END IF;

                -- Wait (clk_cycles_per_bit - 1) clock cycles for data bits to finish.
                WHEN S_Tx_Data_Bits =>
                    txstream <= s_txdata(s_bit_index);

                    IF (s_clk_count < clk_cycles_per_bit - 1) THEN
                        s_clk_count <= (s_clk_count + 1);
                        state <= S_Tx_Data_Bits;
                    ELSE
                        s_clk_count <= 0;

                        -- Check if we have sent out all bits.
                        IF (s_bit_index < 7) THEN
                            s_bit_index <= (s_bit_index + 1);
                            state <= S_Tx_Data_Bits;
                        ELSE
                            s_bit_index <= 0;
                            state <= S_Tx_Stop_Bit;
                        END IF;
                    END IF;

                -- Send out Stop bit. Stop bit = 1
                WHEN S_Tx_Stop_Bit =>
                    txstream <= '1';

                    -- Wait (clk_cycles_per_bit - 1) clock cycles for Stop bit to finish.
                    IF (s_clk_count < (clk_cycles_per_bit - 1)) THEN
                        s_clk_count <= (s_clk_count + 1);
                        state <= S_Tx_Stop_Bit;
                    ELSE
                        s_txdone <= '1';
                        s_clk_count <= 0;
                        state <= S_Cleanup;
                    END IF;

                -- Stay here for one clk cycle.
                WHEN S_Cleanup =>
                    txactive <= '0';
                    s_txdone <= '1';
                    state <= S_Idle;
                    
                when others =>
                    state <= S_Idle;
            END CASE;
        END IF;
    END PROCESS;
END uart_tx_arch;