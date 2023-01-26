----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 02.08.2021 21:06
-- Design Name: SpaceWire Router - Time Code Control
-- Module Name: spwrouterttc
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA
-- Target Devices: Xilinx FPGAs
-- Tool Versions: -/-
-- Description: Central management of Time Codes within router. Conformance to
-- SpaceWire specification. Also offers option of sending Time Codes periodically,
-- but then no longer reacts to incoming Time Codes.
--
-- Dependencies: spwrouterpkg
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.SPWROUTERPKG.ALL;

ENTITY spwroutertcc IS
    GENERIC (
        -- Number of SpaceWire ports.
        numports : INTEGER RANGE 1 TO 32
    );
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Synchronous reset.
        rst : IN STD_LOGIC;

        -- High if SpaceWire port is in running state or low when its in another state.
        running : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- High if port provides Time Code support. 
        tc_enable : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- Last Time Code that was received (to store in register).
        tc_last : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- High if any port requests a Time Code transmission.
        tick_out : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- High if any port received a Time Code.
        tick_in : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- Containts Time Code to be sent for each SpaceWire port (Control Flag & Counter Value).
        tc_out : OUT array_t((numports - 1) DOWNTO 0)(7 DOWNTO 0);

        -- Received Time Codes from all SpaceWire ports (Control Flag & Counter Value).
        tc_in : IN array_t((numports - 1) DOWNTO 0)(7 DOWNTO 0);

        -- Time Code that is sent from Host (only with automatic generation).
        auto_tc_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- Time interval (auto_interval * clk_period) in which an automatically generated
        -- Time Code should be sent.
        -- Max. time interval 2**32 * clk_period; 0x00000000 disables this process.
        auto_interval : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END spwroutertcc;

ARCHITECTURE spwroutertcc_arch OF spwroutertcc IS
    -- Initial Time Code values.
    CONSTANT c_init_CounterValue : unsigned(5 DOWNTO 0) := "000000";
    CONSTANT c_init_CtrlFlag : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";

    -- Time Code components.  
    SIGNAL s_current_ctrl_flag : STD_LOGIC_VECTOR(1 DOWNTO 0); -- Time Code control flag
    SIGNAL s_current_counter_value : unsigned(5 DOWNTO 0); -- Time Code counter value
    SIGNAL s_auto_tc_counter_value : unsigned(5 DOWNTO 0); -- Automatic generated Time Code counter value

    SIGNAL s_current_tc_out : STD_LOGIC_VECTOR(7 DOWNTO 0); -- Composite new Time Code (ctrl flag & counter value)
    SIGNAL s_current_auto_tc_out : STD_LOGIC_VECTOR(7 DOWNTO 0); -- Composite new auto generated Time Code (ctrl flag & counter value)

    -- Time Code port selection.
    SIGNAL s_tc_ports : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- All ports except the port that currently received Time Code and should not send any
    SIGNAL s_tick_out : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); -- All ports that are technically running and selected for sending Time Codes

    -- Contains requested or automatically generated Time Code for each port.
    SIGNAL s_tc_out : array_t((numports - 1) DOWNTO 0)(7 DOWNTO 0);

    -- Automatic Time Code generation.
    SIGNAL s_auto_counter : unsigned(31 DOWNTO 0); -- std_logic_vector(31 downto 0) -- -- Counter for automatic Time Code generation
    SIGNAL s_auto_enable : STD_LOGIC; -- High if new automatically generated Time Code is to be sent
