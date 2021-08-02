----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 01.08.2021 21:13
-- Design Name: SpaceWire Router Table
-- Module Name: spwroutertable
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- Dependencies: none
-- 
-- Revision:
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.spwrouterpkg.all;

entity spwroutertable is
    generic (
        -- Number of SpaceWire ports.
        numports: integer range 0 to 31
    );
    port (
        -- System clock.
        clk: in std_logic;

        -- Synchronous reset.
        rst: in std_logic;


    );
end spwroutertable;

architecture spwroutertable_arch of spwroutertable is
    signal state: spwroutertablestates := S_Idle;
begin

    -- Finite state machine of router table.
    process(clk, rst)
    begin
        if (rst = '1') THEN
            state <= S_Idle;

        elsif rising_edge(clk) THEN
            case state is
                when S_Idle =>
                when S_Write =>
                when S_Read =>
                when S_Wait =>
            end case;
        end if;
    end process;
end spwroutertable_arch;
