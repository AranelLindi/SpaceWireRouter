----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 06.06.2021 16:26
-- Design Name: Testbench for Clock Recovery Front-End Module for SpaceWire Light IP Receiver
-- Module Name: spwrecvfront_clkrec_tb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: -
-- Tool Versions: 
-- Description: Tests only physical layer and doesn't validate whether transmitted
-- bits are valid in the SpaceWire context. (streamtest_tb can be used for this)
-- Allows validation of correct behavior of the clock recovery feature and at different
-- transmission rates up to system clock in Mbps.
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity spwrecvfront_clkrec_tb is
end;

architecture spwrecvfront_clkrec_tb_arch of spwrecvfront_clkrec_tb is
    -- Component Declaration: must be equal to entity in spwrecvfront_clkrec.
    component spwrecvfront_clkrec
        generic(
            WIDTH: integer range 1 to 3
            );
        port(
            clk: in std_logic;
            spw_di: in std_logic;
            spw_si: in std_logic;
            rxen: in std_logic;
            inact: out std_logic;
            inbvalid: out std_logic;
            inbits: out std_logic_vector(0 downto 0)
            );
    end component;
    
    -- Simulation signal declarations.
    signal clk: std_logic;
    signal spw_di: std_logic;
    signal spw_si: std_logic;
    signal rxen: std_logic;
    signal inact: std_logic;
    signal inbvalid: std_logic;
    signal inbits: std_logic_vector(0 downto 0);
    
    -- Testbench specific declarations.
    -- High if spw_si should be generated correctly, low if no changes should be made.
    shared variable strobe_output: std_logic := '1';
    
    -- Signal for clock recovery.
    signal clock_recovery: std_ulogic;
    
    -- Incomming bit in queue.
    signal rbit: std_ulogic;
    
    -- Bit list with sendet bits recognized als valid by receiver (spwrecv)
    signal bin: std_ulogic_vector(0 downto 0);
    
    -- #################################
    -- CHANGE TESTVARIABLES HERE...       
    -- Data transmission frequency.
    constant data_clock_freq: real := 10.0e6; -- 10 MHz == 10 Mbps
       
    -- System clock frequency.   
    constant sys_clock_freq: real := 20.0e6; -- 20 MHz
    
   
    -- Number of loop iterations to be performed.
    constant num_iterations: integer := 1;
    
    -- Bit sequence that is transmitted.
    constant bseq: std_logic_vector := "010101100111000";
    
    -- Determines whether the activation input signal (rxen) of the
    -- receiver is changed depending on time. This is supposed to 
    -- have the effect of deactivation the front-end.
    constant RxenStressTest: boolean := false;
    
    -- Determines whether the strobe signal is temporarily not generated
    -- correctly in order to make the behavior of the dut visible.
    constant StrobeStressTest: boolean := false;
    
    -- Width of shift registers in recvfront_clkrec. Depending on 
    -- transmission rate, necessary for synchronization and avoiding
    -- metastability. Causes a clock shift!
    constant NumberOfShiftRegisters: integer range 1 to 3 := 2;
    -- #################################
begin
    -- Design under test:
    dut: spwrecvfront_clkrec
        generic map (
                -- Width of shift registers (default: 2)
                WIDTH   =>  NumberOfShiftRegisters
                )
        port map (
                clk     =>  clk,
                spw_di  =>  spw_di,
                spw_si  =>  spw_si,
                rxen    =>  rxen,
                inact   =>  inact,
                inbvalid => inbvalid,
                inbits  =>  inbits
                );

    -- Generate system clock.
    SysClk: process is
        variable sw: boolean := false;
    begin   
        clk <= '1';
        wait for (0.5 sec) / sys_clock_freq;
        clk <= '0';
        wait for (0.5 sec) / sys_clock_freq;
    end process;
    
    -- produces DataIn and StrobeIn by using bit sequence in bseq.
    DataStrobeCreation: process
        variable strobe_sw: std_ulogic := '0'; -- default value: false
    begin
        for i in 0 to num_iterations loop
            for j in 0 to (bseq'Length-1) loop
                spw_di <= bseq(j);
                
                -- checks whether the strobe signal should be generated correctly.
                if strobe_output = '1' then
                    spw_si <= bseq(j) xor strobe_sw;
                    strobe_sw := not strobe_sw;
                end if;
                
                wait for (0.5 sec) / data_clock_freq;
            end loop;
        end loop;
        wait;
    end process;
    
    -- Controls rxen signal via RxenStressTest-variable
    ControlRxenCreation: process is
        constant rxen_on: time := (0.5 sec) / data_clock_freq * bseq'Length / 6;
        constant rxen_off: time := (0.5 sec) / data_clock_freq * bseq'Length / 7;
    begin
        if RxenStressTest = false then
            rxen <= '1';
            wait;
        end if;
        
        for i in 0 to num_iterations loop
            rxen <= '1';
            wait for rxen_on;
            rxen <= '0';
            wait for rxen_off;
            rxen <= '1';
        end loop;
        wait;
    end process;
    
    -- Controlls influence of strobe signal and can be activated
    -- by changing StrobeStressTest-variable above.
    ControlStrobeCreation: process
        constant strobe_on: time := (0.5 sec) / data_clock_freq * bseq'Length / 5;
        constant strobe_off: time := (0.5 sec) / data_clock_freq * bseq'Length / 6;
    begin
        if StrobeStressTest = false then
            strobe_output := '1';
            wait;
        end if;
        
        for i in 0 to num_iterations loop
            strobe_output := '1';
            wait for strobe_on;
            strobe_output := '0';
            wait for strobe_off;
            strobe_output := '1';
        end loop;
        wait;
    end process;
    
    -- Clock recovery. (to check correctness. Is generated in
    -- same way in the front-end but none output signal)
    clock_recovery <= spw_di xor spw_si;   
    
    -- Simplified receiver functionality that should show which
    -- bits are forwarded fromt the front-end to the receiver.
    -- (Similar function structure as in spwrecv.vhd)
    -- Process incomming bit
    process(rxen, inact, inbits)
    begin
        if inbvalid = '1' then
            rbit <= inbits(0);
        end if;
        
        if rxen = '0' or inbvalid = '0' then
            rbit <= 'U';
        end if;
    end process;
    
    -- Update bit on system clock beat.
    process(clk)
    begin
        if rising_edge(clk) then
            bin(0) <= rbit; 
        end if;
    end process;
end;