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
--USE work.routertest_top_single_tb_pkg.ALL;

ENTITY routertest_top_single IS
	PORT (
		-- System clock.
		clk : IN STD_LOGIC;

		-- Reset.
		rst : IN STD_LOGIC;

		-- Clear button.
		clear : IN STD_LOGIC;

		uartfifofull : OUT STD_LOGIC;

		-- Marks which port (0 to 2) is selected to send the next packet.
		-- (10 == 2; 01 == 1; 00 == 0)
		selectport : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

		selectdestport : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

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
		perror : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)

		-- Debugports
		--received : OUT STD_LOGIC;
		--rxvalid : OUT STD_LOGIC;
		--txwrite : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		--prxvalid : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		--txinact : OUT STD_LOGIC;
		--spw_d_p2r : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		--spw_d_r2p : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		--uart_txdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		--txdata : OUT array_t(2 DOWNTO 0)(8 DOWNTO 0);
		--recdata : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
		--raddr : OUT INTEGER RANGE 0 TO 16;
		--waddr : OUT INTEGER RANGE 0 TO 16
	);
END routertest_top_single;

ARCHITECTURE routertest_top_single_arch OF routertest_top_single IS
	TYPE bool_to_logic_type IS ARRAY(BOOLEAN) OF STD_ULOGIC;
	CONSTANT bool_to_logic : bool_to_logic_type := (false => '0', true => '1');

	--constant selectdestport: std_logic_vector(1 downto 0) := "01";
	--constant selectport: std_logic_vector(1 downto 0) := "10";

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

	--    component RS232 is
	--        generic (
	--            Quarz_Taktfrequenz : integer := 10e6;
	--            Baudrate : integer := 115200 -- 9600 vorher
	--        );
	--        port (
	--            CLK: in std_logic;
	--            RXD: in STD_LOGIC;
	--            RX_Data: out std_logic_vector(7 downto 0);
	--            RX_Busy: out std_logic;
	--            RX_Valid: out std_logic;
	--            TXD: out std_logic;
	--            TX_Data: in std_logic_vector(7 downto 0);
	--            TX_Start: in std_logic;
	--            TX_Busy: out std_logic
	--        );
	--    end component;
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
			gotData : OUT STD_LOGIC_VECTOR(numports DOWNTO 0); -- Debugports ab hier!
			sentData : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
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
	SIGNAL s_uartrxdata : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
	SIGNAL s_uartrxbusy : STD_LOGIC;
	SIGNAL s_uartrxvalid : STD_LOGIC;

	-- Uart transmitter.
	SIGNAL s_uarttxwrite : STD_LOGIC;
	SIGNAL s_uarttxdata : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
	SIGNAL s_uarttxactive : STD_LOGIC;
	SIGNAL s_uarttxdone : STD_LOGIC;

	-- Routertest.
	SIGNAL s_autostart : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '1');
	SIGNAL s_linkstart : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '1');
	SIGNAL s_linkdis : STD_LOGIC_VECTOR(2 DOWNTO 0) := (0 => '0', OTHERS => '0'); -- to deactivate port0, set here '1'
	SIGNAL s_txdivcnt : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000001";
	SIGNAL s_tick_in : STD_LOGIC_VECTOR(2 DOWNTO 1) := (OTHERS => '0');
	SIGNAL s_ctrl_in : array_t(2 DOWNTO 1)(1 DOWNTO 0) := (OTHERS => (OTHERS => '0'));
	SIGNAL s_time_in : array_t(2 DOWNTO 1)(5 DOWNTO 0) := (OTHERS => (OTHERS => '0'));
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
	SIGNAL gotData : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL sentData : STD_LOGIC_VECTOR(2 DOWNTO 0);
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

	-- Debug
	SIGNAL s_dtxdata : array_t(2 DOWNTO 0)(8 DOWNTO 0);

	--SIGNAL s_rxempty : STD_LOGIC; -- '1' when rx fifo is empty
	SIGNAL s_writepacket : STD_LOGIC := '0'; -- '1' wenn ein EOP per uart �bertragen wurde. dann alles aus dem fifo an port schicken
	SIGNAL s_recdata : STD_LOGIC_VECTOR(8 DOWNTO 0); -- (8) == control flag, (7 downto 0) == data byte
	--	SIGNAL s_outport : INTEGER RANGE 0 DOWNTO 2; -- Legt fest von welchem Port gesendet wird -- TODO: Logik noch schreiben!

	SIGNAL s_selectport : INTEGER RANGE 0 TO 2; --std_logic_vector(1 downto 0);
	SIGNAL s_selectdestport : INTEGER RANGE 0 TO 2; --std_logic_vector(1 downto 0);

	-- Eingangsspeicher
	SIGNAL s_rxfifo_raddr : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0'); -- bildet auf jeden Eintrag in recmem ab
	SIGNAL s_rxfifo_rdata : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL s_rxfifo_wen : STD_LOGIC := '0';
	SIGNAL s_rxfifo_waddr : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
	SIGNAL s_rxfifo_wdata : STD_LOGIC_VECTOR(7 DOWNTO 0);

	SIGNAL s_rxfull : STD_LOGIC := '0';

	--	TYPE regs_type IS RECORD
	--		-- Packet state.
	--		--		rxpacket : STD_LOGIC; -- '1' when receiving a packet
	--		--		rxeep : STD_LOGIC; -- '1' when rx eep character pending
	--		--		txpacket : STD_LOGIC; -- '1' when transmitting a packet
	--		--		txdiscard : STD_LOGIC; -- '1' when discarding a tx packet

	--		-- FIFO pointers.
	--		rxfifo_raddr : STD_LOGIC_VECTOR(3 DOWNTO 0);
	--		rxfifo_waddr : STD_LOGIC_VECTOR(3 DOWNTO 0);

	--		-- FIFO state.
	--		rxfifo_rvalid : STD_LOGIC; -- '1' if s_rxfifo_rdata is valid
	--		rxfull : STD_LOGIC; -- '1' if rx fifo is full
	--		rxroom : STD_LOGIC_VECTOR(3 DOWNTO 0); -- for what?		
	--	END RECORD;

	--	CONSTANT regs_reset : regs_type := (
	--		--		rxpacket => '0',
	--		--		rxeep => '0',
	--		--		txpacket => '0',
	--		--		txdiscard => '0',
	--		rxfifo_raddr => (OTHERS => '0'),
	--		rxfifo_waddr => (OTHERS => '0'),
	--		rxfifo_rvalid => '0',
	--		rxfull => '0',
	--		rxroom => (OTHERS => '0')
	--	);

	--SIGNAL r : regs_type := regs_reset;
	--SIGNAL rin : regs_type;
	--TYPE states IS (S_Idle, S_Send, S_End);
	--SIGNAL state : states := S_Idle;
	-- Zwischensignale Output ports
	SIGNAL s_rxvalid_int : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_perror_int : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_rerror_int : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_perror : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_rerror : STD_LOGIC_VECTOR(2 DOWNTO 0);

	TYPE uarttxstates IS (S_Idle, S_Check, S_Prepare1, S_Prepare2, S_Prepare3, S_Send, S_Wait1, S_Wait2);
	SIGNAL state : uarttxstates := S_Idle;

	TYPE incstates IS (S_Idle, S_Write, S_Clean);
	SIGNAL incstate : incstates := S_Idle;

	TYPE writestates IS (S_Idle, S_Write, S_Clean);
	SIGNAL writestate : writestates := S_Idle;

	--SIGNAL shiftreg : STD_LOGIC_VECTOR(7 DOWNTO 0);

	SIGNAL s_equal : STD_LOGIC; -- '1' when rxfifo pointers (raddr & waddr) point to equal field
	SIGNAL s_sreset : STD_LOGIC; -- '1' when a packet has been given to external ports completely 
