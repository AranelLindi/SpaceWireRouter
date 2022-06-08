----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 26.09.2021 17:54
-- Design Name: SpaceWire Router Function Package
-- Module Name: spwrouterfunc
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA
-- Target Devices: Xilinx FPGAs
-- Tool Versions: -/-
-- Description: Contains filtering generic functions.
--
-- Dependencies: array_t (spwrouterpkg)
-- 
-- Revision: 1.0
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.SPWROUTERPKG.ALL;

PACKAGE spwrouterfunc IS
    GENERIC (
        -- Number of SpaceWire ports.
        numports : INTEGER RANGE 0 TO 31
    );

    -- Applies bit mask to an input (filtered bit sequence) and ORs it into one bit. 
    FUNCTION select1(selectBit : STD_LOGIC_VECTOR(numports DOWNTO 0); bits : STD_LOGIC_VECTOR(numports DOWNTO 0)) RETURN STD_LOGIC; -- select7x1

    -- Selects a row (flag & data byte) from a matrix of data depending on the marked port in selectVector that wants to send over the port on which this function is currently being executed.
    FUNCTION select9(selectVector : STD_LOGIC_VECTOR(numports DOWNTO 0); bits : array_t(numports DOWNTO 0)(8 DOWNTO 0)) RETURN STD_LOGIC_VECTOR; -- select7x1xVector9
END PACKAGE;

PACKAGE BODY spwrouterfunc IS
    FUNCTION select1 (selectBit : STD_LOGIC_VECTOR(numports DOWNTO 0); bits : STD_LOGIC_VECTOR(numports DOWNTO 0)) RETURN STD_LOGIC IS -- select7x1
    BEGIN
        RETURN OR (selectBit AND bits); -- Operator overloading (or)
    END select1;

    FUNCTION select9(selectVector : STD_LOGIC_VECTOR(numports DOWNTO 0); bits : array_t(numports DOWNTO 0)(8 DOWNTO 0)) RETURN STD_LOGIC_VECTOR IS -- select7x1xVector9
        VARIABLE vec : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
    BEGIN
        FOR i IN 0 TO numports LOOP
            IF (selectVector(i) = '1') THEN
                vec := bits(i);
                RETURN vec; -- because of this return statement it isn't necessary to reverse prioritization ! (Maybe it works the same if the return statement inside the if-statement is removed (just that towards the end of the function) and the order is reversed (numports DOWNTO 0))
            END IF;
        END LOOP;

        RETURN vec;
    END select9;
END PACKAGE BODY;