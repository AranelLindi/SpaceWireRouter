----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 01.08.2021 21:13
-- Design Name: SpaceWire Router Table
-- Module Name: spwroutertable
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: Contains a FSM that controls access to routing table in ROM.
--
-- Dependencies: spwram (defined in spwpkg),
-- spwroutertablestates (defined in spwrouterpkg)
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.SPWPKG.ALL; -- Xilinx Spartan3 RAM
USE WORK.SPWROUTERPKG.spwroutertablestates;

ENTITY spwroutertable IS
    GENERIC (
        -- Number of SpaceWire ports.
        numports : INTEGER RANGE 0 TO 31
    );
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Asynchronous reset.
        rst : IN STD_LOGIC;

        -- High if read/write operation is to be carried out. (Only recognized in idle state;  
        -- doesn't have to be High all operation time!) Low when nothing should be done.
        act : IN STD_LOGIC; -- strobe

        -- Type of operation: High if a write process and Low if a read process should be executed.
        -- (Works only if act is High and FSM is in idle state.)
        readwrite : IN STD_LOGIC; -- writeEnable

        -- Specifies bytes which should be overwritten during a write operation in the register. (Word width 32 bits == 4 Bytes)
        -- (Only applies to write operations!)
        dByte : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- dataByteEnable

        -- Memory address at which the operation is to be executed.
        addr : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- address

        -- Word to be written in register.
        wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- writeData

        -- Word to be read from a register.
        rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- readData

        -- High if a read or write operation is in progress.
        proc : OUT STD_LOGIC; -- acknowledge

        -- Debug: Output state
        instate : OUT spwroutertablestates
    );
END spwroutertable;

ARCHITECTURE spwroutertable_arch OF spwroutertable IS
    -- FSM state. (Initial value: S_Idle)
    SIGNAL state : spwroutertablestates := S_Idle;

    -- Intermediate signals.
    SIGNAL s_proc : STD_LOGIC; -- iAcknowledge
    SIGNAL s_rdata : STD_LOGIC_VECTOR(31 DOWNTO 0); -- iReadData

    -- Enables writing process in register.
    SIGNAL s_write_en : STD_LOGIC; -- iWriteEnableRegister

    -- Reades data from register.
    SIGNAL s_ramdata : STD_LOGIC_VECTOR(31 DOWNTO 0); -- ramDataOut

    -- Writes data to register.
    SIGNAL s_wdata : STD_LOGIC_VECTOR(31 DOWNTO 0); -- iWriteData
BEGIN
    -- Drive outputs
    proc <= s_proc;
    rdata <= s_rdata;

    -- Debug
    instate <= state;

    -- Creates 32x256 routing table in ROM.
    -- (Synthesizer for Spartan3 infers to use ROM Block)
    ramXilinx : spwram
    GENERIC MAP(
        abits => 8,
        dbits => 32
    )
    PORT MAP(
        rclk => clk,
        wclk => clk,
        ren => '1',
        raddr => addr,
        rdata => s_ramdata,
        wen => s_write_en,
        waddr => addr,
        wdata => s_wdata
    );

    -- Finite state machine of router table.
    PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN -- reset.
            state <= S_Idle;
            s_proc <= '0';
            s_rdata <= (OTHERS => '0');
            s_wdata <= (OTHERS => '0');
            s_write_en <= '0';

        ELSIF rising_edge(clk) THEN
            CASE state IS
                WHEN S_Idle =>
                    s_proc <= '0';
                    IF (act = '1') THEN
                        IF (readwrite = '1') THEN
                            s_wdata <= wdata;
                            state <= S_Write0;

                        ELSE
                            state <= S_Read0;

                        END IF;
                    END IF;
                WHEN S_Write0 =>
                    -- Additional status to keep write and read cycles (time!) same.
                    state <= S_Write1;

                WHEN S_Write1 =>
                    -- If dByte is '1' then write wdata byte by byte into
                    -- RAM, depending on flag marking in dByte.
                    FOR i IN 1 TO 4 LOOP
                        IF (dByte(i - 1) = '1') THEN
                            s_wdata(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= wdata(((8 * i) - 1) DOWNTO (8 * (i - 1)));

                        ELSE
                            s_wdata(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= s_ramdata(((8 * i) - 1) DOWNTO (8 * (i - 1)));

                        END IF;
                    END LOOP;

                    s_write_en <= '1';
                    s_proc <= '1';
                    state <= S_Write2;

                WHEN S_Write2 =>
                    s_write_en <= '0';
                    s_proc <= '0';
                    state <= S_Wait1;

                WHEN S_Read0 =>
                    state <= S_Read1;

                WHEN S_Read1 =>
                    s_rdata <= s_ramdata;
                    s_proc <= '1';
                    state <= S_Wait0;

                WHEN S_Wait0 => -- several waiting states give time to change external signals.
                    s_proc <= '0';
                    state <= S_Wait1;

                WHEN S_Wait1 =>
                    state <= S_Wait2;

                WHEN S_Wait2 =>
                    state <= S_Wait3;

                WHEN S_Wait3 =>
                    state <= S_Idle;
            END CASE;
        END IF;
    END PROCESS;
END spwroutertable_arch;