----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 02.08.2021 21:06
-- Design Name: SpaceWire Router TimeCode Control
-- Module Name: spwrouterttc
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: Allows provision and administration of SpaceWire TimeCodes.
--
-- CAUTION! The assignment is shifted for every std_logic_vector-port that excludes
-- port0 (internal port): Port1 has index 0, Port2 -> 1, etc.
--
-- Dependencies: spwrouterpkg
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
USE work.spwrouterpkg.ALL;

ENTITY spwroutertcc IS
    GENERIC (
        -- Number of SpaceWire ports.
        numports : INTEGER RANGE 0 TO 31
    );
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Asynchronous reset.
        rst : IN STD_LOGIC;

        -- High if coresponding port is running or low when its in another state.
        running : IN STD_LOGIC_VECTOR(numports DOWNTO 0); -- linkUp

        -- Last TimeCode that was received. (To store in register)
        lst_time : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- receiveTimeCode

        -- High if port has enabled TimeCode feature - except port0! 
        -- (Each bit corresponds to one port)
        tc_en : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- portTimeCodeEnable

        -- High if corresponding port requests a TimeCode transmission - except port0!
        tick_out : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- portTickIn

        -- Contains for every port TimeCode to send - except port0!
        time_out : OUT array_t((numports - 1) DOWNTO 0)(7 DOWNTO 0); -- portTimeCodeIn

        -- High if corresponding port received a TimeCode - except port0!
        tick_in : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- portTickOut

        -- Received TimeCodes from all ports - except port0!
        time_in : IN array_t((numports - 1) DOWNTO 0)(7 DOWNTO 0); -- portTimeCodeOut

        -- TimeCode that is sent from Host.
        auto_time_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- autoTimeCodeValue

        -- Transmission interval for automatic TimeCode sending.
        auto_cycle : IN STD_LOGIC_VECTOR(31 DOWNTO 0) -- autoTimeCodeCycleTime
    );
END spwroutertcc;

ARCHITECTURE spwroutertcc_arch OF spwroutertcc IS
    -- Initial values for TimeCodes.
    CONSTANT initTimeCode : STD_LOGIC_VECTOR(5 DOWNTO 0) := "000000";
    CONSTANT initCtrlFlag : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";

    -- TimeCode counter value
    SIGNAL s_tc_counterval : STD_LOGIC_VECTOR(5 DOWNTO 0);

    -- TimeCode control flag
    SIGNAL s_tc_ctrlflag : STD_LOGIC_VECTOR(1 DOWNTO 0);

    -- Specifies which port gets the TimeCode.
    SIGNAL s_ports_out : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

    -- Output registers.
    SIGNAL s_tick_out : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
    SIGNAL s_time_out : array_t((numports - 1) DOWNTO 0)(7 DOWNTO 0);

    -- Counter interval for automatic TimeCode generation.
    -- [max. Interval: (2**32 - 1) * (1 / clk_frequency)]
    SIGNAL s_cycle_counter : STD_LOGIC_VECTOR(31 DOWNTO 0);

    -- High for one clock cycle if automatic interval TimeCode
    -- generation shall be active. Such TimeCode is sent to each port.
    SIGNAL s_auto_enable : STD_LOGIC;

    -- Counts with clock cycle. As soon as interval limit is reached,
    -- counter is reset and TimeCode will generated. (s_auto_enable is High)
    SIGNAL s_auto_tc_counterval : STD_LOGIC_VECTOR(5 DOWNTO 0);

    -- Intermediate signals
    SIGNAL s_conc_tc : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL s_conc_auto_tc : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
    -- Concatenation of TimeCode control flag and counter value.
    s_conc_auto_tc <= "00" & s_auto_tc_counterval;
    s_conc_tc <= s_tc_ctrlflag & s_tc_counterval;

    -- Drive other outputs.
    lst_time <= s_conc_tc;
    tick_out <= s_tick_out;
    time_out <= s_time_out;
    auto_time_out <= s_conc_auto_tc;

    -- Selection which port will receive TimeCode.
    PortTick : FOR i IN 0 TO (numports - 1) GENERATE
        s_tick_out(i) <= s_ports_out(i) WHEN (tc_en(i) = '1' AND running(i) = '1') ELSE
        '0';

        -- vermutlich muss hier s_time_out(i)(7 downto 0) = s_conc_tc stehen? Kucken ob Fehler auftreten!
        s_time_out(i)(7 DOWNTO 0) <= s_conc_tc WHEN (auto_cycle = x"00000000") ELSE
        s_conc_auto_tc;

    END GENERATE PortTick;

    -- TimeCode generation:
    -- Generates both requested and automatic (Host) TimeCodes
    -- and controls which port receives it.
    TCGenerate : PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN -- reset
            s_tc_counterval <= initTimeCode;
            s_tc_ctrlflag <= initCtrlFlag;
            s_ports_out <= (OTHERS => '0');

        ELSIF rising_edge(clk) THEN
            -- In case of automatic TimeCode generation: every
            -- port will get the new TC. (If (s_auto_enable = '0'),
            -- counter has not yet reached interval limit in auto_cylce.)
            IF (auto_cycle /= x"00000000") THEN
                IF (s_auto_enable = '1') THEN
                    s_ports_out <= (OTHERS => '1');

                ELSE
                    s_ports_out <= (OTHERS => '0');

                END IF;
            ELSE
                -- TimeCode Target
                FOR i IN (numports - 1) DOWNTO 0 LOOP
                    IF (tick_in(i) = '1') THEN
                        IF (time_in(i) = (s_tc_counterval + 1)) THEN -- hier steht im original: port1TimeCodeOut(5 downto 0) = counterValuePlus1 ?!
                            s_ports_out <= (i => '0', OTHERS => '1'); -- potenzielle Fehlerquelle! Liegt vermutlich daran, dass eingangsport von numport downto 1 gemacht wurde! Falls hier fehler auftreten, dann auf downto 0 ändern und i-1 machen!

                        END IF;
                    END IF;

                    -- Update TimeCode.
                    s_tc_counterval <= time_in(i)(5 DOWNTO 0); -- potenzielle Fehlerquelle!
                    s_tc_ctrlflag <= time_in(i)(7 DOWNTO 6);

                END LOOP;
            END IF;
        END IF;
    END PROCESS TCGenerate;

    -- TimeCode Host:
    -- Outputs signal at in register specified interval to generate new
    -- time code 
    TCHost : PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN -- reset
            s_auto_tc_counterval <= initTimeCode;
            s_cycle_counter <= (OTHERS => '0');
            s_auto_enable <= '0';

        ELSIF rising_edge(clk) THEN
            -- Only sends TimeCodes periodically if register is unequal to zero.
            IF (auto_cycle /= x"00000000") THEN
                IF (s_cycle_counter > auto_cycle) THEN
                    s_cycle_counter <= (OTHERS => '0');
                    s_auto_enable <= '1';
                    s_auto_tc_counterval <= (s_auto_tc_counterval + 1);

                ELSE
                    s_cycle_counter <= (s_cycle_counter + 1);
                    s_auto_enable <= '0';

                END IF;
            ELSE
                s_auto_enable <= '0';
                s_cycle_counter <= (OTHERS => '0');

            END IF;
        END IF;
    END PROCESS TCHost;
END spwroutertcc_arch;