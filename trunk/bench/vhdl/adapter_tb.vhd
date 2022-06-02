----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 25.05.2022 12:29
-- Design Name: UART - SpaceWire Adapter (both directions (UART -> SpW; SpW -> UART)
-- Module Name: UART2SpW
-- Project Name: SpaceWire Router
-- Target Devices: xc7a35tcpg236-1 (tested);
-- Tool Versions: 
-- Dependencies: spwpkg (spwstream)
-- 
-- Revision:
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.spwpkg.all; -- for spwstream (and definitions)
--use work.spwrouterpkg.all; -- for spwrouter (and definitions)

entity adapter_tb is
end;

architecture adapter_tb_arch of adapter_tb is
    procedure SendViaUART(constant byte : in std_logic_vector(8 downto 0); constant dt : in time; signal stream : out std_logic) is
    begin
        -- Start bit.
        stream <= '0';
        
        -- Wait for dt
        wait for dt;
        
        -- Send byte
        for i in 0 to 7 loop -- LSB first !
            stream <= byte(i);
            wait for dt;
        end loop;
        
        -- Stop bit.
        stream <= '1';
    end procedure;


    -- Component declaration of DuT.
    component UARTSpWAdapter
        generic (
            clk_cycles_per_bit : integer;
            numports : integer range 0 to 31;
            init_input_port : integer range 0 to numports := 0;
            init_output_port : integer range 0 to numports := 0;
            activate_commands : boolean;
            sysfreq : real;
            txclkfreq : real := 0.0;
            rximpl : spw_implementation_type_rec;
            rxchunk : integer range 1 to 4 := 1;
            WIDTH : integer range 1 to 3 := 2;
            tximpl : spw_implementation_type_xmit;
            rxfifosize_bits : integer range 6 to 14 := 11;
            txfifosize_bits : integer range 2 to 14 := 11
        );
        port (
            clk : in std_logic;
            rxclk : in std_logic;
            txclk : in std_logic;
            rst : in std_logic;
            autostart : in std_logic_vector(numports downto 0) := (others => '1');
            linkstart : in std_logic_vector(numports downto 0) := (others => '1');
            linkdis : in std_logic_vector(numports downto 0) := (0 => '0', others => '0');
            txdivcnt : in std_logic_vector(7 downto 0) := "00000001";
            started : out std_logic_vector(numports downto 0);
            connecting : out std_logic_vector(numports downto 0);
            running : out std_logic_vector(numports downto 0);
            errdisc : out std_logic_vector(numports downto 0);
            errpar : out std_logic_vector(numports downto 0);
            erresc : out std_logic_vector(numports downto 0);
            errcred : out std_logic_vector(numports downto 0);
            txhalff : out std_logic_vector(numports downto 0);
            rxhalff : out std_logic_vector(numports downto 0);
            spw_di : in std_logic_vector(numports downto 0);
            spw_si : in std_logic_vector(numports downto 0);
            spw_do : out std_logic_vector(numports downto 0);
            spw_so : out std_logic_vector(numports downto 0);
            rx : in std_logic;
            tx : out std_logic
        );
    end component UARTSpWAdapter;
    
    type array_t is array(natural range<>) of std_logic_vector;
    
    
    -- Constants and generic values
    -- SpaceWire specific.
    constant numports : integer range 0 to 31 := 3;
    constant sysfreq : real := 100.0e6; -- 100 MHz
    constant txclkfreq : real := sysfreq;
    constant rximpl : spw_implementation_type_rec := impl_fast;
    constant rxchunk : integer range 1 to 4 := 1;
    constant WIDTH : integer range 1 to 3 := 2;
    constant tximpl : spw_implementation_type_xmit := impl_fast;
    constant rxfifosize_bits : integer range 6 to 14 := 11;
    constant txfifosize_bits : integer range 2 to 14 := 11;
    -- UART specific.
    constant dt : time := 8.6805556 us; -- 1 / baud rate (baud rate == 115_200)
    
    
    -- Simulation signals.
    signal clk: std_logic;
    --signal rxclk: std_logic;
    --signal txclk: std_logic;
    signal rst: std_logic := '1';
    signal autostart: std_logic_vector(numports downto 0) := (others => '1');
    signal linkstart: std_logic_vector(numports downto 0) := (others => '1');
    signal linkdis: std_logic_vector(numports downto 0) := (0 => '0', others => '0');
    signal txdivcnt: std_logic_vector(7 downto 0) := "00000001";
    signal started: std_logic_vector(numports downto 0);
    signal connecting: std_logic_vector(numports downto 0);
    signal running: std_logic_vector(numports downto 0);
    signal errdisc: std_logic_vector(numports downto 0);
    signal errpar: std_logic_vector(numports downto 0);
    signal erresc: std_logic_vector(numports downto 0);
    signal errcred: std_logic_vector(numports downto 0);
    signal txhalff: std_logic_vector(numports downto 0);
    signal rxhalff: std_logic_vector(numports downto 0);
    --signal spw_di: std_logic_vector(numports downto 0);
    --signal spw_si: std_logic_vector(numports downto 0);
    --signal spw_do: std_logic_vector(numports downto 0);
    --signal spw_so: std_logic_vector(numports downto 0);
    
    
--    -- Router status signals
--    signal s_router_started : std_logic_vector(numports downto 0);
--    signal s_router_connecting : std_logic_vector(numports downto 0);
--    signal s_router_running : std_logic_vector(numports downto 0);
--    signal s_router_errdisc : std_logic_vector(numports downto 0);
--    signal s_router_errpar : std_logic_vector(numports downto 0);
--    signal s_router_erresc : std_logic_vector(numports downto 0);
--    signal s_router_errcred : std_logic_vector(numports downto 0);

    -- Corresponding SpaceWire Port signals.
    signal s_corr_tick_in : std_logic_vector(numports downto 0) := (others => '0');
    signal s_corr_ctrl_in : array_t(numports downto 0)(1 downto 0) := (others => (others => '0'));
    signal s_corr_time_in : array_t(numports downto 0)(5 downto 0) := (others => (others => '0'));
    signal s_corr_txwrite : std_logic_vector(numports downto 0) := (others => '0');
    signal s_corr_txflag : std_logic_vector(numports downto 0) := (others => '0');
    signal s_corr_txdata : array_t(numports downto 0)(7 downto 0) := (others => (others => '0'));
    signal s_corr_txrdy : std_logic_vector(numports downto 0) := (others => '0');
    signal s_corr_txhalff : std_logic_vector(numports downto 0) := (others => '0');
    signal s_corr_tick_out : std_logic_vector(numports downto 0) := (others => '0');
    signal s_corr_ctrl_out : array_t(numports downto 0)(1 downto 0) := (others => (others => '0'));
    signal s_corr_time_out : array_t(numports downto 0)(5 downto 0) := (others => (others => '0'));
    signal s_corr_rxflag : std_logic_vector(numports downto 0) := (others => '0');
    signal s_corr_rxdata : array_t(numports downto 0)(7 downto 0) := (others => (others => '0'));
    signal s_corr_rxvalid : std_logic_vector(numports downto 0) := (others => '0');

    
    
    -- SpaceWire signals.
    signal s_spw_data_to_router : std_logic_vector(numports downto 0) := (others => '0');
    signal s_spw_strobe_to_router : std_logic_vector(numports downto 0) := (others => '0');
    signal s_spw_data_from_router : std_logic_vector(numports downto 0) := (others => '0');
    signal s_spw_strobe_from_router : std_logic_vector(numports downto 0) := (others => '0');
    
    
    -- Input variables
    signal rx: std_logic := '1';
    signal tx: std_logic;

    -- Simulation specific constants and signals.
    constant clock_period: time := 10 ns; -- 100 MHz
    signal stop_the_clock: boolean;
    signal newround : std_logic := '0';
begin
    -- Instance of UART-SpaceWire Adapter
    DuT: UARTSpWAdapter
        generic map (
            clk_cycles_per_bit => 868, -- 100_000_000 (Hz) / 115_200 (baud rate) = 868
            numports           => numports,
            init_input_port    => 0,
            init_output_port   => 0,
            activate_commands  => true,
            sysfreq            => sysfreq,
            txclkfreq          => txclkfreq,
            rximpl             => rximpl,
            rxchunk            => rxchunk,
            WIDTH              => WIDTH,
            tximpl             => tximpl,
            rxfifosize_bits    => rxfifosize_bits,
            txfifosize_bits    => txfifosize_bits)
        port map (
            clk                => clk,
            rxclk              => clk,
            txclk              => clk,
            rst                => rst,
            autostart          => autostart,
            linkstart          => linkstart,
            linkdis            => linkdis,
            txdivcnt           => txdivcnt,
            started            => started,
            connecting         => connecting,
            running            => running,
            errdisc            => errdisc,
            errpar             => errpar,
            erresc             => erresc,
            errcred            => errcred,
            txhalff            => txhalff,
            rxhalff            => rxhalff,
            spw_di             => s_spw_data_from_router,
            spw_si             => s_spw_strobe_from_router,
            spw_do             => s_spw_data_to_router,
            spw_so             => s_spw_strobe_to_router,
            rx                 => rx,
            tx                 => tx );
            

    ComSpWPorts : for n in 0 to numports generate
        portN : spwstream
            generic map (
                sysfreq => sysfreq,
                txclkfreq => txclkfreq,
                rximpl => rximpl,
                rxchunk => rxchunk,
                tximpl => tximpl,
                rxfifosize_bits => rxfifosize_bits,
                txfifosize_bits => txfifosize_bits,
                WIDTH => WIDTH
            )
            port map (
                clk => clk,
                rxclk => clk,
                txclk => clk,
                rst => rst,
                autostart => '1', -- Start link automaticly on receipt of NULL character
                linkstart => '1',
                linkdis => '0',
                txdivcnt => txdivcnt,
                tick_in => s_corr_tick_in(n),
                ctrl_in => s_corr_ctrl_in(n),
                time_in => s_corr_time_in(n),
                txwrite => s_corr_txwrite(n),
                txflag => s_corr_txflag(n),
                txdata => s_corr_txdata(n),
                txrdy => s_corr_txrdy(n),
                txhalff => s_corr_txhalff(n),
                tick_out => s_corr_tick_out(n),
                ctrl_out => s_corr_ctrl_out(n),
                time_out => s_corr_time_out(n),
                rxvalid => s_corr_rxvalid(n),
                rxflag => s_corr_rxflag(n),
                rxdata => s_corr_rxdata(n),
                rxread => '1',
                started => open,
                connecting => open,
                running => open,
                errdisc => open,
                errpar => open,
                erresc => open,
                errcred => open,
                spw_di => s_spw_data_to_router(n),
                spw_si => s_spw_strobe_to_router(n),
                spw_do => s_spw_data_from_router(n),
                spw_so => s_spw_strobe_from_router(n)
            );
    end generate ComSpWPorts;      
        

--    -- Instance of SpaceWire router to allow realistic SpaceWire communication.        
--    Router : spwrouter
--        generic map (
--            numports => numports,
--            sysfreq => sysfreq,
--            txclkfreq => txclkfreq,
--            rx_impl => (others => rximpl),
--            tx_impl => (others => tximpl)
--        )
--        port map (
--            clk => clk,
--            rxclk => rxclk,
--            txclk => txclk,
--            rst => rst,
--            started => s_router_started,
--            connecting => s_router_connecting,
--            running => s_router_running,
--            errdisc => s_router_errdisc,
--            errpar => s_router_errpar,
--            erresc => s_router_erresc,
--            errcred => s_router_errcred,
--            spw_di => s_spw_data_to_router,
--            spw_si => s_spw_strobe_to_router,
--            spw_do => s_spw_data_from_router,
--            spw_so => s_spw_strobe_from_router
--        );
        
    -- Simulation tasks.
    stimulus : process
    begin
        newround <= '0';
        -- Initial reset
        --rx <= '1';
        --rst <= '1';
        wait for clock_period;
        rst <= '0';
    
        -- Simulation programm
        
        wait for 20 us; -- Give router and ports opportunity to connect.
        
        -- Start sending first command to select input and output spacewire ports.
        SendViaUART('1' & "10100010", dt, rx); -- Send to port 2
        wait for 90 us;
        SendViaUART('1' & "11000010", dt, rx); -- Watch data from port 2
        
        wait for 90 us;
        
        -- First SpaceWire packet. 
        -- CAUTION !
        -- It could become a problem if a watchdog timer is built into router to terminate
        -- open connections after a timeout. UART is 100 times slower than SpaceWire and
        -- this could cause a systematic error in which the watchdog silently terminates
        -- open packets !
        
        SendViaUART('0' & x"02", dt, rx);
        
        wait for 90 us;
        
        SendViaUART('1' & x"B5", dt, rx); -- "10110101" -- Eingangsport 21 wird gesendet, es wird im Adapter keine Änderung des Ports vorgenommen (Out of range)
        
        wait for 90 us;
        
        SendViaUART('1' & "11100000", dt, rx); -- EOP
        
        wait for 90 us;
        
        report("Sending Data from corresponding SpaceWire port");
        -- Send Packet from corresponding port 2
        s_corr_txdata(2) <= x"02";
        s_corr_txflag(2) <= '0';
        s_corr_txwrite(2) <= '1';
        
        wait for clock_period;
        
        s_corr_txwrite(2) <= '0';
        
        wait for clock_period;
        
        s_corr_txdata(2) <= x"55";
        s_corr_txflag(2) <= '0';
        s_corr_txwrite(2) <= '1';
        
        wait for clock_period;
        
        s_corr_txwrite(2) <= '0';
        
        wait for clock_period;
        
        s_corr_txdata(2) <= x"00";
        s_corr_txflag(2) <= '1';
        s_corr_txwrite(2) <= '1';
        
        wait for clock_period;
        
        s_corr_txwrite(2) <= '0';
        
        wait for 450 us;
        
        newround <= '1';
        wait for clock_period;
        --stop_the_clock <= true;       
    end process stimulus;
    
    clocking : process
    begin
        --while not stop_the_clock loop
            clk <= '0', '1' after clock_period /2;
            wait for clock_period;
        --end loop;
    end process clocking;
end architecture adapter_tb_arch;