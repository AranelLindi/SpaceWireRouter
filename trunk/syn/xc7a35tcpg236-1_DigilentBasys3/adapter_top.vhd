----------------------------------------------------------------------------------
-- Company: University of Wuerzburg
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 06/01/2022 09:52:34 AM
-- Design Name: 
-- Module Name: adapter_top
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router on an FPGA
-- Target Devices: Xilinx FPGAs
-- Tool Versions: -/-
-- Description: UART-SpaceWire Adapter.
-- 
-- Dependencies: spwstream
-- 
-- Revision:
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.SPWPKG.ALL;

ENTITY adapter_top IS
    PORT (
        -- System clock.
        clk : IN STD_LOGIC;

        -- Synchronous reset.
        rst : IN STD_LOGIC;

        -- Uart rx stream.
        rx : IN STD_LOGIC;

        -- Uart tx stream.
        tx : OUT STD_LOGIC;

        -- Clear signal to reset error flag.
        clear : IN STD_LOGIC;

        -- HIGH if link of adapter SpW port is in 'started' state.
        started : OUT STD_LOGIC;

        -- HIGH if link of adapter SpW port is in 'connecting' state.
        connecting : OUT STD_LOGIC;

        -- HIGH if link of adapter SpW port is in run state, indicating that link is operational.
        running : OUT STD_LOGIC;

        -- HIGH if errdisc (disconnect error), errpar (parity error), erresc (invalid escape sequence) or errcred (credit error) were detected.
        -- Triggers link reset. Must be acknowledged with a 'rst' or 'clear'.
        error : OUT STD_LOGIC;

        -- HIGH if transmit FIFO of adapter SpW port is at least half full.
        txhalff : OUT STD_LOGIC;

        -- HIGH if receiver FIFO of adapter SpW port is at least half full.
        rxhalff : OUT STD_LOGIC;

        -- SpaceWire data in.
        spw_di : IN STD_LOGIC;

        -- SpaceWire strobe in.
        spw_si : IN STD_LOGIC;

        -- SpaceWire data out.
        spw_do : OUT STD_LOGIC;

        -- SpaceWire strobe out.
        spw_so : OUT STD_LOGIC
    );
END adapter_top;

ARCHITECTURE adapter_top_arch OF adapter_top IS
    -- Constants.
    CONSTANT sysfreq : real := 100.0e6; -- 100 MHz Digilent Basys3 Board !

    COMPONENT UARTSpWAdapter
        GENERIC (
            -- frequency clk / Uart baud rate
            -- Example: 100 MHz clk, 115_200 baud rate Uart
            -- 100_000_000 / 115_200 = 868;
            clk_cycles_per_bit : INTEGER;

            -- Number of SpaceWire ports in router & adapter.
            numports : integer range 1 to 32;

            -- Initial SpW input port (in chase that no commands are allowed, it cannot be changed !)
            init_input_port : INTEGER RANGE 0 TO 31 := 0;

            -- Initial SpW output port (in chase that no commands are allowed, it cannot be changed !)
            init_output_port : INTEGER RANGE 0 TO 31 := 0;

            -- Determines whether commands are permitted or data are sent only.
            activate_commands : BOOLEAN;

            -- System clock frequency in Hz.
            -- This must be set to the frequency of "clk". It is used to setup
            -- counters for reset timing, disconnect timeout and to transmit
            -- at 10 Mbit/s during the link handshake.
            sysfreq : real;

            -- Transmit clock frequency in Hz (onl if tximpl = impl_fast).
            -- This must be set to the frequency of "txclk". It is used to
            -- transmit at 10 Mbit/s during the link handshake.
            txclkfreq : real := 0.0;

            -- Selection of a receiver front-end implementation.
            rximpl : spw_implementation_type_rec;

            -- Maximum number of bits received per system clock
            -- (must be 1 in case of impl_generic).
            rxchunk : INTEGER RANGE 1 TO 4 := 1;

            -- Width of shift registers in clock recovery front-end; added: SL
            WIDTH : INTEGER RANGE 1 TO 2 := 2;

            -- Selection of a transmitter implementation.
            tximpl : spw_implementation_type_xmit;

            -- Size of the receive FIFO as the 2-logarithm of the number of bytes.
            -- Must be at least 6 (64 bytes).
            rxfifosize_bits : INTEGER RANGE 6 TO 14 := 11;

            -- Size of the transmit FIFO as the 2-logarithm of the number of bytes.
            txfifosize_bits : INTEGER RANGE 2 TO 14 := 11
        );
        PORT (
            -- System clock.
            clk : IN STD_LOGIC;

            -- SpW port receive sample clock (only for impl_fast).
            rxclk : IN STD_LOGIC;

            -- SpW port transmit clock (only for impl_fast).
            txclk : IN STD_LOGIC;

            -- Synchronouse reset.
            rst : IN STD_LOGIC;

            -- Enables automatic link start for SpW ports on receipt of a NULL character.
            autostart : IN STD_LOGIC_VECTOR(numports-1 DOWNTO 0) := (OTHERS => '1');

            -- Enables SpW link start once the ready state is reached.
            -- Without autostart or linkstart, the link remains in state ready.
            linkstart : IN STD_LOGIC_VECTOR(numports-1 DOWNTO 0) := (OTHERS => '1');

            -- Do not start SpW link (overrides linkstart and autostart) and/or
            -- disconnect a running link.
            linkdis : IN STD_LOGIC_VECTOR(numports-1 DOWNTO 0) := (0 => '0', OTHERS => '0'); -- to deactivate port 1 set here '1'

            -- Scaling factor minus 1, used to scale the SpW transmit base clock into
            -- the transmission bit rate. The system clock (for impl_generic) or
            -- the txclk (for impl_fast) is divided byte (unsigned(txdivcnt) +1).
            -- Changing this signal will immediately change the transmission rate.
            -- During link setup, the transmision rate is always 10 Mbit/s.
            txdivcnt : IN STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000001";

            -- Optional outputs:
            -- HIGH if SpW link state machine is in started state.
            started : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);

            -- HIGH if link state machine is currently in connecting state.
            connecting : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);

            -- HIGH if the link state machine is currently in the run state.
            running : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);

            -- Disconnect detected in state run. Triggers a reset and reconnect of the link.
            errdisc : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);

            -- Parity error detected in state run. Triggers a reset and reconnect of the link.
            errpar : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);

            -- Invalid escape sequence deteced in state run. Triggers a reset and reconnect of the link.
            erresc : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);

            -- Credit error detected. Triggers a reset and reconnect of the link.
            errcred : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);

            -- HIGH if the SpW port transmission queue is at least half full.
            txhalff : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);

            -- HIGH if the SpW port receiver FIFO is at least half full.
            rxhalff : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);

            -- SpaceWire Data In.
            spw_di : IN STD_LOGIC_VECTOR(numports-1 DOWNTO 0);

            -- SpaceWire Strobe In.
            spw_si : IN STD_LOGIC_VECTOR(numports-1 DOWNTO 0);

            -- SpaceWire Data Out.
            spw_do : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);

            -- SpaceWire Strobe Out.
            spw_so : OUT STD_LOGIC_VECTOR(numports-1 DOWNTO 0);

            -- Incoming serial stream (uart).
            rx : IN STD_LOGIC;

            -- Outoing serial stream (uart).
            tx : OUT STD_LOGIC
        );
    END COMPONENT;
    -- Adapter signals.
    SIGNAL s_error : STD_LOGIC_VECTOR(0 DOWNTO 0); -- error flag    
    SIGNAL s_started : STD_LOGIC_VECTOR(0 DOWNTO 0);
    SIGNAL s_connecting : STD_LOGIC_VECTOR(0 DOWNTO 0);
    SIGNAL s_running : STD_LOGIC_VECTOR(0 DOWNTO 0);
    SIGNAL s_errdisc : STD_LOGIC_VECTOR(0 DOWNTO 0);
    SIGNAL s_errpar : STD_LOGIC_VECTOR(0 DOWNTO 0);
    SIGNAL s_erresc : STD_LOGIC_VECTOR(0 DOWNTO 0);
    SIGNAL s_errcred : STD_LOGIC_VECTOR(0 DOWNTO 0);
    SIGNAL s_txhalff : STD_LOGIC_VECTOR(0 DOWNTO 0);
    SIGNAL s_rxhalff : STD_LOGIC_VECTOR(0 DOWNTO 0);
    -- SpaceWire signals.
    SIGNAL s_spw_d_to_router : STD_LOGIC_VECTOR(0 DOWNTO 0);
    SIGNAL s_spw_s_to_router : STD_LOGIC_VECTOR(0 DOWNTO 0);
    SIGNAL s_spw_d_from_router : STD_LOGIC_VECTOR(0 DOWNTO 0);
    SIGNAL s_spw_s_from_router : STD_LOGIC_VECTOR(0 DOWNTO 0);
