----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer, Student
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
    
    signal recoveredclock: std_ulogic;
    
    
    -- Transfer rate of Data.
    constant clock_recovery_period: time := 100 ns; -- T = 100ns => f = 10MHz
    
    -- Number of loop iterations to be performed.
    constant num_iterations: integer := 3;
    
    -- Bit sequence that is transmitted.
    constant bseq: std_logic_vector := "01011001110001";
    
    -- Determines whether the activation input signal (rxen) of the
    -- receiver is changed depending on time. This is supposed to 
    -- have the effect of deactivation the front-end.
    constant activateRxenStressTest: boolean := false;
    
    -- Determines whether the strobe signal is temporarily not generated
    -- correctly in order to make the behavior of the dut visible.
    constant activateStrobeStressTest: boolean := false;
    
    -- Width of shift registers in recvfront_clkrec. Depending on 
    -- transmission rate, necessary for synchronization and avoiding
    -- metastability. Causes a clock shift!
    constant Width: integer range 1 to 3 := 2;
    
    -- System clock frequence.
    constant sys_clock_freq: real := 20.0e6; -- 20 MHz
    
    -- used to influence transmission frequency to test clock recovery feature.
    --shared variable div: integer := 1;
begin
    -- Design under test:
    dut: spwrecvfront_clkrec
        generic map (
                -- Width of shift registers (default: 2)
                WIDTH   =>  Width
                )
        port map (
                clk     =>  clk,
                spw_di  =>  spw_di,
                spw_si  =>  spw_si,
                rxen    =>  rxen,
                inact   =>  inact,
                inbvalid=>  inbvalid,
                inbits  =>  inbits
                );

    -- Generate system clock.
    SysClk: process is
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
            for j in 0 to bseq'Length-1 loop
                spw_di <= bseq(j);
                
                -- checks whether the strobe signal should be generated correctly.
                if strobe_output = '1' then
                    spw_si <= bseq(j) xor strobe_sw;
                    strobe_sw := not strobe_sw;
                end if;
                
                wait for clock_recovery_period;
            end loop;
        end loop;
        wait;
    end process;
    
    -- enables setting of control signals for stress test
    ControlRxenCreation: process is
        constant rxen_on: time := clock_recovery_period * bseq'Length / 5;
        constant rxen_off: time := clock_recovery_period * bseq'Length / 2;
    begin
        if activateRxenStressTest = false then
            rxen <= '1';
            wait;
        end if;
        
        for i in 0 to num_iterations loop
            rxen <= '1';
            wait for rxen_on;
            rxen <= '0';
            wait for rxen_off;
        end loop;
        --wait;
    end process;
    
    -- 
    ControlStrobeCreation: process
        constant strobe_on: time := clock_recovery_period * bseq'Length / 3;
        constant strobe_off: time := clock_recovery_period * bseq'Length / 1;
    begin
        if activateStrobeStressTest = false then
            wait;
        end if;
        
        for i in 0 to num_iterations loop
            strobe_output := '1';
            wait for strobe_on;
            strobe_output := '0';
            wait for strobe_off;
            strobe_output := '1';
        end loop;
        --wait;
    end process;
    
    -- Clock recovery for illustration.
    recoveredclock <= spw_di xor spw_si;
    
--    process(rxen, inact, inbvalid, inbits)
--    begin
--        if inbvalid = '1' then
--            bitreceived <= '1';
--        else
--            bitreceived <= '0';
--        end if;
--    end process;
end;