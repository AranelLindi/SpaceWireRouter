----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 30.08.2021 23:11
-- Design Name: SpaceWire Router Port Testbench
-- Module Name: spwrouterport_tb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for spwrouterport. It was primarily created to examine 
-- the finite state machine of the port/router-connection bus for its correct
-- functionality. (To test the port itself, run appropiate test benches
-- (e. g. streamtest_tb))
-- The fsm immediately gets all permits required from outside, so that the 
-- clock delay is not real, just the general behavior.
--
-- In general, only the behavior of single port is tested here. When assigning
-- addresses in packets you must ensure therefore that packets with port 
-- addresses between 1 and 31 are rejected. Also - due to the missing connection
-- to the routing table - forwarding (Port 32 - 254) is only possible if a port
-- is marked in busMasterData in.
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

ENTITY spwrouterport_tb IS
END spwrouterport_tb;

ARCHITECTURE spwrouterport_tb_arch OF spwrouterport_tb IS
	-- Generic constants.
	CONSTANT numports : integer range 1 to 32 := 0;
	CONSTANT blen : INTEGER RANGE 0 TO 4 := 0;
	CONSTANT pnum : INTEGER RANGE 0 TO 31 := 0;

	-- System clock.
	SIGNAL clk : STD_LOGIC;

	-- Reset. (Important: It is necessary to perform a reset to initialize spwrouterport!)
	SIGNAL rst : STD_LOGIC := '1';

	SIGNAL autostart : STD_LOGIC := '1';
	SIGNAL linkstart : STD_LOGIC := '0';
	SIGNAL linkdis : STD_LOGIC := '0';

	SIGNAL txdivcnt : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000001";

	-- Incoming Timecodes and requests.
	SIGNAL tick_in : STD_LOGIC := '0';
	SIGNAL time_in : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');

	-- Transmitting control flag (8) and data (7-0)
	SIGNAL txdata : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');

	-- Outgoing Timecodes and requests.
	SIGNAL tick_out : STD_LOGIC;
	SIGNAL time_out : STD_LOGIC_VECTOR(7 DOWNTO 0);

	-- Receiving control flag (8) and data (7-0).
	SIGNAL rxdata : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');

	-- Status/Error signals of the port.
	SIGNAL started : STD_LOGIC;
	SIGNAL connecting : STD_LOGIC;
	SIGNAL running : STD_LOGIC;
	SIGNAL errdisc : STD_LOGIC;
	SIGNAL errpar : STD_LOGIC;
	SIGNAL erresc : STD_LOGIC;
	SIGNAL errcred : STD_LOGIC;
	SIGNAL linkUp : STD_LOGIC_VECTOR((numports-1) DOWNTO 0) := (pnum => '1', OTHERS => '0'); -- bluff

	SIGNAL requestOut : STD_LOGIC;
	SIGNAL destinationPortOut : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL sourcePortOut : STD_LOGIC_VECTOR(blen DOWNTO 0);
	SIGNAL grantedIn : STD_LOGIC := '1';
	SIGNAL strobeOut : STD_LOGIC;
	SIGNAL readyIn : STD_LOGIC := '1';
	SIGNAL requestIn : STD_LOGIC := '0'; -- Leave to zero to prevent uncontrolled transmitting
	SIGNAL strobeIn : STD_LOGIC := '0';
	SIGNAL readyOut : STD_LOGIC;

	SIGNAL busMasterAddressOut : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL busMasterDataIn : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
	SIGNAL busMasterDataOut : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL busMasterByteEnableOut : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL busMasterWriteEnableOut : STD_LOGIC;
	SIGNAL busMasterStrobeOut : STD_LOGIC;
	SIGNAL busMasterRequestOut : STD_LOGIC;
	SIGNAL busMasterAcknowledgeIn : STD_LOGIC := '1';

	-- Debug Ports
	SIGNAL gotData : STD_LOGIC;
	SIGNAL sentData : STD_LOGIC;
	SIGNAL fsmstate : spwrouterportstates;
	SIGNAL s_debugdataout : STD_LOGIC_VECTOR(8 DOWNTO 0);
	SIGNAL debugdataout : STD_LOGIC_VECTOR(8 DOWNTO 0);

	-- SpaceWire signals in/out
	SIGNAL spw_di : STD_LOGIC;
	SIGNAL spw_si : STD_LOGIC;
	SIGNAL spw_do : STD_LOGIC;
	SIGNAL spw_so : STD_LOGIC;

	CONSTANT clock_period : TIME := 10 ns; -- 100 MHz

	-- Specifies which kind of data should be send to port receiver. (Idle = Nulls)
	TYPE spwrouterport_tb_states IS (S_Idle, S_FCT, S_Data, S_Nothing);
	SIGNAL state : spwrouterport_tb_states := S_Nothing;

	-- Data and control flag that will send in S_Data state. 
	SIGNAL s_txdata : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
	SIGNAL s_txflag : STD_LOGIC := '0'; -- wichtig: steuert das flag (0 f�r data byte, 1 f�r eop/eep)

	TYPE regs_type IS RECORD
		-- tx clock.
		txclken : STD_ULOGIC; -- high if a bit must be transmitted
		txclkcnt : unsigned(7 DOWNTO 0);
		-- output shift register.
		bitshift : STD_LOGIC_VECTOR(12 DOWNTO 0);
		bitcnt : unsigned(3 DOWNTO 0);
		-- output signals.
		out_data : STD_ULOGIC;
		out_strobe : STD_ULOGIC;
		-- parity flag.
		parity : STD_ULOGIC;
		-- pending time tick.
		pend_tick : STD_ULOGIC;
		pend_time : STD_LOGIC_VECTOR(7 DOWNTO 0);
		-- transmitter mode.
		allow_fct : STD_ULOGIC; -- allowed to send FCTs
		allow_char : STD_ULOGIC; -- allowed to send data and time
		sent_null : STD_ULOGIC; -- sent at least one NULL token
		sent_fct : STD_ULOGIC; -- sent at least one FCT token
	END RECORD;

	-- Initial state.
	CONSTANT regs_reset : regs_type := (
		txclken => '0',
		txclkcnt => "00000000",
		bitshift => (OTHERS => '0'),
		bitcnt => "0000",
		out_data => '0',
		out_strobe => '0',
		parity => '0',
		pend_tick => '0',
		pend_time => (OTHERS => '0'),
		allow_fct => '0',
		allow_char => '0',
		sent_null => '0',
		sent_fct => '0');

	SIGNAL r : regs_type := regs_reset;
	SIGNAL rin : regs_type;

	-- Die Staten des Ports.
	TYPE testbenchstates IS (S_Rst, S_Started, S_Connecting, S_Running);
	SIGNAL tbstate : testbenchstates := S_Rst;

	TYPE runningstates IS (S_Null, S_FCT, S_Data, S_EOP);
	SIGNAL rstate : runningstates := S_Null;
	TYPE packetstate IS (S_Address, S_Cargo, S_EOP, S_Null);
	SIGNAL pstate : packetstate := S_Address;

	-- Zeigt an wann eine Übertragung (fast) abgeschlossen ist
	SIGNAL s_fin : STD_LOGIC;

	SIGNAL s_sendFCT : STD_LOGIC;
	SIGNAL s_sendData : STD_LOGIC;
