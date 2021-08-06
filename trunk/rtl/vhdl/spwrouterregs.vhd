----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 04.08.2021 14:28
-- Design Name: SpaceWire Control Register
-- Module Name: spwrouterregs
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: spwrouterpkg
-- Dependencies: none
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.spwrouterpkg.ALL;
USE work.spwpkg.ALL;

ENTITY spwrouterregs IS
    GENERIC (
        -- Number of SpaceWire ports.
        numports : INTEGER RANGE 0 TO 31
    );
    ports (
    -- System clock.
    clk : IN STD_LOGIC;

    -- Asynchronous reset.
    rst : IN STD_LOGIC;

    -- Transmit clock.
    txclk : IN STD_LOGIC;

    -- Receiver clock.
    rxclk : IN STD_LOGIC;

    -- Data to write into register.
    writeData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

    -- Data to read out register.
    readData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

    -- High when an operation is in progress.
    acknowledge : OUT STD_LOGIC;

    -- Speicher addresse (gilt für alles, nicht nur Routing Tabelle !!)
    address : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- korrekt? nicht 8 bits?

    -- strobe und cycle hängen nur mit routing tabelle zusammen
    strobe : IN STD_LOGIC;
    cycle : IN STD_LOGIC;

    -- High wenn geschrieben, low wenn gelesen werden soll
    -- Gilt nur für Routing Tabelle
    writeEnable : IN STD_LOGIC;

    -- Selects Bytes of the 32 bits. Gilt für alle register
    dataByteEnable : IN STD_LOGIC_VECTOR(3 DOWNTO 0);

    -- wird nur einmal gebraucht: schreibt 8 bits in das router configuration register
    --requestPort: in std_logic_vector(numports+1 downto 0); -- +1 richtig?

    -- Schreibt den Zustand aller Port (außer Port0) in das Link-On Register.
    --linkUp: in std_logic_vector(numports downto 0);
    -- meins
    portstatus : IN array_t(0 TO (numports - 1)) OF STD_LOGIC_VECTOR(31 DOWNTO 0); -- Belegung siehe meine Liste
    info : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- Info Register -- evtl. lässt sich das auch über readData abwickeln
    -- meins

    receiveTimeCode : IN STD_LOGIC_VECTOR(numports + 1 DOWNTO 0);
    autoTimeCodeValue : IN STD_LOGIC_VECTOR(numports + 1 DOWNTO 0);

    -- Ausgänge aus definierten Registern:
    -- Ausgabe statusregister
    statreg : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    -- Ausgabe TimeCode register
    -- autoTimeCodeCycleTime
    autoTimeCodeCycleTime : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    -- TimeCode receive out
    timecodereceiveout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    -- autoTimeCode value
    autoTimeCodeValue : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    );
END spwrouterregs

