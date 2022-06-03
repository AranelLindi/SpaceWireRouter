----------------------------------------------------------------------------------
-- Company: University of Wuerzburg
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 06/01/2022 09:52:34 AM
-- Design Name: adapter_top
-- Module Name: 
-- Project Name: SpaceWire Router
-- Target Devices: -
-- Tool Versions: 1.0
-- Description: UART-SpaceWire Adapter.
-- 
-- Dependencies: spwpkg (spwstream)
-- 
-- Revision:
-- Revision 1.0 - File Created (Hardwaretest pending)
-- Additional Comments: -
-- 
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.spwpkg.all;

entity adapter_top is
    port (
        -- System clock.
        clk : in std_logic;
        
        -- Reset.
        rst : in std_logic;
        
        -- Uart rx stream.
        rx : in std_logic;
        
        -- Uart tx stream.
        tx : out std_logic;
        
        -- Clear signal to reset error flag.
        clear : in std_logic;
                       
        -- HIGH if link of adapter SpW port is in 'started' state.
        started : out std_logic;
        
        -- HIGH if link of adapter SpW port is in 'connecting' state.
        connecting : out std_logic;

        -- HIGH if link of adapter SpW port is in run state, indicating that link is operational.
        running : out std_logic;

        -- HIGH if errdisc (disconnect error), errpar (parity error), erresc (invalid escape sequence) or errcred (credit error) were detected.
        -- Triggers link reset. Must be acknowledged with a 'rst' or 'clear'.
        error : out std_logic;
        
        -- HIGH if transmit FIFO of adapter SpW port is at least half full.
        txhalff : out std_logic;
        
        -- HIGH if receiver FIFO of adapter SpW port is at least half full.
        rxhalff : out std_logic;

        -- SpaceWire data in.
        spw_di : in std_logic;
        
        -- SpaceWire strobe in.
        spw_si : in std_logic;
        
        -- SpaceWire data out.
        spw_do : out std_logic;
        
        -- SpaceWire strobe out.
        spw_so : out std_logic
    );
end adapter_top;

