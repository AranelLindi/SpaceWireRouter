----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 04.08.2021 14:28
-- Design Name: SpaceWire Router - Control Register
-- Module Name: spwrouterregs
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA
-- Target Devices: Xilinx FPGAs
-- Tool Versions: -/-
-- Description: Contains internal registers and manages reading and writing
-- operations. 
--
-- Dependencies: spwrouterpkg
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.SPWROUTERPKG.ALL;
USE WORK.SPWPKG.ALL;

USE STD.TEXTIO.ALL; -- Used for ROM initialization.

ENTITY spwrouterregs IS
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Asynchronous reset.
        rst : IN STD_LOGIC;

        -- Data to write into register. (Everything that has no own writing port)
        writeData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- Data to read from register. (Router Table or general data)
        readData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- Memory address. Depending on bit assignment, operation
        -- is carried out in corresponding table or routing table.
        addr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- High for one clock cycle if valid data is on output.
        ack : OUT STD_LOGIC;

        -- High if access to routing table is made.
        strobe : IN STD_LOGIC;

        -- High if access to routing table is requested.
        request : IN STD_LOGIC;

        -- Time interval in which an automatically Time Code is generated.
        autoTimeCodeCycleTime : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END spwrouterregs;

ARCHITECTURE spwrouterregs_arch OF spwrouterregs IS
    -- Function to initialize automatically Time Code generation interval. (Time Code Cycle)
    -- Text file must not contain more than one line with a 32 bit word (8 digits of a hexadecimal number) !
    impure function init_auto_cycle return std_logic_vector is
        file text_file : text open read_mode is "../../syn/MemFiles/TimeCodeCycle_mem.txt";

        variable text_line : line;
        variable content : std_logic_vector(31 downto 0);
    begin
        readline(text_file, text_line);
        hread(text_line, content);

        return content;
    end function;

    -- Automatic Time-Code Cycle.
    constant c_auto_cycle : std_logic_vector(31 downto 0) := init_auto_cycle;

    -- Buffer for output ports.
    SIGNAL s_readData : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL s_ack_out : STD_LOGIC;

    -- Determines wheather routing table is selected.
    SIGNAL s_selectRoutingTable : STD_LOGIC;

    -- Controls read access to routing table.
    SIGNAL s_strobeRoutingTable : STD_LOGIC;

    -- Contains data that should read or write from/into routing table.
    SIGNAL s_dataRoutingTable : STD_LOGIC_VECTOR(31 DOWNTO 0);

    -- Indicates whether read process is currently made on routing table.
    SIGNAL s_ackRoutingTable : STD_LOGIC;

    -- Intermediate signals.
    SIGNAL s_ack : STD_LOGIC;

    -- FSM state.
    SIGNAL state : spwrouterregsstates := S_Idle;
BEGIN
    -- Drive outputs.   
    ack <= s_ack;
    s_ack <= s_ackRoutingTable OR s_ack_out;
    readData <= s_readData;
    s_strobeRoutingTable <= request AND strobe AND s_selectRoutingTable;
    autoTimeCodeCycleTime <= c_auto_cycle;

    -- Decides what data was requested and writes it in general output port.
    s_readData <= s_dataRoutingTable WHEN s_selectRoutingTable = '1' ELSE
                  (others => '0');

    -- Address decoding and table selection. Logic addressing with ports 32 to 254 (saved in routing table).
    s_selectRoutingTable <= '1' WHEN unsigned(addr(13 DOWNTO 2)) > to_unsigned(31, 12) AND unsigned(addr(13 DOWNTO 2)) <= to_unsigned(256, 12) ELSE '0';


    -- Routing table.
    RoutingTable : spwroutertable
        PORT MAP(
            clk => clk,
            rst => rst,
            ack_in => s_strobeRoutingTable,
            addr => addr(9 DOWNTO 2), -- maps hexadecimal numbers to decimals beginning with 0 step 1.
            rdata => s_dataRoutingTable,
            ack_out => s_ackRoutingTable
        );


    -- FSM - controls read access to registers.
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF rst = '1' THEN
                -- Synchronous reset.
                s_ack_out <= '0';
                state <= S_Idle;
            -- x"0BEBC200" (alle 2 sec wird ein neues automatisches Time Code generiert)
            ELSE

                CASE state IS
                    WHEN S_Idle =>
                        IF ((s_selectRoutingTable = '0') AND (request = '1') AND (strobe = '1')) THEN
                            state <= S_Read0;
                        END IF;

                    WHEN S_Read0 =>
                        -- 
                        s_ack_out <= '1';
                        state <= S_Read1;

                    WHEN S_Read1 => -- Read register end.
                        s_ack_out <= '0';
                        state <= S_Wait0;

                    WHEN S_Wait0 => -- Write register wait.
                        state <= S_Wait1;

                    WHEN S_Wait1 =>
                        state <= S_Idle;

                END CASE;
            END IF;
        END IF;
    END PROCESS;
END spwrouterregs_arch;