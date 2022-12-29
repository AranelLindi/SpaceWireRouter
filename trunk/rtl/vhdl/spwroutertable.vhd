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
-- Dependencies: spwpkg, spwrouterpkg
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
    GENERIC (
        -- Number of SpaceWire ports.
        numports : INTEGER RANGE 0 TO 31
    );
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Synchronous reset.
        rst : IN STD_LOGIC;

        -- High to begin register operation in idle state.
        ack_in : IN STD_LOGIC;

        -- High if a write operation; low when a read operation should be performed.
        -- Valid only if ack_in is High and fsm is in idle state.
        --readwrite : IN STD_LOGIC;

        -- Specifies the byte (1-4) which should be overwritten during a write operation in the register.
        --dByte : IN STD_LOGIC_VECTOR(3 DOWNTO 0);

        -- Memory address (0-255).
        addr : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- Word to write into register.
        --wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- Contains word from register.
        rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- High if a read or write operation has finished (acknowledgment).
        ack_out : OUT STD_LOGIC
    );
END spwroutertable;

ARCHITECTURE spwroutertable_arch OF spwroutertable IS
    -- Function to initialize Routing Table ROM.
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

    -- FSM state.
    SIGNAL state : spwroutertablestates := S_Idle;

    -- Buffer for acknowledge output signal.
    SIGNAL s_ack_out : STD_LOGIC;

    -- Grants writing access into register.
    --SIGNAL s_write_enable : STD_LOGIC;

    -- Data buffer to read data from register.
    --SIGNAL s_mem_data : STD_LOGIC_VECTOR(31 DOWNTO 0);

    -- Buffer to write into register.
    --SIGNAL s_wdata : STD_LOGIC_VECTOR(31 DOWNTO 0);

    -- Output buffer to read from register buffer (s_mem_data).
    SIGNAL s_rdata : STD_LOGIC_VECTOR(31 DOWNTO 0);
    
    -- Routing table
    signal s_routingtable : array_t(32 to 255)(31 downto 0) := init_routingtable;
BEGIN
    -- Drive outputs.
    ack_out <= s_ack_out;
    rdata <= s_rdata;

    -- Creates 32x256 routing table in BRAM. (Xilinx synthesizer infers to use RAM Block)
--    ramXilinx : spwram
--        GENERIC MAP(
--            abits => 8, -- ((2**8) - 1) rows
--            dbits => 32 -- 32 bit word width
--        )
--        PORT MAP(
--            rclk => clk,
--            wclk => clk,
--            ren => '1',
--            raddr => addr,
--            rdata => s_mem_data,
--            wen => s_write_enable,
--            waddr => addr,
--            wdata => s_wdata
--        );

    -- Finite state machine.
    fsm : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF rst = '1' THEN
                -- Synchronous reset.
                s_ack_out <= '0';
                s_rdata <= (OTHERS => '0');
--                s_wdata <= (OTHERS => '0');
--                s_write_enable <= '0';
                state <= S_Idle;
            ELSE
                CASE state IS
                    WHEN S_Idle =>
                        -- Wait until access to router table is required.
                        -- s_ack_out <= '0'; -- TODO: Shouldnt be necessary because signal is already deasserted in rst and last states of fsm
                        IF (ack_in = '1') THEN
--                            IF (readwrite = '1') THEN
--                                s_wdata <= wdata;
--                                state <= S_Write0;
--                            ELSE
                                state <= S_Read0;
--                            END IF;
                        END IF;

--                    WHEN S_Write0 =>
--                        -- Additional status to keep write and read-cycles the same number.
--                        state <= S_Write1;

--                    WHEN S_Write1 =>
--                        -- If dByte is 0xf then write wdata byte by byte into RAM, depending on flag marking in dByte.
--                        FOR i IN 1 TO 4 LOOP
--                            IF (dByte(i - 1) = '1') THEN
--                                -- Overwrite
--                                s_wdata(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= wdata(((8 * i) - 1) DOWNTO (8 * (i - 1)));
--                            ELSE
--                                -- Keep unchanged
--                                s_wdata(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= s_mem_data(((8 * i) - 1) DOWNTO (8 * (i - 1)));
--                            END IF;
--                        END LOOP;

--                        s_write_enable <= '1';

--                        -- Set output signal to indicate operation.
--                        s_ack_out <= '1';
--                        state <= S_Write2;

--                    WHEN S_Write2 =>
--                        s_write_enable <= '0';
--                        s_ack_out <= '0';
--                        state <= S_Wait1;

                    WHEN S_Read0 =>
                        state <= S_Read1;

                    WHEN S_Read1 =>
                        -- Write register data into output buffer.
                        s_rdata <= s_routingtable(to_integer(unsigned(addr)));--s_mem_data;

                        -- Set output signal to indicate operation.
                        s_ack_out <= '1';
                        state <= S_Wait0;

                    WHEN S_Wait0 => -- Wait time for master change a signal to low. -- TODO: Check ! (Necessary?)
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
