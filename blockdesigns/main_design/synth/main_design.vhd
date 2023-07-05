--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
--Date        : Wed Jul  5 13:10:51 2023
--Host        : stl56jc-MS-7C95 running 64-bit Ubuntu 22.04.2 LTS
--Command     : generate_target main_design.bd
--Design      : main_design
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity main_design is
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
    IIC_0_scl_i : in STD_LOGIC;
    IIC_0_scl_o : out STD_LOGIC;
    IIC_0_scl_t : out STD_LOGIC;
    IIC_0_sda_i : in STD_LOGIC;
    IIC_0_sda_o : out STD_LOGIC;
    IIC_0_sda_t : out STD_LOGIC;
    SPI_0_io0_i : in STD_LOGIC;
    SPI_0_io0_o : out STD_LOGIC;
    SPI_0_io0_t : out STD_LOGIC;
    SPI_0_io1_i : in STD_LOGIC;
    SPI_0_io1_o : out STD_LOGIC;
    SPI_0_io1_t : out STD_LOGIC;
    SPI_0_sck_i : in STD_LOGIC;
    SPI_0_sck_o : out STD_LOGIC;
    SPI_0_sck_t : out STD_LOGIC;
    SPI_0_ss1_o : out STD_LOGIC;
    SPI_0_ss2_o : out STD_LOGIC;
    SPI_0_ss_i : in STD_LOGIC;
    SPI_0_ss_o : out STD_LOGIC;
    SPI_0_ss_t : out STD_LOGIC;
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of main_design : entity is "main_design,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=main_design,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=14,numReposBlks=14,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=3,da_board_cnt=6,da_clkrst_cnt=3,da_ps7_cnt=1,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of main_design : entity is "main_design.hwdef";
end main_design;

