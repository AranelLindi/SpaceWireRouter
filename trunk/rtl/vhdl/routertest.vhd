----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 23.08.2021 15:52
-- Design Name: SpaceWire Routertest
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

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.spwpkg.ALL;
USE work.spwrouterpkg.ALL;

ENTITY routertest IS
	GENERIC (
		-- Number of SpaceWire ports.
		numports : INTEGER RANGE 0 TO 31;

		-- System clock frequency in Hz.
		sysfreq : real;

		-- txclk frequency in Hz (if tximpl = impl_fast)
		txclkfreq : real;

		-- 2-log of division factor from system clock freq to timecode freq.
		tickdiv : INTEGER RANGE 12 TO 24 := 20;

		-- Selection of receiver front-end implementation.
		rx_impl : IN rximpl_array(numports DOWNTO 0);

		-- Selection of transmitter implementation.
		tx_impl : IN tximpl_array(numports DOWNTO 0)
	);
	PORT (
		-- System clock.
		clk : IN STD_LOGIC;

		-- Router reset signal.
		rst : IN STD_LOGIC;

        -- Sends nulls only.
        stnull: in std_logic_vector(numports downto 0);
        
        -- Sends FCTs and nulls only.
        stfct : in std_logic_vector(numports downto 0);
        
        -- Enable transmitter.
        txen: in std_logic_vector(numports downto 0);
        
        -- Request FCT transmission.
        fct_in : in std_logic_vector(numports downto 0);
        
        -- Transmission of n-char.
        txwrite: in std_logic_vector(numports downto 0);
        
        -- txdata: in std_logic_vector(numports downto 0); -- wird nicht benötigt! Als Daten werden immer aus LFSR entnommen!
        
        -- Data control flag.
        txflag: in std_logic_vector(numports downto 0);
        
        -- Requests transmission of timecode.
        tick_in : in std_logic_vector(numports downto 0);
        
        -- TimeCode control flag.
        ctrl_in : in std_logic_vector(1 downto 0); -- gilt für alle Ports gleich!
        
        -- TimeCode counter value.
        time_in : in std_logic_vector(5 downto 0);
        
		-- Corresponding bit is High if the port is in started state.
		started : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- Corresponding bit is High if the port is in connecting state.
		connecting : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- Corresponding bit is High if the port is in running state.
		running : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- High if the corresponding port has a disconnect error.
		errpar : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- High if the corresponding port detected an invalid escape sequence.
		erresc : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- High if the corresponding port detected a credit error.
		errcred : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- Data In signals from SpaceWire bus.
		spw_di : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- Strobe In signals from SpaceWire bus.
		spw_si : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- Data Out signals from SpaceWire bus.
		spw_do : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

		-- Strobe Out signals from SpaceWire bus.
		spw_so : OUT STD_LOGIC_VECTOR(numports DOWNTO 0)
	);
END routertest;

ARCHITECTURE routertest_arch OF routertest IS
	-- Update 16-bit maximum length LFSR by 8 steps
	FUNCTION lfsr16(x : IN STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
		VARIABLE y : STD_LOGIC_VECTOR(15 DOWNTO 0);
	BEGIN
		-- poly = x^16 + x^14 + x^13 + x^11 +1
		-- tap positions = x(0), x(2), x(3), x(5)
		y(7 DOWNTO 0) := x(15 DOWNTO 8);
		y(15 DOWNTO 8) := x(7 DOWNTO 0) XOR x(9 DOWNTO 2) XOR x(10 DOWNTO 3) XOR x(12 DOWNTO 5);
		RETURN y;
	END FUNCTION;

	TYPE txstate IS (S_Idle, S_Prepare, S_Data);
	SIGNAL state : txstate := S_Idle;

	-- Next port that should receive
	SIGNAL nextport : INTEGER RANGE 0 TO numports := 0;

	TYPE spw_xmit_in_type_array IS ARRAY (NATURAL RANGE <>) OF spw_xmit_in_type;
	SIGNAL xmit_arr : spw_xmit_in_type_array(0 TO numports);

	-- Intermediate signals, contain from transmitter produced data-strobe stream.
	signal s_spw_di : std_logic_vector(numports downto 0);
	signal s_spw_si : std_logic_vector(numports downto 0);
	
	signal s_started : std_logic_vector(numports downto 0);
	signal s_connecting: std_logic_vector(numports downto 0);
	signal s_running: std_logic_vector(numports downto 0);
	
	signal s_errdisc: std_logic_vector(numports downto 0);
	signal s_errpar : std_logic_vector(numports downto 0);
	signal s_erresc: std_logic_vector(numports downto 0);
	
	-- Start value for LFSR.
	signal seed : std_logic_vector(15 downto 0) := (0 => '1', others => '0');
BEGIN
	-- Router
	SpaceWireRouter : spwrouter
	GENERIC MAP(
		numports => numports,
		sysfreq => sysfreq,
		txclkfreq => txclkfreq,
		rx_impl => rx_impl,
		tx_impl => tx_impl
	)
	PORT MAP(
		clk => clk,
		rxclk => clk,
		txclk => clk,
		rst => rst,
		started => s_started,
		connecting => s_connecting,
		running => s_running,
		errdisc => s_errdisc,
		errpar => s_errpar,
		erresc => s_erresc,
		spw_di => s_spw_di,
		spw_si => s_spw_si,
		spw_do => spw_do,
		spw_so => spw_so
	);

	-- Transmitter
	Transmitter : FOR i IN 0 TO numports GENERATE
		tx : spwxmit
		PORT MAP(
			clk => clk,
			rst => rst,
			divcnt => (OTHERS => '0'),
			xmiti => xmit_arr(i),
			xmito => OPEN,
			spw_do => s_spw_di(i),
			spw_so => s_spw_di(i)
		);
	END GENERATE Transmitter; -- müsste in seiner jetzigen Form automatisch Nullen senden!


-- ERST MAL PROBIEREN UND AUSGEBLENDET LASSEN !
--    rec: for i in 0 to numports generate
--        xmit_arr(i).stnull <= stnull(i);
--        xmit_arr(i).stfct <= stfct(i);
--        xmit_arr(i).txen <= txen(i);
--        xmit_arr(i).fct_in <= fct_in(i);
--        xmit_arr(i).tick_in <= tick_in(i);
--        xmit_arr(i).ctrl_in <= ctrl_in;
--        xmit_arr(i).time_in <= time_in;
--        xmit_arr(i).txwrite <= txwrite(i);
--        xmit_arr(i).txflag <= txflag(i);
--        seed <= lfsr16(seed);
--        xmit_arr(i).txdata <= seed(15 downto 7);
--    end generate;


	-- Address each port in ascending order.
--	PROCESS (nextpacket)
--	BEGIN
--		IF rising_edge(nextpacket) THEN
--			IF nextport = numports THEN
--				nextport <= 0;
--			ELSE
--				nextport <= nextport + 1;
--			END IF;
--		END IF;
--	END PROCESS;
END routertest_arch;