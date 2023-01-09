----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 04.09.2021 21:35
-- Design Name: SpaceWire Router Testbench
-- Module Name: routertest_tb
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
	-- TODO: Set router settings. (Predefined simulation procedures requires three ports (port0 is unused)!)
	CONSTANT numports : integer range 1 to 32 := 2;
	CONSTANT clock_period : TIME := 100 ns; -- 10 MHz
	CONSTANT sysfreq : real := 10.0e6;
	CONSTANT txclkfreq : real := 10.0e6;

	-- Fast front-ends are necessary to transmit and receive on same frequence.
	CONSTANT rximpl : spw_implementation_type_rec := impl_fast;
	CONSTANT tximpl : spw_implementation_type_xmit := impl_fast;

	CONSTANT rxchunk : INTEGER RANGE 1 TO 4 := 1;

	CONSTANT WIDTH : INTEGER RANGE 1 TO 3 := 2; -- not used

	CONSTANT rxfifosize_bits : INTEGER RANGE 6 TO 14 := 11;
	CONSTANT txfifosize_bits : INTEGER RANGE 2 TO 14 := 11;

	COMPONENT routertest
		GENERIC (
			numports : integer range 1 to 32;
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
			autostart : IN STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			linkstart : IN STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			linkdis : IN STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			txdivcnt : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			tick_in : IN STD_LOGIC_VECTOR(numports-1 DOWNTO 1);
			ctrl_in : IN array_t(numports-1 DOWNTO 1)(1 DOWNTO 0);
			time_in : IN array_t(numports-1 DOWNTO 1)(5 DOWNTO 0);
			txwrite : IN STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			txflag : IN STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			txdata : IN array_t(numports-1 DOWNTO 0)(7 DOWNTO 0);
			txrdy : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			txhalff : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			tick_out : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			ctrl_out : OUT array_t(numports-1 DOWNTO 1)(1 DOWNTO 0);
			time_out : OUT array_t(numports-1 DOWNTO 1)(5 DOWNTO 0);
			rxvalid : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			rxhalff : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			rxflag : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			rxdata : OUT array_t(numports-1 DOWNTO 0)(7 DOWNTO 0);
			rxread : IN STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			pstarted : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			rstarted : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			pconnecting : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			rconnecting : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			prunning : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			rrunning : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			perrdisc : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			rerrdisc : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			perrpar : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			rerrpar : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			perresc : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			rerresc : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			perrcred : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			rerrcred : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
			spw_d_r2p : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0); -- Data signal from router to external ports
			--spw_s_r2p : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0); -- Strobe signal from router to external ports
			spw_d_p2r : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0) -- Data signal from external ports to router
			--spw_s_p2r : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0) -- Strobe signal from external ports to router
		);
	END COMPONENT;

	SIGNAL clk : STD_LOGIC;
	SIGNAL rst : STD_LOGIC := '1';
	SIGNAL autostart : STD_LOGIC_VECTOR(numports-1 DOWNTO 0) := (OTHERS => '1');
	SIGNAL linkstart : STD_LOGIC_VECTOR(numports-1 DOWNTO 0) := (OTHERS => '1');
	SIGNAL linkdis : STD_LOGIC_VECTOR(numports-1 DOWNTO 0) := (0 => '1', OTHERS => '0'); -- deactivate internal port (overrides linkstart/autostart)
	SIGNAL txdivcnt : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000001";
	SIGNAL tick_in : STD_LOGIC_VECTOR(numports-1 DOWNTO 1) := (OTHERS => '0');
	SIGNAL ctrl_in : array_t(numports-1 DOWNTO 1)(1 DOWNTO 0) := (OTHERS => (OTHERS => '0'));
	SIGNAL time_in : array_t(numports-1 DOWNTO 1)(5 DOWNTO 0) := (OTHERS => (OTHERS => '0'));
	SIGNAL txwrite : STD_LOGIC_VECTOR(numports-1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL txflag : STD_LOGIC_VECTOR(numports-1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL txdata : array_t(numports-1 DOWNTO 0)(7 DOWNTO 0) := (OTHERS => (OTHERS => '0'));
	SIGNAL txrdy : STD_LOGIC_VECTOR(numports-1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL txhalff : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
	SIGNAL tick_out : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
	SIGNAL ctrl_out : array_t(numports-1 DOWNTO 1)(1 DOWNTO 0);
	SIGNAL time_out : array_t(numports-1 DOWNTO 1)(5 DOWNTO 0);
	SIGNAL rxvalid : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
	SIGNAL rxhalff : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
	SIGNAL rxflag : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
	SIGNAL rxdata : array_t(numports-1 DOWNTO 0)(7 DOWNTO 0);
	SIGNAL rxread : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
	SIGNAL pstarted : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
	SIGNAL rstarted : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
	SIGNAL pconnecting : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
	SIGNAL rconnecting : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
	SIGNAL prunning : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
	SIGNAL rrunning : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
	SIGNAL perrdisc : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
	SIGNAL rerrdisc : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
	SIGNAL perrpar : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
	SIGNAL rerrpar : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
	SIGNAL perresc : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
	SIGNAL rerresc : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
	SIGNAL perrcred : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
	SIGNAL rerrcred : STD_LOGIC_VECTOR(numports-1 DOWNTO 0);
	SIGNAL spw_d_r2p : STD_LOGIC_VECTOR(numports-1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL spw_s_r2p : STD_LOGIC_VECTOR(numports-1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL spw_d_p2r : STD_LOGIC_VECTOR(numports-1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL spw_s_p2r : STD_LOGIC_VECTOR(numports-1 DOWNTO 0) := (OTHERS => '0');

	TYPE packetstates IS (S_Address, S_Cargo, S_EOP, S_Null);
	SIGNAL pstate : packetstates := S_Address;

	-- Controls simulation event defined in sim-process.
	SIGNAL proc : INTEGER RANGE 0 TO 10 := 0;
	SIGNAL s_fin : STD_LOGIC;

BEGIN
	-- Design under test.
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
		spw_d_r2p => spw_d_r2p, -- Data signals from router to extern ports
		--spw_s_r2p => spw_s_r2p, -- Strobe signals from router to extern ports
		spw_d_p2r => spw_d_p2r -- Data signals from extern ports to router
		--spw_s_p2r => spw_s_p2r -- Strobe signals from extern ports to router
	);

	-- Performs initialize reset.
	reset : PROCESS
	BEGIN
		WAIT FOR clock_period;
		rst <= '0';
		WAIT;
	END PROCESS;

	-- Simulation part 1.
	control : PROCESS
	BEGIN
		WAIT FOR clock_period;

		-- TODO: Put simulation instructions here...

		proc <= 1; -- sending one packet (physical addressing)
		WAIT UNTIL s_fin = '1';

		proc <= 0; -- resets pstate and s_fin

		WAIT FOR 10 us;

		proc <= 2; -- sending two packets (physical addressing)
		WAIT UNTIL s_fin = '1';

		proc <= 0; -- resets pstate and s_fin

		WAIT FOR 10 us;

		proc <= 3; -- sending one packet (logical addressing)
		WAIT UNTIL s_fin = '1';

		proc <= 0;

		WAIT;
	END PROCESS;

	-- Simulation part 2.
	sim : PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			-- Controls what should be simulated next. Further events can easily
			-- be implemented below (above 'what others'-case!)
			CASE proc IS
				WHEN 0 => pstate <= S_Address;
					s_fin <= '0';

				WHEN 1 =>
					-- Sends a single packet on port1 to router, it should leave router on port2.

					IF rrunning(1) = '1' AND prunning(1) = '1' THEN
						CASE pstate IS
							WHEN S_Address =>
								txdata(1) <= "00000010"; -- 2 (destination port)
								txflag(1) <= '0';
								txwrite(1) <= '1';

								pstate <= S_Cargo;

							WHEN S_Cargo =>
								txdata(1) <= "10010010"; -- easier to locate in timing diagram
								txflag(1) <= '0';
								txwrite(1) <= '1';

								pstate <= S_EOP;

							WHEN S_EOP =>
								txdata(1) <= "00000000"; -- cargo=0x00 and txflag='1' corresponds to an EOP
								txflag(1) <= '1';
								txwrite(1) <= '1';

								pstate <= S_Null;

							WHEN S_Null =>
								txdata(1) <= (OTHERS => '0');
								txflag(1) <= '0';
								txwrite(1) <= '0'; -- Withdraw permission to send; sends then nulls automatically

								s_fin <= '1';

						END CASE;
					END IF;

				WHEN 2 =>
					-- Sends two packets from to ports that should both leave the other port.

					IF (rrunning(1) = '1' AND prunning(1) = '1') AND (rrunning(2) = '1' AND prunning(2) = '1') THEN
						CASE pstate IS
							WHEN S_Address =>
								-- Packet 1
								txdata(1) <= "00000010"; -- 2 (destination port)
								txflag(1) <= '0';
								txwrite(1) <= '1';

								-- Packet 2
								txdata(2) <= "00000001"; -- 1 (destination port)
								txflag(2) <= '0';
								txwrite(2) <= '1';

								pstate <= S_Cargo;

							WHEN S_Cargo =>
								-- Packet 1
								txdata(1) <= "10010010";
								txflag(1) <= '0';
								txwrite(1) <= '1';

								-- Packet 2
								txdata(2) <= "11111111";
								txflag(2) <= '0';
								txwrite(2) <= '1';

								pstate <= S_EOP;

							WHEN S_EOP =>
								-- Packet 1
								txdata(1) <= "00000000";
								txflag(1) <= '1';
								txwrite(1) <= '1';

								-- Packet 2
								txdata(2) <= "00000000";
								txflag(2) <= '1';
								txwrite(2) <= '1';

								pstate <= S_Null;

							WHEN S_Null =>
								-- Port 1
								txdata(1) <= (OTHERS => '0');
								txflag(1) <= '0';
								txwrite(1) <= '0';

								-- Port 2
								txdata(2) <= (OTHERS => '0');
								txflag(2) <= '0';
								txwrite(2) <= '0';

								s_fin <= '1';

						END CASE;
					END IF;

				WHEN 3 =>
					-- Sends one packet to logical port.
					IF rrunning(1) = '1' AND prunning(1) = '1' THEN
						CASE pstate IS
							WHEN S_Address =>
								txdata(1) <= "01010101"; -- 85
								txflag(1) <= '0';
								txwrite(1) <= '1';

								pstate <= S_Cargo;

							WHEN S_Cargo =>
								txdata(1) <= "01010101";
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

								s_fin <= '1';
						END CASE;
					END IF;

				WHEN OTHERS => NULL;

			END CASE;
		END IF;
	END PROCESS;

	-- Creates clock.
	clocking : PROCESS
	BEGIN
		clk <= '0', '1' AFTER clock_period / 2;
		WAIT FOR clock_period;
	END PROCESS;
END routertest_tb_arch;