----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 03.09.2021 17:54
-- Design Name: SpaceWire Router Testbench
-- Module Name: spwroutertest
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

ENTITY routertest IS
	GENERIC (
		numports : INTEGER RANGE 0 TO 31;
		-- System clock frequency in Hz.
		-- This must be set to the frequency of "clk". It is used to setup
		-- counters for reset timing, disconnect timeout and to transmit
		-- at 10 Mbit/s during the link handshake.
		sysfreq : real;

		-- Transmit clock frequency in Hz (only if tximpl = impl_fast).
		-- This must be set to the frequency of "txclk". It is used to
		-- transmit at 10 Mbit/s during the link handshake.
		txclkfreq : real := 0.0;

		-- Selection of a receiver front-end implementation.
		rximpl : spw_implementation_type_rec;

		-- Maximum number of bits received per system clock
		-- (must be 1 in case of impl_generic).
		rxchunk : INTEGER RANGE 1 TO 4 := 1;

		-- Width of shift registers in clock recovery front-end; added: SL
		WIDTH : INTEGER RANGE 1 TO 3 := 2;

		-- Selection of a transmitter implementation.
		tximpl : spw_implementation_type_xmit;

		-- Size of the receive FIFO as the 2-logarithm of the number of bytes.
		-- Must be at least 6 (64 bytes).
		rxfifosize_bits : INTEGER RANGE 6 TO 14 := 11;

		-- Size of the transmit FIFO as the 2-logarithm of the number of bytes.
		txfifosize_bits : INTEGER RANGE 2 TO 14 := 11
	);
	PORT (
		-- System clock.
		clk : IN STD_LOGIC;

		-- Receiver sample clock (only for impl_fast)
		rxclk : IN STD_LOGIC;

		-- Transmit clock (only for impl_fast)
		txclk : IN STD_LOGIC;

		-- Synchronous reset (active-high).
		rst : IN STD_LOGIC;

		-- Enables automatic link start on receipt of a NULL character.
		autostart : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- Enables link start once the Ready state is reached.
		-- Without autostart or linkstart, the link remains in state Ready.
		linkstart : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- Do not start link (overrides linkstart and autostart) and/or
		-- disconnect a running link.
		linkdis : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- Scaling factor minus 1, used to scale the transmit base clock into
		-- the transmission bit rate. The system clock (for impl_generic) or
		-- the txclk (for impl_fast) is divided by (unsigned(txdivcnt) + 1).
		-- Changing this signal will immediately change the transmission rate.
		-- During link setup, the transmission rate is always 10 Mbit/s.
		txdivcnt : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

		-- High for one clock cycle to request transmission of a TimeCode.
		-- The request is registered inside the entity until it can be processed.
		tick_in : IN STD_LOGIC_VECTOR(numports DOWNTO 1);

		-- Control bits of the TimeCode to be sent. Must be valid while tick_in is high.
		ctrl_in : IN array_t(numports DOWNTO 1)(1 DOWNTO 0);

		-- Counter value of the TimeCode to be sent. Must be valid while tick_in is high.
		time_in : IN array_t(numports DOWNTO 1)(5 DOWNTO 0);

		-- Pulled high by the application to write an N-Char to the transmit
		-- queue. If "txwrite" and "txrdy" are both high on the rising edge
		-- of "clk", a character is added to the transmit queue.
		-- This signal has no effect if "txrdy" is low.
		txwrite : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- Control flag to be sent with the next N_Char.
		-- Must be valid while txwrite is high.
		txflag : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- Byte to be sent, or "00000000" for EOP or "00000001" for EEP.
		-- Must be valid while txwrite is high.
		txdata : IN array_t(numports DOWNTO 0)(7 DOWNTO 0);

		-- High if the entity is ready to accept an N-Char for transmission.
		txrdy : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- High if the transmission queue is at least half full.
		txhalff : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- High for one clock cycle if a TimeCode was just received.
		tick_out : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- Control bits of the last received TimeCode.
		ctrl_out : OUT array_t(numports DOWNTO 1)(1 DOWNTO 0);

		-- Counter value of the last received TimeCode.
		time_out : OUT array_t(numports DOWNTO 1)(5 DOWNTO 0);

		-- High if "rxflag" and "rxdata" contain valid data.
		-- This signal is high unless the receive FIFO is empty.
		rxvalid : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- High if the receive FIFO is at least half full.
		rxhalff : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- High if the received character is EOP or EEP; low if the received
		-- character is a data byte. Valid if "rxvalid" is high.
		rxflag : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- Received byte, or "00000000" for EOP or "00000001" for EEP.
		-- Valid if "rxvalid" is high.
		rxdata : OUT array_t(numports DOWNTO 0)(7 DOWNTO 0);

		-- Pulled high by the application to accept a received character.
		-- If "rxvalid" and "rxread" are both high on the rising edge of "clk",
		-- a character is removed from the receive FIFO and "rxvalid", "rxflag"
		-- and "rxdata" are updated.
		-- This signal has no effect if "rxvalid" is low.
		rxread : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- High if the link state machine is currently in the Started state.
		pstarted : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
		rstarted : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- High if the link state machine is currently in the Connecting state.
		pconnecting : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
		rconnecting : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- High if the link state machine is currently in the Run state, indicating
		-- that the link is fully operational. If none of started, connecting or running
		-- is high, the link is in an initial state and the transmitter is not yet enabled.
		prunning : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
		rrunning : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- Disconnect detected in state Run. Triggers a reset and reconnect of the link.
		-- This indication is auto-clearing.
		perrdisc : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
		rerrdisc : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- Parity error detected in state Run. Triggers a reset and reconnect of the link.
		-- This indication is auto-clearing.
		perrpar : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
		rerrpar : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- Invalid escape sequence detected in state Run. Triggers a reset and reconnect of
		-- the link. This indication is auto-clearing.
		perresc : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
		rerresc : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- Credit error detected. Triggers a reset and reconnect of the link.
		-- This indication is auto-clearing.
		perrcred : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
		rerrcred : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);


		-- debug ports ON
		gotData: out std_logic_vector(numports downto 0);
		sentData: out std_logic_vector(numports downto 0);
		--fsmstate: out fsmarr(numports downto 0);
		--debugdataout : out array_t(numports downto 0)(8 downto 0);
		--dreadyIn : out std_logic_vector(numports downto 0);
		--drequestIn: out std_logic_vector(numports downto 0);
		--ddataIn: out array_t(numports downto 0)(8 downto 0);
		--dstrobeIn: out std_logic_vector(numports downto 0);
		--dreadyOut: out std_logic_vector(numports downto 0);
		--drequestOut: out std_logic_vector(numports downto 0);
		--ddataOut : out array_t(numports downto 0)(8 downto 0);
		--dstrobeOut: out std_logic_vector(numports downto 0);
		--dgranted: out std_logic_vector(numports downto 0);
		--dSwitchPortNumber: out array_t(numports downto 0)(numports downto 0); -- Debugport
		--dSelectDestinationPort: out array_t(numports downto 0)(numports downto 0); -- Debugport
		--droutingSwitch: out array_t(numports downto 0)(numports downto 0); -- Debugport
		--dsourcePortOut: out array_t(numports downto 0)(1 downto 0); -- Debugport
		--ddestinationPort: out array_t(numports downto 0)(7 downto 0); -- Debugport
		-- debug ports OFF


		-- Data In signal from SpaceWire bus.
		spw_d_r2p : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- Strobe In signal from SpaceWire bus.
		--spw_s_r2p : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- Data Out signal to SpaceWire bus.
		spw_d_p2r : OUT STD_LOGIC_VECTOR(numports DOWNTO 0)

		-- Strobe Out signal to SpaceWire bus.
		--spw_s_p2r : OUT STD_LOGIC_VECTOR(numports DOWNTO 0)
	);
