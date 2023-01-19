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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;
use WORK.SPWROUTERPKG.ALL;
use WORK.SPWPKG.ALL;

entity spwrouterregs_extended is
    generic (
        -- Number of SpaceWire ports.
        numports : integer range 1 to 32
    );
    Port (
        -- System clock.
        clk : in STD_LOGIC;

        -- Synchronous reset.
        rst : in STD_LOGIC;

        ---- Bus: Routing Table ----
        -- Data read from routing table.
        readTable : out std_logic_vector(31 downto 0);

        -- Routing table address (memory address).
        -- Internal bus is used only if logical address (> 31)
        -- was received before. So it is not necessary to carry
        -- out interval check within the register. An injury is 
        -- hereby excluded completely!
        addrTable : in std_logic_vector(31 downto 0);

        -- High if an operation within routing table is finished.
        ackTable : out std_logic; -- proc

        -- Strobe signal indicating that routing table is being used.
        strobeTable : in std_logic;

        -- Request signal indicating that access to routing table is requested.
        requestTable : in std_logic;

        ---- Bus: Port states/control ----
        -- Contains state of every port according to router register manual.
        portstatus : in array_t(0 to numports-1)(31 downto 0);

        -- Control information for every port according to router register manual.
        portcontrol : out array_t(0 to numports-1)(31 downto 0);

        ---- Bus: Router state/control ----
        -- Register: All ports in run state.
        running : in std_logic_vector(31 downto 0);

        -- Register: WatchDog cycle.
        watchcycle : out std_logic_vector(31 downto 0);

        -- Register: Automatic Time-Code cycle.
        timecycle : out std_logic_vector(31 downto 0);

        -- Register: Last received Time-Code.
        lasttime : in std_logic_vector(7 downto 0);

        -- Register: Last automatically generated Time-Code.
        lastautotime : in std_logic_vector(7 downto 0);

        ---- Access port for extern bus system ----
        -- Bus clock.
        clka : in std_logic;

        -- Addresses the memory spaces for port A. read and write operations.
        addra : in std_logic_vector(31 downto 0);

        -- Data input to be written into the memory through port A.
        dina : in std_logic_vector(31 downto 0);

        -- Data output from read operations through port A.
        douta : out std_logic_vector(31 downto 0);

        -- Enables read, write and reset operations through port A.
        ena : in std_logic;

        -- Resets the port A memory output latch or output registers.
        rsta : in std_logic;

        -- Enables write operations through port A.
        wea : in std_logic_vector(3 downto 0)
    );
end spwrouterregs_extended;

architecture spwrouterregs_extended_arch of spwrouterregs_extended is
    -- Routing table signals.
    signal state : spwroutertablestates := S_Idle;

    -- IO signals.
    signal s_ack_in : std_logic;
    signal s_ack_out : std_logic := '0';

    -- Select signals.
    signal s_table_1 : std_logic; -- Routing Table
    signal s_table_2 : std_logic; -- Port Status & Control
    signal s_table_3 : std_logic; -- Router Registers

    -- Addressing signals.
    signal s_addr_table_1 : std_logic_vector(9 downto 2);
    signal s_addr_table_2 : std_logic_vector(7 downto 2);
    signal s_addr_table_3 : std_logic_vector(7 downto 2);



    -- Slave registers.
    signal slv_reg_routingTable : array_t(32 to 255)(31 downto 0);
    signal slv_reg_portstatus : array_t(0 to numports-1)(31 downto 0);
    signal slv_reg_portcontrol : array_t(0 to numports-1)(31 downto 0);
    signal slv_reg_numports : std_logic_vector(31 downto 0);
    signal slv_reg_running : std_logic_vector(31 downto 0);
    signal slv_reg_watchcycle : std_logic_vector(31 downto 0);
    signal slv_reg_autotimecycle : std_logic_vector(31 downto 0);
    signal slv_reg_lasttc : std_logic_vector(31 downto 0);
    signal slv_reg_lastautotc : std_logic_vector(31 downto 0);
    signal slv_reg_info : std_logic_vector(31 downto 0);


    signal reg_data_out : std_logic_vector(31 downto 0);


    -- User-definied signals declaration.
    signal s_routingTable : array_t(32 to 255)(31 downto 0);
    signal s_portstatus : array_t(0 to numports-1)(31 downto 0);
    signal s_portcontrol : array_t(0 to numports-1)(31 downto 0);
    signal s_numports : std_logic_vector(31 downto 0);
    signal s_running : std_logic_vector(31 downto 0);
    signal s_watchcycle : std_logic_vector(31 downto 0);
    signal s_autotimecycle : std_logic_vector(31 downto 0);
    signal s_lasttc : std_logic_vector(31 downto 0);
    signal s_lastautotc : std_logic_vector(31 downto 0);
    signal s_info : std_logic_vector(31 downto 0);
    -- Add further registers here!
    -- ...     
