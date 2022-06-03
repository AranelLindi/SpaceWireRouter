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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.spwpkg.all; -- Defintions of spwstream

entity UARTSpWAdapter is
    generic (
        -- UARTSpWAdapter:
    
        -- frequency clk / Uart baud rate
        -- Example: 100 MHz Clock, 115200 baud rate Uart
        -- 100_000_000 / 115_200 = 868
        clk_cycles_per_bit : Integer;
        
        -- Number of SpaceWire ports in this adapter.
        numports : integer range 0 to 31;
        
        -- Initial SpW input port (in chase that no commands are allowed, it cannot be changed !)
        init_input_port : integer range 0 to 31 := 0;
        
        -- Initial SpW output port (in chase that no commands are allowed, it cannot be changed !)
        init_output_port : integer range 0 to 31 := 0;
        
        -- Determines whether commands are permitted or data bytes are sent only. 
        activate_commands : boolean;
        
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
    port (
        -- System clock.
        clk : in std_logic;
        
        -- SpW port receiver sample clock (only for impl_fast).
        rxclk : in std_logic; -- Standard implementation with impl_fast, therefore rxclk = clk must apply !
        
        -- SpW port transmit clock (only for impl_fast).
        txclk : in std_logic; -- Standard implementation with impl_fast, therefore txclk = clk must apply !
        
        -- Reset.
        rst : in std_logic;

        -- Enables atomatic link start for SpW ports on receipt of a NULL character.
        autostart : in std_logic_vector(numports downto 0) := (others => '1');
        
        -- Enables SpW link start once the ready state is reached.
        -- Without autostart or linkstart, the link remains in state ready.
        linkstart : in std_logic_vector(numports downto 0) := (others => '1');
        
        -- Do not start SpW link (overrides linkstart and autostart) and/or
        -- disconnect a running link.
        linkdis : in std_logic_vector(numports downto 0) := (0 => '0', others => '0'); -- to deactivate port 0 set here '1'
            
        -- Scaling factor minus 1, used to scale the SpW transmit base clock into
        -- the transmission bit rate. The system clock (for impl_generic) or
        -- the txclk (for impl_fast) is divided byte (unsigned(txdivcnt) +1).
        -- Changing this signal will immediately change the transmission rate.
        -- During link setup, the transmision rate is always 10 Mbit/s.
        txdivcnt : in std_logic_vector(7 downto 0) := "00000001";
        
        -- Optional outputs:
        -- HIGH if SpW link state machine is in started state.
        started : out std_logic_vector(numports downto 0);
        
        -- HIGH if link state machine is currently in connecting state.
        connecting : out std_logic_vector(numports downto 0);
        
        -- HIGH if the link state machine is currently in the run state.
        running : out std_logic_vector(numports downto 0);
        
        -- Disconnect detected in state run. Triggers a reset and reconnect of the link.
        errdisc : out std_logic_vector(numports downto 0);
        
        -- Parity error detected in state run. Triggers a reset and reconnect of the link.
        errpar : out std_logic_vector(numports downto 0);
        
        -- Invalid escape sequence deteced in state run. Triggers a reset and reconnect of the link.
        erresc : out std_logic_vector(numports downto 0);
        
        -- Credit error detected. Triggers a reset and reconnect of the link.
        errcred : out std_logic_vector(numports downto 0);
        
        -- HIGH if the SpW port transmission queue is at least half full.
        txhalff : out std_logic_vector(numports downto 0);
        
        -- HIGH if the SpW port receiver FIFO is at least half full.
        rxhalff : out std_logic_vector(numports downto 0);
        
        -- SpaceWire Data In.
        spw_di : in std_logic_vector(numports downto 0);
        
        -- SpaceWire Strobe In.
        spw_si : in std_logic_vector(numports downto 0);
        
        -- SpaceWire Data Out.
        spw_do : out std_logic_vector(numports downto 0);
        
        -- SpaceWire Strobe Out.
        spw_so : out std_logic_vector(numports downto 0);
        
        -- Incoming serial stream (uart).
        rx : in std_logic;
        
        -- Outoing serial stream (uart).
        tx : out std_logic
    );    
end UARTSpWAdapter;

architecture UARTSpWAdapter_config_arch of UARTSpWAdapter is
    -- Constants and general definitions
    -- Array definition for SpW port assignment.
    type array_t is array(natural range<>) of std_logic_vector;    
    -- SpaceWire port component is defined in spwpkg !

    -- Uart Receiver.
    component uart_rx
        generic (
            clk_cycles_per_bit : integer
        );    
        port (
            -- System clock.
            clk : in std_logic;
            
            -- Synchronous reset.
            rst : in std_logic;
            
            -- Incoming serial stream.
            rx_port : in std_logic;
            
            -- HIGH if new byte available; LOW when nothing was received.
            rx_rdy : out std_logic := '0';
            
            -- Handshake to accept byte.
            rx_ack : in std_logic;
            
            -- Received data byte.
            rx_data : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Uart Transmitter.
    component uart_tx
        generic (
            clk_cycles_per_bit : integer
        );
        port (
            -- System clock.
            clk : in std_logic;
            
            -- Synchronous reset.
            rst : in std_logic;
            
            -- Handshake to start transmitting.
            tx_ack : in std_logic;
            
            -- Data byte to send.
            tx_data : in std_logic_vector(7 downto 0);
            
            -- HIGH if transmitter to accept and send new byte.
            tx_rdy : out std_logic := '1';
            
            -- Outgoing serial stream (standard HIGH).
            tx_port : out std_logic := '1'
        );
    end component;
    
    -- Signals.
    -- Uart Recv (belong to corresponding ports in uart entities).
    signal s_rx_rdy : std_logic;
    signal s_rx_ack : std_logic;
    signal s_rx_data : std_logic_vector(7 downto 0);
    -- Uart Trans (belong to corresponding ports in uart entities).
    signal s_tx_ack : std_logic;
    signal s_tx_rdy : std_logic := '1';
    signal s_tx_data : std_logic_vector(7 downto 0);
    
    -- SpaceWire (belong to corresponding ports in spwstream entity).
    signal s_autostart : std_logic_vector(numports downto 0);
    signal s_linkstart : std_logic_vector(numports downto 0);
    signal s_linkdis : std_logic_vector(numports downto 0);
    signal s_txdivcnt : std_logic_vector(7 downto 0);
    signal s_tick_in : std_logic_vector(numports downto 0); -- Caution ! TimeCodes for port 0 are deactivated !
    signal s_ctrl_in : array_t(numports downto 0)(1 downto 0);
    signal s_time_in : array_t(numports downto 0)(5 downto 0);
    signal s_txwrite : std_logic_vector(numports downto 0);
    signal s_txflag : std_logic_vector(numports downto 0);
    signal s_txdata : array_t(numports downto 0)(7 downto 0);
    signal s_txrdy : std_logic_vector(numports downto 0);
    signal s_txhalff : std_logic_vector(numports downto 0);
    signal s_tick_out : std_logic_vector(numports downto 0);
    signal s_ctrl_out : array_t(numports downto 0)(1 downto 0);
    signal s_time_out : array_t(numports downto 0)(5 downto 0);
    signal s_rxvalid : std_logic_vector(numports downto 0);
    signal s_rxhalff : std_logic_vector(numports downto 0);
    signal s_rxflag : std_logic_vector(numports downto 0);
    signal s_rxdata : array_t(numports downto 0)(7 downto 0);
    signal s_rxread : std_logic_vector(numports downto 0);
    signal s_started : std_logic_vector(numports downto 0);
    signal s_connecting : std_logic_vector(numports downto 0);
    signal s_running : std_logic_vector(numports downto 0);
    signal s_errdisc : std_logic_vector(numports downto 0);
    signal s_errpar : std_logic_vector(numports downto 0);
    signal s_erresc : std_logic_vector(numports downto 0);
    signal s_errcred : std_logic_vector(numports downto 0);    
    
    -- Intern used signals.
    -- UART2SpW fsm.
    type input_states is (s_Idle, s_Decode, s_Cmd, s_Data);
    signal istate : input_states := s_Idle;
    
    -- SpW2UART fsm.
    type output_states is (s_Idle, s_NChar, s_Wait, s_CleanUp);
    signal ostate : output_states := s_Idle;
    
    -- Buffer.
    signal s_uart_buffer : std_logic_vector(7 downto 0) := (others => '0'); -- buffers incoming bytes (uart)
    signal s_uart_output : std_logic_vector(7 downto 0) := (others => '0'); -- buffers outgoing bytes (uart)
    
    -- Control.
    signal s_port_input : integer range 0 to numports := init_input_port;
    signal s_port_output : integer range 0 to numports := init_output_port;
    
    -- Intern infos request.
    signal s_info1 : std_logic := '0'; -- SpW input port.
    signal s_info2 : std_logic := '0'; -- SpW output port.
    signal s_info3 : std_logic := '0'; -- SpW error codes.
begin
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
        generic map (
            clk_cycles_per_bit => clk_cycles_per_bit
        )
        port map (
            clk => clk,
            rst => rst,
            rx_port => rx, -- uart rx stream
            rx_rdy => s_rx_rdy,
            rx_ack => s_rx_ack,
            rx_data => s_rx_data
        );
        
    -- Uart transmitter.
    UartTx : uart_tx
        generic map (
            clk_cycles_per_bit => clk_cycles_per_bit
        )
        port map (
            clk => clk,
            rst => rst,
            tx_port => tx, -- uart tx stream
            tx_ack => s_tx_ack,
            tx_rdy => s_tx_rdy,
            tx_data => s_tx_data
        );
                
    -- Port 0 to numports
    SpW_Ports : for n in 0 to numports generate
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
			clk => clk,
			rxclk => rxclk,
			txclk => txclk,
			rst => rst,
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
    end generate SpW_Ports;    
    
    -- UART -> SpaceWire
    uart2spw : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                -- Synchronous reset.
                -- UART signals.
                s_rx_ack <= '0';
                s_uart_buffer <= (others => '0');
                -- SpaceWire signals.
                s_txwrite <= (others => '0');
                s_txflag <= (others => '0');
                s_txdata <= (others => (others => '0'));
                s_tick_in <= (others => '0');
                s_ctrl_in <= (others => (others => '0'));
                s_time_in <= (others => (others => '0'));
                -- Intern signals.
                s_port_input <= init_input_port;
                s_port_output <= init_output_port;
                s_info1 <= '0';
                s_info2 <= '0';
                s_info3 <= '0';
                --s_spw_buffer <= (8 => '1', others => '0');
                istate <= s_Idle;
            else
                case istate is
                    when s_Idle =>
                        -- Reset all relevant signals.
                        s_info1 <= '0';
                        s_info2 <= '0';
                        s_info3 <= '0';
                        s_txwrite <= (others => '0');
                        s_txflag <= (others => '0');
                        s_txdata <= (others => (others => '0'));
                        s_ctrl_in <= (others => (others => '0'));
                        s_time_in <= (others => (others => '0'));
                        s_tick_in <= (others => '0');
                        
                        -- Check if uart has received new byte.
                        if s_rx_rdy = '1' then
                            s_uart_buffer <= s_rx_data; -- buffering byte
                            s_rx_ack <= '1'; -- Handshake
                            istate <= s_Decode;
                        end if;
                    
                    when s_Decode =>
                        s_rx_ack <= '0'; -- Handshake
                    
                        -- Decide what was received.
                        if s_uart_buffer(7) = '1' and activate_commands = true then -- Commands are allowed only activated in config adapter !
                            -- Command
                            istate <= s_Cmd;
                        else
                            -- Data (N-Char / TimeCode)
                            istate <= s_Data;
                        end if;
                    
                    when s_Cmd =>
                        -- Further decoding...
                        case s_uart_buffer(6 downto 5) is
                            when "00" =>
                                -- Intern control command (Reset, Output Info1, Output Info2, Output Info3)
                                case s_uart_buffer(4 downto 3) is
                                    when "00" =>
                                        -- Reset of all state variables (no global reset !)
                                        -- List everything that should be reset here...
                                        s_port_input <= init_input_port;
                                        s_port_output <= init_output_port;
                                        
                                    when "01" =>
                                        -- Output Info1
                                        s_info1 <= '1';                                        
                                        
                                    when "10" =>
                                        -- Output Info2
                                        s_info2 <= '1';                                        
                                        
                                    when "11" =>
                                        -- Output Info3
                                        s_info3 <= '1';
                                        
                                    when others => -- just for simulation
                                        null;                                        
                                    
                                end case;
                                
                                --istate <= s_Idle;
                            
                            when "01" =>
                                -- Set router input port
                                if (to_integer(unsigned(s_uart_buffer(4 downto 0))) <= numports) then -- If number is bigger than numports, port remains unchanged.
                                    s_port_input <= to_integer(unsigned(s_uart_buffer(4 downto 0)));
                                end if;
                                --istate <= s_Idle;
                            
                            when "10" =>
                                -- Set router output port
                                if (to_integer(unsigned(s_uart_buffer(4 downto 0))) <= numports) then -- If number is bigger that numports, port remains unchanged.
                                    s_port_output <= to_integer(unsigned(s_uart_buffer(4 downto 0)));
                                end if;
                                --istate <= s_Idle;
                            
                            when "11" =>
                                -- End of Packet / Error End of Packet
                                if s_uart_buffer(4) = '1' then
                                    -- EEP (Error End of Packet)
                                    s_txdata(s_port_input) <= x"01";
                                    s_txflag(s_port_input) <= '1';
                                else
                                    -- EOP (End of Packet)
                                    s_txdata(s_port_input) <= x"00";
                                    s_txflag(s_port_input) <= '1';
                                end if;
                                
                                s_txwrite(s_port_input) <= '1';
                                istate <= s_Idle;
                                
                            when others => -- just for simulation
                                null;                         
                                                            
                        end case;
                        
                        istate <= s_Idle;               

                    when s_Data =>
                        if s_uart_buffer(6) = '1' and activate_commands = true then -- Sending Time Code is allowed only when Commands are activated !
                            -- TimeCode
                            s_time_in(s_port_input) <= s_uart_buffer(5 downto 0);
                            s_tick_in(s_port_input) <= '1';
                        else
                            -- N-Char
                            if s_uart_buffer = "11111111" and activate_commands = false then -- Only active if no commands are allowed to close packet.
                                -- Create EOP
                                s_txdata(s_port_input) <= x"00";
                                s_txflag(s_port_input) <= '1';
                                
                                s_txwrite(s_port_input) <= '1';                            
                            else
                                -- Normal N-Char (default chase)
                                if activate_commands = true then
                                    s_txdata(s_port_input) <= "00" & s_uart_buffer(5 downto 0);
                                else
                                    s_txdata(s_port_input) <= s_uart_buffer;
                                end if;
                                s_txflag(s_port_input) <= '0';
                            
                                s_txwrite(s_port_input) <= '1';
                            end if;
                        end if;
                        
                        istate <= s_Idle;                      
                        
                end case;
            end if;
        end if;
    end process uart2spw;
    
    -- SpaceWire -> UART.
    spw2uart : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                -- Synchronous reset.
                s_rxread <= (others => '0');
                s_uart_output <= (others => '0');
                s_tx_data <= (others => '0');
                s_tx_ack <= '0';
                ostate <= s_Idle;
            else
                case ostate is
                    when s_Idle =>
                        -- Wait until a Time Code (highest priority) or N-Char were received or command information is requested.
                        if s_tick_out(s_port_output) = '1' and activate_commands = true then
                            s_uart_output <= "01" & s_time_out(s_port_output);
                            ostate <= s_Wait;
                        elsif s_rxvalid(s_port_output) = '1' then
                            if s_rxflag(s_port_output) = '1' then
                                -- EOP / EEP
                                if s_rxdata(s_port_output) = x"01" then
                                    -- EEP
                                    s_uart_output <= x"fe"; -- 11111110                                    
                                else
                                    -- EOP
                                    s_uart_output <= x"ff"; -- 11111111                                    
                                end if;
                                
                                s_rxread(s_port_output) <= '1';
                                ostate <= s_NChar;
                            else
                                -- Data byte
                                if activate_commands = true then
                                    s_uart_output <= "00" & s_rxdata(s_port_output)(5 downto 0);
                                else
                                    s_uart_output <= s_rxdata(s_port_output);
                                end if;
                            end if;
                            
                            s_rxread(s_port_output) <= '1';
                            ostate <= s_NChar;
                        
                        elsif s_info1 = '1' and activate_commands = true then
                            -- Send selected input port.
                            s_uart_output <= "101" & std_logic_vector(to_unsigned(s_port_input, 5));
                            
                            ostate <= s_Wait;
                        elsif s_info2 = '1' and activate_commands = true then
                            -- Send selected output port.
                            s_uart_output <= "110" & std_logic_vector(to_unsigned(s_port_output, 5));
                            
                            ostate <= s_Wait;
                        elsif s_info3 = '1' and activate_commands = true then
                            -- Send error & status report.
                            s_uart_output(7 downto 5) <= "100";
                            s_uart_output(4) <= s_started(s_port_input) or s_connecting(s_port_input);
                            s_uart_output(3) <= s_running(s_port_input);
                            s_uart_output(2) <= s_errdisc(s_port_input) or s_errpar(s_port_input);
                            s_uart_output(1) <= s_erresc(s_port_input) or s_errcred(s_port_input);
                            s_uart_output(0) <= s_rxhalff(s_port_output) or s_txhalff(s_port_input); -- input / output !
                            
                            ostate <= s_Wait;                                        
                        end if;
                    
                    when s_NChar =>
                        -- Reset handshake with SpaceWire port.
                        s_rxread(s_port_output) <= '0';
                                                
                        ostate <= s_Wait;
                    
                    when s_Wait =>
                        -- Wait until UART transmitter is ready to send...
                        if s_tx_rdy = '1' then
                            s_tx_data <= s_uart_output;
                            s_tx_ack <= '1';
                            ostate <= s_CleanUp;
                        end if;
                    
                    when s_CleanUp =>
                        -- Widthdraw transmission permission.
                        s_tx_ack <= '0';
                        
                        ostate <= s_Idle;
                    
                end case;
            end if;
        end if;
    end process spw2uart;
end architecture UARTSpWAdapter_config_arch;