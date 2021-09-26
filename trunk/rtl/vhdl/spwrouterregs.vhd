----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 04.08.2021 14:28
-- Design Name: SpaceWire Control Register
-- Module Name: spwrouterregs
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: Manages internal registers and controls reading and writing
-- process. 
--
-- Dependencies: spwrouterpkg (spwram)
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
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Asynchronous reset.
        rst : IN STD_LOGIC;

        -- Data to write into register. (Everything that has no own writing port)
        writeData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- Data to read from register. (Router Table or general data)
        readData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- High wenn geschrieben, low wenn gelesen werden soll.
        -- Gilt nur für Routing Table
        readwrite : IN STD_LOGIC; -- writeEnable

        -- Selects Bytes of the 32 bits. Gilt für alle register
        dByte : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- dataByteEnable

        -- Memory address. Depending on bit assignment, operation
        -- is carried out in corresponding table or routing table.
        addr : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- address

        -- **** **** **** ROUTING TABLE **** **** ****
        -- High when an operation is performing.
        proc : OUT STD_LOGIC; -- acknowledge

        -- Determines whether the routing table is already queried
        strobe : IN STD_LOGIC;
        cycle : IN STD_LOGIC;

        -- **** **** **** PORT STATUS **** **** ****
        -- Port status register. Created for maximum ports of 32.
        -- (Each port takes over writing in its associated line.)
        portstatus : IN array_t(0 TO 31)(31 DOWNTO 0);

        -- **** **** **** TIMECODE **** **** ****
        -- TimeCode receive register.
        receiveTimeCode : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- AutoTimeCode value register.
        autoTimeCodeValue : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- AutoTimeCodeCycleTime register.
        autoTimeCodeCycleTime : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)

        --
        -- **** **** **** Add more registers here **** **** ****
    );
END spwrouterregs;

ARCHITECTURE spwrouterregs_arch OF spwrouterregs IS
    -- Number of rows in table. (0 to 2**abits-1)
    CONSTANT abits_table4 : INTEGER := 5;
    CONSTANT abits_table5 : INTEGER := 2;
    CONSTANT abits_table6 : INTEGER := 0;
    --CONSTANT abits_table7 : INTEGER := ;
    --CONSTANT abits_table8 : INTEGER := ;
    --CONSTANT abits_table9 : INTEGER := ;

    -- FSM state.
    SIGNAL state : spwrouterregsstates := S_Idle;

    -- I/O buffer and process indication
    -- Transfer their content (input/output) to ports.
    SIGNAL s_DataInBuffer : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL s_DataOutBuffer : STD_LOGIC_VECTOR(31 DOWNTO 0);

    -- Contains data of general registers that have no own output port.
    SIGNAL s_readData : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL s_proc_out : STD_LOGIC;

    -- Select signals for ROM tables.
    -- entries from 0x0000_0000 to 0x0000_03F8 are occupied by routing table.
    SIGNAL s_table_4 : STD_LOGIC; -- 0x0000_0400
    SIGNAL s_table_5 : STD_LOGIC; -- 0x0000_0500
    SIGNAL s_table_6 : STD_LOGIC; -- 0x0000_0600
    --signal s_table_7 : std_logic; -- 0x0000_0700 -- uncomment if you need.
    --signal s_table_8 : std_logic; -- 0x0000_0800
    --signal s_table_9 : std_logic; -- 0x0000_0900
    --signal s_table_10 : std_logic; -- 0x0000_1000

    -- Addressing signals for table. (Used for read/write)
    SIGNAL s_addr_table4 : STD_LOGIC_VECTOR(abits_table4 - 1 DOWNTO 0);
    SIGNAL s_addr_table5 : STD_LOGIC_VECTOR(abits_table5 - 1 DOWNTO 0);
    SIGNAL s_addr_table6 : STD_LOGIC_VECTOR(abits_table6 - 1 DOWNTO 0);
    --SIGNAL s_addr_table7 : STD_LOGIC_VECTOR(abits_table7 - 1 DOWNTO 0);
    --SIGNAL s_addr_table8 : STD_LOGIC_VECTOR(abits_table8 - 1 DOWNTO 0);
    --SIGNAL s_addr_table9 : STD_LOGIC_VECTOR(abits_table9 - 1 DOWNTO 0);
    --SIGNAL s_addr_table10 : STD_LOGIC_VECTOR(abits_table10 - 1 DOWNTO 0);

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

    -- Read data signals
    SIGNAL s_read_table4 : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL s_read_table5 : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL s_read_table6 : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');

    -- Write data signals.
    SIGNAL s_write_table4 : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL s_write_table5 : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL s_write_table6 : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');

    -- Routing Tabelle
    -- Determines wheather routing table is accessed.
    SIGNAL s_selectRoutingTable : STD_LOGIC;

    -- Controls read/write access to routing table.
    SIGNAL s_strobeRoutingTable : STD_LOGIC;

    -- Contains data that should read or write from/into routing table.
    SIGNAL s_dataRoutingTable : STD_LOGIC_VECTOR(31 DOWNTO 0);

    -- Indicates wheather read or write process is currently taking place on routing table.
    SIGNAL s_procRoutingTable : STD_LOGIC;

    -- TimeCode
    SIGNAL s_autoTimeCodeValue : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL s_autoTimeCodeCycleTime : STD_LOGIC_VECTOR (31 DOWNTO 0);

    -- Intermediate signals.
    SIGNAL s_proc : STD_LOGIC;
