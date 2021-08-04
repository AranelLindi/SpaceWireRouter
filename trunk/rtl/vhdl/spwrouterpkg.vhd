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
-- Description: 
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

    -- Generel used types.
    TYPE array_t IS ARRAY(NATURAL RANGE <>) OF STD_LOGIC_VECTOR(NATURAL RANGE <>);
    TYPE matrix_t IS ARRAY(NATURAL RANGE <>, NATURAL RANGE <>) OF STD_LOGIC;

    -- Finite state machine used in router table.
    TYPE spwroutertablestates IS
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
        );

    -- Component declarations:
    -- Round Robin Arbiter
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

    COMPONENT spwrouterarb IS
        GENERIC (
            numports : INTEGER RANGE 0 TO 31
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            dest : IN larray(numports DOWNTO 0) OF STD_LOGIC_VECTOR(numports DOWNTO 0);
            req : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
            grnt : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);
            rout : OUT larray(numports DOWNTO 0) OF STD_LOGIC_VECTOR(numports DOWNTO 0)
        );
    END COMPONENT;

    -- TimeCode Controller
    COMPONENT spwroutertcc IS
        GENERIC (
            numports : INTEGER RANGE 0 TO 31
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            running : IN STD_LOGIC_VECTOR(numports DOWNTO 0);
            lst_time : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            tick_in : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            tick_out : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            time_out : OUT matrix_t((numports - 1) DOWNTO 0, 7 DOWNTO 0);
            tick_in : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);
            time_in : IN matrix_t((numports - 1) DOWNTO 0, 7 DOWNTO 0);
            auto_time_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            auto_cycle : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
    END PACKAGE;