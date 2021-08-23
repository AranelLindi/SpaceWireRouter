----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 23.08.2021 15:52
-- Design Name: SpaceWire Routertest
-- Module Name: spwroutertest
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--
-- Dependencies: spwpkg, spwrouterpkg
-- 
-- Revision:
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.spwpkg.all;
use work.spwrouterpkg.all;


entity routertest is
    generic (
        -- Number of SpaceWire ports.
        numports : integer range 0 to 31;

        -- System clock frequency in Hz.
        sysfreq : real;

        -- txclk frequency in Hz (if tximpl = impl_fast)
        txclkfreq : real

        -- 2-log of division factor from system clock freq to timecode freq.
        tickdiv: integer range 12 to 24 := 20
    );
    port (
        -- System clock.
        clk: in std_logic;

        -- Receiver sample clock (only for impl_fast)
        rxclk : in std_logic;

        -- Transmit clock (only for impl_fast)
        txclk: in std_logic;

        -- Router reset signal.
        rst : in std_logic;

        -- Selection of receiver front-end implementation.
        rx_impl : in rximpl_array(numports downto 0);

        -- Selection of transmitter implementation.
        tx_impl: in tximpl_array(numports downto 0);

        -- Enable sending test patterns to spwstream.
        senddata: in std_logic;

        -- Enable sending time codes to spwstream.
        sendtick: in std_logic;

        -- Corresponding bit is High if the port is in started state.
        started: out std_logic_vector(numports downto 0);

        -- Corresponding bit is High if the port is in connecting state.
        connecting: out std_logic_vector(numports downto 0);

        -- Corresponding bit is High if the port is in running state.
        running : out std_logic_vector(numports downto 0);

        -- High if the corresponding port has a disconnect error.
        errpar : out std_logic_vector(numports downto 0);

        -- High if the corresponding port detected an invalid escape sequence.
        erresc : out std_logic_vector(numports downto 0);

        -- High if the corresponding port detected a credit error.
        errcred: out std_logic_vector(numports downto 0);

        -- Data In signals from SpaceWire bus.
        spw_di : in std_logic_vector(numports downto 0);

        -- Strobe In signals from SpaceWire bus.
        spw_so : out std_logic_vector(numports downto 0);

        -- Data Out signals from SpaceWire bus.
        spw_do : out std_logic_vector(numports downto 0);

        -- Strobe Out signals from SpaceWire bus.
        spw_so: out std_logic_vector(numports downto 0)
    );
end routertest;

architecture routertest_arch of routertest is
    -- Update 16-bit maximum length LFSR by 8 steps
    function lfsr16(x: in std_logic_vector) return std_logic_vector is
        variable y: std_logic_vector(15 downto 0);
    begin
        -- poly = x^16 + x^14 + x^13 + x^11 +1
        -- tap positions = x(0), x(2), x(3), x(5)
        y(7 downto 0) := x(15 downto 8);
        y(15 downto 8) := x(7 downto 0) xor x(9 downto 2) xor x(10 downto 3) xor x(12 downto 5);
        return y;
    end function;


    -- Sending side state.
    type states is (
        S_Idle,
        S_Prepare,
        S_Data,
        S_Clean
    );
    
    signal state : states := S_Idle;
begin
    process(clk)
        -- data/strobe coding.
        signal ds : std_logic := '0';

        
    begin
        if rising_edge(clk) then
            case state is
                when S_Idle =>
                    -- send data nulls on all spw_di.
                    spw_di <= (others => '0');

                    -- strobe is sent accordingly adapted.
                    if ds = '1' then
                        spw_si <= (others => '1');
                    else   
                        spw_si <= (others => '0');
                    end if;
                    ds <= not ds;

                when S_Prepare => 
                    
            end case;
        end if;
    end process;
end routertest_arch;