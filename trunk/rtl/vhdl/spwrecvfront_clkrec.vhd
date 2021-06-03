----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 30.05.2021 13:16
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity spwrecvfront_clkrec is
    generic (
            WIDTH: integer range 1 to 3 := 2
       );
    Port (  
            -- System clock.
            clk     :   in  std_logic;
            
            -- Data In signal from SpaceWire bus.
            spw_di  :   in  std_logic;
            
            -- Strobe In signal from SpaceWire bus.
            spw_si  :   in  std_logic;
            
            -- High to enable receiver; low to disable and reset receiver
            rxen    :   in  std_logic;
            
            -- High if there has been recent activity on the input lines.
            inact   :   out std_logic;
            
            -- High if inbits contains a valid received bit.
            -- If inbvalid='1', the application must sample inbits on
            -- the rising edge of clk.
            inbvalid:   out std_logic;
            
            -- Received bit.
            inbits  :   out std_logic_vector(0 downto 0)
        );        
end spwrecvfront_clkrec;

architecture spwrecvfront_clkrec_arch of spwrecvfront_clkrec is
    -- recovered clock signal.
    signal recclk: std_ulogic;
    
    -- asynchronous phased switching...
    -- ... for rising edges.
    --  Latch 1: (Equal)
    signal ff_EQ_data: std_ulogic;
    -- Set
    signal s_EQ_set: std_ulogic;
    -- Reset
    signal s_EQ_reset: std_ulogic;
    
    -- ... for falling edges.
    --  Latch 2: (Unequal)
    signal ff_UEQ_data: std_ulogic;
    -- Set
    signal s_UEQ_set: std_ulogic;
    -- Reset
    signal s_UEQ_reset: std_ulogic;

    -- Data In - shift registers...
    -- ... for rising edges
    signal ff_rising_data: std_ulogic_vector((WIDTH-1) downto 0);
    
    -- ... for falling edges
    --  One ff is activated on falling edge ...
    signal ff_falling_data_0: std_ulogic;
    -- ... rest on rising edge
    signal ff_falling_data: std_ulogic_vector((WIDTH-2) downto 0);
    
    -- output register (receiver signal)
    signal s_inbvalid: std_ulogic;
begin

    -- Clock recovery process.
    Clock: recclk <= spw_di xor spw_si;
    
    -- Drive outputs
    inact <= s_inbvalid;
    inbvalid <= s_inbvalid;   
     
    -- Latch 1: Data == Strobe
    s_EQ_set <= '1' when (spw_di = '1' and spw_si = '1') else '0';
    s_EQ_reset <= '1' when (spw_di = '0' and spw_si = '0') else '0';
    Latch1: process(s_EQ_set, s_EQ_reset) -- asynchrone phasengesteuerte Schaltung
        begin
            if (s_EQ_reset = '1') then
                -- Reset
                ff_EQ_data <= '0';
                
            elsif (s_EQ_set = '1') then
                -- Set
                ff_EQ_data <= '1';
                
            end if;
    end process;
    
    -- Latch 2: Data != Strobe
    s_UEQ_set <= '1' when (spw_di = '1' and spw_si = '0') else '0';
    s_UEQ_reset <= '1' when (spw_di = '0' and spw_si = '1') else '0';
    Latch2: process(s_UEQ_set, s_UEQ_reset)
        begin
            if (s_UEQ_reset = '1') then
                -- Reset
                ff_UEQ_data <= '0';
                
            elsif (s_UEQ_set = '1') then
                -- Set
                ff_UEQ_data <= '1';
                
            end if;
    end process;
    
    -- Validates clock recovery signal for receiver
    process(clk)
        variable sw: boolean;
    begin
        if rising_edge(clk) then
            if sw = true then
                if recclk = '1' then
                    sw := not sw;
                    if rxen = '1' then
                        s_inbvalid <= '1';
                    end if;
                else
                    s_inbvalid <= '0';
                end if;
            elsif sw = false then
                if recclk = '0' then
                    sw := not sw;
                    if rxen = '1' then
                        s_inbvalid <= '1';
                    end if;
                else
                    s_inbvalid <= '0';
                end if;
            end if;
        end if;
    end process;
    
    -- Drives shift registers on rising clock edge.
    ClkRecRisingEdge: process(recclk)
        begin        
            if rising_edge(recclk) then                           
                -- 
                ff_rising_data(0) <= ff_EQ_data;
                for i in 0 to (WIDTH-2) loop
                    ff_rising_data(i+1) <= ff_rising_data(i);
                end loop;
                
                -- 
                if (WIDTH > 1) then -- (pre-compiled statement)
                    ff_falling_data(0) <= ff_falling_data_0;
                    
                    for i in 0 to (WIDTH-3) loop
                        ff_falling_data(i+1) <= ff_falling_data(i);
                    end loop;
                    
                end if;
                
            end if;
    end process;
    
    -- Drives shift registers on falling clock edge.
    ClkRecFallingEdge: process(recclk)
    begin
        if falling_edge(recclk) then       
            ff_falling_data_0 <= ff_UEQ_data;
            
        end if;    
    end process;
    
    -- Taks bits from both paths alternately, depending on clock signal.
    ClkRecMultiplexer: process(recclk)
    begin
        if (recclk = '0') then
            inbits(0) <= ff_rising_data(WIDTH-1);
            
        elsif (recclk = '1') then
            if (WIDTH > 1) then -- (pre-compiled statement)
                inbits(0) <= ff_falling_data(WIDTH-2);
            else
                inbits(0) <= ff_falling_data_0;
            end if;
            
        end if;
    end process;
end spwrecvfront_clkrec_arch;