LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uart IS
    GENERIC (
        -- frequency clk / frequency Uart
        -- Example: 10 MHz Clock, 115200 baud rate Uart
        -- 10000000 / 115200 = 87
        clk_cycles_per_bit : INTEGER
    );
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        tx_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        tx_ack : IN STD_LOGIC;
        tx_port : OUT STD_LOGIC := '1';
        tx_rdy : OUT STD_LOGIC := '1';

        rx_port : IN STD_LOGIC;
        rx_ack : IN STD_LOGIC;
        rx_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        rx_rdy : OUT STD_LOGIC := '0'
    );
END uart;

ARCHITECTURE uart_arch OF uart IS
    COMPONENT uart_rx IS
        GENERIC (
            clk_cycles_per_bit : INTEGER
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            rx_port : IN STD_LOGIC;
            rx_ack : IN STD_LOGIC;
            rx_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            rx_rdy : OUT STD_LOGIC := '0'
        );
    END COMPONENT uart_rx;

    COMPONENT uart_tx IS
        GENERIC (
            clk_cycles_per_bit : INTEGER
        );
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            tx_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            tx_ack : IN STD_LOGIC;

            tx_port : OUT STD_LOGIC := '1';
            tx_rdy : OUT STD_LOGIC := '1'
        );
    end component uart_tx;
    BEGIN

        uart_tx_object : uart_tx
        GENERIC MAP(
            clk_cycles_per_bit => clk_cycles_per_bit
        )
        PORT MAP(
            clk => clk,
            rst => rst,
            tx_port => tx_port,
            tx_ack => tx_ack,
            tx_data => tx_data,
            tx_rdy => tx_rdy
        );

        uart_rx_object : uart_rx
        GENERIC MAP(
            clk_cycles_per_bit => clk_cycles_per_bit
        )
        PORT MAP(
            clk => clk,
            rst => rst,
            rx_port => rx_port,
            rx_ack => rx_ack,
            rx_data => rx_data,
            rx_rdy => rx_rdy
        );
    END ARCHITECTURE uart_arch;