architecture STRUCTURE of main_design is
  component main_design_processing_system7_0_2 is
  port (
    CAN0_PHY_TX : out STD_LOGIC;
    CAN0_PHY_RX : in STD_LOGIC;
    I2C0_SDA_I : in STD_LOGIC;
    I2C0_SDA_O : out STD_LOGIC;
    I2C0_SDA_T : out STD_LOGIC;
    I2C0_SCL_I : in STD_LOGIC;
    I2C0_SCL_O : out STD_LOGIC;
    I2C0_SCL_T : out STD_LOGIC;
    SPI0_SCLK_I : in STD_LOGIC;
    SPI0_SCLK_O : out STD_LOGIC;
    SPI0_SCLK_T : out STD_LOGIC;
    SPI0_MOSI_I : in STD_LOGIC;
    SPI0_MOSI_O : out STD_LOGIC;
    SPI0_MOSI_T : out STD_LOGIC;
    SPI0_MISO_I : in STD_LOGIC;
    SPI0_MISO_O : out STD_LOGIC;
    SPI0_MISO_T : out STD_LOGIC;
    SPI0_SS_I : in STD_LOGIC;
    SPI0_SS_O : out STD_LOGIC;
    SPI0_SS1_O : out STD_LOGIC;
    SPI0_SS2_O : out STD_LOGIC;
    SPI0_SS_T : out STD_LOGIC;
    UART0_TX : out STD_LOGIC;
    UART0_RX : in STD_LOGIC;
    TTC0_WAVE0_OUT : out STD_LOGIC;
    TTC0_WAVE1_OUT : out STD_LOGIC;
    TTC0_WAVE2_OUT : out STD_LOGIC;
    USB0_PORT_INDCTL : out STD_LOGIC_VECTOR ( 1 downto 0 );
    USB0_VBUS_PWRSELECT : out STD_LOGIC;
    USB0_VBUS_PWRFAULT : in STD_LOGIC;
    M_AXI_GP0_ARVALID : out STD_LOGIC;
    M_AXI_GP0_AWVALID : out STD_LOGIC;
    M_AXI_GP0_BREADY : out STD_LOGIC;
    M_AXI_GP0_RREADY : out STD_LOGIC;
    M_AXI_GP0_WLAST : out STD_LOGIC;
    M_AXI_GP0_WVALID : out STD_LOGIC;
    M_AXI_GP0_ARID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_AWID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_WID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ACLK : in STD_LOGIC;
    M_AXI_GP0_ARREADY : in STD_LOGIC;
    M_AXI_GP0_AWREADY : in STD_LOGIC;
    M_AXI_GP0_BVALID : in STD_LOGIC;
    M_AXI_GP0_RLAST : in STD_LOGIC;
    M_AXI_GP0_RVALID : in STD_LOGIC;
    M_AXI_GP0_WREADY : in STD_LOGIC;
    M_AXI_GP0_BID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_RID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_ARREADY : out STD_LOGIC;
    S_AXI_HP0_AWREADY : out STD_LOGIC;
    S_AXI_HP0_BVALID : out STD_LOGIC;
    S_AXI_HP0_RLAST : out STD_LOGIC;
    S_AXI_HP0_RVALID : out STD_LOGIC;
    S_AXI_HP0_WREADY : out STD_LOGIC;
    S_AXI_HP0_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_RCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP0_WCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP0_RACOUNT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_WACOUNT : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_ACLK : in STD_LOGIC;
    S_AXI_HP0_ARVALID : in STD_LOGIC;
    S_AXI_HP0_AWVALID : in STD_LOGIC;
    S_AXI_HP0_BREADY : in STD_LOGIC;
    S_AXI_HP0_RDISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP0_RREADY : in STD_LOGIC;
    S_AXI_HP0_WLAST : in STD_LOGIC;
    S_AXI_HP0_WRISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP0_WVALID : in STD_LOGIC;
    S_AXI_HP0_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_ARLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_AWLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_WID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    IRQ_F2P : in STD_LOGIC_VECTOR ( 7 downto 0 );
    FCLK_CLK0 : out STD_LOGIC;
    FCLK_RESET0_N : out STD_LOGIC;
    MIO : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    DDR_CAS_n : inout STD_LOGIC;
    DDR_CKE : inout STD_LOGIC;
    DDR_Clk_n : inout STD_LOGIC;
    DDR_Clk : inout STD_LOGIC;
    DDR_CS_n : inout STD_LOGIC;
    DDR_DRSTB : inout STD_LOGIC;
    DDR_ODT : inout STD_LOGIC;
    DDR_RAS_n : inout STD_LOGIC;
    DDR_WEB : inout STD_LOGIC;
    DDR_BankAddr : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_Addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_VRN : inout STD_LOGIC;
    DDR_VRP : inout STD_LOGIC;
    DDR_DM : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQ : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_DQS_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQS : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    PS_SRSTB : inout STD_LOGIC;
    PS_CLK : inout STD_LOGIC;
    PS_PORB : inout STD_LOGIC
  );
  end component main_design_processing_system7_0_2;
  component main_design_proc_sys_reset_0_1 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component main_design_proc_sys_reset_0_1;
  component main_design_clk_wiz_0_1 is
  port (
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC;
    reset : in STD_LOGIC;
    clk_200 : out STD_LOGIC;
    clk_100 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component main_design_clk_wiz_0_1;
  component main_design_axi_mcdma_0_1 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_lite_aclk : in STD_LOGIC;
    axi_resetn : in STD_LOGIC;
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_sg_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_awuser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_awvalid : out STD_LOGIC;
    m_axi_sg_awready : in STD_LOGIC;
    m_axi_sg_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_wlast : out STD_LOGIC;
    m_axi_sg_wvalid : out STD_LOGIC;
    m_axi_sg_wready : in STD_LOGIC;
    m_axi_sg_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_bvalid : in STD_LOGIC;
    m_axi_sg_bready : out STD_LOGIC;
    m_axi_sg_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_sg_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_aruser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_arvalid : out STD_LOGIC;
    m_axi_sg_arready : in STD_LOGIC;
    m_axi_sg_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_rlast : in STD_LOGIC;
    m_axi_sg_rvalid : in STD_LOGIC;
    m_axi_sg_rready : out STD_LOGIC;
    m_axi_mm2s_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mm2s_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_mm2s_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm2s_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm2s_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mm2s_aruser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mm2s_arvalid : out STD_LOGIC;
    m_axi_mm2s_arready : in STD_LOGIC;
    m_axi_mm2s_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mm2s_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_rlast : in STD_LOGIC;
    m_axi_mm2s_rvalid : in STD_LOGIC;
    m_axi_mm2s_rready : out STD_LOGIC;
    mm2s_prmry_reset_out_n : out STD_LOGIC;
    m_axis_mm2s_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_mm2s_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_mm2s_tvalid : out STD_LOGIC;
    m_axis_mm2s_tready : in STD_LOGIC;
    m_axis_mm2s_tlast : out STD_LOGIC;
    m_axis_mm2s_tuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_mm2s_tid : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_mm2s_tdest : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_s2mm_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_awuser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_awvalid : out STD_LOGIC;
    m_axi_s2mm_awready : in STD_LOGIC;
    m_axi_s2mm_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_wlast : out STD_LOGIC;
    m_axi_s2mm_wvalid : out STD_LOGIC;
    m_axi_s2mm_wready : in STD_LOGIC;
    m_axi_s2mm_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_bvalid : in STD_LOGIC;
    m_axi_s2mm_bready : out STD_LOGIC;
    s2mm_prmry_reset_out_n : out STD_LOGIC;
    s_axis_s2mm_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_s2mm_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_s2mm_tvalid : in STD_LOGIC;
    s_axis_s2mm_tready : out STD_LOGIC;
    s_axis_s2mm_tlast : in STD_LOGIC;
    s_axis_s2mm_tuser : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_s2mm_tid : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_s2mm_tdest : in STD_LOGIC_VECTOR ( 3 downto 0 );
    mm2s_ch1_introut : out STD_LOGIC;
    s2mm_ch1_introut : out STD_LOGIC
  );
  end component main_design_axi_mcdma_0_1;
  component main_design_smartconnect_1_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    S00_AXI_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wvalid : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    S01_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S01_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S01_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_awuser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_awvalid : in STD_LOGIC;
    S01_AXI_awready : out STD_LOGIC;
    S01_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_wlast : in STD_LOGIC;
    S01_AXI_wvalid : in STD_LOGIC;
    S01_AXI_wready : out STD_LOGIC;
    S01_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_bvalid : out STD_LOGIC;
    S01_AXI_bready : in STD_LOGIC;
    S01_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S01_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S01_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_aruser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_arvalid : in STD_LOGIC;
    S01_AXI_arready : out STD_LOGIC;
    S01_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_rlast : out STD_LOGIC;
    S01_AXI_rvalid : out STD_LOGIC;
    S01_AXI_rready : in STD_LOGIC;
    S02_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S02_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S02_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S02_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S02_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S02_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S02_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_aruser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_arvalid : in STD_LOGIC;
    S02_AXI_arready : out STD_LOGIC;
    S02_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S02_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S02_AXI_rlast : out STD_LOGIC;
    S02_AXI_rvalid : out STD_LOGIC;
    S02_AXI_rready : in STD_LOGIC;
    S03_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S03_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S03_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S03_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S03_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S03_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S03_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S03_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S03_AXI_awuser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S03_AXI_awvalid : in STD_LOGIC;
    S03_AXI_awready : out STD_LOGIC;
    S03_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S03_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S03_AXI_wlast : in STD_LOGIC;
    S03_AXI_wvalid : in STD_LOGIC;
    S03_AXI_wready : out STD_LOGIC;
    S03_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S03_AXI_bvalid : out STD_LOGIC;
    S03_AXI_bready : in STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awuser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wlast : out STD_LOGIC;
    M00_AXI_wvalid : out STD_LOGIC;
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_aruser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rlast : in STD_LOGIC;
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_rready : out STD_LOGIC;
    M01_AXI_awaddr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M01_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_awvalid : out STD_LOGIC;
    M01_AXI_awready : in STD_LOGIC;
    M01_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_wvalid : out STD_LOGIC;
    M01_AXI_wready : in STD_LOGIC;
    M01_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_bvalid : in STD_LOGIC;
    M01_AXI_bready : out STD_LOGIC;
    M01_AXI_araddr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M01_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_arvalid : out STD_LOGIC;
    M01_AXI_arready : in STD_LOGIC;
    M01_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_rvalid : in STD_LOGIC;
    M01_AXI_rready : out STD_LOGIC;
    M02_AXI_awaddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M02_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M02_AXI_awvalid : out STD_LOGIC;
    M02_AXI_awready : in STD_LOGIC;
    M02_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M02_AXI_wvalid : out STD_LOGIC;
    M02_AXI_wready : in STD_LOGIC;
    M02_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_bvalid : in STD_LOGIC;
    M02_AXI_bready : out STD_LOGIC;
    M02_AXI_araddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M02_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M02_AXI_arvalid : out STD_LOGIC;
    M02_AXI_arready : in STD_LOGIC;
    M02_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_rvalid : in STD_LOGIC;
    M02_AXI_rready : out STD_LOGIC;
    M03_AXI_awaddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M03_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M03_AXI_awvalid : out STD_LOGIC;
    M03_AXI_awready : in STD_LOGIC;
    M03_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M03_AXI_wvalid : out STD_LOGIC;
    M03_AXI_wready : in STD_LOGIC;
    M03_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_bvalid : in STD_LOGIC;
    M03_AXI_bready : out STD_LOGIC;
    M03_AXI_araddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M03_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M03_AXI_arvalid : out STD_LOGIC;
    M03_AXI_arready : in STD_LOGIC;
    M03_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_rvalid : in STD_LOGIC;
    M03_AXI_rready : out STD_LOGIC;
    M04_AXI_awaddr : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M04_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M04_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M04_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M04_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M04_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M04_AXI_awuser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M04_AXI_awvalid : out STD_LOGIC;
    M04_AXI_awready : in STD_LOGIC;
    M04_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M04_AXI_wlast : out STD_LOGIC;
    M04_AXI_wvalid : out STD_LOGIC;
    M04_AXI_wready : in STD_LOGIC;
    M04_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_bvalid : in STD_LOGIC;
    M04_AXI_bready : out STD_LOGIC;
    M04_AXI_araddr : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M04_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M04_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M04_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M04_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M04_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M04_AXI_aruser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M04_AXI_arvalid : out STD_LOGIC;
    M04_AXI_arready : in STD_LOGIC;
    M04_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_rlast : in STD_LOGIC;
    M04_AXI_rvalid : in STD_LOGIC;
    M04_AXI_rready : out STD_LOGIC;
    M05_AXI_awaddr : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M05_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M05_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M05_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M05_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_awuser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_awvalid : out STD_LOGIC;
    M05_AXI_awready : in STD_LOGIC;
    M05_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_wlast : out STD_LOGIC;
    M05_AXI_wvalid : out STD_LOGIC;
    M05_AXI_wready : in STD_LOGIC;
    M05_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_bvalid : in STD_LOGIC;
    M05_AXI_bready : out STD_LOGIC;
    M05_AXI_araddr : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M05_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M05_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M05_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M05_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_aruser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_arvalid : out STD_LOGIC;
    M05_AXI_arready : in STD_LOGIC;
    M05_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_rlast : in STD_LOGIC;
    M05_AXI_rvalid : in STD_LOGIC;
    M05_AXI_rready : out STD_LOGIC;
    M06_AXI_awaddr : out STD_LOGIC_VECTOR ( 4 downto 0 );
    M06_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M06_AXI_awvalid : out STD_LOGIC;
    M06_AXI_awready : in STD_LOGIC;
    M06_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M06_AXI_wvalid : out STD_LOGIC;
    M06_AXI_wready : in STD_LOGIC;
    M06_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_bvalid : in STD_LOGIC;
    M06_AXI_bready : out STD_LOGIC;
    M06_AXI_araddr : out STD_LOGIC_VECTOR ( 4 downto 0 );
    M06_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M06_AXI_arvalid : out STD_LOGIC;
    M06_AXI_arready : in STD_LOGIC;
    M06_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_rvalid : in STD_LOGIC;
    M06_AXI_rready : out STD_LOGIC;
    M07_AXI_awaddr : out STD_LOGIC_VECTOR ( 12 downto 0 );
    M07_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M07_AXI_awvalid : out STD_LOGIC;
    M07_AXI_awready : in STD_LOGIC;
    M07_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M07_AXI_wvalid : out STD_LOGIC;
    M07_AXI_wready : in STD_LOGIC;
    M07_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_bvalid : in STD_LOGIC;
    M07_AXI_bready : out STD_LOGIC;
    M07_AXI_araddr : out STD_LOGIC_VECTOR ( 12 downto 0 );
    M07_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M07_AXI_arvalid : out STD_LOGIC;
    M07_AXI_arready : in STD_LOGIC;
    M07_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_rvalid : in STD_LOGIC;
    M07_AXI_rready : out STD_LOGIC
  );
  end component main_design_smartconnect_1_0;
  component main_design_xlconcat_0_1 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component main_design_xlconcat_0_1;
  component main_design_xlconcat_1_1 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In7 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component main_design_xlconcat_1_1;
  component main_design_util_reduced_logic_0_1 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Res : out STD_LOGIC
  );
  end component main_design_util_reduced_logic_0_1;
  component main_design_axi_gpio_0_1 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    gpio_io_o : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component main_design_axi_gpio_0_1;
  component main_design_axi_gpio_1_1 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    gpio_io_o : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component main_design_axi_gpio_1_1;
  component main_design_AXI_SpaceWire_IP_0_1 is
  port (
    clk_logic : in STD_LOGIC;
    rxclk : in STD_LOGIC;
    txclk : in STD_LOGIC;
    rst_logic : in STD_LOGIC;
    tc_in : in STD_LOGIC;
    tc_out_intr : out STD_LOGIC;
    error_intr : out STD_LOGIC;
    state_intr : out STD_LOGIC;
    packet_intr : out STD_LOGIC;
    spw_di : in STD_LOGIC;
    spw_si : in STD_LOGIC;
    spw_do : out STD_LOGIC;
    spw_so : out STD_LOGIC;
    s00_axi_tx_aclk : in STD_LOGIC;
    s00_axi_tx_aresetn : in STD_LOGIC;
    s00_axi_tx_awaddr : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_tx_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_tx_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_tx_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_tx_awlock : in STD_LOGIC;
    s00_axi_tx_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_tx_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_tx_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_tx_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_tx_awuser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_tx_awvalid : in STD_LOGIC;
    s00_axi_tx_awready : out STD_LOGIC;
    s00_axi_tx_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_tx_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_tx_wlast : in STD_LOGIC;
    s00_axi_tx_wvalid : in STD_LOGIC;
    s00_axi_tx_wready : out STD_LOGIC;
    s00_axi_tx_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_tx_bvalid : out STD_LOGIC;
    s00_axi_tx_bready : in STD_LOGIC;
    s00_axi_tx_araddr : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_tx_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_tx_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_tx_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_tx_arlock : in STD_LOGIC;
    s00_axi_tx_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_tx_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_tx_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_tx_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_tx_aruser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_tx_arvalid : in STD_LOGIC;
    s00_axi_tx_arready : out STD_LOGIC;
    s00_axi_tx_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_tx_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_tx_rlast : out STD_LOGIC;
    s00_axi_tx_rvalid : out STD_LOGIC;
    s00_axi_tx_rready : in STD_LOGIC;
    s01_axi_rx_aclk : in STD_LOGIC;
    s01_axi_rx_aresetn : in STD_LOGIC;
    s01_axi_rx_awaddr : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s01_axi_rx_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s01_axi_rx_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s01_axi_rx_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s01_axi_rx_awlock : in STD_LOGIC;
    s01_axi_rx_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s01_axi_rx_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s01_axi_rx_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s01_axi_rx_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s01_axi_rx_awuser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s01_axi_rx_awvalid : in STD_LOGIC;
    s01_axi_rx_awready : out STD_LOGIC;
    s01_axi_rx_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s01_axi_rx_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s01_axi_rx_wlast : in STD_LOGIC;
    s01_axi_rx_wvalid : in STD_LOGIC;
    s01_axi_rx_wready : out STD_LOGIC;
    s01_axi_rx_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s01_axi_rx_bvalid : out STD_LOGIC;
    s01_axi_rx_bready : in STD_LOGIC;
    s01_axi_rx_araddr : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s01_axi_rx_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s01_axi_rx_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s01_axi_rx_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s01_axi_rx_arlock : in STD_LOGIC;
    s01_axi_rx_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s01_axi_rx_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s01_axi_rx_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s01_axi_rx_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s01_axi_rx_aruser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s01_axi_rx_arvalid : in STD_LOGIC;
    s01_axi_rx_arready : out STD_LOGIC;
    s01_axi_rx_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s01_axi_rx_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s01_axi_rx_rlast : out STD_LOGIC;
    s01_axi_rx_rvalid : out STD_LOGIC;
    s01_axi_rx_rready : in STD_LOGIC;
    s02_axi_reg_aclk : in STD_LOGIC;
    s02_axi_reg_aresetn : in STD_LOGIC;
    s02_axi_reg_awaddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s02_axi_reg_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s02_axi_reg_awvalid : in STD_LOGIC;
    s02_axi_reg_awready : out STD_LOGIC;
    s02_axi_reg_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s02_axi_reg_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s02_axi_reg_wvalid : in STD_LOGIC;
    s02_axi_reg_wready : out STD_LOGIC;
    s02_axi_reg_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s02_axi_reg_bvalid : out STD_LOGIC;
    s02_axi_reg_bready : in STD_LOGIC;
    s02_axi_reg_araddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s02_axi_reg_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s02_axi_reg_arvalid : in STD_LOGIC;
    s02_axi_reg_arready : out STD_LOGIC;
    s02_axi_reg_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s02_axi_reg_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s02_axi_reg_rvalid : out STD_LOGIC;
    s02_axi_reg_rready : in STD_LOGIC
  );
  end component main_design_AXI_SpaceWire_IP_0_1;
  component main_design_axi_bram_ctrl_0_1 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    bram_rst_a : out STD_LOGIC;
    bram_clk_a : out STD_LOGIC;
    bram_en_a : out STD_LOGIC;
    bram_we_a : out STD_LOGIC_VECTOR ( 3 downto 0 );
    bram_addr_a : out STD_LOGIC_VECTOR ( 12 downto 0 );
    bram_wrdata_a : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_rddata_a : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component main_design_axi_bram_ctrl_0_1;
  component main_design_axis_data_fifo_0_1 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component main_design_axis_data_fifo_0_1;
  component main_design_router_implementation_0_1 is
  port (
    clk : in STD_LOGIC;
    rxclk : in STD_LOGIC;
    txclk : in STD_LOGIC;
    rst : in STD_LOGIC;
    rx : in STD_LOGIC;
    tx : out STD_LOGIC;
    spw_di_0 : in STD_LOGIC;
    spw_si_0 : in STD_LOGIC;
    spw_do_0 : out STD_LOGIC;
    spw_so_0 : out STD_LOGIC;
    spw_di_1 : in STD_LOGIC;
    spw_si_1 : in STD_LOGIC;
    spw_do_1 : out STD_LOGIC;
    spw_so_1 : out STD_LOGIC;
    spw_di_2 : in STD_LOGIC;
    spw_si_2 : in STD_LOGIC;
    spw_do_2 : out STD_LOGIC;
    spw_so_2 : out STD_LOGIC;
    spw_di_3 : in STD_LOGIC;
    spw_si_3 : in STD_LOGIC;
    spw_do_3 : out STD_LOGIC;
    spw_so_3 : out STD_LOGIC;
    spw_di_4 : in STD_LOGIC;
    spw_si_4 : in STD_LOGIC;
    spw_do_4 : out STD_LOGIC;
    spw_so_4 : out STD_LOGIC;
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ena : in STD_LOGIC;
    rsta : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component main_design_router_implementation_0_1;
  signal AXI_SpaceWire_IP_0_error_intr : STD_LOGIC;
  signal AXI_SpaceWire_IP_0_packet_intr : STD_LOGIC;
  signal AXI_SpaceWire_IP_0_spw_do : STD_LOGIC;
  signal AXI_SpaceWire_IP_0_spw_so : STD_LOGIC;
  signal AXI_SpaceWire_IP_0_state_intr : STD_LOGIC;
  signal AXI_SpaceWire_IP_0_tc_out_intr : STD_LOGIC;
  signal CLK_IN1_D_0_1_CLK_N : STD_LOGIC;
  signal CLK_IN1_D_0_1_CLK_P : STD_LOGIC;
  signal axi_bram_ctrl_0_bram_addr_a : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal axi_bram_ctrl_0_bram_clk_a : STD_LOGIC;
  signal axi_bram_ctrl_0_bram_en_a : STD_LOGIC;
  signal axi_bram_ctrl_0_bram_rst_a : STD_LOGIC;
  signal axi_bram_ctrl_0_bram_we_a : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_bram_ctrl_0_bram_wrdata_a : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_gpio_0_gpio_io_o : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_gpio_1_gpio_io_o : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_mcdma_0_M_AXIS_MM2S_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mcdma_0_M_AXIS_MM2S_TDEST : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mcdma_0_M_AXIS_MM2S_TID : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_mcdma_0_M_AXIS_MM2S_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mcdma_0_M_AXIS_MM2S_TLAST : STD_LOGIC;
  signal axi_mcdma_0_M_AXIS_MM2S_TREADY : STD_LOGIC;
  signal axi_mcdma_0_M_AXIS_MM2S_TUSER : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_mcdma_0_M_AXIS_MM2S_TVALID : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_MM2S_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mcdma_0_M_AXI_MM2S_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mcdma_0_M_AXI_MM2S_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mcdma_0_M_AXI_MM2S_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_mcdma_0_M_AXI_MM2S_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mcdma_0_M_AXI_MM2S_ARREADY : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_MM2S_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mcdma_0_M_AXI_MM2S_ARUSER : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mcdma_0_M_AXI_MM2S_ARVALID : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_MM2S_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mcdma_0_M_AXI_MM2S_RLAST : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_MM2S_RREADY : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_MM2S_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mcdma_0_M_AXI_MM2S_RVALID : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_S2MM_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mcdma_0_M_AXI_S2MM_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mcdma_0_M_AXI_S2MM_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mcdma_0_M_AXI_S2MM_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_mcdma_0_M_AXI_S2MM_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mcdma_0_M_AXI_S2MM_AWREADY : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_S2MM_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mcdma_0_M_AXI_S2MM_AWUSER : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mcdma_0_M_AXI_S2MM_AWVALID : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_S2MM_BREADY : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_S2MM_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mcdma_0_M_AXI_S2MM_BVALID : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_S2MM_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mcdma_0_M_AXI_S2MM_WLAST : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_S2MM_WREADY : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_S2MM_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mcdma_0_M_AXI_S2MM_WVALID : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_SG_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mcdma_0_M_AXI_SG_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mcdma_0_M_AXI_SG_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mcdma_0_M_AXI_SG_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_mcdma_0_M_AXI_SG_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mcdma_0_M_AXI_SG_ARREADY : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_SG_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mcdma_0_M_AXI_SG_ARUSER : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mcdma_0_M_AXI_SG_ARVALID : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_SG_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mcdma_0_M_AXI_SG_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mcdma_0_M_AXI_SG_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mcdma_0_M_AXI_SG_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_mcdma_0_M_AXI_SG_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mcdma_0_M_AXI_SG_AWREADY : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_SG_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mcdma_0_M_AXI_SG_AWUSER : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mcdma_0_M_AXI_SG_AWVALID : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_SG_BREADY : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_SG_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mcdma_0_M_AXI_SG_BVALID : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_SG_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mcdma_0_M_AXI_SG_RLAST : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_SG_RREADY : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_SG_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mcdma_0_M_AXI_SG_RVALID : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_SG_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mcdma_0_M_AXI_SG_WLAST : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_SG_WREADY : STD_LOGIC;
  signal axi_mcdma_0_M_AXI_SG_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mcdma_0_M_AXI_SG_WVALID : STD_LOGIC;
  signal axi_mcdma_0_mm2s_ch1_introut : STD_LOGIC;
  signal axi_mcdma_0_s2mm_ch1_introut : STD_LOGIC;
  signal axis_data_fifo_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axis_data_fifo_0_M_AXIS_TDEST : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axis_data_fifo_0_M_AXIS_TID : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_data_fifo_0_M_AXIS_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axis_data_fifo_0_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_0_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_0_M_AXIS_TUSER : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_data_fifo_0_M_AXIS_TVALID : STD_LOGIC;
  signal clk_wiz_0_clk_100 : STD_LOGIC;
  signal clk_wiz_0_clk_200 : STD_LOGIC;
  signal proc_sys_reset_0_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_CAN_0_RX : STD_LOGIC;
  signal processing_system7_0_CAN_0_TX : STD_LOGIC;
  signal processing_system7_0_DDR_ADDR : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal processing_system7_0_DDR_BA : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_DDR_CAS_N : STD_LOGIC;
  signal processing_system7_0_DDR_CKE : STD_LOGIC;
  signal processing_system7_0_DDR_CK_N : STD_LOGIC;
  signal processing_system7_0_DDR_CK_P : STD_LOGIC;
  signal processing_system7_0_DDR_CS_N : STD_LOGIC;
  signal processing_system7_0_DDR_DM : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_DQ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_DDR_DQS_N : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_DQS_P : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_ODT : STD_LOGIC;
  signal processing_system7_0_DDR_RAS_N : STD_LOGIC;
  signal processing_system7_0_DDR_RESET_N : STD_LOGIC;
  signal processing_system7_0_DDR_WE_N : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK0 : STD_LOGIC;
  signal processing_system7_0_FCLK_RESET0_N : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_DDR_VRN : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_DDR_VRP : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_MIO : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal processing_system7_0_FIXED_IO_PS_CLK : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_PS_PORB : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_PS_SRSTB : STD_LOGIC;
  signal processing_system7_0_IIC_0_SCL_I : STD_LOGIC;
  signal processing_system7_0_IIC_0_SCL_O : STD_LOGIC;
  signal processing_system7_0_IIC_0_SCL_T : STD_LOGIC;
  signal processing_system7_0_IIC_0_SDA_I : STD_LOGIC;
  signal processing_system7_0_IIC_0_SDA_O : STD_LOGIC;
  signal processing_system7_0_IIC_0_SDA_T : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_BREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_BVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RLAST : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WLAST : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WVALID : STD_LOGIC;
  signal processing_system7_0_SPI_0_IO0_I : STD_LOGIC;
  signal processing_system7_0_SPI_0_IO0_O : STD_LOGIC;
  signal processing_system7_0_SPI_0_IO0_T : STD_LOGIC;
  signal processing_system7_0_SPI_0_IO1_I : STD_LOGIC;
  signal processing_system7_0_SPI_0_IO1_O : STD_LOGIC;
  signal processing_system7_0_SPI_0_IO1_T : STD_LOGIC;
  signal processing_system7_0_SPI_0_SCK_I : STD_LOGIC;
  signal processing_system7_0_SPI_0_SCK_O : STD_LOGIC;
  signal processing_system7_0_SPI_0_SCK_T : STD_LOGIC;
  signal processing_system7_0_SPI_0_SS1_O : STD_LOGIC;
  signal processing_system7_0_SPI_0_SS2_O : STD_LOGIC;
  signal processing_system7_0_SPI_0_SS_I : STD_LOGIC;
  signal processing_system7_0_SPI_0_SS_O : STD_LOGIC;
  signal processing_system7_0_SPI_0_SS_T : STD_LOGIC;
  signal processing_system7_0_UART_0_RxD : STD_LOGIC;
  signal processing_system7_0_UART_0_TxD : STD_LOGIC;
  signal reset_1 : STD_LOGIC;
  signal router_implementation_0_douta : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal router_implementation_0_spw_do_0 : STD_LOGIC;
  signal router_implementation_0_spw_do_1 : STD_LOGIC;
  signal router_implementation_0_spw_do_2 : STD_LOGIC;
  signal router_implementation_0_spw_do_3 : STD_LOGIC;
  signal router_implementation_0_spw_do_4 : STD_LOGIC;
  signal router_implementation_0_spw_so_0 : STD_LOGIC;
  signal router_implementation_0_spw_so_1 : STD_LOGIC;
  signal router_implementation_0_spw_so_2 : STD_LOGIC;
  signal router_implementation_0_spw_so_3 : STD_LOGIC;
  signal router_implementation_0_spw_so_4 : STD_LOGIC;
  signal router_implementation_0_tx : STD_LOGIC;
  signal rst_0_1 : STD_LOGIC;
  signal rx_0_1 : STD_LOGIC;
  signal smartconnect_1_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_1_M00_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M00_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M00_AXI_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M00_AXI_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M00_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M00_AXI_ARREADY : STD_LOGIC;
  signal smartconnect_1_M00_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M00_AXI_ARVALID : STD_LOGIC;
  signal smartconnect_1_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_1_M00_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M00_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M00_AXI_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M00_AXI_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M00_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M00_AXI_AWREADY : STD_LOGIC;
  signal smartconnect_1_M00_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M00_AXI_AWVALID : STD_LOGIC;
  signal smartconnect_1_M00_AXI_BREADY : STD_LOGIC;
  signal smartconnect_1_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M00_AXI_BVALID : STD_LOGIC;
  signal smartconnect_1_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_1_M00_AXI_RLAST : STD_LOGIC;
  signal smartconnect_1_M00_AXI_RREADY : STD_LOGIC;
  signal smartconnect_1_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M00_AXI_RVALID : STD_LOGIC;
  signal smartconnect_1_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_1_M00_AXI_WLAST : STD_LOGIC;
  signal smartconnect_1_M00_AXI_WREADY : STD_LOGIC;
  signal smartconnect_1_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M00_AXI_WVALID : STD_LOGIC;
  signal smartconnect_1_M01_AXI_ARADDR : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal smartconnect_1_M01_AXI_ARREADY : STD_LOGIC;
  signal smartconnect_1_M01_AXI_ARVALID : STD_LOGIC;
  signal smartconnect_1_M01_AXI_AWADDR : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal smartconnect_1_M01_AXI_AWREADY : STD_LOGIC;
  signal smartconnect_1_M01_AXI_AWVALID : STD_LOGIC;
  signal smartconnect_1_M01_AXI_BREADY : STD_LOGIC;
  signal smartconnect_1_M01_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M01_AXI_BVALID : STD_LOGIC;
  signal smartconnect_1_M01_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_1_M01_AXI_RREADY : STD_LOGIC;
  signal smartconnect_1_M01_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M01_AXI_RVALID : STD_LOGIC;
  signal smartconnect_1_M01_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_1_M01_AXI_WREADY : STD_LOGIC;
  signal smartconnect_1_M01_AXI_WVALID : STD_LOGIC;
  signal smartconnect_1_M02_AXI_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal smartconnect_1_M02_AXI_ARREADY : STD_LOGIC;
  signal smartconnect_1_M02_AXI_ARVALID : STD_LOGIC;
  signal smartconnect_1_M02_AXI_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal smartconnect_1_M02_AXI_AWREADY : STD_LOGIC;
  signal smartconnect_1_M02_AXI_AWVALID : STD_LOGIC;
  signal smartconnect_1_M02_AXI_BREADY : STD_LOGIC;
  signal smartconnect_1_M02_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M02_AXI_BVALID : STD_LOGIC;
  signal smartconnect_1_M02_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_1_M02_AXI_RREADY : STD_LOGIC;
  signal smartconnect_1_M02_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M02_AXI_RVALID : STD_LOGIC;
  signal smartconnect_1_M02_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_1_M02_AXI_WREADY : STD_LOGIC;
  signal smartconnect_1_M02_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M02_AXI_WVALID : STD_LOGIC;
  signal smartconnect_1_M03_AXI_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal smartconnect_1_M03_AXI_ARREADY : STD_LOGIC;
  signal smartconnect_1_M03_AXI_ARVALID : STD_LOGIC;
  signal smartconnect_1_M03_AXI_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal smartconnect_1_M03_AXI_AWREADY : STD_LOGIC;
  signal smartconnect_1_M03_AXI_AWVALID : STD_LOGIC;
  signal smartconnect_1_M03_AXI_BREADY : STD_LOGIC;
  signal smartconnect_1_M03_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M03_AXI_BVALID : STD_LOGIC;
  signal smartconnect_1_M03_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_1_M03_AXI_RREADY : STD_LOGIC;
  signal smartconnect_1_M03_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M03_AXI_RVALID : STD_LOGIC;
  signal smartconnect_1_M03_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_1_M03_AXI_WREADY : STD_LOGIC;
  signal smartconnect_1_M03_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M03_AXI_WVALID : STD_LOGIC;
  signal smartconnect_1_M04_AXI_ARADDR : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M04_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M04_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M04_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal smartconnect_1_M04_AXI_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal smartconnect_1_M04_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M04_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M04_AXI_ARREADY : STD_LOGIC;
  signal smartconnect_1_M04_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M04_AXI_ARUSER : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M04_AXI_ARVALID : STD_LOGIC;
  signal smartconnect_1_M04_AXI_AWADDR : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M04_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M04_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M04_AXI_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal smartconnect_1_M04_AXI_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal smartconnect_1_M04_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M04_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M04_AXI_AWREADY : STD_LOGIC;
  signal smartconnect_1_M04_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M04_AXI_AWUSER : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M04_AXI_AWVALID : STD_LOGIC;
  signal smartconnect_1_M04_AXI_BREADY : STD_LOGIC;
  signal smartconnect_1_M04_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M04_AXI_BVALID : STD_LOGIC;
  signal smartconnect_1_M04_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_1_M04_AXI_RLAST : STD_LOGIC;
  signal smartconnect_1_M04_AXI_RREADY : STD_LOGIC;
  signal smartconnect_1_M04_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M04_AXI_RVALID : STD_LOGIC;
  signal smartconnect_1_M04_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_1_M04_AXI_WLAST : STD_LOGIC;
  signal smartconnect_1_M04_AXI_WREADY : STD_LOGIC;
  signal smartconnect_1_M04_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M04_AXI_WVALID : STD_LOGIC;
  signal smartconnect_1_M05_AXI_ARADDR : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M05_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M05_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M05_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal smartconnect_1_M05_AXI_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal smartconnect_1_M05_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M05_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M05_AXI_ARREADY : STD_LOGIC;
  signal smartconnect_1_M05_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M05_AXI_ARUSER : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M05_AXI_ARVALID : STD_LOGIC;
  signal smartconnect_1_M05_AXI_AWADDR : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M05_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M05_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M05_AXI_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal smartconnect_1_M05_AXI_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal smartconnect_1_M05_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M05_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M05_AXI_AWREADY : STD_LOGIC;
  signal smartconnect_1_M05_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M05_AXI_AWUSER : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M05_AXI_AWVALID : STD_LOGIC;
  signal smartconnect_1_M05_AXI_BREADY : STD_LOGIC;
  signal smartconnect_1_M05_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M05_AXI_BVALID : STD_LOGIC;
  signal smartconnect_1_M05_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_1_M05_AXI_RLAST : STD_LOGIC;
  signal smartconnect_1_M05_AXI_RREADY : STD_LOGIC;
  signal smartconnect_1_M05_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M05_AXI_RVALID : STD_LOGIC;
  signal smartconnect_1_M05_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_1_M05_AXI_WLAST : STD_LOGIC;
  signal smartconnect_1_M05_AXI_WREADY : STD_LOGIC;
  signal smartconnect_1_M05_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M05_AXI_WVALID : STD_LOGIC;
  signal smartconnect_1_M06_AXI_ARADDR : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal smartconnect_1_M06_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M06_AXI_ARREADY : STD_LOGIC;
  signal smartconnect_1_M06_AXI_ARVALID : STD_LOGIC;
  signal smartconnect_1_M06_AXI_AWADDR : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal smartconnect_1_M06_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M06_AXI_AWREADY : STD_LOGIC;
  signal smartconnect_1_M06_AXI_AWVALID : STD_LOGIC;
  signal smartconnect_1_M06_AXI_BREADY : STD_LOGIC;
  signal smartconnect_1_M06_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M06_AXI_BVALID : STD_LOGIC;
  signal smartconnect_1_M06_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_1_M06_AXI_RREADY : STD_LOGIC;
  signal smartconnect_1_M06_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M06_AXI_RVALID : STD_LOGIC;
  signal smartconnect_1_M06_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_1_M06_AXI_WREADY : STD_LOGIC;
  signal smartconnect_1_M06_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M06_AXI_WVALID : STD_LOGIC;
  signal smartconnect_1_M07_AXI_ARADDR : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal smartconnect_1_M07_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M07_AXI_ARREADY : STD_LOGIC;
  signal smartconnect_1_M07_AXI_ARVALID : STD_LOGIC;
  signal smartconnect_1_M07_AXI_AWADDR : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal smartconnect_1_M07_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M07_AXI_AWREADY : STD_LOGIC;
  signal smartconnect_1_M07_AXI_AWVALID : STD_LOGIC;
  signal smartconnect_1_M07_AXI_BREADY : STD_LOGIC;
  signal smartconnect_1_M07_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M07_AXI_BVALID : STD_LOGIC;
  signal smartconnect_1_M07_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_1_M07_AXI_RREADY : STD_LOGIC;
  signal smartconnect_1_M07_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M07_AXI_RVALID : STD_LOGIC;
  signal smartconnect_1_M07_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_1_M07_AXI_WREADY : STD_LOGIC;
  signal smartconnect_1_M07_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M07_AXI_WVALID : STD_LOGIC;
  signal spw_di_1_0_1 : STD_LOGIC;
  signal spw_di_2_0_1 : STD_LOGIC;
  signal spw_di_3_0_1 : STD_LOGIC;
  signal spw_di_4_0_1 : STD_LOGIC;
  signal spw_si_1_0_1 : STD_LOGIC;
  signal spw_si_2_0_1 : STD_LOGIC;
  signal spw_si_3_0_1 : STD_LOGIC;
  signal spw_si_4_0_1 : STD_LOGIC;
  signal util_reduced_logic_0_Res : STD_LOGIC;
  signal xlconcat_0_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xlconcat_1_dout : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_axi_mcdma_0_mm2s_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_mcdma_0_s2mm_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_clk_wiz_0_locked_UNCONNECTED : STD_LOGIC;
  signal NLW_proc_sys_reset_0_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_proc_sys_reset_0_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_0_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_0_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_processing_system7_0_TTC0_WAVE0_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_TTC0_WAVE1_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_TTC0_WAVE2_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_USB0_VBUS_PWRSELECT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_S_AXI_HP0_BID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_WACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_WCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_processing_system7_0_USB0_PORT_INDCTL_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_smartconnect_0_M00_AXI_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_smartconnect_0_M00_AXI_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_smartconnect_0_M01_AXI_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_smartconnect_0_M01_AXI_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_smartconnect_0_M01_AXI_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_smartconnect_0_M02_AXI_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_smartconnect_0_M02_AXI_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_smartconnect_0_M03_AXI_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_smartconnect_0_M03_AXI_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of CAN_0_rx : signal is "xilinx.com:interface:can:1.0 CAN_0 RX";
  attribute X_INTERFACE_INFO of CAN_0_tx : signal is "xilinx.com:interface:can:1.0 CAN_0 TX";
  attribute X_INTERFACE_INFO of CLK_IN1_D_0_clk_n : signal is "xilinx.com:interface:diff_clock:1.0 CLK_IN1_D_0 CLK_N";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of CLK_IN1_D_0_clk_n : signal is "XIL_INTERFACENAME CLK_IN1_D_0, CAN_DEBUG false, FREQ_HZ 100000000";
  attribute X_INTERFACE_INFO of CLK_IN1_D_0_clk_p : signal is "xilinx.com:interface:diff_clock:1.0 CLK_IN1_D_0 CLK_P";
  attribute X_INTERFACE_INFO of DDR_cas_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CAS_N";
  attribute X_INTERFACE_INFO of DDR_ck_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CK_N";
  attribute X_INTERFACE_INFO of DDR_ck_p : signal is "xilinx.com:interface:ddrx:1.0 DDR CK_P";
  attribute X_INTERFACE_INFO of DDR_cke : signal is "xilinx.com:interface:ddrx:1.0 DDR CKE";
  attribute X_INTERFACE_INFO of DDR_cs_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CS_N";
  attribute X_INTERFACE_INFO of DDR_odt : signal is "xilinx.com:interface:ddrx:1.0 DDR ODT";
  attribute X_INTERFACE_INFO of DDR_ras_n : signal is "xilinx.com:interface:ddrx:1.0 DDR RAS_N";
  attribute X_INTERFACE_INFO of DDR_reset_n : signal is "xilinx.com:interface:ddrx:1.0 DDR RESET_N";
  attribute X_INTERFACE_INFO of DDR_we_n : signal is "xilinx.com:interface:ddrx:1.0 DDR WE_N";
  attribute X_INTERFACE_INFO of FIXED_IO_ddr_vrn : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN";
  attribute X_INTERFACE_PARAMETER of FIXED_IO_ddr_vrn : signal is "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false";
  attribute X_INTERFACE_INFO of FIXED_IO_ddr_vrp : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP";
  attribute X_INTERFACE_INFO of FIXED_IO_ps_clk : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK";
  attribute X_INTERFACE_INFO of FIXED_IO_ps_porb : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB";
  attribute X_INTERFACE_INFO of FIXED_IO_ps_srstb : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB";
  attribute X_INTERFACE_INFO of IIC_0_scl_i : signal is "xilinx.com:interface:iic:1.0 IIC_0 SCL_I";
  attribute X_INTERFACE_INFO of IIC_0_scl_o : signal is "xilinx.com:interface:iic:1.0 IIC_0 SCL_O";
  attribute X_INTERFACE_INFO of IIC_0_scl_t : signal is "xilinx.com:interface:iic:1.0 IIC_0 SCL_T";
  attribute X_INTERFACE_INFO of IIC_0_sda_i : signal is "xilinx.com:interface:iic:1.0 IIC_0 SDA_I";
  attribute X_INTERFACE_INFO of IIC_0_sda_o : signal is "xilinx.com:interface:iic:1.0 IIC_0 SDA_O";
  attribute X_INTERFACE_INFO of IIC_0_sda_t : signal is "xilinx.com:interface:iic:1.0 IIC_0 SDA_T";
  attribute X_INTERFACE_INFO of SPI_0_io0_i : signal is "xilinx.com:interface:spi:1.0 SPI_0 IO0_I";
  attribute X_INTERFACE_INFO of SPI_0_io0_o : signal is "xilinx.com:interface:spi:1.0 SPI_0 IO0_O";
  attribute X_INTERFACE_INFO of SPI_0_io0_t : signal is "xilinx.com:interface:spi:1.0 SPI_0 IO0_T";
  attribute X_INTERFACE_INFO of SPI_0_io1_i : signal is "xilinx.com:interface:spi:1.0 SPI_0 IO1_I";
  attribute X_INTERFACE_INFO of SPI_0_io1_o : signal is "xilinx.com:interface:spi:1.0 SPI_0 IO1_O";
  attribute X_INTERFACE_INFO of SPI_0_io1_t : signal is "xilinx.com:interface:spi:1.0 SPI_0 IO1_T";
  attribute X_INTERFACE_INFO of SPI_0_sck_i : signal is "xilinx.com:interface:spi:1.0 SPI_0 SCK_I";
  attribute X_INTERFACE_INFO of SPI_0_sck_o : signal is "xilinx.com:interface:spi:1.0 SPI_0 SCK_O";
  attribute X_INTERFACE_INFO of SPI_0_sck_t : signal is "xilinx.com:interface:spi:1.0 SPI_0 SCK_T";
  attribute X_INTERFACE_INFO of SPI_0_ss1_o : signal is "xilinx.com:interface:spi:1.0 SPI_0 SS1_O";
  attribute X_INTERFACE_INFO of SPI_0_ss2_o : signal is "xilinx.com:interface:spi:1.0 SPI_0 SS2_O";
  attribute X_INTERFACE_INFO of SPI_0_ss_i : signal is "xilinx.com:interface:spi:1.0 SPI_0 SS_I";
  attribute X_INTERFACE_INFO of SPI_0_ss_o : signal is "xilinx.com:interface:spi:1.0 SPI_0 SS_O";
  attribute X_INTERFACE_INFO of SPI_0_ss_t : signal is "xilinx.com:interface:spi:1.0 SPI_0 SS_T";
  attribute X_INTERFACE_INFO of UART_0_rxd : signal is "xilinx.com:interface:uart:1.0 UART_0 RxD";
  attribute X_INTERFACE_INFO of UART_0_txd : signal is "xilinx.com:interface:uart:1.0 UART_0 TxD";
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 RST.RESET RST";
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_HIGH";
  attribute X_INTERFACE_INFO of rst_logic : signal is "xilinx.com:signal:reset:1.0 RST.RST_LOGIC RST";
  attribute X_INTERFACE_PARAMETER of rst_logic : signal is "XIL_INTERFACENAME RST.RST_LOGIC, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of DDR_addr : signal is "xilinx.com:interface:ddrx:1.0 DDR ADDR";
  attribute X_INTERFACE_PARAMETER of DDR_addr : signal is "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250";
  attribute X_INTERFACE_INFO of DDR_ba : signal is "xilinx.com:interface:ddrx:1.0 DDR BA";
  attribute X_INTERFACE_INFO of DDR_dm : signal is "xilinx.com:interface:ddrx:1.0 DDR DM";
  attribute X_INTERFACE_INFO of DDR_dq : signal is "xilinx.com:interface:ddrx:1.0 DDR DQ";
  attribute X_INTERFACE_INFO of DDR_dqs_n : signal is "xilinx.com:interface:ddrx:1.0 DDR DQS_N";
  attribute X_INTERFACE_INFO of DDR_dqs_p : signal is "xilinx.com:interface:ddrx:1.0 DDR DQS_P";
  attribute X_INTERFACE_INFO of FIXED_IO_mio : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO";
begin
  CAN_0_tx <= processing_system7_0_CAN_0_TX;
  CLK_IN1_D_0_1_CLK_N <= CLK_IN1_D_0_clk_n;
  CLK_IN1_D_0_1_CLK_P <= CLK_IN1_D_0_clk_p;
  IIC_0_scl_o <= processing_system7_0_IIC_0_SCL_O;
  IIC_0_scl_t <= processing_system7_0_IIC_0_SCL_T;
  IIC_0_sda_o <= processing_system7_0_IIC_0_SDA_O;
  IIC_0_sda_t <= processing_system7_0_IIC_0_SDA_T;
  SPI_0_io0_o <= processing_system7_0_SPI_0_IO0_O;
  SPI_0_io0_t <= processing_system7_0_SPI_0_IO0_T;
  SPI_0_io1_o <= processing_system7_0_SPI_0_IO1_O;
  SPI_0_io1_t <= processing_system7_0_SPI_0_IO1_T;
  SPI_0_sck_o <= processing_system7_0_SPI_0_SCK_O;
  SPI_0_sck_t <= processing_system7_0_SPI_0_SCK_T;
  SPI_0_ss1_o <= processing_system7_0_SPI_0_SS1_O;
  SPI_0_ss2_o <= processing_system7_0_SPI_0_SS2_O;
  SPI_0_ss_o <= processing_system7_0_SPI_0_SS_O;
  SPI_0_ss_t <= processing_system7_0_SPI_0_SS_T;
  UART_0_txd <= processing_system7_0_UART_0_TxD;
  processing_system7_0_CAN_0_RX <= CAN_0_rx;
  processing_system7_0_IIC_0_SCL_I <= IIC_0_scl_i;
  processing_system7_0_IIC_0_SDA_I <= IIC_0_sda_i;
  processing_system7_0_SPI_0_IO0_I <= SPI_0_io0_i;
  processing_system7_0_SPI_0_IO1_I <= SPI_0_io1_i;
  processing_system7_0_SPI_0_SCK_I <= SPI_0_sck_i;
  processing_system7_0_SPI_0_SS_I <= SPI_0_ss_i;
  processing_system7_0_UART_0_RxD <= UART_0_rxd;
  reset_1 <= reset;
  rst_0_1 <= rst_logic;
  rx_0_1 <= rx;
  spw_di_1_0_1 <= spw_di_1;
  spw_di_2_0_1 <= spw_di_2;
  spw_di_3_0_1 <= spw_di_3;
  spw_di_4_0_1 <= spw_di_4;
  spw_do_1 <= router_implementation_0_spw_do_1;
  spw_do_2 <= router_implementation_0_spw_do_2;
  spw_do_3 <= router_implementation_0_spw_do_3;
  spw_do_4 <= router_implementation_0_spw_do_4;
  spw_si_1_0_1 <= spw_si_1;
  spw_si_2_0_1 <= spw_si_2;
  spw_si_3_0_1 <= spw_si_3;
  spw_si_4_0_1 <= spw_si_4;
  spw_so_1 <= router_implementation_0_spw_so_1;
  spw_so_2 <= router_implementation_0_spw_so_2;
  spw_so_3 <= router_implementation_0_spw_so_3;
  spw_so_4 <= router_implementation_0_spw_so_4;
  tx <= router_implementation_0_tx;
AXI_SpaceWire_IP_0: component main_design_AXI_SpaceWire_IP_0_1
     port map (
      clk_logic => clk_wiz_0_clk_100,
      error_intr => AXI_SpaceWire_IP_0_error_intr,
      packet_intr => AXI_SpaceWire_IP_0_packet_intr,
      rst_logic => util_reduced_logic_0_Res,
      rxclk => clk_wiz_0_clk_200,
      s00_axi_tx_aclk => processing_system7_0_FCLK_CLK0,
      s00_axi_tx_araddr(2 downto 0) => smartconnect_1_M04_AXI_ARADDR(2 downto 0),
      s00_axi_tx_arburst(1 downto 0) => smartconnect_1_M04_AXI_ARBURST(1 downto 0),
      s00_axi_tx_arcache(3 downto 0) => smartconnect_1_M04_AXI_ARCACHE(3 downto 0),
      s00_axi_tx_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s00_axi_tx_arlen(7 downto 0) => smartconnect_1_M04_AXI_ARLEN(7 downto 0),
      s00_axi_tx_arlock => smartconnect_1_M04_AXI_ARLOCK(0),
      s00_axi_tx_arprot(2 downto 0) => smartconnect_1_M04_AXI_ARPROT(2 downto 0),
      s00_axi_tx_arqos(3 downto 0) => smartconnect_1_M04_AXI_ARQOS(3 downto 0),
      s00_axi_tx_arready => smartconnect_1_M04_AXI_ARREADY,
      s00_axi_tx_arregion(3 downto 0) => B"0000",
      s00_axi_tx_arsize(2 downto 0) => smartconnect_1_M04_AXI_ARSIZE(2 downto 0),
      s00_axi_tx_aruser(3 downto 0) => smartconnect_1_M04_AXI_ARUSER(3 downto 0),
      s00_axi_tx_arvalid => smartconnect_1_M04_AXI_ARVALID,
      s00_axi_tx_awaddr(2 downto 0) => smartconnect_1_M04_AXI_AWADDR(2 downto 0),
      s00_axi_tx_awburst(1 downto 0) => smartconnect_1_M04_AXI_AWBURST(1 downto 0),
      s00_axi_tx_awcache(3 downto 0) => smartconnect_1_M04_AXI_AWCACHE(3 downto 0),
      s00_axi_tx_awlen(7 downto 0) => smartconnect_1_M04_AXI_AWLEN(7 downto 0),
      s00_axi_tx_awlock => smartconnect_1_M04_AXI_AWLOCK(0),
      s00_axi_tx_awprot(2 downto 0) => smartconnect_1_M04_AXI_AWPROT(2 downto 0),
      s00_axi_tx_awqos(3 downto 0) => smartconnect_1_M04_AXI_AWQOS(3 downto 0),
      s00_axi_tx_awready => smartconnect_1_M04_AXI_AWREADY,
      s00_axi_tx_awregion(3 downto 0) => B"0000",
      s00_axi_tx_awsize(2 downto 0) => smartconnect_1_M04_AXI_AWSIZE(2 downto 0),
      s00_axi_tx_awuser(3 downto 0) => smartconnect_1_M04_AXI_AWUSER(3 downto 0),
      s00_axi_tx_awvalid => smartconnect_1_M04_AXI_AWVALID,
      s00_axi_tx_bready => smartconnect_1_M04_AXI_BREADY,
      s00_axi_tx_bresp(1 downto 0) => smartconnect_1_M04_AXI_BRESP(1 downto 0),
      s00_axi_tx_bvalid => smartconnect_1_M04_AXI_BVALID,
      s00_axi_tx_rdata(31 downto 0) => smartconnect_1_M04_AXI_RDATA(31 downto 0),
      s00_axi_tx_rlast => smartconnect_1_M04_AXI_RLAST,
      s00_axi_tx_rready => smartconnect_1_M04_AXI_RREADY,
      s00_axi_tx_rresp(1 downto 0) => smartconnect_1_M04_AXI_RRESP(1 downto 0),
      s00_axi_tx_rvalid => smartconnect_1_M04_AXI_RVALID,
      s00_axi_tx_wdata(31 downto 0) => smartconnect_1_M04_AXI_WDATA(31 downto 0),
      s00_axi_tx_wlast => smartconnect_1_M04_AXI_WLAST,
      s00_axi_tx_wready => smartconnect_1_M04_AXI_WREADY,
      s00_axi_tx_wstrb(3 downto 0) => smartconnect_1_M04_AXI_WSTRB(3 downto 0),
      s00_axi_tx_wvalid => smartconnect_1_M04_AXI_WVALID,
      s01_axi_rx_aclk => processing_system7_0_FCLK_CLK0,
      s01_axi_rx_araddr(2 downto 0) => smartconnect_1_M05_AXI_ARADDR(2 downto 0),
      s01_axi_rx_arburst(1 downto 0) => smartconnect_1_M05_AXI_ARBURST(1 downto 0),
      s01_axi_rx_arcache(3 downto 0) => smartconnect_1_M05_AXI_ARCACHE(3 downto 0),
      s01_axi_rx_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s01_axi_rx_arlen(7 downto 0) => smartconnect_1_M05_AXI_ARLEN(7 downto 0),
      s01_axi_rx_arlock => smartconnect_1_M05_AXI_ARLOCK(0),
      s01_axi_rx_arprot(2 downto 0) => smartconnect_1_M05_AXI_ARPROT(2 downto 0),
      s01_axi_rx_arqos(3 downto 0) => smartconnect_1_M05_AXI_ARQOS(3 downto 0),
      s01_axi_rx_arready => smartconnect_1_M05_AXI_ARREADY,
      s01_axi_rx_arregion(3 downto 0) => B"0000",
      s01_axi_rx_arsize(2 downto 0) => smartconnect_1_M05_AXI_ARSIZE(2 downto 0),
      s01_axi_rx_aruser(3 downto 0) => smartconnect_1_M05_AXI_ARUSER(3 downto 0),
      s01_axi_rx_arvalid => smartconnect_1_M05_AXI_ARVALID,
      s01_axi_rx_awaddr(2 downto 0) => smartconnect_1_M05_AXI_AWADDR(2 downto 0),
      s01_axi_rx_awburst(1 downto 0) => smartconnect_1_M05_AXI_AWBURST(1 downto 0),
      s01_axi_rx_awcache(3 downto 0) => smartconnect_1_M05_AXI_AWCACHE(3 downto 0),
      s01_axi_rx_awlen(7 downto 0) => smartconnect_1_M05_AXI_AWLEN(7 downto 0),
      s01_axi_rx_awlock => smartconnect_1_M05_AXI_AWLOCK(0),
      s01_axi_rx_awprot(2 downto 0) => smartconnect_1_M05_AXI_AWPROT(2 downto 0),
      s01_axi_rx_awqos(3 downto 0) => smartconnect_1_M05_AXI_AWQOS(3 downto 0),
      s01_axi_rx_awready => smartconnect_1_M05_AXI_AWREADY,
      s01_axi_rx_awregion(3 downto 0) => B"0000",
      s01_axi_rx_awsize(2 downto 0) => smartconnect_1_M05_AXI_AWSIZE(2 downto 0),
      s01_axi_rx_awuser(3 downto 0) => smartconnect_1_M05_AXI_AWUSER(3 downto 0),
      s01_axi_rx_awvalid => smartconnect_1_M05_AXI_AWVALID,
      s01_axi_rx_bready => smartconnect_1_M05_AXI_BREADY,
      s01_axi_rx_bresp(1 downto 0) => smartconnect_1_M05_AXI_BRESP(1 downto 0),
      s01_axi_rx_bvalid => smartconnect_1_M05_AXI_BVALID,
      s01_axi_rx_rdata(31 downto 0) => smartconnect_1_M05_AXI_RDATA(31 downto 0),
      s01_axi_rx_rlast => smartconnect_1_M05_AXI_RLAST,
      s01_axi_rx_rready => smartconnect_1_M05_AXI_RREADY,
      s01_axi_rx_rresp(1 downto 0) => smartconnect_1_M05_AXI_RRESP(1 downto 0),
      s01_axi_rx_rvalid => smartconnect_1_M05_AXI_RVALID,
      s01_axi_rx_wdata(31 downto 0) => smartconnect_1_M05_AXI_WDATA(31 downto 0),
      s01_axi_rx_wlast => smartconnect_1_M05_AXI_WLAST,
      s01_axi_rx_wready => smartconnect_1_M05_AXI_WREADY,
      s01_axi_rx_wstrb(3 downto 0) => smartconnect_1_M05_AXI_WSTRB(3 downto 0),
      s01_axi_rx_wvalid => smartconnect_1_M05_AXI_WVALID,
      s02_axi_reg_aclk => processing_system7_0_FCLK_CLK0,
      s02_axi_reg_araddr(4 downto 0) => smartconnect_1_M06_AXI_ARADDR(4 downto 0),
      s02_axi_reg_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s02_axi_reg_arprot(2 downto 0) => smartconnect_1_M06_AXI_ARPROT(2 downto 0),
      s02_axi_reg_arready => smartconnect_1_M06_AXI_ARREADY,
      s02_axi_reg_arvalid => smartconnect_1_M06_AXI_ARVALID,
      s02_axi_reg_awaddr(4 downto 0) => smartconnect_1_M06_AXI_AWADDR(4 downto 0),
      s02_axi_reg_awprot(2 downto 0) => smartconnect_1_M06_AXI_AWPROT(2 downto 0),
      s02_axi_reg_awready => smartconnect_1_M06_AXI_AWREADY,
      s02_axi_reg_awvalid => smartconnect_1_M06_AXI_AWVALID,
      s02_axi_reg_bready => smartconnect_1_M06_AXI_BREADY,
      s02_axi_reg_bresp(1 downto 0) => smartconnect_1_M06_AXI_BRESP(1 downto 0),
      s02_axi_reg_bvalid => smartconnect_1_M06_AXI_BVALID,
      s02_axi_reg_rdata(31 downto 0) => smartconnect_1_M06_AXI_RDATA(31 downto 0),
      s02_axi_reg_rready => smartconnect_1_M06_AXI_RREADY,
      s02_axi_reg_rresp(1 downto 0) => smartconnect_1_M06_AXI_RRESP(1 downto 0),
      s02_axi_reg_rvalid => smartconnect_1_M06_AXI_RVALID,
      s02_axi_reg_wdata(31 downto 0) => smartconnect_1_M06_AXI_WDATA(31 downto 0),
      s02_axi_reg_wready => smartconnect_1_M06_AXI_WREADY,
      s02_axi_reg_wstrb(3 downto 0) => smartconnect_1_M06_AXI_WSTRB(3 downto 0),
      s02_axi_reg_wvalid => smartconnect_1_M06_AXI_WVALID,
      spw_di => router_implementation_0_spw_do_0,
      spw_do => AXI_SpaceWire_IP_0_spw_do,
      spw_si => router_implementation_0_spw_so_0,
      spw_so => AXI_SpaceWire_IP_0_spw_so,
      state_intr => AXI_SpaceWire_IP_0_state_intr,
      tc_in => axi_gpio_1_gpio_io_o(0),
      tc_out_intr => AXI_SpaceWire_IP_0_tc_out_intr,
      txclk => clk_wiz_0_clk_200
    );
axi_bram_ctrl_0: component main_design_axi_bram_ctrl_0_1
     port map (
      bram_addr_a(12 downto 0) => axi_bram_ctrl_0_bram_addr_a(12 downto 0),
      bram_clk_a => axi_bram_ctrl_0_bram_clk_a,
      bram_en_a => axi_bram_ctrl_0_bram_en_a,
      bram_rddata_a(31 downto 0) => router_implementation_0_douta(31 downto 0),
      bram_rst_a => axi_bram_ctrl_0_bram_rst_a,
      bram_we_a(3 downto 0) => axi_bram_ctrl_0_bram_we_a(3 downto 0),
      bram_wrdata_a(31 downto 0) => axi_bram_ctrl_0_bram_wrdata_a(31 downto 0),
      s_axi_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_araddr(12 downto 0) => smartconnect_1_M07_AXI_ARADDR(12 downto 0),
      s_axi_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s_axi_arprot(2 downto 0) => smartconnect_1_M07_AXI_ARPROT(2 downto 0),
      s_axi_arready => smartconnect_1_M07_AXI_ARREADY,
      s_axi_arvalid => smartconnect_1_M07_AXI_ARVALID,
      s_axi_awaddr(12 downto 0) => smartconnect_1_M07_AXI_AWADDR(12 downto 0),
      s_axi_awprot(2 downto 0) => smartconnect_1_M07_AXI_AWPROT(2 downto 0),
      s_axi_awready => smartconnect_1_M07_AXI_AWREADY,
      s_axi_awvalid => smartconnect_1_M07_AXI_AWVALID,
      s_axi_bready => smartconnect_1_M07_AXI_BREADY,
      s_axi_bresp(1 downto 0) => smartconnect_1_M07_AXI_BRESP(1 downto 0),
      s_axi_bvalid => smartconnect_1_M07_AXI_BVALID,
      s_axi_rdata(31 downto 0) => smartconnect_1_M07_AXI_RDATA(31 downto 0),
      s_axi_rready => smartconnect_1_M07_AXI_RREADY,
      s_axi_rresp(1 downto 0) => smartconnect_1_M07_AXI_RRESP(1 downto 0),
      s_axi_rvalid => smartconnect_1_M07_AXI_RVALID,
      s_axi_wdata(31 downto 0) => smartconnect_1_M07_AXI_WDATA(31 downto 0),
      s_axi_wready => smartconnect_1_M07_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => smartconnect_1_M07_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => smartconnect_1_M07_AXI_WVALID
    );
axi_gpio_0: component main_design_axi_gpio_0_1
     port map (
      gpio_io_o(0) => axi_gpio_0_gpio_io_o(0),
      s_axi_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_araddr(8 downto 0) => smartconnect_1_M02_AXI_ARADDR(8 downto 0),
      s_axi_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s_axi_arready => smartconnect_1_M02_AXI_ARREADY,
      s_axi_arvalid => smartconnect_1_M02_AXI_ARVALID,
      s_axi_awaddr(8 downto 0) => smartconnect_1_M02_AXI_AWADDR(8 downto 0),
      s_axi_awready => smartconnect_1_M02_AXI_AWREADY,
      s_axi_awvalid => smartconnect_1_M02_AXI_AWVALID,
      s_axi_bready => smartconnect_1_M02_AXI_BREADY,
      s_axi_bresp(1 downto 0) => smartconnect_1_M02_AXI_BRESP(1 downto 0),
      s_axi_bvalid => smartconnect_1_M02_AXI_BVALID,
      s_axi_rdata(31 downto 0) => smartconnect_1_M02_AXI_RDATA(31 downto 0),
      s_axi_rready => smartconnect_1_M02_AXI_RREADY,
      s_axi_rresp(1 downto 0) => smartconnect_1_M02_AXI_RRESP(1 downto 0),
      s_axi_rvalid => smartconnect_1_M02_AXI_RVALID,
      s_axi_wdata(31 downto 0) => smartconnect_1_M02_AXI_WDATA(31 downto 0),
      s_axi_wready => smartconnect_1_M02_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => smartconnect_1_M02_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => smartconnect_1_M02_AXI_WVALID
    );
axi_gpio_1: component main_design_axi_gpio_1_1
     port map (
      gpio_io_o(0) => axi_gpio_1_gpio_io_o(0),
      s_axi_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_araddr(8 downto 0) => smartconnect_1_M03_AXI_ARADDR(8 downto 0),
      s_axi_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s_axi_arready => smartconnect_1_M03_AXI_ARREADY,
      s_axi_arvalid => smartconnect_1_M03_AXI_ARVALID,
      s_axi_awaddr(8 downto 0) => smartconnect_1_M03_AXI_AWADDR(8 downto 0),
      s_axi_awready => smartconnect_1_M03_AXI_AWREADY,
      s_axi_awvalid => smartconnect_1_M03_AXI_AWVALID,
      s_axi_bready => smartconnect_1_M03_AXI_BREADY,
      s_axi_bresp(1 downto 0) => smartconnect_1_M03_AXI_BRESP(1 downto 0),
      s_axi_bvalid => smartconnect_1_M03_AXI_BVALID,
      s_axi_rdata(31 downto 0) => smartconnect_1_M03_AXI_RDATA(31 downto 0),
      s_axi_rready => smartconnect_1_M03_AXI_RREADY,
      s_axi_rresp(1 downto 0) => smartconnect_1_M03_AXI_RRESP(1 downto 0),
      s_axi_rvalid => smartconnect_1_M03_AXI_RVALID,
      s_axi_wdata(31 downto 0) => smartconnect_1_M03_AXI_WDATA(31 downto 0),
      s_axi_wready => smartconnect_1_M03_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => smartconnect_1_M03_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => smartconnect_1_M03_AXI_WVALID
    );
axi_mcdma_0: component main_design_axi_mcdma_0_1
     port map (
      axi_resetn => proc_sys_reset_0_peripheral_aresetn(0),
      m_axi_mm2s_araddr(31 downto 0) => axi_mcdma_0_M_AXI_MM2S_ARADDR(31 downto 0),
      m_axi_mm2s_arburst(1 downto 0) => axi_mcdma_0_M_AXI_MM2S_ARBURST(1 downto 0),
      m_axi_mm2s_arcache(3 downto 0) => axi_mcdma_0_M_AXI_MM2S_ARCACHE(3 downto 0),
      m_axi_mm2s_arlen(7 downto 0) => axi_mcdma_0_M_AXI_MM2S_ARLEN(7 downto 0),
      m_axi_mm2s_arprot(2 downto 0) => axi_mcdma_0_M_AXI_MM2S_ARPROT(2 downto 0),
      m_axi_mm2s_arready => axi_mcdma_0_M_AXI_MM2S_ARREADY,
      m_axi_mm2s_arsize(2 downto 0) => axi_mcdma_0_M_AXI_MM2S_ARSIZE(2 downto 0),
      m_axi_mm2s_aruser(3 downto 0) => axi_mcdma_0_M_AXI_MM2S_ARUSER(3 downto 0),
      m_axi_mm2s_arvalid => axi_mcdma_0_M_AXI_MM2S_ARVALID,
      m_axi_mm2s_rdata(31 downto 0) => axi_mcdma_0_M_AXI_MM2S_RDATA(31 downto 0),
      m_axi_mm2s_rlast => axi_mcdma_0_M_AXI_MM2S_RLAST,
      m_axi_mm2s_rready => axi_mcdma_0_M_AXI_MM2S_RREADY,
      m_axi_mm2s_rresp(1 downto 0) => axi_mcdma_0_M_AXI_MM2S_RRESP(1 downto 0),
      m_axi_mm2s_rvalid => axi_mcdma_0_M_AXI_MM2S_RVALID,
      m_axi_s2mm_awaddr(31 downto 0) => axi_mcdma_0_M_AXI_S2MM_AWADDR(31 downto 0),
      m_axi_s2mm_awburst(1 downto 0) => axi_mcdma_0_M_AXI_S2MM_AWBURST(1 downto 0),
      m_axi_s2mm_awcache(3 downto 0) => axi_mcdma_0_M_AXI_S2MM_AWCACHE(3 downto 0),
      m_axi_s2mm_awlen(7 downto 0) => axi_mcdma_0_M_AXI_S2MM_AWLEN(7 downto 0),
      m_axi_s2mm_awprot(2 downto 0) => axi_mcdma_0_M_AXI_S2MM_AWPROT(2 downto 0),
      m_axi_s2mm_awready => axi_mcdma_0_M_AXI_S2MM_AWREADY,
      m_axi_s2mm_awsize(2 downto 0) => axi_mcdma_0_M_AXI_S2MM_AWSIZE(2 downto 0),
      m_axi_s2mm_awuser(3 downto 0) => axi_mcdma_0_M_AXI_S2MM_AWUSER(3 downto 0),
      m_axi_s2mm_awvalid => axi_mcdma_0_M_AXI_S2MM_AWVALID,
      m_axi_s2mm_bready => axi_mcdma_0_M_AXI_S2MM_BREADY,
      m_axi_s2mm_bresp(1 downto 0) => axi_mcdma_0_M_AXI_S2MM_BRESP(1 downto 0),
      m_axi_s2mm_bvalid => axi_mcdma_0_M_AXI_S2MM_BVALID,
      m_axi_s2mm_wdata(31 downto 0) => axi_mcdma_0_M_AXI_S2MM_WDATA(31 downto 0),
      m_axi_s2mm_wlast => axi_mcdma_0_M_AXI_S2MM_WLAST,
      m_axi_s2mm_wready => axi_mcdma_0_M_AXI_S2MM_WREADY,
      m_axi_s2mm_wstrb(3 downto 0) => axi_mcdma_0_M_AXI_S2MM_WSTRB(3 downto 0),
      m_axi_s2mm_wvalid => axi_mcdma_0_M_AXI_S2MM_WVALID,
      m_axi_sg_araddr(31 downto 0) => axi_mcdma_0_M_AXI_SG_ARADDR(31 downto 0),
      m_axi_sg_arburst(1 downto 0) => axi_mcdma_0_M_AXI_SG_ARBURST(1 downto 0),
      m_axi_sg_arcache(3 downto 0) => axi_mcdma_0_M_AXI_SG_ARCACHE(3 downto 0),
      m_axi_sg_arlen(7 downto 0) => axi_mcdma_0_M_AXI_SG_ARLEN(7 downto 0),
      m_axi_sg_arprot(2 downto 0) => axi_mcdma_0_M_AXI_SG_ARPROT(2 downto 0),
      m_axi_sg_arready => axi_mcdma_0_M_AXI_SG_ARREADY,
      m_axi_sg_arsize(2 downto 0) => axi_mcdma_0_M_AXI_SG_ARSIZE(2 downto 0),
      m_axi_sg_aruser(3 downto 0) => axi_mcdma_0_M_AXI_SG_ARUSER(3 downto 0),
      m_axi_sg_arvalid => axi_mcdma_0_M_AXI_SG_ARVALID,
      m_axi_sg_awaddr(31 downto 0) => axi_mcdma_0_M_AXI_SG_AWADDR(31 downto 0),
      m_axi_sg_awburst(1 downto 0) => axi_mcdma_0_M_AXI_SG_AWBURST(1 downto 0),
      m_axi_sg_awcache(3 downto 0) => axi_mcdma_0_M_AXI_SG_AWCACHE(3 downto 0),
      m_axi_sg_awlen(7 downto 0) => axi_mcdma_0_M_AXI_SG_AWLEN(7 downto 0),
      m_axi_sg_awprot(2 downto 0) => axi_mcdma_0_M_AXI_SG_AWPROT(2 downto 0),
      m_axi_sg_awready => axi_mcdma_0_M_AXI_SG_AWREADY,
      m_axi_sg_awsize(2 downto 0) => axi_mcdma_0_M_AXI_SG_AWSIZE(2 downto 0),
      m_axi_sg_awuser(3 downto 0) => axi_mcdma_0_M_AXI_SG_AWUSER(3 downto 0),
      m_axi_sg_awvalid => axi_mcdma_0_M_AXI_SG_AWVALID,
      m_axi_sg_bready => axi_mcdma_0_M_AXI_SG_BREADY,
      m_axi_sg_bresp(1 downto 0) => axi_mcdma_0_M_AXI_SG_BRESP(1 downto 0),
      m_axi_sg_bvalid => axi_mcdma_0_M_AXI_SG_BVALID,
      m_axi_sg_rdata(31 downto 0) => axi_mcdma_0_M_AXI_SG_RDATA(31 downto 0),
      m_axi_sg_rlast => axi_mcdma_0_M_AXI_SG_RLAST,
      m_axi_sg_rready => axi_mcdma_0_M_AXI_SG_RREADY,
      m_axi_sg_rresp(1 downto 0) => axi_mcdma_0_M_AXI_SG_RRESP(1 downto 0),
      m_axi_sg_rvalid => axi_mcdma_0_M_AXI_SG_RVALID,
      m_axi_sg_wdata(31 downto 0) => axi_mcdma_0_M_AXI_SG_WDATA(31 downto 0),
      m_axi_sg_wlast => axi_mcdma_0_M_AXI_SG_WLAST,
      m_axi_sg_wready => axi_mcdma_0_M_AXI_SG_WREADY,
      m_axi_sg_wstrb(3 downto 0) => axi_mcdma_0_M_AXI_SG_WSTRB(3 downto 0),
      m_axi_sg_wvalid => axi_mcdma_0_M_AXI_SG_WVALID,
      m_axis_mm2s_tdata(31 downto 0) => axi_mcdma_0_M_AXIS_MM2S_TDATA(31 downto 0),
      m_axis_mm2s_tdest(3 downto 0) => axi_mcdma_0_M_AXIS_MM2S_TDEST(3 downto 0),
      m_axis_mm2s_tid(7 downto 0) => axi_mcdma_0_M_AXIS_MM2S_TID(7 downto 0),
      m_axis_mm2s_tkeep(3 downto 0) => axi_mcdma_0_M_AXIS_MM2S_TKEEP(3 downto 0),
      m_axis_mm2s_tlast => axi_mcdma_0_M_AXIS_MM2S_TLAST,
      m_axis_mm2s_tready => axi_mcdma_0_M_AXIS_MM2S_TREADY,
      m_axis_mm2s_tuser(15 downto 0) => axi_mcdma_0_M_AXIS_MM2S_TUSER(15 downto 0),
      m_axis_mm2s_tvalid => axi_mcdma_0_M_AXIS_MM2S_TVALID,
      mm2s_ch1_introut => axi_mcdma_0_mm2s_ch1_introut,
      mm2s_prmry_reset_out_n => NLW_axi_mcdma_0_mm2s_prmry_reset_out_n_UNCONNECTED,
      s2mm_ch1_introut => axi_mcdma_0_s2mm_ch1_introut,
      s2mm_prmry_reset_out_n => NLW_axi_mcdma_0_s2mm_prmry_reset_out_n_UNCONNECTED,
      s_axi_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_lite_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_lite_araddr(11 downto 0) => smartconnect_1_M01_AXI_ARADDR(11 downto 0),
      s_axi_lite_arready => smartconnect_1_M01_AXI_ARREADY,
      s_axi_lite_arvalid => smartconnect_1_M01_AXI_ARVALID,
      s_axi_lite_awaddr(11 downto 0) => smartconnect_1_M01_AXI_AWADDR(11 downto 0),
      s_axi_lite_awready => smartconnect_1_M01_AXI_AWREADY,
      s_axi_lite_awvalid => smartconnect_1_M01_AXI_AWVALID,
      s_axi_lite_bready => smartconnect_1_M01_AXI_BREADY,
      s_axi_lite_bresp(1 downto 0) => smartconnect_1_M01_AXI_BRESP(1 downto 0),
      s_axi_lite_bvalid => smartconnect_1_M01_AXI_BVALID,
      s_axi_lite_rdata(31 downto 0) => smartconnect_1_M01_AXI_RDATA(31 downto 0),
      s_axi_lite_rready => smartconnect_1_M01_AXI_RREADY,
      s_axi_lite_rresp(1 downto 0) => smartconnect_1_M01_AXI_RRESP(1 downto 0),
      s_axi_lite_rvalid => smartconnect_1_M01_AXI_RVALID,
      s_axi_lite_wdata(31 downto 0) => smartconnect_1_M01_AXI_WDATA(31 downto 0),
      s_axi_lite_wready => smartconnect_1_M01_AXI_WREADY,
      s_axi_lite_wvalid => smartconnect_1_M01_AXI_WVALID,
      s_axis_s2mm_tdata(31 downto 0) => axis_data_fifo_0_M_AXIS_TDATA(31 downto 0),
      s_axis_s2mm_tdest(3 downto 0) => axis_data_fifo_0_M_AXIS_TDEST(3 downto 0),
      s_axis_s2mm_tid(7 downto 0) => axis_data_fifo_0_M_AXIS_TID(7 downto 0),
      s_axis_s2mm_tkeep(3 downto 0) => axis_data_fifo_0_M_AXIS_TKEEP(3 downto 0),
      s_axis_s2mm_tlast => axis_data_fifo_0_M_AXIS_TLAST,
      s_axis_s2mm_tready => axis_data_fifo_0_M_AXIS_TREADY,
      s_axis_s2mm_tuser(15 downto 0) => axis_data_fifo_0_M_AXIS_TUSER(15 downto 0),
      s_axis_s2mm_tvalid => axis_data_fifo_0_M_AXIS_TVALID
    );
axis_data_fifo_0: component main_design_axis_data_fifo_0_1
     port map (
      m_axis_tdata(31 downto 0) => axis_data_fifo_0_M_AXIS_TDATA(31 downto 0),
      m_axis_tdest(3 downto 0) => axis_data_fifo_0_M_AXIS_TDEST(3 downto 0),
      m_axis_tid(7 downto 0) => axis_data_fifo_0_M_AXIS_TID(7 downto 0),
      m_axis_tkeep(3 downto 0) => axis_data_fifo_0_M_AXIS_TKEEP(3 downto 0),
      m_axis_tlast => axis_data_fifo_0_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_0_M_AXIS_TREADY,
      m_axis_tuser(15 downto 0) => axis_data_fifo_0_M_AXIS_TUSER(15 downto 0),
      m_axis_tvalid => axis_data_fifo_0_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s_axis_tdata(31 downto 0) => axi_mcdma_0_M_AXIS_MM2S_TDATA(31 downto 0),
      s_axis_tdest(3 downto 0) => axi_mcdma_0_M_AXIS_MM2S_TDEST(3 downto 0),
      s_axis_tid(7 downto 0) => axi_mcdma_0_M_AXIS_MM2S_TID(7 downto 0),
      s_axis_tkeep(3 downto 0) => axi_mcdma_0_M_AXIS_MM2S_TKEEP(3 downto 0),
      s_axis_tlast => axi_mcdma_0_M_AXIS_MM2S_TLAST,
      s_axis_tready => axi_mcdma_0_M_AXIS_MM2S_TREADY,
      s_axis_tuser(15 downto 0) => axi_mcdma_0_M_AXIS_MM2S_TUSER(15 downto 0),
      s_axis_tvalid => axi_mcdma_0_M_AXIS_MM2S_TVALID
    );
clk_wiz_0: component main_design_clk_wiz_0_1
     port map (
      clk_100 => clk_wiz_0_clk_100,
      clk_200 => clk_wiz_0_clk_200,
      clk_in1_n => CLK_IN1_D_0_1_CLK_N,
      clk_in1_p => CLK_IN1_D_0_1_CLK_P,
      locked => NLW_clk_wiz_0_locked_UNCONNECTED,
      reset => reset_1
    );
proc_sys_reset_0: component main_design_proc_sys_reset_0_1
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_proc_sys_reset_0_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => processing_system7_0_FCLK_RESET0_N,
      interconnect_aresetn(0) => NLW_proc_sys_reset_0_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_proc_sys_reset_0_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => proc_sys_reset_0_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_proc_sys_reset_0_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => processing_system7_0_FCLK_CLK0
    );
