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
        numports : integer range 0 to 31
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
        addrTable : in std_logic_vector(31 downto 0);

        -- High if an operation within routing table is finished.
        ackTable : out std_logic; -- proc

        -- Strobe signal indicating that routing table is being used.
        strobeTable : in std_logic;

        -- ??? what does cycle
        cycleTable : in std_logic;

        ---- Bus: Port states/control ----
        -- Contains state of every port according to router register manual.
        portstatus : in array_t(0 to numports)(31 downto 0);

        -- Control information for every port according to router register manual.
        portcontrol : out array_t(0 to numports)(31 downto 0);

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
    -- Routing table memory.
    --    type table_ram_type is array(32 to 254) of std_logic_vector(31 downto 0);
    --    shared variable table_ram : table_ram_type;

    -- Port registers.
    --    type port_ram_type is array(0 to (2 * numports) + 1) of std_logic_vector(31 downto 0);
    --    shared variable port_ram : port_ram_type;

    -- Router registers.
    --    type router_ram_type is array(0 to 6) of std_logic_vector(31 downto 0);
    --    shared variable router_ram : router_ram_type;

    -- Routing table signals.
    signal state : spwroutertablestates := S_Idle;

    signal s_ack_in : std_logic;
    signal s_ack_out : std_logic;
    signal s_selectRoutingTable : std_logic;

    -- Slave registers.
    signal slv_reg_routingTable : array_t(32 to 255)(31 downto 0);
    signal slv_reg_portstatus : array_t(0 to numports)(31 downto 0);
    signal slv_reg_portcontrol : array_t(0 to numports)(31 downto 0);
    signal slv_reg_numports : std_logic_vector(31 downto 0);
    signal slv_reg_running : std_logic_vector(31 downto 0);
    signal slv_reg_watchcycle : std_logic_vector(31 downto 0);
    signal slv_reg_autotimecycle : std_logic_vector(31 downto 0);
    signal slv_reg_lasttc : std_logic_vector(31 downto 0);
    signal slv_reg_lastautotc : std_logic_vector(31 downto 0);
    signal slv_reg_info : std_logic_vector(31 downto 0);

    signal slv_reg_rden : std_logic;
    signal slv_reg_wren : std_logic;

    signal reg_data_out : std_logic_vector(31 downto 0);


    -- User-definied signals declaration.
    --    signal s_routingTable : array_t(32 to 255)(31 downto 0);
    signal s_portstatus : array_t(0 to numports)(31 downto 0);
    signal s_portcontrol : array_t(0 to numports)(31 downto 0);
    signal s_numports : std_logic_vector(31 downto 0);-- := std_logic_vector(to_unsigned(numports, s_numports'length));
    signal s_running : std_logic_vector(31 downto 0);
    signal s_watchcycle : std_logic_vector(31 downto 0);
    signal s_autotimecycle : std_logic_vector(31 downto 0);
    signal s_lasttc : std_logic_vector(31 downto 0);
    signal s_lastautotc : std_logic_vector(31 downto 0);
    signal s_info : std_logic_vector(31 downto 0);
    -- Add more registers here!
    -- ...     
begin
    --    s_selectRoutingTable <= '1' when to_integer(unsigned(addrTable(13 downto 2))) > 31 and to_integer(unsigned(addrTable(13 downto 2))) < 256 else '0';
    s_ack_in <= cycleTable and strobeTable;-- and s_selectRoutingTable;

    ackTable <= s_ack_out;


    -- Read/Write registes.
    sig_portcontrol : for i in 0 to numports generate
        s_portcontrol(i) <= slv_reg_portcontrol(i);
    end generate sig_portcontrol;

    s_watchcycle <= slv_reg_watchcycle;
    s_autotimecycle <= slv_reg_autotimecycle;


    -- Read only registers.
    sig_portstatus : for i in 0 to numports generate
        slv_reg_portstatus(i) <= s_portstatus(i);
    end generate sig_portstatus;

    slv_reg_numports <= s_numports;
    slv_reg_running <= s_running;
    slv_reg_lasttc <= s_lasttc;
    slv_reg_lastautotc <= s_lastautotc;
    slv_reg_info <= s_info;


    --slv_reg_wren <= '1' when wea /= "0000" and ena = '1' else '0';
    --slv_reg_rden <= '1' when wea = "0000" and ena = '1' else '0';


    process(slv_reg_routingTable, slv_reg_portstatus, slv_reg_portcontrol, slv_reg_numports, slv_reg_running, slv_reg_watchcycle, slv_reg_autotimecycle, slv_reg_lasttc, slv_reg_lastautotc, slv_reg_info, ena, rsta) -- Add further registers in sensitivity list!
        variable v_index : integer;
    begin
        v_index := to_integer(unsigned(addra(10 downto 2)));

        if v_index >= 32 and v_index <= 254 then
            reg_data_out <= slv_reg_routingTable(v_index);
        elsif v_index >= 256 and v_index < 320 then -- VORSICHT !! HIER NOCH EINE BEGRENZUNG EINFÜHREN. WAS PASSIERT ZUM BEISPIEL WENN EIN NICHT VORHANDENER PORT ADRESSIERT WIRD? DAFÜR EXISTIERT KEINE ZEILE IN PORTSTATUS/PORTCONTROL !!
            if (v_index - 256) <= numports then
                if v_index mod 2 = 0 then
                    reg_data_out <= slv_reg_portcontrol(v_index);
                else
                    reg_data_out <= slv_reg_portstatus(v_index);
                end if;
            else
                reg_data_out <= (others => '0');
            end if;
        elsif v_index >= 320 and v_index < 327 then
            case (v_index - 320) is
                when 0 => -- Numports
                    reg_data_out <= slv_reg_numports;
                when 1 => -- Running ports
                    reg_data_out <= slv_reg_running;
                when 2 => -- Watchdog cycle
                    reg_data_out <= slv_reg_watchcycle;
                when 3 => -- Automatic Time Code cycle
                    reg_data_out <= slv_reg_autotimecycle;
                when 4 => -- Last Time Code
                    reg_data_out <= slv_reg_lasttc;
                when 5 => -- Last automatic Time Code
                    reg_data_out <= slv_reg_lastautotc;
                when 6 => -- Info
                    reg_data_out <= slv_reg_info;
                when others =>
                    reg_data_out <= (others => '0');
            end case;
        else
            reg_data_out <= (others => '0');
        end if;
    end process;


    process(clka)
    begin
        if rising_edge(clka) then
            if ena = '1' then
                douta <= reg_data_out;
            end if;
        end if;
    end process;


    ror_registers : process(clka)
        variable v_index : integer;
    begin
        if rising_edge(clka) then
            if ena = '1' then
                --if slv_reg_wren = '1' then
                v_index := to_integer(unsigned(addra(10 downto 2)));

                if v_index >= 32 and v_index <= 254 then -- 0x080 - 0x3F8
                    -- Routing table (all read/write !)
                    for i in 0 to 3 loop
                        if wea(i) = '1' then
                            slv_reg_routingTable(v_index)((((i + 1) * 8) - 1) downto (i * 8)) <= dina((((i + 1) * 8) - 1) downto (i * 8));
                        end if;
                    end loop;

                elsif v_index >= 256 and v_index < 320 then -- 0x400 - 0x500
                    -- Port registers (mixed read/write !)
                    if v_index mod 2 = 0 then
                        -- read/write
                        for i in 0 to 3 loop
                            if wea(i) = '1' then
                                slv_reg_portcontrol(v_index)((((i + 1) * 8) - 1) downto (i * 8)) <= dina((((i + 1) * 8) - 1) downto (i * 8));
                            end if;
                        end loop;
                    end if;

                elsif v_index >= 320 and v_index < 327 then -- 0x
                    -- Router registers (mixed read/write !)
                    case (v_index - 320) is
                        when 2 => -- Watchdog cycle register (0x0508 - read/write)
                            for i in 0 to 3 loop
                                if wea(i) = '1' then
                                    slv_reg_watchcycle((((i + 1) * 8) - 1) downto (i * 8)) <= dina((((i + 1) * 8) - 1) downto (i * 8));
                                end if;
                            end loop;

                        when 3 => -- Automatic time code cycle register (0x050C - read/write)
                            for i in 0 to 3 loop
                                if wea(i) = '1' then
                                    slv_reg_autotimecycle((((i + 1) * 8) - 1) downto (i * 8)) <= dina((((i + 1) * 8) - 1) downto (i * 8));
                                end if;
                            end loop;

                        when others =>
                            slv_reg_routingTable <= slv_reg_routingTable;
                            slv_reg_portcontrol <= slv_reg_portcontrol;
                            slv_reg_watchcycle <= slv_reg_watchcycle;
                            slv_reg_autotimecycle <= slv_reg_autotimecycle;

                    end case;
                else
                    slv_reg_routingTable <= slv_reg_routingTable;
                    slv_reg_portcontrol <= slv_reg_portcontrol;
                    slv_reg_watchcycle <= slv_reg_watchcycle;
                    slv_reg_autotimecycle <= slv_reg_autotimecycle;
                end if;
                --end if;
            end if;
        end if;
    end process;


    -- Apply r/w register values to io ports.
    process(clka)
    begin
        if rising_edge(clka) then
            -- Port control.
            for i in 0 to numports loop
                portcontrol(i) <= s_portcontrol(i);
            end loop;

            -- Watchdog cycle.
            watchcycle <= s_watchcycle;

            -- Automatic Time Code cycle.
            timecycle <= s_autotimecycle;
        end if;
    end process;

    -- Write values to read-only registers.
    process(clka)
    begin
        if rising_edge(clka) then
            -- Port status.
            for i in 0 to numports loop
                s_portstatus(i) <= portstatus(i);
            end loop;

            -- Numports.
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


    -- Routing table fsm
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
                            readTable <= slv_reg_routingTable(v_index);
                        else
                            readTable <= (others => '0');
                        end if;

                        state <= S_Wait0;

                    when S_Wait0 =>
                        s_ack_out <= '1';

                        state <= S_Wait1;

                    when S_Wait1 =>
                        s_ack_out <= '0';

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
end spwrouterregs_extended_arch;