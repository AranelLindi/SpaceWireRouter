----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer, Frederik Pilz
-- 
-- Create Date: 31.07.2021 14:59
-- Design Name: SpaceWire Router - Package
-- Module Name: spwrouterpkg
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA
-- Target Devices: Xilinx FPGAs
-- Tool Versions: -/-
-- Description: Contains type and component definitions of spwrouter elements.
--
-- Dependencies: none
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.SPWPKG.ALL;

PACKAGE spwrouterpkg IS
    -- Type declarations:
    -- Finite state machine used in router table.
    TYPE spwroutertablestates IS (
        S_Idle,
        S_Write0,
        S_Write1,
        S_Write2,
        S_Read0,
        S_Read1,
        S_Wait0,
        S_Wait1,
        S_Wait2,
        S_Wait3
    ); -- 10

    -- Finite state machine used in control register.
    TYPE spwrouterregsstates IS (
        S_Idle,
        S_Read0,
        S_Read1,
        --        S_Write0,
        --        S_Write1,
        S_Wait0,
        S_Wait1
    ); -- 5

    -- Finite state machine used in spwstream container.
    TYPE spwrouterportstates IS (
        S_Idle,
        S_Dest0,
        S_Dest1,
        S_Dest2,
        S_RT0,
        S_RT1,
        S_RT2,
        S_Data0,
        S_Data1,
        S_Data2,
        S_Data3,
        S_Dummy0,
        S_Dummy1,
        S_Dummy2,
        S_Timeout0,
        S_Timeout1
    ); -- 16

    -- Pre-defined arrays for implementation types (front-end of receiver/transmitter).
    TYPE rximpl_array IS ARRAY (NATURAL RANGE <>) OF spw_implementation_type_rec;
    TYPE tximpl_array IS ARRAY (NATURAL RANGE <>) OF spw_implementation_type_xmit;

    -- General used types.
    TYPE array_t IS ARRAY(NATURAL RANGE <>) OF STD_LOGIC_VECTOR;
    TYPE matrix_t IS ARRAY(NATURAL RANGE <>, NATURAL RANGE <>) OF STD_LOGIC;

    -- Component declarations:
    -- Round Robin arbiter (spwrouterarb_table.vhd).
    COMPONENT spwrouterarb_round IS
        GENERIC (
            numports : INTEGER RANGE 1 TO 32;
            blen : INTEGER RANGE 0 TO 5
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            occupied : IN STD_LOGIC;
            request : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            granted : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0)
        );
    END COMPONENT;

    -- Port arbiter (spwrouterarb.vhd).
    COMPONENT spwrouterarb IS
        GENERIC (
            numports : INTEGER RANGE 1 TO 32;
            blen : INTEGER RANGE 0 TO 5
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            destport : IN array_t((numports - 1) DOWNTO 0)(7 DOWNTO 0);
            request : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            granted : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            routing_matrix : OUT array_t((numports - 1) DOWNTO 0)((numports - 1) DOWNTO 0)
        );
    END COMPONENT;

    -- Time Code controller (spwroutertcc.vhd).
    COMPONENT spwroutertcc IS
        GENERIC (
            numports : INTEGER RANGE 1 TO 32
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            running : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            tc_enable : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            tc_last : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            tick_out : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            tick_in : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            tc_out : OUT array_t((numports - 1) DOWNTO 0)(7 DOWNTO 0);
            tc_in : IN array_t((numports - 1) DOWNTO 0)(7 DOWNTO 0);
            auto_tc_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            auto_interval : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
    END COMPONENT;

    -- Router table (spwroutertable.vhd).
    COMPONENT spwroutertable IS
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            ack_in : IN STD_LOGIC;
            addr : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            ack_out : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Control register (spwrouterregs.vhd).
    COMPONENT spwrouterregs IS
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            writeData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            readData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            addr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            ack : OUT STD_LOGIC;
            strobe : IN STD_LOGIC;
            request : IN STD_LOGIC;
            autoTimeCodeCycleTime : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
    END COMPONENT;

    -- Extended control register (spwrouterregs_ext.vhd)
    COMPONENT spwrouterregs_extended IS
        GENERIC (
            numports : INTEGER RANGE 1 TO 32
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            readTable : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            addrTable : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            ackTable : OUT STD_LOGIC;
            strobeTable : IN STD_LOGIC;
            requestTable : IN STD_LOGIC;
            portstatus : IN array_t((numports - 1) DOWNTO 0)(31 DOWNTO 0);
            portcontrol : OUT array_t((numports - 1) DOWNTO 0)(31 DOWNTO 0);
            running : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            watchcycle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            timecycle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            lasttime : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            lastautotime : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            clka : IN STD_LOGIC;
            addra : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            ena : IN STD_LOGIC;
            rsta : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    -- Arbiter for routing table and registers.
    COMPONENT spwrouterarb_table IS
        GENERIC (
            numports : INTEGER RANGE 1 TO 32
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            request : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            granted : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0)
        );
    END COMPONENT;

    -- Router port (spwrouterport.vhd).
    COMPONENT spwrouterport IS
        GENERIC (
            numports : INTEGER RANGE 1 TO 32;
            blen : INTEGER RANGE 0 TO 5;
            sysfreq : real;
            txclkfreq : real := 0.0;
            rximpl : spw_implementation_type_rec;
            rxchunk : INTEGER RANGE 1 TO 4 := 1;
            WIDTH : INTEGER RANGE 1 TO 3 := 2;
            tximpl : spw_implementation_type_xmit;
            rxfifosize_bits : INTEGER RANGE 6 TO 14 := 11;
            txfifosize_bits : INTEGER RANGE 2 TO 14 := 11
        );
        PORT (
            clk : IN STD_LOGIC;
            rxclk : IN STD_LOGIC;
            txclk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            autostart : IN STD_LOGIC;
            linkstart : IN STD_LOGIC;
            linkdis : IN STD_LOGIC;
            txdivcnt : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            tick_in : IN STD_LOGIC;
            time_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            txdata : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
            txrdy : OUT STD_LOGIC;
            tick_out : OUT STD_LOGIC;
            time_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            rxdata : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
            started : OUT STD_LOGIC;
            connecting : OUT STD_LOGIC;
            running : OUT STD_LOGIC;
            errdisc : OUT STD_LOGIC;
            errpar : OUT STD_LOGIC;
            erresc : OUT STD_LOGIC;
            errcred : OUT STD_LOGIC;
            spw_di : IN STD_LOGIC;
            spw_si : IN STD_LOGIC;
            spw_do : OUT STD_LOGIC;
            spw_so : OUT STD_LOGIC;
            linkstatus : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            request_out : OUT STD_LOGIC;
            request_in : IN STD_LOGIC;
            destination_port : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            arb_granted : IN STD_LOGIC;
            strobe_out : OUT STD_LOGIC;
            strobe_in : IN STD_LOGIC;
            ready_in : IN STD_LOGIC;
            bus_address : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            bus_data_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            bus_dByte : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            bus_readwrite : OUT STD_LOGIC;
            bus_strobe : OUT STD_LOGIC;
            bus_request : OUT STD_LOGIC;
            bus_ack_in : IN STD_LOGIC;
            portstatus : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            watchdog_cycle : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
    END COMPONENT;

    -- Router Entity.
    COMPONENT spwrouter IS
        GENERIC (
            numports : INTEGER RANGE 1 TO 32;
            sysfreq : real;
            txclkfreq : real;
            externPort : BOOLEAN := True;
            rx_impl : rximpl_array((numports - 1) DOWNTO 0);
            tx_impl : tximpl_array((numports - 1) DOWNTO 0)
        );
        PORT (
            clk : IN STD_LOGIC;
            rxclk : IN STD_LOGIC;
            txclk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            started : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            connecting : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            running : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            errdisc : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            errpar : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            erresc : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            errcred : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            spw_di : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            spw_si : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            spw_do : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            spw_so : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            clka : IN STD_LOGIC := '0';
            addra : IN STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
            dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
            douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            ena : IN STD_LOGIC := '0';
            rsta : IN STD_LOGIC := '0';
            wea : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0')
        );
    END COMPONENT;
END PACKAGE;