----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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
use work.spwrouterpkg.all;
use work.spwpkg.all;

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
        SYSCLK_P : in std_logic;
        SYSCLK_N : in std_logic;
        rst : in std_logic;
        spw_di : in std_logic_vector(3 downto 0);
        spw_si : in std_logic_vector(3 downto 0);
        spw_do : out std_logic_vector(3 downto 0);
        spw_so : out std_logic_vector(3 downto 0)
    );
end router_implementation;

architecture Behavioral of router_implementation is
    signal clk_ibufg : std_logic;
    signal s_clk_toggle : std_logic;
    type clkdivstates is (S_Mode1, S_Mode2);
    signal clkdivstate : clkdivstates := S_Mode1;
    
    signal clk : std_logic;
begin

    -- Differential input clock buffer.
    bufgds: IBUFDS port map (I => SYSCLK_P, IB => SYSCLK_N, O => clk_ibufg); -- eventuell auch IBUFGDS, mal schauen ob Fehler auftreten

    -- Creates 100 MHz clock.
    BUFGCE_inst : BUFGCE
    port map (O => clk, CE => s_clk_toggle, I => clk_ibufg);
    -- Toggles enable signal for BUFGCE every two cycles of input clk to divide by 2.
    process(clk_ibufg)
    begin
        if rising_edge(clk_ibufg) then
            case clkdivstate is
                when S_Mode1 =>
                    clkdivstate <= S_Mode2;
                
                when S_Mode2 =>
                    s_clk_toggle <= not s_clk_toggle;
                    clkdivstate <= S_Mode1;
            end case;
        end if;
    end process;

    RouterImpl : spwrouter
        generic map (
            numports => 3,
            sysfreq => 100.0e6,
            txclkfreq => 100.0e6,
            rx_impl => (others => impl_fast),
            tx_impl => (others => impl_fast)
        )
        port map (
            clk => clk,
            rxclk => clk,
            txclk => clk,
            rst => rst,
            started => open,
            connecting => open,
            running => open,
            errdisc => open,
            errpar => open,
            erresc => open,
            errcred => open,
            spw_di => spw_di,
            spw_si => spw_si,
            spw_do => spw_do,
            spw_so => spw_so
        );
end Behavioral;
