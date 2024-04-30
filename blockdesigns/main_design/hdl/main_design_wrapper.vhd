--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
--Date        : Tue Apr 30 12:28:57 2024
--Host        : stl56jc-MS-7C95 running 64-bit Ubuntu 22.04.4 LTS
--Command     : generate_target main_design_wrapper.bd
--Design      : main_design_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity main_design_wrapper is
  port (
    CAN_0_rx : in STD_LOGIC;
    CAN_0_tx : out STD_LOGIC;
    CLK_IN1_D_0_clk_n : in STD_LOGIC;
    CLK_IN1_D_0_clk_p : in STD_LOGIC;
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    IIC_1_scl_io : inout STD_LOGIC;
    IIC_1_sda_io : inout STD_LOGIC;
    SPI_0_io0_io : inout STD_LOGIC;
    SPI_0_io1_io : inout STD_LOGIC;
    SPI_0_sck_io : inout STD_LOGIC;
    SPI_0_ss1_o : out STD_LOGIC;
    SPI_0_ss2_o : out STD_LOGIC;
    SPI_0_ss_io : inout STD_LOGIC;
    UART_0_rxd : in STD_LOGIC;
    UART_0_txd : out STD_LOGIC;
    reset : in STD_LOGIC;
    rst_logic : in STD_LOGIC;
    rx : in STD_LOGIC;
    spw_di_1 : in STD_LOGIC;
    spw_di_2 : in STD_LOGIC;
    spw_di_3 : in STD_LOGIC;
    spw_di_4 : in STD_LOGIC;
    spw_do_1 : out STD_LOGIC;
    spw_do_2 : out STD_LOGIC;
    spw_do_3 : out STD_LOGIC;
    spw_do_4 : out STD_LOGIC;
    spw_si_1 : in STD_LOGIC;
    spw_si_2 : in STD_LOGIC;
    spw_si_3 : in STD_LOGIC;
    spw_si_4 : in STD_LOGIC;
    spw_so_1 : out STD_LOGIC;
    spw_so_2 : out STD_LOGIC;
    spw_so_3 : out STD_LOGIC;
    spw_so_4 : out STD_LOGIC;
    tx : out STD_LOGIC
  );
end main_design_wrapper;

architecture STRUCTURE of main_design_wrapper is
  component main_design is
  port (
    tx : out STD_LOGIC;
    rx : in STD_LOGIC;
    spw_di_1 : in STD_LOGIC;
    spw_si_1 : in STD_LOGIC;
    spw_di_2 : in STD_LOGIC;
    spw_si_2 : in STD_LOGIC;
    spw_di_3 : in STD_LOGIC;
    spw_si_3 : in STD_LOGIC;
    spw_di_4 : in STD_LOGIC;
    spw_si_4 : in STD_LOGIC;
    spw_do_1 : out STD_LOGIC;
    spw_so_1 : out STD_LOGIC;
    spw_do_2 : out STD_LOGIC;
    spw_so_2 : out STD_LOGIC;
    spw_do_3 : out STD_LOGIC;
    spw_so_3 : out STD_LOGIC;
    spw_do_4 : out STD_LOGIC;
    spw_so_4 : out STD_LOGIC;
    rst_logic : in STD_LOGIC;
    reset : in STD_LOGIC;
    CLK_IN1_D_0_clk_n : in STD_LOGIC;
    CLK_IN1_D_0_clk_p : in STD_LOGIC;
    CAN_0_tx : out STD_LOGIC;
    CAN_0_rx : in STD_LOGIC;
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    IIC_1_sda_i : in STD_LOGIC;
    IIC_1_sda_o : out STD_LOGIC;
    IIC_1_sda_t : out STD_LOGIC;
    IIC_1_scl_i : in STD_LOGIC;
    IIC_1_scl_o : out STD_LOGIC;
    IIC_1_scl_t : out STD_LOGIC;
    SPI_0_sck_i : in STD_LOGIC;
    SPI_0_sck_o : out STD_LOGIC;
    SPI_0_sck_t : out STD_LOGIC;
    SPI_0_io0_i : in STD_LOGIC;
    SPI_0_io0_o : out STD_LOGIC;
    SPI_0_io0_t : out STD_LOGIC;
    SPI_0_io1_i : in STD_LOGIC;
    SPI_0_io1_o : out STD_LOGIC;
    SPI_0_io1_t : out STD_LOGIC;
    SPI_0_ss_i : in STD_LOGIC;
    SPI_0_ss_o : out STD_LOGIC;
    SPI_0_ss1_o : out STD_LOGIC;
    SPI_0_ss2_o : out STD_LOGIC;
    SPI_0_ss_t : out STD_LOGIC;
    UART_0_txd : out STD_LOGIC;
    UART_0_rxd : in STD_LOGIC
  );
  end component main_design;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal IIC_1_scl_i : STD_LOGIC;
  signal IIC_1_scl_o : STD_LOGIC;
  signal IIC_1_scl_t : STD_LOGIC;
  signal IIC_1_sda_i : STD_LOGIC;
  signal IIC_1_sda_o : STD_LOGIC;
  signal IIC_1_sda_t : STD_LOGIC;
  signal SPI_0_io0_i : STD_LOGIC;
  signal SPI_0_io0_o : STD_LOGIC;
  signal SPI_0_io0_t : STD_LOGIC;
  signal SPI_0_io1_i : STD_LOGIC;
  signal SPI_0_io1_o : STD_LOGIC;
  signal SPI_0_io1_t : STD_LOGIC;
  signal SPI_0_sck_i : STD_LOGIC;
  signal SPI_0_sck_o : STD_LOGIC;
  signal SPI_0_sck_t : STD_LOGIC;
  signal SPI_0_ss_i : STD_LOGIC;
  signal SPI_0_ss_o : STD_LOGIC;
  signal SPI_0_ss_t : STD_LOGIC;