BEGIN
    -- Drive outputs.
    error <= s_error(0);
    started <= s_started(0);
    connecting <= s_connecting(0);
    running <= s_running(0);
    txhalff <= s_txhalff(0);
    rxhalff <= s_rxhalff(0);

    -- Drive SpaceWire signals.
    spw_do <= s_spw_d_to_router(0);
    spw_so <= s_spw_s_to_router(0);
    s_spw_d_from_router(0) <= spw_di;
    s_spw_s_from_router(0) <= spw_si;
    
    -- UARTSpWAdapter
    Adapter : UARTSpWAdapter
    GENERIC MAP(
        clk_cycles_per_bit => 868, -- 100_000_000 (Hz) / 115_200 (baud rate) = 868
        numports => 0,
        init_input_port => 0,
        init_output_port => 0,
        activate_commands => false,
        sysfreq => sysfreq,
        txclkfreq => sysfreq,
        rximpl => impl_fast,
        rxchunk => 1,
        WIDTH => 2,
        tximpl => impl_fast,
        rxfifosize_bits => 11,
        txfifosize_bits => 11
    )
    PORT MAP(
        clk => clk,
        rxclk => clk,
        txclk => clk,
        rst => rst,
        autostart => (OTHERS => '1'),
        linkstart => (OTHERS => '1'),
        linkdis => (0 => '0', OTHERS => '0'),
        txdivcnt => "00000001",
        started => s_started,
        connecting => s_connecting,
        running => s_running,
        errdisc => s_errdisc,
        errpar => s_errpar,
        erresc => s_erresc,
        errcred => s_errcred,
        txhalff => s_txhalff,
        rxhalff => s_rxhalff,
        spw_di => s_spw_d_from_router,
        spw_si => s_spw_s_from_router,
        spw_do => s_spw_d_to_router,
        spw_so => s_spw_s_to_router,
        rx => rx,
        tx => tx
    );

    -- Produces error flags to make errors visible on LEDs.
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF rst = '1' THEN
                s_error <= (OTHERS => '0');
            ELSE
                s_error <= (s_error OR s_errdisc OR s_errpar OR s_erresc OR s_errcred) AND (NOT clear);
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE adapter_top_arch;
