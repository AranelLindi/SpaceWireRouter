----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 22.08.2021 23:28
-- Design Name: SpaceWire Router Testbench
-- Module Name: spwrouter_tb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--
-- Dependencies: spwpkg, spwrouterpkg
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.Std_logic_1164.ALL;
USE IEEE.Numeric_Std.ALL;
USE work.spwpkg.ALL;
USE work.spwrouterpkg.ALL;

ENTITY routertest_tb IS
END;

ARCHITECTURE routertest_tb_arch OF routertest_tb IS
	CONSTANT numports : INTEGER RANGE 0 TO 31 := 2;

	COMPONENT routertest
		GENERIC (
			numports : INTEGER RANGE 0 TO 31;
			sysfreq : real;
			txclkfreq : real;
			tickdiv : INTEGER RANGE 12 TO 24 := 20;
			rx_impl : IN rximpl_array(numports DOWNTO 0);
			tx_impl : IN tximpl_array(numports DOWNTO 0)
		);
		PORT (
			clk : IN STD_LOGIC;
			rst : IN STD_LOGIC;
			stnull: in std_logic_vector(numports downto 0);
            		stfct : in std_logic_vector(numports downto 0);
			txen: in std_logic_vector(numports downto 0);
	                fct_in : in std_logic_vector(numports downto 0);
            		txwrite: in std_logic_vector(numports downto 0);
     		        txflag: in std_logic_vector(numports downto 0);        -- Requests transmission of timecode.
  		        tick_in : in std_logic_vector(numports downto 0);
            		ctrl_in : in std_logic_vector(1 downto 0); -- gilt für alle Ports gleich!
            		time_in : in std_logic_vector(5 downto 0);
			started : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			connecting : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			running : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			errpar : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			erresc : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			errcred : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			spw_di : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
			spw_si : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			spw_do : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			spw_so : OUT STD_LOGIC_VECTOR(numports DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL clk : STD_LOGIC;
	SIGNAL rst : STD_LOGIC := '1';
	CONSTANT rx_impl : rximpl_array(numports DOWNTO 0) := (OTHERS => impl_fast); -- impl_generic : data freq < 2 * clk freq !!
	CONSTANT tx_impl : tximpl_array(numports DOWNTO 0) := (OTHERS => impl_generic);
	SIGNAL started : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL connecting : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL running : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL errpar : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL erresc : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL errcred : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL spw_di : STD_LOGIC_VECTOR(numports DOWNTO 0) := (others => '0');
	SIGNAL spw_si : STD_LOGIC_VECTOR(numports DOWNTO 0) := (others => '0');
	SIGNAL spw_do : STD_LOGIC_VECTOR(numports DOWNTO 0) := (others => '0');
	SIGNAL spw_so : STD_LOGIC_VECTOR(numports DOWNTO 0) := (others => '0');
	
    signal s_stnull: std_logic_vector(numports downto 0) := (others => '0');
    signal s_stfct : std_logic_vector(numports downto 0) := (others => '0');
    signal s_txen: std_logic_vector(numports downto 0) := (others => '1');
    signal s_fct_in : std_logic_vector(numports downto 0) := (others => '0');
    signal s_txwrite: std_logic_vector(numports downto 0) := (others => '0');
    signal s_txflag: std_logic_vector(numports downto 0) := (others => '0');
    signal s_tick_in : std_logic_vector(numports downto 0) := (others => '0');
    signal s_ctrl_in : std_logic_vector(1 downto 0) := (others => '0'); -- gilt für alle Ports gleich!
    signal s_time_in : std_logic_vector(5 downto 0) := (others => '0');

	CONSTANT clock_period : TIME := 10 ns; -- 100 MHz
	SIGNAL stop_the_clock : BOOLEAN;
BEGIN

	-- design under test.
	dut : routertest GENERIC MAP(
		numports => numports,
		sysfreq => 100.0e6,
		txclkfreq => 100.0e6,
		rx_impl => rx_impl,
		tx_impl => tx_impl
	)
	PORT MAP(
		clk => clk,
		rst => rst,
		stnull => s_stnull,
		stfct => s_stfct,
		txen => s_txen,
		fct_in => s_fct_in,
		txwrite => s_txwrite,
		txflag => s_txflag,
		tick_in => s_tick_in,
		ctrl_in => s_ctrl_in,
		time_in => s_time_in,
		started => started,
		connecting => connecting,
		running => running,
		errpar => errpar,
		erresc => erresc,
		errcred => errcred,
		spw_di => spw_di,
		spw_si => spw_si,
		spw_do => spw_do,
		spw_so => spw_so
	);

    stimuli : process
    begin
        -- Hier muss rein, welcher Port Daten senden soll, alle anderen senden dann Nulls.
        -- So lange hier nichts drin steht, senden alle Ports automatisch Nullen (noch prüfen!)
	wait for 2 us;
	rst <= '0';

    end process;

	clocking : PROCESS
	BEGIN
		WHILE NOT stop_the_clock LOOP
			clk <= '0', '1' AFTER clock_period / 2;
			WAIT FOR clock_period;
		END LOOP;
		WAIT;
	END PROCESS;
END routertest_tb_arch;