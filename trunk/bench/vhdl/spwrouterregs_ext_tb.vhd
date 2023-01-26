----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/09/2022 11:52:38 AM
-- Design Name: 
-- Module Name: spwrouterregs_ext_tb - spwrouterregs_ext_tb_arch
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity spwrouterregs_ext_tb is
    --  Port ( );
end spwrouterregs_ext_tb;

architecture spwrouterregs_ext_tb_arch of spwrouterregs_ext_tb is
    -- constants
    constant numports : integer := 3;

    component spwrouterregs_extended
        generic (
            numports : integer range 1 to 32
        );
        Port (
            clk : in STD_LOGIC;
            rst : in STD_LOGIC;
            readTable : out std_logic_vector(31 downto 0);
            addrTable : in std_logic_vector(31 downto 0);
            ackTable : out std_logic;
            strobeTable : in std_logic;
            cycleTable : in std_logic;
            portstatus : in array_t(0 to (numports-1))(31 downto 0);
            portcontrol : out array_t(0 to (numports-1))(31 downto 0);
            running : in std_logic_vector(31 downto 0);
            watchcycle : out std_logic_vector(31 downto 0);
            timecycle : out std_logic_vector(31 downto 0);
            lasttime : in std_logic_vector(7 downto 0);
            lastautotime : in std_logic_vector(7 downto 0);
            clka : in std_logic;
            addra : in std_logic_vector(31 downto 0);
            dina : in std_logic_vector(31 downto 0);
            douta : out std_logic_vector(31 downto 0);
            ena : in std_logic;
            rsta : in std_logic;
            wea : in std_logic_vector(3 downto 0)
        );
    end component;

    signal clk: STD_LOGIC;
    signal rst: STD_LOGIC;
    signal readTable: std_logic_vector(31 downto 0);
    signal addrTable: std_logic_vector(31 downto 0);
    signal ackTable: std_logic;
    signal strobeTable: std_logic;
    signal cycleTable: std_logic;
    signal portstatus: array_t(0 to (numports-1))(31 downto 0);
    signal portcontrol: array_t(0 to (numports-1))(31 downto 0);
    signal running: std_logic_vector(31 downto 0);
    signal watchcycle: std_logic_vector(31 downto 0);
    signal timecycle: std_logic_vector(31 downto 0);
    signal lasttime: std_logic_vector(7 downto 0);
    signal lastautotime: std_logic_vector(7 downto 0);
    signal clka: std_logic;
    signal addra: std_logic_vector(31 downto 0);
    signal dina: std_logic_vector(31 downto 0);
    signal douta: std_logic_vector(31 downto 0);
    signal ena: std_logic;
    signal rsta: std_logic;
    signal wea: std_logic_vector(3 downto 0) ;
    signal states : spwroutertablestates;

    constant clock_period_logic : time := 10 ns;
    constant clock_period_bus: time := 20 ns;
begin

    -- Design under test.
    dut: spwrouterregs_extended generic map ( numports     =>  numports)
        port map ( clk          => clk,
                 rst          => rst,
                 readTable    => readTable,
                 addrTable    => addrTable,
                 ackTable     => ackTable,
                 strobeTable  => strobeTable,
                 cycleTable   => cycleTable,
                 portstatus   => portstatus,
                 portcontrol  => portcontrol,
                 running      => running,
                 watchcycle   => watchcycle,
                 timecycle    => timecycle,
                 lasttime     => lasttime,
                 lastautotime => lastautotime,
                 clka         => clka,
                 addra        => addra,
                 dina         => dina,
                 douta        => douta,
                 ena          => ena,
                 rsta         => rsta,
                 wea          => wea);

    -- Simulation on router side.
    stimulus_logic: process
    begin
        -- Put initialisation code here...
        rst <= '1', '0' after 2 * clock_period_logic;

        wait until rising_edge(clk);

        addrTable <= (others => '0');
        strobeTable <= '0';
        cycleTable <= '0';
        portstatus <= (others => (others => '0'));
        running <= (others => '0');
        lasttime <= (others => '0');
        lastautotime <= (others => '0');

        wait for 2 us;
        wait until rising_edge(clk);

        -- Try to get entry from routing table (line 50) (should be 0x2)
        addrTable <= "00000000000000000000000011001000";
        strobeTable <= '1';
        cycleTable <= '1';

        wait for 1 us;
        wait until rising_edge(clk);

        addrTable <= (others => '0');
        strobeTable <= '0';
        cycleTable <= '0';

        wait;
    end process;


    -- Simulation on bus side.
    stimulus_bus: process
    begin
        -- Put initialisation code here...
        rsta <= '1', '0' after 5 * clock_period_bus;

        addra <= (others => '0');
        dina <= (others => '0');
        ena <= '0';
        rsta <= '0';
        wea <= (others => '0');

        wait for 1 us;
        wait until rising_edge(clka);

        -- Write value into routing table (entry 50)
        addra <= x"000000C8";
        dina <= x"00000002";
        ena <= '1';
        wea <= (others => '1');

        wait for 1 us;
        wait until rising_edge(clka);

        -- Write value into routing table (entry 100)
        addra <= std_logic_vector(to_unsigned(400, addra'length));
        dina <= x"00000004";
        ena <= '1';
        wea <= (others => '1');

        wait for 1 us;
        wait until rising_edge(clka);

        addra <= (others => '0');
        dina <= (others => '0');
        ena <= '0';
        wea <= (others => '0');

        wait;
    end process;

    clocking_bus: process
    begin
        clka <= '0', '1' after clock_period_bus / 2;
        wait for clock_period_bus;
    end process;

    clocking_logic: process
    begin
        clk <= '0', '1' after clock_period_logic / 2;
        wait for clock_period_logic;
    end process;
end spwrouterregs_ext_tb_arch;
