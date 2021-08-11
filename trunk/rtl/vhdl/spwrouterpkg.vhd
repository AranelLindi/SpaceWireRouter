----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 31.07.2021 14:59
-- Design Name: SpaceWire Router Package
-- Module Name: spwrouterpkg
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: Contains type and component definitions of spwrouter elements.
--
-- Dependencies: none
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL; -- Eventuell fehlt hier 'use ieee.std_logic_unsigned.all;' !
USE work.spwpkg.ALL;

PACKAGE spwrouterpkg IS
    -- Type declarations:

    -- Pre-defined arrays for implementation types (front-end of receiver/transmitter)
    TYPE rximpl_array IS ARRAY (NATURAL RANGE <>) OF spw_implementation_type_rec;
    TYPE tximpl_array IS ARRAY (NATURAL RANGE <>) OF spw_implementation_type_xmit;

    -- General used types.
    TYPE array_t IS ARRAY(NATURAL RANGE <>) OF STD_LOGIC_VECTOR;
    TYPE matrix_t IS ARRAY(NATURAL RANGE <>, NATURAL RANGE <>) OF STD_LOGIC;

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
        S_Write0,
        S_Write1,
        S_Wait0,
        S_Wait1
    ); -- 7

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
        S_Dummy2
    ); -- 14

    -- Component declarations:
    -- Round Robin Arbiter (spwrouterarb_table.vhd)
    COMPONENT spwrouterarb_round IS
        GENERIC (
            numports : INTEGER RANGE 0 TO 31
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            occ : IN STD_LOGIC;
            req : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
            grnt : OUT STD_LOGIC_VECTOR(numports DOWNTO 0)
        );
    END COMPONENT;

    -- (spwrouterarb.vhd)
    COMPONENT spwrouterarb IS
        GENERIC (
            numports : INTEGER RANGE 0 TO 31
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            dest : IN larray(numports DOWNTO 0)(numports DOWNTO 0);
            req : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
            grnt : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
            rout : OUT larray(numports DOWNTO 0)(numports DOWNTO 0)
        );
    END COMPONENT;

    -- TimeCode Controller (spwroutertcc.vhd)
    COMPONENT spwroutertcc IS
        GENERIC (
            numports : INTEGER RANGE 0 TO 31
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            running : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
            lst_time : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            tc_en : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            tick_out : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            time_out : OUT matrix_t((numports - 1) DOWNTO 0, 7 DOWNTO 0);
            tick_in : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            time_in : IN matrix_t((numports - 1) DOWNTO 0, 7 DOWNTO 0);
            auto_time_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            auto_cycle : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
    END COMPONENT;

    -- Router Table (spwroutertable.vhd)
    COMPONENT spwroutertable IS
        GENERIC (
            numports : INTEGER RANGE 0 TO 31
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            act : IN STD_LOGIC;
            readwrite : IN STD_LOGIC;
            dByte : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            addr : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            proc : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Control Register (spwrouterregs.vhd)
    COMPONENT spwrouterregs IS
        GENERIC (
            numports : INTEGER RANGE 0 TO 31
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            txclk : IN STD_LOGIC;
            rxclk : IN STD_LOGIC;
            writeData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            readData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            readwrite : IN STD_LOGIC;
            dByte : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            addr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            proc : OUT STD_LOGIC;
            strobe : IN STD_LOGIC;
            cycle : IN STD_LOGIC;
            portstatus : IN array_t(0 TO 31)(31 DOWNTO 0);
            receiveTimecode : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            autoTimeCodeValue : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            autoTimeCodeCycleTime : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
    END COMPONENT;

    -- Router Port (spwrouterport.vhd)
    component spwrouterport is -- TODO!
    end component;
END PACKAGE;