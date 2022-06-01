----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 23.08.2021 22:28:26
-- Design Name: routertest_top_multi_adapter
-- Module Name: routertest_top - routertest_top_arch
-- Project Name: Implementation of a SpaceWire Router on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: Implements a UART-SpaceWire communication entity which allows
-- to send and receive SpaceWire data via Uart.
-- 
-- Dependencies: spwpkg, spwrouterpkg
-- 
-- Revision:
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.spwpkg.ALL;
USE work.spwrouterpkg.ALL;

ENTITY routertest_top_multi_adapter IS
	PORT (
		-- System clock.
		clk : IN STD_LOGIC;

		-- Reset.
		rst : IN STD_LOGIC;

		-- Clear button.
		--clear : IN STD_LOGIC;

		-- Send manual end of packet.
		--eop : IN STD_LOGIC;

		-- Incoming serial stream (uart).
		rx_stream : IN STD_LOGIC;

		-- Outgoing serial stream (uart).
		tx_stream : OUT STD_LOGIC;

		-- Conversion from spacewire to uart is slowed down by its slower data 
		-- transfer. For this reason, that port is used to inform when output
		-- fifo memory is half full and there is a risk of data loss with further
		-- packets.
		rxhalff : OUT STD_LOGIC;

		-- High if port is in started mode.
		started : OUT STD_LOGIC;

		-- High if port is in connection mode.
		connecting : OUT STD_LOGIC;

		-- High if corresponding router port is in running mode. 
		-- Low means that it is in an initializing, started or connecting state.
		running : OUT STD_LOGIC;

		-- High if port got valid data in its rx fifo.
		rxvalid : OUT STD_LOGIC;

		-- High if corresponding router port has reported an error.
		error : OUT STD_LOGIC;

		-- Incoming SpaceWire data signal.
		spw_di : IN STD_LOGIC;

		-- Incoming SpaceWire strobe signal.
		spw_si : IN STD_LOGIC;

		-- Outgoing SpaceWire data signal.
		spw_do : OUT STD_LOGIC;

		-- Outgoing SpaceWire strobe signal.
		spw_so : OUT STD_LOGIC
	);
END routertest_top_multi_adapter;

ARCHITECTURE routertest_top_multi_adapter_arch OF routertest_top_multi_adapter IS
	CONSTANT portnumber : INTEGER := 1; -- Do not change!

	TYPE bool_to_logic_type IS ARRAY(BOOLEAN) OF STD_ULOGIC;
	CONSTANT bool_to_logic : bool_to_logic_type := (false => '0', true => '1');

	-- Uart
	COMPONENT uart IS
		GENERIC (
			clk_cycles_per_bit : INTEGER
		)
		PORT (
			clk : IN STD_LOGIC;
			rst : IN STD_LOGIC;
			-- tx
			tx_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			tx_ack : IN STD_LOGIC;
			tx_port : OUT STD_LOGIC := '1';
			tx_rdy : OUT STD_LOGIC := '1';
			-- rx
			rx_port : IN STD_LOGIC;
			rx_ack : IN STD_LOGIC;
			rx_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			rx_rdy : OUT STD_LOGIC := '0'
		);
	END COMPONENT uart;

	-- buffer needed
	SIGNAL uart_buffer : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL spw_buffer : STD_LOGIC_VECTOR(7 DOWNTO 0);

	-- wires for uart
	SIGNAL uart_buffer_rx : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL uart_buffer_tx : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL uart_tx_ack : STD_LOGIC := '0';
	SIGNAL uart_tx_ready : STD_LOGIC;
	SIGNAL uart_rx_ack : STD_LOGIC := '0';
	SIGNAL uart_rx_ready : STD_LOGIC;

	-- SpaceWire Light.
	SIGNAL s_autostart : STD_LOGIC := '1';
	SIGNAL s_linkstart : STD_LOGIC := '1';
	SIGNAL s_linkdis : STD_LOGIC := '0';
	SIGNAL s_txdivcnt : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000001";
	SIGNAL s_tick_in : STD_LOGIC := '0';
	SIGNAL s_ctrl_in : STD_LOGIC := '0';
	SIGNAL s_time_in : STD_LOGIC := '0';
	SIGNAL s_txwrite : STD_LOGIC := '0';
	SIGNAL s_txflag : STD_LOGIC := '0';
	SIGNAL s_txdata : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
	SIGNAL s_txrdy : STD_LOGIC;
	SIGNAL s_txhalff : STD_LOGIC;
	SIGNAL s_tick_out : STD_LOGIC;
	SIGNAL s_ctrl_out : STD_LOGIC;
	SIGNAL s_time_out : STD_LOGIC;
	SIGNAL s_rxvalid : STD_LOGIC;
	SIGNAL s_rxhalff : STD_LOGIC;
	SIGNAL s_rxflag : STD_LOGIC;
	SIGNAL s_rxdata : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL s_rxread : STD_LOGIC;
	SIGNAL s_started : STD_LOGIC;
	SIGNAL s_connecting : STD_LOGIC;
	SIGNAL s_running : STD_LOGIC;
	SIGNAL s_errdisc : STD_LOGIC;
	SIGNAL s_errpar : STD_LOGIC;
	SIGNAL s_erresc : STD_LOGIC;
	SIGNAL s_errcred : STD_LOGIC;
	SIGNAL s_spw_di : STD_LOGIC;
	SIGNAL s_spw_si : STD_LOGIC;
	SIGNAL s_spw_do : STD_LOGIC;
	SIGNAL s_spw_so : STD_LOGIC;

	SIGNAL s_rxvalid_int : STD_LOGIC;
	SIGNAL s_error_int : STD_LOGIC;
	SIGNAL s_error : STD_LOGIC;

	-- fsm for operation
	TYPE fsm_state IS (s_Idle, s_Recv, s_Wait, s_Send);
	TYPE stateUART2SpW : fsm_state := s_Idle;
	TYPE stateSpW2UART : fsm_state := s_Idle;