architecture adapter_top_arch of adapter_top is
    -- Constants
    constant sysfreq : real := 100.0e6; -- 100 MHz Digilent Basys3 Board !

    component UARTSpWAdapter 
        generic (
            -- frequency clk / Uart baud rate
            -- Example: 100 MHz clk, 115_200 baud rate Uart
            -- 100_000_000 / 115_200 = 868;
            clk_cycles_per_bit : integer;
            
            -- Number of SpaceWire ports in router & adapter.
            numports : integer range 0 to 31;
            
            -- Initial SpW input port (in chase that no commands are allowed, it cannot be changed !)
            init_input_port : integer range 0 to 31 := 0;
            
            -- Initial SpW output port (in chase that no commands are allowed, it cannot be changed !)
            init_output_port : integer range 0 to 31 := 0;
            
            -- Determines whether commands are permitted or data are sent only.
            activate_commands : boolean;
            
            -- System clock frequency in Hz.
            -- This must be set to the frequency of "clk". It is used to setup
            -- counters for reset timing, disconnect timeout and to transmit
            -- at 10 Mbit/s during the link handshake.
            sysfreq : real;
            
            -- Transmit clock frequency in Hz (onl if tximpl = impl_fast).
            -- This must be set to the frequency of "txclk". It is used to
            -- transmit at 10 Mbit/s during the link handshake.
            txclkfreq : real := 0.0;
            
            -- Selection of a receiver front-end implementation.
            rximpl : spw_implementation_type_rec;
            
            -- Maximum number of bits received per system clock
            -- (must be 1 in case of impl_generic).
            rxchunk : integer range 1 to 4 := 1;
            
            -- Width of shift registers in clock recovery front-end; added: SL
            WIDTH : integer range 1 to 2 := 2;
            
            -- Selection of a transmitter implementation.
            tximpl : spw_implementation_type_xmit;
            
            -- Size of the receive FIFO as the 2-logarithm of the number of bytes.
            -- Must be at least 6 (64 bytes).
            rxfifosize_bits : integer range 6 to 14 := 11;
            
            -- Size of the transmit FIFO as the 2-logarithm of the number of bytes.
            txfifosize_bits : integer range 2 to 14 := 11            
        );
        port (
            -- System clock.
            clk : in std_logic;
            
            -- SpW port receive sample clock (only for impl_fast).
            rxclk : in std_logic;
            
            -- SpW port transmit clock (only for impl_fast).
            txclk : in std_logic;
            
            -- Reset.
            rst : in std_logic;
            
            -- Enables automatic link start for SpW ports on receipt of a NULL character.
            autostart : in std_logic_vector(numports downto 0) := (others => '1');
            
            -- Enables SpW link start once the ready state is reached.
            -- Without autostart or linkstart, the link remains in state ready.
            linkstart : in std_logic_vector(numports downto 0) := (others => '1');
            
            -- Do not start SpW link (overrides linkstart and autostart) and/or
            -- disconnect a running link.
            linkdis : in std_logic_vector(numports downto 0) := (0 => '0', others => '0'); -- to deactivate port 1 set here '1'
            
            -- Scaling factor minus 1, used to scale the SpW transmit base clock into
            -- the transmission bit rate. The system clock (for impl_generic) or
            -- the txclk (for impl_fast) is divided byte (unsigned(txdivcnt) +1).
            -- Changing this signal will immediately change the transmission rate.
            -- During link setup, the transmision rate is always 10 Mbit/s.
            txdivcnt : in std_logic_vector(7 downto 0) := "00000001";
            
            -- Optional outputs:
            -- HIGH if SpW link state machine is in started state.
            started : out std_logic_vector(numports downto 0);
            
            -- HIGH if link state machine is currently in connecting state.
            connecting : out std_logic_vector(numports downto 0);
            
            -- HIGH if the link state machine is currently in the run state.
            running : out std_logic_vector(numports downto 0);
            
            -- Disconnect detected in state run. Triggers a reset and reconnect of the link.
            errdisc : out std_logic_vector(numports downto 0);
            
            -- Parity error detected in state run. Triggers a reset and reconnect of the link.
            errpar : out std_logic_vector(numports downto 0);
            
            -- Invalid escape sequence deteced in state run. Triggers a reset and reconnect of the link.
            erresc : out std_logic_vector(numports downto 0);
            
            -- Credit error detected. Triggers a reset and reconnect of the link.
            errcred : out std_logic_vector(numports downto 0);
            
            -- HIGH if the SpW port transmission queue is at least half full.
            txhalff : out std_logic_vector(numports downto 0);
            
            -- HIGH if the SpW port receiver FIFO is at least half full.
            rxhalff : out std_logic_vector(numports downto 0);
            
            -- SpaceWire Data In.
            spw_di : in std_logic_vector(numports downto 0);
            
            -- SpaceWire Strobe In.
            spw_si : in std_logic_vector(numports downto 0);
            
            -- SpaceWire Data Out.
            spw_do : out std_logic_vector(numports downto 0);
            
            -- SpaceWire Strobe Out.
            spw_so : out std_logic_vector(numports downto 0);
            
            -- Incoming serial stream (uart).
            rx : in std_logic;
            
            -- Outoing serial stream (uart).
            tx : out std_logic            
        );
    end component;
    
    
    -- Adapter signals.
    signal s_error : std_logic_vector(0 downto 0); -- error flag    
    signal s_started : std_logic_vector(0 downto 0);
    signal s_connecting : std_logic_vector(0 downto 0);
    signal s_running: std_logic_vector(0 downto 0);
    signal s_errdisc : std_logic_vector(0 downto 0);
    signal s_errpar : std_logic_vector(0 downto 0);
    signal s_erresc : std_logic_vector(0 downto 0);
    signal s_errcred : std_logic_vector(0 downto 0);
    signal s_txhalff : std_logic_vector(0 downto 0);
    signal s_rxhalff : std_logic_vector(0 downto 0);
    
    
    -- SpaceWire signals.
    signal s_spw_d_to_router : std_logic_vector(0 downto 0);
    signal s_spw_s_to_router : std_logic_vector(0 downto 0);
    signal s_spw_d_from_router : std_logic_vector(0 downto 0);
    signal s_spw_s_from_router : std_logic_vector(0 downto 0);
begin
    -- Drive outputs.
    error <= s_error(0);
    started <= s_started(0);
    connecting <= s_connecting(0);
    running <= s_running(0);
    txhalff <= s_txhalff(0);
    rxhalff <= s_rxhalff(0);
    
    -- Drive SpaceWire signals.
    spw_do <= s_spw_d_to_router(0);
    spw_so <= s_spw_s_to_router(0);
    s_spw_d_from_router(0) <= spw_di;
    s_spw_s_from_router(0) <= spw_si;
    

    -- UARTSpWAdapter
    Adapter : UARTSpWAdapter
        generic map (
            clk_cycles_per_bit => 868, -- 100_000_000 (Hz) / 115_200 (baud rate) = 868
            numports => 0,
            init_input_port => 0,
            init_output_port => 0,
            activate_commands => true,
            sysfreq => sysfreq,
            txclkfreq => sysfreq,
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
            autostart => (others => '1'),
            linkstart => (others => '1'),
            linkdis => (0 => '0', others => '0'),
            txdivcnt => "00000001",
            started => s_started,
            connecting => s_connecting,
            running => s_running,
            errdisc => s_errdisc,
            errpar => s_errpar,
            erresc => s_erresc,
            errcred => s_errcred,
            txhalff => s_txhalff,
            rxhalff => s_rxhalff,
            spw_di => s_spw_d_from_router,
            spw_si => s_spw_s_from_router,
            spw_do => s_spw_d_to_router,
            spw_so => s_spw_s_to_router,
            rx => rx,
            tx => tx
        );
        
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                s_error <= (others => '0');
            else
                s_error <= (s_error or s_errdisc or s_errpar or s_erresc or s_errcred) and (not clear);
            end if;
        end if;
    end process;
end architecture adapter_top_arch;