----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 01.08.2021 21:13
-- Design Name: SpaceWire Router - Router Table
-- Module Name: spwroutertable
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA
-- Target Devices: Xilinx FPGAs
-- Tool Versions: -/-
-- Description: Contains memory (BRAM) to store the router table according to 
-- SpaceWire specification and fsm to control access to it.
--
-- Dependencies: spwpkg, spwrouterpkg, textio
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.SPWPKG.ALL;
USE WORK.SPWROUTERPKG.ALL;

USE STD.TEXTIO.ALL; -- Used for ROM initialization.

ENTITY spwroutertable IS
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Synchronous reset.
        rst : IN STD_LOGIC;

        -- High to begin register operation in idle state.
        ack_in : IN STD_LOGIC;

        -- Memory address (0-255).
        addr : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- Contains word from register.
        rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- High if a read or write operation has finished (acknowledgment).
        ack_out : OUT STD_LOGIC
    );
END spwroutertable;

ARCHITECTURE spwroutertable_arch OF spwroutertable IS
    -- Function to initialize Routing Table ROM. Reads hexadecimal numbers from text file. 
    -- Each line in file represents a logical address (beginning with 32, ending with 255).
    impure function init_routingtable return array_t is
        file text_file : text open read_mode is "../../syn/MemFiles/RoutingTable_mem.txt";

        variable text_line : line;
        variable ram_content : array_t(32 to 255)(31 downto 0);
    begin
        for i in 32 to 255 loop
            readline(text_file, text_line);
            hread(text_line, ram_content(i));
        end loop;

        return ram_content;
    end function;
    
        -- Routing table
    constant c_routingtable : array_t(32 to 255)(31 downto 0) := init_routingtable;

    -- Buffer for acknowledge output signal.
    SIGNAL s_ack_out : STD_LOGIC;

    -- Output buffer to read from register buffer (s_mem_data).
    SIGNAL s_rdata : STD_LOGIC_VECTOR(31 DOWNTO 0);

    -- FSM state.
    SIGNAL state : spwroutertablestates := S_Idle;
BEGIN
    -- Drive outputs.
    ack_out <= s_ack_out;
    rdata <= s_rdata;

    -- Finite state machine.
    fsm : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF rst = '1' THEN
                -- Synchronous reset.
                s_ack_out <= '0';
                s_rdata <= (OTHERS => '0');
                state <= S_Idle;
            ELSE
                CASE state IS
                    WHEN S_Idle =>
                        -- Wait until access to router table is required.
                        IF (ack_in = '1') THEN
                            state <= S_Read0;
                        END IF;

                    WHEN S_Read0 =>
                        state <= S_Read1;

                    WHEN S_Read1 =>
                        -- Write register data into output buffer.
                        s_rdata <= c_routingtable(to_integer(unsigned(addr)));

                        -- Set output signal to indicate operation.
                        s_ack_out <= '1';
                        state <= S_Wait0;

                    WHEN S_Wait0 => -- Wait time for master to change a signal to low
                        -- Reset signal.
                        s_ack_out <= '0';
                        state <= S_Wait1;

                    WHEN S_Wait1 =>
                        state <= S_Wait2;

                    WHEN S_Wait2 =>
                        state <= S_Wait3;

                    WHEN S_Wait3 =>
                        state <= S_Idle;

                    WHEN OTHERS => -- (Necessary because of unused states problem)
                        state <= S_Idle;
                END CASE;
            END IF;
        END IF;
    END PROCESS fsm;
END spwroutertable_arch;