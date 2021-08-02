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
-- Description: 
-- Dependencies: none
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.spwrouterpkg.ALL;

ENTITY spwroutertcc IS
    GENERIC (
        -- Number of SpaceWire ports.
        numports : INTEGER RANGE 0 TO 31
    );
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Synchronous reset.
        rst : IN STD_LOGIC;

        -- High if concerned port is running.
        -- Low when it's in another state.
        running : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Generated TimeCode.
        timecode : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- High if concerned port has enabled TimeCode feature.
        -- Low when it's disabled.
        enabled : IN STD_LOGIC_VECTOR(numports DOWNTO 1);

        -- High if concerned port receives a TimeCode.
        tick_out : OUT STD_LOGIC_VECTOR(numports DOWNTO 1);

        -- Matrix contains for every port same TimeCode. (why is that necessary? timecode: out does already exist?!)
        timecode_matrix : OUT matrix_t(numports DOWNTO 1, 7 DOWNTO 0);

        -- ?
        portTickOut : IN STD_LOGIC_VECTOR(numports DOWNTO 1);

        -- ? KEINE AHNUNG, am besten in Top Module nachschauen!
        portTimeCodeOut : IN STD_LOGIC_VECTOR(numports DOWNTO 1);

        -- ? vermutlich zwischenspeichern im register. nachprüfen!
        auto_timecode : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- Value from register that specifies transmission interval for TimeCodes.
        auto_timecode_cyle : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END spwroutertcc;

ARCHITECTURE spwroutertcc_arch OF spwroutertcc IS
    -- Initial values for TimeCodes.
    CONSTANT initTimeCode : STD_LOGIC_VECTOR(5 DOWNTO 0) := (OTHERS => '0');
    CONSTANT initCtrlFlag : STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '0');

    -- Output registers.
    SIGNAL iTimeCodeOut : STD_LOGIC_VECTOR(5 DOWNTO 0);
    SIGNAL iTimeCodeOutPlus1 : STD_LOGIC_VECTOR(5 DOWNTO 0);
    SIGNAL iReceiveControlFlags : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL iTickOut : STD_LOGIC_VECTOR(5 DOWNTO 0);

    --SIGNAL iReceiveTimeCode : STD_LOGIC_VECTOR(numports DOWNTO 0);

    SIGNAL iPortTickIn : STD_LOGIC_VECTOR(numports DOWNTO 1);
    SIGNAL iPortTimeCodeIn : matrix_t(numports DOWNTO 1, 7 DOWNTO 0);
    SIGNAL iCycleCounter : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL iAutoTickIn : STD_LOGIC;
    SIGNAL iAutoTimeCodeIn : STD_LOGIC_VECTOR(5 DOWNTO 0);

    SIGNAL newTC : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal autoTC: std_logic_vector(7 downto 0);)
BEGIN
    -- Drive other outputs.
    timecode <= newTC;
    tick_out <= iPortTickIn;
    timecode_matrix <= iPortTimeCodeIn;
    autoTC <= "00" & iAutoTimeCodeIn;
    auto_timecode <= autoTC;
    newTC <= iReceiveControlFlags & iTimeCodeOut;

    PortTick : FOR i IN 1 TO numports GENERATE
        iPortTickIn(i) <= iTickOut(i - 1) WHEN (enabled(i) = '1' AND running(i) = '1') ELSE
        '0';

        -- vermutlich muss hier iPortTimeCodeIn(i)(7 downto 0) = newTC stehen? Kucken ob Fehler auftreten!
        iPortTimeCodeIn(i) <= newTC WHEN (auto_timecode_cyle = x"00000000") ELSE
        autoTC;
    END GENERATE PortTick;

    PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            iTimeCodeOut <= initTimeCode;
            iTimeCoudeOutPlus1 <= (initTimeCode + 1);
            iReceiveControlFlags <= "00";
            iTickOut <= "000000";
        ELSIF rising_edge(clk) THEN

            -- TimeCode Host
            IF (auto_timecode_cyle /= x"00000000") THEN
                IF (iAutoTickIn = '1') THEN
                    iTickOut <= (OTHERS => '1');
                ELSE
                    iTickOut <= (OTHERS => '0');
                END IF;
            ELSE
                -- TimeCode Target
                TCTarget : FOR i IN 1 TO numports GENERATE
                    IF (portTickOut(i) = '1') THEN
                        IF (portTimeCodeOut(i) = iTimeCodeOutPlus1) THEN -- hier steht im original: port1TimeCodeOut(5 downto 0) = iTimeCodeOutPlus1 ?!
                            iTickOut <= (i => '0', OTHERS => '1'); -- potenzielle Fehlerquelle! Liegt vermutlich daran, dass eingangsport von numport downto 1 gemacht wurde! Falls hier fehler auftreten, dann auf downto 0 ändern und i-1 machen!
                        END IF;
                    END IF;
                END GENERATE TCTarget;
            END IF;
        END IF;
    END PROCESS;

    -- TimeCode Host (send timecodes periodically in set value)
    PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            iAutoTimeCodeIn <= (OTHERS => '0');
            iCycleCounter <= (OTHERS => '0');
            iAutoTickIn <= '0';
        ELSIF rising_edge(clk) THEN
            -- Only sends TimeCodes periodically if register isn'timecode_matrix equal to zero.
            IF (auto_timecode_cyle /= x"00000000") THEN
                IF (iCycleCounter > auto_timecode_cyle) THEN
                    iCycleCounter <= (OTHERS => '0');
                    iAutoTickIn <= '1';
                    iAutoTimeCodeIn <= (iAutoTimeCodeIn + 1);
                ELSE
                    iCycleCounter <= (iCycleCounter + 1);
                    iAutoTickIn <= '0';
                END IF;
            ELSE
                iAutoTickIn <= '0';
                iCycleCounter <= (OTHERS => '0');
            END IF;
        END IF;
    END PROCESS;
END spwroutertcc_arch;