ARCHITECTURE spwrouterregs_arch OF spwrouterregs IS
    -- Number of rows in table. (0 to 2**abits-1)
    CONSTANT abits_table4 : INTEGER := 5;
    CONSTANT abits_table5 : INTEGER := 2;
    CONSTANT abits_table6 : INTEGER := 0;

    -- FSM state.
    SIGNAL state : spwrouterregsstates := S_Idle;

    -- Enthalten Register Werte
    -- schreibt 
    SIGNAL iDataInBuffer : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL iDataOutBuffer : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL iAcknowledgeOut : STD_LOGIC;
    
    -- Select signals for ROM table.
    -- entries from 0x0000_0000 to 0x0000_03F8 are occupied by routing table.
    SIGNAL s_table_4 : STD_LOGIC; -- 0x0000_0400
    SIGNAL s_table_5 : STD_LOGIC; -- 0x0000_0500
    SIGNAL s_table_6 : STD_LOGIC; -- 0x0000_0600
    --signal s_table_7 : std_logic; -- 0x0000_0700 -- uncomment if you need.
    --signal s_table_8 : std_logic; -- 0x0000_0800
    --signal s_table_9 : std_logic; -- 0x0000_0900

    -- Select signals for one ROM table entry.
    -- Cover range from 0 to 32 (0x00 to 0x80). Every field contains four bytes.
    -- Can be expanded to 64 (0xFC) if necessary.
    SIGNAL s_addr_00, s_addr_04, s_addr_08, s_addr_0C : STD_LOGIC; -- 0x00 - 0x0C
    SIGNAL s_addr_10, s_addr_14, s_addr_18, s_addr_1C : STD_LOGIC; -- 0x10 - 0x1C
    SIGNAL s_addr_20, s_addr_24, s_addr_28, s_addr_2C : STD_LOGIC; -- 0x20 - 0x2C
    SIGNAL s_addr_30, s_addr_34, s_addr_38, s_addr_3C : STD_LOGIC; -- 0x30 - 0x3C
    SIGNAL s_addr_40, s_addr_44, s_addr_48, s_addr_4C : STD_LOGIC; -- 0x40 - 0x4C
    SIGNAL s_addr_50, s_addr_54, s_addr_58, s_addr_5C : STD_LOGIC; -- 0x50 - 0x5C
    SIGNAL s_addr_60, s_addr_64, s_addr_68, s_addr_6C : STD_LOGIC; -- 0x60 - 0x6C
    SIGNAL s_addr_70, s_addr_74, s_addr_78, s_addr_7C : STD_LOGIC; -- 0x70 - 0x7C
    --signal s_addr_80 : std_logic; -- braucht man evtl. gar nicht unbedingt?

    -- Address variables for tables. Used for read and write!
    SIGNAL s_addr_table4 : STD_LOGIC_VECTOR(abits_table4 - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL s_addr_table5 : STD_LOGIC_VECTOR(abits_table5 - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL s_addr_table6 : STD_LOGIC_VECTOR(abits_table6 - 1 DOWNTO 0) := (OTHERS => '0');

    -- Read data signals
    SIGNAL s_read_table4 : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL s_read_table5 : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL s_read_table6 : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');

    -- Write data signals.
    SIGNAL s_write_table4 : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL s_write_table5 : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL s_write_table6 : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    
    -- Routing Tabelle
    SIGNAL iSelectRoutingTable : STD_LOGIC;
    SIGNAL iRoutingTableStrobe : STD_LOGIC;
    SIGNAL routingTableReadData : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL routingTableAcknowledge : STD_LOGIC;

    signal iAutoTimeCodeCycleTimeRegister : std_logic_vector (31 downto 0);

    SIGNAL iAcknowledge : STD_LOGIC;
    SIGNAL iReadData : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
    -- Drive outputs.
    timeOutEnable <= iTimeOutEnableRegister;
    timeOutCountValue <= iTimeOutCountValueRegister;
    autoTimeCodeCycleTime       <= iAutoTimeCodeCycleTimeRegister;

    acknowledge <= iAcknowledge;
    readData <= iReadData;
    iRoutingTableStrobe <= cycle AND strobe AND iSelectRoutingTable;
    iAcknowledge <= routingTableAcknowledge OR iAcknowledgeOut;

    iReadData <= routingTableReadData WHEN iSelectRoutingTable = '1' ELSE
        s_read_table4 WHEN s_table_4 = '1' ELSE
        s_read_table6 WHEN s_table_6 = '1';-- ELSE
    -- Tabelle 5 hat separate Ausgänge!
        --iDataOutBuffer; -- Hier alle Ausgabe Signale auflisten, mit Bedingung und else

    -- Decoding address and output the select signal of the applicable register.
    -- Higher 8 bit
    iSelectRoutingTable <= '1' WHEN (address(13 DOWNTO 2) > "000000011111" AND address(13 DOWNTO 2) < "000100000000") ELSE
        '0';

        -- Wird nicht gebraucht, hat aber im Original Funktionen bezüglich der TimeCode Register!! Falls Fehler, dann da mal nachsehen!
    --iSelectRouterRegister <= '1' WHEN address(13 DOWNTO 8) = "00" & x"9" ELSE
        '0';

    s_table_4 <= '1' WHEN address(11 DOWNTO 8) = "0100" ELSE
        '0';
    s_table_5 <= '1' WHEN address(11 DOWNTO 8) = "0101" ELSE
        '0';
    s_table_6 <= '1' WHEN address(11 DOWNTO 8) = "0110" ELSE
        '0';
    --s_table_7 <= '1' when address(11 downto 8) = "0111" else '0';
    --s_table_8 <= '1' when address(11 downto 8) = "1000" else '0';
    --s_table_9 <= '1' when address(11 downto 8) = "1001" else '0';



    -- Lower 8bit.
    s_addr_00 <= '1' WHEN address (7 DOWNTO 2) = "000000" ELSE
        '0'; -- 00 (00)
    s_addr_04 <= '1' WHEN address (7 DOWNTO 2) = "000001" ELSE
        '0'; -- 04 (01)
    s_addr_08 <= '1' WHEN address (7 DOWNTO 2) = "000010" ELSE
        '0'; -- 08 (02)
    s_addr_0C <= '1' WHEN address (7 DOWNTO 2) = "000011" ELSE
        '0'; -- 0C (03)
    s_addr_10 <= '1' WHEN address (7 DOWNTO 2) = "000100" ELSE
        '0'; -- 10 (04)
    s_addr_14 <= '1' WHEN address (7 DOWNTO 2) = "000101" ELSE
        '0'; -- 14 (05)
    s_addr_18 <= '1' WHEN address (7 DOWNTO 2) = "000110" ELSE
        '0'; -- 18 (06)
    s_addr_1C <= '1' WHEN address (7 DOWNTO 2) = "000111" ELSE
        '0'; -- 1C (07)
    s_addr_20 <= '1' WHEN address (7 DOWNTO 2) = "001000" ELSE
        '0'; -- 20 (08)
    s_addr_24 <= '1' WHEN address (7 DOWNTO 2) = "001001" ELSE
        '0'; -- 24 (09)
    s_addr_28 <= '1' WHEN address (7 DOWNTO 2) = "001010" ELSE
        '0'; -- 28 (10)
    s_addr_2C <= '1' WHEN address (7 DOWNTO 2) = "001011" ELSE
        '0'; -- 2C (11)
    s_addr_30 <= '1' WHEN address (7 DOWNTO 2) = "001100" ELSE
        '0'; -- 30 (12)
    s_addr_34 <= '1' WHEN address (7 DOWNTO 2) = "001101" ELSE
        '0'; -- 34 (13)
    s_addr_38 <= '1' WHEN address (7 DOWNTO 2) = "001110" ELSE
        '0'; -- 38 (14)
    s_addr_3C <= '1' WHEN address (7 DOWNTO 2) = "001111" ELSE
        '0'; -- 3C (15)
    s_addr_40 <= '1' WHEN address (7 DOWNTO 2) = "010000" ELSE
        '0'; -- 40 (16)
    s_addr_44 <= '1' WHEN address (7 DOWNTO 2) = "010001" ELSE
        '0'; -- 44 (17)
    s_addr_48 <= '1' WHEN address (7 DOWNTO 2) = "010010" ELSE
        '0'; -- 48 (18)
    s_addr_4C <= '1' WHEN address (7 DOWNTO 2) = "010011" ELSE
        '0'; -- 4c (19)
    s_addr_50 <= '1' WHEN address (7 DOWNTO 2) = "010100" ELSE
        '0'; -- 50 (20)
    s_addr_54 <= '1' WHEN address (7 DOWNTO 2) = "010101" ELSE
        '0'; -- 54 (21)
    s_addr_58 <= '1' WHEN address (7 DOWNTO 2) = "010110" ELSE
        '0'; -- 58 (22)
    s_addr_5C <= '1' WHEN address (7 DOWNTO 2) = "010111" ELSE
        '0'; -- 5C (23)
    s_addr_60 <= '1' WHEN address (7 DOWNTO 2) = "011000" ELSE
        '0'; -- 60 (24)
    s_addr_64 <= '1' WHEN address (7 DOWNTO 2) = "011001" ELSE
        '0'; -- 64 (25)
    s_addr_68 <= '1' WHEN address (7 DOWNTO 2) = "011010" ELSE
        '0'; -- 68 (26)
    s_addr_6C <= '1' WHEN address (7 DOWNTO 2) = "011011" ELSE
        '0'; -- 6C (27)
    s_addr_70 <= '1' WHEN address (7 DOWNTO 2) = "011100" ELSE
        '0'; -- 70 (28)
    s_addr_74 <= '1' WHEN address (7 DOWNTO 2) = "011101" ELSE
        '0'; -- 74 (29)
    s_addr_78 <= '1' WHEN address (7 DOWNTO 2) = "011110" ELSE
        '0'; -- 78 (30)
    s_addr_7C <= '1' WHEN address (7 DOWNTO 2) = "011111" ELSE
        '0'; -- 7C (31)
    s_addr_80 <= '1' WHEN address (7 DOWNTO 2) = "100000" ELSE
        '0'; -- 80 (32)


    -- FSM. Controls read/write access to registers.
    PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN
            state <= S_Idle;
            iAcknowledgeOut <= '0';
            --iDataOutBuffer <= (OTHERS => '0');
            iDataInBuffer <= (OTHERS => '0');
            s_read_table4 <= (OTHERS => '0');
            s_write_table4 <= (OTHERS => '0');
            s_read_table5 <= (OTHERS => '0');
            s_write_table5 <= (OTHERS => '0');
            s_read_table6 <= (OTHERS => '0');
            s_write_table6 <= (OTHERS => '0');
            iAutoTimeCodeCycleTimeRegister <= x"00000000";
            -- TODO: Noch einen async Reset für die Register einbauen! Dazu schauen wie das im IP gemacht wurde!

        ELSIF rising_edge(clk) THEN
            CASE state
                WHEN S_Idle =>
                    IF (iSelectRoutingTable = '0' AND cycle = '1' AND strobe = '1') THEN
                        IF (writeEnable = '1') THEN -- FALLS das Beschreiben der Register schief geht, weil writeEnable im nächsten Takt nicht mehr HIGH ist, dann 'wen' bei allen Registern auf '1' setzen und prüfen ob das funktioniert. (Könnte eventuell auch kollidieren, weil dann ja beides gleichzeitig möglich wäre: schreiben und lesen)
                            iDataInBuffer <= writeData;
                            state <= S_Write0;
                        ELSE
                            state <= S_Read0;
                        END IF;
                    END IF;

                WHEN S_Read0 =>
                    -- Read Register Select.
                    IF (s_table_4 = '1' AND s_addr_00 = '1') THEN -- Status register (0x0000_0400)
                        -- Port 0
                        s_addr_table4 <= to_integer(unsigned(0));

                    ELSIF (s_table_4 = '1' AND s_addr_04 = '1') THEN
                        -- Port 1
                        s_addr_table4 <= to_integer(unsigned(1));
                    ELSIF (s_table_4 = '1' AND s_addr_08 = '1') THEN
                        -- Port 2
                        s_addr_table4 <= to_integer(unsigned(2));
                    ELSIF (s_table_4 = '1' AND s_addr_0C = '1') THEN
                        -- Port 3
                        s_addr_table4 <= to_integer(unsigned(3));
                    ELSIF (s_table_4 = '1' AND s_addr_10 = '1') THEN
                        -- Port 4
                        s_addr_table4 <= to_integer(unsigned(4));
                    ELSIF (s_table_4 = '1' AND s_addr_14 = '1') THEN
                        -- Port 5
                        s_addr_table4 <= to_integer(unsigned(5));
                    ELSIF (s_table_4 = '1' AND s_addr_18 = '1') THEN
                        -- Port 6
                        s_addr_table4 <= to_integer(unsigned(6));
                    ELSIF (s_table_4 = '1' AND s_addr_1C = '1') THEN
                        -- Port 7
                        s_addr_table4 <= to_integer(unsigned(7));
                    ELSIF (s_table_4 = '1' AND s_addr_20 = '1') THEN
                        -- Port 8
                        s_addr_table4 <= to_integer(unsigned(8));
                    ELSIF (s_table_4 = '1' AND s_addr_24 = '1') THEN
                        -- Port 9
                        s_addr_table4 <= to_integer(unsigned(9));
                    ELSIF (s_table_4 = '1' AND s_addr_28 = '1') THEN
                        -- Port 10
                        s_addr_table4 <= to_integer(unsigned(10));
                    ELSIF (s_table_4 = '1' AND s_addr_2C = '1') THEN
                        -- Port 11
                        s_addr_table4 <= to_integer(unsigned(11));
                    ELSIF (s_table_4 = '1' AND s_addr_30 = '1') THEN
                        -- Port 12
                        s_addr_table4 <= to_integer(unsigned(12));
                    ELSIF (s_table_4 = '1' AND s_addr_34 = '1') THEN
                        -- Port 13
                        s_addr_table4 <= to_integer(unsigned(13));
                    ELSIF (s_table_4 = '1' AND s_addr_38 = '1') THEN
                        -- Port 14
                        s_addr_table4 <= to_integer(unsigned(14));
                    ELSIF (s_table_4 = '1' AND s_addr_3C = '1') THEN
                        -- Port 15
                        s_addr_table4 <= to_integer(unsigned(15));
                    ELSIF (s_table_4 = '1' AND s_addr_40 = '1') THEN
                        -- Port 16
                        s_addr_table4 <= to_integer(unsigned(16));
                    ELSIF (s_table_4 = '1' AND s_addr_44 = '1') THEN
                        -- Port 17
                        s_addr_table4 <= to_integer(unsigned(17));
                    ELSIF (s_table_4 = '1' AND s_addr_48 = '1') THEN
                        -- Port 18
                        s_addr_table4 <= to_integer(unsigned(18));
                    ELSIF (s_table_4 = '1' AND s_addr_4C = '1') THEN
                        -- Port 19
                        s_addr_table4 <= to_integer(unsigned(19));
                    ELSIF (s_table_4 = '1' AND s_addr_50 = '1') THEN
                        -- Port 20
                        s_addr_table4 <= to_integer(unsigned(20));
                    ELSIF (s_table_4 = '1' AND s_addr_54 = '1') THEN
                        -- Port 21
                        s_addr_table4 <= to_integer(unsigned(21));
                    ELSIF (s_table_4 = '1' AND s_addr_58 = '1') THEN
                        -- Port 22
                        s_addr_table4 <= to_integer(unsigned(22));
                    ELSIF (s_table_4 = '1' AND s_addr_5C = '1') THEN
                        -- Port 23
                        s_addr_table4 <= to_integer(unsigned(23));
                    ELSIF (s_table_4 = '1' AND s_addr_60 = '1') THEN
                        -- Port 24
                        s_addr_table4 <= to_integer(unsigned(24));
                    ELSIF (s_table_4 = '1' AND s_addr_64 = '1') THEN
                        -- Port 25
                        s_addr_table4 <= to_integer(unsigned(25));
                    ELSIF (s_table_4 = '1' AND s_addr_68 = '1') THEN
                        -- Port 26
                        s_addr_table4 <= to_integer(unsigned(26));
                    ELSIF (s_table_4 = '1' AND s_addr_6C = '1') THEN
                        -- Port 27
                        s_addr_table4 <= to_integer(unsigned(27));
                    ELSIF (s_table_4 = '1' AND s_addr_70 = '1') THEN
                        -- Port 28
                        s_addr_table4 <= to_integer(unsigned(28));
                    ELSIF (s_table_4 = '1' AND s_addr_74 = '1') THEN
                        -- Port 29
                        s_addr_table4 <= to_integer(unsigned(29));
                    ELSIF (s_table_4 = '1' AND s_addr_78 = '1') THEN
                        -- Port 30
                        s_addr_table4 <= to_integer(unsigned(30));
                    ELSIF (s_table_4 = '1' AND s_addr_7C = '1') THEN
                        -- Port 31
                        s_addr_table4 <= to_integer(unsigned(31));
                    ELSIF (s_table_5 = '1' AND s_addr_00 = '1') THEN -- TimeCode register (0x0000_5000)
                        -- TimeCode receive register
                        s_addr_table5 <= to_integer(unsigned(0));
                    ELSIF (s_table_5 = '1' AND s_addr_08 = '1') THEN
                        -- Automatic TimeCode value
                        s_addr_table5 <= to_integer(unsigned(2));
                    ELSIF (s_table_5 = '1' AND s_addr_0C = '1') THEN
                        -- Automatic TimeCode Cycle Register
                        s_addr_table5 <= to_integer(unsigned(3));
                    ELSIF (s_table_6 = '1' AND s_addr_00 = '1') THEN -- Info register (0x0000_0600)
                        -- Info
                        s_addr_table6 <= to_integer(unsigned(0));
                    --ELSE
                        --iDataOutBuffer <= (OTHERS => '0');
                    END IF;

                    iAcknowledgeOut <= '1';
                    state <= S_Read1;

                WHEN S_Read1 => -- Read register end.
                    iAcknowledgeOut <= '0';
                    state <= S_Wait0;

                WHEN S_Write0 =>
                    -- Write Register Select.
                    IF (s_table_4 = '1' AND s_addr_00 = '1') THEN -- Status register (0x0000_0400)
                        -- Port 0
                        s_addr_table4 <= to_integer(unsigned(0));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_04 = '1') THEN
                        -- Port 1
                        s_addr_table4 <= to_integer(unsigned(1));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_08 = '1') THEN
                        -- Port 2
                        s_addr_table4 <= to_integer(unsigned(2));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_0C = '1') THEN
                        -- Port 3
                        s_addr_table4 <= to_integer(unsigned(3));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_10 = '1') THEN
                        -- Port 4
                        s_addr_table4 <= to_integer(unsigned(4));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_14 = '1') THEN
                        -- Port 5
                        s_addr_table4 <= to_integer(unsigned(5));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_18 = '1') THEN
                        -- Port 6
                        s_addr_table4 <= to_integer(unsigned(6));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_1C = '1') THEN
                        -- Port 7
                        s_addr_table4 <= to_integer(unsigned(7));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_20 = '1') THEN
                        -- Port 8
                        s_addr_table4 <= to_integer(unsigned(8));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_24 = '1') THEN
                        -- Port 9
                        s_addr_table4 <= to_integer(unsigned(9));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_28 = '1') THEN
                        -- Port 10
                        s_addr_table4 <= to_integer(unsigned(10));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_2C = '1') THEN
                        -- Port 11
                        s_addr_table4 <= to_integer(unsigned(11));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_30 = '1') THEN
                        -- Port 12
                        s_addr_table4 <= to_integer(unsigned(12));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_34 = '1') THEN
                        -- Port 13
                        s_addr_table4 <= to_integer(unsigned(13));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_38 = '1') THEN
                        -- Port 14
                        s_addr_table4 <= to_integer(unsigned(14));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_3C = '1') THEN
                        -- Port 15
                        s_addr_table4 <= to_integer(unsigned(15));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_40 = '1') THEN
                        -- Port 16
                        s_addr_table4 <= to_integer(unsigned(16));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_44 = '1') THEN
                        -- Port 17
                        s_addr_table4 <= to_integer(unsigned(17));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_48 = '1') THEN
                        -- Port 18
                        s_addr_table4 <= to_integer(unsigned(18));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_4C = '1') THEN
                        -- Port 19
                        s_addr_table4 <= to_integer(unsigned(19));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_50 = '1') THEN
                        -- Port 20
                        s_addr_table4 <= to_integer(unsigned(20));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_54 = '1') THEN
                        -- Port 21
                        s_addr_table4 <= to_integer(unsigned(21));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_58 = '1') THEN
                        -- Port 22
                        s_addr_table4 <= to_integer(unsigned(22));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_5C = '1') THEN
                        -- Port 23
                        s_addr_table4 <= to_integer(unsigned(23));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_60 = '1') THEN
                        -- Port 24
                        s_addr_table4 <= to_integer(unsigned(24));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_64 = '1') THEN
                        -- Port 25
                        s_addr_table4 <= to_integer(unsigned(25));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_68 = '1') THEN
                        -- Port 26
                        s_addr_table4 <= to_integer(unsigned(26));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_6C = '1') THEN
                        -- Port 27
                        s_addr_table4 <= to_integer(unsigned(27));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_70 = '1') THEN
                        -- Port 28
                        s_addr_table4 <= to_integer(unsigned(28));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_74 = '1') THEN
                        -- Port 29
                        s_addr_table4 <= to_integer(unsigned(29));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_78 = '1') THEN
                        -- Port 30
                        s_addr_table4 <= to_integer(unsigned(30));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_4 = '1' AND s_addr_7C = '1') THEN
                        -- Port 31
                        s_addr_table4 <= to_integer(unsigned(31));
                        s_write_table4 <= iDataInBuffer;
                    ELSIF (s_table_5 = '1' AND s_addr_00 = '1') THEN -- TimeCode register (0x0000_5000)
                        -- TimeCode receive register
                        s_addr_table5 <= to_integer(unsigned(0));
                        s_write_table5 <= iDataInBuffer;
                    ELSIF (s_table_5 = '1' AND s_addr_08 = '1') THEN
                        -- Automatic TimeCode value
                        s_addr_table5 <= to_integer(unsigned(2));
                        s_write_table5 <= iDataInBuffer;
                    ELSIF (s_table_5 = '1' AND s_addr_0C = '1') THEN
                        -- Automatic TimeCode Cycle Register
                        s_addr_table5 <= to_integer(unsigned(3));
                        s_write_table5 <= iDataInBuffer;
                    ELSIF (s_table_6 = '1' AND s_addr_00 = '1') THEN -- Info register (0x0000_0600)
                        -- Info
                        s_addr_table6 <= to_integer(unsigned(0));
                        s_write_table6 <= iDataInBuffer;
                    END IF;

                    iAcknowledgeOut <= '1';
                    state <= S_Write1;

                WHEN S_Write1 => -- Write Register END.
                    -- iSoftwareLinkResetx <= '0'; x == PortNr.
                    iAcknowledgeOut <= '0';
                    state <= S_Wait0;

                WHEN S_Wait0 => -- Write register wait.
                    state <= S_Wait1;

                WHEN S_Wait1 =>
                    state <= S_Idle;

            END CASE;
        END IF;
    END PROCESS;

    -- Routing table (0x0000_0000 - 0x0000_03F8)
    RoutingTable : spwroutertable
    GENERIC MAP(
        numports => numports
    )
    PORT MAP(
        clk => clk,
        rst => rst,
        act => iRoutingTableStrobe,
        readwrite => writeEnable,
        dByte => dataByteEnable,
        addr => address(9 DOWNTO 2), -- mapps hexadecimal numbers to decimals beginning with 0 step 1.
        wdata => writeData,
        rdata => routingTableReadData,
        proc => routingTableAcknowledge
    ); -- Check, genauso wie im original

    -- Port status register (0x0000_0400 - 0x0000_0480, depending on numports!)
    StatusRegister : spwram
    GENERIC MAP(
        abits => abits_table4, -- 32 cells; 6 bit address
        dbits => 32 -- word size
    )
    PORT MAP(
        rclk => clk,
        wclk => clk,
        ren => '1',
        raddr => s_addr_table4,
        rdata => s_read_table4,
        wen => writeEnable,
        waddr => s_addr_table4,
        wdata => s_write_table4
    );

    -- TimeCode register (0x0000_0500 - 0x0000_050C)
    TimeCodeRegister : spwram
    GENERIC MAP(
        abits => abits_table5, -- 4 cells; 3 bit address
        dbits => 32 -- word size
    )
    PORT MAP(
        rclk => clk,
        wclk => clk,
        ren => '1';
        raddr => s_addr_table5,
        rdata => s_read_table5,
        wen => writeEnable,
        waddr => s_addr_table5,
        wdata => s_write_table5
    );

    -- Info register (0x0000_0600 - 0x0000_0604)
    InfoRegister : spwram
    GENERIC MAP(
        abits => abits_table6, -- 1 cell; 1 bit address
        dbits => 32 -- word size
    )
    PORT MAP(
        rclk => clk,
        wclk => clk,
        ren => '1',
        raddr => s_addr_table6,
        rdata => s_read_table6,
        wen => writeEnable,
        waddr => s_addr_table6,
        wdata => s_write_table6
    );
END spwrouterregs_arch