BEGIN
	-- Design under test.
	dut : spwrouterport GENERIC MAP(
		numports => numports,
		blen => blen,
		pnum => 0,
		sysfreq => 100.0e6,
		txclkfreq => 100.0e6,
		rximpl => impl_generic,
		rxchunk => 1,
		WIDTH => 2,
		tximpl => impl_generic,
		rxfifosize_bits => 11,
		txfifosize_bits => 11)
	PORT MAP(
		clk => clk,
		rxclk => clk,
		txclk => clk,
		rst => rst,
		autostart => autostart,
		linkstart => linkstart,
		linkdis => linkdis,
		txdivcnt => txdivcnt,
		tick_in => tick_in,
		time_in => time_in,
		txdata => txdata,
		tick_out => tick_out,
		time_out => time_out,
		rxdata => rxdata,
		started => started,
		connecting => connecting,
		running => running,
		errdisc => errdisc,
		errpar => errpar,
		erresc => erresc,
		errcred => errcred,
		linkUp => linkUp,
		requestOut => requestOut,
		destinationPortOut => destinationPortOut,
		sourcePortOut => sourcePortOut,
		grantedIn => grantedIn,
		strobeOut => strobeOut,
		readyIn => readyIn,
		requestIn => requestIn,
		strobeIn => strobeIn,
		readyOut => readyOut,
		busMasterAddressOut => busMasterAddressOut,
		busMasterDataIn => busMasterDataIn,
		busMasterDataOut => busMasterDataOut,
		busMasterByteEnableOut => busMasterByteEnableOut,
		busMasterWriteEnableOut => busMasterWriteEnableOut,
		busMasterStrobeOut => busMasterStrobeOut,
		busMasterRequestOut => busMasterRequestOut,
		busMasterAcknowledgeIn => busMasterAcknowledgeIn,
		gotData => gotData,
		sentData => sentData,
		fsmstate => fsmstate,
		debugdataout => s_debugdataout,
		spw_di => spw_di,
		spw_si => spw_si,
		spw_do => spw_do,
		spw_so => spw_so);

		
	PROCESS (r, rst, txdivcnt, state, s_txflag, s_txdata)
		VARIABLE v : regs_type;
	BEGIN
		v := r;

		-- Generate tx clock.
		IF r.txclkcnt = 0 THEN
			v.txclkcnt := unsigned(txdivcnt);
			v.txclken := '1';
		ELSE
			v.txclkcnt := r.txclkcnt - 1;
			v.txclken := '0';
		END IF;
		IF state = S_Nothing THEN
			-- Transmitter disabled; reset state.
			v.bitcnt := "0000";
			v.parity := '0';
			v.pend_tick := '0';
			v.allow_fct := '0';
			v.allow_char := '0';
			v.sent_null := '0';
			v.sent_fct := '0';

			-- Gentle reset of spacewire bus signals
			IF r.txclken = '1' THEN
				v.out_data := r.out_data AND r.out_strobe;
				v.out_strobe := '0';
			END IF;
		ELSE
			-- Transmitter enabled.

			v.allow_fct := (NOT (started)) AND r.sent_null;
			v.allow_char := (NOT (started)) AND r.sent_null AND (NOT (connecting)) AND r.sent_fct;

			-- On tick of transmission clock, put next bit on the output
			IF r.txclken = '1' THEN
				IF r.bitcnt = 0 THEN
					s_fin <= '0';

					-- Need to start a new character.
					IF (r.allow_char = '1') AND (r.pend_tick = '1') THEN -- s_sendTC
						-- Send TimeCode.
						v.out_data := r.parity;
						v.bitshift(12 DOWNTO 5) := r.pend_time;
						v.bitshift(4 DOWNTO 0) := "01111";
						v.bitcnt := to_unsigned(13, v.bitcnt'length);
						v.parity := '0';
						v.pend_tick := '0';
					ELSIF (r.allow_fct = '1') AND (s_sendFCT = '1') THEN -- vorher: state = S_FCT
						-- Send FCT.
						v.out_data := r.parity;
						v.bitshift(2 DOWNTO 0) := "001";
						v.bitcnt := to_unsigned(3, v.bitcnt'length);
						v.parity := '1';
						v.sent_fct := '1';
					ELSIF (r.allow_char = '1') AND (s_sendData = '1') THEN -- vorher: state = S_Data
						-- Send N-Char.
						v.bitshift(0) := s_txflag;
						v.parity := s_txflag;
						IF s_txflag = '0' THEN
							-- data byte
							v.out_data := NOT r.parity;
							v.bitshift(8 DOWNTO 1) := s_txdata;
							v.bitcnt := to_unsigned(9, v.bitcnt'length);
						ELSE
							-- EOP or EEP
							v.out_data := r.parity;
							v.bitshift(1) := s_txdata(0);
							v.bitshift(2) := NOT s_txdata(0);
							v.bitcnt := to_unsigned(3, v.bitcnt'length);
						END IF;
					ELSE
						-- Send null.
						v.out_data := r.parity;
						v.bitshift(6 DOWNTO 0) := "0010111";
						v.bitcnt := to_unsigned(7, v.bitcnt'length);
						v.parity := '0';
						v.sent_null := '1';
					END IF;
				ELSE
					IF r.bitcnt = 1 THEN
						s_fin <= '1';
					END IF;

					-- Shift next bit to the output.
					v.out_data := r.bitshift(0);
					v.parity := r.parity XOR r.bitshift(0);
					v.bitshift(r.bitshift'high - 1 DOWNTO 0) := r.bitshift(r.bitshift'high DOWNTO 1);
					v.bitcnt := r.bitcnt - 1;
				END IF;

				-- Data-Strobe encoding.
				v.out_strobe := NOT (r.out_strobe XOR r.out_data XOR v.out_data);
			END IF;

			-- Store requests for time tick transmission.
			IF tick_out = '1' THEN
				v.pend_tick := '1';
				v.pend_time := time_out;
			END IF;

		END IF;
		-- Synchronous reset
		IF rst = '1' THEN
			v := regs_reset;
		END IF;

		-- Drive outputs.

		-- Update registers.
		rin <= v;
	END PROCESS;

	-- Synchronous process
	PROCESS (clk) IS
	BEGIN
		IF rising_edge(clk) THEN
			r <= rin;

			-- Drive outputs.
			spw_di <= r.out_data;
			spw_si <= r.out_strobe;
		END IF;
	END PROCESS;

	-- Controlled reset for initialization.
	stimuli : PROCESS
	BEGIN
		WAIT FOR 1 us;
		rst <= '0';
		WAIT;
	END PROCESS;

	-- Combinatorial process that uses a debug port (s_fin)
	-- to select next element to be sent. Also controls 
	-- sending of data packets.
	PROCESS (s_fin)
		VARIABLE cnt : INTEGER RANGE 0 TO 20 := 0;
	BEGIN
		IF rising_edge(s_fin) THEN
			CASE state IS
				WHEN S_Idle =>
					s_sendFCT <= '0';
					s_sendData <= '0';

				WHEN S_FCT =>
					s_sendFCT <= '1';
					s_sendData <= '0';

				WHEN S_Data =>
					CASE pstate IS
						WHEN S_Address =>
							-- Init
							s_sendFCT <= '0';
							s_sendData <= '1';

							s_txflag <= '0';
							s_txdata <= "01000010"; -- TODO: Change destination port address here!
							pstate <= S_Cargo;

						WHEN S_Cargo =>
							s_sendFCT <= '0';
							s_sendData <= '1';

							s_txflag <= '0';
							s_txdata <= "11111111"; -- TODO: Change cargo here!
							pstate <= S_EOP;

						WHEN S_EOP =>
							s_sendFCT <= '0';
							s_sendData <= '1';

							s_txflag <= '1';
							s_txdata <= "00000000"; -- will translated into EOP
							pstate <= S_Null;

						WHEN S_Null =>
							-- send nulls
							s_sendFCT <= '0';
							s_sendData <= '0';

							-- Repeats sending of same packet.
							IF cnt = 20 THEN
								cnt := 0;
								pstate <= S_Address;
							ELSE
								cnt := cnt + 1;
							END IF;

					END CASE;

				WHEN S_Nothing => NULL;
					-- send nothing
			END CASE;
		END IF;
	END PROCESS;

	-- Controls connection and maintenance to port.
	Connection : PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			IF started = '1' THEN
				tbstate <= S_Started;
			END IF;

			IF connecting = '1' THEN
				tbstate <= S_Connecting;
			END IF;

			IF running = '1' THEN
				tbstate <= S_Running;
			END IF;

			-- Im Falle von Reset oder von Fehlern zurücksetzen und erneut verbinden.
			IF rst = '1' OR errdisc = '1' OR errpar = '1' OR erresc = '1' OR errcred = '1' THEN
				tbstate <= S_Rst;
			END IF;
		END IF;
	END PROCESS;

	-- State of port.
	portFSM : PROCESS (clk, s_fin)
	BEGIN
		IF rising_edge(clk) THEN
			CASE tbstate IS
				WHEN S_Rst =>
					-- Send nulls
					state <= S_Idle;

				WHEN S_Started =>
					-- Send nulls
					state <= S_Idle;

				WHEN S_Connecting =>
					-- Send FCTs
					state <= S_FCT;

				WHEN S_Running =>
					-- Send data packets.
					state <= S_Data;
			END CASE;
		END IF;
	END PROCESS;
	clocking : PROCESS
	BEGIN
		clk <= '0', '1' AFTER clock_period / 2;
		WAIT FOR clock_period;
	END PROCESS;
END spwrouterport_tb_arch;