END routertest;

ARCHITECTURE routertest_arch OF routertest IS
	-- Kommt vom Router
	SIGNAL s_spw_di : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL s_spw_si : STD_LOGIC_VECTOR(numports DOWNTO 0);

	-- Geht zum Router
	SIGNAL s_spw_do : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL s_spw_so : STD_LOGIC_VECTOR(numports DOWNTO 0);

	-- Router Signale
	SIGNAL s_rstarted : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL s_rconnecting : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL s_rrunning : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL s_rerrdisc : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL s_rerrpar : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL s_rerresc : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL s_rerrcred : STD_LOGIC_VECTOR(numports DOWNTO 0);

	-- Port Signale
	SIGNAL s_pstarted : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL s_pconnecting : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL s_prunning : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL s_perrdisc : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL s_perrpar : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL s_perresc : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL s_perrcred : STD_LOGIC_VECTOR(numports DOWNTO 0);


	-- Debug
	--signal s_fsmstate: fsmarr(numports downto 0);
	--signal s_dreadyOut: std_logic_vector(numports downto 0);
	--signal s_drequestOut: std_logic_vector(numports downto 0);
	--signal s_ddataOut: array_t(numports downto 0)(8 downto 0);
	--signal s_dstrobeOut: std_logic_vector(numports downto 0);
	--signal s_granted: std_logic_vector(numports downto 0);
