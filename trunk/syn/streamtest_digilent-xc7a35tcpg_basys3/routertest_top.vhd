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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.spwpkg.all;
use work.spwrouterpkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity routertest_top is
    port (
        -- System clock.
        clk : in std_logic;
        
        -- Receiver sample clock (only for impl_fast).
        rxclk : in std_logic;
        
        -- Transmit clock (only for impl_fast).
        txclk : in std_logic;
        
        -- Router reset signal.
        rst: in std_logic;
        
        -- Data In signals from SpaceWire bus.
        spw_di : in std_logic_vector(2 downto 0);
        
        -- Strobe In signals from SpaceWire bus.
        spw_si : in std_logic_vector(2 downto 0);
        
        -- Data out signals from SpaceWire bus.
        spw_do : out std_logic_vector(2 downto 0);
        
        -- Strobe Out signals from SpaceWire bus.
        spw_so: out std_logic_vector(2 downto 0)
    );
end routertest_top;

architecture routertest_top_arch of routertest_top is

begin
    router : spwrouter
    Generic map (
        numports => 2,
        sysfreq => 20.0e6,
        txclkfreq => 0.0,
        rx_impl => (others => impl_fast),
        tx_impl => (others => impl_fast)
    )
    port map (
        clk => clk,
        rxclk => clk,
        txclk => clk,
        rst => rst,
        started => open,
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

end routertest_top_arch;