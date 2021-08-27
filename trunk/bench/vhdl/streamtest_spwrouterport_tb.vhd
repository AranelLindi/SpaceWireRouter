----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 27.08.2021 13:03
-- Design Name: SpaceWire Router Port Testbench
-- Module Name: streamtest_spwrouterport
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: ...
--
-- Dependencies: none
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE std.textio.ALL;
USE work.spwpkg.ALL;

ENTITY streamtest_spwrouterport_tb IS
END ENTITY;

ARCHITECTURE streamtest_spwrouterport_tb_arch OF streamtest_spwrouterport_tb IS

    -- Parameters.
    CONSTANT sys_clock_freq : real := 20.0e6;

    COMPONENT streamtest_spwrouterport IS
        GENERIC (
            numports : integer range 0 to 31;
            blen : integer range 0 to 4;
            pnum : integer range 0 to 31;
            sysfreq : real;
            txclkfreq : real;
            tickdiv : INTEGER RANGE 12 TO 24 := 20;
            rximpl : spw_implementation_type_rec := impl_generic;
            rxchunk : INTEGER RANGE 1 TO 4 := 1;
            tximpl : spw_implementation_type_xmit := impl_generic;
            rxfifosize_bits : INTEGER RANGE 6 TO 14 := 11;
            txfifosize_bits : INTEGER RANGE 2 TO 14 := 11;
            WIDTH : INTEGER RANGE 1 TO 3 -- added: SL
        );
        PORT (
            clk : IN STD_LOGIC;
            rxclk : IN STD_LOGIC;
            txclk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            linkstart : IN STD_LOGIC;
            autostart : IN STD_LOGIC;
            linkdisable : IN STD_LOGIC;
            senddata : IN STD_LOGIC;
            sendtick : IN STD_LOGIC;
            txdivcnt : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            linkstarted : OUT STD_LOGIC;
            linkconnecting : OUT STD_LOGIC;
            linkrun : OUT STD_LOGIC;
            linkerror : OUT STD_LOGIC;
            gotdata : OUT STD_LOGIC;
            dataerror : OUT STD_LOGIC;
            tickerror : OUT STD_LOGIC;
            spw_di : IN STD_LOGIC;
            spw_si : IN STD_LOGIC;
            spw_do : OUT STD_LOGIC;
            spw_so : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL sys_clock_enable : STD_LOGIC := '0';
    SIGNAL sysclk : STD_LOGIC := '0';
    SIGNAL s_loopback : STD_LOGIC := '0';
    SIGNAL s_nreceived : INTEGER := 0;

    SIGNAL s_rst : STD_LOGIC := '1';
    SIGNAL s_linkstart : STD_LOGIC;
    SIGNAL s_autostart : STD_LOGIC;
    SIGNAL s_linkdisable : STD_LOGIC;
    SIGNAL s_divcnt : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL s_linkrun : STD_LOGIC;
    SIGNAL s_linkerror : STD_LOGIC;
    SIGNAL s_gotdata : STD_LOGIC;
    SIGNAL s_dataerror : STD_LOGIC;
    SIGNAL s_tickerror : STD_LOGIC;
    SIGNAL s_spwdi : STD_LOGIC;
    SIGNAL s_spwsi : STD_LOGIC;
    SIGNAL s_spwdo : STD_LOGIC;
    SIGNAL s_spwso : STD_LOGIC;

BEGIN

    -- streamtest instance
    streamtest_inst : streamtest_spwrouterport
    GENERIC MAP(
        numports => 0,
        blen => 0,
        pnum => 0,
        sysfreq => sys_clock_freq,
        txclkfreq => sys_clock_freq,
        tickdiv => 16,
        rximpl => impl_generic,
        rxchunk => 1,
        tximpl => impl_generic,
        rxfifosize_bits => 9,
        txfifosize_bits => 8,
        WIDTH => 2)
    PORT MAP(
        clk => sysclk,
        rxclk => sysclk,
        txclk => sysclk,
        rst => s_rst,
        linkstart => s_linkstart,
        autostart => s_autostart,
        linkdisable => s_linkdisable,
        senddata => '1',
        sendtick => '1',
        txdivcnt => s_divcnt,
        linkstarted => OPEN,
        linkconnecting => OPEN,
        linkrun => s_linkrun,
        linkerror => s_linkerror,
        gotdata => s_gotdata,
        dataerror => s_dataerror,
        tickerror => s_tickerror,
        spw_di => s_spwdi,
        spw_si => s_spwsi,
        spw_do => s_spwdo,
        spw_so => s_spwso);

    -- Conditional loopback of SpaceWire signals.
    s_spwdi <= s_spwdo WHEN (s_loopback = '1') ELSE
        '0';
    s_spwsi <= s_spwso WHEN (s_loopback = '1') ELSE
        '0';

    -- Generate system clock.
    PROCESS IS
    BEGIN
        IF sys_clock_enable /= '1' THEN
            WAIT UNTIL sys_clock_enable = '1';
        END IF;
        sysclk <= '1';
        WAIT FOR (0.5 sec) / sys_clock_freq;
        sysclk <= '0';
        WAIT FOR (0.5 sec) / sys_clock_freq;
    END PROCESS;

    -- Verify that error indications remain off.
    PROCESS IS
    BEGIN
        WAIT ON s_linkerror, s_dataerror, s_tickerror;
        ASSERT s_dataerror = '0' REPORT "Detected data error";
        ASSERT s_tickerror = '0' REPORT "Detected time code error";
        IF s_loopback = '1' THEN
            ASSERT s_linkerror /= '1' REPORT "Unexpected link error";
        END IF;
    END PROCESS;

    -- Verify that data is received regularly when the link is up.
    PROCESS IS
    BEGIN
        IF s_linkrun = '0' OR s_gotdata = '1' THEN
            WAIT UNTIL s_linkrun = '1' AND s_gotdata = '0';
        END IF;
        WAIT UNTIL s_gotdata = '1' OR s_linkrun = '0' FOR 3 ms;
        IF s_linkrun = '1' THEN
            ASSERT s_gotdata = '1' REPORT "Link running but no data received";
        END IF;
    END PROCESS;

    -- Count number of received characters.
    PROCESS IS
    BEGIN
        WAIT UNTIL rising_edge(sysclk);
        IF s_gotdata = '1' THEN
            s_nreceived <= s_nreceived + 1;
        END IF;
    END PROCESS;

    -- Main process.
    PROCESS IS
        VARIABLE vline : LINE;
    BEGIN
        REPORT "Starting streamtest test bench";

        -- Initialize.
        s_loopback <= '1';
        s_rst <= '1';
        s_linkstart <= '0';
        s_autostart <= '0';
        s_linkdisable <= '0';
        s_divcnt <= "00000001";
        sys_clock_enable <= '1';
        WAIT FOR 1 us;

        -- Test link and data transmission.
        REPORT "Testing txdivcnt = 1";
        s_rst <= '0';
        s_linkstart <= '1';
        WAIT FOR 100 us;
        ASSERT s_linkrun = '1' REPORT "Link failed to start";
        WAIT FOR 50 ms;

        -- Check number of received characters.
        write(vline, STRING'("Received "));
        write(vline, s_nreceived);
        write(vline, STRING'(" characters in 50 ms."));
        writeline(output, vline);
        ASSERT s_nreceived > 24000 REPORT "Too few characters received";

        -- Test switching to different transmission rate.
        REPORT "Testing txdivcnt = 2";
        s_divcnt <= "00000010";
        WAIT FOR 10 ms;
        REPORT "Testing txdivcnt = 3";
        s_divcnt <= "00000011";
        WAIT FOR 10 ms;

        -- Disable and re-enable link.
        REPORT "Testing link disable/re-enable";
        s_linkdisable <= '1';
        s_divcnt <= "00000001";
        WAIT FOR 2 ms;
        s_linkdisable <= '0';
        WAIT FOR 100 us;
        ASSERT s_linkrun = '1' REPORT "Link failed to start after re-enable";
        WAIT FOR 10 ms;

        -- Cut and reconnect loopback wiring.
        REPORT "Testing physical disconnect/reconnect";
        s_loopback <= '0';
        WAIT FOR 2 ms;
        s_loopback <= '1';
        WAIT FOR 100 us;
        ASSERT s_linkrun = '1' REPORT "Link failed to start after reconnect";
        WAIT FOR 10 ms;
        s_loopback <= '0';
        WAIT FOR 2 ms;
        s_loopback <= '1';
        WAIT FOR 100 us;
        ASSERT s_linkrun = '1' REPORT "Link failed to start after reconnect (2)";
        WAIT FOR 10 ms;

        -- Shut down.
        s_rst <= '1';
        WAIT FOR 1 us;
        sys_clock_enable <= '0';

        write(vline, STRING'("Received "));
        write(vline, s_nreceived);
        write(vline, STRING'(" characters."));
        writeline(output, vline);

        REPORT "Done";
        WAIT;
    END PROCESS;

END ARCHITECTURE streamtest_spwrouterport_tb_arch;