begin
IIC_1_scl_iobuf: component IOBUF
     port map (
      I => IIC_1_scl_o,
      IO => IIC_1_scl_io,
      O => IIC_1_scl_i,
      T => IIC_1_scl_t
    );
IIC_1_sda_iobuf: component IOBUF
     port map (
      I => IIC_1_sda_o,
      IO => IIC_1_sda_io,
      O => IIC_1_sda_i,
      T => IIC_1_sda_t
    );
SPI_0_io0_iobuf: component IOBUF
     port map (
      I => SPI_0_io0_o,
      IO => SPI_0_io0_io,
      O => SPI_0_io0_i,
      T => SPI_0_io0_t
    );
SPI_0_io1_iobuf: component IOBUF
     port map (
      I => SPI_0_io1_o,
      IO => SPI_0_io1_io,
      O => SPI_0_io1_i,
      T => SPI_0_io1_t
    );
SPI_0_sck_iobuf: component IOBUF
     port map (
      I => SPI_0_sck_o,
      IO => SPI_0_sck_io,
      O => SPI_0_sck_i,
      T => SPI_0_sck_t
    );
SPI_0_ss_iobuf: component IOBUF
     port map (
      I => SPI_0_ss_o,
      IO => SPI_0_ss_io,
      O => SPI_0_ss_i,
      T => SPI_0_ss_t
    );
main_design_i: component main_design
     port map (
      CAN_0_rx => CAN_0_rx,
      CAN_0_tx => CAN_0_tx,
      CLK_IN1_D_0_clk_n => CLK_IN1_D_0_clk_n,
      CLK_IN1_D_0_clk_p => CLK_IN1_D_0_clk_p,
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      IIC_1_scl_i => IIC_1_scl_i,
      IIC_1_scl_o => IIC_1_scl_o,
      IIC_1_scl_t => IIC_1_scl_t,
      IIC_1_sda_i => IIC_1_sda_i,
      IIC_1_sda_o => IIC_1_sda_o,
      IIC_1_sda_t => IIC_1_sda_t,
      SPI_0_io0_i => SPI_0_io0_i,
      SPI_0_io0_o => SPI_0_io0_o,
      SPI_0_io0_t => SPI_0_io0_t,
      SPI_0_io1_i => SPI_0_io1_i,
      SPI_0_io1_o => SPI_0_io1_o,
      SPI_0_io1_t => SPI_0_io1_t,
      SPI_0_sck_i => SPI_0_sck_i,
      SPI_0_sck_o => SPI_0_sck_o,
      SPI_0_sck_t => SPI_0_sck_t,
      SPI_0_ss1_o => SPI_0_ss1_o,
      SPI_0_ss2_o => SPI_0_ss2_o,
      SPI_0_ss_i => SPI_0_ss_i,
      SPI_0_ss_o => SPI_0_ss_o,
      SPI_0_ss_t => SPI_0_ss_t,
      UART_0_rxd => UART_0_rxd,
      UART_0_txd => UART_0_txd,
      reset => reset,
      rst_logic => rst_logic,
      rx => rx,
      spw_di_1 => spw_di_1,
      spw_di_2 => spw_di_2,
      spw_di_3 => spw_di_3,
      spw_di_4 => spw_di_4,
      spw_do_1 => spw_do_1,
      spw_do_2 => spw_do_2,
      spw_do_3 => spw_do_3,
      spw_do_4 => spw_do_4,
      spw_si_1 => spw_si_1,
      spw_si_2 => spw_si_2,
      spw_si_3 => spw_si_3,
      spw_si_4 => spw_si_4,
      spw_so_1 => spw_so_1,
      spw_so_2 => spw_so_2,
      spw_so_3 => spw_so_3,
      spw_so_4 => spw_so_4,
      tx => tx
    );
end STRUCTURE;