BEGIN
    -- Drive outputs.   
    proc <= s_proc;
    s_proc <= s_procRoutingTable OR s_proc_out;
    readData <= s_readData;
    s_strobeRoutingTable <= cycle AND strobe AND s_selectRoutingTable;
    autoTimeCodeCycleTime <= s_autoTimeCodeCycleTime;
    s_autoTimeCodeValue <= autoTimeCodeValue;

    -- Decides what data was requested and writes it in general output port.
    s_readData <= s_dataRoutingTable WHEN s_selectRoutingTable = '1' ELSE
        s_DataOutBuffer;

    -- Address decoding and table selection.
    -- Routing table: logic addressing with ports 32 to 254 (saved in routing table)
    --s_selectRoutingTable <= '1' WHEN (addr(13 DOWNTO 2) > "000000011111" AND addr(13 DOWNTO 2) < "000100000000") ELSE '0';
    s_selectRoutingTable <= '1' WHEN to_integer(unsigned(addr(13 DOWNTO 2))) > 31 AND to_integer(unsigned(addr(13 DOWNTO 2))) < 256 ELSE
        '0';

    -- ROM table (defines memory address).
    s_table_4 <= '1' WHEN addr(13 DOWNTO 8) = "000100" ELSE
        '0'; -- (0x0000_0400)
    s_table_5 <= '1' WHEN addr(13 DOWNTO 8) = "000101" ELSE
        '0'; -- (0x0000_0500)
    s_table_6 <= '1' WHEN addr(13 DOWNTO 8) = "000110" ELSE
        '0'; -- (0x0000_0600)
    --s_table_7 <= '1' when addr(13 downto 8) = "000111" else '0'; -- (0x0000_0700)
    --s_table_8 <= '1' when addr(13 downto 8) = "001000" else '0'; -- (0x0000_0800)
    --s_table_9 <= '1' when addr(13 downto 8) = "001001" else '0'; -- (0x0000_0900)
    --s_table_10 <= '1' when addr(13 downto 8) = "10000" else '0'; -- (0x0000_1000)

    -- ROM table entry (defines cell in table).
    s_addr_00 <= '1' WHEN addr (7 DOWNTO 2) = "000000" ELSE
        '0'; -- 00 (00)
    s_addr_04 <= '1' WHEN addr (7 DOWNTO 2) = "000001" ELSE
        '0'; -- 04 (01)
    s_addr_08 <= '1' WHEN addr (7 DOWNTO 2) = "000010" ELSE
        '0'; -- 08 (02)
    s_addr_0C <= '1' WHEN addr (7 DOWNTO 2) = "000011" ELSE
        '0'; -- 0C (03)
    s_addr_10 <= '1' WHEN addr (7 DOWNTO 2) = "000100" ELSE
        '0'; -- 10 (04)
    s_addr_14 <= '1' WHEN addr (7 DOWNTO 2) = "000101" ELSE
        '0'; -- 14 (05)
    s_addr_18 <= '1' WHEN addr (7 DOWNTO 2) = "000110" ELSE
        '0'; -- 18 (06)
    s_addr_1C <= '1' WHEN addr (7 DOWNTO 2) = "000111" ELSE
        '0'; -- 1C (07)
    s_addr_20 <= '1' WHEN addr (7 DOWNTO 2) = "001000" ELSE
        '0'; -- 20 (08)
    s_addr_24 <= '1' WHEN addr (7 DOWNTO 2) = "001001" ELSE
        '0'; -- 24 (09)
    s_addr_28 <= '1' WHEN addr (7 DOWNTO 2) = "001010" ELSE
        '0'; -- 28 (10)
    s_addr_2C <= '1' WHEN addr (7 DOWNTO 2) = "001011" ELSE
        '0'; -- 2C (11)
    s_addr_30 <= '1' WHEN addr (7 DOWNTO 2) = "001100" ELSE
        '0'; -- 30 (12)
    s_addr_34 <= '1' WHEN addr (7 DOWNTO 2) = "001101" ELSE
        '0'; -- 34 (13)
    s_addr_38 <= '1' WHEN addr (7 DOWNTO 2) = "001110" ELSE
        '0'; -- 38 (14)
    s_addr_3C <= '1' WHEN addr (7 DOWNTO 2) = "001111" ELSE
        '0'; -- 3C (15)
    s_addr_40 <= '1' WHEN addr (7 DOWNTO 2) = "010000" ELSE
        '0'; -- 40 (16)
    s_addr_44 <= '1' WHEN addr (7 DOWNTO 2) = "010001" ELSE
        '0'; -- 44 (17)
    s_addr_48 <= '1' WHEN addr (7 DOWNTO 2) = "010010" ELSE
        '0'; -- 48 (18)
    s_addr_4C <= '1' WHEN addr (7 DOWNTO 2) = "010011" ELSE
        '0'; -- 4c (19)
    s_addr_50 <= '1' WHEN addr (7 DOWNTO 2) = "010100" ELSE
        '0'; -- 50 (20)
    s_addr_54 <= '1' WHEN addr (7 DOWNTO 2) = "010101" ELSE
        '0'; -- 54 (21)
    s_addr_58 <= '1' WHEN addr (7 DOWNTO 2) = "010110" ELSE
        '0'; -- 58 (22)
    s_addr_5C <= '1' WHEN addr (7 DOWNTO 2) = "010111" ELSE
        '0'; -- 5C (23)
    s_addr_60 <= '1' WHEN addr (7 DOWNTO 2) = "011000" ELSE
        '0'; -- 60 (24)
    s_addr_64 <= '1' WHEN addr (7 DOWNTO 2) = "011001" ELSE
        '0'; -- 64 (25)
    s_addr_68 <= '1' WHEN addr (7 DOWNTO 2) = "011010" ELSE
        '0'; -- 68 (26)
    s_addr_6C <= '1' WHEN addr (7 DOWNTO 2) = "011011" ELSE
        '0'; -- 6C (27)
    s_addr_70 <= '1' WHEN addr (7 DOWNTO 2) = "011100" ELSE
        '0'; -- 70 (28)
    s_addr_74 <= '1' WHEN addr (7 DOWNTO 2) = "011101" ELSE
        '0'; -- 74 (29)
    s_addr_78 <= '1' WHEN addr (7 DOWNTO 2) = "011110" ELSE
        '0'; -- 78 (30)
    s_addr_7C <= '1' WHEN addr (7 DOWNTO 2) = "011111" ELSE
        '0'; -- 7C (31)

    -- FSM. Controls read/write access to registers.
    PROCESS (clk, rst)
    BEGIN
        IF (rst = '1') THEN -- reset.
            state <= S_Idle;
            s_proc_out <= '0';
            s_DataOutBuffer <= (OTHERS => '0');
            s_DataInBuffer <= (OTHERS => '0');

            s_autoTimeCodeCycleTime <= x"00000000";
            s_autoTimeCodeValue <= (OTHERS => '0');
            -- TODO: Built-in async reset for spwrams!

        ELSIF rising_edge(clk) THEN
            CASE state IS
                WHEN S_Idle =>
                    IF ((s_selectRoutingTable = '0') AND (cycle = '1') AND (strobe = '1')) THEN
                        IF (readwrite = '1') THEN -- TODO: FALLS das Beschreiben der Register schief geht, weil readwrite im nächsten Takt nicht mehr HIGH ist, dann 'wen' bei allen Registern auf '1' setzen und prüfen ob das funktioniert. (Könnte eventuell auch kollidieren, weil dann ja beides gleichzeitig möglich wäre: schreiben und lesen)
                            s_DataInBuffer <= writeData;
                            state <= S_Write0;
                        ELSE
                            state <= S_Read0;
                        END IF;
                    END IF;

                WHEN S_Read0 =>
                    -- Read 
                    -- Register select. (Tables are in ascending order.)
                    -- Routing table is handled separately.
                    IF (s_table_4 = '1' AND s_addr_00 = '1') THEN -- Status register (0x0000_0400)
                        -- Status Port 0
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(0, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_04 = '1') THEN
                        -- Status Port 1
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(1, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_08 = '1') THEN
                        -- Status Port 2
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(2, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_0C = '1') THEN
                        -- Status Port 3
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(3, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_10 = '1') THEN
                        -- Status Port 4
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(4, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_14 = '1') THEN
                        -- Status Port 5
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(5, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_18 = '1') THEN
                        -- Status Port 6
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(6, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_1C = '1') THEN
                        -- Status Port 7
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(7, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_20 = '1') THEN
                        -- Status Port 8
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(8, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_24 = '1') THEN
                        -- Status Port 9
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(9, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_28 = '1') THEN
                        -- Status Port 10
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(10, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_2C = '1') THEN
                        -- Status Port 11
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(11, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_30 = '1') THEN
                        -- Status Port 12
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(12, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_34 = '1') THEN
                        -- Status Port 13
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(13, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_38 = '1') THEN
                        -- Status Port 14
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(14, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_3C = '1') THEN
                        -- Status Port 15
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(15, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_40 = '1') THEN
                        -- Status Port 16
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(16, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_44 = '1') THEN
                        -- Status Port 17
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(17, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_48 = '1') THEN
                        -- Status Port 18
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(18, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_4C = '1') THEN
                        -- Status Port 19
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(19, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_50 = '1') THEN
                        -- Status Port 20
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(20, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_54 = '1') THEN
                        -- Status Port 21
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(21, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_58 = '1') THEN
                        -- Status Port 22
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(22, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_5C = '1') THEN
                        -- Status Port 23
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(23, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_60 = '1') THEN
                        -- Status Port 24
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(24, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_64 = '1') THEN
                        -- Status Port 25
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(25, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_68 = '1') THEN
                        -- Status Port 26
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(26, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_6C = '1') THEN
                        -- Status Port 27
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(27, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_70 = '1') THEN
                        -- Status Port 28
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(28, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_74 = '1') THEN
                        -- Status Port 29
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(29, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_78 = '1') THEN
                        -- Status Port 30
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(30, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_4 = '1' AND s_addr_7C = '1') THEN
                        -- Status Port 31
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(31, s_addr_table4'length));
                        s_DataOutBuffer <= s_read_table4;
                    ELSIF (s_table_5 = '1' AND s_addr_00 = '1') THEN -- TimeCode register (0x0000_5000)
                        -- TimeCode receive register
                        s_addr_table5 <= STD_LOGIC_VECTOR(to_unsigned(0, s_addr_table5'length));
                        s_DataOutBuffer <= s_read_table5;
                        -- (1) N/A
                    ELSIF (s_table_5 = '1' AND s_addr_08 = '1') THEN
                        -- Automatic TimeCode value
                        s_addr_table5 <= STD_LOGIC_VECTOR(to_unsigned(2, s_addr_table5'length));
                        s_autoTimeCodeValue <= s_read_table5(7 DOWNTO 0);
                    ELSIF (s_table_5 = '1' AND s_addr_0C = '1') THEN
                        -- Automatic TimeCode Cycle Register
                        s_addr_table5 <= STD_LOGIC_VECTOR(to_unsigned(3, s_addr_table5'length));
                        s_autoTimeCodeCycleTime <= s_read_table5;
                    ELSIF (s_table_6 = '1' AND s_addr_00 = '1') THEN -- Info register (0x0000_0600)
                        -- Info
                        s_addr_table6 <= STD_LOGIC_VECTOR(to_unsigned(0, s_addr_table6'length));
                        s_DataOutBuffer <= s_read_table5;
                    ELSE
                        s_DataOutBuffer <= (OTHERS => '0');
                    END IF; -- add here more tables and registers...

                    s_proc_out <= '1';
                    state <= S_Read1;

                WHEN S_Read1 => -- Read register end.
                    s_proc_out <= '0';
                    state <= S_Wait0;

                WHEN S_Write0 =>
                    -- Write Register Select.
                    IF (s_table_4 = '1' AND s_addr_00 = '1') THEN -- Status register (0x0000_0400)
                        -- Status Port 0
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(0, s_addr_table4'length));

                        -- Loop is rolled out...                        
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(0)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;

                        -- to... (example)
                        --                        IF (dByte(0) = '1') THEN
                        --                            s_write_table4(7 DOWNTO 0) <= portstatus(0)(7 DOWNTO 0);
                        --                        END IF;
                        --                        IF (dByte(1) = '1') THEN
                        --                            s_write_table4(15 DOWNTO 8) <= portstatus(0)(15 DOWNTO 8);
                        --                        END IF;
                        --                        IF (dByte(2) = '1') THEN
                        --                            s_write_table4(23 DOWNTO 16) <= portstatus(0)(23 DOWNTO 16);
                        --                        END IF;
                        --                        IF (dByte(3) = '1') THEN
                        --                            s_write_table4(31 DOWNTO 24) <= portstatus(0)(31 DOWNTO 24);
                        --                        END IF;

                    ELSIF (s_table_4 = '1' AND s_addr_04 = '1') THEN
                        -- Status Port 1
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(1, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(1)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_08 = '1') THEN
                        -- Status Port 2
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(2, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied 
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(2)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_0C = '1') THEN
                        -- Status Port 3
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(3, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(3)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_10 = '1') THEN
                        -- Status Port 4
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(4, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(4)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_14 = '1') THEN
                        -- Status Port 5
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(5, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(5)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_18 = '1') THEN
                        -- Status Port 6
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(6, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(6)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_1C = '1') THEN
                        -- Status Port 7
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(7, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(7)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_20 = '1') THEN
                        -- Status Port 8
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(8, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(8)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_24 = '1') THEN
                        -- Status Port 9
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(9, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(9)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_28 = '1') THEN
                        -- Status Port 10
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(10, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(10)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_2C = '1') THEN
                        -- Status Port 11
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(11, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(11)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_30 = '1') THEN
                        -- Status Port 12
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(12, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(12)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_34 = '1') THEN
                        -- Status Port 13
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(13, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(13)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_38 = '1') THEN
                        -- Status Port 14
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(14, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(14)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_3C = '1') THEN
                        -- Status Port 15
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(15, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(15)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_40 = '1') THEN
                        -- Status Port 16
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(16, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(16)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_44 = '1') THEN
                        -- Status Port 17
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(17, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(17)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_48 = '1') THEN
                        -- Status Port 18
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(18, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(18)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_4C = '1') THEN
                        -- Status Port 19
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(19, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(19)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_50 = '1') THEN
                        -- Status Port 20
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(20, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(20)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_54 = '1') THEN
                        -- Status Port 21
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(21, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(21)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_58 = '1') THEN
                        -- Status Port 22
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(22, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(22)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_5C = '1') THEN
                        -- Status Port 23
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(23, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(23)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_60 = '1') THEN
                        -- Status Port 24
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(24, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(24)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_64 = '1') THEN
                        -- Status Port 25
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(25, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(25)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_68 = '1') THEN
                        -- Status Port 26
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(26, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(26)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_6C = '1') THEN
                        -- Status Port 27
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(27, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(27)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_70 = '1') THEN
                        -- Status Port 28
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(28, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(28)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_74 = '1') THEN
                        -- Status Port 29
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(29, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(29)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_78 = '1') THEN
                        -- Status Port 30
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(30, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(30)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_4 = '1' AND s_addr_7C = '1') THEN
                        -- Status Port 31
                        s_addr_table4 <= STD_LOGIC_VECTOR(to_unsigned(31, s_addr_table4'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table4(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= portstatus(31)(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_5 = '1' AND s_addr_00 = '1') THEN -- TimeCode register (0x0000_5000)
                        -- TimeCode receive register
                        s_addr_table5 <= STD_LOGIC_VECTOR(to_unsigned(0, s_addr_table5'length));

                        s_write_table5 <= x"000000" & receiveTimeCode;

                    ELSIF (s_table_5 = '1' AND s_addr_08 = '1') THEN
                        -- AutoTimeCode value register
                        s_addr_table5 <= STD_LOGIC_VECTOR(to_unsigned(2, s_addr_table5'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table5(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= s_DataInBuffer(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_5 = '1' AND s_addr_0C = '1') THEN
                        -- AutoTimeCodeCycleTimeRegister
                        s_addr_table5 <= STD_LOGIC_VECTOR(to_unsigned(3, s_addr_table5'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table5(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= s_DataInBuffer(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    ELSIF (s_table_6 = '1' AND s_addr_00 = '1') THEN -- Info register (0x0000_0600)
                        s_addr_table6 <= STD_LOGIC_VECTOR(to_unsigned(0, s_addr_table6'length));

                        -- Check byte by byte whether data should be copied
                        FOR i IN 1 TO 4 LOOP
                            IF (dByte(i - 1) = '1') THEN
                                s_write_table6(((8 * i) - 1) DOWNTO (8 * (i - 1))) <= s_DataInBuffer(((8 * i) - 1) DOWNTO (8 * (i - 1)));
                            END IF;
                        END LOOP;
                    END IF; -- add here more tables and registers...

                    s_proc_out <= '1';
                    state <= S_Write1;

                WHEN S_Write1 => -- Write Register END.
                    -- iSoftwareLinkResetx <= '0'; x == PortNr.
                    s_proc_out <= '0';
                    state <= S_Wait0;

                WHEN S_Wait0 => -- Write register wait.
                    state <= S_Wait1;

                WHEN S_Wait1 =>
                    state <= S_Idle;

            END CASE;
        END IF;
    END PROCESS;

    -- Routing table (0x0000_0080 - 0x0000_03F8)
    RoutingTable : spwroutertable
    GENERIC MAP(
        numports => numports
    )
    PORT MAP(
        clk => clk,
        rst => rst,
        act => s_strobeRoutingTable,
        readwrite => readwrite,
        dByte => dByte,
        addr => addr(9 DOWNTO 2), -- mapps hexadecimal numbers to decimals beginning with 0 step 1.
        wdata => writeData,
        rdata => s_dataRoutingTable,
        proc => s_procRoutingTable
    ); -- Check, genauso wie im original

    -- Port status register (0x0000_0400 - 0x0000_0480)
    -- Even if fewer that maximum possible 31 ports are created (numports), 
    -- 32 entries are still generated. These unused only contain initial value.
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
        wen => readwrite, -- ODER: Zugriff immer erlauben (mit '1'), da sonst bei Änderungen eines Ports, diese gar nicht in das Register geschrieben werden könnte, wenn readwrite nicht '1' ist?
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
        ren => '1',
        raddr => s_addr_table5,
        rdata => s_read_table5,
        wen => readwrite,
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
        wen => readwrite,
        waddr => s_addr_table6,
        wdata => s_write_table6
    );
END spwrouterregs_arch;