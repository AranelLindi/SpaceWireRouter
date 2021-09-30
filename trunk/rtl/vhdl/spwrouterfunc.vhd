----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 26.09.2021 17:54
-- Design Name: SpaceWire Router Function Package
-- Module Name: spwrouterfunc
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--
-- Dependencies: spwrouterpkg
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE WORK.spwrouterpkg.ALL;

PACKAGE spwrouterfunc IS
    GENERIC (
        numports : INTEGER RANGE 0 TO 31
    );

    FUNCTION select7x1(selectBit : STD_LOGIC_VECTOR(numports DOWNTO 0); bits : STD_LOGIC_VECTOR(numports DOWNTO 0)) RETURN STD_LOGIC;
    FUNCTION select7x1xVector9(selectVector : STD_LOGIC_VECTOR(numports DOWNTO 0); bits : array_t(numports DOWNTO 0)(8 DOWNTO 0)) RETURN STD_LOGIC_VECTOR;
END PACKAGE;

PACKAGE BODY spwrouterfunc IS
    FUNCTION select7x1 (selectBit : STD_LOGIC_VECTOR(numports DOWNTO 0); bits : STD_LOGIC_VECTOR(numports DOWNTO 0)) RETURN STD_LOGIC IS
        VARIABLE cond : STD_LOGIC;
    BEGIN
        RETURN OR (selectBit AND bits); -- Operator overloading (or)
    END select7x1;

    FUNCTION select7x1xVector9(selectVector : STD_LOGIC_VECTOR(numports DOWNTO 0); bits : array_t(numports DOWNTO 0)(8 DOWNTO 0)) RETURN STD_LOGIC_VECTOR IS
        VARIABLE vec : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
    BEGIN
        FOR i IN 0 TO numports LOOP -- reihenfolge vertauscht: normalerweise umgekehrt um gleiche prio zu behalten. in diesem fall geht dies aber nicht, da in jeder if abfrage ein return statement ist womit stehts nur bis zur ersten erf�llten bedingung durchlaufen wird und nicht automatisch alle
            IF (selectVector(i) = '1') THEN
                vec := bits(i);
                RETURN vec;
            END IF;
        END LOOP;

        RETURN vec;
    END select7x1xVector9;
END PACKAGE BODY;
-- Instructions:

--architecture beh of test is
--    package test_pkg is new work.spwrouterfunc
--        generic map (numports => numports);
--
-- https://stackoverflow.com/questions/43324918/vhdl-function-procedure-for-any-type-of-array