----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 25.05.2022 12:29
-- Design Name: 
-- Module Name: 
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Dependencies: none
-- 
-- Revision:
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UART2SpW is
    generic (
        -- frequency clk / frequency Uart
        -- Example: 10 MHz Clock, 115200 baud rate Uart
        -- 100_000_000 / 115_200 = 868
        clk_cycles_per_bit : Integer;
        
        -- Number of SpaceWire Ports in this adapter.
        numports : integer range 0 to 31
    );
    port (
        -- System clock.
        clk : in std_logic;
        
        -- Reset.
        rst : in std_logic;
        
        -- Incoming serial stream (uart).
        rx : in std_logic;
        
        -- Outoing serial stream (uart).
        tx : out std_logic;
        
        -- SpaceWire Data In.
        spw_di : in std_logic_vector(numports downto 0);
        
        -- SpaceWire Strobe In.
        spw_si : in std_logic_vector(numports downto 0);
        
        -- SpaceWire Data Out.
        spw_do : out std_logic_vector(numports downto 0);
        
        -- SpaceWire Strobe Out.
        spw_so : out std_logic_vector(numports downto 0)
    );    
end UART2SpW;

architecture UART2SpW_arch of UART2SpW is
    component uart_rx
        generic (
            clk_cycles_per_bit : integer
        );    
        port (
            -- System clock.
            clk : in std_logic;
            
            -- Reset.
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

    component uart_tx
        generic (
            clk_cycles_per_bit : integer
        );
        port (
            clk : in std_logic;
            rst : in std_logic;
            tx_ack : in std_logic;
            tx_data : in std_logic_vector(7 downto 0);
            tx_rdy : out std_logic := '1';
            tx_port : out std_logic := '1'
        );
    end component;
    
    -- Signals.
    -- Uart Recv.
    signal s_rx_rdy : std_logic;
    signal s_rx_ack : std_logic;
    signal s_rx_data : std_logic_vector(7 downto 0);
    -- Uart Trans.
    signal s_tx_ack : std_logic;
    signal s_tx_rdy : std_logic := '1';
    signal s_tx_data : std_logic_vector(7 downto 0);
    -- SpaceWire.
    -- ...
    
    -- Intern signals.
    type input_states is (s_Idle, s_Decode, s_Cmd, s_Data); -- unvollständig!
    signal istate : input_states := s_Idle;
    
    type output_states is (s_Idle); -- Unvollständig!
    signal ostate : output_states := s_Idle;
    
    -- Buffer.
    signal s_uart_buffer : std_logic_vector(7 downto 0); -- buffers incoming bytes (uart)
    signal s_spw_buffer : std_logic_vector(8 downto 0); -- buffers input data for spacewire port (flag + N-Char)
    signal s_spw_output: std_logic_vector(8 downto 0); -- buffers output data for spacewire port (flag + N-Char)
    signal s_uart_output : std_logic_vector(7 downto 0); -- buffers outgoing bytes (uart)
    
    -- Control.
    signal s_port_input : integer range 0 to numports := 0;
    signal s_port_output : integer range 0 to numports := 0;
    
    -- Intern infos request.
    signal s_info1 : std_logic := '0';
    signal s_info2 : std_logic := '0';
    signal s_info3 : std_logic := '0'; -- Reserved
begin
    UartRx : uart_rx
        generic map (
            clk_cycles_per_bit => clk_cycles_per_bit
        )
        port map (
            clk => clk,
            rst => rst,
            rx_port => rx,
            rx_rdy => s_rx_rdy,
            rx_ack => s_rx_ack,
            rx_data => s_rx_data
        );
        
    UartTx : uart_tx
        generic map (
            clk_cycles_per_bit => clk_cycles_per_bit
        )
        port map (
            clk => clk,
            rst => rst,
            tx_port => tx,
            tx_ack => s_tx_ack,
            tx_rdy => s_tx_rdy,
            tx_data => s_tx_data
        );
    
    uart2spw : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                -- Synchronous reset.
                s_rx_ack <= '0';
                s_uart_buffer <= (others => '0');
                s_spw_buffer <= (others => '0'); -- Vielleicht hier "100000000" festlegen? Sollte aber eigentlich egal sein
                s_txwrite <= (others => '0');
                s_tick_in <= (others => '0');
                istate <= s_Idle;
            else
                case istate is
                    when s_Idle =>
                        -- Reset all relevant signals.
                        s_info1 <= '0';
                        s_info2 <= '0';
                        s_info3 <= '0';
                        s_txwrite <= (others => '0');
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
                        if s_uart_buffer(7) = '1' then
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
                                        -- Reset
                                        -- List everything that should be reset here...
                                        s_port_input <= 0;
                                        s_port_output <= 0;
                                        
                                        istate <= s_Idle;
                                        
                                    when "01" =>
                                        -- Output Info1
                                        s_info1 <= '1';                                        
                                        istate <= S_Idle;
                                        
                                    when "10" =>
                                        -- Output Info2
                                        s_info2 <= '1';                                        
                                        istate <= s_Idle;
                                        
                                    when "11" =>
                                        -- Output Info3 (Reserved)
                                        s_info3 <= '1';                                        
                                        istate <= s_Idle;
                                    
                                end case;
                            
                            when "01" =>
                                -- Set router input port
                                if (to_integer(unsigned(s_uart_buffer(4 downto 0))) > numports) then
                                    s_port_input <= numports;
                                else
                                    s_port_input <= to_integer(unsigned(s_uart_buffer(4 downto 0)));
                                end if;
                                istate <= s_Idle;
                            
                            when "10" =>
                                -- Set router output port
                                if (to_integer(unsigned(s_uart_buffer(4 downto 0))) > numports) then
                                    s_port_output <= numports;
                                else
                                    s_port_output <= to_integer(unsigned(s_uart_buffer(4 downto 0)));
                                end if;
                                istate <= s_Idle;
                            
                            when "11" =>
                                -- End of Packet / Error End of Packet
                                if s_uart_buffer(4) = '1' then
                                    -- EEP (Error End of Packet)
                                    --s_spw_buffer <= "100000001";
                                    s_txdata(s_port_input) <= "00000001"; -- 0x01
                                    s_txflag(s_port_input) <= '1';
                                else
                                    -- EOP (End of Packet)
                                    --s_spw_buffer <= "100000000";
                                    s_txdata(s_port_input) <= "00000000"; -- 0x00
                                    s_txflag(s_port_input) <= '1';
                                end if;
                                
                                s_txwrite(s_port_input) <= '1';
                                
                                istate <= s_Idle;
                                
                                                            
                        end case;                    

                    when s_Data =>
                        if s_uart_buffer(6) = '1' then
                            -- TimeCode
                            s_time_in(s_port_input) <= s_uart_buffer(5 downto 0);
                            s_tick_in(s_port_input) <= '1';
                        else
                            -- N-Char
                            s_txdata(s_port_input) <= "00" & s_uart_buffer(5 downto 0);
                            s_txflag(s_port_input) <= '0';
                            
                            s_txwrite(s_port_input) <= '1';
                        end if;
                        
                        istate <= s_Idle;                      
                        
                end case;            
            end if;
        end if;
    end process uart2spw;
    
    spw2uart : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                -- Synchronous reset.
            else
                case ostate is
                    when s_Idle =>
                        if s_tick_out(s_port_output) = '1' then
                            -- TimeCode was received.
                        elsif s_rxvalid(s_port_output) = '1' then
                            -- N-Char was received.
                        elsif s_info1 = '1' then
                            -- Intern Info1 is requested.
                        elsif s_info2 = '1' then
                            -- Intern Info2 is requested.
                        elsif s_info3 = '1' then
                            -- Intern Info3 is requested.
                        end if; 
                   
                    when s_Read =>
                   
                    when s_Write =>
                end case;
            end if;
        end if;
    end process spw2uart;
end architecture UART2SpW_arch;