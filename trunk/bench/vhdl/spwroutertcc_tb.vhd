----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 05.08.2021 17:52
-- Design Name: Testbench for SpaceWire Router TimeCode Control
-- Module Name: spwroutertcc_tb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: Simulate Time-Code Control with different inputs and error provocation.
-- It is necessary to carry out some stress tests because it could be that the module
-- is producing complex outputs.
--
-- Dependencies: spwrouterpkg
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.Std_logic_1164.ALL;
USE IEEE.Numeric_Std.ALL;
USE work.spwrouterpkg.ALL;

ENTITY spwroutertcc_tb IS
END;

ARCHITECTURE spwroutertcc_tb_arch OF spwroutertcc_tb IS
    -- Constants
    CONSTANT numports : INTEGER RANGE 0 TO 31 := 2; -- Number of SpaceWire ports.
    CONSTANT clock_period : TIME := 10 ns; -- Clock period. (100 MHz)

    -- Clock and reset.
    SIGNAL clk : STD_LOGIC; -- System clock.
    SIGNAL rst : STD_LOGIC := '1'; -- Synchronous reset.

    -- Dut control signals.
    SIGNAL s_running : STD_LOGIC_VECTOR(numports DOWNTO 0); -- High if corresponding port is running or low when its in another state.
    SIGNAL s_tc_enable : STD_LOGIC_VECTOR(numports DOWNTO 0); -- High if port has enabled Time Code functionality
    SIGNAL s_tick_in : STD_LOGIC_VECTOR(numports DOWNTO 0); -- High if corresponding port received a TimeCode
    SIGNAL s_tc_in : array_t(numports DOWNTO 0)(7 DOWNTO 0); -- Received Time Codes from all ports
    SIGNAL s_auto_interval : STD_LOGIC_VECTOR(31 DOWNTO 0); -- Time interval in which an automatically generated Time Code should be sent.

    -- Dut output signals.
    SIGNAL s_tc_last : STD_LOGIC_VECTOR(7 DOWNTO 0);     -- Last Timecode that was received.
    SIGNAL s_tick_out : STD_LOGIC_VECTOR(numports DOWNTO 0); -- High if corresponding port requests a TimeCode transmission
    SIGNAL s_tc_out : array_t(numports DOWNTO 0)(7 DOWNTO 0); -- Contains for every port TimeCode to send
    SIGNAL s_auto_tc_out : STD_LOGIC_VECTOR(7 DOWNTO 0); -- TimeCode that is send from Host.


    -- Testbench signals.
    --SIGNAL internTC : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0'); -- saves last TC.