BEGIN
    -- Drive outputs.
    tc_last <= s_current_tc_out;
    tick_out <= s_tick_out;
    tc_out <= s_tc_out;
    auto_tc_out <= s_current_auto_tc_out;

    -- Concatenation of control flag and counter value to Time Code.
    s_current_auto_tc_out <= "00" & STD_LOGIC_VECTOR(s_auto_tc_counter_value);
    s_current_tc_out <= s_current_ctrl_flag & STD_LOGIC_VECTOR(s_current_counter_value);

    -- Time Code output.
    PortSelection : FOR i IN 0 TO (numports - 1) GENERATE
        -- Determines which port has to send Time Code. To do this, it is checked if the link
        -- is in running state, Time Codes are generelly activated for this port and whether it
        -- has not just received a Time Code. 
        s_tick_out(i) <= s_tc_ports(i) WHEN (tc_enable(i) = '1' AND running(i) = '1') ELSE
        '0';

        s_tc_out(i)(7 DOWNTO 0) <= s_current_tc_out WHEN (auto_interval = x"00000000") ELSE
        s_current_auto_tc_out;
    END GENERATE PortSelection;

    -- Generates both requested and automatically generated Time Codes and controls which port must send it.
    TimeCodeCreation : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF (rst = '1') THEN
                -- Synchronous reset.
                s_current_counter_value <= c_init_CounterValue;
                s_current_ctrl_flag <= c_init_CtrlFlag;
                s_tc_ports <= (OTHERS => '0');
            ELSE
                -- In case of automatically Time Code generation: every port will get the new Time Code to send.
                IF (auto_interval /= x"00000000") THEN
                    -- Automatically Time Code generation is enabled.

                    IF (s_auto_enable = '1') THEN
                        s_tc_ports <= (OTHERS => '1'); -- All ports must send automatically generated Time Codes
                    ELSE
                        -- Counter has not reached yet interval limit in auto_interval.
                        s_tc_ports <= (OTHERS => '0');
                    END IF;
                ELSE
                    -- (Automatically Time Code generation is disabled.)

                    -- Reset Time Code port selection.
                    s_tc_ports <= (OTHERS => '0'); -- TODO: Check ! Testen ob das nötig ist! Könnte sonst sein, dass in jeder Runde ein neuer Time Code verschickt wird!

                    -- Time Code target.
                    FOR i IN (numports - 1) DOWNTO 0 LOOP
                        IF (tick_in(i) = '1') THEN
                            -- Value of received Time Code must be equal to counter value (stored in router) plus one, otherwise Time Code will be ignored.
                            IF (unsigned(tc_in(i)(5 DOWNTO 0)) = (s_current_counter_value + 1)) THEN
                                -- Time Code is not emitted by the link/port that first received the Time Code but from everyone else only.
                                s_tc_ports <= (i => '0', OTHERS => '1');
                            END IF;

                            -- Update Time Code registers.
                            s_current_counter_value <= unsigned(tc_in(i)(5 DOWNTO 0));
                            s_current_ctrl_flag <= tc_in(i)(7 DOWNTO 6);
                        END IF;
                    END LOOP;
                END IF;
            END IF;
        END IF;
    END PROCESS TimeCodeCreation;

    -- Manages automatically generated Time Codes.
    AutoTimeCodes : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF (rst = '1') THEN
                -- Synchronous reset.
                s_auto_tc_counter_value <= c_init_CounterValue;
                s_auto_counter <= (OTHERS => '0');
                s_auto_enable <= '0';
            ELSE
                -- Sends Time Codes periodically only if register is unequal to zero.
                IF (auto_interval /= x"00000000") THEN
                    -- (Send automatic generated Time Codes.)

                    IF (s_auto_counter = unsigned(auto_interval)) THEN -- TODO: Hier habe ich manuell ein = eingefügt, vorher war hier ein >. Erschien mir aber unsinnig, mal mit = testen! (Verhalten in Handbuch dokumentieren!)
                        -- Reset counter and send automatically generated Time Code.
                        s_auto_counter <= x"00000000";
                        s_auto_enable <= '1';
                        s_auto_tc_counter_value <= (s_auto_tc_counter_value + 1);
                    ELSE
                        -- Increment s_auto_counter every rising_edge(clk).
                        s_auto_counter <= (s_auto_counter + 1);
                        s_auto_enable <= '0';
                    END IF;
                ELSE
                    -- (Send no automatically generated Time Codes.)
                    s_auto_enable <= '0';
                    s_auto_counter <= x"00000000";
                END IF;
            END IF;
        END IF;
    END PROCESS AutoTimeCodes;
END spwroutertcc_arch;