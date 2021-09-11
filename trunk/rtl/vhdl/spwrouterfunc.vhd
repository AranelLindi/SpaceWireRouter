LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE WORK.spwrouterpkg.ALL;

PACKAGE spwrouterfunc IS
    GENERIC (
        numports : INTEGER RANGE 0 TO 31
    );

    FUNCTION select7x1(selectBit : STD_LOGIC_VECTOR(numports DOWNTO 0); bits : STD_LOGIC_VECTOR(numports DOWNTO 0)) RETURN STD_LOGIC;
    FUNCTION select7x1xVector8(selectVector : STD_LOGIC_VECTOR(numports DOWNTO 0); bits : array_t(numports DOWNTO 0)(numports DOWNTO 0)) RETURN STD_LOGIC_VECTOR;
    FUNCTION select7x1xVector9(selectVector : STD_LOGIC_VECTOR(numports DOWNTO 0); bits : array_t(numports DOWNTO 0)(8 DOWNTO 0)) RETURN STD_LOGIC_VECTOR;
END PACKAGE;

PACKAGE BODY spwrouterfunc IS
    FUNCTION select7x1 (selectBit : STD_LOGIC_VECTOR(numports DOWNTO 0); bits : STD_LOGIC_VECTOR(numports DOWNTO 0)) RETURN STD_LOGIC IS
        variable cond : STD_LOGIC;
    BEGIN
        --FOR i IN numports DOWNTO 0 LOOP
            --cond := OR (selectBit(i) AND bits(i));
        --END LOOP;

        return or (selectBit and bits); -- unsicher ob das den gleichen Effekt 

        --RETURN cond;
    END select7x1;

    -- wird nicht benötigt
    FUNCTION select7x1xVector8(selectVector : IN STD_LOGIC_VECTOR(numports DOWNTO 0); bits : array_t(numports DOWNTO 0)(numports DOWNTO 0)) RETURN STD_LOGIC_VECTOR IS
    BEGIN
        FOR i IN numports DOWNTO 0 LOOP
            IF (selectVector = STD_LOGIC_VECTOR(to_unsigned(i, selectVector'length))) THEN
                RETURN bits(i);
            END IF;
        END LOOP;

        -- else case
        RETURN STD_LOGIC_VECTOR(to_unsigned(0, numports)); -- länge passt wahrscheinlich nicht
    END select7x1xVector8;

    function select7x1xVector9(selectVector : std_logic_vector(numports DOWNTO 0); bits: array_t(numports DOWNTO 0)(8 downto 0)) return std_logic_vector is
        --variable selected: boolean := false;
        --constant cnull : std_logic_vector(8 downto 0) := (others => '0');
        
        variable vec: std_logic_vector(8 downto 0) := (others => '0');
    begin
        for i in 0 to numports loop -- reihenfolge vertauscht: normalerweise umgekehrt um gleiche prio zu behalten. in diesem fall geht dies aber nicht, da in jeder if abfrage ein return statement ist womit stehts nur bis zur ersten erf�llten bedingung durchlaufen wird und nicht automatisch alle
            if (selectVector(i) = '1') then
                --selected := true;
                --return bits(i);
                vec := bits(i);
                return vec;
            end if;
        end loop;

        -- else case
        --if selected = false then
            --return cnull;
        --end if;
        
        return vec;
    end select7x1xVector9;
END PACKAGE BODY;


-- Anleitung:

--architecture beh of test is
--    package test_pkg is new work.spwrouterfunc
--        generic map (numports => numports);
--
-- https://stackoverflow.com/questions/43324918/vhdl-function-procedure-for-any-type-of-array