----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 11/29/2022 04:49:33 PM
-- Design Name: SpaceWire Router - Control Register extended
-- Module Name: spwrouterregs_extended - spwrouterregs_extended_arch
-- Project Name: Twins4Space
-- Target Devices: Xilinx FPGAs
-- Tool Versions: -/-
-- Description: Contains internel registers and manages reading/writing operations.
-- Provides also port for extern CPU memory access.
-- 
-- Dependencies: 
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;
USE WORK.SPWROUTERPKG.ALL;
USE WORK.SPWPKG.ALL;

USE STD.TEXTIO.ALL; -- used for port control register initialization

ENTITY spwrouterregs_extended IS
    GENERIC (
        -- Number of SpaceWire ports.
        numports : INTEGER RANGE 1 TO 32
    );
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Synchronous reset.
        rst : IN STD_LOGIC;

        ---- Bus: Routing Table ----
        -- Data read from routing table.
        readTable : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- Routing table address (memory address).
        -- Internal bus is used only if logical address (> 31)
        -- was received before. So it is not necessary to carry
        -- out interval check within the register. An injury is 
        -- hereby excluded completely!
        addrTable : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- High if an operation within routing table is finished.
        ackTable : OUT STD_LOGIC; -- proc

        -- Strobe signal indicating that routing table is being used.
        strobeTable : IN STD_LOGIC;

        -- Request signal indicating that access to routing table is requested.
        requestTable : IN STD_LOGIC;

        ---- Bus: Port states/control ----
        -- Contains state of every port according to router register manual.
        portstatus : IN array_t((numports - 1) DOWNTO 0)(31 DOWNTO 0);

        -- Control information for every port according to router register manual.
        portcontrol : OUT array_t((numports - 1) DOWNTO 0)(31 DOWNTO 0);

        ---- Bus: Router state/control ----
        -- Register: All ports in run state.
        running : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- Register: WatchDog cycle.
        watchcycle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- Register: Automatic Time-Code cycle.
        timecycle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- Register: Last received Time-Code.
        lasttime : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- Register: Last automatically generated Time-Code.
        lastautotime : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

        ---- Access port for extern bus system ----
        -- Bus clock.
        clka : IN STD_LOGIC;

        -- Addresses the memory spaces for port A. read and write operations.
        addra : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- Data input to be written into the memory through port A.
        dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- Data output from read operations through port A.
        douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- Enables read, write and reset operations through port A.
        ena : IN STD_LOGIC;

        -- Resets the port A memory output latch or output registers.
        rsta : IN STD_LOGIC;

        -- Enables write operations through port A.
        wea : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END spwrouterregs_extended;

ARCHITECTURE spwrouterregs_extended_arch OF spwrouterregs_extended IS
    -- Function to initialize Port Control registers. 
    -- Each line in file represents a physical port (beginning with 0, ending with numport-1).
    IMPURE FUNCTION init_portcontrol RETURN array_t IS
        FILE text_file : text OPEN read_mode IS "../../syn/MemFiles/PortControl_mem.txt";

        VARIABLE text_line : line;
        VARIABLE ram_content : array_t((numports - 1) DOWNTO 0)(31 DOWNTO 0);
    BEGIN
        FOR i IN 0 TO (numports - 1) LOOP
            readline(text_file, text_line);
            hread(text_line, ram_content(i));
        END LOOP;

        RETURN ram_content;
    END FUNCTION;

    -- Routing table signals.
    SIGNAL state : spwroutertablestates := S_Idle;

    -- IO signals.
    SIGNAL s_ack_in : STD_LOGIC;
    SIGNAL s_ack_out : STD_LOGIC := '0';

    -- Slave registers.
    SIGNAL slv_reg_routingTable : array_t(255 DOWNTO 32)(31 DOWNTO 0);
    SIGNAL slv_reg_portstatus : array_t((numports - 1) DOWNTO 0)(31 DOWNTO 0);
    SIGNAL slv_reg_portcontrol : array_t((numports - 1) DOWNTO 0)(31 DOWNTO 0) := init_portcontrol;
    SIGNAL slv_reg_numports : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL slv_reg_running : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL slv_reg_watchcycle : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL slv_reg_autotimecycle : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL slv_reg_lasttc : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL slv_reg_lastautotc : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL slv_reg_info : STD_LOGIC_VECTOR(31 DOWNTO 0);
    
    SIGNAL reg_data_out : STD_LOGIC_VECTOR(31 DOWNTO 0);

    -- User-definied signals declaration.
    SIGNAL s_routingTable : array_t(255 DOWNTO 32)(31 DOWNTO 0);
    SIGNAL s_portstatus : array_t((numports - 1) DOWNTO 0)(31 DOWNTO 0);
    SIGNAL s_portcontrol : array_t((numports - 1) DOWNTO 0)(31 DOWNTO 0);
    SIGNAL s_numports : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL s_running : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL s_watchcycle : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL s_autotimecycle : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL s_lasttc : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL s_lastautotc : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL s_info : STD_LOGIC_VECTOR(31 DOWNTO 0);
    -- Add further registers here!
    -- ...     
