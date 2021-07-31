----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 31.07.2021 12:53
-- Design Name: SpaceWire Router Top Module
-- Module Name: spwrouter
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
USE work.spwpkg.ALL;
USE work.spwrouterpkg.ALL;

ENTITY spwrouter IS
    GENERIC (
        -- Number of SpaceWire ports (1 to 31; 0 is internal port)
        numports : INTEGER RANGE 1 TO 32

        -- System clock frequency in Hz.
        sysfreq : real;

        -- txclk frequency in Hz (if tximpl = impl_fast)
        txclkfreq : real;

        -- 2-log of division factor from system clock freq to timecode freq.
        tickdiv : INTEGER RANGE 12 TO 24 := 20;

        -- Receiver front-end implementation for every port. (Used syntax requires VHDL-2008!)
        rximpl : rximpl_array((numports - 1) DOWNTO 0) := (OTHERS => impl_generic);

        -- Maximum number of bits received per system clock (impl_fast only).
        rxchunk : INTEGER RANGE 1 TO 4 := 1;

        -- Width of shift registers for synchronization depending on transmission rate (impl_clkrec only).
        WIDTH : INTEGER RANGE 1 TO 3 := 2;

        -- Transmitter implementation for every port. (Used syntax requires VHDL-2008!)
        tximpl : tximpl_array((numports - 1) DOWNTO 0) := (OTHERS => impl_generic);

        -- Size of the receive FIFO as the 2-logarithm of the number of bytes.
        -- Must be at least 6 (64 bytes)
        rxfifosize_bits : INTEGER RANGE 6 TO 14 := 11;

        -- Size of the transmit FIFO as the 2-logarithm of the number of bytes.
        txfifosize_bits : INTEGER RANGE 2 TO 14 := 11
    );
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Receiver sample clock (only for impl_fast).
        rxclk : IN STD_LOGIC;

        -- Transmit clock (only for impl_fast).
        txclk : IN STD_LOGIC;

        -- Router reset signal.
        rst : IN STD_LOGIC;

        -- Data In signal from SpaceWire bus.
        spw_di : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- Strobe In signal from SpaceWire bus.
        spw_si : IN STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- Data Out signal from SpaceWire bus.
        spw_do : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0);

        -- Strobe Out signal from SpaceWire bus.
        spw_do : OUT STD_LOGIC_VECTOR((numports - 1) DOWNTO 0)
        -- More ports eventually in further development process
    );
END spwrouter;

ARCHITECTURE spwrouter_arch OF spwrouter IS
    -- Define signals here!

BEGIN
    -- Generate (numports-1) physical ports including port 0 (internal port)
    gen_ports : FOR i IN 1 TO (numports - 1) GENERATE
        portX : spwstream GENERIC MAP(
            sysfreq => sysfreq,
            txclkfreq => txclkfreq,
            rximpl => rximpl(i),
            rxchunk => rxchunk,
            tximpl => tximpl(i),
            rxfifosize_bits => rxfifosize_bits,
            txfifosize_bits => txfifosize_bits,
            WIDTH => WIDTH
        )
        PORT MAP(
            clk          => clk,
            rxclk        => rxclk,
            txclk        => txclk,
            rst          => rst,
            autostart    => '1', -- every port uses autostart!
            linkstart    => OPEN,
            linkdis      => OPEN,
            txdivcnt     => (OTHERS => '0'),
            tick_in      => tick_in, -- array?!
            ctrl_in      => (OTHERS => '0'),
            time_in      => time_in, -- array?!
            txwrite      => txwrite, -- matrix?! (numports-1 x 8 bits)
            txflag       => txflag, -- array?!
            txdata       => txdata, -- matrix?! (numports-1 x 8 bits)
            txrdy        => txrdy, -- array?!
            txhalff      => OPEN,
            tick_out     => tick_out, -- array?!
            ctrl_out     => OPEN,
            time_out     => time_out, -- array?!
            rxvalid      => rxvalid, -- array?!
            rxhalff      => OPEN,
            rxflag       => rxflag, -- array?!
            rxdata       => rxdata, -- matrix?! (numports-1 x 8 bits)
            rxread       => rxread, -- array?!
            started      => started, -- array?!
            connecting   => connecting, -- array?!
            running      => running, -- array?!
            errdisc      => errdisc, -- array?!
            errpar       => errpar, -- array?!
            erresc       => erresc, -- array?!
            errcred      => errcred, -- array?!
            spw_di       => spw_di(i),
            spw_si       => spw_si(i),
            spw_do       => spw_do(i),
            spw_so       => spw_so(i)
        );
    END GENERATE gen_ports;


    -- eventually its necessary to create the internal port (port 0) speratly
    -- at least the spacewire6portrouter does that
END ARCHITECTURE spwrouter_arch;