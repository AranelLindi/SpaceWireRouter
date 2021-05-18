----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer, Student
-- 
-- Create Date: 17.05.2021 23:02:41
-- Design Name: Clock Recovery Front-End Module for SpaceWire Light IP Core
-- Module Name: spwrecvfront_clkrec
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: 
-- Tool Versions: made for SpW Light IP Core Version from 05.12.2018
-- Description: extracts a clock pulse from the Data-Strobe signals of a SpaceWire
-- connection (clock recovery) and uses it to decode the data input bits and forwards them
-- to the receiver module of the IP Core.
-- Dependencies: SpaceWire Light IP Core from https://opencores.org/projects/spacewire_light
-- 
-- Revision:
-- Revision 0.01 - File Created; not yet tested - behavioral simulation was fine
-- Additional Comments: (Only basic functionality implemented so far.) 
-- 18.05.2021 - Begin to migrate design to IP, not yet completed!
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spwrecvfront_clkrec is
    generic (
        -- Width of booth shift registers. Should be selected depending on the data transmission 
        -- frequency to ensure synchronization and to avoid metastability. (Default Value: 2)
        REGWIDTH: integer range 1 to 3 := 2
        );
    port (
        --clk: out std_logic; -- debug clk signal, is not used in final version!!
        
        -- High to enable receiver; low to disable and reset receiver
        rxen:   in std_logic;
        
        -- High if there has been recent activity on the input lines
        inact:  out std_logic;
        
        -- High if inbits contains a valid received bit.
        -- If inbvalid='1', the application must sample inbits on
        -- the rising edge of clk
        inbvalid:   out std_logic;
        
                
        -- Data In signal from SpaceWire bus
        spw_di: in std_logic;
        
        -- Strobe In signal from SpaceWire bus.
        spw_si: in std_logic;
        
        inbits: out std_logic_vector(0 downto 0)
       );
end spwrecvfront_clkrec;

architecture spwrecvfront_clkrec_arch of spwrecvfront_clkrec is
    -- additional handling of input signals
    signal s_spw_di: std_ulogic;
    signal s_spw_si: std_ulogic;

    -- recovered clock pulse
    signal recclk: std_ulogic;

    -- flipflops to build shift registers with REGWIDTH-Width
    -- handles falling-edges of recclk:
    signal FF0: std_ulogic_vector(0 downto 0);
    -- handles rising-edges of recclk:
    signal FF: std_ulogic_vector((REGWIDTH-2) downto 0); -- conntected with FF0!
    signal FR: std_ulogic_vector((REGWIDTH-1) downto 0);
   
   
begin
    -- sample input signal
    s_spw_di <= spw_di;
    s_spw_si <= spw_si;

    -- generate data-strobe clk signal
    recclk <= s_spw_di xor s_spw_si;
  
    -- ## debug
    --clk <= recclk; -- debug
    -- ## end debug
 
    process(recclk) is
        begin
            -- STRUCTURE: two parallel shift registers: one path for rising edges,
            -- one for falling edges. The first flip-flop of the "falling" path is
            -- activated by falling edge of recclk. ALL other registers pass their 
            -- data on rising edge.
            if rising_edge(recclk) then
                -- assignment of other shift registers for "rising"-path                                             
                FR(0) <= s_spw_di;
                for i in 0 to (REGWIDTH-2) loop
                    FR(i+1) <= FR(i);
                end loop;
                  
                -- precompiled statement: generic creation and assignment of registers for "falling"-path 
                generic_connectionI: if (REGWIDTH > 1) then
                    FF(0) <= FF0(0);
                                        
                    for i in 0 to (REGWIDTH-3) loop
                        FF(i+1) <= FF(i);
                    end loop;
                end if;
                                
            end if;
            
            if falling_edge(recclk) then
                -- assignment for the one flip-flop for falling-edges
                FF0(0) <= s_spw_di;

            end if;            
            
--  WAR HIER VORHER AKTIV, AUSGELAGERT IN EIGENEN PROZESS
--            -- returns data bits alternately from both path depending on recclk
--            multiplexer: if recclk='0' then
--                -- returns bit from "rising"-path
--                data(0) <= FR(REGWIDTH-1);
--            else -- if recclk='1' then / (else works also)
--                -- returns bit from "falling"-path
                
--                -- precompiled statement for correct assignment of the "falling"-path
--                generic_connectionII: if (REGWIDTH > 1) then
--                    data(0) <= FF(REGWIDTH-2);
--                else
--                    data(0) <= FF0(0);
--                end if;
--            end if;

    end process;
    
    process(recclk)
    begin
        -- returns data bits alternately from both path depending on recclk
            multiplexer: if recclk='0' then
                -- returns bit from "rising"-path
                inbits(0) <= FR(REGWIDTH-1);
            else -- if recclk='1' then / (else works also)
                -- returns bit from "falling"-path
                
                -- precompiled statement for correct assignment of the "falling"-path
                generic_connectionII: if (REGWIDTH > 1) then
                    inbits(0) <= FF(REGWIDTH-2);
                else
                    inbits(0) <= FF0(0);
                end if;
            end if;                
    end process;

-- NUR ZU TESTZWECKEN EINGEBAUT, BRACHTE KEINE VERBESSERUNG!
--data(0) <= FR(REGWIDTH-1) when recclk = '1' else
--           FF(REGWIDTH-2) when recclk = '0' and REGWIDTH > 1 else
--           FF0(0) when recclk = '0' and REGWIDTH = 0;


end spwrecvfront_clkrec_arch;