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
-- Description: Simulation time 300 ns.
--
-- Dependencies: spwram (defined in spwpkg); spwroutertablestates (defined in spwrouterpkg)
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
    COMPONENT spwroutertable
        GENERIC (
            numports : INTEGER RANGE 0 TO 31
        );
        PORT (
            -- instate : out spwroutertablestates; -- Debug port - uncomment for better simulation results.
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

    -- TODO: Initial values in stimulus process...
    
    -- Number of SpaceWire ports.
    CONSTANT numports : INTEGER RANGE 0 TO 31 := 2; -- 3 ports.
    
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
    SIGNAL dByte : STD_LOGIC_VECTOR(3 DOWNTO 0);

    -- Memory address at which the operation is to be executed.
    SIGNAL addr : STD_LOGIC_VECTOR(7 DOWNTO 0);

    -- Word to be written in register.
    SIGNAL wdata : STD_LOGIC_VECTOR(31 DOWNTO 0);

    -- Word to be read from a register.
    SIGNAL rdata : STD_LOGIC_VECTOR(31 DOWNTO 0);

    -- High if a read or write operation is in progress.
    SIGNAL proc : STD_LOGIC;
    
    -- Internal state of the FSM of spwroutertable.
    signal dut_state : spwroutertablestates;
    
    
    -- Clock period. (100 MHz)
    CONSTANT clock_period : TIME := 10 ns;
    SIGNAL stop_the_clock : BOOLEAN;
    
    
    -- Control counter (for internal coordination only).
    signal counter : INTEGER := 1;

    -- Switcher for simulation end.   
    signal done : boolean := false;
BEGIN
    -- Design under test.
    dut : spwroutertable GENERIC MAP(numports => numports)
    PORT MAP(
        -- instate => dut_state, -- See component declaration!
        clk => clk,
        rst => rst,
        act => act,
        readwrite => readwrite,
        dByte => dByte,
        addr => addr,
        wdata => wdata,
        rdata => rdata,
        proc => proc
        );  
    
    -- Resets dut and internal variables.
    reset : PROCESS
    BEGIN
        -- Initial reset (important to initialize signals in dut!)
        rst <= '1';
        WAIT FOR clock_period/2;
        rst <= '0';
        
        WAIT UNTIL done; -- Wait until all operations are performed, then reset.
        rst <= '1';
    END PROCESS;

    -- Creates clock and controls counter.
    clocking : PROCESS
    BEGIN
        WHILE NOT stop_the_clock LOOP
            clk <= '0', '1' AFTER clock_period / 2;
            
            WAIT FOR clock_period;
        END LOOP;
        WAIT;
    END PROCESS;
    
    -- Performs test operations exactly when (fsm)-machine is ready to receive them. 
    stimulus: process(dut_state)
    begin
        if dut_state = S_Idle then -- FSM of router table starts only in idle state!
            case counter is
                when 1 =>
                    -- 1. Write
                    report "1. Write";
                    
                    act <= '1'; -- activate router table
                    readwrite <= '1'; -- write
                    dByte <= (OTHERS => '1'); -- write in all four bits
                    addr <= (OTHERS => '0'); -- write in 1st field of array
                    wdata <= "10101011101010101010101011101010"; -- word to be written
                
                when 2 =>
                    -- 2. Read
                    report "2. Read";
                    
                    act <= '1';
                    readwrite <= '0'; -- read
                    dByte <= (3 => '1', 0 => '1', OTHERS => '0'); -- Has no effect on reading operation but marks corresponding point in timing diagram.
                    addr <= (OTHERS => '0'); -- first array field              
                
                when 3 =>
                    -- 3. Try to read in inactive mode
                    report "3. Try to read in inact mode";
                    
                    act <= '1'; -- should be '1'
                    readwrite <= '0'; -- read
                    dByte <= (OTHERS => '1'); -- Has no effect on reading operation but marks corresponding point in timing diagram.
                    addr <= (OTHERS => '0'); -- first array field
                
                when 4 =>
                    -- 4. Write without permission
                    report "4. Write without permission";    
                    
                    act <= '1';
                    readwrite <= '0'; -- should be '1'
                    dByte <= (3 => '1', 2 => '1', 1 => '1', OTHERS => '0'); -- select all four bytes
                    addr <= (OTHERS => '0'); -- first array field
                    wdata <= (OTHERS => '0'); -- replace with nulls
                
                when 5 =>
                    -- 5. Proof that it didn't overwrite
                    report "5. Proof that it didn't overwrite";
                    
                    act <= '1';
                    readwrite <= '0'; -- read
                    dByte <= (3 => '1', 0 => '1', OTHERS => '0'); -- read first and last byte
                    addr <= (OTHERS => '0'); -- first array field
                
                when others =>
                    -- Set reset signal to high.
                    done <= true;                     
            end case;
            
            -- Increment counter for next test operation.
            counter <= counter + 1;                     
                
            -- Stop clock if all test operations are executed.
            if counter > 6 then
                stop_the_clock <= true;
            end if;
        end if;
    end process;
END spwroutertable_tb_arch;