begin
    -- Intermediate signals.
    s_ack_in <= requestTable and strobeTable;

    -- Drive outputs.
    ackTable <= s_ack_out;

    -- ======================
    --    Internal Busses.
    -- ======================    
    -- Read/Write registes.
    sig_portcontrol : for i in 0 to numports-1 generate
        s_portcontrol(i) <= slv_reg_portcontrol(i);
    end generate sig_portcontrol;

    s_routingTable <= slv_reg_routingTable;
    s_watchcycle <= slv_reg_watchcycle;
    s_autotimecycle <= slv_reg_autotimecycle;


    -- Read only registers.
    sig_portstatus : for i in 0 to numports-1 generate
        slv_reg_portstatus(i) <= s_portstatus(i);
    end generate sig_portstatus;

    slv_reg_numports <= s_numports;
    slv_reg_running <= s_running;
    slv_reg_lasttc <= s_lasttc;
    slv_reg_lastautotc <= s_lastautotc;
    slv_reg_info <= s_info;


    -- Apply r/w register values to IO ports.
    process(clk)
    begin
        if rising_edge(clk) then
            -- Port control.
            for i in 0 to numports-1 loop
                portcontrol(i) <= s_portcontrol(i);
            end loop;

            -- Watchdog cycle.
            watchcycle <= s_watchcycle;

            -- Automatic Time Code cycle.
            timecycle <= s_autotimecycle;
        end if;
    end process;
    

    -- Write values to read-only registers.
    process(clk)
    begin
        if rising_edge(clk) then
            -- Port status.
            for i in 0 to numports-1 loop
                s_portstatus(i) <= portstatus(i);
            end loop;

            -- numports-1.
            s_numports <= std_logic_vector(to_unsigned(numports, s_numports'length));

            -- Running ports.
            s_running <= running;

            -- Last received Time Code.
            s_lasttc <= x"000000" & lasttime;

            -- Last auto Time Code.
            s_lastautotc <= x"000000" & lastautotime;

            -- Info registers.
            s_info <= x"534C3232";
        end if;
    end process;
    
    
    -- Routing table fsm. Manages internal bus access.
    table_fsm : process(clk)
        variable v_index : integer;
    begin
        if rising_edge(clk) then
            if rst = '1' then
                -- Synchronous reset.
                v_index := 0;

                readTable <= (others => '0');
                s_ack_out <= '0';
                state <= S_Idle;
            else
                case state is
                    when S_Idle =>
                        if s_ack_in = '1' then
                            v_index := to_integer(unsigned(addrTable(10 downto 2)));

                            state <= S_Read0;
                        end if;

                    when S_Read0 =>
                        state <= S_Read1;

                    when S_Read1 =>
                        if v_index >= 32 and v_index <= 254 then
                            readTable <= s_routingTable(v_index);----slv_reg_routingTable(v_index);
                        else
                            readTable <= (others => '0');
                        end if;

                        s_ack_out <= '1';

                        state <= S_Wait0;

                    when S_Wait0 =>
                        s_ack_out <= '0';

                        state <= S_Wait1;

                    when S_Wait1 =>
                        state <= S_Wait2;

                    when S_Wait2 =>
                        state <= S_Wait3;

                    when S_Wait3 =>
                        state <= S_Idle;

                    when others => state <= S_Idle;
                end case;
            end if;
        end if;
    end process;


    -- ======================
    --    Extern (CPU) Bus.
    -- ======================  
    -- Process that allows external port access to router registers (read and write).
    process(clka)
    begin
        if rising_edge(clka) then
            if rsta = '1' then
                douta <= (others => '0');
            else
                if ena = '1' then
                    case addra(11 downto 10) is
                        when "00" => -- Routing Table
                            if addra(9 downto 7) /= "000" then -- Check if requested routing table entry is > 31 !
                                for i in 0 to 3 loop
                                    if wea(i) = '1' then
                                        slv_reg_routingTable(to_integer(unsigned(addra(9 downto 2))))((((i + 1) * 8) - 1) downto (i * 8)) <= dina((((i + 1) * 8) - 1) downto (i * 8));
                                    end if;
                                end loop;

                                douta <= slv_reg_routingTable(to_integer(unsigned(addra(9 downto 2))));
                            else
                                douta <= (others => '0');
                            end if;

                        when "01" => -- Router Registers
                            case addra(9 downto 8) is
                                when "00" => -- Port register (Control & Status)
                                    if to_integer(unsigned(addra(7 downto 2))) <= ((2 * numports) - 1) then -- Interval check
                                        if (to_integer(unsigned(addra(7 downto 2))) mod 2) = 0 then
                                            -- Even number: Control
                                            for i in 0 to 3 loop
                                                if wea(i) = '1' then
                                                    slv_reg_portcontrol(to_integer(unsigned(addra(7 downto 2))))((((i + 1) * 8) - 1) downto (i * 8)) <= dina((((i + 1) * 8) - 1) downto (i * 8));
                                                end if;
                                            end loop;

                                            douta <= slv_reg_portcontrol(to_integer(unsigned(addra(7 downto 2))));
                                        else
                                            -- Odd number: Status
                                            douta <= slv_reg_portstatus(to_integer(unsigned(addra(7 downto 2))));
                                        end if;
                                    else
                                        douta <= (others => '0');
                                    end if;
                                    
                                when "01" => -- Router Register
                                    case to_integer(unsigned(addra(7 downto 2))) is
                                        when 0 => -- Numports register
                                            douta <= slv_reg_numports;
                                        when 1 => -- Running register
                                            douta <= slv_reg_running;
                                        when 2 => -- Watchdog cycle register
                                            for i in 0 to 3 loop
                                                if wea(i) = '1' then
                                                    slv_reg_watchcycle((((i + 1) * 8) - 1) downto (i * 8)) <= dina((((i + 1) * 8) - 1) downto (i * 8));
                                                end if;
                                            end loop;

                                            douta <= slv_reg_watchcycle;
                                        when 3 => -- Auto Time Code cycle register
                                            for i in 0 to 3 loop
                                                if wea(i) = '1' then
                                                    slv_reg_autotimecycle((((i + 1) * 8) - 1) downto (i * 8)) <= dina((((i + 1) * 8) - 1) downto (i * 8));
                                                end if;
                                            end loop;

                                            douta <= slv_reg_autotimecycle;
                                        when 4 => -- Last Time Code register
                                            douta <= slv_reg_lasttc;
                                            
                                        when 5 => -- Last automatic Time Code register
                                            douta <= slv_reg_lastautotc;
                                            
                                        when 6 => -- Info register
                                            douta <= slv_reg_info;
                                            
                                        when others => douta <= (others => '0');
                                    end case;

                                when others => douta <= (others => '0');
                            end case;

                        when others =>
                            douta <= (others => '0');

                    end case;
                end if;
            end if;
        end if;
    end process;
end spwrouterregs_extended_arch;