processing_system7_0: component main_design_processing_system7_0_2
     port map (
      CAN0_PHY_RX => processing_system7_0_CAN_0_RX,
      CAN0_PHY_TX => processing_system7_0_CAN_0_TX,
      DDR_Addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_BankAddr(2 downto 0) => DDR_ba(2 downto 0),
      DDR_CAS_n => DDR_cas_n,
      DDR_CKE => DDR_cke,
      DDR_CS_n => DDR_cs_n,
      DDR_Clk => DDR_ck_p,
      DDR_Clk_n => DDR_ck_n,
      DDR_DM(3 downto 0) => DDR_dm(3 downto 0),
      DDR_DQ(31 downto 0) => DDR_dq(31 downto 0),
      DDR_DQS(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_DQS_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_DRSTB => DDR_reset_n,
      DDR_ODT => DDR_odt,
      DDR_RAS_n => DDR_ras_n,
      DDR_VRN => FIXED_IO_ddr_vrn,
      DDR_VRP => FIXED_IO_ddr_vrp,
      DDR_WEB => DDR_we_n,
      FCLK_CLK0 => processing_system7_0_FCLK_CLK0,
      FCLK_RESET0_N => processing_system7_0_FCLK_RESET0_N,
      I2C0_SCL_I => processing_system7_0_IIC_0_SCL_I,
      I2C0_SCL_O => processing_system7_0_IIC_0_SCL_O,
      I2C0_SCL_T => processing_system7_0_IIC_0_SCL_T,
      I2C0_SDA_I => processing_system7_0_IIC_0_SDA_I,
      I2C0_SDA_O => processing_system7_0_IIC_0_SDA_O,
      I2C0_SDA_T => processing_system7_0_IIC_0_SDA_T,
      IRQ_F2P(7 downto 0) => xlconcat_1_dout(7 downto 0),
      MIO(53 downto 0) => FIXED_IO_mio(53 downto 0),
      M_AXI_GP0_ACLK => processing_system7_0_FCLK_CLK0,
      M_AXI_GP0_ARADDR(31 downto 0) => processing_system7_0_M_AXI_GP0_ARADDR(31 downto 0),
      M_AXI_GP0_ARBURST(1 downto 0) => processing_system7_0_M_AXI_GP0_ARBURST(1 downto 0),
      M_AXI_GP0_ARCACHE(3 downto 0) => processing_system7_0_M_AXI_GP0_ARCACHE(3 downto 0),
      M_AXI_GP0_ARID(11 downto 0) => processing_system7_0_M_AXI_GP0_ARID(11 downto 0),
      M_AXI_GP0_ARLEN(3 downto 0) => processing_system7_0_M_AXI_GP0_ARLEN(3 downto 0),
      M_AXI_GP0_ARLOCK(1 downto 0) => processing_system7_0_M_AXI_GP0_ARLOCK(1 downto 0),
      M_AXI_GP0_ARPROT(2 downto 0) => processing_system7_0_M_AXI_GP0_ARPROT(2 downto 0),
      M_AXI_GP0_ARQOS(3 downto 0) => processing_system7_0_M_AXI_GP0_ARQOS(3 downto 0),
      M_AXI_GP0_ARREADY => processing_system7_0_M_AXI_GP0_ARREADY,
      M_AXI_GP0_ARSIZE(2 downto 0) => processing_system7_0_M_AXI_GP0_ARSIZE(2 downto 0),
      M_AXI_GP0_ARVALID => processing_system7_0_M_AXI_GP0_ARVALID,
      M_AXI_GP0_AWADDR(31 downto 0) => processing_system7_0_M_AXI_GP0_AWADDR(31 downto 0),
      M_AXI_GP0_AWBURST(1 downto 0) => processing_system7_0_M_AXI_GP0_AWBURST(1 downto 0),
      M_AXI_GP0_AWCACHE(3 downto 0) => processing_system7_0_M_AXI_GP0_AWCACHE(3 downto 0),
      M_AXI_GP0_AWID(11 downto 0) => processing_system7_0_M_AXI_GP0_AWID(11 downto 0),
      M_AXI_GP0_AWLEN(3 downto 0) => processing_system7_0_M_AXI_GP0_AWLEN(3 downto 0),
      M_AXI_GP0_AWLOCK(1 downto 0) => processing_system7_0_M_AXI_GP0_AWLOCK(1 downto 0),
      M_AXI_GP0_AWPROT(2 downto 0) => processing_system7_0_M_AXI_GP0_AWPROT(2 downto 0),
      M_AXI_GP0_AWQOS(3 downto 0) => processing_system7_0_M_AXI_GP0_AWQOS(3 downto 0),
      M_AXI_GP0_AWREADY => processing_system7_0_M_AXI_GP0_AWREADY,
      M_AXI_GP0_AWSIZE(2 downto 0) => processing_system7_0_M_AXI_GP0_AWSIZE(2 downto 0),
      M_AXI_GP0_AWVALID => processing_system7_0_M_AXI_GP0_AWVALID,
      M_AXI_GP0_BID(11 downto 0) => processing_system7_0_M_AXI_GP0_BID(11 downto 0),
      M_AXI_GP0_BREADY => processing_system7_0_M_AXI_GP0_BREADY,
      M_AXI_GP0_BRESP(1 downto 0) => processing_system7_0_M_AXI_GP0_BRESP(1 downto 0),
      M_AXI_GP0_BVALID => processing_system7_0_M_AXI_GP0_BVALID,
      M_AXI_GP0_RDATA(31 downto 0) => processing_system7_0_M_AXI_GP0_RDATA(31 downto 0),
      M_AXI_GP0_RID(11 downto 0) => processing_system7_0_M_AXI_GP0_RID(11 downto 0),
      M_AXI_GP0_RLAST => processing_system7_0_M_AXI_GP0_RLAST,
      M_AXI_GP0_RREADY => processing_system7_0_M_AXI_GP0_RREADY,
      M_AXI_GP0_RRESP(1 downto 0) => processing_system7_0_M_AXI_GP0_RRESP(1 downto 0),
      M_AXI_GP0_RVALID => processing_system7_0_M_AXI_GP0_RVALID,
      M_AXI_GP0_WDATA(31 downto 0) => processing_system7_0_M_AXI_GP0_WDATA(31 downto 0),
      M_AXI_GP0_WID(11 downto 0) => processing_system7_0_M_AXI_GP0_WID(11 downto 0),
      M_AXI_GP0_WLAST => processing_system7_0_M_AXI_GP0_WLAST,
      M_AXI_GP0_WREADY => processing_system7_0_M_AXI_GP0_WREADY,
      M_AXI_GP0_WSTRB(3 downto 0) => processing_system7_0_M_AXI_GP0_WSTRB(3 downto 0),
      M_AXI_GP0_WVALID => processing_system7_0_M_AXI_GP0_WVALID,
      PS_CLK => FIXED_IO_ps_clk,
      PS_PORB => FIXED_IO_ps_porb,
      PS_SRSTB => FIXED_IO_ps_srstb,
      SPI0_MISO_I => processing_system7_0_SPI_0_IO1_I,
      SPI0_MISO_O => processing_system7_0_SPI_0_IO1_O,
      SPI0_MISO_T => processing_system7_0_SPI_0_IO1_T,
      SPI0_MOSI_I => processing_system7_0_SPI_0_IO0_I,
      SPI0_MOSI_O => processing_system7_0_SPI_0_IO0_O,
      SPI0_MOSI_T => processing_system7_0_SPI_0_IO0_T,
      SPI0_SCLK_I => processing_system7_0_SPI_0_SCK_I,
      SPI0_SCLK_O => processing_system7_0_SPI_0_SCK_O,
      SPI0_SCLK_T => processing_system7_0_SPI_0_SCK_T,
      SPI0_SS1_O => processing_system7_0_SPI_0_SS1_O,
      SPI0_SS2_O => processing_system7_0_SPI_0_SS2_O,
      SPI0_SS_I => processing_system7_0_SPI_0_SS_I,
      SPI0_SS_O => processing_system7_0_SPI_0_SS_O,
      SPI0_SS_T => processing_system7_0_SPI_0_SS_T,
      S_AXI_HP0_ACLK => processing_system7_0_FCLK_CLK0,
      S_AXI_HP0_ARADDR(31 downto 0) => smartconnect_1_M00_AXI_ARADDR(31 downto 0),
      S_AXI_HP0_ARBURST(1 downto 0) => smartconnect_1_M00_AXI_ARBURST(1 downto 0),
      S_AXI_HP0_ARCACHE(3 downto 0) => smartconnect_1_M00_AXI_ARCACHE(3 downto 0),
      S_AXI_HP0_ARID(5 downto 0) => B"000000",
      S_AXI_HP0_ARLEN(3 downto 0) => smartconnect_1_M00_AXI_ARLEN(3 downto 0),
      S_AXI_HP0_ARLOCK(1 downto 0) => smartconnect_1_M00_AXI_ARLOCK(1 downto 0),
      S_AXI_HP0_ARPROT(2 downto 0) => smartconnect_1_M00_AXI_ARPROT(2 downto 0),
      S_AXI_HP0_ARQOS(3 downto 0) => smartconnect_1_M00_AXI_ARQOS(3 downto 0),
      S_AXI_HP0_ARREADY => smartconnect_1_M00_AXI_ARREADY,
      S_AXI_HP0_ARSIZE(2 downto 0) => smartconnect_1_M00_AXI_ARSIZE(2 downto 0),
      S_AXI_HP0_ARVALID => smartconnect_1_M00_AXI_ARVALID,
      S_AXI_HP0_AWADDR(31 downto 0) => smartconnect_1_M00_AXI_AWADDR(31 downto 0),
      S_AXI_HP0_AWBURST(1 downto 0) => smartconnect_1_M00_AXI_AWBURST(1 downto 0),
      S_AXI_HP0_AWCACHE(3 downto 0) => smartconnect_1_M00_AXI_AWCACHE(3 downto 0),
      S_AXI_HP0_AWID(5 downto 0) => B"000000",
      S_AXI_HP0_AWLEN(3 downto 0) => smartconnect_1_M00_AXI_AWLEN(3 downto 0),
      S_AXI_HP0_AWLOCK(1 downto 0) => smartconnect_1_M00_AXI_AWLOCK(1 downto 0),
      S_AXI_HP0_AWPROT(2 downto 0) => smartconnect_1_M00_AXI_AWPROT(2 downto 0),
      S_AXI_HP0_AWQOS(3 downto 0) => smartconnect_1_M00_AXI_AWQOS(3 downto 0),
      S_AXI_HP0_AWREADY => smartconnect_1_M00_AXI_AWREADY,
      S_AXI_HP0_AWSIZE(2 downto 0) => smartconnect_1_M00_AXI_AWSIZE(2 downto 0),
      S_AXI_HP0_AWVALID => smartconnect_1_M00_AXI_AWVALID,
      S_AXI_HP0_BID(5 downto 0) => NLW_processing_system7_0_S_AXI_HP0_BID_UNCONNECTED(5 downto 0),
      S_AXI_HP0_BREADY => smartconnect_1_M00_AXI_BREADY,
      S_AXI_HP0_BRESP(1 downto 0) => smartconnect_1_M00_AXI_BRESP(1 downto 0),
      S_AXI_HP0_BVALID => smartconnect_1_M00_AXI_BVALID,
      S_AXI_HP0_RACOUNT(2 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RACOUNT_UNCONNECTED(2 downto 0),
      S_AXI_HP0_RCOUNT(7 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP0_RDATA(31 downto 0) => smartconnect_1_M00_AXI_RDATA(31 downto 0),
      S_AXI_HP0_RDISSUECAP1_EN => '0',
      S_AXI_HP0_RID(5 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RID_UNCONNECTED(5 downto 0),
      S_AXI_HP0_RLAST => smartconnect_1_M00_AXI_RLAST,
      S_AXI_HP0_RREADY => smartconnect_1_M00_AXI_RREADY,
      S_AXI_HP0_RRESP(1 downto 0) => smartconnect_1_M00_AXI_RRESP(1 downto 0),
      S_AXI_HP0_RVALID => smartconnect_1_M00_AXI_RVALID,
      S_AXI_HP0_WACOUNT(5 downto 0) => NLW_processing_system7_0_S_AXI_HP0_WACOUNT_UNCONNECTED(5 downto 0),
      S_AXI_HP0_WCOUNT(7 downto 0) => NLW_processing_system7_0_S_AXI_HP0_WCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP0_WDATA(31 downto 0) => smartconnect_1_M00_AXI_WDATA(31 downto 0),
      S_AXI_HP0_WID(5 downto 0) => B"000000",
      S_AXI_HP0_WLAST => smartconnect_1_M00_AXI_WLAST,
      S_AXI_HP0_WREADY => smartconnect_1_M00_AXI_WREADY,
      S_AXI_HP0_WRISSUECAP1_EN => '0',
      S_AXI_HP0_WSTRB(3 downto 0) => smartconnect_1_M00_AXI_WSTRB(3 downto 0),
      S_AXI_HP0_WVALID => smartconnect_1_M00_AXI_WVALID,
      TTC0_WAVE0_OUT => NLW_processing_system7_0_TTC0_WAVE0_OUT_UNCONNECTED,
      TTC0_WAVE1_OUT => NLW_processing_system7_0_TTC0_WAVE1_OUT_UNCONNECTED,
      TTC0_WAVE2_OUT => NLW_processing_system7_0_TTC0_WAVE2_OUT_UNCONNECTED,
      UART0_RX => processing_system7_0_UART_0_RxD,
      UART0_TX => processing_system7_0_UART_0_TxD,
      USB0_PORT_INDCTL(1 downto 0) => NLW_processing_system7_0_USB0_PORT_INDCTL_UNCONNECTED(1 downto 0),
      USB0_VBUS_PWRFAULT => '0',
      USB0_VBUS_PWRSELECT => NLW_processing_system7_0_USB0_VBUS_PWRSELECT_UNCONNECTED
    );
router_implementation_0: component main_design_router_implementation_0_1
     port map (
      addra(31 downto 13) => B"0000000000000000000",
      addra(12 downto 0) => axi_bram_ctrl_0_bram_addr_a(12 downto 0),
      clk => clk_wiz_0_clk_100,
      clka => axi_bram_ctrl_0_bram_clk_a,
      dina(31 downto 0) => axi_bram_ctrl_0_bram_wrdata_a(31 downto 0),
      douta(31 downto 0) => router_implementation_0_douta(31 downto 0),
      ena => axi_bram_ctrl_0_bram_en_a,
      rst => util_reduced_logic_0_Res,
      rsta => axi_bram_ctrl_0_bram_rst_a,
      rx => rx_0_1,
      rxclk => clk_wiz_0_clk_200,
      spw_di_0 => AXI_SpaceWire_IP_0_spw_do,
      spw_di_1 => spw_di_1_0_1,
      spw_di_2 => spw_di_2_0_1,
      spw_di_3 => spw_di_3_0_1,
      spw_di_4 => spw_di_4_0_1,
      spw_do_0 => router_implementation_0_spw_do_0,
      spw_do_1 => router_implementation_0_spw_do_1,
      spw_do_2 => router_implementation_0_spw_do_2,
      spw_do_3 => router_implementation_0_spw_do_3,
      spw_do_4 => router_implementation_0_spw_do_4,
      spw_si_0 => AXI_SpaceWire_IP_0_spw_so,
      spw_si_1 => spw_si_1_0_1,
      spw_si_2 => spw_si_2_0_1,
      spw_si_3 => spw_si_3_0_1,
      spw_si_4 => spw_si_4_0_1,
      spw_so_0 => router_implementation_0_spw_so_0,
      spw_so_1 => router_implementation_0_spw_so_1,
      spw_so_2 => router_implementation_0_spw_so_2,
      spw_so_3 => router_implementation_0_spw_so_3,
      spw_so_4 => router_implementation_0_spw_so_4,
      tx => router_implementation_0_tx,
      txclk => clk_wiz_0_clk_200,
      wea(3 downto 0) => axi_bram_ctrl_0_bram_we_a(3 downto 0)
    );
smartconnect_0: component main_design_smartconnect_1_0
     port map (
      M00_AXI_araddr(31 downto 0) => smartconnect_1_M00_AXI_ARADDR(31 downto 0),
      M00_AXI_arburst(1 downto 0) => smartconnect_1_M00_AXI_ARBURST(1 downto 0),
      M00_AXI_arcache(3 downto 0) => smartconnect_1_M00_AXI_ARCACHE(3 downto 0),
      M00_AXI_arlen(3 downto 0) => smartconnect_1_M00_AXI_ARLEN(3 downto 0),
      M00_AXI_arlock(1 downto 0) => smartconnect_1_M00_AXI_ARLOCK(1 downto 0),
      M00_AXI_arprot(2 downto 0) => smartconnect_1_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arqos(3 downto 0) => smartconnect_1_M00_AXI_ARQOS(3 downto 0),
      M00_AXI_arready => smartconnect_1_M00_AXI_ARREADY,
      M00_AXI_arsize(2 downto 0) => smartconnect_1_M00_AXI_ARSIZE(2 downto 0),
      M00_AXI_aruser(3 downto 0) => NLW_smartconnect_0_M00_AXI_aruser_UNCONNECTED(3 downto 0),
      M00_AXI_arvalid => smartconnect_1_M00_AXI_ARVALID,
      M00_AXI_awaddr(31 downto 0) => smartconnect_1_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awburst(1 downto 0) => smartconnect_1_M00_AXI_AWBURST(1 downto 0),
      M00_AXI_awcache(3 downto 0) => smartconnect_1_M00_AXI_AWCACHE(3 downto 0),
      M00_AXI_awlen(3 downto 0) => smartconnect_1_M00_AXI_AWLEN(3 downto 0),
      M00_AXI_awlock(1 downto 0) => smartconnect_1_M00_AXI_AWLOCK(1 downto 0),
      M00_AXI_awprot(2 downto 0) => smartconnect_1_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awqos(3 downto 0) => smartconnect_1_M00_AXI_AWQOS(3 downto 0),
      M00_AXI_awready => smartconnect_1_M00_AXI_AWREADY,
      M00_AXI_awsize(2 downto 0) => smartconnect_1_M00_AXI_AWSIZE(2 downto 0),
      M00_AXI_awuser(3 downto 0) => NLW_smartconnect_0_M00_AXI_awuser_UNCONNECTED(3 downto 0),
      M00_AXI_awvalid => smartconnect_1_M00_AXI_AWVALID,
      M00_AXI_bready => smartconnect_1_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => smartconnect_1_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => smartconnect_1_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => smartconnect_1_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rlast => smartconnect_1_M00_AXI_RLAST,
      M00_AXI_rready => smartconnect_1_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => smartconnect_1_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => smartconnect_1_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => smartconnect_1_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wlast => smartconnect_1_M00_AXI_WLAST,
      M00_AXI_wready => smartconnect_1_M00_AXI_WREADY,
      M00_AXI_wstrb(3 downto 0) => smartconnect_1_M00_AXI_WSTRB(3 downto 0),
      M00_AXI_wvalid => smartconnect_1_M00_AXI_WVALID,
      M01_AXI_araddr(11 downto 0) => smartconnect_1_M01_AXI_ARADDR(11 downto 0),
      M01_AXI_arprot(2 downto 0) => NLW_smartconnect_0_M01_AXI_arprot_UNCONNECTED(2 downto 0),
      M01_AXI_arready => smartconnect_1_M01_AXI_ARREADY,
      M01_AXI_arvalid => smartconnect_1_M01_AXI_ARVALID,
      M01_AXI_awaddr(11 downto 0) => smartconnect_1_M01_AXI_AWADDR(11 downto 0),
      M01_AXI_awprot(2 downto 0) => NLW_smartconnect_0_M01_AXI_awprot_UNCONNECTED(2 downto 0),
      M01_AXI_awready => smartconnect_1_M01_AXI_AWREADY,
      M01_AXI_awvalid => smartconnect_1_M01_AXI_AWVALID,
      M01_AXI_bready => smartconnect_1_M01_AXI_BREADY,
      M01_AXI_bresp(1 downto 0) => smartconnect_1_M01_AXI_BRESP(1 downto 0),
      M01_AXI_bvalid => smartconnect_1_M01_AXI_BVALID,
      M01_AXI_rdata(31 downto 0) => smartconnect_1_M01_AXI_RDATA(31 downto 0),
      M01_AXI_rready => smartconnect_1_M01_AXI_RREADY,
      M01_AXI_rresp(1 downto 0) => smartconnect_1_M01_AXI_RRESP(1 downto 0),
      M01_AXI_rvalid => smartconnect_1_M01_AXI_RVALID,
      M01_AXI_wdata(31 downto 0) => smartconnect_1_M01_AXI_WDATA(31 downto 0),
      M01_AXI_wready => smartconnect_1_M01_AXI_WREADY,
      M01_AXI_wstrb(3 downto 0) => NLW_smartconnect_0_M01_AXI_wstrb_UNCONNECTED(3 downto 0),
      M01_AXI_wvalid => smartconnect_1_M01_AXI_WVALID,
      M02_AXI_araddr(8 downto 0) => smartconnect_1_M02_AXI_ARADDR(8 downto 0),
      M02_AXI_arprot(2 downto 0) => NLW_smartconnect_0_M02_AXI_arprot_UNCONNECTED(2 downto 0),
      M02_AXI_arready => smartconnect_1_M02_AXI_ARREADY,
      M02_AXI_arvalid => smartconnect_1_M02_AXI_ARVALID,
      M02_AXI_awaddr(8 downto 0) => smartconnect_1_M02_AXI_AWADDR(8 downto 0),
      M02_AXI_awprot(2 downto 0) => NLW_smartconnect_0_M02_AXI_awprot_UNCONNECTED(2 downto 0),
      M02_AXI_awready => smartconnect_1_M02_AXI_AWREADY,
      M02_AXI_awvalid => smartconnect_1_M02_AXI_AWVALID,
      M02_AXI_bready => smartconnect_1_M02_AXI_BREADY,
      M02_AXI_bresp(1 downto 0) => smartconnect_1_M02_AXI_BRESP(1 downto 0),
      M02_AXI_bvalid => smartconnect_1_M02_AXI_BVALID,
      M02_AXI_rdata(31 downto 0) => smartconnect_1_M02_AXI_RDATA(31 downto 0),
      M02_AXI_rready => smartconnect_1_M02_AXI_RREADY,
      M02_AXI_rresp(1 downto 0) => smartconnect_1_M02_AXI_RRESP(1 downto 0),
      M02_AXI_rvalid => smartconnect_1_M02_AXI_RVALID,
      M02_AXI_wdata(31 downto 0) => smartconnect_1_M02_AXI_WDATA(31 downto 0),
      M02_AXI_wready => smartconnect_1_M02_AXI_WREADY,
      M02_AXI_wstrb(3 downto 0) => smartconnect_1_M02_AXI_WSTRB(3 downto 0),
      M02_AXI_wvalid => smartconnect_1_M02_AXI_WVALID,
      M03_AXI_araddr(8 downto 0) => smartconnect_1_M03_AXI_ARADDR(8 downto 0),
      M03_AXI_arprot(2 downto 0) => NLW_smartconnect_0_M03_AXI_arprot_UNCONNECTED(2 downto 0),
      M03_AXI_arready => smartconnect_1_M03_AXI_ARREADY,
      M03_AXI_arvalid => smartconnect_1_M03_AXI_ARVALID,
      M03_AXI_awaddr(8 downto 0) => smartconnect_1_M03_AXI_AWADDR(8 downto 0),
      M03_AXI_awprot(2 downto 0) => NLW_smartconnect_0_M03_AXI_awprot_UNCONNECTED(2 downto 0),
      M03_AXI_awready => smartconnect_1_M03_AXI_AWREADY,
      M03_AXI_awvalid => smartconnect_1_M03_AXI_AWVALID,
      M03_AXI_bready => smartconnect_1_M03_AXI_BREADY,
      M03_AXI_bresp(1 downto 0) => smartconnect_1_M03_AXI_BRESP(1 downto 0),
      M03_AXI_bvalid => smartconnect_1_M03_AXI_BVALID,
      M03_AXI_rdata(31 downto 0) => smartconnect_1_M03_AXI_RDATA(31 downto 0),
      M03_AXI_rready => smartconnect_1_M03_AXI_RREADY,
      M03_AXI_rresp(1 downto 0) => smartconnect_1_M03_AXI_RRESP(1 downto 0),
      M03_AXI_rvalid => smartconnect_1_M03_AXI_RVALID,
      M03_AXI_wdata(31 downto 0) => smartconnect_1_M03_AXI_WDATA(31 downto 0),
      M03_AXI_wready => smartconnect_1_M03_AXI_WREADY,
      M03_AXI_wstrb(3 downto 0) => smartconnect_1_M03_AXI_WSTRB(3 downto 0),
      M03_AXI_wvalid => smartconnect_1_M03_AXI_WVALID,
      M04_AXI_araddr(2 downto 0) => smartconnect_1_M04_AXI_ARADDR(2 downto 0),
      M04_AXI_arburst(1 downto 0) => smartconnect_1_M04_AXI_ARBURST(1 downto 0),
      M04_AXI_arcache(3 downto 0) => smartconnect_1_M04_AXI_ARCACHE(3 downto 0),
      M04_AXI_arlen(7 downto 0) => smartconnect_1_M04_AXI_ARLEN(7 downto 0),
      M04_AXI_arlock(0) => smartconnect_1_M04_AXI_ARLOCK(0),
      M04_AXI_arprot(2 downto 0) => smartconnect_1_M04_AXI_ARPROT(2 downto 0),
      M04_AXI_arqos(3 downto 0) => smartconnect_1_M04_AXI_ARQOS(3 downto 0),
      M04_AXI_arready => smartconnect_1_M04_AXI_ARREADY,
      M04_AXI_arsize(2 downto 0) => smartconnect_1_M04_AXI_ARSIZE(2 downto 0),
      M04_AXI_aruser(3 downto 0) => smartconnect_1_M04_AXI_ARUSER(3 downto 0),
      M04_AXI_arvalid => smartconnect_1_M04_AXI_ARVALID,
      M04_AXI_awaddr(2 downto 0) => smartconnect_1_M04_AXI_AWADDR(2 downto 0),
      M04_AXI_awburst(1 downto 0) => smartconnect_1_M04_AXI_AWBURST(1 downto 0),
      M04_AXI_awcache(3 downto 0) => smartconnect_1_M04_AXI_AWCACHE(3 downto 0),
      M04_AXI_awlen(7 downto 0) => smartconnect_1_M04_AXI_AWLEN(7 downto 0),
      M04_AXI_awlock(0) => smartconnect_1_M04_AXI_AWLOCK(0),
      M04_AXI_awprot(2 downto 0) => smartconnect_1_M04_AXI_AWPROT(2 downto 0),
      M04_AXI_awqos(3 downto 0) => smartconnect_1_M04_AXI_AWQOS(3 downto 0),
      M04_AXI_awready => smartconnect_1_M04_AXI_AWREADY,
      M04_AXI_awsize(2 downto 0) => smartconnect_1_M04_AXI_AWSIZE(2 downto 0),
      M04_AXI_awuser(3 downto 0) => smartconnect_1_M04_AXI_AWUSER(3 downto 0),
      M04_AXI_awvalid => smartconnect_1_M04_AXI_AWVALID,
      M04_AXI_bready => smartconnect_1_M04_AXI_BREADY,
      M04_AXI_bresp(1 downto 0) => smartconnect_1_M04_AXI_BRESP(1 downto 0),
      M04_AXI_bvalid => smartconnect_1_M04_AXI_BVALID,
      M04_AXI_rdata(31 downto 0) => smartconnect_1_M04_AXI_RDATA(31 downto 0),
      M04_AXI_rlast => smartconnect_1_M04_AXI_RLAST,
      M04_AXI_rready => smartconnect_1_M04_AXI_RREADY,
      M04_AXI_rresp(1 downto 0) => smartconnect_1_M04_AXI_RRESP(1 downto 0),
      M04_AXI_rvalid => smartconnect_1_M04_AXI_RVALID,
      M04_AXI_wdata(31 downto 0) => smartconnect_1_M04_AXI_WDATA(31 downto 0),
      M04_AXI_wlast => smartconnect_1_M04_AXI_WLAST,
      M04_AXI_wready => smartconnect_1_M04_AXI_WREADY,
      M04_AXI_wstrb(3 downto 0) => smartconnect_1_M04_AXI_WSTRB(3 downto 0),
      M04_AXI_wvalid => smartconnect_1_M04_AXI_WVALID,
      M05_AXI_araddr(2 downto 0) => smartconnect_1_M05_AXI_ARADDR(2 downto 0),
      M05_AXI_arburst(1 downto 0) => smartconnect_1_M05_AXI_ARBURST(1 downto 0),
      M05_AXI_arcache(3 downto 0) => smartconnect_1_M05_AXI_ARCACHE(3 downto 0),
      M05_AXI_arlen(7 downto 0) => smartconnect_1_M05_AXI_ARLEN(7 downto 0),
      M05_AXI_arlock(0) => smartconnect_1_M05_AXI_ARLOCK(0),
      M05_AXI_arprot(2 downto 0) => smartconnect_1_M05_AXI_ARPROT(2 downto 0),
      M05_AXI_arqos(3 downto 0) => smartconnect_1_M05_AXI_ARQOS(3 downto 0),
      M05_AXI_arready => smartconnect_1_M05_AXI_ARREADY,
      M05_AXI_arsize(2 downto 0) => smartconnect_1_M05_AXI_ARSIZE(2 downto 0),
      M05_AXI_aruser(3 downto 0) => smartconnect_1_M05_AXI_ARUSER(3 downto 0),
      M05_AXI_arvalid => smartconnect_1_M05_AXI_ARVALID,
      M05_AXI_awaddr(2 downto 0) => smartconnect_1_M05_AXI_AWADDR(2 downto 0),
      M05_AXI_awburst(1 downto 0) => smartconnect_1_M05_AXI_AWBURST(1 downto 0),
      M05_AXI_awcache(3 downto 0) => smartconnect_1_M05_AXI_AWCACHE(3 downto 0),
      M05_AXI_awlen(7 downto 0) => smartconnect_1_M05_AXI_AWLEN(7 downto 0),
      M05_AXI_awlock(0) => smartconnect_1_M05_AXI_AWLOCK(0),
      M05_AXI_awprot(2 downto 0) => smartconnect_1_M05_AXI_AWPROT(2 downto 0),
      M05_AXI_awqos(3 downto 0) => smartconnect_1_M05_AXI_AWQOS(3 downto 0),
      M05_AXI_awready => smartconnect_1_M05_AXI_AWREADY,
      M05_AXI_awsize(2 downto 0) => smartconnect_1_M05_AXI_AWSIZE(2 downto 0),
      M05_AXI_awuser(3 downto 0) => smartconnect_1_M05_AXI_AWUSER(3 downto 0),
      M05_AXI_awvalid => smartconnect_1_M05_AXI_AWVALID,
      M05_AXI_bready => smartconnect_1_M05_AXI_BREADY,
      M05_AXI_bresp(1 downto 0) => smartconnect_1_M05_AXI_BRESP(1 downto 0),
      M05_AXI_bvalid => smartconnect_1_M05_AXI_BVALID,
      M05_AXI_rdata(31 downto 0) => smartconnect_1_M05_AXI_RDATA(31 downto 0),
      M05_AXI_rlast => smartconnect_1_M05_AXI_RLAST,
      M05_AXI_rready => smartconnect_1_M05_AXI_RREADY,
      M05_AXI_rresp(1 downto 0) => smartconnect_1_M05_AXI_RRESP(1 downto 0),
      M05_AXI_rvalid => smartconnect_1_M05_AXI_RVALID,
      M05_AXI_wdata(31 downto 0) => smartconnect_1_M05_AXI_WDATA(31 downto 0),
      M05_AXI_wlast => smartconnect_1_M05_AXI_WLAST,
      M05_AXI_wready => smartconnect_1_M05_AXI_WREADY,
      M05_AXI_wstrb(3 downto 0) => smartconnect_1_M05_AXI_WSTRB(3 downto 0),
      M05_AXI_wvalid => smartconnect_1_M05_AXI_WVALID,
      M06_AXI_araddr(4 downto 0) => smartconnect_1_M06_AXI_ARADDR(4 downto 0),
      M06_AXI_arprot(2 downto 0) => smartconnect_1_M06_AXI_ARPROT(2 downto 0),
      M06_AXI_arready => smartconnect_1_M06_AXI_ARREADY,
      M06_AXI_arvalid => smartconnect_1_M06_AXI_ARVALID,
      M06_AXI_awaddr(4 downto 0) => smartconnect_1_M06_AXI_AWADDR(4 downto 0),
      M06_AXI_awprot(2 downto 0) => smartconnect_1_M06_AXI_AWPROT(2 downto 0),
      M06_AXI_awready => smartconnect_1_M06_AXI_AWREADY,
      M06_AXI_awvalid => smartconnect_1_M06_AXI_AWVALID,
      M06_AXI_bready => smartconnect_1_M06_AXI_BREADY,
      M06_AXI_bresp(1 downto 0) => smartconnect_1_M06_AXI_BRESP(1 downto 0),
      M06_AXI_bvalid => smartconnect_1_M06_AXI_BVALID,
      M06_AXI_rdata(31 downto 0) => smartconnect_1_M06_AXI_RDATA(31 downto 0),
      M06_AXI_rready => smartconnect_1_M06_AXI_RREADY,
      M06_AXI_rresp(1 downto 0) => smartconnect_1_M06_AXI_RRESP(1 downto 0),
      M06_AXI_rvalid => smartconnect_1_M06_AXI_RVALID,
      M06_AXI_wdata(31 downto 0) => smartconnect_1_M06_AXI_WDATA(31 downto 0),
      M06_AXI_wready => smartconnect_1_M06_AXI_WREADY,
      M06_AXI_wstrb(3 downto 0) => smartconnect_1_M06_AXI_WSTRB(3 downto 0),
      M06_AXI_wvalid => smartconnect_1_M06_AXI_WVALID,
      M07_AXI_araddr(12 downto 0) => smartconnect_1_M07_AXI_ARADDR(12 downto 0),
      M07_AXI_arprot(2 downto 0) => smartconnect_1_M07_AXI_ARPROT(2 downto 0),
      M07_AXI_arready => smartconnect_1_M07_AXI_ARREADY,
      M07_AXI_arvalid => smartconnect_1_M07_AXI_ARVALID,
      M07_AXI_awaddr(12 downto 0) => smartconnect_1_M07_AXI_AWADDR(12 downto 0),
      M07_AXI_awprot(2 downto 0) => smartconnect_1_M07_AXI_AWPROT(2 downto 0),
      M07_AXI_awready => smartconnect_1_M07_AXI_AWREADY,
      M07_AXI_awvalid => smartconnect_1_M07_AXI_AWVALID,
      M07_AXI_bready => smartconnect_1_M07_AXI_BREADY,
      M07_AXI_bresp(1 downto 0) => smartconnect_1_M07_AXI_BRESP(1 downto 0),
      M07_AXI_bvalid => smartconnect_1_M07_AXI_BVALID,
      M07_AXI_rdata(31 downto 0) => smartconnect_1_M07_AXI_RDATA(31 downto 0),
      M07_AXI_rready => smartconnect_1_M07_AXI_RREADY,
      M07_AXI_rresp(1 downto 0) => smartconnect_1_M07_AXI_RRESP(1 downto 0),
      M07_AXI_rvalid => smartconnect_1_M07_AXI_RVALID,
      M07_AXI_wdata(31 downto 0) => smartconnect_1_M07_AXI_WDATA(31 downto 0),
      M07_AXI_wready => smartconnect_1_M07_AXI_WREADY,
      M07_AXI_wstrb(3 downto 0) => smartconnect_1_M07_AXI_WSTRB(3 downto 0),
      M07_AXI_wvalid => smartconnect_1_M07_AXI_WVALID,
      S00_AXI_araddr(31 downto 0) => processing_system7_0_M_AXI_GP0_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => processing_system7_0_M_AXI_GP0_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => processing_system7_0_M_AXI_GP0_ARCACHE(3 downto 0),
      S00_AXI_arid(11 downto 0) => processing_system7_0_M_AXI_GP0_ARID(11 downto 0),
      S00_AXI_arlen(3 downto 0) => processing_system7_0_M_AXI_GP0_ARLEN(3 downto 0),
      S00_AXI_arlock(1 downto 0) => processing_system7_0_M_AXI_GP0_ARLOCK(1 downto 0),
      S00_AXI_arprot(2 downto 0) => processing_system7_0_M_AXI_GP0_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => processing_system7_0_M_AXI_GP0_ARQOS(3 downto 0),
      S00_AXI_arready => processing_system7_0_M_AXI_GP0_ARREADY,
      S00_AXI_arsize(2 downto 0) => processing_system7_0_M_AXI_GP0_ARSIZE(2 downto 0),
      S00_AXI_arvalid => processing_system7_0_M_AXI_GP0_ARVALID,
      S00_AXI_awaddr(31 downto 0) => processing_system7_0_M_AXI_GP0_AWADDR(31 downto 0),
      S00_AXI_awburst(1 downto 0) => processing_system7_0_M_AXI_GP0_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => processing_system7_0_M_AXI_GP0_AWCACHE(3 downto 0),
      S00_AXI_awid(11 downto 0) => processing_system7_0_M_AXI_GP0_AWID(11 downto 0),
      S00_AXI_awlen(3 downto 0) => processing_system7_0_M_AXI_GP0_AWLEN(3 downto 0),
      S00_AXI_awlock(1 downto 0) => processing_system7_0_M_AXI_GP0_AWLOCK(1 downto 0),
      S00_AXI_awprot(2 downto 0) => processing_system7_0_M_AXI_GP0_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => processing_system7_0_M_AXI_GP0_AWQOS(3 downto 0),
      S00_AXI_awready => processing_system7_0_M_AXI_GP0_AWREADY,
      S00_AXI_awsize(2 downto 0) => processing_system7_0_M_AXI_GP0_AWSIZE(2 downto 0),
      S00_AXI_awvalid => processing_system7_0_M_AXI_GP0_AWVALID,
      S00_AXI_bid(11 downto 0) => processing_system7_0_M_AXI_GP0_BID(11 downto 0),
      S00_AXI_bready => processing_system7_0_M_AXI_GP0_BREADY,
      S00_AXI_bresp(1 downto 0) => processing_system7_0_M_AXI_GP0_BRESP(1 downto 0),
      S00_AXI_bvalid => processing_system7_0_M_AXI_GP0_BVALID,
      S00_AXI_rdata(31 downto 0) => processing_system7_0_M_AXI_GP0_RDATA(31 downto 0),
      S00_AXI_rid(11 downto 0) => processing_system7_0_M_AXI_GP0_RID(11 downto 0),
      S00_AXI_rlast => processing_system7_0_M_AXI_GP0_RLAST,
      S00_AXI_rready => processing_system7_0_M_AXI_GP0_RREADY,
      S00_AXI_rresp(1 downto 0) => processing_system7_0_M_AXI_GP0_RRESP(1 downto 0),
      S00_AXI_rvalid => processing_system7_0_M_AXI_GP0_RVALID,
      S00_AXI_wdata(31 downto 0) => processing_system7_0_M_AXI_GP0_WDATA(31 downto 0),
      S00_AXI_wid(11 downto 0) => processing_system7_0_M_AXI_GP0_WID(11 downto 0),
      S00_AXI_wlast => processing_system7_0_M_AXI_GP0_WLAST,
      S00_AXI_wready => processing_system7_0_M_AXI_GP0_WREADY,
      S00_AXI_wstrb(3 downto 0) => processing_system7_0_M_AXI_GP0_WSTRB(3 downto 0),
      S00_AXI_wvalid => processing_system7_0_M_AXI_GP0_WVALID,
      S01_AXI_araddr(31 downto 0) => axi_mcdma_0_M_AXI_SG_ARADDR(31 downto 0),
      S01_AXI_arburst(1 downto 0) => axi_mcdma_0_M_AXI_SG_ARBURST(1 downto 0),
      S01_AXI_arcache(3 downto 0) => axi_mcdma_0_M_AXI_SG_ARCACHE(3 downto 0),
      S01_AXI_arlen(7 downto 0) => axi_mcdma_0_M_AXI_SG_ARLEN(7 downto 0),
      S01_AXI_arlock(0) => '0',
      S01_AXI_arprot(2 downto 0) => axi_mcdma_0_M_AXI_SG_ARPROT(2 downto 0),
      S01_AXI_arqos(3 downto 0) => B"0000",
      S01_AXI_arready => axi_mcdma_0_M_AXI_SG_ARREADY,
      S01_AXI_arsize(2 downto 0) => axi_mcdma_0_M_AXI_SG_ARSIZE(2 downto 0),
      S01_AXI_aruser(3 downto 0) => axi_mcdma_0_M_AXI_SG_ARUSER(3 downto 0),
      S01_AXI_arvalid => axi_mcdma_0_M_AXI_SG_ARVALID,
      S01_AXI_awaddr(31 downto 0) => axi_mcdma_0_M_AXI_SG_AWADDR(31 downto 0),
      S01_AXI_awburst(1 downto 0) => axi_mcdma_0_M_AXI_SG_AWBURST(1 downto 0),
      S01_AXI_awcache(3 downto 0) => axi_mcdma_0_M_AXI_SG_AWCACHE(3 downto 0),
      S01_AXI_awlen(7 downto 0) => axi_mcdma_0_M_AXI_SG_AWLEN(7 downto 0),
      S01_AXI_awlock(0) => '0',
      S01_AXI_awprot(2 downto 0) => axi_mcdma_0_M_AXI_SG_AWPROT(2 downto 0),
      S01_AXI_awqos(3 downto 0) => B"0000",
      S01_AXI_awready => axi_mcdma_0_M_AXI_SG_AWREADY,
      S01_AXI_awsize(2 downto 0) => axi_mcdma_0_M_AXI_SG_AWSIZE(2 downto 0),
      S01_AXI_awuser(3 downto 0) => axi_mcdma_0_M_AXI_SG_AWUSER(3 downto 0),
      S01_AXI_awvalid => axi_mcdma_0_M_AXI_SG_AWVALID,
      S01_AXI_bready => axi_mcdma_0_M_AXI_SG_BREADY,
      S01_AXI_bresp(1 downto 0) => axi_mcdma_0_M_AXI_SG_BRESP(1 downto 0),
      S01_AXI_bvalid => axi_mcdma_0_M_AXI_SG_BVALID,
      S01_AXI_rdata(31 downto 0) => axi_mcdma_0_M_AXI_SG_RDATA(31 downto 0),
      S01_AXI_rlast => axi_mcdma_0_M_AXI_SG_RLAST,
      S01_AXI_rready => axi_mcdma_0_M_AXI_SG_RREADY,
      S01_AXI_rresp(1 downto 0) => axi_mcdma_0_M_AXI_SG_RRESP(1 downto 0),
      S01_AXI_rvalid => axi_mcdma_0_M_AXI_SG_RVALID,
      S01_AXI_wdata(31 downto 0) => axi_mcdma_0_M_AXI_SG_WDATA(31 downto 0),
      S01_AXI_wlast => axi_mcdma_0_M_AXI_SG_WLAST,
      S01_AXI_wready => axi_mcdma_0_M_AXI_SG_WREADY,
      S01_AXI_wstrb(3 downto 0) => axi_mcdma_0_M_AXI_SG_WSTRB(3 downto 0),
      S01_AXI_wvalid => axi_mcdma_0_M_AXI_SG_WVALID,
      S02_AXI_araddr(31 downto 0) => axi_mcdma_0_M_AXI_MM2S_ARADDR(31 downto 0),
      S02_AXI_arburst(1 downto 0) => axi_mcdma_0_M_AXI_MM2S_ARBURST(1 downto 0),
      S02_AXI_arcache(3 downto 0) => axi_mcdma_0_M_AXI_MM2S_ARCACHE(3 downto 0),
      S02_AXI_arlen(7 downto 0) => axi_mcdma_0_M_AXI_MM2S_ARLEN(7 downto 0),
      S02_AXI_arlock(0) => '0',
      S02_AXI_arprot(2 downto 0) => axi_mcdma_0_M_AXI_MM2S_ARPROT(2 downto 0),
      S02_AXI_arqos(3 downto 0) => B"0000",
      S02_AXI_arready => axi_mcdma_0_M_AXI_MM2S_ARREADY,
      S02_AXI_arsize(2 downto 0) => axi_mcdma_0_M_AXI_MM2S_ARSIZE(2 downto 0),
      S02_AXI_aruser(3 downto 0) => axi_mcdma_0_M_AXI_MM2S_ARUSER(3 downto 0),
      S02_AXI_arvalid => axi_mcdma_0_M_AXI_MM2S_ARVALID,
      S02_AXI_rdata(31 downto 0) => axi_mcdma_0_M_AXI_MM2S_RDATA(31 downto 0),
      S02_AXI_rlast => axi_mcdma_0_M_AXI_MM2S_RLAST,
      S02_AXI_rready => axi_mcdma_0_M_AXI_MM2S_RREADY,
      S02_AXI_rresp(1 downto 0) => axi_mcdma_0_M_AXI_MM2S_RRESP(1 downto 0),
      S02_AXI_rvalid => axi_mcdma_0_M_AXI_MM2S_RVALID,
      S03_AXI_awaddr(31 downto 0) => axi_mcdma_0_M_AXI_S2MM_AWADDR(31 downto 0),
      S03_AXI_awburst(1 downto 0) => axi_mcdma_0_M_AXI_S2MM_AWBURST(1 downto 0),
      S03_AXI_awcache(3 downto 0) => axi_mcdma_0_M_AXI_S2MM_AWCACHE(3 downto 0),
      S03_AXI_awlen(7 downto 0) => axi_mcdma_0_M_AXI_S2MM_AWLEN(7 downto 0),
      S03_AXI_awlock(0) => '0',
      S03_AXI_awprot(2 downto 0) => axi_mcdma_0_M_AXI_S2MM_AWPROT(2 downto 0),
      S03_AXI_awqos(3 downto 0) => B"0000",
      S03_AXI_awready => axi_mcdma_0_M_AXI_S2MM_AWREADY,
      S03_AXI_awsize(2 downto 0) => axi_mcdma_0_M_AXI_S2MM_AWSIZE(2 downto 0),
      S03_AXI_awuser(3 downto 0) => axi_mcdma_0_M_AXI_S2MM_AWUSER(3 downto 0),
      S03_AXI_awvalid => axi_mcdma_0_M_AXI_S2MM_AWVALID,
      S03_AXI_bready => axi_mcdma_0_M_AXI_S2MM_BREADY,
      S03_AXI_bresp(1 downto 0) => axi_mcdma_0_M_AXI_S2MM_BRESP(1 downto 0),
      S03_AXI_bvalid => axi_mcdma_0_M_AXI_S2MM_BVALID,
      S03_AXI_wdata(31 downto 0) => axi_mcdma_0_M_AXI_S2MM_WDATA(31 downto 0),
      S03_AXI_wlast => axi_mcdma_0_M_AXI_S2MM_WLAST,
      S03_AXI_wready => axi_mcdma_0_M_AXI_S2MM_WREADY,
      S03_AXI_wstrb(3 downto 0) => axi_mcdma_0_M_AXI_S2MM_WSTRB(3 downto 0),
      S03_AXI_wvalid => axi_mcdma_0_M_AXI_S2MM_WVALID,
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => proc_sys_reset_0_peripheral_aresetn(0)
    );
util_reduced_logic_0: component main_design_util_reduced_logic_0_1
     port map (
      Op1(1 downto 0) => xlconcat_0_dout(1 downto 0),
      Res => util_reduced_logic_0_Res
    );
xlconcat_0: component main_design_xlconcat_0_1
     port map (
      In0(0) => rst_0_1,
      In1(0) => axi_gpio_0_gpio_io_o(0),
      dout(1 downto 0) => xlconcat_0_dout(1 downto 0)
    );
xlconcat_1: component main_design_xlconcat_1_1
     port map (
      In0(0) => '0',
      In1(0) => '0',
      In2(0) => AXI_SpaceWire_IP_0_tc_out_intr,
      In3(0) => AXI_SpaceWire_IP_0_error_intr,
      In4(0) => AXI_SpaceWire_IP_0_state_intr,
      In5(0) => AXI_SpaceWire_IP_0_packet_intr,
      In6(0) => axi_mcdma_0_mm2s_ch1_introut,
      In7(0) => axi_mcdma_0_s2mm_ch1_introut,
      dout(7 downto 0) => xlconcat_1_dout(7 downto 0)
    );
end STRUCTURE;
