----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 05.08.2021 19:34
-- Design Name: Testbench for SpaceWire Router Table
-- Module Name: spwroutertable_tb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA
-- Target Devices: Xilinx FPGAs
-- Tool Versions: -/-
-- Description:
--
-- Dependencies: spwram (spwpkg); spwroutertablestates (spwrouterpkg)
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.spwrouterpkg.ALL;

ENTITY spwroutertable_tb IS
END;

ARCHITECTURE spwroutertable_tb_arch OF spwroutertable_tb IS
    -- Design under test.
    COMPONENT spwroutertable
        GENERIC (
            numports : INTEGER RANGE 0 TO 31
        );
        PORT (
            -- instate : out spwroutertablestates; -- Debug port - uncomment for better simulation results.
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            ack_in : IN STD_LOGIC;
            readwrite : IN STD_LOGIC;
            dByte : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            addr : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            ack_out : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Number of SpaceWire ports.
    CONSTANT numports : INTEGER RANGE 0 TO 31 := 2; -- 3 ports (0 - 2)

    -- System clock.
    SIGNAL clk : STD_LOGIC;

    -- Asynchronous reset.
    SIGNAL s_rst : STD_LOGIC;

    -- High if read/write operation is to be performed.
    -- (Only recognized when FSM is in idle.)
    SIGNAL s_ack_in : STD_LOGIC;

    -- Type of operation: High if a write process and low if
    -- a read process should be executed. (Works only if 
    -- act is High and FSM is in idle state.)
    SIGNAL s_readwrite : STD_LOGIC;

    -- Specifies the byte that is to be overwritten during a
    -- write operation in the register.
    -- (Word width 32 bits == 4 Bytes)
    SIGNAL s_dByte : STD_LOGIC_VECTOR(3 DOWNTO 0);

    -- Memory address at which the operation is to be executed.
    SIGNAL s_addr : STD_LOGIC_VECTOR(7 DOWNTO 0);

    -- Word to be written in register.
    SIGNAL s_wdata : STD_LOGIC_VECTOR(31 DOWNTO 0);

    -- Word to be read from a register.
    SIGNAL s_rdata : STD_LOGIC_VECTOR(31 DOWNTO 0);

    -- High if a read or write operation is in progress.
    SIGNAL s_ack_out : STD_LOGIC;
    -- Clock period. (100 MHz)
    CONSTANT clock_period : TIME := 10 ns;
BEGIN
    -- Design under test.
    dut : spwroutertable
    GENERIC MAP(
        numports => numports
    )
    PORT MAP(
        -- instate => dut_state, -- See component declaration!
        clk => clk,
        rst => s_rst,
        ack_in => s_ack_in,
        readwrite => s_readwrite,
        dByte => s_dByte,
        addr => s_addr,
        wdata => s_wdata,
        rdata => s_rdata,
        ack_out => s_ack_out
    );

    -- Performs test operations exactly when (fsm)-machine is ready to receive them. 
    PROCESS
        --variable counter : integer range 0 to 255 := 0;
    BEGIN
        -- Initialization
        s_rst <= '1', '0' AFTER clock_period;
        s_ack_in <= '0';
        s_readwrite <= '0';
        s_dByte <= (OTHERS => '0');
        s_addr <= (OTHERS => '0');
        s_wdata <= (OTHERS => '0');

        WAIT FOR clock_period;

        -- Simulation


        -- 1. Write the corresponding number in bit-coded form in each field.
        REPORT "1. Write the corresponding number in bit-coded form in each field";
        s_readwrite <= '1'; -- write mode
        s_dByte <= (OTHERS => '1'); -- always overwrite all four bytes

        -- Fill entire routing table (including first 31 rows that aren't not used in field)
        FOR i IN 0 TO 255 LOOP
            s_addr <= STD_LOGIC_VECTOR(to_unsigned(i, s_addr'length));
            s_wdata <= STD_LOGIC_VECTOR(to_unsigned(i, s_wdata'length));
            s_ack_in <= '1';
            WAIT FOR 7 * clock_period; -- Wait 7 states: S_Idle->S_Write0->S_Write1->S_Write2->S_Wait1->S_Wait2->S_Wait3->S_Idle
            s_ack_in <= '0';
            WAIT FOR clock_period; -- Wait one cycle to seperate next iteration from previous one
        END LOOP;
        REPORT "Finished Step 1, current time = " & TIME'image(Now);

        -- Reset signals.
        s_addr <= (OTHERS => '0');
        s_wdata <= (OTHERS => '0');
        WAIT FOR 2 * clock_period; -- wait some time to get distance


        -- 2. Iterate through entire router table and read every field
        REPORT "2. Iterate through entire router table and read every field";
        s_readwrite <= '0'; -- read mode
        s_dByte <= (OTHERS => '0'); -- shouldn't affect result

        FOR i IN 0 TO 255 LOOP
            s_addr <= STD_LOGIC_VECTOR(to_unsigned(i, s_addr'length));
            s_ack_in <= '1';
            WAIT FOR 7 * clock_period;
            s_ack_in <= '0';
            WAIT FOR clock_period;
        END LOOP;
        REPORT "Finished Step 2, current time = " & TIME'image(Now);

        s_addr <= (OTHERS => '0');
        WAIT FOR 2 * clock_period; -- wait some time to get distance


        -- 3. Partial overwriting of data
        REPORT "Partial overwriting of data";
        s_dByte <= (3 => '1', 2 => '0', 1 => '0', 0 => '1'); -- first and last byte should be used only
        s_wdata <= (31 DOWNTO 8 => '1', 7 DOWNTO 0 => '0'); -- to make it easier replace first three bytes with 1s, last byte with 0s
        s_readwrite <= '1'; -- write mode

        s_addr <= STD_LOGIC_VECTOR(to_unsigned(31, s_addr'length));
        s_ack_in <= '1'; -- overwrite entry 31
        WAIT FOR 7 * clock_period;
        s_ack_in <= '0';
        WAIT FOR clock_period;
        s_addr <= STD_LOGIC_VECTOR(to_unsigned(255, s_addr'length));
        s_dByte <= not s_dByte; -- flipp all bits
        s_ack_in <= '1'; -- overwrite entry 255 (last row)
        WAIT FOR 7 * clock_period;
        s_ack_in <= '0';
        WAIT FOR clock_period;
        REPORT "Finished Step 3, current time = " & TIME'image(Now);


        -- 4. Read previously changed fields
        REPORT "Read previously changed fields";
        s_dByte <= (OTHERS => '0');
        s_wdata <= (OTHERS => '0');
        s_readwrite <= '0'; -- read mode

        s_addr <= STD_LOGIC_VECTOR(to_unsigned(31, s_addr'length));
        s_ack_in <= '1'; -- read entry 31
        WAIT FOR 7 * clock_period;
        s_ack_in <= '0';
        WAIT FOR clock_period;
        s_addr <= STD_LOGIC_VECTOR(to_unsigned(255, s_addr'length));
        s_ack_in <= '1'; -- read entry 255 (last row)
        WAIT FOR 7 * clock_period;
        s_ack_in <= '0';
        WAIT FOR 2 * clock_period;
        REPORT "Finished Step 4, current time = " & TIME'image(Now);
    END PROCESS;

    -- Creates clock and controls counter.
    clocking : PROCESS
    BEGIN
        clk <= '0', '1' AFTER clock_period / 2;
        WAIT FOR clock_period;
    END PROCESS;
END spwroutertable_tb_arch;