LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE WORK.spwrouterpkg.ALL;

PACKAGE spwrouterfunc IS
    GENERIC (
        numports : INTEGER RANGE 0 TO 31
    );

    FUNCTION select7x1(selectBit : STD_LOGIC_VECTOR(0 TO numports); bits : STD_LOGIC_VECTOR(0 TO numports)) RETURN STD_LOGIC;
    FUNCTION select7x1xVector8(selectVector : STD_LOGIC_VECTOR(0 TO numports); bits : array_t(0 TO numports)(numports DOWNTO 0)) RETURN STD_LOGIC_VECTOR;
    FUNCTION select7x1xVector9(selectVector : STD_LOGIC_VECTOR(0 TO numports); bits : array_t(0 TO numports)(numports DOWNTO 0)) RETURN STD_LOGIC_VECTOR;
END PACKAGE;

PACKAGE BODY spwrouterfunc IS
    FUNCTION select7x1 (selectBit : STD_LOGIC_VECTOR(0 TO numports); bits : STD_LOGIC_VECTOR(0 TO numports)) RETURN STD_LOGIC IS
        SIGNAL cond : STD_LOGIC;
    BEGIN
        FOR i IN 0 TO numports LOOP
            cond <= OR (selectBit(i) AND bits(i));
        END LOOP;

        RETURN cond;
    END select7x1;

    FUNCTION select7x1xVector8(selectVector : IN STD_LOGIC_VECTOR(0 TO numports); bits : array_t(0 TO numports)(numports DOWNTO 0)) RETURN STD_LOGIC_VECTOR IS
    BEGIN
        FOR i IN numports DOWNTO 0 LOOP
            IF (selectVector = STD_LOGIC_VECTOR(to_unsigned(i, selectVector'length))) THEN
                RETURN bits(i);
            END IF;
        END LOOP;

        -- else case
        RETURN STD_LOGIC_VECTOR(to_unsigned(0, numports)); -- länge passt wahrscheinlich nicht
    END select7x1xVector8;

    function select7x1xVector9(selectVector : std_logic_vector(0 to numports); bits: array_t(0 to numports)(numports downto 0)) return std_logic_vector is
    begin
        for i in numports downto 0 loop
            if (selectVector = std_logic_vector(to_unsigned(i, selectVector'length))) then
                return bits(i);
            end if;
        end loop;

        -- else case
        return std_logic_vector(to_unsigned(0, numports)); -- länge passt wahrscheinlich nicht
    end select7x1xVector9;
END PACKAGE BODY;


-- Anleitung:

--architecture beh of test is
--    package test_pkg is new work.spwrouterfunc
--        generic map (numports => numports);
--
-- https://stackoverflow.com/questions/43324918/vhdl-function-procedure-for-any-type-of-array