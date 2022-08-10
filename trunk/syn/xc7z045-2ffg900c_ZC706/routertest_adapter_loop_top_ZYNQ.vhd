----------------------------------------------------------------------------------
-- Company: University of Wuerzburg
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 07/15/2022 11:08:52 AM
-- Design Name: 
-- Module Name: routertest_adapter_loop_top_ZYNQ - routertest_adapter_loop_top_ZYNQ_arch
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: spwrouter implementation with 5 ports (0 - 4). Ports 0 to 3 are 
-- mapped to FMC Board and could be looped (0 -> 3, 1 -> 2). Port 4 is connected
-- to UART-SpaceWire Adapter and able to receive/send data through UART (PC)
-- Thereby it is possible to send packets via uart to router and cross every
-- SpaceWire port 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

use work.spwrouterpkg.all;
use work.spwpkg.all;

entity routertest_adapter_loop_top_ZYNQ is
    Port (
        -- Differential board clock (200 MHz).
        SYSCLK_P : in std_logic;
        SYSCLK_N : in std_logic;

        -- Synchronous reset.
        rst : in std_logic;
        
        -- To clear error flags.
        clear : in std_logic;

        -- SpaceWire signals.
        spw_di : in std_logic_vector(3 downto 0);
        spw_si : in std_logic_vector(3 downto 0);
        spw_do : out std_logic_vector(3 downto 0);
        spw_so : out std_logic_vector(3 downto 0);
        
        adapt_running : out std_logic_vector(0 downto 0);
        adapt_error : out std_logic_vector(0 downto 0);
        router_running : out std_logic_vector(0 downto 0); -- 4 downto 0
        router_error : out std_logic_vector(0 downto 0); -- 4 downto 0

        -- Uart signals.
        rx : in std_logic;
        tx : out std_logic
    );
end routertest_adapter_loop_top_ZYNQ;