BEGIN
    -- Design under test.
    dut : spwroutertcc GENERIC MAP(numports => numports)
    PORT MAP(
        clk => clk,
        rst => rst,
        running => s_running,
        tc_enable => s_tc_enable,
        tc_last => s_tc_last,        
        tick_out => s_tick_out,
        tick_in => s_tick_in,
        tc_out => s_tc_out,        
        tc_in => s_tc_in,
        auto_tc_out => s_auto_tc_out,
        auto_interval => s_auto_interval);

    -- Set simulation time.
    stimulus : PROCESS
    BEGIN
        -- Initialization of relevant signals.

        rst <= '1'; -- Initial reset (important to resolve 'U' state !)
        s_running <= (others => '1'); -- All ports are in running state
        s_tc_enable <= (others => '1'); -- All ports support Time Codes
        s_tick_in <= (others => '0'); -- No Time Code was received so far
        s_tc_in <= (others => (others => '0'));
        s_auto_interval <= (others => '0'); -- Automatically Time Code generation is disabled
        
        wait for 1.5 * clock_period; -- 1.5 to get in sync with rising clock edge

        rst <= '0'; -- Initial reset complete. Now: Normal operation

        wait for 10 * clock_period; -- Nothing Time Code relevant should happen until here

        -- Start Simulation !

        -- 1. Test automatically generated Time Codes.
        s_auto_interval <= std_logic_vector(to_unsigned(8, s_auto_interval'length)); -- generate and send every 8 * 10 ns = 80 ns new automatically generated Time Code
        wait for 25 * clock_period; -- Two automatically generated Time Codes should be created until here

        -- 2. Receive Time Code on one SpaceWire port.
        s_tick_in(0) <= '1'; -- Port 0 receives Time Code
        s_tc_in(0) <= "00000001"; -- Initial counter value is "000000" (is separated from automatic generation counter) so "000001" should be correct Time Code counter value
        wait for clock_period;

        s_tick_in <= (others => '0'); -- Reset
        s_tc_in <= (others => (others => '0')); -- Reset
        wait for 5 * clock_period; -- Since automatic Time Code generation is activated, incoming Time Codes are ignored
        -- Automatic generation of Time Codes should continue to be active !
        wait for 10 * clock_period;

        -- 3. Deactivate automatically generated Time Codes
        s_auto_interval <= (others => '0');
        wait for 10 * clock_period; -- Wait some time to make sure no automatic Time Codes are created

        -- 4. After deactivation of automatic Time Code generation, receive again Time Code on one SpaceWire port
        s_tick_in(0) <= '1';
        s_tc_in(0) <= "00" & "000001"; -- Counter value for incoming Time Codes should be still on "000000"
        wait for clock_period;
        s_tick_in <= (others => '0'); -- Reset
        s_tc_in <= (others => (others => '0')); -- Reset
        -- Time Code should be recognized correctly.
        wait for 2 * clock_period;

        -- 5. Receive new Time Code but with wrong counter value (lower than saved counter value)
        s_tick_in(1) <= '1';
        s_tc_in(1) <= "00000000";
        wait for clock_period;
        s_tick_in <= (others => '0'); -- Reset
        s_tc_in <= (others => (others => '0')); -- Reset
        -- Because of invalid counter value this Time Code should be ignored, but internal register is updated with this counter value.
        -- So next incoming Time Code with counter value = "000001" is valid again.
        wait for 2 * clock_period;

        -- 6. Receive Time Code but with higher value
        s_tick_in(0) <= '1';
        s_tc_in(0) <= "00100000";
        wait for clock_period;
        s_tick_in <= (others => '0'); -- Reset
        s_tc_in <= (others => (others => '0')); -- Reset
        -- Again: Because counter value of incoming Time Code is higher than internal value plus one, the Time Code is invalid. 
        -- But: internal register is updated on new counter value.
        wait for 2 * clock_period;

        -- 7. Send Time Code with correct next counter value
        s_tick_in(2) <= '1';
        s_tc_in(2) <= "00100001";
        wait for clock_period;
        s_tick_in <= (others => '0'); -- Reset
        s_tc_in <= (others => (others => '0')); -- Reset
        -- Counter value of this Time Code is one more than counter value of last Time Code (internal saved counter value), so its valid.
        wait for 2 * clock_period;

        -- 8. Simulate an internal counter value overflow
        -- First: Send Time Code with counter value "111111" (63) (Won't be valid Time Code, but internal counter value will be updated)
        s_tick_in(1) <= '1';
        s_tc_in(1) <= "00111110";
        wait for clock_period;
        s_tick_in <= (others => '0'); -- Reset
        s_tc_in <= (others => (others => '0')); -- Reset
        wait for clock_period;
        s_tick_in(2) <= '1';
        s_tc_in(2) <= "00111111";
        wait for clock_period;
        s_tick_in <= (others => '0'); -- Reset
        s_tc_in <= (others => (others => '0'));
        wait for clock_period;
        s_tick_in(0) <= '1';
        s_tc_in(0) <= "00000000";
        wait for clock_period;
        s_tick_in <= (others => '0');
        s_tc_in <= (others => (others => '0'));

        wait for 10 * clock_period;
    END PROCESS;

    -- Creates clock.
    clocking : PROCESS
    BEGIN
        clk <= '0', '1' AFTER clock_period / 2;
        WAIT FOR clock_period;
    END PROCESS;
END spwroutertcc_tb_arch;