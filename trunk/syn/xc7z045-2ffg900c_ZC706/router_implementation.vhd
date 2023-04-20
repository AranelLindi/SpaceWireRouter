----------------------------------------------------------------------------------
-- Company: University of Wuerzburg
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 07/05/2022 10:10:21 AM
-- Design Name: 
-- Module Name: router_implementation - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.spwpkg.all;
use work.spwrouterpkg.all;

library unisim;
use unisim.vcomponents.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity router_implementation is
    Port (
        clk : in std_logic;
        rxclk : in std_logic;
        txclk : in std_logic;
        rst : in std_logic;
        rx : in std_logic := '0';
        tx : out std_logic;
        spw_di_0 : in std_logic;
        spw_si_0 : in std_logic;
        spw_do_0 : out std_logic;
        spw_so_0 : out std_logic;
        spw_di_1 : in std_logic;
        spw_si_1 : in std_logic;
        spw_do_1 : out std_logic;
        spw_so_1 : out std_logic;
        spw_di_2 : in std_logic;
        spw_si_2 : in std_logic;
        spw_do_2 : out std_logic;
        spw_so_2 : out std_logic;
        spw_di_3 : in std_logic;
        spw_si_3 : in std_logic;
        spw_do_3 : out std_logic;
        spw_so_3 : out std_logic;
        spw_di_4 : in std_logic;
        spw_si_4 : in std_logic;
        spw_do_4 : out std_logic;
        spw_so_4 : out std_logic;                                
        clka : in std_logic;
        addra : in std_logic_vector(31 downto 0);
        dina : in std_logic_vector(31 downto 0);
        douta : out std_logic_vector(31 downto 0);
        ena : in std_logic;
        rsta : in std_logic;
        wea : in std_logic_vector(3 downto 0)
    );
end router_implementation;

architecture Behavioral of router_implementation is
    -- Constants
    CONSTANT sysfreq : real := 100.0e6; -- clk period
    
    CONSTANT sysfreq_int : integer := INTEGER(sysfreq);
    CONSTANT baudrate : integer := 115_200;
    
    CONSTANT freq_baud_ratio : integer := sysfreq_int / baudrate;

    COMPONENT UARTSpWAdapter
        GENERIC (
            -- frequency clk / Uart baud rate
            -- Example: 100 MHz clk, 115_200 baud rate Uart
            -- 100_000_000 / 115_200 = 868;
            clk_cycles_per_bit : INTEGER;

            -- Number of SpaceWire ports in router & adapter.
            numports : INTEGER RANGE 1 TO 32;

            -- Initial SpW input port (in chase that no commands are allowed, it cannot be changed !)
            init_input_port : INTEGER RANGE 1 TO 32 := 1;

            -- Initial SpW output port (in chase that no commands are allowed, it cannot be changed !)
            init_output_port : INTEGER RANGE 1 TO 32 := 1;

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
            autostart : IN STD_LOGIC_VECTOR((numports-1) DOWNTO 0) := (OTHERS => '1');

            -- Enables SpW link start once the ready state is reached.
            -- Without autostart or linkstart, the link remains in state ready.
            linkstart : IN STD_LOGIC_VECTOR((numports-1) DOWNTO 0) := (OTHERS => '1');

            -- Do not start SpW link (overrides linkstart and autostart) and/or
            -- disconnect a running link.
            linkdis : IN STD_LOGIC_VECTOR((numports-1) DOWNTO 0) := (0 => '0', OTHERS => '0'); -- to deactivate port 1 set here '1'

            -- Scaling factor minus 1, used to scale the SpW transmit base clock into
            -- the transmission bit rate. The system clock (for impl_generic) or
            -- the txclk (for impl_fast) is divided byte (unsigned(txdivcnt) +1).
            -- Changing this signal will immediately change the transmission rate.
            -- During link setup, the transmision rate is always 10 Mbit/s.
            txdivcnt : IN STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000001";

            -- Optional outputs:
            -- HIGH if SpW link state machine is in started state.
            started : OUT STD_LOGIC_VECTOR((numports-1) DOWNTO 0);

            -- HIGH if link state machine is currently in connecting state.
            connecting : OUT STD_LOGIC_VECTOR((numports-1) DOWNTO 0);

            -- HIGH if the link state machine is currently in the run state.
            running : OUT STD_LOGIC_VECTOR((numports-1) DOWNTO 0);

            -- Disconnect detected in state run. Triggers a reset and reconnect of the link.
            errdisc : OUT STD_LOGIC_VECTOR((numports-1) DOWNTO 0);

            -- Parity error detected in state run. Triggers a reset and reconnect of the link.
            errpar : OUT STD_LOGIC_VECTOR((numports-1) DOWNTO 0);

            -- Invalid escape sequence deteced in state run. Triggers a reset and reconnect of the link.
            erresc : OUT STD_LOGIC_VECTOR((numports-1) DOWNTO 0);

            -- Credit error detected. Triggers a reset and reconnect of the link.
            errcred : OUT STD_LOGIC_VECTOR((numports-1) DOWNTO 0);

            -- HIGH if the SpW port transmission queue is at least half full.
            txhalff : OUT STD_LOGIC_VECTOR((numports-1) DOWNTO 0);

            -- HIGH if the SpW port receiver FIFO is at least half full.
            rxhalff : OUT STD_LOGIC_VECTOR((numports-1) DOWNTO 0);

            -- SpaceWire Data In.
            spw_di : IN STD_LOGIC_VECTOR((numports-1) DOWNTO 0);

            -- SpaceWire Strobe In.
            spw_si : IN STD_LOGIC_VECTOR((numports-1) DOWNTO 0);

            -- SpaceWire Data Out.
            spw_do : OUT STD_LOGIC_VECTOR((numports-1) DOWNTO 0);

            -- SpaceWire Strobe Out.
            spw_so : OUT STD_LOGIC_VECTOR((numports-1) DOWNTO 0);

            -- Incoming serial stream (uart).
            rx : IN STD_LOGIC;

            -- Outoing serial stream (uart).
            tx : OUT STD_LOGIC
        );
    END COMPONENT;



