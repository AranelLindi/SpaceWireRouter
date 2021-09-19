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

ENTITY routertest_top_multi_router IS
	PORT (
		-- System clock.
		clk : IN STD_LOGIC;

		-- Reset.
		rst : IN STD_LOGIC;

		-- Clear button.
		clear : IN STD_LOGIC;
		
		eop : in std_logic;

        selectport: in std_logic_vector(1 downto 0);
        
        selectdestport: in std_logic_vector(1 downto 0);

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

        pstarted : out std_logic;
        
        pconnecting : out std_logic;

		-- High if corresponding external port is in running mode.
		-- Low means that it is in an initializing, started or connecting state.
		prunning : OUT STD_LOGIC;

		-- High if corresponding router port has reported an error.
		rerror : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);

		-- High if corresponding external port has reported an error.
		perror : OUT STD_LOGIC;
		
		spw_di : in std_logic;
		
		spw_si : in std_logic;
		
		spw_do : out std_logic;
		
		spw_so : out std_logic

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
END routertest_top_multi_router;

ARCHITECTURE routertest_top_multi_router_arch OF routertest_top_multi_router IS
	TYPE bool_to_logic_type IS ARRAY(BOOLEAN) OF STD_ULOGIC;
	CONSTANT bool_to_logic : bool_to_logic_type := (false => '0', true => '1');

	-- Uart
	component uart_rx
	   generic (
	       clk_cycles_per_bit: integer
	       );
	   port (
	       clk: in std_logic;
	       rxstream : in std_logic;
	       rxvalid : out std_logic;
	       rxdata : out std_logic_vector(7 downto 0)
	   );
	end component;
	
	component uart_tx
	   generic (
	       clk_cycles_per_bit:integer
	   );
	   port (
	       clk: in std_logic;
	       txwrite : in std_logic;
	       txdata : in std_logic_vector(7 downto 0);
	       txactive : out std_logic;
	       txstream: out std_logic;
	       txdone: out std_logic
	   );
	end component;

	-- Uart receiver.
	--SIGNAL s_uart_rxstream : STD_LOGIC;
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
	SIGNAL s_spw_di : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL s_spw_si : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL s_spw_do : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL s_spw_so : STD_LOGIC_VECTOR(1 DOWNTO 0);

	-- Debug
	--SIGNAL s_dtxdata : array_t(2 DOWNTO 0)(8 DOWNTO 0);
	--SIGNAL s_debugsig : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL s_selectport : INTEGER RANGE 0 TO 2; --std_logic_vector(1 downto 0);
	SIGNAL s_selectdestport : INTEGER RANGE 0 TO 2; --std_logic_vector(1 downto 0);

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

	
	-- Von uart zu ext. Ports.
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
			s_txdata <= std_logic_vector(to_unsigned(s_selectdestport, 8));
			s_txflag <= '0';
		ELSIF rising_edge(clk) THEN
		    if eop = '1' then
		      -- Send EOPs.
		      s_txflag <= '1';
		      s_txdata <= "00000000";
		      s_txwrite <= '1';
		      rxstate <= S_Idle;
		    elsif eop = '0' then
                CASE rxstate IS
                    WHEN S_Idle =>
                        s_txwrite <= '0';
                        s_txdata <= s_uartrxdata;
                    
                        IF s_uartrxvalid = '1' THEN
                            selectport := s_selectport;
                            data := s_uartrxdata;
                                                    
                            if data = "11111111" then
                              s_txflag <= '1';
                              s_txdata <= "00000000";
                              rxstate <= S_EOP;
                            else
                              s_txflag <= '0';
                              s_txdata <= std_logic_vector(to_unsigned(s_selectdestport, 8));
                              rxstate <= S_Send;
                            end if;
                        END IF;
    
                    WHEN S_EOP =>
                        if s_txrdy = '1' then
                            s_txwrite <= '1';
                            rxstate <= S_Clean;			
                        end if;	
    
                    WHEN S_Send =>
                        IF s_txrdy = '1' THEN
                            s_txwrite <= '1';
                            rxstate <= S_Clean;
                        END IF;
    
                    WHEN S_Clean =>
                        s_txwrite <= '0';
                        s_txdata <= std_logic_vector(to_unsigned(s_selectport, 8));
                        s_txflag <= '0';
                        --data := (OTHERS => '0');
                        --pdata := (OTHERS => '0');					
    
                        rxstate <= S_Idle;
                END CASE;
			end if;
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
	rxhalff <= s_rxvalid_int; -- Debugging!
	prunning <= s_prunning;
	rrunning <= s_rrunning;
	perror <= s_perror_int;
	rerror <= s_rerror;
	-- Shows running ports.
	s_prunning <= s_prunning; -- running mode of external ports
	s_rrunning <= s_rrunning; -- running mode of router ports
	-- Shows rxfifo filling;
	--uartfifofull <= '0';--(uartfifofull OR s_rxfull) AND (NOT clear) AND (NOT rst);

	PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			-- Debugging: Zeigt an wenn ein externer Port daten empfangen hat (muss mit clear quittiert werden!)
			s_rxvalid_int <= (s_rxvalid_int OR s_rxvalid) AND (NOT clear) AND (NOT rst);--s_rxhalff; -- half receive fifo (spacewire -> uart) is full
			-- Sticky error led.
			s_perror_int <= (s_perror_int OR s_rxvalid) AND (NOT clear) AND (NOT rst); -- ACHTUNG! Für debug geänderT! TODO! (rxvalid)
			s_rerror_int <= (s_rerror_int OR s_rerror);-- AND (NOT clear) AND (NOT rst);

			-- Shows all errors on one led.
			s_perror <= s_perrdisc OR s_perrpar OR s_perresc OR s_perrcred; -- error external ports
			s_rerror <= s_rerrdisc OR s_rerrpar OR s_rerresc OR s_rerrcred; -- error router ports
		END IF;
	END PROCESS;

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

	-- Von externen Ports zu uart (transmitter)   
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
	uartrec: uart_rx
	generic map (
	   clk_cycles_per_bit => 87
	)
	port map (
	   clk => clk,
	   rxstream => rxstream,
	   rxvalid => s_uartrxvalid,
	   rxdata => s_uartrxdata
	);
	
	-- Uart transmitter.
	uartrx: uart_tx
	generic map (
	   clk_cycles_per_bit => 87
	   )
	port map (
	   clk => clk,
	   txstream => txstream,
	   txdata => s_uarttxdata,
	   txactive => s_uarttxactive,
	   txwrite => s_uarttxwrite,
	   txdone => s_uarttxdone
	);
	
	
	   -- External Port 0.
	   extPort: spwstream
        generic map (
        sysfreq => 10.0e6,
        txclkfreq => 10.0e6,
        rximpl => impl_fast,
        rxchunk => 1,
        WIDTH => 2,
        tximpl => impl_fast,
        rxfifosize_bits => 11,
        txfifosize_bits => 11
        )
        port map (
        clk => clk,
        rxclk => clk,
        txclk => clk,
        rst => rst,
        autostart => '1',
        linkstart => '1',
        linkdis => '0',
        txdivcnt => s_txdivcnt,
        tick_in => '0',
        ctrl_in => (others => '0'),
        time_in => (others => '0'),
        txwrite => s_txwrite,
        txflag => s_txflag,
        txdata => s_txdata,
        txrdy => s_txrdy,
        txhalff => s_txhalff,
        tick_out => open,
        ctrl_out => open,
        time_out => open,
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
	Router: spwrouter 
	   generic map (
	       numports => 1,
	       sysfreq => 10.0e6,
	       txclkfreq => 10.0e6,
	       rx_impl => (others => impl_fast),
	       tx_impl => (others => impl_fast)
	   )
	   port map (
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
	       gotData => open, -- Debugport
	       sentData => open, -- Debugport
	       spw_di => s_spw_di,
	       spw_si => s_spw_si,
	       spw_do => s_spw_do,
	       spw_so => s_spw_so
	   );
END routertest_top_multi_router_arch;