architecture routertest_adapter_loop_top_ZYNQ_arch of routertest_adapter_loop_top_ZYNQ is
    -- Constants
    CONSTANT sysfreq : real := 100.0e6; -- clk period

    COMPONENT UARTSpWAdapter
        GENERIC (
            -- frequency clk / Uart baud rate
            -- Example: 100 MHz clk, 115_200 baud rate Uart
            -- 100_000_000 / 115_200 = 868;
            clk_cycles_per_bit : INTEGER;

            -- Number of SpaceWire ports in router & adapter.
            numports : INTEGER RANGE 0 TO 31;

            -- Initial SpW input port (in chase that no commands are allowed, it cannot be changed !)
            init_input_port : INTEGER RANGE 0 TO 31 := 0;

            -- Initial SpW output port (in chase that no commands are allowed, it cannot be changed !)
            init_output_port : INTEGER RANGE 0 TO 31 := 0;

            -- Determines whether commands are permitted or data are sent only.
            activate_commands : BOOLEAN;

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
            rxchunk : INTEGER RANGE 1 TO 4 := 1;

            -- Width of shift registers in clock recovery front-end; added: SL
            WIDTH : INTEGER RANGE 1 TO 2 := 2;

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

            -- SpW port receive sample clock (only for impl_fast).
            rxclk : IN STD_LOGIC;

            -- SpW port transmit clock (only for impl_fast).
            txclk : IN STD_LOGIC;

            -- Reset.
            rst : IN STD_LOGIC;

            -- Enables automatic link start for SpW ports on receipt of a NULL character.
            autostart : IN STD_LOGIC_VECTOR(numports DOWNTO 0) := (OTHERS => '1');

            -- Enables SpW link start once the ready state is reached.
            -- Without autostart or linkstart, the link remains in state ready.
            linkstart : IN STD_LOGIC_VECTOR(numports DOWNTO 0) := (OTHERS => '1');

            -- Do not start SpW link (overrides linkstart and autostart) and/or
            -- disconnect a running link.
            linkdis : IN STD_LOGIC_VECTOR(numports DOWNTO 0) := (0 => '0', OTHERS => '0'); -- to deactivate port 1 set here '1'

            -- Scaling factor minus 1, used to scale the SpW transmit base clock into
            -- the transmission bit rate. The system clock (for impl_generic) or
            -- the txclk (for impl_fast) is divided byte (unsigned(txdivcnt) +1).
            -- Changing this signal will immediately change the transmission rate.
            -- During link setup, the transmision rate is always 10 Mbit/s.
            txdivcnt : IN STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000001";

            -- Optional outputs:
            -- HIGH if SpW link state machine is in started state.
            started : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

            -- HIGH if link state machine is currently in connecting state.
            connecting : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

            -- HIGH if the link state machine is currently in the run state.
            running : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

            -- Disconnect detected in state run. Triggers a reset and reconnect of the link.
            errdisc : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

            -- Parity error detected in state run. Triggers a reset and reconnect of the link.
            errpar : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

            -- Invalid escape sequence deteced in state run. Triggers a reset and reconnect of the link.
            erresc : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

            -- Credit error detected. Triggers a reset and reconnect of the link.
            errcred : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

            -- HIGH if the SpW port transmission queue is at least half full.
            txhalff : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

            -- HIGH if the SpW port receiver FIFO is at least half full.
            rxhalff : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

            -- SpaceWire Data In.
            spw_di : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

            -- SpaceWire Strobe In.
            spw_si : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

            -- SpaceWire Data Out.
            spw_do : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

            -- SpaceWire Strobe Out.
            spw_so : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

            -- Incoming serial stream (uart).
            rx : IN STD_LOGIC;

            -- Outoing serial stream (uart).
            tx : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Adapter signals.
    SIGNAL s_adapt_error : STD_LOGIC_VECTOR(0 DOWNTO 0); -- error flag    
    SIGNAL s_adapt_started : STD_LOGIC_VECTOR(0 DOWNTO 0);
    SIGNAL s_adapt_connecting : STD_LOGIC_VECTOR(0 DOWNTO 0);
    SIGNAL s_adapt_running : STD_LOGIC_VECTOR(0 DOWNTO 0);
    SIGNAL s_adapt_errdisc : STD_LOGIC_VECTOR(0 DOWNTO 0);
    SIGNAL s_adapt_errpar : STD_LOGIC_VECTOR(0 DOWNTO 0);
    SIGNAL s_adapt_erresc : STD_LOGIC_VECTOR(0 DOWNTO 0);
    SIGNAL s_adapt_errcred : STD_LOGIC_VECTOR(0 DOWNTO 0);
    SIGNAL s_adapt_txhalff : STD_LOGIC_VECTOR(0 DOWNTO 0);
    SIGNAL s_adapt_rxhalff : STD_LOGIC_VECTOR(0 DOWNTO 0);

    -- Router signals.
    SIGNAL s_router_error : STD_LOGIC_VECTOR(4 DOWNTO 0); -- error flag
    SIGNAL s_router_started : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL s_router_connecting : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL s_router_running : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL s_router_errdisc : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL s_router_errpar : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL s_router_erresc : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL s_router_errcred : STD_LOGIC_VECTOR(4 DOWNTO 0);

    -- Clock buffer.
    signal s_clk_ibufg : std_logic;

    -- Toggle signal to generate 100 MHz clock.
    signal s_clk_toggle : std_logic;

    -- FSM states to divide board clock by 2.
    type clkdivstates is (S_Mode1, S_Mode2);
    signal s_clkdivstate : clkdivstates := S_Mode1;

    -- 100 MHz clock.
    signal clk : std_logic;


    -- Internal SpaceWire signals.
    signal s_spw_d_from_router_to_port : std_logic_vector(4 downto 0);
    signal s_spw_s_from_router_to_port : std_logic_vector(4 downto 0);
    signal s_spw_d_from_port_to_router : std_logic_vector(4 downto 0);
    signal s_spw_s_from_port_to_router : std_logic_vector(4 downto 0);
begin
    -- Drive outputs.
    spw_do <= s_spw_d_from_router_to_port(3 downto 0);
    spw_so <= s_spw_s_from_router_to_port(3 downto 0);
    
    adapt_error <= s_adapt_error(0 downto 0);
    router_error <= s_router_error(1 downto 1); -- 4 downto 4 (für UART-SpWAdapter-Port)
    adapt_running <= s_adapt_running(0 downto 0);
    router_running <= s_router_running(1 downto 1); -- 4 downto 4 (für UART-SpWAdapter-Port)

    -- Read inputs.
    s_spw_d_from_port_to_router(3 downto 0) <= spw_di;
    s_spw_s_from_port_to_router(3 downto 0) <= spw_si;


    -- Differential input clock buffer.
    bufgds : IBUFDS port map (I => SYSCLK_P, IB => SYSCLK_N, O => s_clk_ibufg);

    -- Create 100 MHz clock by dividing board clock by 2.
    BUFGCE_inst : BUFGCE
        port map (O => clk, CE => s_clk_toggle, I => s_clk_ibufg);

    -- Toggles enable signal for BUFGCE every two cycles of input clk to divide by 2.
    process(s_clk_ibufg)
    begin
        if rising_edge(s_clk_ibufg) then
            case s_clkdivstate is
                when S_Mode1 =>
                    s_clkdivstate <= S_Mode2;

                when S_Mode2 =>
                    s_clk_toggle <= not s_clk_toggle;
                    s_clkdivstate <= S_Mode1;
            end case;
        end if;
    end process;
    

    -- SpaceWire router TODO: Ports haben kein autostart! Bei Loop also darauf achten das das zuvor in spwrouter händisch auf 1 gesetzt wird!
    RouterImpl : spwrouter
        generic map (numports => 4, -- 4 downto 0
                    sysfreq => sysfreq,
                    txclkfreq => sysfreq,
                    rx_impl => (others => impl_fast),
                    tx_impl => (others => impl_fast)
                   )
        port map (
            clk => clk,
            rxclk => clk,
            txclk => clk,
            rst => rst,
            started => s_router_started,
            connecting => s_router_connecting,
            running => s_router_running, -- TODO: Eventuell auf die LEDs am FMC Board legen!
            errdisc => s_router_errdisc,
            errpar => s_router_errpar,
            erresc => s_router_erresc,
            errcred => s_router_errcred,
            spw_di => s_spw_d_from_port_to_router,
            spw_si => s_spw_s_from_port_to_router,
            spw_do => s_spw_d_from_router_to_port,
            spw_so => s_spw_s_from_router_to_port
        );
        

    -- UART-SpaceWire Adapter        
    Adapter : UARTSpWAdapter
        generic map (
            clk_cycles_per_bit => 868, -- 100_000_000 (Hz) / 115_200 (baud rate) = 868
            numports => 0, -- 0 downto 0 == 1 spwport
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
            linkdis => (others => '0'),
            txdivcnt => "00000001",
            started => s_adapt_started,
            connecting => s_adapt_connecting,
            running => s_adapt_running,
            errdisc => s_adapt_errdisc,
            errpar => s_adapt_errpar,
            erresc => s_adapt_erresc,
            errcred => s_adapt_errcred,
            txhalff => s_adapt_txhalff,
            rxhalff => s_adapt_rxhalff,
            spw_di => s_spw_d_from_router_to_port(4 downto 4),
            spw_si => s_spw_s_from_router_to_port(4 downto 4),
            spw_do => s_spw_d_from_port_to_router(4 downto 4),
            spw_so => s_spw_s_from_port_to_router(4 downto 4),
            rx => rx,
            tx => tx
        );
        

    -- Error outputs.
    PROCESS (clk)
        variable v_adapt_clear : std_logic_vector(0 downto 0);
        variable v_router_clear : std_logic_vector(4 downto 0);
    BEGIN
        IF rising_edge(clk) THEN
            IF rst = '1' THEN
                -- Synchronous reset.
                s_adapt_error <= (OTHERS => '0');
                s_router_error <= (OTHERS => '0');
            ELSE
                -- Get clear-value
                v_adapt_clear := (others => clear);
                v_router_clear := (others => clear);
            
                s_adapt_error <= (s_adapt_error OR s_adapt_errdisc OR s_adapt_errpar OR s_adapt_erresc OR s_adapt_errcred) AND (NOT v_adapt_clear);
                s_router_error <= (s_router_error OR s_router_errdisc OR s_router_errpar OR s_router_erresc OR s_router_errcred) AND (NOT v_router_clear);
            END IF;
        END IF;
    END PROCESS;
end routertest_adapter_loop_top_ZYNQ_arch;