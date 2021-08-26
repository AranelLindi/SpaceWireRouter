----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 22.08.2021 23:28
-- Design Name: SpaceWire Router Testbench
-- Module Name: spwrouter_tb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--
-- Dependencies: spwpkg, spwrouterpkg
-- 
-- Revision:
----------------------------------------------------------------------------------

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use work.spwpkg.all;
use work.spwrouterpkg.all;

entity spwrouter_tb is
end;

architecture spwrouter_tb_arch of spwrouter_tb is

  component spwrouter
      GENERIC (
          numports : INTEGER RANGE 0 TO 31;
          sysfreq : real;
          txclkfreq : real;
          rx_impl : rximpl_array(numports DOWNTO 0);
          tx_impl : tximpl_array(numports DOWNTO 0)
      );
      PORT (
          clk : IN STD_LOGIC;
          rxclk : IN STD_LOGIC;
          txclk : IN STD_LOGIC;
          rst : IN STD_LOGIC;
          started : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
          connecting : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
          running : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
          errdisc : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
          errpar : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
          erresc : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
          errcred : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
          spw_di : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
          spw_si : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
          spw_do : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
          spw_so : OUT STD_LOGIC_VECTOR(numports DOWNTO 0)
      );
  end component;

  constant numports : INTEGER RANGE 0 TO 31 := 3; 
 
  signal clk: STD_LOGIC;
  signal rxclk: STD_LOGIC;
  signal txclk: STD_LOGIC;
  signal rst: STD_LOGIC;
  signal rx_impl: rximpl_array(numports DOWNTO 0);
  signal tx_impl: tximpl_array(numports DOWNTO 0);
  signal started: STD_LOGIC_VECTOR(numports DOWNTO 0);
  signal connecting: STD_LOGIC_VECTOR(numports DOWNTO 0);
  signal running: STD_LOGIC_VECTOR(numports DOWNTO 0);
  signal errdisc: STD_LOGIC_VECTOR(numports DOWNTO 0);
  signal errpar: STD_LOGIC_VECTOR(numports DOWNTO 0);
  signal erresc: STD_LOGIC_VECTOR(numports DOWNTO 0);
  signal errcred: STD_LOGIC_VECTOR(numports DOWNTO 0);
  signal spw_di: STD_LOGIC_VECTOR(numports DOWNTO 0);
  signal spw_si: STD_LOGIC_VECTOR(numports DOWNTO 0);
  signal spw_do: STD_LOGIC_VECTOR(numports DOWNTO 0);
  signal spw_so: STD_LOGIC_VECTOR(numports DOWNTO 0) ;

  constant clock_period: time := 100 ns; -- 10 MHz
  signal stop_the_clock: boolean;

begin

  -- design under test.
  dut: spwrouter generic map ( numports   => numports,
                               sysfreq    => 10.0e6,
                               txclkfreq  => 10.0e6,
			       rx_impl => (others => impl_fast),
                               tx_impl => (others => impl_fast))
                    port map ( clk        => clk,
                               rxclk      => rxclk,
                               txclk      => txclk,
                               rst        => rst,
                               started    => started,
                               connecting => connecting,
                               running    => running,
                               errdisc    => errdisc,
                               errpar     => errpar,
                               erresc     => erresc,
                               errcred    => errcred,
                               spw_di     => spw_di,
                               spw_si     => spw_si,
                               spw_do     => spw_do,
                               spw_so     => spw_so );


	spw_di <= (others => '0');

  process(clk)
  	variable strobe_sw: std_logic;
  begin
	if rising_edge(clk) then
		if strobe_sw = '1' then
			spw_si <= (others => ('0' xor strobe_sw));
		else
			spw_si <= (others => '0');
		end if;
		strobe_sw := not strobe_sw;
	end if;
	
  end process;




  stimulus: process
  begin
  	rst <= '1';
	wait for 1 us;
	rst <= '0';
    -- Put initialisation code here


    -- Put test bench stimulus code here

--    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end spwrouter_tb_arch;