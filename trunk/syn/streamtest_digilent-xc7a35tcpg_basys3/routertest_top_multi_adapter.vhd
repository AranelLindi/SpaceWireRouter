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
		clear : IN STD_LOGIC;

		-- Send manual end of packet.
		eop : IN STD_LOGIC;

		-- Incoming serial stream (uart).
		rxstream : IN STD_LOGIC;

		-- Outgoing serial stream (uart).
		txstream : OUT STD_LOGIC;

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

		-- Debugports
		--		received : OUT STD_LOGIC;
		--		rxvalid : OUT STD_LOGIC;
		--		txwrite : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		--		prxvalid : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		--		txinact : OUT STD_LOGIC;
		--		spw_d_p2r : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		--		spw_d_r2p : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		--		uart_txdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		--		txdata : OUT array_t(2 DOWNTO 0)(8 DOWNTO 0);
		--		recdata : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
		--		raddr : OUT INTEGER RANGE 0 TO 16;
		--		waddr : OUT INTEGER RANGE 0 TO 16
	);
END routertest_top_multi_adapter;

ARCHITECTURE routertest_top_multi_adapter_arch OF routertest_top_multi_adapter IS
	CONSTANT portnumber : INTEGER := 1; -- Do not change!

	TYPE bool_to_logic_type IS ARRAY(BOOLEAN) OF STD_ULOGIC;
	CONSTANT bool_to_logic : bool_to_logic_type := (false => '0', true => '1');

	-- Uart receiver.
	COMPONENT uart_rx
		GENERIC (
			clk_cycles_per_bit : INTEGER
		);
		PORT (
			clk : IN STD_LOGIC;
			rxstream : IN STD_LOGIC;
			rxvalid : OUT STD_LOGIC;
			rxdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END COMPONENT;

	-- Uart transmitter.
	COMPONENT uart_tx
		GENERIC (
			clk_cycles_per_bit : INTEGER
		);
		PORT (
			clk : IN STD_LOGIC;
			txwrite : IN STD_LOGIC;
			txdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			txactive : OUT STD_LOGIC;
			txstream : OUT STD_LOGIC;
			txdone : OUT STD_LOGIC
		);
	END COMPONENT;

	-- Uart receiver.
	SIGNAL s_uartrxdata : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL s_uartrxbusy : STD_LOGIC;
	SIGNAL s_uartrxvalid : STD_LOGIC := '0';
	SIGNAL s_uartrxerror : STD_LOGIC;

	-- Uart transmitter.
	SIGNAL s_uarttxwrite : STD_LOGIC := '0';
	SIGNAL s_uarttxdata : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
	SIGNAL s_uarttxactive : STD_LOGIC;
	SIGNAL s_uarttxdone : STD_LOGIC;

	-- Routertest.
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
	--SIGNAL gotData : STD_LOGIC;
	--SIGNAL sentData : STD_LOGIC;
	--SIGNAL fsmstate : fsmarr(2 DOWNTO 0);
	--SIGNAL debugdataout : array_t(2 DOWNTO 0)(8 DOWNTO 0);
	--SIGNAL dreadyIn : STD_LOGIC_VECTOR(2 DOWNTO 0);
	--SIGNAL drequestIn : STD_LOGIC_VECTOR(2 DOWNTO 0);
	--SIGNAL ddataIn : array_t(2 DOWNTO 0)(8 DOWNTO 0);
	--SIGNAL dstrobeIn : STD_LOGIC_VECTOR(2 DOWNTO 0);
	--SIGNAL dreadyOut : STD_LOGIC_VECTOR(2 DOWNTO 0);
	--SIGNAL drequestOut : STD_LOGIC_VECTOR(2 DOWNTO 0);
	--SIGNAL ddataOut : array_t(2 DOWNTO 0)(8 DOWNTO 0);
	--SIGNAL dstrobeOut : STD_LOGIC_VECTOR(2 DOWNTO 0);
	--SIGNAL dgranted : STD_LOGIC_VECTOR(2 DOWNTO 0);
	--SIGNAL dSwitchPortNumber : array_t(2 DOWNTO 0)(2 DOWNTO 0);
	--SIGNAL dSelectDestinationPort : array_t(2 DOWNTO 0)(2 DOWNTO 0);
	--SIGNAL droutingSwitch : array_t(2 DOWNTO 0)(2 DOWNTO 0);
	--SIGNAL dsourcePortOut : array_t(2 DOWNTO 0)(1 DOWNTO 0);
	--SIGNAL ddestinationPort : array_t(2 DOWNTO 0)(7 DOWNTO 0);
	SIGNAL s_spw_di : STD_LOGIC;
	SIGNAL s_spw_si : STD_LOGIC;
	SIGNAL s_spw_do : STD_LOGIC;
	SIGNAL s_spw_so : STD_LOGIC;

	SIGNAL s_rxvalid_int : STD_LOGIC;
	SIGNAL s_error_int : STD_LOGIC;
	SIGNAL s_error : STD_LOGIC;

	TYPE uarttxstates IS (S_Idle, S_Check, S_Prepare1, S_Prepare2, S_Prepare3, S_Send, S_Wait1, S_Wait2);
	SIGNAL txstate : uarttxstates := S_Idle;

	TYPE uartrxstates IS (S_Idle, S_EOP, S_Send, S_Clean);
	SIGNAL rxstate : uartrxstates := S_Idle;
BEGIN
	-- Drive outputs.
	spw_do <= s_spw_do;
	spw_so <= s_spw_so;

	s_spw_di <= spw_di;
	s_spw_si <= spw_si;

	-- From uart to external ports.
	PROCESS (clk, rst)
		VARIABLE selectport : INTEGER RANGE 0 TO 2;
		VARIABLE data : STD_LOGIC_VECTOR(7 DOWNTO 0);
		VARIABLE pdata : STD_LOGIC_VECTOR(8 DOWNTO 0);
	BEGIN
		IF rst = '1' THEN
			rxstate <= S_Idle;
			data := (OTHERS => '0');
			pdata := (OTHERS => '0');
			s_txwrite <= '0';
			s_txdata <= STD_LOGIC_VECTOR(to_unsigned(portnumber, 8));
			s_txflag <= '0';
		ELSIF rising_edge(clk) THEN
			IF eop = '1' THEN
				-- Send EOPs.
				s_txflag <= '1';
				s_txdata <= "00000000";
				s_txwrite <= '1';
				rxstate <= S_Idle;
			ELSIF eop = '0' THEN
				CASE rxstate IS
					WHEN S_Idle =>
						s_txwrite <= '0';
						s_txdata <= s_uartrxdata;

						IF s_uartrxvalid = '1' THEN
							selectport := portnumber;
							data := s_uartrxdata;

							IF data = "11111111" THEN
								s_txflag <= '1';
								s_txdata <= "00000000";
								rxstate <= S_EOP;
							ELSE
								s_txflag <= '0';
								s_txdata <= STD_LOGIC_VECTOR(to_unsigned(portnumber, 8));
								rxstate <= S_Send;
							END IF;
						END IF;

					WHEN S_EOP =>
						IF s_txrdy = '1' THEN
							s_txwrite <= '1';
							rxstate <= S_Clean;
						END IF;

					WHEN S_Send =>
						IF s_txrdy = '1' THEN
							s_txwrite <= '1';
							rxstate <= S_Clean;
						END IF;

					WHEN S_Clean =>
						s_txwrite <= '0';
						s_txdata <= STD_LOGIC_VECTOR(to_unsigned(portnumber, 8));
						s_txflag <= '0';
						--data := (OTHERS => '0');
						--pdata := (OTHERS => '0');					

						rxstate <= S_Idle;
				END CASE;
			END IF;
		END IF;
	END PROCESS;

	-- Drive outputs

	-- Debug
	--	received <= '0';
	--	rxvalid <= s_uartrxvalid;
	--	txwrite <= s_txwrite;
	--	prxvalid <= s_rxvalid;
	--	spw_d_p2r <= s_spw_d_p2r;
	--	spw_d_r2p <= s_spw_d_r2p;
	--	uart_txdata <= s_uartrxdata;--s_rxfifo_wdata(7 DOWNTO 0);
	--	s_dtxdata(0) <= s_txflag(0) & s_txdata(0);
	--	s_dtxdata(1) <= s_txflag(1) & s_txdata(1);
	--	s_dtxdata(2) <= s_txflag(2) & s_txdata(2);
	--	txdata <= s_dtxdata;
	--	recdata(7 DOWNTO 0) <= (OTHERS => '0');--;s_recdata;
	--	txinact <= NOT s_uarttxactive;
	--	raddr <= 1 WHEN rxstate = S_Idle ELSE
	--		2 WHEN rxstate = S_Prepare ELSE
	--		3 WHEN rxstate = S_Send ELSE
	--		4 WHEN rxstate = S_Clean;
	--waddr <= to_integer(unsigned(s_rxfifo_waddr));
	-- Drive outputs.
	rxhalff <= s_rxhalff; -- Debugging!
	started <= s_started;
	connecting <= s_connecting;
	running <= s_running;
	rxvalid <= s_rxvalid_int;
	error <= s_error_int;

	-- Synchronous update of status signals.
	PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			-- Debugging: Zeigt an wenn ein externer Port daten empfangen hat (muss mit clear quittiert werden!)
			-- It shows if an external port has received data (will be confirmed with clear)
			s_rxvalid_int <= (s_rxvalid_int OR s_rxvalid) AND (NOT clear) AND (NOT rst);--s_rxhalff; -- half receive fifo (spacewire -> uart) is full
			-- Sticky error led.
			s_error_int <= (s_error_int OR s_error) AND (NOT clear) AND (NOT rst);

			-- Shows all errors on one led.
			s_error <= s_errdisc OR s_errpar OR s_erresc OR s_errcred; -- error router ports
		END IF;
	END PROCESS;

	-- From port to uart transmitter.   
	PROCESS (clk, rst)--, s_selectdestport)
		VARIABLE rdata : STD_LOGIC_VECTOR(8 DOWNTO 0);
	BEGIN
		IF rst = '1' THEN
			txstate <= S_Idle;
		ELSIF rising_edge(clk) THEN
			CASE txstate IS
				WHEN S_Idle =>
					IF s_rxvalid = '1' THEN
						txstate <= S_Check;
					END IF;

				WHEN S_Check =>
					IF s_uarttxactive = '0' THEN
						txstate <= S_Prepare1;
					END IF;

				WHEN S_Prepare1 =>
					s_rxread <= '1';
					txstate <= S_Prepare2;

				WHEN S_Prepare2 =>
					rdata(8) := s_rxflag;
					rdata(7 DOWNTO 0) := s_rxdata;
					s_rxread <= '0';
					txstate <= S_Prepare3;

				WHEN S_Prepare3 =>
					IF rdata(8) = '1' THEN
						txstate <= S_Idle;
					ELSIF rdata(8) = '0' THEN
						s_uarttxdata <= rdata(7 DOWNTO 0);
						txstate <= S_Send;
					END IF;

				WHEN S_Send =>
					s_uarttxwrite <= '1';

					txstate <= S_Wait1;

				WHEN S_Wait1 =>
					--IF s_uarttxactive = '0' THEN
					s_uarttxwrite <= '0';
					txstate <= S_Wait2;
					--END IF;

				WHEN S_Wait2 =>
					IF s_uarttxdone = '1' THEN
						txstate <= S_Idle;
					END IF;
			END CASE;
		END IF;
	END PROCESS;

	-- Uart receiver.
	uartrec : uart_rx
	GENERIC MAP(
		clk_cycles_per_bit => 87
	)
	PORT MAP(
		clk => clk,
		rxstream => rxstream,
		rxvalid => s_uartrxvalid,
		rxdata => s_uartrxdata
	);

	-- Uart transmitter.
	uartrx : uart_tx
	GENERIC MAP(
		clk_cycles_per_bit => 87
	)
	PORT MAP(
		clk => clk,
		txstream => txstream,
		txdata => s_uarttxdata,
		txactive => s_uarttxactive,
		txwrite => s_uarttxwrite,
		txdone => s_uarttxdone
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
END routertest_top_multi_adapter_arch;