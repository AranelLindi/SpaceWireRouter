LIBRARY IEEE;
USE IEEE.Std_logic_1164.ALL;
USE IEEE.Numeric_Std.ALL;
USE work.spwpkg.ALL;
USE work.spwrouterpkg.ALL;

ENTITY spwrouterport_tb_2 IS
END;

ARCHITECTURE spwrouterport_tb_2_arch OF spwrouterport_tb_2 IS
    -- constants.
    CONSTANT numports : INTEGER := 2;
    CONSTANT blen : INTEGER := 1;
    CONSTANT sysfreq : real := 100.0e6;
    CONSTANT rximpl : spw_implementation_type_rec := impl_fast;
    CONSTANT tximpl : spw_implementation_type_xmit := impl_fast;

    COMPONENT spwrouterport
        GENERIC (
            numports : INTEGER RANGE 0 TO 31;
            blen : INTEGER RANGE 0 TO 5;
            sysfreq : real;
            txclkfreq : real := 0.0;
            rximpl : spw_implementation_type_rec;
            rxchunk : INTEGER RANGE 1 TO 4 := 1;
            WIDTH : INTEGER RANGE 1 TO 3 := 2;
            tximpl : spw_implementation_type_xmit;
            rxfifosize_bits : INTEGER RANGE 6 TO 14 := 11;
            txfifosize_bits : INTEGER RANGE 2 TO 14 := 11
        );
        PORT (
            clk : IN STD_LOGIC;
            rxclk : IN STD_LOGIC;
            txclk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            autostart : IN STD_LOGIC;
            linkstart : IN STD_LOGIC;
            linkdis : IN STD_LOGIC;
            txdivcnt : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            tick_in : IN STD_LOGIC;
            time_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            txdata : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
            txrdy : OUT STD_LOGIC;
            txhalff : OUT STD_LOGIC;
            tick_out : OUT STD_LOGIC;
            time_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            rxhalff : OUT STD_LOGIC;
            rxdata : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
            started : OUT STD_LOGIC;
            connecting : OUT STD_LOGIC;
            running : OUT STD_LOGIC;
            errdisc : OUT STD_LOGIC;
            errpar : OUT STD_LOGIC;
            erresc : OUT STD_LOGIC;
            errcred : OUT STD_LOGIC;
            spw_di : IN STD_LOGIC;
            spw_si : IN STD_LOGIC;
            spw_do : OUT STD_LOGIC;
            spw_so : OUT STD_LOGIC;
            linkstatus : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
            request_out : OUT STD_LOGIC;
            request_in : IN STD_LOGIC;
            destination_port : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            arb_granted : IN STD_LOGIC;
            strobe_out : OUT STD_LOGIC;
            strobe_in : IN STD_LOGIC;
            ready_in : IN STD_LOGIC;
            bus_address : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            bus_data_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            bus_dByte : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            bus_readwrite : OUT STD_LOGIC;
            bus_strobe : OUT STD_LOGIC;
            bus_request : OUT STD_LOGIC;
            bus_ack_in : IN STD_LOGIC;
            portstatus : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            portcontrol : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL clk : STD_LOGIC;
    SIGNAL rst : STD_LOGIC;
    SIGNAL autostart : STD_LOGIC;
    SIGNAL linkstart : STD_LOGIC;
    SIGNAL linkdis : STD_LOGIC;
    SIGNAL txdivcnt : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL tick_in : STD_LOGIC := '0';
    SIGNAL time_in : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL txdata : STD_LOGIC_VECTOR(8 DOWNTO 0);
    SIGNAL txrdy : STD_LOGIC;
    SIGNAL txhalff : STD_LOGIC;
    SIGNAL tick_out : STD_LOGIC;
    SIGNAL time_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL rxhalff : STD_LOGIC;
    SIGNAL rxdata : STD_LOGIC_VECTOR(8 DOWNTO 0);
    SIGNAL started : STD_LOGIC;
    SIGNAL connecting : STD_LOGIC;
    SIGNAL running : STD_LOGIC;
    SIGNAL errdisc : STD_LOGIC;
    SIGNAL errpar : STD_LOGIC;
    SIGNAL erresc : STD_LOGIC;
    SIGNAL errcred : STD_LOGIC;
    --    SIGNAL spw_di : STD_LOGIC;
    --    SIGNAL spw_si : STD_LOGIC;
    SIGNAL spw_do : STD_LOGIC;
    SIGNAL spw_so : STD_LOGIC;
    SIGNAL linkstatus : STD_LOGIC_VECTOR(numports DOWNTO 0) := (OTHERS => '1');
    SIGNAL request_out : STD_LOGIC;
    SIGNAL request_in : STD_LOGIC := '0';
    SIGNAL destination_port : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL arb_granted : STD_LOGIC := '0';
    SIGNAL strobe_out : STD_LOGIC;
    SIGNAL strobe_in : STD_LOGIC := '0';
    SIGNAL ready_in : STD_LOGIC := '0';
    SIGNAL bus_address : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL bus_data_in : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL bus_dByte : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL bus_readwrite : STD_LOGIC;
    SIGNAL bus_strobe : STD_LOGIC;
    SIGNAL bus_request : STD_LOGIC;
    SIGNAL bus_ack_in : STD_LOGIC := '0';
    SIGNAL portstatus : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL portcontrol : STD_LOGIC_VECTOR(31 DOWNTO 0);

    -- simulation specific signals.
    CONSTANT clock_period : TIME := 10 ns;
BEGIN
    -- design under test.
    dut : spwrouterport GENERIC MAP(
        numports => numports,
        blen => blen,
        sysfreq => sysfreq,
        txclkfreq => sysfreq,
        rximpl => rximpl,
        tximpl => tximpl)
    PORT MAP(
        clk => clk,
        rxclk => clk,
        txclk => clk,
        rst => rst,
        autostart => autostart,
        linkstart => linkstart,
        linkdis => linkdis,
        txdivcnt => txdivcnt,
        tick_in => tick_in,
        time_in => time_in,
        txdata => txdata,
        txrdy => txrdy,
        txhalff => txhalff,
        tick_out => tick_out,
        time_out => time_out,
        rxhalff => rxhalff,
        rxdata => rxdata,
        started => started,
        connecting => connecting,
        running => running,
        errdisc => errdisc,
        errpar => errpar,
        erresc => erresc,
        errcred => errcred,
        spw_di => spw_do,
        spw_si => spw_so,
        spw_do => spw_do,
        spw_so => spw_so,
        linkstatus => linkstatus,
        request_out => request_out,
        request_in => request_in,
        destination_port => destination_port,
        arb_granted => arb_granted,
        strobe_out => strobe_out,
        strobe_in => strobe_in,
        ready_in => ready_in,
        bus_address => bus_address,
        bus_data_in => bus_data_in,
        bus_dByte => bus_dByte,
        bus_readwrite => bus_readwrite,
        bus_strobe => bus_strobe,
        bus_request => bus_request,
        bus_ack_in => bus_ack_in,
        portstatus => portstatus,
        portcontrol => portcontrol);

    stimulus : PROCESS
    BEGIN
        -- Put initialisation code here
        rst <= '1', '0' AFTER 100 ns;
        WAIT FOR 100 ns;

        -- Perform port initialization.
        txdivcnt <= x"01";
        autostart <= '1';
        linkstart <= '1';
        linkdis <= '0';

        WAIT FOR 80 us;

        -- Link should now run!

        -- Send normal packet to test functionality.

        WAIT UNTIL rising_edge(clk);
        strobe_in <= '1';
        request_in <= '1'; -- Right signal?
        txdata <= "0" & x"01"; -- ADDRESS: 0x01
        WAIT FOR clock_period;
        txdata <= "0" & x"f0"; -- CARGO
        WAIT FOR clock_period;
        txdata <= "0" & x"0f"; -- CARGO
        WAIT FOR clock_period;
        txdata <= "1" & x"00"; -- EOP
        WAIT FOR clock_period;
        request_in <= '0';
        strobe_in <= '0';

        WAIT FOR 5 us;

        -- Now send packet addressed to logical port to test routing table
        WAIT UNTIL rising_edge(clk);
        strobe_in <= '1';
        request_in <= '1'; -- Right signal?
        txdata <= "0" & x"32"; -- ADDRESS: 0x32 (50)
        WAIT FOR clock_period;
        txdata <= "0" & x"f0"; -- CARGO
        WAIT FOR clock_period;
        txdata <= "0" & x"0f"; -- CARGO
        WAIT FOR clock_period;
        txdata <= "1" & x"00"; -- EOP
        WAIT FOR clock_period;
        request_in <= '0';
        strobe_in <= '0';

        WAIT FOR 5 us;

        WAIT;
    END PROCESS;

    -- This process simulates routing table for dut.
    routingtable : PROCESS
    BEGIN
        WAIT UNTIL bus_request = '1';

        bus_data_in <= x"00000002";
        bus_ack_in <= '1';

        WAIT UNTIL bus_request = '0';

        bus_data_in <= (OTHERS => '0');
        bus_ack_in <= '0';

        -- evtl. hier noch wait nötig!
    END PROCESS;
    
    -- This process simulates outside router bus for dut.
    routerbus : process
    begin
        wait until request_out = '1';
        arb_granted <= '1';
        wait for clock_period;
        arb_granted <= '0';
    end process;

    clocking : PROCESS
    BEGIN
        clk <= '0', '1' AFTER clock_period / 2;
        WAIT FOR clock_period;
    END PROCESS;
END spwrouterport_tb_2_arch;