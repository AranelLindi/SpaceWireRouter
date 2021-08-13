----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 05.08.2021 19:34
-- Design Name: Testbench for SpaceWire Router Table
-- Module Name: spwroutertable_tb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: 
-- Tool Versions:
-- Description: 
--
-- Dependencies: spwpkg (spwram)
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.Std_logic_1164.ALL;
USE IEEE.Numeric_Std.ALL;

ENTITY spwroutertable_tb IS
END;

ARCHITECTURE spwroutertable_tb_arch OF spwroutertable_tb IS

    COMPONENT spwroutertable
        GENERIC (
            numports : INTEGER RANGE 0 TO 31
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            act : IN STD_LOGIC;
            readwrite : IN STD_LOGIC;
            dByte : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            addr : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            proc : OUT STD_LOGIC
        );
    END COMPONENT;

    -- TODO: Initial values...
    -- System clock.
    SIGNAL clk : STD_LOGIC;

    -- Asynchronous reset.
    SIGNAL rst : STD_LOGIC := '0';

    -- High if read/write operation is to be performed.
    -- (Only recognized when FSM is in idle.)
    SIGNAL act : STD_LOGIC := '0';

    -- type of operation: High if a write process and Low if
    -- a read process should be executed. (Works only if 
    -- act is High and FSM is in idle state.)
    SIGNAL readwrite : STD_LOGIC := '0';

    -- Specifies the byte that is to be overwritten during a
    -- write operation in the register.
    -- (Word width 32 bits == 4 Bytes)
    SIGNAL dByte : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '1');

    -- Memory address at which the operation is to be executed.
    SIGNAL addr : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');

    -- Word to be written in register.
    SIGNAL wdata : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '1');

    -- Word to be read from a register.
    SIGNAL rdata : STD_LOGIC_VECTOR(31 DOWNTO 0);

    -- High if a read or write operation is in progress.
    SIGNAL proc : STD_LOGIC;
    -- Clock period. (100 MHz)
    CONSTANT clock_period : TIME := 10 ns;
    SIGNAL stop_the_clock : BOOLEAN;
    -- TODO: Number of simulated ports.
    CONSTANT sim_numports : INTEGER RANGE 0 TO 31 := 4;

    -- TODO: Testbench switcher
    SHARED VARIABLE sw_rst : BOOLEAN := true; -- controls reset.
    -- Counter: Helps to fire events.
    SIGNAL counter : INTEGER := 0;
BEGIN
    -- Design under test.
    dut : spwroutertable GENERIC MAP(numports => sim_numports)
    PORT MAP(
        clk => clk,
        rst => rst,
        act => act,
        readwrite => readwrite,
        dByte => dByte,
        addr => addr,
        wdata => wdata,
        rdata => rdata,
        proc => proc);

    -- Task sequence.
    testsequence : PROCESS
    BEGIN
        -- 1. Write
        act <= '1'; -- activate router table
        readwrite <= '1'; -- write
        dByte <= (OTHERS => '1'); -- write in all four bits
        addr <= (OTHERS => '0'); -- write in 1st field of array
        wdata <= "10101011101010101010101011101010"; -- word to be written

        WAIT FOR (2 * clock_period);

        -- 2. Read
        act <= '1';
        readwrite <= '0'; -- read
        dByte <= (3 => '1', 0 => '1', OTHERS => '0'); -- read first and last byte
        addr <= (OTHERS => '0'); -- first array field

        WAIT FOR (2 * clock_period);

        -- 3. Try to read in inactive mode
        act <= '0'; -- should be '1'
        readwrite <= '0'; -- read
        dByte <= (3 => '1', 0 => '1', OTHERS => '0'); -- read first and last byte
        addr <= (OTHERS => '0'); -- first array field

        WAIT FOR (2 * clock_period);

        -- 4. Write without permission
        act <= '1';
        readwrite <= '0'; -- should bei '1'
        dByte <= (OTHERS => '1'); -- select all four bytes
        addr <= (OTHERS => '0'); -- first array field
        wdata <= (OTHERS => '0'); -- replace with nulls

        WAIT FOR (2 * clock_period);

        -- 5. Proof that it didn't overwrite
        act <= '1';
        readwrite <= '0'; -- read
        dByte <= (3 => '1', 0 => '1', OTHERS => '0'); -- read first and last byte
        addr <= (OTHERS => '0'); -- first array field
    END PROCESS;

    -- Produce reset.
    reset : PROCESS
    BEGIN
        -- TODO: Change counter values.
        IF ((counter = 30 OR counter = 50) AND sw_rst = true) THEN
            rst <= '1';
        ELSE
            rst <= '0';
        END IF;
    END PROCESS;

    -- Set simulation time.
    stimulus : PROCESS
    BEGIN
        WAIT FOR 10 sec; -- Simulation time before clock stops.

        stop_the_clock <= true;
        WAIT;
    END PROCESS;

    -- Creates clock and controls counter.
    clocking : PROCESS
    BEGIN
        WHILE NOT stop_the_clock LOOP
            clk <= '0', '1' AFTER clock_period / 2;

            IF counter = 100 THEN
                counter <= 0;
            END IF;
            counter <= counter + 1;
            WAIT FOR clock_period;
        END LOOP;
        WAIT;
    END PROCESS;
END spwroutertable_tb_arch;