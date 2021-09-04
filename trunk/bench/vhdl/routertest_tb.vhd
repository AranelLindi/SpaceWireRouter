----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 22.08.2021 23:28
-- Design Name: SpaceWire Router Testbench
-- Module Name: spwrouter_tb
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

ENTITY routertest_tb IS
END routertest_tb;

ARCHITECTURE routertest_tb_arch OF routertest_tb IS
	CONSTANT numports : INTEGER RANGE 0 TO 31 := 2;
	CONSTANT clock_period : TIME := 100 ns; -- 10 MHz
	CONSTANT sysfreq : real := 10.0e6;
	CONSTANT txclkfreq : real := 10.0e6;

	CONSTANT rximpl : spw_implementation_type_rec := impl_fast;
	CONSTANT tximpl : spw_implementation_type_xmit := impl_fast;

	CONSTANT rxchunk : INTEGER RANGE 1 TO 4 := 1;

	CONSTANT WIDTH : INTEGER RANGE 1 TO 3 := 2;

	CONSTANT rxfifosize_bits : INTEGER RANGE 6 TO 14 := 11;
	CONSTANT txfifosize_bits : INTEGER RANGE 2 TO 14 := 11;

	COMPONENT routertest
		GENERIC (
			numports : INTEGER RANGE 0 TO 31;
			sysfreq : real;
			txclkfreq : real := 0.0;
			rximpl : spw_implementation_type_rec;
			rxchunk : INTEGER RANGE 1 TO 4 := 1;
			WIDTH : INTEGER RANGE 1 TO 3 := 2;
			tximpl : spw_implementation_type_xmit := impl_generic;
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
			gotData: out std_logic_vector(numports downto 0); -- Debugport
			sentData: out std_logic_vector(numports downto 0); -- Debugport
			fsmstate: out fsmarr(numports downto 0); -- Debugport
			debugdataout: out array_t(numports downto 0)(8 downto 0); -- Debugport
			dreadyIn : out std_logic_vector(numports downto 0); -- Debugport
            drequestIn: out std_logic_vector(numports downto 0); -- Debugport
            ddataIn : out array_t(numports downto 0)(8 downto 0); -- Debugport
            dstrobeIn : out std_logic_vector(numports downto 0); -- Debugport
			dreadyOut: out std_logic_vector(numports downto 0); -- Debugport
			drequestOut: out std_logic_vector(numports downto 0); -- Debugport
			ddataOut: out array_t(numports downto 0)(8 downto 0); -- Debugport
			dstrobeOut: out std_logic_vector(numports downto 0); -- Debugport
			dgranted: out std_logic_vector(numports downto 0); -- Debugport
			dSwitchPortNumber: out array_t(numports downto 0)(numports downto 0); -- Debugport
            dSelectDestinationPort: out array_t(numports downto 0)(numports downto 0); -- Debugport
            droutingSwitch: out array_t(numports downto 0)(numports downto 0); -- Debugport
            dsourcePortOut: out array_t(numports downto 0)(1 downto 0); -- Debugport
            ddestinationPort: out array_t(numports downto 0)(7 downto 0); -- Debugport
			spw_d_r2p : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			spw_s_r2p : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			spw_d_p2r : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
			spw_s_p2r : OUT STD_LOGIC_VECTOR(numports DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL clk : STD_LOGIC;
	--SIGNAL rxclk : STD_LOGIC;
	--SIGNAL txclk : STD_LOGIC;
	SIGNAL rst : STD_LOGIC := '1';
	SIGNAL autostart : STD_LOGIC_VECTOR(numports DOWNTO 0) := (OTHERS => '1');
	SIGNAL linkstart : STD_LOGIC_VECTOR(numports DOWNTO 0) := (OTHERS => '1');
	SIGNAL linkdis : STD_LOGIC_VECTOR(numports DOWNTO 0) := (0 => '1', OTHERS => '0'); -- deactivate internal port (overrides linkstart/autostart)
	SIGNAL txdivcnt : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000001";
	SIGNAL tick_in : STD_LOGIC_VECTOR(numports DOWNTO 1) := (OTHERS => '0');
	SIGNAL ctrl_in : array_t(numports DOWNTO 1)(1 DOWNTO 0) := (OTHERS => (OTHERS => '0'));
	SIGNAL time_in : array_t(numports DOWNTO 1)(5 DOWNTO 0) := (OTHERS => (OTHERS => '0'));
	SIGNAL txwrite : STD_LOGIC_VECTOR(numports DOWNTO 0) := (OTHERS => '0');
	SIGNAL txflag : STD_LOGIC_VECTOR(numports DOWNTO 0) := (OTHERS => '0');
	SIGNAL txdata : array_t(numports DOWNTO 0)(7 DOWNTO 0) := (OTHERS => (OTHERS => '0'));
	SIGNAL txrdy : STD_LOGIC_VECTOR(numports DOWNTO 0) := (OTHERS => '0');
	SIGNAL txhalff : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL tick_out : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL ctrl_out : array_t(numports DOWNTO 1)(1 DOWNTO 0);
	SIGNAL time_out : array_t(numports DOWNTO 1)(5 DOWNTO 0);
	SIGNAL rxvalid : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL rxhalff : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL rxflag : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL rxdata : array_t(numports DOWNTO 0)(7 DOWNTO 0);
	SIGNAL rxread : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL pstarted : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL rstarted : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL pconnecting : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL rconnecting : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL prunning : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL rrunning : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL perrdisc : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL rerrdisc : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL perrpar : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL rerrpar : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL perresc : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL rerresc : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL perrcred : STD_LOGIC_VECTOR(numports DOWNTO 0);
	SIGNAL rerrcred : STD_LOGIC_VECTOR(numports DOWNTO 0);
	signal gotData : std_logic_vector(numports downto 0); -- Debugport
	signal sentData: std_logic_vector(numports downto 0); -- Debugport
	signal fsmstate: fsmarr(numports downto 0); -- Debugport
	signal debugdataout : array_t(numports downto 0)(8 downto 0); -- Debugport
	signal dreadyIn : std_logic_vector(numports downto 0); -- Debugport
	signal drequestIn: std_logic_vector(numports downto 0); -- Debugport
	signal ddataIn : array_t(numports downto 0)(8 downto 0); -- Debugport
	signal dstrobeIn : std_logic_vector(numports downto 0); -- Debugport
	signal dgranted: std_logic_vector(numports downto 0); -- Debugport
	signal dSwitchPortNumber: array_t(numports downto 0)(numports downto 0); -- Debugport
	signal dSelectDestinationPort: array_t(numports downto 0)(numports downto 0); -- Debugport
	signal droutingSwitch: array_t(numports downto 0)(numports downto 0); -- Debugport
	signal dsourcePortOut: array_t(numports downto 0)(1 downto 0); -- Debugport
	signal ddestinationPort: array_t(numports downto 0)(7 downto 0); -- Debugport
	SIGNAL spw_d_r2p : STD_LOGIC_VECTOR(numports DOWNTO 0) := (OTHERS => '0');
	SIGNAL spw_s_r2p : STD_LOGIC_VECTOR(numports DOWNTO 0) := (OTHERS => '0');
	SIGNAL spw_d_p2r : STD_LOGIC_VECTOR(numports DOWNTO 0) := (OTHERS => '0');
	SIGNAL spw_s_p2r : STD_LOGIC_VECTOR(numports DOWNTO 0) := (OTHERS => '0');

	TYPE packetstates IS (S_Address, S_Cargo, S_EOP, S_Null);
	SIGNAL pstate : packetstates := S_Address;

	-- Debug
	signal s_fsmstate: fsmarr(numports downto 0);
	signal s_dreadyOut: std_logic_vector(numports downto 0);
	signal s_drequestOut: std_logic_vector(numports downto 0);
	signal s_ddataOut: array_t(numports downto 0)(8 downto 0);
	signal s_dstrobeOut: std_logic_vector(numports downto 0);
	signal s_granted: std_logic_vector(numports downto 0);
BEGIN
	fsmstate <= s_fsmstate;


	-- Debug
	dgranted <= s_granted;


	spwroutertest : routertest
	GENERIC MAP(
		numports => numports,
		sysfreq => sysfreq,
		txclkfreq => txclkfreq,
		rximpl => rximpl,
		rxchunk => rxchunk,
		WIDTH => WIDTH,
		tximpl => tximpl,
		rxfifosize_bits => rxfifosize_bits,
		txfifosize_bits => rxfifosize_bits
	)
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
		ctrl_in => ctrl_in,
		time_in => time_in,
		txwrite => txwrite,
		txflag => txflag,
		txdata => txdata,
		txrdy => txrdy,
		txhalff => txhalff,
		tick_out => tick_out,
		ctrl_out => ctrl_out,
		time_out => time_out,
		rxvalid => rxvalid,
		rxhalff => rxhalff,
		rxflag => rxflag,
		rxdata => rxdata,
		rxread => rxread,
		pstarted => pstarted,
		rstarted => rstarted,
		pconnecting => pconnecting,
		rconnecting => rconnecting,
		prunning => prunning,
		rrunning => rrunning,
		perrdisc => perrdisc,
		rerrdisc => rerrdisc,
		perrpar => perrpar,
		rerrpar => rerrpar,
		perresc => perresc,
		rerresc => rerresc,
		perrcred => perrcred,
		rerrcred => rerrcred,
		gotData => gotData, -- Debugport
		sentData => sentData, -- Debugport
		debugdataout => debugdataout, -- Debugport
		dreadyIn => dreadyIn, -- Debugport
		drequestIn => drequestIn, -- Debugport
		ddataIn => ddataIn, -- Debugport
		dstrobeIn => dstrobeIn, -- Debugport
		dreadyOut => s_dreadyOut, -- Debugport
		drequestOut => s_drequestOut, -- Debugport
		ddataOut => s_ddataOut, -- Debugport
		dstrobeOut => s_dstrobeOut, -- Debugport
		fsmstate => s_fsmstate, -- Debugport
		dgranted => s_granted, -- Debugport
		dSwitchPortNumber => dSwitchPortNumber, -- Debugport
		dSelectDestinationPort => dSelectDestinationPort, -- Debugport
		droutingSwitch => droutingSwitch, -- Debugport
		dsourcePortOut => dsourcePortOut, -- Debugport
		ddestinationPort => ddestinationPort, -- Debugport
		spw_d_r2p => spw_d_r2p,
		spw_s_r2p => spw_s_r2p,
		spw_d_p2r => spw_d_p2r,
		spw_s_p2r => spw_s_p2r
	);

	stimulus : PROCESS
		VARIABLE sent : BOOLEAN := false;
	BEGIN
		-- Put initialisation code here
		WAIT FOR clock_period;
		rst <= '0';
		WAIT;
	END PROCESS;

	PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			IF rrunning(1) = '1' AND prunning(1) = '1' THEN
				CASE pstate IS
					WHEN S_Address =>
						txdata(1) <= "00000010"; -- 2
						txflag(1) <= '0';
						txwrite(1) <= '1';

						pstate <= S_Cargo;

					WHEN S_Cargo =>
						txdata(1) <= "00000000";
						txflag(1) <= '0';
						txwrite(1) <= '1';

						pstate <= S_EOP;

					WHEN S_EOP =>
						txdata(1) <= "00000000";
						txflag(1) <= '1';
						txwrite(1) <= '1';

						pstate <= S_Null;

					WHEN S_Null =>
						txdata(1) <= (OTHERS => '0');
						txflag(1) <= '0';
						txwrite(1) <= '0';

				END CASE;
			END IF;
		END IF;
	END PROCESS;
	clocking : PROCESS
	BEGIN
		--WHILE NOT stop_the_clock LOOP
		clk <= '0', '1' AFTER clock_period / 2;
		WAIT FOR clock_period;
		--END LOOP;
		--WAIT;
	END PROCESS;
END routertest_tb_arch;