BEGIN
	-- Drive outputs.
	-- Signals from router to ports. (Ist glaub ich nur für debugging)
	spw_d_r2p <= s_spw_di;
	--spw_s_r2p <= s_spw_si;
	-- Signals from ports to router.
	spw_d_p2r <= s_spw_do;
	--spw_s_p2r <= s_spw_so;

	-- Status/errors for router and ports.
	rstarted <= s_rstarted;
	pstarted <= s_pstarted;
	rconnecting <= s_rconnecting;
	pconnecting <= s_pconnecting;
	rrunning <= s_rrunning;
	prunning <= s_prunning;
	rerrdisc <= s_rerrdisc;
	perrdisc <= s_perrdisc;
	rerrpar <= s_rerrpar;
	perrpar <= s_perrpar;
	rerresc <= s_rerresc;
	perresc <= s_perresc;
	rerrcred <= s_rerrcred;
	perrcred <= s_perrcred;

	-- Debug
--	fsmstate <= s_fsmstate;
--	dreadyOut <= s_dreadyOut;
--	drequestOut <= s_drequestOut;
--	ddataOut <= s_ddataOut;
--	dstrobeOut <= s_dstrobeOut;
--	dgranted <= s_granted;

	-- Port 0
	ExternPort0 : spwstream
	GENERIC MAP(
		sysfreq => sysfreq,
		txclkfreq => txclkfreq,
		rximpl => rximpl,
		rxchunk => rxchunk,
		WIDTH => WIDTH,
		tximpl => tximpl,
		rxfifosize_bits => rxfifosize_bits,
		txfifosize_bits => txfifosize_bits
	)
	PORT MAP(
		clk => clk,
		rxclk => rxclk,
		txclk => txclk,
		rst => rst,
		autostart => autostart(0),
		linkstart => linkstart(0),
		linkdis => linkdis(0),
		txdivcnt => txdivcnt,
		tick_in => '0',
		ctrl_in => (OTHERS => '0'),
		time_in => (OTHERS => '0'),
		txwrite => txwrite(0),
		txflag => txflag(0),
		txdata => txdata(0),
		txrdy => txrdy(0),
		txhalff => txhalff(0),
		tick_out => OPEN,
		ctrl_out => OPEN,
		time_out => OPEN,
		rxvalid => rxvalid(0),
		rxhalff => rxhalff(0),
		rxflag => rxflag(0),
		rxdata => rxdata(0),
		rxread => rxread(0),
		started => s_pstarted(0),
		connecting => s_pconnecting(0),
		running => s_prunning(0),
		errdisc => s_perrdisc(0),
		errpar => s_perrpar(0),
		erresc => s_perresc(0),
		errcred => s_perrcred(0),
		spw_di => s_spw_di(0), -- kommt vom router
		spw_si => s_spw_si(0), -- kommt vom router
		spw_do => s_spw_do(0), -- geht zum router
		spw_so => s_spw_so(0) -- geht zum router
	);

	-- Port 1 to numports
	ExternPortX : FOR i IN 1 TO numports GENERATE
		ePortX : spwstream
		GENERIC MAP(
			sysfreq => sysfreq,
			txclkfreq => txclkfreq,
			rximpl => rximpl,
			rxchunk => rxchunk,
			tximpl => tximpl,
			rxfifosize_bits => rxfifosize_bits,
			txfifosize_bits => txfifosize_bits,
			WIDTH => WIDTH
		)
		PORT MAP(
			clk => clk,
			rxclk => rxclk,
			txclk => txclk,
			rst => rst,
			autostart => autostart(i),
			linkstart => linkstart(i),
			linkdis => linkdis(i),
			txdivcnt => txdivcnt,
			tick_in => tick_in(i),
			ctrl_in => ctrl_in(i),
			time_in => time_in(i),
			txwrite => txwrite(i),
			txflag => txflag(i),
			txdata => txdata(i),
			txrdy => txrdy(i),
			txhalff => txhalff(i),
			tick_out => tick_out(i),
			ctrl_out => ctrl_out(i),
			time_out => time_out(i),
			rxvalid => rxvalid(i),
			rxhalff => rxhalff(i),
			rxflag => rxflag(i),
			rxdata => rxdata(i),
			rxread => rxread(i),
			started => s_pstarted(i),
			connecting => s_pconnecting(i),
			running => s_prunning(i),
			errdisc => s_perrdisc(i),
			errpar => s_perrpar(i),
			erresc => s_perresc(i),
			errcred => s_perrcred(i),
			spw_di => s_spw_di(i), -- Kommt vom Router
			spw_si => s_spw_si(i),
			spw_do => s_spw_do(i), -- Geht zum Router
			spw_so => s_spw_so(i)
		);
	END GENERATE ExternPortX;

	-- SpaceWire router.
	Router : spwrouter
	GENERIC MAP(
		numports => numports,
		sysfreq => sysfreq,
		txclkfreq => txclkfreq,
		rx_impl => (OTHERS => rximpl),
		tx_impl => (OTHERS => tximpl)
	)
	PORT MAP(
		clk => clk,
		rxclk => rxclk,
		txclk => txclk,
		rst => rst,
		started => s_rstarted,
		connecting => s_rconnecting,
		running => s_rrunning,
		errdisc => s_rerrdisc,
		errpar => s_rerrpar,
		erresc => s_rerresc,
		errcred => s_rerrcred,
		gotData => gotData, -- Debugport
		sentData => sentData, -- Debugport
--		fsmstate => s_fsmstate, -- Debugport
--		debugdataout => debugdataout, -- Debugport
--		dreadyIn => dreadyIn, -- Debugport
--		drequestIn => drequestIn, -- Debugport
--		ddataIn => ddataIn, -- Debugport
--		dstrobeIn => dstrobeIn, -- Debugport
--		dreadyOut => s_dreadyOut, -- Debugport
--		drequestOut => s_drequestOut, -- Debugport
--		ddataOut => s_ddataOut, -- Debugport
--		dstrobeOut => s_dstrobeOut, -- Debugport
--		dgranted => s_granted, -- Debugport
--		dSwitchPortNumber => dSwitchPortNumber, -- Debugport
--		dSelectDestinationPort => dSelectDestinationPort, -- Debugport
--		droutingSwitch => droutingSwitch, -- Debugport
--		dsourcePortOut => dsourcePortOut, -- Debugport
--		ddestinationPort => ddestinationPort, -- Debugport
		spw_di => s_spw_do,
		spw_si => s_spw_so,
		spw_do => s_spw_di,
		spw_so => s_spw_si
	);
END routertest_arch;