----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 31.07.2021 14:59
-- Design Name: SpaceWire Router Package
-- Module Name: spwrouterpkg
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on a FPGA
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

    -- Pre-defined arrays for implementation types (front-end of receiver/transmitter)
    TYPE rximpl_array IS ARRAY (NATURAL RANGE <>) OF spw_implementation_type_rec;
    TYPE tximpl_array IS ARRAY (NATURAL RANGE <>) OF spw_implementation_type_xmit;

    -- General used types.
    TYPE array_t IS ARRAY(NATURAL RANGE <>) OF STD_LOGIC_VECTOR;
    TYPE matrix_t IS ARRAY(NATURAL RANGE <>, NATURAL RANGE <>) OF STD_LOGIC;
    -- Debug type
    TYPE fsmarr IS ARRAY(NATURAL RANGE <>) OF spwrouterportstates; -- Debug type
    -- Component declarations:
    -- Round Robin Arbiter (spwrouterarb_table.vhd)
    COMPONENT spwrouterarb_round IS
        GENERIC (
            numports : INTEGER RANGE 0 TO 31;
            blen : INTEGER RANGE 0 TO 4
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
            dest : IN array_t(numports DOWNTO 0)(7 DOWNTO 0); -- hier ersten Index umgedreht
            req : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
            grnt : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
            rout : OUT array_t(numports DOWNTO 0)(numports DOWNTO 0) -- hier ersten Index umgedreht
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
            time_out : OUT array_t(0 TO (numports - 1))(7 DOWNTO 0); -- hier ersten Index umgedreht
            tick_in : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            time_in : IN array_t(0 TO (numports - 1))(7 DOWNTO 0); -- hier ersten Index umgedreht
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
            writeData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            readData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            readwrite : IN STD_LOGIC;
            dByte : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            addr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            proc : OUT STD_LOGIC;
            strobe : IN STD_LOGIC;
            cycle : IN STD_LOGIC;
            portstatus : IN array_t(0 TO 31)(31 DOWNTO 0); -- hier ersten Index umgedreht
            receiveTimecode : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            autoTimeCodeValue : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            autoTimeCodeCycleTime : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
    END COMPONENT;

    -- Arbiter for routing table and registers.
    COMPONENT spwrouterarb_table IS
        GENERIC (
            numports : INTEGER RANGE 0 TO 31
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            req : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
            grnt : OUT STD_LOGIC_VECTOR(numports DOWNTO 0)
        );
    END COMPONENT;

    -- Router Port (spwrouterport.vhd)
    COMPONENT spwrouterport IS
        GENERIC (
            numports : INTEGER RANGE 0 TO 31;
            blen : INTEGER RANGE 0 TO 4;
            pnum : INTEGER RANGE 0 TO 31;
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
            linkUp : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
            requestOut : OUT STD_LOGIC;
            destinationPortOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            sourcePortOut : OUT STD_LOGIC_VECTOR(blen DOWNTO 0);
            grantedIn : IN STD_LOGIC;
            strobeOut : OUT STD_LOGIC;
            readyIn : IN STD_LOGIC;
            requestIn : IN STD_LOGIC;
            strobeIn : IN STD_LOGIC;
            readyOut : OUT STD_LOGIC;
            busMasterAddressOut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            busMasterDataIn : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            busMasterDataOut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            busMasterByteEnableOut : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            busMasterWriteEnableOut : OUT STD_LOGIC;
            busMasterStrobeOut : OUT STD_LOGIC;
            busMasterRequestOut : OUT STD_LOGIC;
            busMasterAcknowledgeIn : IN STD_LOGIC;

            -- //pragma synthesis_off
            gotData : OUT STD_LOGIC; -- debug
            sentData : OUT STD_LOGIC; -- debug
            fsmstate : OUT spwrouterportstates; -- debug
            debugdataout : OUT STD_LOGIC_VECTOR(8 DOWNTO 0); -- debug
            -- //pragma synthesis_on

            spw_di : IN STD_LOGIC;
            spw_si : IN STD_LOGIC;
            spw_do : OUT STD_LOGIC;
            spw_so : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Router Entity
    COMPONENT spwrouter IS
        GENERIC (
            numports : INTEGER RANGE 0 TO 31;
            sysfreq : real;
            txclkfreq : real;
            rx_impl : rximpl_array(numports DOWNTO 0);
            tx_impl : tximpl_array(numports DOWNTO 0)
        );
        PORT (
            clk : IN STD_LOGIC;
            rxclk : IN STD_LOGIC;
            txclk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            started : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
            connecting : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
            running : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
            errdisc : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
            errpar : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
            erresc : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
            errcred : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
            gotData : OUT STD_LOGIC_VECTOR(numports DOWNTO 0); -- Debugport
            sentData : OUT STD_LOGIC_VECTOR(numports DOWNTO 0); -- Debugport
            --fsmstate: out fsmarr(numports downto 0); -- Debugport
            --debugdataout : OUT array_t(numports DOWNTO 0)(8 DOWNTO 0); -- Debugport
            --dreadyIn : out std_logic_vector(numports downto 0); -- Debugport
            --drequestIn: out std_logic_vector(numports downto 0); -- Debugport
            --ddataIn : out array_t(numports downto 0)(8 downto 0); -- Debugport
            --dstrobeIn : out std_logic_vector(numports downto 0); -- Debugport
            --dreadyOut: out std_logic_vector(numports downto 0); -- Debugport
            --drequestOut: out std_logic_vector(numports downto 0); -- Debugport
            --ddataOut: out array_t(numports downto 0)(8 downto 0); -- Debugport
            --dstrobeOut: out std_logic_vector(numports downto 0); -- Debugport
            --dgranted: out std_logic_vector(numports downto 0); -- Debugport
            --dSwitchPortNumber: out array_t(numports downto 0)(numports downto 0); -- Debugport
            --dSelectDestinationPort: out array_t(numports downto 0)(numports downto 0); -- Debugport
            --droutingSwitch: out array_t(numports downto 0)(numports downto 0); -- Debugport
            --dsourcePortOut: out array_t(numports downto 0)(1 downto 0); -- Debugport
            --ddestinationPort: out array_t(numports downto 0)(7 downto 0); -- Debugport
            spw_di : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
            spw_si : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
            spw_do : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
            spw_so : OUT STD_LOGIC_VECTOR(numports DOWNTO 0)
        );
    END COMPONENT;
END PACKAGE;