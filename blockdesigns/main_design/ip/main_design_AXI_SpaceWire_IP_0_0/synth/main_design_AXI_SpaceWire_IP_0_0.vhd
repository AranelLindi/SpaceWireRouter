-- (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: uni-wuerzburg.informatikviii:user:AXI_SpaceWire_IP:1.0
-- IP Revision: 64

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY main_design_AXI_SpaceWire_IP_0_0 IS
  PORT (
    clk_logic : IN STD_LOGIC;
    rxclk : IN STD_LOGIC;
    txclk : IN STD_LOGIC;
    rst_logic : IN STD_LOGIC;
    tc_in : IN STD_LOGIC;
    tc_out_intr : OUT STD_LOGIC;
    error_intr : OUT STD_LOGIC;
    state_intr : OUT STD_LOGIC;
    packet_intr : OUT STD_LOGIC;
    spw_di : IN STD_LOGIC;
    spw_si : IN STD_LOGIC;
    spw_do : OUT STD_LOGIC;
    spw_so : OUT STD_LOGIC;
    s00_axi_tx_aclk : IN STD_LOGIC;
    s00_axi_tx_aresetn : IN STD_LOGIC;
    s00_axi_tx_awaddr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s00_axi_tx_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s00_axi_tx_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s00_axi_tx_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s00_axi_tx_awlock : IN STD_LOGIC;
    s00_axi_tx_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s00_axi_tx_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s00_axi_tx_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s00_axi_tx_awregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s00_axi_tx_awuser : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s00_axi_tx_awvalid : IN STD_LOGIC;
    s00_axi_tx_awready : OUT STD_LOGIC;
    s00_axi_tx_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s00_axi_tx_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s00_axi_tx_wlast : IN STD_LOGIC;
    s00_axi_tx_wvalid : IN STD_LOGIC;
    s00_axi_tx_wready : OUT STD_LOGIC;
    s00_axi_tx_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s00_axi_tx_bvalid : OUT STD_LOGIC;
    s00_axi_tx_bready : IN STD_LOGIC;
    s00_axi_tx_araddr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s00_axi_tx_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s00_axi_tx_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s00_axi_tx_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s00_axi_tx_arlock : IN STD_LOGIC;
    s00_axi_tx_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s00_axi_tx_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s00_axi_tx_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s00_axi_tx_arregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s00_axi_tx_aruser : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s00_axi_tx_arvalid : IN STD_LOGIC;
    s00_axi_tx_arready : OUT STD_LOGIC;
    s00_axi_tx_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s00_axi_tx_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s00_axi_tx_rlast : OUT STD_LOGIC;
    s00_axi_tx_rvalid : OUT STD_LOGIC;
    s00_axi_tx_rready : IN STD_LOGIC;
    s01_axi_rx_aclk : IN STD_LOGIC;
    s01_axi_rx_aresetn : IN STD_LOGIC;
    s01_axi_rx_awaddr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s01_axi_rx_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s01_axi_rx_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s01_axi_rx_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s01_axi_rx_awlock : IN STD_LOGIC;
    s01_axi_rx_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s01_axi_rx_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s01_axi_rx_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s01_axi_rx_awregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s01_axi_rx_awuser : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s01_axi_rx_awvalid : IN STD_LOGIC;
    s01_axi_rx_awready : OUT STD_LOGIC;
    s01_axi_rx_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s01_axi_rx_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s01_axi_rx_wlast : IN STD_LOGIC;
    s01_axi_rx_wvalid : IN STD_LOGIC;
    s01_axi_rx_wready : OUT STD_LOGIC;
    s01_axi_rx_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s01_axi_rx_bvalid : OUT STD_LOGIC;
    s01_axi_rx_bready : IN STD_LOGIC;
    s01_axi_rx_araddr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s01_axi_rx_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s01_axi_rx_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s01_axi_rx_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s01_axi_rx_arlock : IN STD_LOGIC;
    s01_axi_rx_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s01_axi_rx_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s01_axi_rx_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s01_axi_rx_arregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s01_axi_rx_aruser : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s01_axi_rx_arvalid : IN STD_LOGIC;
    s01_axi_rx_arready : OUT STD_LOGIC;
    s01_axi_rx_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s01_axi_rx_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s01_axi_rx_rlast : OUT STD_LOGIC;
    s01_axi_rx_rvalid : OUT STD_LOGIC;
    s01_axi_rx_rready : IN STD_LOGIC;
    s02_axi_reg_aclk : IN STD_LOGIC;
    s02_axi_reg_aresetn : IN STD_LOGIC;
    s02_axi_reg_awaddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s02_axi_reg_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s02_axi_reg_awvalid : IN STD_LOGIC;
    s02_axi_reg_awready : OUT STD_LOGIC;
    s02_axi_reg_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s02_axi_reg_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s02_axi_reg_wvalid : IN STD_LOGIC;
    s02_axi_reg_wready : OUT STD_LOGIC;
    s02_axi_reg_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s02_axi_reg_bvalid : OUT STD_LOGIC;
    s02_axi_reg_bready : IN STD_LOGIC;
    s02_axi_reg_araddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s02_axi_reg_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s02_axi_reg_arvalid : IN STD_LOGIC;
    s02_axi_reg_arready : OUT STD_LOGIC;
    s02_axi_reg_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s02_axi_reg_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s02_axi_reg_rvalid : OUT STD_LOGIC;
    s02_axi_reg_rready : IN STD_LOGIC
  );
END main_design_AXI_SpaceWire_IP_0_0;

ARCHITECTURE main_design_AXI_SpaceWire_IP_0_0_arch OF main_design_AXI_SpaceWire_IP_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF main_design_AXI_SpaceWire_IP_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT AXI_SpaceWire_IP_v1_0 IS
    GENERIC (
      C_S00_AXI_TX_ID_WIDTH : INTEGER;
      C_S00_AXI_TX_DATA_WIDTH : INTEGER;
      C_S00_AXI_TX_ADDR_WIDTH : INTEGER;
      C_S00_AXI_TX_AWUSER_WIDTH : INTEGER;
      C_S00_AXI_TX_ARUSER_WIDTH : INTEGER;
      C_S00_AXI_TX_WUSER_WIDTH : INTEGER;
      C_S00_AXI_TX_RUSER_WIDTH : INTEGER;
      C_S00_AXI_TX_BUSER_WIDTH : INTEGER;
      C_S01_AXI_RX_ID_WIDTH : INTEGER;
      C_S01_AXI_RX_DATA_WIDTH : INTEGER;
      C_S01_AXI_RX_ADDR_WIDTH : INTEGER;
      C_S01_AXI_RX_AWUSER_WIDTH : INTEGER;
      C_S01_AXI_RX_ARUSER_WIDTH : INTEGER;
      C_S01_AXI_RX_WUSER_WIDTH : INTEGER;
      C_S01_AXI_RX_RUSER_WIDTH : INTEGER;
      C_S01_AXI_RX_BUSER_WIDTH : INTEGER;
      C_S02_AXI_REG_DATA_WIDTH : INTEGER;
      C_S02_AXI_REG_ADDR_WIDTH : INTEGER;
      rxchunk : INTEGER;
      rxfifosize_bits : INTEGER;
      txfifosize_bits : INTEGER
    );
    PORT (
      clk_logic : IN STD_LOGIC;
      rxclk : IN STD_LOGIC;
      txclk : IN STD_LOGIC;
      rst_logic : IN STD_LOGIC;
      tc_in : IN STD_LOGIC;
      tc_out_intr : OUT STD_LOGIC;
      error_intr : OUT STD_LOGIC;
      state_intr : OUT STD_LOGIC;
      packet_intr : OUT STD_LOGIC;
      spw_di : IN STD_LOGIC;
      spw_si : IN STD_LOGIC;
      spw_do : OUT STD_LOGIC;
      spw_so : OUT STD_LOGIC;
      s00_axi_tx_aclk : IN STD_LOGIC;
      s00_axi_tx_aresetn : IN STD_LOGIC;
      s00_axi_tx_awid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s00_axi_tx_awaddr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s00_axi_tx_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s00_axi_tx_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s00_axi_tx_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      s00_axi_tx_awlock : IN STD_LOGIC;
      s00_axi_tx_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s00_axi_tx_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s00_axi_tx_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s00_axi_tx_awregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s00_axi_tx_awuser : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s00_axi_tx_awvalid : IN STD_LOGIC;
      s00_axi_tx_awready : OUT STD_LOGIC;
      s00_axi_tx_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s00_axi_tx_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s00_axi_tx_wlast : IN STD_LOGIC;
      s00_axi_tx_wuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s00_axi_tx_wvalid : IN STD_LOGIC;
      s00_axi_tx_wready : OUT STD_LOGIC;
      s00_axi_tx_bid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      s00_axi_tx_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s00_axi_tx_buser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      s00_axi_tx_bvalid : OUT STD_LOGIC;
      s00_axi_tx_bready : IN STD_LOGIC;
      s00_axi_tx_arid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s00_axi_tx_araddr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s00_axi_tx_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s00_axi_tx_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s00_axi_tx_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      s00_axi_tx_arlock : IN STD_LOGIC;
      s00_axi_tx_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s00_axi_tx_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s00_axi_tx_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s00_axi_tx_arregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s00_axi_tx_aruser : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s00_axi_tx_arvalid : IN STD_LOGIC;
      s00_axi_tx_arready : OUT STD_LOGIC;
      s00_axi_tx_rid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      s00_axi_tx_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s00_axi_tx_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s00_axi_tx_rlast : OUT STD_LOGIC;
      s00_axi_tx_ruser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      s00_axi_tx_rvalid : OUT STD_LOGIC;
      s00_axi_tx_rready : IN STD_LOGIC;
      s01_axi_rx_aclk : IN STD_LOGIC;
      s01_axi_rx_aresetn : IN STD_LOGIC;
      s01_axi_rx_awid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s01_axi_rx_awaddr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s01_axi_rx_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s01_axi_rx_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s01_axi_rx_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      s01_axi_rx_awlock : IN STD_LOGIC;
      s01_axi_rx_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s01_axi_rx_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s01_axi_rx_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s01_axi_rx_awregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s01_axi_rx_awuser : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s01_axi_rx_awvalid : IN STD_LOGIC;
      s01_axi_rx_awready : OUT STD_LOGIC;
      s01_axi_rx_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s01_axi_rx_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s01_axi_rx_wlast : IN STD_LOGIC;
      s01_axi_rx_wuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s01_axi_rx_wvalid : IN STD_LOGIC;
      s01_axi_rx_wready : OUT STD_LOGIC;
      s01_axi_rx_bid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      s01_axi_rx_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s01_axi_rx_buser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      s01_axi_rx_bvalid : OUT STD_LOGIC;
      s01_axi_rx_bready : IN STD_LOGIC;
      s01_axi_rx_arid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s01_axi_rx_araddr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s01_axi_rx_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s01_axi_rx_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s01_axi_rx_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      s01_axi_rx_arlock : IN STD_LOGIC;
      s01_axi_rx_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s01_axi_rx_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s01_axi_rx_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s01_axi_rx_arregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s01_axi_rx_aruser : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s01_axi_rx_arvalid : IN STD_LOGIC;
      s01_axi_rx_arready : OUT STD_LOGIC;
      s01_axi_rx_rid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      s01_axi_rx_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s01_axi_rx_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s01_axi_rx_rlast : OUT STD_LOGIC;
      s01_axi_rx_ruser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      s01_axi_rx_rvalid : OUT STD_LOGIC;
      s01_axi_rx_rready : IN STD_LOGIC;
      s02_axi_reg_aclk : IN STD_LOGIC;
      s02_axi_reg_aresetn : IN STD_LOGIC;
      s02_axi_reg_awaddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      s02_axi_reg_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s02_axi_reg_awvalid : IN STD_LOGIC;
      s02_axi_reg_awready : OUT STD_LOGIC;
      s02_axi_reg_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s02_axi_reg_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s02_axi_reg_wvalid : IN STD_LOGIC;
      s02_axi_reg_wready : OUT STD_LOGIC;
      s02_axi_reg_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s02_axi_reg_bvalid : OUT STD_LOGIC;
      s02_axi_reg_bready : IN STD_LOGIC;
      s02_axi_reg_araddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      s02_axi_reg_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s02_axi_reg_arvalid : IN STD_LOGIC;
      s02_axi_reg_arready : OUT STD_LOGIC;
      s02_axi_reg_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s02_axi_reg_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s02_axi_reg_rvalid : OUT STD_LOGIC;
      s02_axi_reg_rready : IN STD_LOGIC
    );
  END COMPONENT AXI_SpaceWire_IP_v1_0;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF main_design_AXI_SpaceWire_IP_0_0_arch: ARCHITECTURE IS "AXI_SpaceWire_IP_v1_0,Vivado 2022.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF main_design_AXI_SpaceWire_IP_0_0_arch : ARCHITECTURE IS "main_design_AXI_SpaceWire_IP_0_0,AXI_SpaceWire_IP_v1_0,{}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF error_intr: SIGNAL IS "XIL_INTERFACENAME error_intr, SENSITIVITY LEVEL_HIGH, PORTWIDTH 1";
  ATTRIBUTE X_INTERFACE_INFO OF error_intr: SIGNAL IS "xilinx.com:signal:interrupt:1.0 error_intr INTERRUPT";
  ATTRIBUTE X_INTERFACE_PARAMETER OF packet_intr: SIGNAL IS "XIL_INTERFACENAME packet_intr, SENSITIVITY LEVEL_HIGH, PORTWIDTH 1";
  ATTRIBUTE X_INTERFACE_INFO OF packet_intr: SIGNAL IS "xilinx.com:signal:interrupt:1.0 packet_intr INTERRUPT";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s00_axi_tx_aclk: SIGNAL IS "XIL_INTERFACENAME S00_AXI_TX_CLK, ASSOCIATED_BUSIF S00_AXI_TX, ASSOCIATED_RESET s00_axi_tx_aresetn, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN main_design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 S00_AXI_TX_CLK CLK";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_arburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_arcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX ARCACHE";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s00_axi_tx_aresetn: SIGNAL IS "XIL_INTERFACENAME S00_AXI_TX_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 S00_AXI_TX_RST RST";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_arlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_arlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_arqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_arregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_arsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_aruser: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX ARUSER";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX ARVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s00_axi_tx_awaddr: SIGNAL IS "XIL_INTERFACENAME S00_AXI_TX, WIZ_DATA_WIDTH 32, WIZ_MEMORY_SIZE 256, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 3, AWUSER_WIDTH 4, ARUSER_WIDTH 4, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN main_design_process" & 
"ing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_awburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_awcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_awlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_awlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_awqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_awregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_awsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_awuser: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX AWUSER";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_rlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_wlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_tx_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI_TX WVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s01_axi_rx_aclk: SIGNAL IS "XIL_INTERFACENAME S01_AXI_RX_CLK, ASSOCIATED_BUSIF S01_AXI_RX, ASSOCIATED_RESET s01_axi_rx_aresetn, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN main_design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 S01_AXI_RX_CLK CLK";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_arburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_arcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX ARCACHE";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s01_axi_rx_aresetn: SIGNAL IS "XIL_INTERFACENAME S01_AXI_RX_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 S01_AXI_RX_RST RST";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_arlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_arlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_arqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_arregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_arsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_aruser: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX ARUSER";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX ARVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s01_axi_rx_awaddr: SIGNAL IS "XIL_INTERFACENAME S01_AXI_RX, WIZ_DATA_WIDTH 32, WIZ_MEMORY_SIZE 128, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 3, AWUSER_WIDTH 4, ARUSER_WIDTH 4, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN main_design_process" & 
"ing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_awburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_awcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_awlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_awlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_awqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_awregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_awsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_awuser: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX AWUSER";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_rlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_wlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s01_axi_rx_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S01_AXI_RX WVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s02_axi_reg_aclk: SIGNAL IS "XIL_INTERFACENAME S02_AXI_REG_CLK, ASSOCIATED_BUSIF S02_AXI_REG, ASSOCIATED_RESET s02_axi_reg_aresetn, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN main_design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 S02_AXI_REG_CLK CLK";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI_REG ARADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s02_axi_reg_aresetn: SIGNAL IS "XIL_INTERFACENAME S02_AXI_REG_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 S02_AXI_REG_RST RST";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI_REG ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI_REG ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI_REG ARVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s02_axi_reg_awaddr: SIGNAL IS "XIL_INTERFACENAME S02_AXI_REG, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 5, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN main_design_processing" & 
"_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI_REG AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI_REG AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI_REG AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI_REG AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI_REG BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI_REG BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI_REG BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI_REG RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI_REG RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI_REG RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI_REG RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI_REG WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI_REG WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI_REG WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s02_axi_reg_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S02_AXI_REG WVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF state_intr: SIGNAL IS "XIL_INTERFACENAME state_intr, SENSITIVITY LEVEL_HIGH, PORTWIDTH 1";
  ATTRIBUTE X_INTERFACE_INFO OF state_intr: SIGNAL IS "xilinx.com:signal:interrupt:1.0 state_intr INTERRUPT";
  ATTRIBUTE X_INTERFACE_PARAMETER OF tc_out_intr: SIGNAL IS "XIL_INTERFACENAME tc_out_intr, SENSITIVITY LEVEL_HIGH, PORTWIDTH 1";
  ATTRIBUTE X_INTERFACE_INFO OF tc_out_intr: SIGNAL IS "xilinx.com:signal:interrupt:1.0 tc_out_intr INTERRUPT";
BEGIN
  U0 : AXI_SpaceWire_IP_v1_0
    GENERIC MAP (
      C_S00_AXI_TX_ID_WIDTH => 0,
      C_S00_AXI_TX_DATA_WIDTH => 32,
      C_S00_AXI_TX_ADDR_WIDTH => 3,
      C_S00_AXI_TX_AWUSER_WIDTH => 4,
      C_S00_AXI_TX_ARUSER_WIDTH => 4,
      C_S00_AXI_TX_WUSER_WIDTH => 0,
      C_S00_AXI_TX_RUSER_WIDTH => 0,
      C_S00_AXI_TX_BUSER_WIDTH => 0,
      C_S01_AXI_RX_ID_WIDTH => 0,
      C_S01_AXI_RX_DATA_WIDTH => 32,
      C_S01_AXI_RX_ADDR_WIDTH => 3,
      C_S01_AXI_RX_AWUSER_WIDTH => 4,
      C_S01_AXI_RX_ARUSER_WIDTH => 4,
      C_S01_AXI_RX_WUSER_WIDTH => 0,
      C_S01_AXI_RX_RUSER_WIDTH => 0,
      C_S01_AXI_RX_BUSER_WIDTH => 0,
      C_S02_AXI_REG_DATA_WIDTH => 32,
      C_S02_AXI_REG_ADDR_WIDTH => 5,
      rxchunk => 1,
      rxfifosize_bits => 11,
      txfifosize_bits => 11
    )
    PORT MAP (
      clk_logic => clk_logic,
      rxclk => rxclk,
      txclk => txclk,
      rst_logic => rst_logic,
      tc_in => tc_in,
      tc_out_intr => tc_out_intr,
      error_intr => error_intr,
      state_intr => state_intr,
      packet_intr => packet_intr,
      spw_di => spw_di,
      spw_si => spw_si,
      spw_do => spw_do,
      spw_so => spw_so,
      s00_axi_tx_aclk => s00_axi_tx_aclk,
      s00_axi_tx_aresetn => s00_axi_tx_aresetn,
      s00_axi_tx_awid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s00_axi_tx_awaddr => s00_axi_tx_awaddr,
      s00_axi_tx_awlen => s00_axi_tx_awlen,
      s00_axi_tx_awsize => s00_axi_tx_awsize,
      s00_axi_tx_awburst => s00_axi_tx_awburst,
      s00_axi_tx_awlock => s00_axi_tx_awlock,
      s00_axi_tx_awcache => s00_axi_tx_awcache,
      s00_axi_tx_awprot => s00_axi_tx_awprot,
      s00_axi_tx_awqos => s00_axi_tx_awqos,
      s00_axi_tx_awregion => s00_axi_tx_awregion,
      s00_axi_tx_awuser => s00_axi_tx_awuser,
      s00_axi_tx_awvalid => s00_axi_tx_awvalid,
      s00_axi_tx_awready => s00_axi_tx_awready,
      s00_axi_tx_wdata => s00_axi_tx_wdata,
      s00_axi_tx_wstrb => s00_axi_tx_wstrb,
      s00_axi_tx_wlast => s00_axi_tx_wlast,
      s00_axi_tx_wuser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s00_axi_tx_wvalid => s00_axi_tx_wvalid,
      s00_axi_tx_wready => s00_axi_tx_wready,
      s00_axi_tx_bresp => s00_axi_tx_bresp,
      s00_axi_tx_bvalid => s00_axi_tx_bvalid,
      s00_axi_tx_bready => s00_axi_tx_bready,
      s00_axi_tx_arid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s00_axi_tx_araddr => s00_axi_tx_araddr,
      s00_axi_tx_arlen => s00_axi_tx_arlen,
      s00_axi_tx_arsize => s00_axi_tx_arsize,
      s00_axi_tx_arburst => s00_axi_tx_arburst,
      s00_axi_tx_arlock => s00_axi_tx_arlock,
      s00_axi_tx_arcache => s00_axi_tx_arcache,
      s00_axi_tx_arprot => s00_axi_tx_arprot,
      s00_axi_tx_arqos => s00_axi_tx_arqos,
      s00_axi_tx_arregion => s00_axi_tx_arregion,
      s00_axi_tx_aruser => s00_axi_tx_aruser,
      s00_axi_tx_arvalid => s00_axi_tx_arvalid,
      s00_axi_tx_arready => s00_axi_tx_arready,
      s00_axi_tx_rdata => s00_axi_tx_rdata,
      s00_axi_tx_rresp => s00_axi_tx_rresp,
      s00_axi_tx_rlast => s00_axi_tx_rlast,
      s00_axi_tx_rvalid => s00_axi_tx_rvalid,
      s00_axi_tx_rready => s00_axi_tx_rready,
      s01_axi_rx_aclk => s01_axi_rx_aclk,
      s01_axi_rx_aresetn => s01_axi_rx_aresetn,
      s01_axi_rx_awid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s01_axi_rx_awaddr => s01_axi_rx_awaddr,
      s01_axi_rx_awlen => s01_axi_rx_awlen,
      s01_axi_rx_awsize => s01_axi_rx_awsize,
      s01_axi_rx_awburst => s01_axi_rx_awburst,
      s01_axi_rx_awlock => s01_axi_rx_awlock,
      s01_axi_rx_awcache => s01_axi_rx_awcache,
      s01_axi_rx_awprot => s01_axi_rx_awprot,
      s01_axi_rx_awqos => s01_axi_rx_awqos,
      s01_axi_rx_awregion => s01_axi_rx_awregion,
      s01_axi_rx_awuser => s01_axi_rx_awuser,
      s01_axi_rx_awvalid => s01_axi_rx_awvalid,
      s01_axi_rx_awready => s01_axi_rx_awready,
      s01_axi_rx_wdata => s01_axi_rx_wdata,
      s01_axi_rx_wstrb => s01_axi_rx_wstrb,
      s01_axi_rx_wlast => s01_axi_rx_wlast,
      s01_axi_rx_wuser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s01_axi_rx_wvalid => s01_axi_rx_wvalid,
      s01_axi_rx_wready => s01_axi_rx_wready,
      s01_axi_rx_bresp => s01_axi_rx_bresp,
      s01_axi_rx_bvalid => s01_axi_rx_bvalid,
      s01_axi_rx_bready => s01_axi_rx_bready,
      s01_axi_rx_arid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s01_axi_rx_araddr => s01_axi_rx_araddr,
      s01_axi_rx_arlen => s01_axi_rx_arlen,
      s01_axi_rx_arsize => s01_axi_rx_arsize,
      s01_axi_rx_arburst => s01_axi_rx_arburst,
      s01_axi_rx_arlock => s01_axi_rx_arlock,
      s01_axi_rx_arcache => s01_axi_rx_arcache,
      s01_axi_rx_arprot => s01_axi_rx_arprot,
      s01_axi_rx_arqos => s01_axi_rx_arqos,
      s01_axi_rx_arregion => s01_axi_rx_arregion,
      s01_axi_rx_aruser => s01_axi_rx_aruser,
      s01_axi_rx_arvalid => s01_axi_rx_arvalid,
      s01_axi_rx_arready => s01_axi_rx_arready,
      s01_axi_rx_rdata => s01_axi_rx_rdata,
      s01_axi_rx_rresp => s01_axi_rx_rresp,
      s01_axi_rx_rlast => s01_axi_rx_rlast,
      s01_axi_rx_rvalid => s01_axi_rx_rvalid,
      s01_axi_rx_rready => s01_axi_rx_rready,
      s02_axi_reg_aclk => s02_axi_reg_aclk,
      s02_axi_reg_aresetn => s02_axi_reg_aresetn,
      s02_axi_reg_awaddr => s02_axi_reg_awaddr,
      s02_axi_reg_awprot => s02_axi_reg_awprot,
      s02_axi_reg_awvalid => s02_axi_reg_awvalid,
      s02_axi_reg_awready => s02_axi_reg_awready,
      s02_axi_reg_wdata => s02_axi_reg_wdata,
      s02_axi_reg_wstrb => s02_axi_reg_wstrb,
      s02_axi_reg_wvalid => s02_axi_reg_wvalid,
      s02_axi_reg_wready => s02_axi_reg_wready,
      s02_axi_reg_bresp => s02_axi_reg_bresp,
      s02_axi_reg_bvalid => s02_axi_reg_bvalid,
      s02_axi_reg_bready => s02_axi_reg_bready,
      s02_axi_reg_araddr => s02_axi_reg_araddr,
      s02_axi_reg_arprot => s02_axi_reg_arprot,
      s02_axi_reg_arvalid => s02_axi_reg_arvalid,
      s02_axi_reg_arready => s02_axi_reg_arready,
      s02_axi_reg_rdata => s02_axi_reg_rdata,
      s02_axi_reg_rresp => s02_axi_reg_rresp,
      s02_axi_reg_rvalid => s02_axi_reg_rvalid,
      s02_axi_reg_rready => s02_axi_reg_rready
    );
END main_design_AXI_SpaceWire_IP_0_0_arch;
