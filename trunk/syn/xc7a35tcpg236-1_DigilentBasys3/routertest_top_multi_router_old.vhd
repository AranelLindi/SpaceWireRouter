----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 23.08.2021 22:28:26
-- Design Name: routertest_top_multi_router
-- Module Name: routertest_top - routertest_top_arch
-- Project Name: Implementation of a SpaceWire Router on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: Hardwareimplementation which contains a router (2 ports), external
-- port and uart receiver/transmitter. 
-- 
-- Dependencies: spwpgk, spwrouterpkg
-- 
-- Revision:
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.spwpkg.ALL;
USE work.spwrouterpkg.ALL;

ENTITY routertest_top_multi_router IS
	PORT (
		-- System clock.
		clk : IN STD_LOGIC;

		-- Reset.
		rst : IN STD_LOGIC;

		-- Clear button.
		clear : IN STD_LOGIC;

		-- Send manual end of packet.
		eop : IN STD_LOGIC;

		-- Marks the port which should send incoming uart bytes.
		selectport : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

		-- Marks the port to be targeted for output via uart.
		selectdestport : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

		-- Incoming serial stream (uart).
		rxstream : IN STD_LOGIC;

		-- Outgoing serial stream (uart).
		txstream : OUT STD_LOGIC;

		-- Conversion from spacewire to uart is slowed down by its slower data 
		-- transfer. For this reason, that port is used to inform when output
		-- fifo memory is half full and there is a risk of data loss with further
		-- packets.
		rxhalff : OUT STD_LOGIC;

		-- High if corresponding router port is in running mode. 
		-- Low means that it is in an initializing, started or connecting state.
		rrunning : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);

		-- Shows if external port is in started mode.
		pstarted : OUT STD_LOGIC;

		-- Shows if external port is in connecting mode.
		pconnecting : OUT STD_LOGIC;

		-- High if corresponding external port is in running mode.
		-- Low means that it is in an initializing, started or connecting state.
		prunning : OUT STD_LOGIC;

		-- High if corresponding router port has reported an error.
		rerror : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);

		-- High if corresponding external port has reported an error.
		perror : OUT STD_LOGIC;

		-- Incoming SpaceWire data signal from other board.
		spw_di : IN STD_LOGIC;

		-- Incoming SpaceWire strobe signal from other board.
		spw_si : IN STD_LOGIC;

		-- Outgoing SpaceWire data signal to other board.
		spw_do : OUT STD_LOGIC;

		-- Outgoing SpaceWire strobe signal to other board.
		spw_so : OUT STD_LOGIC
	);
END routertest_top_multi_router;

ARCHITECTURE routertest_top_multi_router_arch OF routertest_top_multi_router IS
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
	SIGNAL s_tick_in : STD_LOGIC_VECTOR(2 DOWNTO 1) := (OTHERS => '0');
	SIGNAL s_ctrl_in : STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL s_time_in : STD_LOGIC_VECTOR(5 DOWNTO 0) := (OTHERS => '0');
	SIGNAL s_txwrite : STD_LOGIC := '0';
	SIGNAL s_txflag : STD_LOGIC := '0';
	SIGNAL s_txdata : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";--(OTHERS => '1'));
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
	SIGNAL s_pstarted : STD_LOGIC;
	SIGNAL s_rstarted : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL s_pconnecting : STD_LOGIC;
	SIGNAL s_rconnecting : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL s_prunning : STD_LOGIC;
	SIGNAL s_rrunning : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL s_perrdisc : STD_LOGIC;
	SIGNAL s_rerrdisc : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL s_perrpar : STD_LOGIC;
	SIGNAL s_rerrpar : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL s_perresc : STD_LOGIC;
	SIGNAL s_rerresc : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL s_perrcred : STD_LOGIC;
	SIGNAL s_rerrcred : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL s_spw_di : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL s_spw_si : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL s_spw_do : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL s_spw_so : STD_LOGIC_VECTOR(1 DOWNTO 0);

	SIGNAL s_selectport : INTEGER RANGE 0 TO 2;
	SIGNAL s_selectdestport : INTEGER RANGE 0 TO 2;

	SIGNAL s_rxvalid_int : STD_LOGIC;
	SIGNAL s_perror_int : STD_LOGIC;
	SIGNAL s_rerror_int : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL s_perror : STD_LOGIC;
	SIGNAL s_rerror : STD_LOGIC_VECTOR(1 DOWNTO 0);

	TYPE uarttxstates IS (S_Idle, S_Check, S_Prepare1, S_Prepare2, S_Prepare3, S_Send, S_Wait1, S_Wait2);
	SIGNAL txstate : uarttxstates := S_Idle;

	TYPE uartrxstates IS (S_Idle, S_EOP, S_Send, S_Clean);
	SIGNAL rxstate : uartrxstates := S_Idle;
