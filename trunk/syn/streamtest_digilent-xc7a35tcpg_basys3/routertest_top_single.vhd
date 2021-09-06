----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.08.2021 22:28:26
-- Design Name: 
-- Module Name: routertest_top - routertest_top_arch
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.spwpkg.ALL;
USE work.spwrouterpkg.ALL;
USE work.routertest_top_single_tb_pkg.ALL;

ENTITY routertest_top_single IS
	PORT (
		-- System clock.
		clk : IN STD_LOGIC;

		-- Reset.
		rst : IN STD_LOGIC;

		-- Marks which port (0 to 2) is selected to send the next packet.
		-- (10 == 2; 01 == 1; 00 == 0)
		selectport : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

		-- Incoming serial stream (uart).
		rxstream : IN STD_LOGIC;

		-- Outgoing serial stream (uart).
		txstream : OUT STD_LOGIC;

		-- Conversion from spacewire to uart is slowed down by its slower data 
		-- transfer. For this reason, that port is used to inform when output
		-- fifo memory is half full and there is a risk of data loss with further
		-- packets.
		rxhalff : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);

		-- High if corresponding router port is in running mode. 
		-- Low means that it is in an initializing, started or connecting state.
		rrunning : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);

		-- High if corresponding external port is in running mode.
		-- Low means that it is in an initializing, started or connecting state.
		prunning : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);

		-- High if corresponding router port has reported an error.
		rerror : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);

		-- High if corresponding external port has reported an error.
		perror : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);

		-- Debugports
		dincstate : OUT incstates;
		doutstate : OUT outstates;
		rxvalid : OUT STD_LOGIC;
		txwrite : OUT STD_LOGIC;
		prxvalid : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		txinact : OUT STD_LOGIC;
		spw_d_p2r : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		spw_d_r2p : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		uart_txdata: out std_logic_vector(7 downto 0)
	);
END routertest_top_single;

ARCHITECTURE routertest_top_single_arch OF routertest_top_single IS
	--constant numports : integer range 0 to 31 := 2;

	-- Uart receiver module.
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

	-- Uart transmitter module.
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
			rerrcred : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			--gotData : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			--sentData : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			--fsmstate : OUT fsmarr(numports DOWNTO 0);
			--debugdataout : OUT array_t(numports DOWNTO 0)(8 DOWNTO 0);
			--dreadyIn : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			--drequestIn : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			--ddataIn : OUT array_t(numports DOWNTO 0)(8 DOWNTO 0);
			--dstrobeIn : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			--dreadyOut : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			--drequestOut : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			--ddataOut : OUT array_t(numports DOWNTO 0)(8 DOWNTO 0);
			--dstrobeOut : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			--dgranted : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			--dSwitchPortNumber : OUT array_t(numports DOWNTO 0)(numports DOWNTO 0);
			--dSelectDestinationPort : OUT array_t(numports DOWNTO 0)(numports DOWNTO 0);
			--droutingSwitch : OUT array_t(numports DOWNTO 0)(numports DOWNTO 0);
			--dsourcePortOut : OUT array_t(numports DOWNTO 0)(1 DOWNTO 0);
			--ddestinationPort : OUT array_t(numports DOWNTO 0)(7 DOWNTO 0);
			spw_d_r2p : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			--spw_s_r2p : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			spw_d_p2r : OUT STD_LOGIC_VECTOR(numports DOWNTO 0)
			--spw_s_p2r : OUT STD_LOGIC_VECTOR(numports DOWNTO 0)
		);
	END COMPONENT;

	-- Uart receiver.
	--SIGNAL s_uart_rxstream : STD_LOGIC;
	SIGNAL s_uart_rxvalid : STD_LOGIC := '0';
	SIGNAL s_uart_rxdata : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');

	-- Uart transmitter.
	SIGNAL s_uart_txwrite : STD_LOGIC := '0';
	SIGNAL s_uart_txdata : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
	SIGNAL s_uart_txactive : STD_LOGIC := '0';
	--SIGNAL s_uart_txstream : STD_LOGIC;
	SIGNAL s_uart_txdone : STD_LOGIC := '0';

	-- Routertest.
	SIGNAL s_rst : STD_LOGIC := '1';
	CONSTANT c_autostart : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '1');
	CONSTANT c_linkstart : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '1');
	CONSTANT c_linkdis : STD_LOGIC_VECTOR(2 DOWNTO 0) := (0 => '1', OTHERS => '0');
	CONSTANT c_txdivcnt : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000001";
	CONSTANT c_tick_in : STD_LOGIC_VECTOR(2 DOWNTO 1) := (OTHERS => '0');
	CONSTANT c_ctrl_in : array_t(2 DOWNTO 1)(1 DOWNTO 0) := (OTHERS => (OTHERS => '0'));
	CONSTANT c_time_in : array_t(2 DOWNTO 1)(5 DOWNTO 0) := (OTHERS => (OTHERS => '0'));
	SIGNAL s_txwrite : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0');
	SIGNAL s_txflag : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0');
	SIGNAL s_txdata : array_t(2 DOWNTO 0)(7 DOWNTO 0) := (OTHERS => (OTHERS => '0'));
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
	--SIGNAL gotData : STD_LOGIC_VECTOR(2 DOWNTO 0);
	--SIGNAL sentData : STD_LOGIC_VECTOR(2 DOWNTO 0);
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
	SIGNAL s_spw_d_r2p : STD_LOGIC_VECTOR(2 DOWNTO 0);
	--SIGNAL s_spw_s_r2p : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_spw_d_p2r : STD_LOGIC_VECTOR(2 DOWNTO 0);
	--SIGNAL s_spw_s_p2r : STD_LOGIC_VECTOR(2 DOWNTO 0);

	-- States for incoming packets from uart to external spacewire ports.
	--TYPE incstates IS (S_Idle, S_Cargo, S_TransmitAddress, S_Write1, S_Wait1, S_TransmitCargo, S_Write2, S_Wait2, S_TransmitEOP, S_Write3, S_Fin);
	SIGNAL incstate : incstates := S_Idle;

	-- States for outgoing packets from external spacewire ports to uart.
	--TYPE outstates IS (S_Idle, S_Wait1, S_Wait2, S_Data, S_Wait3);
	SIGNAL outstate : outstates := S_Idle;

	-- Debug
	--type states is (S_Idle, S_Send, S_End);
	--signal state : states := S_Idle;
	