--    signal clk_ibufg : std_logic;
--    signal s_clk_toggle : std_logic;
--    type clkdivstates is (S_Mode1, S_Mode2);
--    signal clkdivstate : clkdivstates := S_Mode1;

--    signal clk : std_logic;

    signal s_spw_d_to_router : std_logic_vector(5 downto 0);
    signal s_spw_s_to_router : std_logic_vector(5 downto 0);
    signal s_spw_d_from_router : std_logic_vector(5 downto 0);
    signal s_spw_s_from_router : std_logic_vector(5 downto 0);
begin
    -- Differential input clock buffer.
--    bufgds: IBUFDS port map (I => SYSCLK_P, IB => SYSCLK_N, O => clk_ibufg); -- eventuell auch IBUFGDS, mal schauen ob Fehler auftreten


    s_spw_d_to_router(0) <= spw_di_0;
    s_spw_s_to_router(0) <= spw_si_0;
    spw_do_0 <= s_spw_d_from_router(0);
    spw_so_0 <= s_spw_s_from_router(0);
    
    s_spw_d_to_router(1) <= spw_di_1;
    s_spw_s_to_router(1) <= spw_si_1;
    spw_do_1 <= s_spw_d_from_router(1);
    spw_so_1 <= s_spw_s_from_router(1);
    
    s_spw_d_to_router(2) <= spw_di_2;
    s_spw_s_to_router(2) <= spw_si_2;
    spw_do_2 <= s_spw_d_from_router(2);
    spw_so_2 <= s_spw_s_from_router(2);

    s_spw_d_to_router(3) <= spw_di_3;
    s_spw_s_to_router(3) <= spw_si_3;
    spw_do_3 <= s_spw_d_from_router(3);
    spw_so_3 <= s_spw_s_from_router(3);

    s_spw_d_to_router(4) <= spw_di_4;
    s_spw_s_to_router(4) <= spw_si_4;
    spw_do_4 <= s_spw_d_from_router(4);
    spw_so_4 <= s_spw_s_from_router(4);


    -- Creates 100 MHz clock.
--    BUFGCE_inst : BUFGCE
--        port map (O => clk, CE => s_clk_toggle, I => clk_ibufg);
--    -- Toggles enable signal for BUFGCE every two cycles of input clk to divide by 2.
--    process(clk_ibufg)
--    begin
--        if rising_edge(clk_ibufg) then
--            case clkdivstate is
--                when S_Mode1 =>
--                    clkdivstate <= S_Mode2;

--                when S_Mode2 =>
--                    s_clk_toggle <= not s_clk_toggle;
--                    clkdivstate <= S_Mode1;
--            end case;
--        end if;
--    end process;

    RouterImpl : spwrouter
        generic map (
            numports => 6,
            sysfreq => 100.0e6,
            txclkfreq => 100.0e6,
            rx_impl => (others => impl_fast),
            tx_impl => (others => impl_fast)
        )
        port map (
            clk => clk,
            rxclk => rxclk,
            txclk => txclk,
            rst => rst,
            started => open,
            connecting => open,
            running => open,
            errdisc => open,
            errpar => open,
            erresc => open,
            errcred => open,
            spw_di => s_spw_d_to_router,
            spw_si => s_spw_s_to_router,
            spw_do => s_spw_d_from_router,
            spw_so => s_spw_s_from_router,
            clka => clka,
            addra => addra,
            dina => dina,
            douta => douta,
            ena => ena,
            rsta => rsta,
            wea => wea
        );


    -- UARTSpWAdapter
    -- Contains numports-SpaceWire ports.
    Adapter : UARTSpWAdapter
        GENERIC MAP(
            clk_cycles_per_bit => freq_baud_ratio, -- 100_000_000 (Hz) / 115_200 (baud rate) = 868
            numports => 1,
            init_input_port => 1,
            init_output_port => 1,
            activate_commands => FALSE, -- define adapter variant (command (true) / non-command version (false))
            sysfreq => sysfreq,
            txclkfreq => sysfreq,
            rximpl => impl_fast,
            rxchunk => 1,
            WIDTH => 2,
            tximpl => impl_fast,
            rxfifosize_bits => 11,
            txfifosize_bits => 11
        )
        PORT MAP(
            clk => clk,
            rxclk => rxclk,
            txclk => txclk,
            rst => rst,
            autostart => (OTHERS => '1'),
            linkstart => (OTHERS => '1'),
            linkdis => (0 => '0', OTHERS => '0'),
            txdivcnt => "00000001",
            started => OPEN,
            connecting => OPEN,
            running => open,
            errdisc => open,
            errpar => open,
            erresc => open,
            errcred => open,
            txhalff => OPEN,
            rxhalff => OPEN,
            spw_di => s_spw_d_from_router(5 downto 5),
            spw_si => s_spw_s_from_router(5 downto 5),
            spw_do => s_spw_d_to_router(5 downto 5),
            spw_so => s_spw_s_to_router(5 downto 5),
            rx => rx,
            tx => tx
        );
end Behavioral;