BEGIN
    -- Intermediate signals.
    s_ack_in <= requestTable AND strobeTable;

    -- Drive outputs.
    ackTable <= s_ack_out;

    -- ======================
    --    Internal Busses.
    -- ======================

    -- Read/Write registes.
    sig_portcontrol : FOR i IN 0 TO (numports - 1) GENERATE
        s_portcontrol(i) <= slv_reg_portcontrol(i);
    END GENERATE sig_portcontrol;

    s_routingTable <= slv_reg_routingTable;
    s_watchcycle <= slv_reg_watchcycle;
    s_autotimecycle <= slv_reg_autotimecycle;

    -- Read only registers.
    sig_portstatus : FOR i IN 0 TO (numports - 1) GENERATE
        slv_reg_portstatus(i) <= s_portstatus(i);
    END GENERATE sig_portstatus;

    slv_reg_numports <= s_numports;
    slv_reg_running <= s_running;
    slv_reg_lasttc <= s_lasttc;
    slv_reg_lastautotc <= s_lastautotc;
    slv_reg_info <= s_info;

    -- Apply r/w register values to IO ports.
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            -- Port control.
            FOR i IN 0 TO (numports - 1) LOOP
                portcontrol(i) <= s_portcontrol(i);
            END LOOP;

            -- Watchdog cycle.
            watchcycle <= s_watchcycle;

            -- Automatic Time Code cycle.
            timecycle <= s_autotimecycle;
        END IF;
    END PROCESS;

    -- Write values to read-only registers.
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            -- Port status.
            FOR i IN 0 TO (numports - 1) LOOP
                s_portstatus(i) <= portstatus(i);
            END LOOP;

            -- (numports-1).
            s_numports <= STD_LOGIC_VECTOR(to_unsigned(numports, s_numports'length));

            -- Running ports.
            s_running <= running;

            -- Last received Time Code.
            s_lasttc <= x"000000" & lasttime;

            -- Last auto Time Code.
            s_lastautotc <= x"000000" & lastautotime;

            -- Info registers.
            s_info <= x"534C3232";
        END IF;
    END PROCESS;

    -- Routing table fsm. Manages internal bus access.
    table_fsm : PROCESS (clk)
        VARIABLE v_index : INTEGER;
    BEGIN
        IF rising_edge(clk) THEN
            IF rst = '1' THEN
                -- Synchronous reset.
                v_index := 0;

                readTable <= (OTHERS => '0');
                s_ack_out <= '0';
                state <= S_Idle;
            ELSE
                CASE state IS
                    WHEN S_Idle =>
                        IF s_ack_in = '1' THEN
                            v_index := to_integer(unsigned(addrTable(10 DOWNTO 2)));

                            state <= S_Read0;
                        END IF;

                    WHEN S_Read0 =>
                        state <= S_Read1;

                    WHEN S_Read1 =>
                        IF v_index >= 32 AND v_index <= 254 THEN
                            readTable <= s_routingTable(v_index);----slv_reg_routingTable(v_index);
                        ELSE
                            readTable <= (OTHERS => '0');
                        END IF;

                        s_ack_out <= '1';

                        state <= S_Wait0;

                    WHEN S_Wait0 =>
                        s_ack_out <= '0';

                        state <= S_Wait1;

                    WHEN S_Wait1 =>
                        state <= S_Wait2;

                    WHEN S_Wait2 =>
                        state <= S_Wait3;

                    WHEN S_Wait3 =>
                        state <= S_Idle;

                    WHEN OTHERS => state <= S_Idle;
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    
    -- ======================
    --    Extern (CPU) Bus.
    -- ======================  
    -- Process that allows external port access to router registers (read and write).
    PROCESS (clka)
    BEGIN
        IF rising_edge(clka) THEN
            IF rsta = '1' THEN
                douta <= (OTHERS => '0');
            ELSE
                IF ena = '1' THEN
                    CASE addra(11 DOWNTO 10) IS
                        WHEN "00" => -- Routing Table
                            IF addra(9 DOWNTO 7) /= "000" THEN -- Check if requested routing table entry is > 31 !
                                FOR i IN 0 TO 3 LOOP
                                    IF wea(i) = '1' THEN
                                        slv_reg_routingTable(to_integer(unsigned(addra(9 DOWNTO 2))))((((i + 1) * 8) - 1) DOWNTO (i * 8)) <= dina((((i + 1) * 8) - 1) DOWNTO (i * 8));
                                    END IF;
                                END LOOP;

                                douta <= slv_reg_routingTable(to_integer(unsigned(addra(9 DOWNTO 2))));
                            ELSE
                                douta <= (OTHERS => '0');
                            END IF;

                        WHEN "01" => -- Router Registers
                            CASE addra(9 DOWNTO 8) IS
                                WHEN "00" => -- Port register (Control & Status)
                                    douta <= (OTHERS => '0'); -- Set default value to 0 (for index-out-of-range), otherwise is going to be overwritten by requested value

                                    -- Iterate through all ports (see manual p. 3)
                                    FOR j IN 0 TO (numports - 1) LOOP
                                        IF unsigned(addra(7 DOWNTO 2)) = (2 * j) THEN
                                            -- Even number: port control
                                            FOR k IN 0 TO 3 LOOP
                                                IF wea(k) = '1' THEN
                                                    slv_reg_portcontrol(j)((((k + 1) * 8) - 1) DOWNTO (k * 8)) <= dina((((k + 1) * 8) - 1) DOWNTO (k * 8));
                                                END IF;
                                            END LOOP;

                                            douta <= slv_reg_portcontrol(j);
                                        ELSIF unsigned(addra(7 DOWNTO 2)) = ((2 * j) + 1) THEN
                                            -- Odd number: port status.
                                            douta <= slv_reg_portstatus(j);
                                        END IF;
                                    END LOOP;

                                WHEN "01" => -- Router Register
                                    CASE to_integer(unsigned(addra(7 DOWNTO 2))) IS
                                        WHEN 0 => -- Numports register
                                            douta <= slv_reg_numports;
                                        WHEN 1 => -- Running register
                                            douta <= slv_reg_running;
                                        WHEN 2 => -- Watchdog cycle register
                                            FOR i IN 0 TO 3 LOOP
                                                IF wea(i) = '1' THEN
                                                    slv_reg_watchcycle((((i + 1) * 8) - 1) DOWNTO (i * 8)) <= dina((((i + 1) * 8) - 1) DOWNTO (i * 8));
                                                END IF;
                                            END LOOP;

                                            douta <= slv_reg_watchcycle;
                                        WHEN 3 => -- Auto Time Code cycle register
                                            FOR i IN 0 TO 3 LOOP
                                                IF wea(i) = '1' THEN
                                                    slv_reg_autotimecycle((((i + 1) * 8) - 1) DOWNTO (i * 8)) <= dina((((i + 1) * 8) - 1) DOWNTO (i * 8));
                                                END IF;
                                            END LOOP;

                                            douta <= slv_reg_autotimecycle;
                                        WHEN 4 => -- Last Time Code register
                                            douta <= slv_reg_lasttc;

                                        WHEN 5 => -- Last automatic Time Code register
                                            douta <= slv_reg_lastautotc;

                                        WHEN 6 => -- Info register
                                            douta <= slv_reg_info;

                                        WHEN OTHERS => douta <= (OTHERS => '0');
                                    END CASE;

                                WHEN OTHERS => douta <= (OTHERS => '0');
                            END CASE;

                        WHEN OTHERS =>
                            douta <= (OTHERS => '0');

                    END CASE;
                END IF;
            END IF;
        END IF;
    END PROCESS;
END spwrouterregs_extended_arch;