BEGIN
	-- Drive outputs.
	spw_do <= s_spw_do;
	spw_so <= s_spw_so;

	s_spw_di <= spw_di;
	s_spw_si <= spw_si;
	uart_object : uart
	GENERIC MAP(
		clk_cycles_per_bit => clk_cycles_per_bit
	)
	PORT MAP(
		clk => clk,
		rst => rst,
		tx_port => tx_serial,
		tx_ack => uart_tx_ack,
		tx_data => uart_buffer_tx,
		tx_rdy => uart_tx_ready,
		rx_port => rx_serial,
		rx_ack => uart_rx_ack,
		rx_data => uart_buffer_rx,
		rx_rdy => uart_rx_ready
	);

	-- Internal port interface.
	extPort : spwstream
	GENERIC MAP(
		sysfreq => 10.0e6,
		txclkfreq => 10.0e6,
		rximpl => impl_fast,
		rxchunk => 1,
		WIDTH => 2,
		tximpl => impl_fast,
		rxfifosize_bits => 11,
		txfifosize_bits => 11
	)
	PORT MAP(
		clk => clk,
		rxclk => clk,
		txclk => clk,
		rst => rst,
		autostart => s_autostart,
		linkstart => s_linkstart,
		linkdis => '0',
		txdivcnt => s_txdivcnt,
		tick_in => '0',
		ctrl_in => (OTHERS => '0'),
		time_in => (OTHERS => '0'),
		txwrite => s_txwrite,
		txflag => s_txflag,
		txdata => s_txdata,
		txrdy => s_txrdy,
		txhalff => s_txhalff,
		tick_out => OPEN,
		ctrl_out => OPEN,
		time_out => OPEN,
		rxvalid => s_rxvalid,
		rxhalff => s_rxhalff,
		rxflag => s_rxflag,
		rxdata => s_rxdata,
		rxread => s_rxread,
		started => s_started,
		connecting => s_connecting,
		running => s_running,
		errdisc => s_errdisc,
		errpar => s_errpar,
		erresc => s_erresc,
		errcred => s_errcred,
		spw_di => spw_di,
		spw_si => spw_si,
		spw_do => spw_do,
		spw_so => spw_so
	);
	UART2SpW : PROCESS (clk) IS
	BEGIN
		IF rising_edge(clk) THEN
			IF (rst = '1') THEN
				-- synchronous reset.
				stateUART2SpW <= s_Idle;
			ELSE
				CASE stateUART2SpW IS
					WHEN s_Idle =>
						IF (uart_rx_ready = '1') THEN
							uart_buffer <= uart_buffer_rx;
							uart_rx_ack <= '1';
							stateUART2SpW <= s_Recv;
						ELSE
							s_txwrite <= '0';
							s_txflag <= '0';
							s_txdata <= (OTHERS => '0');

							uart_rx_ack <= '0';
						END IF;

					WHEN s_Recv =>
						uart_rx_ack <= '0';
						stateUART2SpW <= s_Wait;

					WHEN s_Wait =>
						IF s_txrdy = '1' THEN
							s_txdata <= uart_buffer;
							s_txflag <= '0';
							s_txwrite <= '1';
							stateUART2SpW <= s_Send;
						END IF;

					WHEN s_Send =>
						s_txwrite <= '0';
						stateUART2SpW <= s_Idle;
				END CASE
			END IF;
		END IF;
	END PROCESS UART2SpW;

	SpW2UART : PROCESS (clk) IS
	BEGIN
		IF rising_edge(clk) THEN
			IF (rst = '1') THEN
				-- synchronous reset.
				stateSpW2UART <= s_Idle;
			ELSE
				CASE stateSpW2UART IS
					WHEN s_Idle =>
						IF s_rxvalid = '1' THEN
							spw_buffer <= s_rxdata;
							s_rxread <= '1';

							stateSpW2UART <= s_Recv;

						ELSE
							s_rxread <= '0';

							uart_tx_ack <= '0';
						END IF;

					WHEN s_Recv =>
						s_rxread <= '0';
						uart_tx_ack <= '0';
						stateSpW2UART <= s_Wait;

					WHEN s_Wait =>
						IF uart_tx_ready = '1' THEN
							uart_buffer_tx <= spw_buffer;
							uart_tx_ack <= '1';

							stateSpW2UART <= s_Send;
						END IF;

					WHEN s_Send =>
						uart_tx_ack <= '0';
						stateSpW2UART <= s_Idle;
				END CASE;
			END IF;
		END PROCESS SpW2UART;
	END routertest_top_multi_adapter_arch;
