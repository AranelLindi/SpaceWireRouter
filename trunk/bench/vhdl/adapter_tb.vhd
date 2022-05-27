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
use work.spwrouterpkg.all; -- for spwrouter (and definitions)

entity adapter_tb is
end;

architecture adapter_tb_arch of adapter_tb is
    procedure SendViaUART(constant byte : in std_logic_vector(7 downto 0); constant dt : in time; signal stream : out std_logic) is
    begin
        -- Start bit.
        stream <= '0';
        
        -- Wait for dt
        wait for dt;
        
        -- Send byte
        for i in 0 to byte'length - 1 loop -- LSB first !
            stream <= byte(i);
            wait for dt;
        end loop;
        
        -- Stop bit.
        stream <= '1';
    end procedure;


    -- Component declaration of DuT.
    component UARTSpWAdapter
        generic (
            clk_cycles_per_bit : integer,
            numports : integer range 0 to 31;
            sysfreq : real;
            txclkfreq : real := 0.0;
            rximpl : spw_implementation_type_rec;
            WIDTH : integer range 1 to 3 := 2;
            tximpl : spw_implementation_type_xmit;
            rxfifosize_bits : integer range 6 to 14 := 11;
            txfifosize_bits : integer range 2 to 14 := 11
        );
        port (
            clk : in std_logic;
            rxclk : in std_logic := clk;
            txclk : in std_logic := clk;
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
    end component UARTSpWAdapter
    
    
    -- Constants and generic values
    -- SpaceWire specific.
    constant numports : integer range 0 to 31 := 3;
    constant sysfreq : real := 100 * (10**6); -- 100 MHz
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
    signal rxclk: std_logic := clk;
    signal txclk: std_logic := clk;
    signal rst: std_logic;
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
    signal spw_di: std_logic_vector(numports downto 0);
    signal spw_si: std_logic_vector(numports downto 0);
    signal spw_do: std_logic_vector(numports downto 0);
    signal spw_so: std_logic_vector(numports downto 0);
    
    
    -- Router status signals
    signal s_router_started : std_logic_vector(numports downto 0);
    signal s_router_connecting : std_logic_vector(numports downto 0);
    signal s_router_running : std_logic_vector(numports downto 0);
    signal s_router_errdisc : std_logic_vector(numports downto 0);
    signal s_router_errpar : std_logic_vector(numports downto 0);
    signal s_router_erresc : std_logic_vector(numports downto 0);
    signal s_router_errcred : std_logic_vector(numports downto 0);
    
    
    -- SpaceWire signals.
    signal s_spw_data_to_router : std_logic_vector(numports downto 0);
    signal s_spw_strobe_to_router : std_logic_vector(numports downto 0);
    signal s_spw_data_from_router : std_logic_vector(numports downto 0);
    signal s_spw_strobe_from_router : std_logic_vector(numports downto 0);
    
    
    -- Input variables
    signal rx: std_logic;
    signal tx: std_logic ;

    -- Simulation specific constants and signals.
    constant clock_period: time := 10 ns; -- 100 MHz
    signal stop_the_clock: boolean;
begin
    -- Instance of UART-SpaceWire Adapter
    DuT: UARTSpWAdapter
        generic map (
            clk_cycles_per_bit => 868, -- 100_000_000 (Hz) / 115_200 (baud rate) = 868
            numports           => numports,
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
            rxclk              => rxclk,
            txclk              => txclk,
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
            spw_di             => spw_di,
            spw_si             => spw_si,
            spw_do             => spw_do,
            spw_so             => spw_so,
            rx                 => rx,
            tx                 => tx );
    
    -- Instance of SpaceWire router to allow realistic SpaceWire communication.        
    SpWRouter : spwrouter
        generic map (
            numports => numports,
            sysfreq => sysfreq,
            txclkfreq => txclkfreq,
            rx_impl => rx_impl,
            tx_impl => tx_impl
        )
        port map (
            clk => clk,
            rxclk => rxclk,
            txclk => txclk,
            rst => rst,
            started => s_router_started,
            connecting => s_router_connecting,
            running => s_router_running,
            errdisc => s_router_errdisc,
            errpar => s_router_errpar,
            erresc => s_router_erresc,
            errcred => s_router_errcred,
            spw_di => s_spw_data_to_router,
            spw_si => s_spw_strobe_to_router,
            spw_do => s_spw_data_from_router,
            spw_so => s_spw_strobe_from_router
        );
        
    -- Simulation tasks.
    stimulus : process
    begin
        -- Initial reset
        rst <= '1';
        wait for 2 * clock_period;
        rst <= '0';
    
        -- Simulation programm
        rx <= '1';
        
        wait for 20 us; -- Give router and ports opportunity to connect.
        
        -- Start sending first command to select input and output spacewire ports.
        SendViaUART("10100001", dt, rx); -- Send to port 1
        wait for 5 * clock_period;
        SendViaUART("10000010", dt, rx); -- Watch data from port 2
        
        wait for 20 us;
        
        -- First SpaceWire packet. 
        -- CAUTION !
        -- It could become a problem if a watchdog timer is built into router to terminate
        -- open connections after a timeout. UART is 100 times slower than SpaceWire and
        -- this could cause a systematic error in which the watchdog silently terminates
        -- open packets !
        
        SendViaUART(x"02", dt, rx);
        
        wait for 5 * clock_period;
        
        SendViaUART(x"55", dt, rx); -- "10101010"
        
        wait for 5 * clock_period;
        
        SendViaUART("11100000", dt, rx); -- EOP
        
        wait for 10 us;
        
        stop_the_clock <= true;       
    end process stimulus;
    
    clocking : process
    begin
        while not stop_the_clock loop
            clk <= '0', '1' after clock_period /2;
            wait for clock_period;
        end loop;
    end process clocking;
end architecture adapter_tb_arch;