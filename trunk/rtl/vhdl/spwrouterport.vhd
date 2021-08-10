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
-- Description: Contains type and component definitions of spwrouter elements.
-- Dependencies: none
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.spwrouterpkg.ALL;
USE work.spwpkg.ALL;

ENTITY spwrouterport IS
    GENERIC (
        -- Number of SpaceWire ports. (evtl. nicht benötigt)
        numports : INTEGER RANGE 0 TO 31;

        -- System clock frequency in Hz.
        -- This must be set to the frequency of "clk". It is used to setup
        -- counter for reset timing, disconnect timeout and to transmit
        -- at 10 Mbit/s during the link handshake.
        sysfreq : real;

        -- Transmit clock frequency in Hz (only if tximpl = impl_fast).
        -- This must be set to the frequency of "txclk". It is used to 
        -- transmit at 10 Mbit/s during the link handshake.
        txclkfreq : real := 0.0;

        -- Selection of a receiver front-end implementation.
        rximpl : spw_implementation_type_rec := impl_generic;

        -- Maximum number of bits received per system clock
        -- (must be 1 in case of impl_generic).
        rxchunk : INTEGER RANGE 1 TO 4 := 1;

        -- Width of shift registers in clock recovery front-end; added: SL
        WIDTH : INTEGER RANGE 1 TO 3 := 2;

        -- Selection of a transmitter implementation.
        tximpl : spw_implementation_type_xmit := impl_generic;

        -- size of the receive FIFO as the 2-logarithm of the number of bytes.
        -- Must be at least 6 (64 bytes).
        rxfifosize_bits : INTEGER RANGE 6 TO 14 := 11;

        -- Size of the transmit FIFO as the 2-logarithm of the number of bytes.
        txfifosize_bits : INTEGER RANGE 2 TO 14 := 11
    );
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Receiver sample clock (only for impl_fast)
        rxclk : IN STD_LOGIC;

        -- Transmit clock (only for impl_fast)
        txclk : IN STD_LOGIC;

        -- Synchronous reset (active-high).
        rst : IN STD_LOGIC;

        -- Enables automatic link start on receipt of a NULL character.
        autostart : IN STD_LOGIC;

        -- Enables link start once the Ready state is reached.
        -- Without autostart or linkstart, the link remains in state Ready.
        linkstart : IN STD_LOGIC;

        -- Do not start link (overrides linkstart and autostart) and/or
        -- disconnect a running link.
        linkdis : IN STD_LOGIC;

        -- Scaling factor minus 1, used to scale the transmit base clock into
        -- the transmission bit rate. The system clock (for impl_generic) or
        -- the txclk (for impl_fast) is divided by (unsigned(txdivcnt) + 1).
        -- Changing this signal will immediately change the transmission rate.
        -- During link setup, the transmission rate is always 10 Mbit/s.
        txdivcnt : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- High for one clock cycle to request transmission of a TimeCode.
        -- The request is registered inside the entity until it can be processed.
        tick_in : IN STD_LOGIC;

        -- Control bits of the TimeCode to be sent. Must be valid while tick_in is high.
        ctrl_in : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

        -- Counter value of the TimeCode to be sent. Must be valid while tick_in is high.
        time_in : IN STD_LOGIC_VECTOR(5 DOWNTO 0);

        -- Pulled high by the application to write an N-Char to the transmit
        -- queue. If "txwrite" and "txrdy" are both high on the rising edge
        -- of "clk", a character is added to the transmit queue.
        -- This signal has no effect if "txrdy" is low.
        txwrite : IN STD_LOGIC;

        -- Control flag to be sent with the next N_Char.
        -- Must be valid while txwrite is high.
        txflag : IN STD_LOGIC;

        -- Byte to be sent, or "00000000" for EOP or "00000001" for EEP.
        -- Must be valid while txwrite is high.
        txdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- High if the entity is ready to accept an N-Char for transmission.
        txrdy : OUT STD_LOGIC;

        -- High if the transmission queue is at least half full.
        txhalff : OUT STD_LOGIC;

        -- High for one clock cycle if a TimeCode was just received.
        tick_out : OUT STD_LOGIC;

        -- Control bits of the last received TimeCode.
        ctrl_out : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);

        -- Counter value of the last received TimeCode.
        time_out : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);

        -- High if "rxflag" and "rxdata" contain valid data.
        -- This signal is high unless the receive FIFO is empty.
        rxvalid : OUT STD_LOGIC;

        -- High if the receive FIFO is at least half full.
        rxhalff : OUT STD_LOGIC;

        -- High if the received character is EOP or EEP; low if the received
        -- character is a data byte. Valid if "rxvalid" is high.
        rxflag : OUT STD_LOGIC;

        -- Received byte, or "00000000" for EOP or "00000001" for EEP.
        -- Valid if "rxvalid" is high.
        rxdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- Pulled high by the application to accept a received character.
        -- If "rxvalid" and "rxread" are both high on the rising edge of "clk",
        -- a character is removed from the receive FIFO and "rxvalid", "rxflag"
        -- and "rxdata" are updated.
        -- This signal has no effect if "rxvalid" is low.
        rxread : IN STD_LOGIC;

        -- High if the link state machine is currently in the Started state.
        started : OUT STD_LOGIC;

        -- High if the link state machine is currently in the Connecting state.
        connecting : OUT STD_LOGIC;

        -- High if the link state machine is currently in the Run state, indicating
        -- that the link is fully operational. If none of started, connecting or running
        -- is high, the link is in an initial state and the transmitter is not yet enabled.
        running : OUT STD_LOGIC;

        -- Disconnect detected in state Run. Triggers a reset and reconnect of the link.
        -- This indication is auto-clearing.
        errdisc : OUT STD_LOGIC;

        -- Parity error detected in state Run. Triggers a reset and reconnect of the link.
        -- This indication is auto-clearing.
        errpar : OUT STD_LOGIC;

        -- Invalid escape sequence detected in state Run. Triggers a reset and reconnect of
        -- the link. This indication is auto-clearing.
        erresc : OUT STD_LOGIC;

        -- Credit error detected. Triggers a reset and reconnect of the link.
        -- This indication is auto-clearing.
        errcred : OUT STD_LOGIC;

        -- Data In signal from SpaceWire bus.
        spw_di : IN STD_LOGIC;

        -- Strobe In signal from SpaceWire bus.
        spw_si : IN STD_LOGIC;

        -- Data Out signal to SpaceWire bus.
        spw_do : OUT STD_LOGIC;

        -- Strobe Out signal to SpaceWire bus.
        spw_so : OUT STD_LOGIC
    );
END spwrouterport;