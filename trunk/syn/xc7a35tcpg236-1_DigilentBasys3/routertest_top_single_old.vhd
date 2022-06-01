----------------------------------------------------------------------------------
-- Company: University of Wuerzburg
-- Engineer: Stefan Lindörfer
-- 
-- Create Date: 23.08.2021 22:28:26
-- Design Name: routertest_top_single
-- Module Name: routertest_top - routertest_top_arch
-- Project Name: Implementation of a SpaceWire Router on an FPGA.
-- Target Devices: 
-- Tool Versions: 
-- Description: Hardwareimplementation which contains a router (3 ports), external
-- ports and uart receiver/transmitter.
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

ENTITY routertest_top_single IS
	PORT (
		-- System clock.
		clk : IN STD_LOGIC;

		-- Reset.
		rst : IN STD_LOGIC;

		-- Clear button (to reset error flags.
		clear : IN STD_LOGIC;

		-- Send manual end of packet.
		--eop : IN STD_LOGIC;

		-- Shows if the fifo memory is filled
		--uartfifofull : OUT STD_LOGIC;

		-- Marks which port (0 to 2) is selected to send the next packet.
		-- (10 == 2; 01 == 1; 00 == 0)
		--selectport : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

		-- Marks the port to be targeted for output via uart.
		--selectdestport : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

		-- Incoming serial stream (uart).
		uart_rx : IN STD_LOGIC;

		-- Outgoing serial stream (uart).
		uart_tx : OUT STD_LOGIC;

		-- Conversion from spacewire to uart is slowed down by its slower data 
		-- transfer. For this reason, that port is used to inform when output
		-- fifo memory is half full and there is a risk of data loss with further
		-- packets.
		spw_rx_halff : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);

		-- High if corresponding router port is in running mode. 
		-- Low means that it is in an initializing, started or connecting state.
		spw_router_running : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);

		-- High if corresponding external port is in running mode.
		-- Low means that it is in an initializing, started or connecting state.
		spw_extport_running : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);

		-- High if corresponding router port has reported an error.
		spw_router_error : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);

		-- High if corresponding external port has reported an error.
		spw_extport_error : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END routertest_top_single;

