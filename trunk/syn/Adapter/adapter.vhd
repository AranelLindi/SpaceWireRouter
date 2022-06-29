----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 25.05.2022 12:29
-- Design Name: UART - SpaceWire Adapter (both directions (UART -> SpW; SpW -> UART)
-- Module Name: UART2SpW
-- Project Name: SpaceWire Router
-- Target Devices: xc7a35tcpg236-1 (tested);
-- Tool Versions:
-- Description: Raw version of UART SpaceWire adapter. Contains UART Receiver and
-- Transmitter as well as SpaceWire ports.
--
-- Dependencies: spwpkg (spwstream)
-- 
-- Revision:
---------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.spwpkg.ALL; -- Defintions of spwstream

ENTITY UARTSpWAdapter IS
    GENERIC (
        -- UARTSpWAdapter:

        -- frequency clk / Uart baud rate
        -- Example: 100 MHz Clock, 115200 baud rate Uart
        -- 100_000_000 / 115_200 = 868
        clk_cycles_per_bit : INTEGER;

        -- Number of SpaceWire ports in this adapter.
        numports : INTEGER RANGE 0 TO 31;

        -- Initial SpW input port (in chase that no commands are allowed, it cannot be changed !)
        init_input_port : INTEGER RANGE 0 TO 31 := 0;

        -- Initial SpW output port (in chase that no commands are allowed, it cannot be changed !)
        init_output_port : INTEGER RANGE 0 TO 31 := 0;

        -- Determines whether commands are permitted or data bytes are sent only. 
        activate_commands : BOOLEAN;

        -- SpaceWire Ports:

        -- System clock frequency in Hz.
        -- This must be set to the frequency of "clk". It is used to setup
        -- counters for reset timing, disconnect timeout and to transmit
        -- at 10 Mbit/s during the link handshake.
        sysfreq : real;

        -- Transmit clock frequency in Hz (only if tximpl = impl_fast).
        -- This must be set to the frequency of "txclk". It is used to
        -- transmit at 10 Mbit/s during the link handshake.
        txclkfreq : real := 0.0;

        -- Selection of a receiver front-end implementation.
        rximpl : spw_implementation_type_rec;

        -- Maximum number of bits received per system clock
        -- (must be 1 in case of impl_generic).
        rxchunk : INTEGER RANGE 1 TO 4 := 1;

        -- Width of shift registers in clock recovery front-end; added: SL
        WIDTH : INTEGER RANGE 1 TO 3 := 2;

        -- Selection of a transmitter implementation.
        tximpl : spw_implementation_type_xmit;

        -- Size of the receive FIFO as the 2-logarithm of the number of bytes.
        -- Must be at least 6 (64 bytes).
        rxfifosize_bits : INTEGER RANGE 6 TO 14 := 11;

        -- Size of the transmit FIFO as the 2-logarithm of the number of bytes.
        txfifosize_bits : INTEGER RANGE 2 TO 14 := 11
    );
    PORT (
        -- SpaceWire ports clock (inclusive fsm).
        spwclk : IN STD_LOGIC;
        
        -- UART clock (uart recv and xmit).
        uclk : in std_logic;

        -- SpW port receiver sample clock (only for impl_fast).
        rxclk : IN STD_LOGIC; -- Standard implementation with impl_fast, therefore rxclk = clk must apply !

        -- SpW port transmit clock (only for impl_fast).
        txclk : IN STD_LOGIC; -- Standard implementation with impl_fast, therefore txclk = clk must apply !

        -- Synchronous reset.
        rst : IN STD_LOGIC;

        -- Enables atomatic link start for SpW ports on receipt of a NULL character.
        autostart : IN STD_LOGIC_VECTOR(numports DOWNTO 0) := (OTHERS => '1');

        -- Enables SpW link start once the ready state is reached.
        -- Without autostart or linkstart, the link remains in state ready.
        linkstart : IN STD_LOGIC_VECTOR(numports DOWNTO 0) := (OTHERS => '1');

        -- Do not start SpW link (overrides linkstart and autostart) and/or
        -- disconnect a running link.
        linkdis : IN STD_LOGIC_VECTOR(numports DOWNTO 0) := (0 => '0', OTHERS => '0'); -- to deactivate port 0 set here '1'

        -- Scaling factor minus 1, used to scale the SpW transmit base clock into
        -- the transmission bit rate. The system clock (for impl_generic) or
        -- the txclk (for impl_fast) is divided byte (unsigned(txdivcnt) +1).
        -- Changing this signal will immediately change the transmission rate.
        -- During link setup, the transmision rate is always 10 Mbit/s.
        txdivcnt : IN STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000001";

        -- Optional outputs:
        -- HIGH if SpW link state machine is in started state.
        started : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- HIGH if link state machine is currently in connecting state.
        connecting : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- HIGH if the link state machine is currently in the run state.
        running : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Disconnect detected in state run. Triggers a reset and reconnect of the link.
        errdisc : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Parity error detected in state run. Triggers a reset and reconnect of the link.
        errpar : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Invalid escape sequence deteced in state run. Triggers a reset and reconnect of the link.
        erresc : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Credit error detected. Triggers a reset and reconnect of the link.
        errcred : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- HIGH if the SpW port transmission queue is at least half full.
        txhalff : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- HIGH if the SpW port receiver FIFO is at least half full.
        rxhalff : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- SpaceWire Data In.
        spw_di : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- SpaceWire Strobe In.
        spw_si : IN STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- SpaceWire Data Out.
        spw_do : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- SpaceWire Strobe Out.
        spw_so : OUT STD_LOGIC_VECTOR(numports DOWNTO 0);

        -- Incoming serial stream (uart).
        rx : IN STD_LOGIC;

        -- Outoing serial stream (uart).
        tx : OUT STD_LOGIC
    );
END UARTSpWAdapter;

ARCHITECTURE UARTSpWAdapter_config_arch OF UARTSpWAdapter IS
    -- Constants and general definitions
    -- Array definition for SpW port assignment.
    TYPE array_t IS ARRAY(NATURAL RANGE <>) OF STD_LOGIC_VECTOR;
    -- SpaceWire port component is defined in spwpkg !

    -- Uart Receiver.
    COMPONENT uart_rx
        GENERIC (
            clk_cycles_per_bit : INTEGER
        );
        PORT (
            -- System clock.
            clk : IN STD_LOGIC;

            -- Synchronous reset.
            rst : IN STD_LOGIC;

            -- Incoming serial stream.
            rx_port : IN STD_LOGIC;

            -- HIGH if new byte available; LOW when nothing was received.
            rx_rdy : OUT STD_LOGIC := '0';

            -- Handshake to accept byte.
            rx_ack : IN STD_LOGIC;

            -- Received data byte.
            rx_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    -- Uart Transmitter.
    COMPONENT uart_tx
        GENERIC (
            clk_cycles_per_bit : INTEGER
        );
        PORT (
            -- System clock.
            clk : IN STD_LOGIC;

            -- Synchronous reset.
            rst : IN STD_LOGIC;

            -- Handshake to start transmitting.
            tx_ack : IN STD_LOGIC;

            -- Data byte to send.
            tx_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

            -- HIGH if transmitter to accept and send new byte.
            tx_rdy : OUT STD_LOGIC := '1';

            -- Outgoing serial stream (standard HIGH).
            tx_port : OUT STD_LOGIC := '1'
        );
    END COMPONENT;

    -- Signals.
    -- Command-based reset.
    SIGNAL s_cmdrst : STD_LOGIC;
    
    -- Uart Recv (belong to corresponding ports in uart entities).
    SIGNAL s_rx_rdy : STD_LOGIC;
    SIGNAL s_rx_ack : STD_LOGIC;
    SIGNAL s_rx_data : STD_LOGIC_VECTOR(7 DOWNTO 0);
    -- Uart Trans (belong to corresponding ports in uart entities).
    SIGNAL s_tx_ack : STD_LOGIC;
    SIGNAL s_tx_rdy : STD_LOGIC := '1';
    SIGNAL s_tx_data : STD_LOGIC_VECTOR(7 DOWNTO 0);

    -- SpaceWire (belong to corresponding ports in spwstream entity).
    SIGNAL s_autostart : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_linkstart : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_linkdis : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_txdivcnt : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL s_tick_in : STD_LOGIC_VECTOR(numports DOWNTO 0); -- Caution ! TimeCodes for port 0 are deactivated !
    SIGNAL s_ctrl_in : array_t(numports DOWNTO 0)(1 DOWNTO 0);
    SIGNAL s_time_in : array_t(numports DOWNTO 0)(5 DOWNTO 0);
    SIGNAL s_txwrite : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_txflag : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_txdata : array_t(numports DOWNTO 0)(7 DOWNTO 0);
    SIGNAL s_txrdy : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_txhalff : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_tick_out : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_ctrl_out : array_t(numports DOWNTO 0)(1 DOWNTO 0);
    SIGNAL s_time_out : array_t(numports DOWNTO 0)(5 DOWNTO 0);
    SIGNAL s_rxvalid : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_rxhalff : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_rxflag : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_rxdata : array_t(numports DOWNTO 0)(7 DOWNTO 0);
    SIGNAL s_rxread : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_started : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_connecting : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_running : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_errdisc : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_errpar : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_erresc : STD_LOGIC_VECTOR(numports DOWNTO 0);
    SIGNAL s_errcred : STD_LOGIC_VECTOR(numports DOWNTO 0);

    -- Intern used signals.
    -- UART2SpW fsm.
    TYPE input_states IS (s_Idle, s_Decode, s_Cmd, s_Data);
    SIGNAL istate : input_states := s_Idle;

    -- SpW2UART fsm.
    TYPE output_states IS (s_Idle, s_NChar, s_Wait, s_CleanUp);
    SIGNAL ostate : output_states := s_Idle;

    -- Buffer.
    SIGNAL s_uart_buffer : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0'); -- buffers incoming bytes (uart)
    SIGNAL s_uart_output : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0'); -- buffers outgoing bytes (uart)

    -- Control.
    SIGNAL s_port_input : INTEGER RANGE 0 TO numports := init_input_port;
    SIGNAL s_port_output : INTEGER RANGE 0 TO numports := init_output_port;

    -- Intern infos request.
    SIGNAL s_info1 : STD_LOGIC := '0'; -- SpW input port.
    SIGNAL s_info2 : STD_LOGIC := '0'; -- SpW output port.
    SIGNAL s_info3 : STD_LOGIC := '0'; -- SpW error codes.
BEGIN
    -- Sample inputs
    s_autostart <= autostart;
    s_linkstart <= linkstart;
    s_linkdis <= linkdis;
    s_txdivcnt <= txdivcnt;

    -- Drive outputs
    started <= s_started;
    connecting <= s_connecting;
    running <= s_running;
    errdisc <= s_errdisc;
    errpar <= s_errpar;
    erresc <= s_erresc;
    errcred <= s_errcred;
    txhalff <= s_txhalff;
    rxhalff <= s_rxhalff;

    -- Uart receiver.
    UartRx : uart_rx
    GENERIC MAP(
        clk_cycles_per_bit => clk_cycles_per_bit
    )
    PORT MAP(
        clk => uclk,
        rst => rst,
        rx_port => rx, -- uart rx stream
        rx_rdy => s_rx_rdy,
        rx_ack => s_rx_ack,
        rx_data => s_rx_data
    );

    -- Uart transmitter.
    UartTx : uart_tx
    GENERIC MAP(
        clk_cycles_per_bit => clk_cycles_per_bit
    )
    PORT MAP(
        clk => uclk,
        rst => rst,
        tx_port => tx, -- uart tx stream
        tx_ack => s_tx_ack,
        tx_rdy => s_tx_rdy,
        tx_data => s_tx_data
    );

    -- Port 0 to numports
    SpW_Ports : FOR n IN 0 TO numports GENERATE
        port_n : spwstream
        GENERIC MAP(
            sysfreq => sysfreq,
            txclkfreq => txclkfreq,
            rximpl => rximpl,
            rxchunk => rxchunk,
            tximpl => tximpl,
            rxfifosize_bits => rxfifosize_bits,
            txfifosize_bits => txfifosize_bits,
            WIDTH => WIDTH
        )
        PORT MAP(
            clk => spwclk,
            rxclk => rxclk,
            txclk => txclk,
            rst => (rst or s_cmdrst),
            autostart => s_autostart(n),
            linkstart => s_linkstart(n),
            linkdis => linkdis(n),
            txdivcnt => txdivcnt,
            tick_in => s_tick_in(n),
            ctrl_in => s_ctrl_in(n),
            time_in => s_time_in(n),
            txwrite => s_txwrite(n),
            txflag => s_txflag(n),
            txdata => s_txdata(n),
            txrdy => s_txrdy(n),
            txhalff => s_txhalff(n),
            tick_out => s_tick_out(n),
            ctrl_out => s_ctrl_out(n),
            time_out => s_time_out(n),
            rxvalid => s_rxvalid(n),
            rxhalff => s_rxhalff(n),
            rxflag => s_rxflag(n),
            rxdata => s_rxdata(n),
            rxread => s_rxread(n),
            started => s_started(n),
            connecting => s_connecting(n),
            running => s_running(n),
            errdisc => s_errdisc(n),
            errpar => s_errpar(n),
            erresc => s_erresc(n),
            errcred => s_errcred(n),
            spw_di => spw_di(n), -- from router SpW receiver (front-end ensures synchronization !)
            spw_si => spw_si(n),
            spw_do => spw_do(n), -- to router
            spw_so => spw_so(n)
        );
    END GENERATE SpW_Ports;

    -- UART -> SpaceWire
    uart2spw : PROCESS (spwclk)
    BEGIN
        IF rising_edge(spwclk) THEN
            IF rst = '1' THEN
                -- Synchronous reset.
                -- UART signals.
                s_rx_ack <= '0';
                s_uart_buffer <= (OTHERS => '0');
                -- SpaceWire signals.
                s_txwrite <= (OTHERS => '0');
                s_txflag <= (OTHERS => '0');
                s_txdata <= (OTHERS => (OTHERS => '0'));
                s_tick_in <= (OTHERS => '0');
                s_ctrl_in <= (OTHERS => (OTHERS => '0'));
                s_time_in <= (OTHERS => (OTHERS => '0'));
                -- Intern signals.
                s_port_input <= init_input_port;
                s_port_output <= init_output_port;
                s_info1 <= '0';
                s_info2 <= '0';
                s_info3 <= '0';
                s_cmdrst <= '0';
                --s_spw_buffer <= (8 => '1', others => '0');
                istate <= s_Idle;
            ELSE
                CASE istate IS
                    WHEN s_Idle =>
                        -- Reset all relevant signals.
                        s_info1 <= '0';
                        s_info2 <= '0';
                        s_info3 <= '0';
                        s_cmdrst <= '0';
                        s_txwrite <= (OTHERS => '0');
                        s_txflag <= (OTHERS => '0');
                        s_txdata <= (OTHERS => (OTHERS => '0'));
                        s_ctrl_in <= (OTHERS => (OTHERS => '0'));
                        s_time_in <= (OTHERS => (OTHERS => '0'));
                        s_tick_in <= (OTHERS => '0');

                        -- Check if uart has received new byte.
                        IF s_rx_rdy = '1' THEN
                            s_uart_buffer <= s_rx_data; -- buffering byte
                            s_rx_ack <= '1'; -- Handshake
                            istate <= s_Decode;
                        END IF;

                    WHEN s_Decode =>
                        s_rx_ack <= '0'; -- Handshake

                        -- Decide what was received.
                        IF s_uart_buffer(7) = '1' AND activate_commands = true THEN -- Commands are allowed only activated in config adapter !
                            -- Command
                            istate <= s_Cmd;
                        ELSE
                            -- Data (N-Char / TimeCode)
                            istate <= s_Data;
                        END IF;

                    WHEN s_Cmd =>
                        -- Further decoding...
                        CASE s_uart_buffer(6 DOWNTO 5) IS
                            WHEN "00" =>
                                -- Intern control command (Reset, Output Info1, Output Info2, Output Info3)
                                CASE s_uart_buffer(4 DOWNTO 3) IS
                                    WHEN "00" =>
                                        -- Reset of all state variables (no global reset !)
                                        -- List everything that should be reset here...
                                        s_port_input <= init_input_port;
                                        s_port_output <= init_output_port;
                                        s_cmdrst <= '1';

                                    WHEN "01" =>
                                        -- Output Info1
                                        s_info1 <= '1';

                                    WHEN "10" =>
                                        -- Output Info2
                                        s_info2 <= '1';

                                    WHEN "11" =>
                                        -- Output Info3
                                        s_info3 <= '1';

                                    WHEN OTHERS => -- just for simulation
                                        NULL;

                                END CASE;

                                --istate <= s_Idle;

                            WHEN "01" =>
                                -- Set router input port
                                IF (to_integer(unsigned(s_uart_buffer(4 DOWNTO 0))) <= numports) THEN -- If number is bigger than numports, port remains unchanged.
                                    s_port_input <= to_integer(unsigned(s_uart_buffer(4 DOWNTO 0)));
                                END IF;
                                --istate <= s_Idle;

                            WHEN "10" =>
                                -- Set router output port
                                IF (to_integer(unsigned(s_uart_buffer(4 DOWNTO 0))) <= numports) THEN -- If number is bigger that numports, port remains unchanged.
                                    s_port_output <= to_integer(unsigned(s_uart_buffer(4 DOWNTO 0)));
                                END IF;
                                --istate <= s_Idle;

                            WHEN "11" =>
                                -- End of Packet / Error End of Packet
                                IF s_uart_buffer(4) = '1' THEN
                                    -- EEP (Error End of Packet)
                                    s_txdata(s_port_input) <= x"01";
                                    s_txflag(s_port_input) <= '1';
                                ELSE
                                    -- EOP (End of Packet)
                                    s_txdata(s_port_input) <= x"00";
                                    s_txflag(s_port_input) <= '1';
                                END IF;

                                s_txwrite(s_port_input) <= '1';
                                istate <= s_Idle;

                            WHEN OTHERS => -- just for simulation
                                NULL;

                        END CASE;

                        istate <= s_Idle;

                    WHEN s_Data =>
                        IF s_uart_buffer(6) = '1' AND activate_commands = true THEN -- Sending Time Code is allowed only when Commands are activated !
                            -- TimeCode
                            s_time_in(s_port_input) <= s_uart_buffer(5 DOWNTO 0);
                            s_tick_in(s_port_input) <= '1';
                        ELSE
                            -- N-Char
                            IF s_uart_buffer = "11111111" AND activate_commands = false THEN -- Only active if no commands are allowed to close packet.
                                -- Create EOP
                                s_txdata(s_port_input) <= x"00";
                                s_txflag(s_port_input) <= '1';

                                s_txwrite(s_port_input) <= '1';
                            ELSE
                                -- Normal N-Char (default chase)
                                IF activate_commands = true THEN
                                    s_txdata(s_port_input) <= "00" & s_uart_buffer(5 DOWNTO 0);
                                ELSE
                                    s_txdata(s_port_input) <= s_uart_buffer;
                                END IF;
                                s_txflag(s_port_input) <= '0';

                                s_txwrite(s_port_input) <= '1';
                            END IF;
                        END IF;

                        istate <= s_Idle;

                END CASE;
            END IF;
        END IF;
    END PROCESS uart2spw;

    -- SpaceWire -> UART.
    spw2uart : PROCESS (spwclk)
    BEGIN
        IF rising_edge(spwclk) THEN
            IF rst = '1' THEN
                -- Synchronous reset.
                s_rxread <= (OTHERS => '0');
                s_uart_output <= (OTHERS => '0');
                s_tx_data <= (OTHERS => '0');
                s_tx_ack <= '0';
                ostate <= s_Idle;
            ELSE
                CASE ostate IS
                    WHEN s_Idle =>
                        -- Wait until a Time Code (highest priority) or N-Char were received or command information is requested.
                        IF s_tick_out(s_port_output) = '1' AND activate_commands = true THEN
                            s_uart_output <= "01" & s_time_out(s_port_output);
                            ostate <= s_Wait;
                        ELSIF s_rxvalid(s_port_output) = '1' THEN
                            IF s_rxflag(s_port_output) = '1' THEN
                                -- EOP / EEP
                                IF s_rxdata(s_port_output) = x"01" THEN
                                    -- EEP
                                    s_uart_output <= x"fe"; -- 11111110                                    
                                ELSE
                                    -- EOP
                                    s_uart_output <= x"ff"; -- 11111111                                    
                                END IF;

                                ostate <= s_NChar;
                            ELSE
                                -- Data byte
                                IF activate_commands = true THEN
                                    s_uart_output <= "00" & s_rxdata(s_port_output)(5 DOWNTO 0);
                                ELSE
                                    s_uart_output <= s_rxdata(s_port_output);
                                END IF;
                            END IF;

                            s_rxread(s_port_output) <= '1';
                            ostate <= s_NChar;

                        ELSIF s_info1 = '1' AND activate_commands = true THEN
                            -- Send selected input port.
                            s_uart_output <= "101" & STD_LOGIC_VECTOR(to_unsigned(s_port_input, 5));

                            ostate <= s_Wait;
                        ELSIF s_info2 = '1' AND activate_commands = true THEN
                            -- Send selected output port.
                            s_uart_output <= "110" & STD_LOGIC_VECTOR(to_unsigned(s_port_output, 5));

                            ostate <= s_Wait;
                        ELSIF s_info3 = '1' AND activate_commands = true THEN
                            -- Send error & status report.
                            s_uart_output(7 DOWNTO 5) <= "100";
                            s_uart_output(4) <= s_started(s_port_input) OR s_connecting(s_port_input);
                            s_uart_output(3) <= s_running(s_port_input);
                            s_uart_output(2) <= s_errdisc(s_port_input) OR s_errpar(s_port_input);
                            s_uart_output(1) <= s_erresc(s_port_input) OR s_errcred(s_port_input);
                            s_uart_output(0) <= s_rxhalff(s_port_input) OR s_txhalff(s_port_input); -- output / input !

                            ostate <= s_Wait;
                        END IF;

                    WHEN s_NChar =>
                        -- Reset handshake with SpaceWire port.
                        s_rxread(s_port_output) <= '0';

                        ostate <= s_Wait;

                    WHEN s_Wait =>
                        -- Wait until UART transmitter is ready to send...
                        IF s_tx_rdy = '1' THEN
                            s_tx_data <= s_uart_output;
                            s_tx_ack <= '1';
                            ostate <= s_CleanUp;
                        END IF;

                    WHEN s_CleanUp =>
                        -- Widthdraw transmission permission.
                        s_tx_ack <= '0';

                        ostate <= s_Idle;

                END CASE;
            END IF;
        END IF;
    END PROCESS spw2uart;
END ARCHITECTURE UARTSpWAdapter_config_arch;