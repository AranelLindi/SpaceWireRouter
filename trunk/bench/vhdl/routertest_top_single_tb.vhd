----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 04.09.2021 21:35
-- Design Name: SpaceWire Router Single Hardware Implementation
-- Module Name: routertest_top_single_tb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--
-- Dependencies: none
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.Std_logic_1164.ALL;
USE IEEE.Numeric_Std.ALL;
USE work.spwrouterpkg.ALL;

ENTITY routertest_top_single_tb IS
END;

ARCHITECTURE routertest_top_single_tb_arch OF routertest_top_single_tb IS

	COMPONENT routertest_top_single
		PORT (
			clk : IN STD_LOGIC;
			rst : IN STD_LOGIC;
			clear : IN STD_LOGIC;
			uartfifofull : OUT STD_LOGIC;
			selectport : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			selectdestport : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			rxstream : IN STD_LOGIC;
			txstream : OUT STD_LOGIC;
			rxhalff : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			rrunning : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			prunning : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			rerror : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			perror : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL clk : STD_LOGIC;
	SIGNAL rst : STD_LOGIC;
	SIGNAL clear : STD_LOGIC := '0';
	SIGNAL uartfifofull : STD_LOGIC;
	SIGNAL selectport : STD_LOGIC_VECTOR(1 DOWNTO 0) := "10";
	SIGNAL selectdestport : STD_LOGIC_VECTOR(1 DOWNTO 0) := "01";
	SIGNAL rxstream : STD_LOGIC := '1';
	SIGNAL txstream : STD_LOGIC := '1';
	SIGNAL rxhalff : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL rrunning : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL prunning : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL rerror : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL perror : STD_LOGIC_VECTOR(2 DOWNTO 0);
	
	CONSTANT clock_period : TIME := 100 ns; -- 10 MHz
	CONSTANT c_BIT_PERIOD : TIME := 8680 ns; -- 115200 baud rate (115 kHz)

	-- Low-level byte-write
	PROCEDURE UART_WRITE_BYTE (
		i_data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		SIGNAL o_serial : OUT STD_LOGIC) IS
	BEGIN
		-- Send Start Bit
		o_serial <= '0';
		WAIT FOR c_BIT_PERIOD;

		-- Send Data Byte
		FOR i IN 0 TO 7 LOOP
			o_serial <= i_data_in(i);
			WAIT FOR c_BIT_PERIOD;
		END LOOP; -- ii

		-- Send Stop Bit
		o_serial <= '1';
		WAIT FOR c_BIT_PERIOD;
	END UART_WRITE_BYTE;
BEGIN
	-- Design under test.
	dut : routertest_top_single PORT MAP(
		clk => clk,
		rst => rst,
		clear => clear,
		uartfifofull => uartfifofull,
		selectport => selectport,
		selectdestport => selectdestport,
		rxstream => rxstream,
		txstream => txstream,
		rxhalff => rxhalff,
		rrunning => rrunning,
		prunning => prunning,
		rerror => rerror,
		perror => perror
	);

	-- Simulation.
	stimulus : PROCESS
	BEGIN
		rst <= '1';
		WAIT FOR clock_period;
		rst <= '0';
		WAIT;
	END PROCESS;
	PROCESS
		VARIABLE state : INTEGER RANGE 1 TO 2 := 1;
	BEGIN
		CASE state IS
			WHEN 1 =>
				WAIT FOR c_bit_period;

				uart_write_byte("00000001", rxstream);

				WAIT FOR c_bit_period;

				uart_write_byte("10111111", rxstream);
				uart_write_byte("00000111", rxstream);
				WAIT FOR c_bit_period;
				uart_write_byte("11111111", rxstream);

				state := 2;

			WHEN 2 =>
				WAIT FOR 400 us;
				uart_write_byte("00000001", rxstream);
				uart_write_byte("11111110", rxstream);
				uart_write_byte("00000000", rxstream);
				uart_write_byte("11111111", rxstream);
				WAIT;
		END CASE;
	END PROCESS;

	-- Creates clock.
	clocking : PROCESS
	BEGIN
		clk <= '0', '1' AFTER clock_period / 2;
		WAIT FOR clock_period;
	END PROCESS;
END routertest_top_single_tb_arch;