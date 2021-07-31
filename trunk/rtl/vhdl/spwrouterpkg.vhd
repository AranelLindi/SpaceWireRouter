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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- Eventuell fehlt hier 'use ieee.std_logic_unsigned.all;' !
use work.spwpkg.all;

package spwrouterpkg is
    -- Type declarations:

    -- Pre-defined arrays for implementation types (front-end of receiver/transmitter)
    type rximpl_array is array (natural range<>) of spw_implementation_type_rec;
    type tximpl_array is array (natural range<>) of spw_implementation_type_xmit;

    -- Arbiter: Destination of port x
    type logic_vector_array is array(natural range<>) of std_logic_vector(natural range<> downto 0);
    type logic_array is array(natural range<>) of std_logic;
    type logic_matrix is array(natural range<>, natural range<>) of std_logic;

    -- Component declarations:
end package;