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
    type table_ram_type is array(32 to 254) of std_logic_vector(31 downto 0);
    shared variable table_ram : table_ram_type;

    -- Port registers.
    type port_ram_type is array(0 to (2 * numports) + 1) of std_logic_vector(31 downto 0);
    shared variable port_ram : port_ram_type;

    -- Router registers.
    type router_ram_type is array(0 to 6) of std_logic_vector(31 downto 0);
    shared variable router_ram : router_ram_type;

    -- Routing table signals.
    signal state : spwroutertablestates := S_Idle;

    signal s_ack_in : std_logic;
    signal s_ack_out : std_logic;
    signal s_selectRoutingTable : std_logic;



    -- Ab hier: neu! --
    CONSTANT blen : INTEGER RANGE 0 TO 5 := INTEGER(ceil(log2(real(numports)))); -- Necessary number of bits to represent [numport]-ports

    -- Portstatus/-control.
    signal s_portcounter : integer range 0 to numports := 0;

    -- Ram signals.
    signal s_portaddress : std_logic_vector(blen-1 downto 0); -- Funktioniert das so mit blen-1? Falls ja, dann kann in den Routerfiles theoretisch auch auf eine Stelle verzichtet werden - Checken!
    signal s_portwe : std_logic_vector(7 downto 0) := x"f0";
    signal s_portdata : 
begin
    s_selectRoutingTable <= '1' when to_integer(unsigned(addrTable(13 downto 2))) > 31 and to_integer(unsigned(addrTable(13 downto 2))) < 256 else '0';
    s_ack_in <= cycleTable and strobeTable and s_selectRoutingTable;

    ackTable <= s_ack_out;



    -- Dran denken: Wortbreite des Speichers muss 64 Bit betragen damit die Abfrage effizienter verläuft!
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                -- Synchronous reset.
                s_portcounter <= 0;
            else
                s_portaddress <= std_logic_vector(to_unsigned(s_portcounter, s_portaddress'length));
                s_portcontrol(i) <= s_portrdata(32 downto 0);

                s_portwdata <= s_portstatus & x"00000000"; -- Hier genauestens prüfen, ob wirklich auch der gleiche Port die Zuweisung bekommt!! (Und nicht der vorhergehende/nachfolgende)


                -- Increment counter.
                if s_portcounter = numports then
                    s_portcounter <= 0;
                else
                    s_portcounter <= s_portcounter + 1;
                end if;
            end if;
        end if;
    end process;

    process(clka)
    begin
        if rising_edge(clka) then
            if rsta = '1' then
                -- Synchronous reset.
            else

            end if;
        end if;
    end process;



















    port_registers : process(clk)
    begin
        if rising_edge(clk) then
            for i in 0 to numports loop
                portcontrol(i) <= port_ram(i * 2);
                port_ram(i * 2 + 1) := portstatus(i);
            end loop;
        end if;
    end process;

    router_registers : process(clk)
    begin
        if rising_edge(clk) then
            -- read only
            router_ram(0) := std_logic_vector(to_unsigned(numports, router_ram(0)'length)); -- Numports register (0x0500)
            router_ram(1) := running; -- Running ports register (0x0504)
            router_ram(4) := x"000000" & lasttime; -- Last time code register (0x0510)
            router_ram(5) := x"000000" & lastautotime; -- Last auto time code register (0x0514)
            router_ram(6) := x"534C3232"; -- Info register (0x0518)

            -- read/write
            watchcycle <= router_ram(2); -- Watchdog cycle register (0x0508)
            timecycle <= router_ram(3); -- Automatic time code cycle register (0x050C)
        end if;
    end process router_registers;


    ror_registers : process(clka)
        variable v_index : integer;
    begin
        if rising_edge(clka) then
            if ena = '1' then
                v_index := to_integer(unsigned(addra(10 downto 2)));

                if v_index >= 32 and v_index <= 254 then -- 0x080 - 0x3F8
                    -- Routing table (all read/write !)
                    for i in 0 to 3 loop
                        if wea(i) = '1' then
                            table_ram(v_index)((((i + 1) * 8) - 1) downto (i * 8)) := dina((((i + 1) * 8) - 1) downto (i * 8));
                        end if;
                    end loop;

                    douta <= table_ram(v_index);

                elsif v_index >= 256 and v_index < 320 then -- 0x400 - 0x500
                    -- Port registers (mixed read/write !)
                    if v_index mod 2 = 0 then
                        -- read/write
                        for i in 0 to 3 loop
                            if wea(i) = '1' then
                                port_ram(v_index)((((i + 1) * 8) - 1) downto (i * 8)) := dina((((i + 1) * 8) - 1) downto (i * 8)); -- hier muss noch was hin, damit die mapping auf 64 wortbreite korrekt funktioniert!
                            end if;
                        end loop;

                        douta <= port_ram(v_index);
                    else
                        -- read only
                        douta <= port_ram(v_index);
                    end if;

                elsif v_index >= 320 and v_index < 327 then -- 0x
                    -- Router registers (mixed read/write !)
                    case (v_index - 320) is
                        when 0 => -- Numport registers (0x0500 - read only)
                            douta <= router_ram(0);

                        when 1 => -- Running ports register (0x0504 - read only)
                            douta <= router_ram(1);

                        when 2 => -- Watchdog cycle register (0x0508 - read/write)
                            for i in 0 to 3 loop
                                if wea(i) = '1' then
                                    router_ram(2)((((i + 1) * 8) - 1) downto (i * 8)) := dina((((i + 1) * 8) - 1) downto (i * 8));
                                end if;
                            end loop;

                            douta <= router_ram(2);

                        when 3 => -- Automatic time code cycle register (0x050C - read/write)
                            for i in 0 to 3 loop
                                if wea(i) = '1' then
                                    router_ram(3)((((i + 1) * 8) - 1) downto (i * 8)) := dina((((i + 1) * 8) - 1) downto (i * 8));
                                end if;
                            end loop;

                            douta <= router_ram(3);

                        when 4 => -- Last time code register (0x0510 - read only)
                            douta <= router_ram(4);

                        when 5 => -- Last auto time code registe (0x0514 - read only)
                            douta <= router_ram(5);

                        when 6 => -- Info register (0x0518 - read only)
                            douta <= router_ram(6);

                        when others =>
                            douta <= (others => '0');
                    end case;
                else

                end if;
            end if;
        end if;
    end process;

    -- Routing table fsm
    table_fsm : process(clk)
        variable v_index : integer;
    begin
        if rising_edge(clk) then
            if rst = '1' then
            -- Synchronous reset.
            else
                case state is
                    when S_Idle =>
                        if s_ack_in = '1' then
                            v_index := to_integer(unsigned(addrTable(9 downto 2)));

                            state <= S_Read0;
                        end if;

                    when S_Read0 =>
                        if v_index >= 32 then
                            readTable <= table_ram(v_index-32);
                        else
                            readTable <= (others => '0');
                        end if;

                        s_ack_out <= '1';

                        state <= S_Read1;

                    when S_Read1 =>
                        s_ack_out <= '0';

                        state <= S_Wait0;

                    when S_Wait0 =>
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

end spwrouterregs_extended_arch;