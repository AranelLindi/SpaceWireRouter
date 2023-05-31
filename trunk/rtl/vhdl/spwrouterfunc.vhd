----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 26.09.2021 17:54
-- Design Name: SpaceWire Router - Function Package
-- Module Name: spwrouterfunc
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA
-- Target Devices: Xilinx FPGAs
-- Tool Versions: -/-
-- Description: Contains filtering generic functions.
--
-- Dependencies: spwrouterpkg
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.SPWROUTERPKG.ALL;

PACKAGE spwrouterfunc IS
    GENERIC (
        -- Number of SpaceWire ports.
        numports : INTEGER RANGE 1 TO 32
    );

    -- Applies bit mask to an input (filtered bit sequence) and ORs it into one bit. 
    FUNCTION select_port(selectBit : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); bits : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0)) RETURN STD_LOGIC; -- select7x1

    -- Selects a row (flag + data byte == 9 bits) from a matrix of data depending on the marked port in selectVector that wants to send over the port on which this function is currently being executed.
    FUNCTION select_nchar(selectVector : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); bits : array_t((numports - 1) DOWNTO 0)(8 DOWNTO 0)) RETURN STD_LOGIC_VECTOR; -- select7x1xVector9
    
    -- Operator overloading.
    FUNCTION "OR"(R: array_t((numports - 1) DOWNTO 0)((numports - 1) DOWNTO 0)) RETURN STD_LOGIC_VECTOR;
    
    -- Returns whether two or more bits in a vector are set.
    FUNCTION two_or_more(vec: STD_LOGIC_VECTOR((numports - 1) DOWNTO 0)) RETURN STD_LOGIC;
END PACKAGE;

PACKAGE BODY spwrouterfunc IS
    FUNCTION select_port (selectBit : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); bits : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0)) RETURN STD_LOGIC IS -- select7x1
    BEGIN
        RETURN OR (selectBit AND bits); -- Operator overloading (or)
    END select_port;

    FUNCTION select_nchar(selectVector : STD_LOGIC_VECTOR((numports - 1) DOWNTO 0); bits : array_t((numports - 1) DOWNTO 0)(8 DOWNTO 0)) RETURN STD_LOGIC_VECTOR IS -- select7x1xVector9
        VARIABLE vec : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
    BEGIN
        FOR i IN 0 TO (numports - 1) LOOP
            IF (selectVector(i) = '1') THEN
                vec := bits(i);
                RETURN vec; -- because of this return statement it isn't necessary to reverse prioritization ! (Maybe it works the same if the return statement inside the if-statement is removed (just that towards the end of the function) and the order is reversed ((numports-1) DOWNTO 0))
            END IF;
        END LOOP;

        RETURN vec;
    END select_nchar;
    
    FUNCTION "OR" (R: array_t((numports - 1) DOWNTO 0)((numports - 1) DOWNTO 0)) RETURN STD_LOGIC_VECTOR IS
        VARIABLE vec: STD_LOGIC_VECTOR((numports - 1) DOWNTO 0) := (OTHERS => '0');
    BEGIN
        FOR i IN 0 TO (numports - 1) LOOP
            vec := vec OR R(i);
        END LOOP;
        
        RETURN vec;
    END "OR";
    
    FUNCTION two_or_more(vec: STD_LOGIC_VECTOR((numports - 1) DOWNTO 0)) RETURN STD_LOGIC IS
        VARIABLE one: STD_LOGIC := '0';
    BEGIN
        FOR i IN (numports - 1) DOWNTO 0 LOOP
            IF one = '1' AND vec(i) = '1' THEN
                RETURN '1';
            
            ELSIF vec(i) = '1' THEN -- one is '0' here
                one := '1';
            
            END IF;
        END LOOP;
        
        RETURN '0';
    END two_or_more;
END PACKAGE BODY;