BEGIN
	-- Drive outputs
	PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			rxhalff <= s_rxvalid_int; -- Debugging!
			prunning <= s_prunning;
			rrunning <= s_rrunning;
			perror <= s_perror;
			rerror <= s_rerror;

			-- Debugging: Zeigt an wenn ein externer Port daten empfangen hat (muss mit clear quittiert werden!)
			s_rxvalid_int <= (s_rxvalid_int OR s_rxvalid) AND (NOT clear) AND (NOT rst);--s_rxhalff; -- half receive fifo (spacewire -> uart) is full

			-- Shows running ports.
			s_prunning <= s_prunning; -- running mode of external ports
			s_rrunning <= s_rrunning; -- running mode of router ports

			-- Sticky error led.
			s_perror_int <= (s_perror_int OR s_perror) AND (NOT clear) AND (NOT rst);
			s_rerror_int <= (s_rerror_int OR s_rerror) AND (NOT clear) AND (NOT rst);

			-- Shows all errors on one led.
			s_perror <= s_perrdisc OR s_perrpar OR s_perresc OR s_perrcred; -- error external ports
			s_rerror <= s_rerrdisc OR s_rerrpar OR s_rerresc OR s_rerrcred; -- error router ports

			-- Shows rxfifo filling;
			uartfifofull <= (uartfifofull OR s_rxfull) AND (NOT clear) AND (NOT rst);

			-- Select Ports.
			CASE selectport IS
				WHEN "00" =>
					s_selectport <= 0;
				WHEN "01" =>
					s_selectport <= 1;
				WHEN "10" =>
					s_selectport <= 2;
				WHEN OTHERS =>
					s_selectport <= 0;
			END CASE;
			CASE selectdestport IS
				WHEN "00" =>
					s_selectdestport <= 0;
				WHEN "01" =>
					s_selectdestport <= 1;
				WHEN "10" =>
					s_selectdestport <= 2;
				WHEN OTHERS =>
					s_selectdestport <= 0;
			END CASE;
		END IF;
	END PROCESS;

	-- Debug
	--received <= s_writepacket;
	--rxvalid <= s_uartrxvalid;
	--txwrite <= s_txwrite;
	--prxvalid <= s_rxvalid;
	--spw_d_p2r <= s_spw_d_p2r;
	--spw_d_r2p <= s_spw_d_r2p;
	--uart_txdata <= s_uartrxdata;--s_rxfifo_wdata(7 DOWNTO 0);
	--s_dtxdata(0) <= s_txflag(0) & s_txdata(0);
	--s_dtxdata(1) <= s_txflag(1) & s_txdata(1);
	--s_dtxdata(2) <= s_txflag(2) & s_txdata(2);
	--txdata <= s_dtxdata;
	--recdata(7 DOWNTO 0) <= s_rxfifo_rdata;
	--txinact <= s_equal;
	--raddr <= to_integer(unsigned(s_rxfifo_raddr));
	--waddr <= to_integer(unsigned(s_rxfifo_waddr));

	--    uart: RS232
	--		generic map (
	--			Baudrate => 115200
	--		)
	--        port map (
	--            CLK => clk,
	--            RXD => rxstream,
	--            RX_Data => s_uartrxdata,
	--            RX_Busy => s_uartrxbusy,
	--            RX_Valid => s_uartrxvalid,
	--            TXD => txstream,
	--            TX_Data => s_uarttxdata,
	--            TX_Start => s_uarttxwrite,
	--            TX_Busy => s_uarttxactive
	--        );

	-- Von externen Ports zu uart (transmitter)   
	PROCESS (clk, rst)
		VARIABLE destport : INTEGER RANGE 0 TO 2;
		VARIABLE rdata : STD_LOGIC_VECTOR(8 DOWNTO 0);
	BEGIN
		IF rst = '1' THEN
			-- Asynchronous reset.
			s_rxread <= (OTHERS => '0');
			rdata := (OTHERS => '0');
			s_uarttxwrite <= '0';
			state <= S_Idle;
		ELSIF rising_edge(clk) THEN
			CASE state IS
				WHEN S_Idle =>
					IF s_rxvalid(s_selectdestport) = '1' THEN
						destport := s_selectdestport;

						state <= S_Check;
					END IF;

				WHEN S_Check =>
					IF s_uarttxactive = '0' THEN
						state <= S_Prepare1;
					END IF;

				WHEN S_Prepare1 =>
					s_rxread(destport) <= '1';
					state <= S_Prepare2;

				WHEN S_Prepare2 =>
					rdata(8) := s_rxflag(destport);
					rdata(7 DOWNTO 0) := s_rxdata(destport);
					s_rxread <= (OTHERS => '0');
					state <= S_Prepare3;

				WHEN S_Prepare3 =>
					IF rdata = "100000000" OR rdata = "100000001" THEN
						state <= S_Idle;
					ELSE
						s_uarttxdata <= rdata(7 DOWNTO 0);
						state <= S_Send;
					END IF;

				WHEN S_Send =>
					s_uarttxwrite <= '1';

					state <= S_Wait1;

				WHEN S_Wait1 =>
					--IF s_uarttxactive = '0' THEN
					s_uarttxwrite <= '0';
					state <= S_Wait2;
					--END IF;

				WHEN S_Wait2 =>
					IF s_uarttxdone = '1' THEN
						state <= S_Idle;
					END IF;
			END CASE;
		END IF;
	END PROCESS;

	-- Schreibt von rx fifo zu external ports. (read fifo)
	PROCESS (clk, s_sreset)--, s_writepacket, s_equal)
		VARIABLE destport : INTEGER RANGE 0 TO 2;
		VARIABLE data : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
	BEGIN
		IF rising_edge(clk) THEN
			-- Synchronous reset.
			IF s_sreset = '1' THEN
				s_txwrite <= (OTHERS => '0');
				s_txflag <= (OTHERS => '0');
				s_txdata <= (OTHERS => (OTHERS => '0'));
				s_rxfifo_raddr <= (OTHERS => '0');
				data := (OTHERS => '0');
				writestate <= S_Idle;
			ELSE
				CASE writestate IS
					WHEN S_Idle =>
						IF s_writepacket = '1' THEN
							IF s_txrdy(s_selectport) = '1' THEN
								s_rxfifo_raddr <= STD_LOGIC_VECTOR(unsigned(s_rxfifo_raddr) + 1);

								destport := s_selectport;
								data := s_rxfifo_rdata;

								IF data = "11111111" THEN
									s_txflag(destport) <= '1';
									s_txdata(destport) <= "00000000"; -- EOP
								ELSE
									s_txflag(destport) <= '0';
									s_txdata(destport) <= data;
								END IF;

								writestate <= S_Write;
							END IF;
						END IF;

					WHEN S_Write =>
						s_txwrite(destport) <= '1';
						writestate <= S_Clean;

					WHEN S_Clean =>
						s_txwrite <= (OTHERS => '0');
						s_txflag <= (OTHERS => '0');
						s_txdata <= (OTHERS => (OTHERS => '0'));
						writestate <= S_Idle;
				END CASE;
			END IF;
		END IF;
	END PROCESS;

	s_equal <= bool_to_logic(s_rxfifo_waddr = s_rxfifo_raddr);
	s_sreset <= s_writepacket AND s_equal WHEN writestate = S_Idle;

	-- Schreibt von Uart in rx fifo. (write fifo)
	PROCESS (clk, s_sreset)
		VARIABLE wdata : STD_LOGIC_VECTOR(8 DOWNTO 0);
	BEGIN
		IF rising_edge(clk) THEN -- evtl. hier s_uart_rxvalid probieren falls es in der implementierung nicht geht!
			IF s_sreset = '1' THEN
				-- Synchronous reset.
				s_writepacket <= '0';
				s_rxfifo_waddr <= (OTHERS => '0');
				wdata := (OTHERS => '0');
				s_rxfull <= '0';
			ELSE
				IF s_uartrxvalid = '1' THEN
					IF s_rxfull = '0' THEN
						s_rxfifo_waddr <= STD_LOGIC_VECTOR(unsigned(s_rxfifo_waddr) + 1);
					END IF;

					IF s_uartrxdata = "11111111" THEN
						s_writepacket <= '1';
					END IF;

					IF unsigned(s_rxfifo_waddr) > 15 THEN
						s_rxfull <= '1';
					ELSE
						s_rxfull <= '0';
					END IF;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	UartReceiver : uart_rx
	GENERIC MAP(
		clk_cycles_per_bit => 87 -- Value for 10 MHz clock frequency and 115200 baud rate
	)
	PORT MAP(
		clk => clk,
		rxstream => rxstream,
		rxvalid => s_uartrxvalid,
		rxdata => s_uartrxdata
	);

	UartTransmitter : uart_tx
	GENERIC MAP(
		clk_cycles_per_bit => 87
	)
	PORT MAP(
		clk => clk,
		txwrite => s_uarttxwrite,
		txdata => s_uarttxdata,
		txactive => s_uarttxactive,
		txstream => txstream,
		txdone => s_uarttxdone
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
		rerrcred => s_rerrcred,
		gotData => gotData,
		sentData => sentData,
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
		spw_d_r2p => s_spw_d_r2p, -- Signale werden f�r Hardwareimplementierung nicht ben�tigt, sind eher f�r Simulation interessant zur Nachverfolgung
		--spw_s_r2p => open, --s_spw_s_r2p,
		spw_d_p2r => s_spw_d_p2r
		--spw_s_p2r => open --s_spw_s_p2r
	);

	recmem : spwram
	GENERIC MAP(
		abits => 4, -- 2 ** 4 == 16 rows (variable!)
		dbits => 8 -- 9 bits width (8 bits data, 1 for flag) -- fix
	)
	PORT MAP(
		rclk => clk,
		wclk => clk,
		ren => '1',
		raddr => s_rxfifo_raddr,
		rdata => s_rxfifo_rdata,
		wen => s_uartrxvalid AND (NOT s_rxfull), --s_rxfifo_wen,
		waddr => s_rxfifo_waddr,
		wdata => s_uartrxdata--s_rxfifo_wdata
	);
END routertest_top_single_arch;