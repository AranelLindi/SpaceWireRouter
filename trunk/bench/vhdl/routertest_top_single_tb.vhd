LIBRARY IEEE;
USE IEEE.Std_logic_1164.ALL;
USE IEEE.Numeric_Std.ALL;
--USE work.spwpkg.ALL;
USE work.spwrouterpkg.ALL;
--USE work.routertest_top_single_tb_pkg.ALL;

ENTITY routertest_top_single_tb IS
END;

ARCHITECTURE bench OF routertest_top_single_tb IS

	COMPONENT routertest_top_single
		PORT (
			clk : IN STD_LOGIC;
			rst : IN STD_LOGIC;
			selectport : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			selectdestport: in std_logic_vector(1 downto 0);
			rxstream : IN STD_LOGIC;
			txstream : OUT STD_LOGIC;
			rxhalff : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			rrunning : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			prunning : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			rerror : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			perror : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			-- Debugstates:
			rxvalid : OUT STD_LOGIC;
			txwrite : OUT STD_LOGIC_vector(2 downto 0);
			prxvalid: out std_logic_vector(2 downto 0);
			txinact: out std_logic;
			spw_d_p2r: out std_logic_vector(2 downto 0);
			spw_d_r2p: out std_logic_vector(2 downto 0);
			uart_txdata: out std_logic_vector(7 downto 0);
			received: out std_logic;
			txdata: out array_t(2 downto 0)(8 downto 0);
			recdata: out std_logic_vector(8 downto 0)
		);
	END COMPONENT;

	SIGNAL clk : STD_LOGIC;
	SIGNAL rst : STD_LOGIC;
	SIGNAL selectport : STD_LOGIC_VECTOR(1 DOWNTO 0) := "10";
	signal selectdestport: std_logic_vector(1 downto 0) := "01";
	SIGNAL rxstream : STD_LOGIC := '1';
	SIGNAL txstream : STD_LOGIC := '1';
	SIGNAL rxhalff : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL rrunning : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL prunning : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL rerror : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL perror : STD_LOGIC_VECTOR(2 DOWNTO 0);
	

	-- Debugports
	SIGNAL rxvalid : STD_LOGIC;
	SIGNAL txwrite : STD_LOGIC_vector(2 downto 0);
	signal prxvalid : std_logic_vector(2 downto 0);
	signal txinact: std_logic;
	signal spw_d_p2r: std_logic_vector(2 downto 0);
	signal spw_d_r2p: std_logic_vector(2 downto 0);
	signal uart_txdata : std_logic_vector(7 downto 0);
	signal received: std_logic;
	signal s_dtxdata: array_t(2 downto 0)(8 downto 0);
	signal s_recdata: std_logic_vector(8 downto 0);


	CONSTANT clock_period : TIME := 100 ns; -- 10 MHz

	constant c_BIT_PERIOD : time := 8680 ns; -- 115200 baud rate

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

	dut : routertest_top_single PORT MAP(
		clk => clk,
		rst => rst,
		selectport => selectport,
		selectdestport => selectdestport,
		rxstream => rxstream,
		txstream => txstream,
		rxhalff => rxhalff,
		rrunning => rrunning,
		prunning => prunning,
		rerror => rerror,
		perror => perror,
		rxvalid => rxvalid,
		txwrite => txwrite,
		prxvalid => prxvalid,
		txinact => txinact,
		spw_d_r2p => spw_d_r2p,
		spw_d_p2r => spw_d_p2r,
		uart_txdata => uart_txdata,
		received => received,
		txdata => s_dtxdata,
		recdata => s_recdata
	);

	stimulus : PROCESS
	BEGIN
		rst <= '1';
		wait for clock_period;
		rst <= '0';
		wait;
	END PROCESS;


	process
	begin
		wait for c_bit_period;

		uart_write_byte("00000001", rxstream);

		wait for c_bit_period; -- zu testzwecken mal einblenden um zu schauen was bei etwas abstand passiert

		uart_write_byte("10111111", rxstream);
		wait for c_bit_period;		
		uart_write_byte("11111111", rxstream);

		wait;
	end process;


	clocking : PROCESS
	BEGIN
		clk <= '0', '1' AFTER clock_period / 2;
		WAIT FOR clock_period;
	END PROCESS;
END;