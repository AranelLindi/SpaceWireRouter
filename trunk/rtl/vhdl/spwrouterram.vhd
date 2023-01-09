----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 11/29/2022 01:29:39 PM
-- Design Name: SpaceWire Router - Dual Port Ram Implementation
-- Module Name: spwrouterram - spwrouterram_arch
-- Project Name: Twins4Space
-- Target Devices: Xilinx FPGAs
-- Tool Versions: -/-
-- Description: Implements a True-Dual-Port RAM with flexible size.
-- 
-- Dependencies: None
-- 
-- Revision:
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity spwrouterram is
    Generic (
        -- Depth of ram.
        size : Integer;

        -- Address width.
        addr_width : integer;

        -- Column width.
        col_width : integer := 8;

        -- Number of columns.
        nb_col : integer := 4
    );
    Port (
        -- Clock of Port A.
        clka : in STD_LOGIC;

        -- Clock of Port B.
        clkb : in STD_LOGIC;

        -- Enables read, write and reset operations through Port A.
        ena : in STD_LOGIC;

        -- Enables read, write and reset operations through Port B.
        enb : in STD_LOGIC;

        -- Enables write operations through Port A.
        wea : in STD_LOGIC_VECTOR((nb_col - 1) downto 0);

        -- Enables write operations through Port B. 
        web : in STD_LOGIC_VECTOR((nb_col - 1) downto 0);

        -- Addresses the memory spaces for Port A. Read and write operations.
        addra : in STD_LOGIC_VECTOR ((addr_width - 1) downto 0);

        -- Addresses the memory spaces for Port B. Read and write operations.
        addrb : in STD_LOGIC_VECTOR ((addr_width - 1) downto 0);

        -- Data input to be written into the memory through Port A.
        dia : in STD_LOGIC_VECTOR ((nb_col * col_width) downto 0);

        -- Data input to be written into the memory through Port B.
        dib : in STD_LOGIC_VECTOR ((nb_col * col_width) downto 0);

        -- Data output from read operations through Port A.
        doa : out STD_LOGIC_VECTOR ((nb_col * col_width) downto 0);

        -- Data output from read operations through Port B.
        dob : out STD_LOGIC_VECTOR ((nb_col * col_width) downto 0));
end spwrouterram;

architecture spwrouterram_arch of spwrouterram is
    type ram_type is array(0 to (size - 1)) of std_logic_vector(((nb_col * col_width) - 1) downto 0);

    shared variable ram : ram_type := (others => (others => '0'));
begin
    PortA : process(clka)
    begin
        if rising_edge(clka) then
            if ena = '1' then
                -- Write operation.
                for i in 0 to (nb_col - 1) loop
                    if wea(i) = '1' then
                        ram(to_integer(unsigned(addra)))((((i + 1) * col_width) - 1) downto (i * col_width)) := dia((((i + 1) * col_width) - 1) downto (i * col_width));
                    end if;
                end loop;

                -- Read operation.
                doa <= ram(to_integer(unsigned(addra)));
            end if;
        end if;
    end process;

    PortB : process(clkb)
    begin
        if rising_edge(clkb) then
            if enb = '1' then
                -- Write operation.
                for i in 0 to (nb_col - 1) loop
                    if web(i) = '1' then
                        ram(to_integer(unsigned(addrb)))((((i + 1) * col_width) - 1) downto (i * col_width)) := dib((((i + 1) * col_width) - 1) downto (i * col_width));
                    end if;
                end loop;

                -- Read operation.
                dob <= ram(to_integer(unsigned(addrb)));
            end if;
        end if;
    end process;
end spwrouterram_arch;