ARCHITECTURE routertest_top_single_arch OF routertest_top_single IS
	TYPE bool_to_logic_type IS ARRAY(BOOLEAN) OF STD_ULOGIC;
	CONSTANT bool_to_logic : bool_to_logic_type := (false => '0', true => '1');

	-- Uart module (includes rx and tx)
	COMPONENT uart IS
		GENERIC (
			clk_cycles_per_bit : INTEGER
		);
		PORT (
			clk : IN STD_LOGIC;
			rst : IN STD_LOGIC;
			-- Tx
			tx_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			tx_ack : IN STD_LOGIC;
			tx_port : OUT STD_LOGIC := '1';
			tx_rdy : OUT STD_LOGIC := '1';
			-- Rx
			rx_port : IN STD_LOGIC;
			rx_ack : IN STD_LOGIC;
			rx_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			rx_rdy : OUT STD_LOGIC := '0'
		);
	END COMPONENT uart;

	-- Routertest module.
	COMPONENT routertest
		GENERIC (
			numports : INTEGER RANGE 0 TO 31;
			sysfreq : real;
			txclkfreq : real := 0.0;
			rximpl : spw_implementation_type_rec;
			rxchunk : INTEGER RANGE 1 TO 4 := 1;
			WIDTH : INTEGER RANGE 1 TO 3 := 2;
			tximpl : spw_implementation_type_xmit;
			rxfifosize_bits : INTEGER RANGE 6 TO 14 := 11;
			txfifosize_bits : INTEGER RANGE 2 TO 14 := 11
		);
		PORT (
			clk : IN STD_LOGIC;
			rxclk : IN STD_LOGIC;
			txclk : IN STD_LOGIC;
			rst : IN STD_LOGIC;
			autostart : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
			linkstart : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
			linkdis : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
			txdivcnt : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			tick_in : IN STD_LOGIC_VECTOR(numports DOWNTO 1);
			ctrl_in : IN array_t(numports DOWNTO 1)(1 DOWNTO 0);
			time_in : IN array_t(numports DOWNTO 1)(5 DOWNTO 0);
			txwrite : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
			txflag : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
			txdata : IN array_t(numports DOWNTO 0)(7 DOWNTO 0);
			txrdy : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			txhalff : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			tick_out : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			ctrl_out : OUT array_t(numports DOWNTO 1)(1 DOWNTO 0);
			time_out : OUT array_t(numports DOWNTO 1)(5 DOWNTO 0);
			rxvalid : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			rxhalff : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			rxflag : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			rxdata : OUT array_t(numports DOWNTO 0)(7 DOWNTO 0);
			rxread : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
			pstarted : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			rstarted : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			pconnecting : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			rconnecting : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			prunning : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			rrunning : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			perrdisc : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			rerrdisc : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			perrpar : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			rerrpar : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			perresc : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			rerresc : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			perrcred : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			rerrcred : OUT STD_LOGIC_VECTOR(numports DOWNTO 0)
		);
	END COMPONENT routertest;

	--SIGNAL s_selectport : INTEGER RANGE 0 TO 3;
	--SIGNAL s_selectdestport : INTEGER RANGE 0 TO 3;

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

	-- Routertest.
	SIGNAL s_autostart : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '1');
	SIGNAL s_linkstart : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '1');
	SIGNAL s_linkdis : STD_LOGIC_VECTOR(2 DOWNTO 0) := (0 => '0', OTHERS => '0'); -- to deactivate port0, set here '1'
	SIGNAL s_txdivcnt : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000001";
	SIGNAL s_tick_in : STD_LOGIC_VECTOR(2 DOWNTO 1) := (OTHERS => '0');
	SIGNAL s_ctrl_in : array_t(2 DOWNTO 1)(1 DOWNTO 0) := (OTHERS => (OTHERS => '0'));
	SIGNAL s_time_in : array_t(2 DOWNTO 1)(5 DOWNTO 0) := (OTHERS => (OTHERS => '0'));
	SIGNAL s_txwrite : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0');
	SIGNAL s_txflag : STD_LOGIC_VECTOR(2 DOWNTO 0);-- := (OTHERS => '0');
	SIGNAL s_txdata : array_t(2 DOWNTO 0)(7 DOWNTO 0);-- := (OTHERS => "00000010");--(OTHERS => '1'));
	SIGNAL s_txrdy : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_txhalff : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_tick_out : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_ctrl_out : array_t(2 DOWNTO 1)(1 DOWNTO 0);
	SIGNAL s_time_out : array_t(2 DOWNTO 1)(5 DOWNTO 0);
	SIGNAL s_rxvalid : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_rxhalff : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_rxflag : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_rxdata : array_t(2 DOWNTO 0)(7 DOWNTO 0);
	SIGNAL s_rxread : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_pstarted : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_rstarted : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_pconnecting : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_rconnecting : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_prunning : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_rrunning : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_perrdisc : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_rerrdisc : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_perrpar : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_rerrpar : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_perresc : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_rerresc : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_perrcred : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_rerrcred : STD_LOGIC_VECTOR(2 DOWNTO 0);

	SIGNAL s_rxvalid_int : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_perror_int : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_rerror_int : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_perror : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_rerror : STD_LOGIC_VECTOR(2 DOWNTO 0);
	TYPE fsm_state IS (s_Idle, s_Recv, s_Wait, s_Send);

	SIGNAL stateUART2SpW : fsm_state := S_Idle;
	SIGNAL stateSpW2UART : fsm_state := S_Idle;
