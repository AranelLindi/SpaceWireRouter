----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 01.08.2021 21:13
-- Design Name: SpaceWire Router -- Router Table
-- Module Name: spwroutertable
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA
-- Target Devices: Xilinx FPGAs
-- Tool Versions: -/-
-- Description: Contains memory (BRAM) to store the router table according to 
-- SpaceWire specification and fsm to control access to it.
--
-- Dependencies: spwram (spwpkg), spwroutertablestates (spwrouterpkg)
-- 
-- Revision: 0.9 - Simulation and hardware test were sucessful.
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.SPWPKG.ALL;
USE WORK.SPWROUTERPKG.ALL;

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
        ack_in : IN STD_LOGIC; -- strobe -- act

        -- High if a write operation; Low when a read operation should be performed.
        -- Valid only if ack_in is High and fsm in idle state.
        readwrite : IN STD_LOGIC; -- writeEnable

        -- Specifies the byte (1-4) which should be overwritten during a write operation in the register.
        -- (0xf (1111_2) for every byte)
        dByte : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- dataByteEnable

        -- Memory address (0-255).
        addr : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- address

        -- Word to write into register.
        wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- writeData

        -- Contains word from register.
        rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- readData

        -- High if a read or write operation has finished (acknowledgment).
        ack_out : OUT STD_LOGIC -- acknowledge -- proc
    );
END spwroutertable;

ARCHITECTURE spwroutertable_arch OF spwroutertable IS
    -- FSM state.
    SIGNAL state : spwroutertablestates := S_Idle;

    -- Buffer for output signals.
    SIGNAL s_ack_out : STD_LOGIC; -- iAcknowledge

    -- Grants writing access into register.
    SIGNAL s_write_enable : STD_LOGIC; -- iWriteEnableRegister

    -- Data buffer du read data from register.
    SIGNAL s_mem_data : STD_LOGIC_VECTOR(31 DOWNTO 0); -- ramDataOut

    -- Buffer to write into register.
    SIGNAL s_wdata : STD_LOGIC_VECTOR(31 DOWNTO 0); -- iWriteData

    -- Output buffer to read from register buffer (s_mem_data).
    SIGNAL s_rdata : STD_LOGIC_VECTOR(31 DOWNTO 0); -- iReadData
BEGIN
    -- Drive outputs
    ack_out <= s_ack_out;
    rdata <= s_rdata;

    -- Creates 32x256 routing table in BRAM. (Xilinx synthesizer infers to use ROM Block)
--    ramXilinx : spwram
--    GENERIC MAP(
--        abits => 8, -- ((2**8) - 1) rows
--        dbits => 32 -- 32 bit size
--    )
--    PORT MAP(
--        rclk => clk,
--        wclk => clk,
--        ren => '1',
--        raddr => addr,
--        rdata => s_mem_data,
--        wen => s_write_enable,
--        waddr => addr,
--        wdata => s_wdata
--    );

    

    -- Finite state machine.
    fsm : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF rst = '1' THEN
                -- Synchronous reset.
                s_ack_out <= '0';
                s_rdata <= (OTHERS => '0');
                s_wdata <= (OTHERS => '0');
                s_write_enable <= '0';
                state <= S_Idle;
            ELSE
                CASE state IS
                    WHEN S_Idle =>
                        -- Wait until access to router table is required.
                        -- s_ack_out <= '0'; -- Potenzieller Fehler! Müsste aber meiner Ansicht nacht hier nicht noch auf Null gesetzt werden, da das in den vorherigen States passiert
                        IF (ack_in = '1') THEN
                            IF (readwrite = '1') THEN
                                s_wdata <= wdata;
                                state <= S_Write0;
                            ELSE
                                state <= S_Read0;
                            END IF;
                        END IF;

                    WHEN S_Write0 =>
                        -- Additional status to keep write and read-cycles the same number.
                        state <= S_Write1;

                    WHEN S_Write1 =>
                        -- If dByte is 0xf then write wdata byte by byte into RAM, depending on flag marking in dByte.
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                -- Overwrite
                                s_wdata(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= wdata(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            ELSE
                                -- Keep unchanged
                                s_wdata(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= s_mem_data(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;

                        -- Set write signal.
                        s_write_enable <= '1';

                        -- Set output signal to show operation.
                        s_ack_out <= '1';
                        state <= S_Write2;

                    WHEN S_Write2 =>
                        -- Reset signals.
                        s_write_enable <= '0';
                        s_ack_out <= '0';

                        state <= S_Wait1;

                    WHEN S_Read0 =>
                        state <= S_Read1;

                    WHEN S_Read1 =>
                        -- Write register data into output buffer.
                        s_rdata <= s_mem_data;

                        -- Set output signal to show operation.
                        s_ack_out <= '1';

                        state <= S_Wait0;

                    WHEN S_Wait0 => -- Wait time for master change a signal to Low. (Nochmal nachvollziehen ob das gebraucht wird!) Eventuell nur dafür da, ein paar Takte zu verzögern
                        -- Reset signal.
                        s_ack_out <= '0';

                        state <= S_Wait1;

                    WHEN S_Wait1 =>
                        state <= S_Wait2;

                    WHEN S_Wait2 =>
                        state <= S_Wait3;

                    WHEN S_Wait3 =>
                        state <= S_Idle;

                    WHEN OTHERS => -- (Necessary for problem of unused states)
                        state <= S_Idle;
                END CASE;
            END IF;
        END IF;
    END PROCESS fsm;
END spwroutertable_arch;