BEGIN
	-- Drive outputs.
	s_spw_di(1) <= spw_di;
	s_spw_si(1) <= spw_si;

	spw_do <= s_spw_do(1);
	spw_so <= s_spw_so(1);

	-- From uart to external SpaceWire port.
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
			s_txdata <= STD_LOGIC_VECTOR(to_unsigned(s_selectdestport, 8));
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
							selectport := s_selectport;
							data := s_uartrxdata;

							IF data = "11111111" THEN
								s_txflag <= '1';
								s_txdata <= "00000000";
								rxstate <= S_EOP;
							ELSE
								s_txflag <= '0';
								s_txdata <= STD_LOGIC_VECTOR(to_unsigned(s_selectdestport, 8));
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
						s_txdata <= STD_LOGIC_VECTOR(to_unsigned(s_selectport, 8));
						s_txflag <= '0';
						--data := (OTHERS => '0');
						--pdata := (OTHERS => '0');					

						rxstate <= S_Idle;
				END CASE;
			END IF;
		END IF;
	END PROCESS;

	-- Drive outputs.
	rxhalff <= s_rxvalid_int; -- Debugging!
	--prunning <= s_prunning;
	--rrunning <= s_rrunning;
	perror <= s_perror_int;
	rerror <= s_rerror;
	-- Shows running ports.
	--s_prunning <= s_prunning; -- running mode of external ports
	rrunning <= s_rrunning; -- running mode of router ports
	-- Shows rxfifo filling;
	--uartfifofull <= '0';--(uartfifofull OR s_rxfull) AND (NOT clear) AND (NOT rst);

	pstarted <= s_pstarted;
	pconnecting <= s_pconnecting;
	prunning <= s_prunning;

	-- Synchronous update of status signals.
	PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			-- Debugging: Zeigt an wenn ein externer Port daten empfangen hat (muss mit clear quittiert werden!)
			s_rxvalid_int <= (s_rxvalid_int OR s_rxvalid) AND (NOT clear) AND (NOT rst);--s_rxhalff; -- half receive fifo (spacewire -> uart) is full
			-- Sticky error led.
			s_perror_int <= (s_perror_int OR s_perror) AND (NOT clear) AND (NOT rst); -- ACHTUNG! F�r debug ge�nderT! TODO! (rxvalid)
			s_rerror_int <= (s_rerror_int OR s_rerror);-- AND (NOT clear) AND (NOT rst);

			-- Shows all errors on one led.
			s_perror <= s_perrdisc OR s_perrpar OR s_perresc OR s_perrcred; -- error external ports
			s_rerror <= s_rerrdisc OR s_rerrpar OR s_rerresc OR s_rerrcred; -- error router ports
		END IF;
	END PROCESS;

	-- Combinatorial update of selected ports into internal signals.
	PROCESS (selectport, selectdestport)
	BEGIN
		-- Select Ports.
		CASE selectport IS
			WHEN "00" =>
				s_selectport <= 0;
			WHEN "01" =>
				s_selectport <= 1;
			WHEN "10" =>
				s_selectport <= 1;
			WHEN OTHERS =>
				s_selectport <= 1;
		END CASE;
		CASE selectdestport IS
			WHEN "00" =>
				s_selectdestport <= 0;
			WHEN "01" =>
				s_selectdestport <= 1;
			WHEN "10" =>
				s_selectdestport <= 1;
			WHEN OTHERS =>
				s_selectdestport <= 1;
		END CASE;
	END PROCESS;

	-- From external ports to uart transmitter. 
	PROCESS (clk, rst)--, s_selectdestport)
		VARIABLE destport : INTEGER RANGE 0 TO 2;
		VARIABLE rdata : STD_LOGIC_VECTOR(8 DOWNTO 0);
	BEGIN
		IF rst = '1' THEN
			txstate <= S_Idle;
		ELSIF rising_edge(clk) THEN
			CASE txstate IS
				WHEN S_Idle =>
					IF s_rxvalid = '1' THEN
						destport := s_selectdestport;

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
					s_rxread <= '1';
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
	
	-- External Port 0.
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
		started => s_pstarted,
		connecting => s_pconnecting,
		running => s_prunning,
		errdisc => s_perrdisc,
		errpar => s_perrpar,
		erresc => s_perresc,
		errcred => s_perrcred,
		spw_di => s_spw_di(0),
		spw_si => s_spw_si(0),
		spw_do => s_spw_do(0),
		spw_so => s_spw_so(0)
	);

	-- SpaceWire router.
	Router : spwrouter
	GENERIC MAP(
		numports => 1,
		sysfreq => 10.0e6,
		txclkfreq => 10.0e6,
		rx_impl => (OTHERS => impl_fast),
		tx_impl => (OTHERS => impl_fast)
	)
	PORT MAP(
		clk => clk,
		rxclk => clk,
		txclk => clk,
		rst => rst,
		started => s_rstarted,
		connecting => s_rconnecting,
		running => s_rrunning,
		errdisc => s_rerrdisc,
		errpar => s_rerrpar,
		erresc => s_rerresc,
		errcred => s_rerrcred,
		spw_di(0) => s_spw_do(0),
		spw_di(1) => spw_di,
		spw_si(0) => s_spw_so(0),
		spw_si(1) => spw_si,
		spw_do(0) => s_spw_di(0),
		spw_do(1) => spw_do,
		spw_so(0) => s_spw_si(0),
		spw_so(1) => spw_so
	);
END routertest_top_multi_router_arch;