BEGIN
	-- Drive outputs.
	rxhalff <= s_rxvalid_int; -- Debugging!
	prunning <= s_prunning;
	rrunning <= s_rrunning;
	perror <= s_perror_int;
	rerror <= s_rerror;
	
	-- Shows running ports.
	s_prunning <= s_prunning; -- running mode of external ports
	s_rrunning <= s_rrunning; -- running mode of router ports
	

	-- Synchronous update of status signals.
	PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			-- Debugging: Zeigt an wenn ein externer Port daten empfangen hat (muss mit clear quittiert werden!)
			s_rxvalid_int <= (s_rxvalid_int OR s_txwrite) AND (NOT clear) AND (NOT rst);--s_rxhalff; -- half receive fifo (spacewire -> uart) is full
			
			-- Sticky error led.
			s_perror_int <= (s_perror_int OR s_rxvalid) AND (NOT clear) AND (NOT rst); -- ACHTUNG! F�r debug ge�nderT! TODO! (rxvalid)
			s_rerror_int <= (s_rerror_int OR s_rerror) AND (NOT clear) AND (NOT rst);

			-- Shows all errors on one led.
			s_perror <= s_perrdisc OR s_perrpar OR s_perresc OR s_perrcred; -- error external ports
			s_rerror <= s_rerrdisc OR s_rerrpar OR s_rerresc OR s_rerrcred; -- error router ports
		END IF;
	END PROCESS;

	-- Combinatorial update of selected ports into internal signals.
--	PROCESS (clk)--(selectport, selectdestport)
--	BEGIN
--		-- Select Ports.
--		CASE selectport IS
--			WHEN "00" =>
--				s_selectport <= 0;
--			WHEN "01" =>
--				s_selectport <= 1;
--			WHEN "10" =>
--				s_selectport <= 2;
--			WHEN OTHERS =>
--				s_selectport <= 2;
--		END CASE;
--		CASE selectdestport IS
--			WHEN "00" =>
--				s_selectdestport <= 0;
--			WHEN "01" =>
--				s_selectdestport <= 1;
--			WHEN "10" =>
--				s_selectdestport <= 2;
--			WHEN OTHERS =>
--				s_selectdestport <= 2;
--		END CASE;
--	END PROCESS;

	uart_object : uart
	GENERIC MAP(
		clk_cycles_per_bit => 87
	)
	PORT MAP(
		clk => clk,
		rst => rst,
		tx_port => txstream,
		tx_ack => uart_tx_ack,
		tx_data => uart_buffer_tx,
		tx_rdy => uart_tx_ready,
		rx_port => rxstream,
		rx_ack => uart_rx_ack,
		rx_data => uart_buffer_rx,
		rx_rdy => uart_rx_ready
	);


	-- Routertest interface.
	RouterToExtPortsComm : routertest
	GENERIC MAP(
		numports => 2,
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
		linkdis => s_linkdis,
		txdivcnt => s_txdivcnt,
		tick_in => s_tick_in,
		ctrl_in => s_ctrl_in,
		time_in => s_time_in,
		txwrite => s_txwrite,
		txflag => s_txflag,
		txdata => s_txdata,
		txrdy => s_txrdy,
		txhalff => s_txhalff,
		tick_out => s_tick_out,
		ctrl_out => s_ctrl_out,
		time_out => s_time_out,
		rxvalid => s_rxvalid,
		rxhalff => s_rxhalff,
		rxflag => s_rxflag,
		rxdata => s_rxdata,
		rxread => s_rxread,
		pstarted => s_pstarted,
		rstarted => s_rstarted,
		pconnecting => s_pconnecting,
		rconnecting => s_rconnecting,
		prunning => s_prunning,
		rrunning => s_rrunning,
		perrdisc => s_perrdisc,
		rerrdisc => s_rerrdisc,
		perrpar => s_perrpar,
		rerrpar => s_rerrpar,
		perresc => s_perresc,
		rerresc => s_rerresc,
		perrcred => s_perrcred,
		rerrcred => s_rerrcred
	);
END routertest_top_single_arch;