BEGIN
	-- Drive outputs
	rxhalff <= s_rxhalff; -- half receive fifo (spacewire -> uart) is full

	prunning <= s_prunning; -- running mode of external ports
	rrunning <= s_rrunning; -- running mode of router ports

	perror <= s_perrdisc OR s_perrpar OR s_perresc OR s_perrcred; -- error external ports
	rerror <= s_rerrdisc OR s_rerrpar OR s_rerresc OR s_rerrcred; -- error router ports

	-- Uart serial streams.
	--txstream <= s_uart_txstream;
	--s_uart_rxstream <= rxstream;

	s_rst <= rst;
	-- Debugports
	dincstate <= incstate;
	doutstate <= outstate;
	prxvalid <= s_rxvalid;
	rxvalid <= s_uart_rxvalid;
	txwrite <= s_uart_txwrite;
	txinact <= s_uart_txactive;

	spw_d_r2p <= s_spw_d_r2p;
	spw_d_p2r <= s_spw_d_p2r;

	uart_txdata <= s_uart_txdata;


	UartReceiver : uart_rx
	GENERIC MAP(
		clk_cycles_per_bit => 87 -- Value for 10 MHz clock frequency and 115200 baud rate
	)
	PORT MAP(
		clk => clk,
		rxstream => rxstream,
		rxvalid => s_uart_rxvalid,
		rxdata => s_uart_rxdata
	);

	UartTransmitter : uart_tx
	GENERIC MAP(
		clk_cycles_per_bit => 87
	)
	PORT MAP(
		clk => clk,
		txwrite => s_uart_txwrite,
		txdata => s_uart_txdata,
		txactive => s_uart_txactive,
		txstream => txstream,
		txdone => s_uart_txdone
	);

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
		autostart => c_autostart,
		linkstart => c_linkstart,
		linkdis => c_linkdis,
		txdivcnt => c_txdivcnt,
		tick_in => c_tick_in,
		ctrl_in => c_ctrl_in,
		time_in => c_time_in,
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
		rerrcred => s_rerrcred,
		--gotData => gotData,
		--sentData => sentData,
		--fsmstate => fsmstate,
		--debugdataout => debugdataout,
		--dreadyIn => dreadyIn,
		--drequestIn => drequestIn,
		--ddataIn => ddataIn,
		--dstrobeIn => dstrobeIn,
		--dreadyOut => dreadyOut,
		--drequestOut => drequestOut,
		--ddataOut => ddataOut,
		--dstrobeOut => dstrobeOut,
		--dgranted => dgranted,
		--dSwitchPortNumber => dSwitchPortNumber,
		--dSelectDestinationPort => dSelectDestinationPort,
		--droutingSwitch => droutingSwitch,
		--dsourcePortOut => dsourcePortOut,
		--ddestinationPort => ddestinationPort,
		spw_d_r2p => s_spw_d_r2p, -- Signale werden für Hardwareimplementierung nicht benötigt, sind eher für Simulation interessant zur Nachverfolgung
		--spw_s_r2p => open, --s_spw_s_r2p,
		spw_d_p2r => s_spw_d_p2r
		--spw_s_p2r => open --s_spw_s_p2r
	);

	-- Controls convertion from uart signals into spacewire.
	IncomingFSM : PROCESS (clk)
		-- External port that shall send next packet.
		VARIABLE addrport : INTEGER RANGE 0 TO 2 := 0;
		--variable newpacket : boolean := false;
		VARIABLE data : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
	BEGIN
		IF rising_edge(clk) THEN
			CASE incstate IS
				WHEN S_Idle =>
					addrport := to_integer(unsigned(selectport));

					IF s_uart_rxvalid = '1' THEN
						data(15 DOWNTO 8) := s_uart_rxdata;

						incstate <= S_Cargo;
					END IF;

				WHEN S_Cargo =>
					IF s_uart_rxvalid = '1' THEN
						data(7 DOWNTO 0) := s_uart_rxdata;

						incstate <= S_TransmitAddress;
					END IF;

				WHEN S_TransmitAddress =>
					IF s_txrdy(addrport) = '1' THEN
						s_txdata(addrport) <= data(15 DOWNTO 8);
						s_txflag(addrport) <= '0';

						incstate <= S_Write1;
					END IF;

				WHEN S_Write1 =>
					s_txwrite(addrport) <= '1';

					incstate <= S_Wait1;

				WHEN S_Wait1 =>
					s_txwrite(addrport) <= '0';

					incstate <= S_TransmitCargo;

				WHEN S_TransmitCargo =>
					IF s_txrdy(addrport) = '1' THEN
						s_txdata(addrport) <= data(7 DOWNTO 0);
						-- flag stays at zero.

						incstate <= S_Write2;
					END IF;
				WHEN S_Write2 =>
					s_txwrite(addrport) <= '1';

					incstate <= S_Wait2;

				WHEN S_Wait2 =>
					s_txwrite(addrport) <= '0';

					incstate <= S_TransmitEOP;

				WHEN S_TransmitEOP =>
					IF s_txrdy(addrport) = '1' THEN
						s_txdata(addrport) <= "00000000"; -- EOP
						s_txflag(addrport) <= '1';

						incstate <= S_Write3;
					END IF;
				WHEN S_Write3 =>
					s_txwrite(addrport) <= '1';

					incstate <= S_Fin;

				WHEN S_Fin =>
					s_txwrite(addrport) <= '0';
					data := (OTHERS => '0');

					incstate <= S_Idle;

			END CASE;
		END IF;
	END PROCESS;

	-- Controls conversion from external spacewire ports into uart.
	OutgoingFSM : PROCESS (clk)
		-- Extern port that is allowed to send the next packet over uart.
		VARIABLE addrport : INTEGER RANGE 0 TO 2 := 0;

		VARIABLE data : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
	BEGIN
		IF rising_edge(clk) THEN
			CASE outstate IS
				WHEN S_Idle =>
					if addrport = 2 then
						addrport := 0;
					else
						addrport := addrport + 1;
					end if;

					if s_rxvalid(addrport) = '1' then
						data(15 downto 8) := std_logic_vector(to_unsigned(addrport, 8));

						s_rxread(addrport) <= '1';

						outstate <= S_Wait1;
					end if;

				when S_Wait1 =>
					data(7 downto 0) := s_rxdata(addrport);
					s_rxread(addrport) <= '0';

					outstate <= S_Wait2;

				when S_Wait2 =>
					if s_uart_txactive = '0' then
						s_uart_txdata <= data(15 downto 8);
						
						outstate <= S_Data;
					end if;

				when S_Data =>
					s_uart_txwrite <= '1';

					outstate <= S_Wait3;

				when S_Wait3 =>
					s_uart_txwrite <= '0';

					outstate <= S_Wait4;

				when S_Wait4 =>
					if s_uart_txactive = '0' then
						s_uart_txdata <= data(7 downto 0);

						outstate <= S_Wait5;
					end if;

				when S_Wait5 =>
					s_uart_txwrite <= '1';

					outstate <= S_Wait6;

				when S_Wait6 =>
					s_uart_txwrite <= '0';

					s_uart_txdata <= (others => '0');
					data := (others => '0');

					outstate <= S_Idle;
			END CASE;
		END IF;
	END PROCESS;
END routertest_top_single_arch;