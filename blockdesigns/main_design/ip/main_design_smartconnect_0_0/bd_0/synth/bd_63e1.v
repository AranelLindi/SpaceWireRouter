//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_63e1.bd
//Design : bd_63e1
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_63e1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_63e1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=120,numReposBlks=94,numNonXlnxBlks=0,numHierBlks=26,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=Global}" *) (* HW_HANDOFF = "main_design_smartconnect_0_0.hwdef" *) 
module bd_63e1
   (M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_aruser,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awuser,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_AXI_araddr,
    M01_AXI_arprot,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awprot,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    M02_AXI_araddr,
    M02_AXI_arprot,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awprot,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wstrb,
    M02_AXI_wvalid,
    M03_AXI_araddr,
    M03_AXI_arprot,
    M03_AXI_arready,
    M03_AXI_arvalid,
    M03_AXI_awaddr,
    M03_AXI_awprot,
    M03_AXI_awready,
    M03_AXI_awvalid,
    M03_AXI_bready,
    M03_AXI_bresp,
    M03_AXI_bvalid,
    M03_AXI_rdata,
    M03_AXI_rready,
    M03_AXI_rresp,
    M03_AXI_rvalid,
    M03_AXI_wdata,
    M03_AXI_wready,
    M03_AXI_wstrb,
    M03_AXI_wvalid,
    M04_AXI_araddr,
    M04_AXI_arburst,
    M04_AXI_arcache,
    M04_AXI_arlen,
    M04_AXI_arlock,
    M04_AXI_arprot,
    M04_AXI_arqos,
    M04_AXI_arready,
    M04_AXI_arsize,
    M04_AXI_aruser,
    M04_AXI_arvalid,
    M04_AXI_awaddr,
    M04_AXI_awburst,
    M04_AXI_awcache,
    M04_AXI_awlen,
    M04_AXI_awlock,
    M04_AXI_awprot,
    M04_AXI_awqos,
    M04_AXI_awready,
    M04_AXI_awsize,
    M04_AXI_awuser,
    M04_AXI_awvalid,
    M04_AXI_bready,
    M04_AXI_bresp,
    M04_AXI_bvalid,
    M04_AXI_rdata,
    M04_AXI_rlast,
    M04_AXI_rready,
    M04_AXI_rresp,
    M04_AXI_rvalid,
    M04_AXI_wdata,
    M04_AXI_wlast,
    M04_AXI_wready,
    M04_AXI_wstrb,
    M04_AXI_wvalid,
    M05_AXI_araddr,
    M05_AXI_arburst,
    M05_AXI_arcache,
    M05_AXI_arlen,
    M05_AXI_arlock,
    M05_AXI_arprot,
    M05_AXI_arqos,
    M05_AXI_arready,
    M05_AXI_arsize,
    M05_AXI_aruser,
    M05_AXI_arvalid,
    M05_AXI_awaddr,
    M05_AXI_awburst,
    M05_AXI_awcache,
    M05_AXI_awlen,
    M05_AXI_awlock,
    M05_AXI_awprot,
    M05_AXI_awqos,
    M05_AXI_awready,
    M05_AXI_awsize,
    M05_AXI_awuser,
    M05_AXI_awvalid,
    M05_AXI_bready,
    M05_AXI_bresp,
    M05_AXI_bvalid,
    M05_AXI_rdata,
    M05_AXI_rlast,
    M05_AXI_rready,
    M05_AXI_rresp,
    M05_AXI_rvalid,
    M05_AXI_wdata,
    M05_AXI_wlast,
    M05_AXI_wready,
    M05_AXI_wstrb,
    M05_AXI_wvalid,
    M06_AXI_araddr,
    M06_AXI_arprot,
    M06_AXI_arready,
    M06_AXI_arvalid,
    M06_AXI_awaddr,
    M06_AXI_awprot,
    M06_AXI_awready,
    M06_AXI_awvalid,
    M06_AXI_bready,
    M06_AXI_bresp,
    M06_AXI_bvalid,
    M06_AXI_rdata,
    M06_AXI_rready,
    M06_AXI_rresp,
    M06_AXI_rvalid,
    M06_AXI_wdata,
    M06_AXI_wready,
    M06_AXI_wstrb,
    M06_AXI_wvalid,
    M07_AXI_araddr,
    M07_AXI_arprot,
    M07_AXI_arready,
    M07_AXI_arvalid,
    M07_AXI_awaddr,
    M07_AXI_awprot,
    M07_AXI_awready,
    M07_AXI_awvalid,
    M07_AXI_bready,
    M07_AXI_bresp,
    M07_AXI_bvalid,
    M07_AXI_rdata,
    M07_AXI_rready,
    M07_AXI_rresp,
    M07_AXI_rvalid,
    M07_AXI_wdata,
    M07_AXI_wready,
    M07_AXI_wstrb,
    M07_AXI_wvalid,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wid,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid,
    S01_AXI_araddr,
    S01_AXI_arburst,
    S01_AXI_arcache,
    S01_AXI_arlen,
    S01_AXI_arlock,
    S01_AXI_arprot,
    S01_AXI_arqos,
    S01_AXI_arready,
    S01_AXI_arsize,
    S01_AXI_aruser,
    S01_AXI_arvalid,
    S01_AXI_rdata,
    S01_AXI_rlast,
    S01_AXI_rready,
    S01_AXI_rresp,
    S01_AXI_rvalid,
    S02_AXI_araddr,
    S02_AXI_arburst,
    S02_AXI_arcache,
    S02_AXI_arlen,
    S02_AXI_arlock,
    S02_AXI_arprot,
    S02_AXI_arqos,
    S02_AXI_arready,
    S02_AXI_arsize,
    S02_AXI_aruser,
    S02_AXI_arvalid,
    S02_AXI_awaddr,
    S02_AXI_awburst,
    S02_AXI_awcache,
    S02_AXI_awlen,
    S02_AXI_awlock,
    S02_AXI_awprot,
    S02_AXI_awqos,
    S02_AXI_awready,
    S02_AXI_awsize,
    S02_AXI_awuser,
    S02_AXI_awvalid,
    S02_AXI_bready,
    S02_AXI_bresp,
    S02_AXI_bvalid,
    S02_AXI_rdata,
    S02_AXI_rlast,
    S02_AXI_rready,
    S02_AXI_rresp,
    S02_AXI_rvalid,
    S02_AXI_wdata,
    S02_AXI_wlast,
    S02_AXI_wready,
    S02_AXI_wstrb,
    S02_AXI_wvalid,
    S03_AXI_awaddr,
    S03_AXI_awburst,
    S03_AXI_awcache,
    S03_AXI_awlen,
    S03_AXI_awlock,
    S03_AXI_awprot,
    S03_AXI_awqos,
    S03_AXI_awready,
    S03_AXI_awsize,
    S03_AXI_awuser,
    S03_AXI_awvalid,
    S03_AXI_bready,
    S03_AXI_bresp,
    S03_AXI_bvalid,
    S03_AXI_wdata,
    S03_AXI_wlast,
    S03_AXI_wready,
    S03_AXI_wstrb,
    S03_AXI_wvalid,
    aclk,
    aresetn);
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXI, ADDR_WIDTH 32, ARUSER_WIDTH 4, AWUSER_WIDTH 4, BUSER_WIDTH 0, CLK_DOMAIN main_design_processing_system7_0_0_FCLK_CLK0, DATA_WIDTH 64, FREQ_HZ 50000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 16, NUM_READ_OUTSTANDING 8, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 8, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI3, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [31:0]M00_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARBURST" *) output [1:0]M00_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARCACHE" *) output [3:0]M00_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARLEN" *) output [3:0]M00_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARLOCK" *) output [1:0]M00_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARPROT" *) output [2:0]M00_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARQOS" *) output [3:0]M00_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARREADY" *) input M00_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARSIZE" *) output [2:0]M00_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARUSER" *) output [3:0]M00_AXI_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARVALID" *) output M00_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWADDR" *) output [31:0]M00_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWBURST" *) output [1:0]M00_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWCACHE" *) output [3:0]M00_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWLEN" *) output [3:0]M00_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWLOCK" *) output [1:0]M00_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWPROT" *) output [2:0]M00_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWQOS" *) output [3:0]M00_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWREADY" *) input M00_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWSIZE" *) output [2:0]M00_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWUSER" *) output [3:0]M00_AXI_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWVALID" *) output M00_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI BREADY" *) output M00_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI BRESP" *) input [1:0]M00_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI BVALID" *) input M00_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RDATA" *) input [63:0]M00_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RLAST" *) input M00_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RREADY" *) output M00_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RRESP" *) input [1:0]M00_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RVALID" *) input M00_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WDATA" *) output [63:0]M00_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WLAST" *) output M00_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WREADY" *) input M00_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WSTRB" *) output [7:0]M00_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WVALID" *) output M00_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M01_AXI, ADDR_WIDTH 12, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN main_design_processing_system7_0_0_FCLK_CLK0, DATA_WIDTH 32, FREQ_HZ 50000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 8, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 8, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [11:0]M01_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARPROT" *) output [2:0]M01_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARREADY" *) input M01_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARVALID" *) output M01_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWADDR" *) output [11:0]M01_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWPROT" *) output [2:0]M01_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWREADY" *) input M01_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWVALID" *) output M01_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI BREADY" *) output M01_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI BRESP" *) input [1:0]M01_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI BVALID" *) input M01_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RDATA" *) input [31:0]M01_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RREADY" *) output M01_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RRESP" *) input [1:0]M01_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RVALID" *) input M01_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WDATA" *) output [31:0]M01_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WREADY" *) input M01_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WSTRB" *) output [3:0]M01_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WVALID" *) output M01_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M02_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M02_AXI, ADDR_WIDTH 9, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN main_design_processing_system7_0_0_FCLK_CLK0, DATA_WIDTH 32, FREQ_HZ 50000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 8, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 8, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [8:0]M02_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M02_AXI ARPROT" *) output [2:0]M02_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M02_AXI ARREADY" *) input M02_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M02_AXI ARVALID" *) output M02_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M02_AXI AWADDR" *) output [8:0]M02_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M02_AXI AWPROT" *) output [2:0]M02_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M02_AXI AWREADY" *) input M02_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M02_AXI AWVALID" *) output M02_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M02_AXI BREADY" *) output M02_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M02_AXI BRESP" *) input [1:0]M02_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M02_AXI BVALID" *) input M02_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M02_AXI RDATA" *) input [31:0]M02_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M02_AXI RREADY" *) output M02_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M02_AXI RRESP" *) input [1:0]M02_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M02_AXI RVALID" *) input M02_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M02_AXI WDATA" *) output [31:0]M02_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M02_AXI WREADY" *) input M02_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M02_AXI WSTRB" *) output [3:0]M02_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M02_AXI WVALID" *) output M02_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M03_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M03_AXI, ADDR_WIDTH 9, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN main_design_processing_system7_0_0_FCLK_CLK0, DATA_WIDTH 32, FREQ_HZ 50000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 8, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 8, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [8:0]M03_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M03_AXI ARPROT" *) output [2:0]M03_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M03_AXI ARREADY" *) input M03_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M03_AXI ARVALID" *) output M03_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M03_AXI AWADDR" *) output [8:0]M03_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M03_AXI AWPROT" *) output [2:0]M03_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M03_AXI AWREADY" *) input M03_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M03_AXI AWVALID" *) output M03_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M03_AXI BREADY" *) output M03_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M03_AXI BRESP" *) input [1:0]M03_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M03_AXI BVALID" *) input M03_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M03_AXI RDATA" *) input [31:0]M03_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M03_AXI RREADY" *) output M03_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M03_AXI RRESP" *) input [1:0]M03_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M03_AXI RVALID" *) input M03_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M03_AXI WDATA" *) output [31:0]M03_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M03_AXI WREADY" *) input M03_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M03_AXI WSTRB" *) output [3:0]M03_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M03_AXI WVALID" *) output M03_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M04_AXI, ADDR_WIDTH 3, ARUSER_WIDTH 4, AWUSER_WIDTH 4, BUSER_WIDTH 0, CLK_DOMAIN main_design_processing_system7_0_0_FCLK_CLK0, DATA_WIDTH 32, FREQ_HZ 50000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 8, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 8, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [2:0]M04_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI ARBURST" *) output [1:0]M04_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI ARCACHE" *) output [3:0]M04_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI ARLEN" *) output [7:0]M04_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI ARLOCK" *) output [0:0]M04_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI ARPROT" *) output [2:0]M04_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI ARQOS" *) output [3:0]M04_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI ARREADY" *) input M04_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI ARSIZE" *) output [2:0]M04_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI ARUSER" *) output [3:0]M04_AXI_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI ARVALID" *) output M04_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI AWADDR" *) output [2:0]M04_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI AWBURST" *) output [1:0]M04_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI AWCACHE" *) output [3:0]M04_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI AWLEN" *) output [7:0]M04_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI AWLOCK" *) output [0:0]M04_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI AWPROT" *) output [2:0]M04_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI AWQOS" *) output [3:0]M04_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI AWREADY" *) input M04_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI AWSIZE" *) output [2:0]M04_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI AWUSER" *) output [3:0]M04_AXI_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI AWVALID" *) output M04_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI BREADY" *) output M04_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI BRESP" *) input [1:0]M04_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI BVALID" *) input M04_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI RDATA" *) input [31:0]M04_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI RLAST" *) input M04_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI RREADY" *) output M04_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI RRESP" *) input [1:0]M04_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI RVALID" *) input M04_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI WDATA" *) output [31:0]M04_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI WLAST" *) output M04_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI WREADY" *) input M04_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI WSTRB" *) output [3:0]M04_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M04_AXI WVALID" *) output M04_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M05_AXI, ADDR_WIDTH 3, ARUSER_WIDTH 4, AWUSER_WIDTH 4, BUSER_WIDTH 0, CLK_DOMAIN main_design_processing_system7_0_0_FCLK_CLK0, DATA_WIDTH 32, FREQ_HZ 50000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 8, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 8, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [2:0]M05_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI ARBURST" *) output [1:0]M05_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI ARCACHE" *) output [3:0]M05_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI ARLEN" *) output [7:0]M05_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI ARLOCK" *) output [0:0]M05_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI ARPROT" *) output [2:0]M05_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI ARQOS" *) output [3:0]M05_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI ARREADY" *) input M05_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI ARSIZE" *) output [2:0]M05_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI ARUSER" *) output [3:0]M05_AXI_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI ARVALID" *) output M05_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI AWADDR" *) output [2:0]M05_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI AWBURST" *) output [1:0]M05_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI AWCACHE" *) output [3:0]M05_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI AWLEN" *) output [7:0]M05_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI AWLOCK" *) output [0:0]M05_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI AWPROT" *) output [2:0]M05_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI AWQOS" *) output [3:0]M05_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI AWREADY" *) input M05_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI AWSIZE" *) output [2:0]M05_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI AWUSER" *) output [3:0]M05_AXI_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI AWVALID" *) output M05_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI BREADY" *) output M05_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI BRESP" *) input [1:0]M05_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI BVALID" *) input M05_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI RDATA" *) input [31:0]M05_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI RLAST" *) input M05_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI RREADY" *) output M05_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI RRESP" *) input [1:0]M05_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI RVALID" *) input M05_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI WDATA" *) output [31:0]M05_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI WLAST" *) output M05_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI WREADY" *) input M05_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI WSTRB" *) output [3:0]M05_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M05_AXI WVALID" *) output M05_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M06_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M06_AXI, ADDR_WIDTH 5, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN main_design_processing_system7_0_0_FCLK_CLK0, DATA_WIDTH 32, FREQ_HZ 50000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 8, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 8, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [4:0]M06_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M06_AXI ARPROT" *) output [2:0]M06_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M06_AXI ARREADY" *) input M06_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M06_AXI ARVALID" *) output M06_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M06_AXI AWADDR" *) output [4:0]M06_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M06_AXI AWPROT" *) output [2:0]M06_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M06_AXI AWREADY" *) input M06_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M06_AXI AWVALID" *) output M06_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M06_AXI BREADY" *) output M06_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M06_AXI BRESP" *) input [1:0]M06_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M06_AXI BVALID" *) input M06_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M06_AXI RDATA" *) input [31:0]M06_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M06_AXI RREADY" *) output M06_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M06_AXI RRESP" *) input [1:0]M06_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M06_AXI RVALID" *) input M06_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M06_AXI WDATA" *) output [31:0]M06_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M06_AXI WREADY" *) input M06_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M06_AXI WSTRB" *) output [3:0]M06_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M06_AXI WVALID" *) output M06_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M07_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M07_AXI, ADDR_WIDTH 13, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN main_design_processing_system7_0_0_FCLK_CLK0, DATA_WIDTH 32, FREQ_HZ 50000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 8, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 8, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [12:0]M07_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M07_AXI ARPROT" *) output [2:0]M07_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M07_AXI ARREADY" *) input M07_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M07_AXI ARVALID" *) output M07_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M07_AXI AWADDR" *) output [12:0]M07_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M07_AXI AWPROT" *) output [2:0]M07_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M07_AXI AWREADY" *) input M07_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M07_AXI AWVALID" *) output M07_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M07_AXI BREADY" *) output M07_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M07_AXI BRESP" *) input [1:0]M07_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M07_AXI BVALID" *) input M07_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M07_AXI RDATA" *) input [31:0]M07_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M07_AXI RREADY" *) output M07_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M07_AXI RRESP" *) input [1:0]M07_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M07_AXI RVALID" *) input M07_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M07_AXI WDATA" *) output [31:0]M07_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M07_AXI WREADY" *) input M07_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M07_AXI WSTRB" *) output [3:0]M07_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M07_AXI WVALID" *) output M07_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN main_design_processing_system7_0_0_FCLK_CLK0, DATA_WIDTH 32, FREQ_HZ 50000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 12, INSERT_VIP 0, MAX_BURST_LENGTH 16, NUM_READ_OUTSTANDING 8, NUM_READ_THREADS 4, NUM_WRITE_OUTSTANDING 8, NUM_WRITE_THREADS 4, PHASE 0.0, PROTOCOL AXI3, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [31:0]S00_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARBURST" *) input [1:0]S00_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARCACHE" *) input [3:0]S00_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARID" *) input [11:0]S00_AXI_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARLEN" *) input [3:0]S00_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARLOCK" *) input [1:0]S00_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]S00_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARQOS" *) input [3:0]S00_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output S00_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARSIZE" *) input [2:0]S00_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input S00_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) input [31:0]S00_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWBURST" *) input [1:0]S00_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWCACHE" *) input [3:0]S00_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWID" *) input [11:0]S00_AXI_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWLEN" *) input [3:0]S00_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWLOCK" *) input [1:0]S00_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]S00_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWQOS" *) input [3:0]S00_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output S00_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWSIZE" *) input [2:0]S00_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input S00_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BID" *) output [11:0]S00_AXI_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input S00_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]S00_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output S00_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [31:0]S00_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RID" *) output [11:0]S00_AXI_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RLAST" *) output S00_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) input S00_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]S00_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output S00_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [31:0]S00_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WID" *) input [11:0]S00_AXI_wid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WLAST" *) input S00_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output S00_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [3:0]S00_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input S00_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S01_AXI, ADDR_WIDTH 32, ARUSER_WIDTH 4, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN main_design_processing_system7_0_0_FCLK_CLK0, DATA_WIDTH 32, FREQ_HZ 50000000, HAS_BRESP 0, HAS_BURST 0, HAS_CACHE 1, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 0, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_ONLY, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [31:0]S01_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARBURST" *) input [1:0]S01_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARCACHE" *) input [3:0]S01_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARLEN" *) input [7:0]S01_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARLOCK" *) input [0:0]S01_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARPROT" *) input [2:0]S01_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARQOS" *) input [3:0]S01_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARREADY" *) output S01_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARSIZE" *) input [2:0]S01_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARUSER" *) input [3:0]S01_AXI_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARVALID" *) input S01_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RDATA" *) output [31:0]S01_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RLAST" *) output S01_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RREADY" *) input S01_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RRESP" *) output [1:0]S01_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RVALID" *) output S01_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S02_AXI, ADDR_WIDTH 32, ARUSER_WIDTH 4, AWUSER_WIDTH 4, BUSER_WIDTH 0, CLK_DOMAIN main_design_processing_system7_0_0_FCLK_CLK0, DATA_WIDTH 32, FREQ_HZ 50000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 1, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 16, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [31:0]S02_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARBURST" *) input [1:0]S02_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARCACHE" *) input [3:0]S02_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARLEN" *) input [7:0]S02_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARLOCK" *) input [0:0]S02_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARPROT" *) input [2:0]S02_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARQOS" *) input [3:0]S02_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARREADY" *) output S02_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARSIZE" *) input [2:0]S02_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARUSER" *) input [3:0]S02_AXI_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARVALID" *) input S02_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWADDR" *) input [31:0]S02_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWBURST" *) input [1:0]S02_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWCACHE" *) input [3:0]S02_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWLEN" *) input [7:0]S02_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWLOCK" *) input [0:0]S02_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWPROT" *) input [2:0]S02_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWQOS" *) input [3:0]S02_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWREADY" *) output S02_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWSIZE" *) input [2:0]S02_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWUSER" *) input [3:0]S02_AXI_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWVALID" *) input S02_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI BREADY" *) input S02_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI BRESP" *) output [1:0]S02_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI BVALID" *) output S02_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI RDATA" *) output [31:0]S02_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI RLAST" *) output S02_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI RREADY" *) input S02_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI RRESP" *) output [1:0]S02_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI RVALID" *) output S02_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI WDATA" *) input [31:0]S02_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI WLAST" *) input S02_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI WREADY" *) output S02_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI WSTRB" *) input [3:0]S02_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI WVALID" *) input S02_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S03_AXI, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 4, BUSER_WIDTH 0, CLK_DOMAIN main_design_processing_system7_0_0_FCLK_CLK0, DATA_WIDTH 32, FREQ_HZ 50000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 1, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 0, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE WRITE_ONLY, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [31:0]S03_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWBURST" *) input [1:0]S03_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWCACHE" *) input [3:0]S03_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWLEN" *) input [7:0]S03_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWLOCK" *) input [0:0]S03_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWPROT" *) input [2:0]S03_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWQOS" *) input [3:0]S03_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWREADY" *) output S03_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWSIZE" *) input [2:0]S03_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWUSER" *) input [3:0]S03_AXI_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWVALID" *) input S03_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI BREADY" *) input S03_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI BRESP" *) output [1:0]S03_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI BVALID" *) output S03_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI WDATA" *) input [31:0]S03_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI WLAST" *) input S03_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI WREADY" *) output S03_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI WSTRB" *) input [3:0]S03_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI WVALID" *) input S03_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK, ASSOCIATED_BUSIF M00_AXI:M01_AXI:M02_AXI:M03_AXI:M04_AXI:M05_AXI:M06_AXI:M07_AXI:S00_AXI:S01_AXI:S02_AXI:S03_AXI, ASSOCIATED_CLKEN m_sc_aclken, CLK_DOMAIN main_design_processing_system7_0_0_FCLK_CLK0, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input aresetn;

  wire [31:0]S00_AXI_1_ARADDR;
  wire [1:0]S00_AXI_1_ARBURST;
  wire [3:0]S00_AXI_1_ARCACHE;
  wire [11:0]S00_AXI_1_ARID;
  wire [3:0]S00_AXI_1_ARLEN;
  wire [1:0]S00_AXI_1_ARLOCK;
  wire [2:0]S00_AXI_1_ARPROT;
  wire [3:0]S00_AXI_1_ARQOS;
  wire S00_AXI_1_ARREADY;
  wire [2:0]S00_AXI_1_ARSIZE;
  wire S00_AXI_1_ARVALID;
  wire [31:0]S00_AXI_1_AWADDR;
  wire [1:0]S00_AXI_1_AWBURST;
  wire [3:0]S00_AXI_1_AWCACHE;
  wire [11:0]S00_AXI_1_AWID;
  wire [3:0]S00_AXI_1_AWLEN;
  wire [1:0]S00_AXI_1_AWLOCK;
  wire [2:0]S00_AXI_1_AWPROT;
  wire [3:0]S00_AXI_1_AWQOS;
  wire S00_AXI_1_AWREADY;
  wire [2:0]S00_AXI_1_AWSIZE;
  wire S00_AXI_1_AWVALID;
  wire [11:0]S00_AXI_1_BID;
  wire S00_AXI_1_BREADY;
  wire [1:0]S00_AXI_1_BRESP;
  wire S00_AXI_1_BVALID;
  wire [31:0]S00_AXI_1_RDATA;
  wire [11:0]S00_AXI_1_RID;
  wire S00_AXI_1_RLAST;
  wire S00_AXI_1_RREADY;
  wire [1:0]S00_AXI_1_RRESP;
  wire S00_AXI_1_RVALID;
  wire [31:0]S00_AXI_1_WDATA;
  wire [11:0]S00_AXI_1_WID;
  wire S00_AXI_1_WLAST;
  wire S00_AXI_1_WREADY;
  wire [3:0]S00_AXI_1_WSTRB;
  wire S00_AXI_1_WVALID;
  wire [31:0]S01_AXI_1_ARADDR;
  wire [1:0]S01_AXI_1_ARBURST;
  wire [3:0]S01_AXI_1_ARCACHE;
  wire [7:0]S01_AXI_1_ARLEN;
  wire [0:0]S01_AXI_1_ARLOCK;
  wire [2:0]S01_AXI_1_ARPROT;
  wire [3:0]S01_AXI_1_ARQOS;
  wire S01_AXI_1_ARREADY;
  wire [2:0]S01_AXI_1_ARSIZE;
  wire [3:0]S01_AXI_1_ARUSER;
  wire S01_AXI_1_ARVALID;
  wire [31:0]S01_AXI_1_RDATA;
  wire S01_AXI_1_RLAST;
  wire S01_AXI_1_RREADY;
  wire [1:0]S01_AXI_1_RRESP;
  wire S01_AXI_1_RVALID;
  wire [31:0]S02_AXI_1_ARADDR;
  wire [1:0]S02_AXI_1_ARBURST;
  wire [3:0]S02_AXI_1_ARCACHE;
  wire [7:0]S02_AXI_1_ARLEN;
  wire [0:0]S02_AXI_1_ARLOCK;
  wire [2:0]S02_AXI_1_ARPROT;
  wire [3:0]S02_AXI_1_ARQOS;
  wire S02_AXI_1_ARREADY;
  wire [2:0]S02_AXI_1_ARSIZE;
  wire [3:0]S02_AXI_1_ARUSER;
  wire S02_AXI_1_ARVALID;
  wire [31:0]S02_AXI_1_AWADDR;
  wire [1:0]S02_AXI_1_AWBURST;
  wire [3:0]S02_AXI_1_AWCACHE;
  wire [7:0]S02_AXI_1_AWLEN;
  wire [0:0]S02_AXI_1_AWLOCK;
  wire [2:0]S02_AXI_1_AWPROT;
  wire [3:0]S02_AXI_1_AWQOS;
  wire S02_AXI_1_AWREADY;
  wire [2:0]S02_AXI_1_AWSIZE;
  wire [3:0]S02_AXI_1_AWUSER;
  wire S02_AXI_1_AWVALID;
  wire S02_AXI_1_BREADY;
  wire [1:0]S02_AXI_1_BRESP;
  wire S02_AXI_1_BVALID;
  wire [31:0]S02_AXI_1_RDATA;
  wire S02_AXI_1_RLAST;
  wire S02_AXI_1_RREADY;
  wire [1:0]S02_AXI_1_RRESP;
  wire S02_AXI_1_RVALID;
  wire [31:0]S02_AXI_1_WDATA;
  wire S02_AXI_1_WLAST;
  wire S02_AXI_1_WREADY;
  wire [3:0]S02_AXI_1_WSTRB;
  wire S02_AXI_1_WVALID;
  wire [31:0]S03_AXI_1_AWADDR;
  wire [1:0]S03_AXI_1_AWBURST;
  wire [3:0]S03_AXI_1_AWCACHE;
  wire [7:0]S03_AXI_1_AWLEN;
  wire [0:0]S03_AXI_1_AWLOCK;
  wire [2:0]S03_AXI_1_AWPROT;
  wire [3:0]S03_AXI_1_AWQOS;
  wire S03_AXI_1_AWREADY;
  wire [2:0]S03_AXI_1_AWSIZE;
  wire [3:0]S03_AXI_1_AWUSER;
  wire S03_AXI_1_AWVALID;
  wire S03_AXI_1_BREADY;
  wire [1:0]S03_AXI_1_BRESP;
  wire S03_AXI_1_BVALID;
  wire [31:0]S03_AXI_1_WDATA;
  wire S03_AXI_1_WLAST;
  wire S03_AXI_1_WREADY;
  wire [3:0]S03_AXI_1_WSTRB;
  wire S03_AXI_1_WVALID;
  wire [3:0]S_SC_AR_10_INFO;
  wire [155:0]S_SC_AR_10_PAYLD;
  wire [3:0]S_SC_AR_10_RECV;
  wire [3:0]S_SC_AR_10_REQ;
  wire [3:0]S_SC_AR_10_SEND;
  wire [3:0]S_SC_AR_11_INFO;
  wire [155:0]S_SC_AR_11_PAYLD;
  wire [3:0]S_SC_AR_11_RECV;
  wire [3:0]S_SC_AR_11_REQ;
  wire [3:0]S_SC_AR_11_SEND;
  wire [0:0]S_SC_AR_1_INFO;
  wire [155:0]S_SC_AR_1_PAYLD;
  wire [0:0]S_SC_AR_1_RECV;
  wire S_SC_AR_1_REQ;
  wire S_SC_AR_1_SEND;
  wire [0:0]S_SC_AR_2_INFO;
  wire [155:0]S_SC_AR_2_PAYLD;
  wire [0:0]S_SC_AR_2_RECV;
  wire S_SC_AR_2_REQ;
  wire S_SC_AR_2_SEND;
  wire [0:0]S_SC_AR_3_INFO;
  wire [155:0]S_SC_AR_3_PAYLD;
  wire [0:0]S_SC_AR_3_RECV;
  wire S_SC_AR_3_REQ;
  wire S_SC_AR_3_SEND;
  wire [3:0]S_SC_AR_4_INFO;
  wire [155:0]S_SC_AR_4_PAYLD;
  wire [3:0]S_SC_AR_4_RECV;
  wire [3:0]S_SC_AR_4_REQ;
  wire [3:0]S_SC_AR_4_SEND;
  wire [3:0]S_SC_AR_5_INFO;
  wire [155:0]S_SC_AR_5_PAYLD;
  wire [3:0]S_SC_AR_5_RECV;
  wire [3:0]S_SC_AR_5_REQ;
  wire [3:0]S_SC_AR_5_SEND;
  wire [3:0]S_SC_AR_6_INFO;
  wire [155:0]S_SC_AR_6_PAYLD;
  wire [3:0]S_SC_AR_6_RECV;
  wire [3:0]S_SC_AR_6_REQ;
  wire [3:0]S_SC_AR_6_SEND;
  wire [3:0]S_SC_AR_7_INFO;
  wire [155:0]S_SC_AR_7_PAYLD;
  wire [3:0]S_SC_AR_7_RECV;
  wire [3:0]S_SC_AR_7_REQ;
  wire [3:0]S_SC_AR_7_SEND;
  wire [3:0]S_SC_AR_8_INFO;
  wire [155:0]S_SC_AR_8_PAYLD;
  wire [3:0]S_SC_AR_8_RECV;
  wire [3:0]S_SC_AR_8_REQ;
  wire [3:0]S_SC_AR_8_SEND;
  wire [3:0]S_SC_AR_9_INFO;
  wire [155:0]S_SC_AR_9_PAYLD;
  wire [3:0]S_SC_AR_9_RECV;
  wire [3:0]S_SC_AR_9_REQ;
  wire [3:0]S_SC_AR_9_SEND;
  wire [3:0]S_SC_AW_10_INFO;
  wire [155:0]S_SC_AW_10_PAYLD;
  wire [3:0]S_SC_AW_10_RECV;
  wire [3:0]S_SC_AW_10_REQ;
  wire [3:0]S_SC_AW_10_SEND;
  wire [3:0]S_SC_AW_11_INFO;
  wire [155:0]S_SC_AW_11_PAYLD;
  wire [3:0]S_SC_AW_11_RECV;
  wire [3:0]S_SC_AW_11_REQ;
  wire [3:0]S_SC_AW_11_SEND;
  wire [0:0]S_SC_AW_1_INFO;
  wire [155:0]S_SC_AW_1_PAYLD;
  wire [0:0]S_SC_AW_1_RECV;
  wire S_SC_AW_1_REQ;
  wire S_SC_AW_1_SEND;
  wire [0:0]S_SC_AW_2_INFO;
  wire [155:0]S_SC_AW_2_PAYLD;
  wire [0:0]S_SC_AW_2_RECV;
  wire S_SC_AW_2_REQ;
  wire S_SC_AW_2_SEND;
  wire [0:0]S_SC_AW_3_INFO;
  wire [155:0]S_SC_AW_3_PAYLD;
  wire [0:0]S_SC_AW_3_RECV;
  wire S_SC_AW_3_REQ;
  wire S_SC_AW_3_SEND;
  wire [3:0]S_SC_AW_4_INFO;
  wire [155:0]S_SC_AW_4_PAYLD;
  wire [3:0]S_SC_AW_4_RECV;
  wire [3:0]S_SC_AW_4_REQ;
  wire [3:0]S_SC_AW_4_SEND;
  wire [3:0]S_SC_AW_5_INFO;
  wire [155:0]S_SC_AW_5_PAYLD;
  wire [3:0]S_SC_AW_5_RECV;
  wire [3:0]S_SC_AW_5_REQ;
  wire [3:0]S_SC_AW_5_SEND;
  wire [3:0]S_SC_AW_6_INFO;
  wire [155:0]S_SC_AW_6_PAYLD;
  wire [3:0]S_SC_AW_6_RECV;
  wire [3:0]S_SC_AW_6_REQ;
  wire [3:0]S_SC_AW_6_SEND;
  wire [3:0]S_SC_AW_7_INFO;
  wire [155:0]S_SC_AW_7_PAYLD;
  wire [3:0]S_SC_AW_7_RECV;
  wire [3:0]S_SC_AW_7_REQ;
  wire [3:0]S_SC_AW_7_SEND;
  wire [3:0]S_SC_AW_8_INFO;
  wire [155:0]S_SC_AW_8_PAYLD;
  wire [3:0]S_SC_AW_8_RECV;
  wire [3:0]S_SC_AW_8_REQ;
  wire [3:0]S_SC_AW_8_SEND;
  wire [3:0]S_SC_AW_9_INFO;
  wire [155:0]S_SC_AW_9_PAYLD;
  wire [3:0]S_SC_AW_9_RECV;
  wire [3:0]S_SC_AW_9_REQ;
  wire [3:0]S_SC_AW_9_SEND;
  wire [0:0]S_SC_B_10_INFO;
  wire [11:0]S_SC_B_10_PAYLD;
  wire [0:0]S_SC_B_10_RECV;
  wire S_SC_B_10_REQ;
  wire S_SC_B_10_SEND;
  wire [0:0]S_SC_B_11_INFO;
  wire [11:0]S_SC_B_11_PAYLD;
  wire [0:0]S_SC_B_11_RECV;
  wire S_SC_B_11_REQ;
  wire S_SC_B_11_SEND;
  wire [7:0]S_SC_B_1_INFO;
  wire [11:0]S_SC_B_1_PAYLD;
  wire [7:0]S_SC_B_1_RECV;
  wire [7:0]S_SC_B_1_REQ;
  wire [7:0]S_SC_B_1_SEND;
  wire [7:0]S_SC_B_2_INFO;
  wire [11:0]S_SC_B_2_PAYLD;
  wire [7:0]S_SC_B_2_RECV;
  wire [7:0]S_SC_B_2_REQ;
  wire [7:0]S_SC_B_2_SEND;
  wire [7:0]S_SC_B_3_INFO;
  wire [11:0]S_SC_B_3_PAYLD;
  wire [7:0]S_SC_B_3_RECV;
  wire [7:0]S_SC_B_3_REQ;
  wire [7:0]S_SC_B_3_SEND;
  wire [0:0]S_SC_B_4_INFO;
  wire [11:0]S_SC_B_4_PAYLD;
  wire [0:0]S_SC_B_4_RECV;
  wire S_SC_B_4_REQ;
  wire S_SC_B_4_SEND;
  wire [0:0]S_SC_B_5_INFO;
  wire [11:0]S_SC_B_5_PAYLD;
  wire [0:0]S_SC_B_5_RECV;
  wire S_SC_B_5_REQ;
  wire S_SC_B_5_SEND;
  wire [0:0]S_SC_B_6_INFO;
  wire [11:0]S_SC_B_6_PAYLD;
  wire [0:0]S_SC_B_6_RECV;
  wire S_SC_B_6_REQ;
  wire S_SC_B_6_SEND;
  wire [0:0]S_SC_B_7_INFO;
  wire [11:0]S_SC_B_7_PAYLD;
  wire [0:0]S_SC_B_7_RECV;
  wire S_SC_B_7_REQ;
  wire S_SC_B_7_SEND;
  wire [0:0]S_SC_B_8_INFO;
  wire [11:0]S_SC_B_8_PAYLD;
  wire [0:0]S_SC_B_8_RECV;
  wire S_SC_B_8_REQ;
  wire S_SC_B_8_SEND;
  wire [0:0]S_SC_B_9_INFO;
  wire [11:0]S_SC_B_9_PAYLD;
  wire [0:0]S_SC_B_9_RECV;
  wire S_SC_B_9_REQ;
  wire S_SC_B_9_SEND;
  wire [0:0]S_SC_R_10_INFO;
  wire [89:0]S_SC_R_10_PAYLD;
  wire [0:0]S_SC_R_10_RECV;
  wire S_SC_R_10_REQ;
  wire S_SC_R_10_SEND;
  wire [0:0]S_SC_R_11_INFO;
  wire [89:0]S_SC_R_11_PAYLD;
  wire [0:0]S_SC_R_11_RECV;
  wire S_SC_R_11_REQ;
  wire S_SC_R_11_SEND;
  wire [7:0]S_SC_R_1_INFO;
  wire [89:0]S_SC_R_1_PAYLD;
  wire [7:0]S_SC_R_1_RECV;
  wire [7:0]S_SC_R_1_REQ;
  wire [7:0]S_SC_R_1_SEND;
  wire [7:0]S_SC_R_2_INFO;
  wire [89:0]S_SC_R_2_PAYLD;
  wire [7:0]S_SC_R_2_RECV;
  wire [7:0]S_SC_R_2_REQ;
  wire [7:0]S_SC_R_2_SEND;
  wire [7:0]S_SC_R_3_INFO;
  wire [89:0]S_SC_R_3_PAYLD;
  wire [7:0]S_SC_R_3_RECV;
  wire [7:0]S_SC_R_3_REQ;
  wire [7:0]S_SC_R_3_SEND;
  wire [0:0]S_SC_R_4_INFO;
  wire [89:0]S_SC_R_4_PAYLD;
  wire [0:0]S_SC_R_4_RECV;
  wire S_SC_R_4_REQ;
  wire S_SC_R_4_SEND;
  wire [0:0]S_SC_R_5_INFO;
  wire [89:0]S_SC_R_5_PAYLD;
  wire [0:0]S_SC_R_5_RECV;
  wire S_SC_R_5_REQ;
  wire S_SC_R_5_SEND;
  wire [0:0]S_SC_R_6_INFO;
  wire [89:0]S_SC_R_6_PAYLD;
  wire [0:0]S_SC_R_6_RECV;
  wire S_SC_R_6_REQ;
  wire S_SC_R_6_SEND;
  wire [0:0]S_SC_R_7_INFO;
  wire [89:0]S_SC_R_7_PAYLD;
  wire [0:0]S_SC_R_7_RECV;
  wire S_SC_R_7_REQ;
  wire S_SC_R_7_SEND;
  wire [0:0]S_SC_R_8_INFO;
  wire [89:0]S_SC_R_8_PAYLD;
  wire [0:0]S_SC_R_8_RECV;
  wire S_SC_R_8_REQ;
  wire S_SC_R_8_SEND;
  wire [0:0]S_SC_R_9_INFO;
  wire [89:0]S_SC_R_9_PAYLD;
  wire [0:0]S_SC_R_9_RECV;
  wire S_SC_R_9_REQ;
  wire S_SC_R_9_SEND;
  wire [3:0]S_SC_W_10_INFO;
  wire [94:0]S_SC_W_10_PAYLD;
  wire [3:0]S_SC_W_10_RECV;
  wire [3:0]S_SC_W_10_REQ;
  wire [3:0]S_SC_W_10_SEND;
  wire [3:0]S_SC_W_11_INFO;
  wire [94:0]S_SC_W_11_PAYLD;
  wire [3:0]S_SC_W_11_RECV;
  wire [3:0]S_SC_W_11_REQ;
  wire [3:0]S_SC_W_11_SEND;
  wire [0:0]S_SC_W_1_INFO;
  wire [94:0]S_SC_W_1_PAYLD;
  wire [0:0]S_SC_W_1_RECV;
  wire S_SC_W_1_REQ;
  wire S_SC_W_1_SEND;
  wire [0:0]S_SC_W_2_INFO;
  wire [94:0]S_SC_W_2_PAYLD;
  wire [0:0]S_SC_W_2_RECV;
  wire S_SC_W_2_REQ;
  wire S_SC_W_2_SEND;
  wire [0:0]S_SC_W_3_INFO;
  wire [94:0]S_SC_W_3_PAYLD;
  wire [0:0]S_SC_W_3_RECV;
  wire S_SC_W_3_REQ;
  wire S_SC_W_3_SEND;
  wire [3:0]S_SC_W_4_INFO;
  wire [94:0]S_SC_W_4_PAYLD;
  wire [3:0]S_SC_W_4_RECV;
  wire [3:0]S_SC_W_4_REQ;
  wire [3:0]S_SC_W_4_SEND;
  wire [3:0]S_SC_W_5_INFO;
  wire [94:0]S_SC_W_5_PAYLD;
  wire [3:0]S_SC_W_5_RECV;
  wire [3:0]S_SC_W_5_REQ;
  wire [3:0]S_SC_W_5_SEND;
  wire [3:0]S_SC_W_6_INFO;
  wire [94:0]S_SC_W_6_PAYLD;
  wire [3:0]S_SC_W_6_RECV;
  wire [3:0]S_SC_W_6_REQ;
  wire [3:0]S_SC_W_6_SEND;
  wire [3:0]S_SC_W_7_INFO;
  wire [94:0]S_SC_W_7_PAYLD;
  wire [3:0]S_SC_W_7_RECV;
  wire [3:0]S_SC_W_7_REQ;
  wire [3:0]S_SC_W_7_SEND;
  wire [3:0]S_SC_W_8_INFO;
  wire [94:0]S_SC_W_8_PAYLD;
  wire [3:0]S_SC_W_8_RECV;
  wire [3:0]S_SC_W_8_REQ;
  wire [3:0]S_SC_W_8_SEND;
  wire [3:0]S_SC_W_9_INFO;
  wire [94:0]S_SC_W_9_PAYLD;
  wire [3:0]S_SC_W_9_RECV;
  wire [3:0]S_SC_W_9_REQ;
  wire [3:0]S_SC_W_9_SEND;
  wire aclk_1;
  wire aclk_2;
  wire aclk_3;
  wire aclk_4;
  wire aclk_net;
  wire aresetn_1;
  wire [0:0]aresetn_2;
  wire [0:0]aresetn_3;
  wire [0:0]aresetn_4;
  wire [0:0]aresetn_5;
  wire aresetn_net;
  wire clk_map_M00_ACLK;
  wire clk_map_M01_ACLK;
  wire clk_map_M02_ACLK;
  wire clk_map_M03_ACLK;
  wire clk_map_M04_ACLK;
  wire clk_map_M05_ACLK;
  wire clk_map_M06_ACLK;
  wire clk_map_M07_ACLK;
  wire [31:0]m00_exit_pipeline_m_axi_ARADDR;
  wire [1:0]m00_exit_pipeline_m_axi_ARBURST;
  wire [3:0]m00_exit_pipeline_m_axi_ARCACHE;
  wire [3:0]m00_exit_pipeline_m_axi_ARLEN;
  wire [1:0]m00_exit_pipeline_m_axi_ARLOCK;
  wire [2:0]m00_exit_pipeline_m_axi_ARPROT;
  wire [3:0]m00_exit_pipeline_m_axi_ARQOS;
  wire m00_exit_pipeline_m_axi_ARREADY;
  wire [2:0]m00_exit_pipeline_m_axi_ARSIZE;
  wire [3:0]m00_exit_pipeline_m_axi_ARUSER;
  wire m00_exit_pipeline_m_axi_ARVALID;
  wire [31:0]m00_exit_pipeline_m_axi_AWADDR;
  wire [1:0]m00_exit_pipeline_m_axi_AWBURST;
  wire [3:0]m00_exit_pipeline_m_axi_AWCACHE;
  wire [3:0]m00_exit_pipeline_m_axi_AWLEN;
  wire [1:0]m00_exit_pipeline_m_axi_AWLOCK;
  wire [2:0]m00_exit_pipeline_m_axi_AWPROT;
  wire [3:0]m00_exit_pipeline_m_axi_AWQOS;
  wire m00_exit_pipeline_m_axi_AWREADY;
  wire [2:0]m00_exit_pipeline_m_axi_AWSIZE;
  wire [3:0]m00_exit_pipeline_m_axi_AWUSER;
  wire m00_exit_pipeline_m_axi_AWVALID;
  wire m00_exit_pipeline_m_axi_BREADY;
  wire [1:0]m00_exit_pipeline_m_axi_BRESP;
  wire m00_exit_pipeline_m_axi_BVALID;
  wire [63:0]m00_exit_pipeline_m_axi_RDATA;
  wire m00_exit_pipeline_m_axi_RLAST;
  wire m00_exit_pipeline_m_axi_RREADY;
  wire [1:0]m00_exit_pipeline_m_axi_RRESP;
  wire m00_exit_pipeline_m_axi_RVALID;
  wire [63:0]m00_exit_pipeline_m_axi_WDATA;
  wire m00_exit_pipeline_m_axi_WLAST;
  wire m00_exit_pipeline_m_axi_WREADY;
  wire [7:0]m00_exit_pipeline_m_axi_WSTRB;
  wire m00_exit_pipeline_m_axi_WVALID;
  wire [0:0]m00_nodes_M_SC_AR_INFO;
  wire [155:0]m00_nodes_M_SC_AR_PAYLD;
  wire m00_nodes_M_SC_AR_RECV;
  wire [0:0]m00_nodes_M_SC_AR_REQ;
  wire [0:0]m00_nodes_M_SC_AR_SEND;
  wire [0:0]m00_nodes_M_SC_AW_INFO;
  wire [155:0]m00_nodes_M_SC_AW_PAYLD;
  wire m00_nodes_M_SC_AW_RECV;
  wire [0:0]m00_nodes_M_SC_AW_REQ;
  wire [0:0]m00_nodes_M_SC_AW_SEND;
  wire [3:0]m00_nodes_M_SC_B_INFO;
  wire [11:0]m00_nodes_M_SC_B_PAYLD;
  wire [3:0]m00_nodes_M_SC_B_RECV;
  wire [3:0]m00_nodes_M_SC_B_REQ;
  wire [3:0]m00_nodes_M_SC_B_SEND;
  wire [3:0]m00_nodes_M_SC_R_INFO;
  wire [89:0]m00_nodes_M_SC_R_PAYLD;
  wire [3:0]m00_nodes_M_SC_R_RECV;
  wire [3:0]m00_nodes_M_SC_R_REQ;
  wire [3:0]m00_nodes_M_SC_R_SEND;
  wire [0:0]m00_nodes_M_SC_W_INFO;
  wire [94:0]m00_nodes_M_SC_W_PAYLD;
  wire m00_nodes_M_SC_W_RECV;
  wire [0:0]m00_nodes_M_SC_W_REQ;
  wire [0:0]m00_nodes_M_SC_W_SEND;
  wire [31:0]m00_sc2axi_M_AXI_ARADDR;
  wire [3:0]m00_sc2axi_M_AXI_ARCACHE;
  wire [4:0]m00_sc2axi_M_AXI_ARID;
  wire [7:0]m00_sc2axi_M_AXI_ARLEN;
  wire [0:0]m00_sc2axi_M_AXI_ARLOCK;
  wire [2:0]m00_sc2axi_M_AXI_ARPROT;
  wire [3:0]m00_sc2axi_M_AXI_ARQOS;
  wire m00_sc2axi_M_AXI_ARREADY;
  wire [1023:0]m00_sc2axi_M_AXI_ARUSER;
  wire m00_sc2axi_M_AXI_ARVALID;
  wire [31:0]m00_sc2axi_M_AXI_AWADDR;
  wire [3:0]m00_sc2axi_M_AXI_AWCACHE;
  wire [4:0]m00_sc2axi_M_AXI_AWID;
  wire [7:0]m00_sc2axi_M_AXI_AWLEN;
  wire [0:0]m00_sc2axi_M_AXI_AWLOCK;
  wire [2:0]m00_sc2axi_M_AXI_AWPROT;
  wire [3:0]m00_sc2axi_M_AXI_AWQOS;
  wire m00_sc2axi_M_AXI_AWREADY;
  wire [1023:0]m00_sc2axi_M_AXI_AWUSER;
  wire m00_sc2axi_M_AXI_AWVALID;
  wire [4:0]m00_sc2axi_M_AXI_BID;
  wire m00_sc2axi_M_AXI_BREADY;
  wire [1:0]m00_sc2axi_M_AXI_BRESP;
  wire [1023:0]m00_sc2axi_M_AXI_BUSER;
  wire m00_sc2axi_M_AXI_BVALID;
  wire [63:0]m00_sc2axi_M_AXI_RDATA;
  wire [4:0]m00_sc2axi_M_AXI_RID;
  wire m00_sc2axi_M_AXI_RLAST;
  wire m00_sc2axi_M_AXI_RREADY;
  wire [1:0]m00_sc2axi_M_AXI_RRESP;
  wire [1023:0]m00_sc2axi_M_AXI_RUSER;
  wire m00_sc2axi_M_AXI_RVALID;
  wire [63:0]m00_sc2axi_M_AXI_WDATA;
  wire m00_sc2axi_M_AXI_WLAST;
  wire m00_sc2axi_M_AXI_WREADY;
  wire [7:0]m00_sc2axi_M_AXI_WSTRB;
  wire [1023:0]m00_sc2axi_M_AXI_WUSER;
  wire m00_sc2axi_M_AXI_WVALID;
  wire [11:0]m01_exit_pipeline_m_axi_ARADDR;
  wire [2:0]m01_exit_pipeline_m_axi_ARPROT;
  wire m01_exit_pipeline_m_axi_ARREADY;
  wire m01_exit_pipeline_m_axi_ARVALID;
  wire [11:0]m01_exit_pipeline_m_axi_AWADDR;
  wire [2:0]m01_exit_pipeline_m_axi_AWPROT;
  wire m01_exit_pipeline_m_axi_AWREADY;
  wire m01_exit_pipeline_m_axi_AWVALID;
  wire m01_exit_pipeline_m_axi_BREADY;
  wire [1:0]m01_exit_pipeline_m_axi_BRESP;
  wire m01_exit_pipeline_m_axi_BVALID;
  wire [31:0]m01_exit_pipeline_m_axi_RDATA;
  wire m01_exit_pipeline_m_axi_RREADY;
  wire [1:0]m01_exit_pipeline_m_axi_RRESP;
  wire m01_exit_pipeline_m_axi_RVALID;
  wire [31:0]m01_exit_pipeline_m_axi_WDATA;
  wire m01_exit_pipeline_m_axi_WREADY;
  wire [3:0]m01_exit_pipeline_m_axi_WSTRB;
  wire m01_exit_pipeline_m_axi_WVALID;
  wire [0:0]m01_nodes_M_SC_AR_INFO;
  wire [155:0]m01_nodes_M_SC_AR_PAYLD;
  wire m01_nodes_M_SC_AR_RECV;
  wire [0:0]m01_nodes_M_SC_AR_REQ;
  wire [0:0]m01_nodes_M_SC_AR_SEND;
  wire [0:0]m01_nodes_M_SC_AW_INFO;
  wire [155:0]m01_nodes_M_SC_AW_PAYLD;
  wire m01_nodes_M_SC_AW_RECV;
  wire [0:0]m01_nodes_M_SC_AW_REQ;
  wire [0:0]m01_nodes_M_SC_AW_SEND;
  wire [3:0]m01_nodes_M_SC_B_INFO;
  wire [11:0]m01_nodes_M_SC_B_PAYLD;
  wire [3:0]m01_nodes_M_SC_B_RECV;
  wire [3:0]m01_nodes_M_SC_B_REQ;
  wire [3:0]m01_nodes_M_SC_B_SEND;
  wire [3:0]m01_nodes_M_SC_R_INFO;
  wire [89:0]m01_nodes_M_SC_R_PAYLD;
  wire [3:0]m01_nodes_M_SC_R_RECV;
  wire [3:0]m01_nodes_M_SC_R_REQ;
  wire [3:0]m01_nodes_M_SC_R_SEND;
  wire [0:0]m01_nodes_M_SC_W_INFO;
  wire [94:0]m01_nodes_M_SC_W_PAYLD;
  wire m01_nodes_M_SC_W_RECV;
  wire [0:0]m01_nodes_M_SC_W_REQ;
  wire [0:0]m01_nodes_M_SC_W_SEND;
  wire [11:0]m01_sc2axi_M_AXI_ARADDR;
  wire [3:0]m01_sc2axi_M_AXI_ARCACHE;
  wire [4:0]m01_sc2axi_M_AXI_ARID;
  wire [7:0]m01_sc2axi_M_AXI_ARLEN;
  wire [0:0]m01_sc2axi_M_AXI_ARLOCK;
  wire [2:0]m01_sc2axi_M_AXI_ARPROT;
  wire [3:0]m01_sc2axi_M_AXI_ARQOS;
  wire m01_sc2axi_M_AXI_ARREADY;
  wire [1023:0]m01_sc2axi_M_AXI_ARUSER;
  wire m01_sc2axi_M_AXI_ARVALID;
  wire [11:0]m01_sc2axi_M_AXI_AWADDR;
  wire [3:0]m01_sc2axi_M_AXI_AWCACHE;
  wire [4:0]m01_sc2axi_M_AXI_AWID;
  wire [7:0]m01_sc2axi_M_AXI_AWLEN;
  wire [0:0]m01_sc2axi_M_AXI_AWLOCK;
  wire [2:0]m01_sc2axi_M_AXI_AWPROT;
  wire [3:0]m01_sc2axi_M_AXI_AWQOS;
  wire m01_sc2axi_M_AXI_AWREADY;
  wire [1023:0]m01_sc2axi_M_AXI_AWUSER;
  wire m01_sc2axi_M_AXI_AWVALID;
  wire [4:0]m01_sc2axi_M_AXI_BID;
  wire m01_sc2axi_M_AXI_BREADY;
  wire [1:0]m01_sc2axi_M_AXI_BRESP;
  wire [1023:0]m01_sc2axi_M_AXI_BUSER;
  wire m01_sc2axi_M_AXI_BVALID;
  wire [31:0]m01_sc2axi_M_AXI_RDATA;
  wire [4:0]m01_sc2axi_M_AXI_RID;
  wire m01_sc2axi_M_AXI_RLAST;
  wire m01_sc2axi_M_AXI_RREADY;
  wire [1:0]m01_sc2axi_M_AXI_RRESP;
  wire [1023:0]m01_sc2axi_M_AXI_RUSER;
  wire m01_sc2axi_M_AXI_RVALID;
  wire [31:0]m01_sc2axi_M_AXI_WDATA;
  wire m01_sc2axi_M_AXI_WLAST;
  wire m01_sc2axi_M_AXI_WREADY;
  wire [3:0]m01_sc2axi_M_AXI_WSTRB;
  wire [1023:0]m01_sc2axi_M_AXI_WUSER;
  wire m01_sc2axi_M_AXI_WVALID;
  wire [8:0]m02_exit_pipeline_m_axi_ARADDR;
  wire [2:0]m02_exit_pipeline_m_axi_ARPROT;
  wire m02_exit_pipeline_m_axi_ARREADY;
  wire m02_exit_pipeline_m_axi_ARVALID;
  wire [8:0]m02_exit_pipeline_m_axi_AWADDR;
  wire [2:0]m02_exit_pipeline_m_axi_AWPROT;
  wire m02_exit_pipeline_m_axi_AWREADY;
  wire m02_exit_pipeline_m_axi_AWVALID;
  wire m02_exit_pipeline_m_axi_BREADY;
  wire [1:0]m02_exit_pipeline_m_axi_BRESP;
  wire m02_exit_pipeline_m_axi_BVALID;
  wire [31:0]m02_exit_pipeline_m_axi_RDATA;
  wire m02_exit_pipeline_m_axi_RREADY;
  wire [1:0]m02_exit_pipeline_m_axi_RRESP;
  wire m02_exit_pipeline_m_axi_RVALID;
  wire [31:0]m02_exit_pipeline_m_axi_WDATA;
  wire m02_exit_pipeline_m_axi_WREADY;
  wire [3:0]m02_exit_pipeline_m_axi_WSTRB;
  wire m02_exit_pipeline_m_axi_WVALID;
  wire [0:0]m02_nodes_M_SC_AR_INFO;
  wire [155:0]m02_nodes_M_SC_AR_PAYLD;
  wire m02_nodes_M_SC_AR_RECV;
  wire [0:0]m02_nodes_M_SC_AR_REQ;
  wire [0:0]m02_nodes_M_SC_AR_SEND;
  wire [0:0]m02_nodes_M_SC_AW_INFO;
  wire [155:0]m02_nodes_M_SC_AW_PAYLD;
  wire m02_nodes_M_SC_AW_RECV;
  wire [0:0]m02_nodes_M_SC_AW_REQ;
  wire [0:0]m02_nodes_M_SC_AW_SEND;
  wire [3:0]m02_nodes_M_SC_B_INFO;
  wire [11:0]m02_nodes_M_SC_B_PAYLD;
  wire [3:0]m02_nodes_M_SC_B_RECV;
  wire [3:0]m02_nodes_M_SC_B_REQ;
  wire [3:0]m02_nodes_M_SC_B_SEND;
  wire [3:0]m02_nodes_M_SC_R_INFO;
  wire [89:0]m02_nodes_M_SC_R_PAYLD;
  wire [3:0]m02_nodes_M_SC_R_RECV;
  wire [3:0]m02_nodes_M_SC_R_REQ;
  wire [3:0]m02_nodes_M_SC_R_SEND;
  wire [0:0]m02_nodes_M_SC_W_INFO;
  wire [94:0]m02_nodes_M_SC_W_PAYLD;
  wire m02_nodes_M_SC_W_RECV;
  wire [0:0]m02_nodes_M_SC_W_REQ;
  wire [0:0]m02_nodes_M_SC_W_SEND;
  wire [8:0]m02_sc2axi_M_AXI_ARADDR;
  wire [3:0]m02_sc2axi_M_AXI_ARCACHE;
  wire [4:0]m02_sc2axi_M_AXI_ARID;
  wire [7:0]m02_sc2axi_M_AXI_ARLEN;
  wire [0:0]m02_sc2axi_M_AXI_ARLOCK;
  wire [2:0]m02_sc2axi_M_AXI_ARPROT;
  wire [3:0]m02_sc2axi_M_AXI_ARQOS;
  wire m02_sc2axi_M_AXI_ARREADY;
  wire [1023:0]m02_sc2axi_M_AXI_ARUSER;
  wire m02_sc2axi_M_AXI_ARVALID;
  wire [8:0]m02_sc2axi_M_AXI_AWADDR;
  wire [3:0]m02_sc2axi_M_AXI_AWCACHE;
  wire [4:0]m02_sc2axi_M_AXI_AWID;
  wire [7:0]m02_sc2axi_M_AXI_AWLEN;
  wire [0:0]m02_sc2axi_M_AXI_AWLOCK;
  wire [2:0]m02_sc2axi_M_AXI_AWPROT;
  wire [3:0]m02_sc2axi_M_AXI_AWQOS;
  wire m02_sc2axi_M_AXI_AWREADY;
  wire [1023:0]m02_sc2axi_M_AXI_AWUSER;
  wire m02_sc2axi_M_AXI_AWVALID;
  wire [4:0]m02_sc2axi_M_AXI_BID;
  wire m02_sc2axi_M_AXI_BREADY;
  wire [1:0]m02_sc2axi_M_AXI_BRESP;
  wire [1023:0]m02_sc2axi_M_AXI_BUSER;
  wire m02_sc2axi_M_AXI_BVALID;
  wire [31:0]m02_sc2axi_M_AXI_RDATA;
  wire [4:0]m02_sc2axi_M_AXI_RID;
  wire m02_sc2axi_M_AXI_RLAST;
  wire m02_sc2axi_M_AXI_RREADY;
  wire [1:0]m02_sc2axi_M_AXI_RRESP;
  wire [1023:0]m02_sc2axi_M_AXI_RUSER;
  wire m02_sc2axi_M_AXI_RVALID;
  wire [31:0]m02_sc2axi_M_AXI_WDATA;
  wire m02_sc2axi_M_AXI_WLAST;
  wire m02_sc2axi_M_AXI_WREADY;
  wire [3:0]m02_sc2axi_M_AXI_WSTRB;
  wire [1023:0]m02_sc2axi_M_AXI_WUSER;
  wire m02_sc2axi_M_AXI_WVALID;
  wire [8:0]m03_exit_pipeline_m_axi_ARADDR;
  wire [2:0]m03_exit_pipeline_m_axi_ARPROT;
  wire m03_exit_pipeline_m_axi_ARREADY;
  wire m03_exit_pipeline_m_axi_ARVALID;
  wire [8:0]m03_exit_pipeline_m_axi_AWADDR;
  wire [2:0]m03_exit_pipeline_m_axi_AWPROT;
  wire m03_exit_pipeline_m_axi_AWREADY;
  wire m03_exit_pipeline_m_axi_AWVALID;
  wire m03_exit_pipeline_m_axi_BREADY;
  wire [1:0]m03_exit_pipeline_m_axi_BRESP;
  wire m03_exit_pipeline_m_axi_BVALID;
  wire [31:0]m03_exit_pipeline_m_axi_RDATA;
  wire m03_exit_pipeline_m_axi_RREADY;
  wire [1:0]m03_exit_pipeline_m_axi_RRESP;
  wire m03_exit_pipeline_m_axi_RVALID;
  wire [31:0]m03_exit_pipeline_m_axi_WDATA;
  wire m03_exit_pipeline_m_axi_WREADY;
  wire [3:0]m03_exit_pipeline_m_axi_WSTRB;
  wire m03_exit_pipeline_m_axi_WVALID;
  wire [0:0]m03_nodes_M_SC_AR_INFO;
  wire [155:0]m03_nodes_M_SC_AR_PAYLD;
  wire m03_nodes_M_SC_AR_RECV;
  wire [0:0]m03_nodes_M_SC_AR_REQ;
  wire [0:0]m03_nodes_M_SC_AR_SEND;
  wire [0:0]m03_nodes_M_SC_AW_INFO;
  wire [155:0]m03_nodes_M_SC_AW_PAYLD;
  wire m03_nodes_M_SC_AW_RECV;
  wire [0:0]m03_nodes_M_SC_AW_REQ;
  wire [0:0]m03_nodes_M_SC_AW_SEND;
  wire [3:0]m03_nodes_M_SC_B_INFO;
  wire [11:0]m03_nodes_M_SC_B_PAYLD;
  wire [3:0]m03_nodes_M_SC_B_RECV;
  wire [3:0]m03_nodes_M_SC_B_REQ;
  wire [3:0]m03_nodes_M_SC_B_SEND;
  wire [3:0]m03_nodes_M_SC_R_INFO;
  wire [89:0]m03_nodes_M_SC_R_PAYLD;
  wire [3:0]m03_nodes_M_SC_R_RECV;
  wire [3:0]m03_nodes_M_SC_R_REQ;
  wire [3:0]m03_nodes_M_SC_R_SEND;
  wire [0:0]m03_nodes_M_SC_W_INFO;
  wire [94:0]m03_nodes_M_SC_W_PAYLD;
  wire m03_nodes_M_SC_W_RECV;
  wire [0:0]m03_nodes_M_SC_W_REQ;
  wire [0:0]m03_nodes_M_SC_W_SEND;
  wire [8:0]m03_sc2axi_M_AXI_ARADDR;
  wire [3:0]m03_sc2axi_M_AXI_ARCACHE;
  wire [4:0]m03_sc2axi_M_AXI_ARID;
  wire [7:0]m03_sc2axi_M_AXI_ARLEN;
  wire [0:0]m03_sc2axi_M_AXI_ARLOCK;
  wire [2:0]m03_sc2axi_M_AXI_ARPROT;
  wire [3:0]m03_sc2axi_M_AXI_ARQOS;
  wire m03_sc2axi_M_AXI_ARREADY;
  wire [1023:0]m03_sc2axi_M_AXI_ARUSER;
  wire m03_sc2axi_M_AXI_ARVALID;
  wire [8:0]m03_sc2axi_M_AXI_AWADDR;
  wire [3:0]m03_sc2axi_M_AXI_AWCACHE;
  wire [4:0]m03_sc2axi_M_AXI_AWID;
  wire [7:0]m03_sc2axi_M_AXI_AWLEN;
  wire [0:0]m03_sc2axi_M_AXI_AWLOCK;
  wire [2:0]m03_sc2axi_M_AXI_AWPROT;
  wire [3:0]m03_sc2axi_M_AXI_AWQOS;
  wire m03_sc2axi_M_AXI_AWREADY;
  wire [1023:0]m03_sc2axi_M_AXI_AWUSER;
  wire m03_sc2axi_M_AXI_AWVALID;
  wire [4:0]m03_sc2axi_M_AXI_BID;
  wire m03_sc2axi_M_AXI_BREADY;
  wire [1:0]m03_sc2axi_M_AXI_BRESP;
  wire [1023:0]m03_sc2axi_M_AXI_BUSER;
  wire m03_sc2axi_M_AXI_BVALID;
  wire [31:0]m03_sc2axi_M_AXI_RDATA;
  wire [4:0]m03_sc2axi_M_AXI_RID;
  wire m03_sc2axi_M_AXI_RLAST;
  wire m03_sc2axi_M_AXI_RREADY;
  wire [1:0]m03_sc2axi_M_AXI_RRESP;
  wire [1023:0]m03_sc2axi_M_AXI_RUSER;
  wire m03_sc2axi_M_AXI_RVALID;
  wire [31:0]m03_sc2axi_M_AXI_WDATA;
  wire m03_sc2axi_M_AXI_WLAST;
  wire m03_sc2axi_M_AXI_WREADY;
  wire [3:0]m03_sc2axi_M_AXI_WSTRB;
  wire [1023:0]m03_sc2axi_M_AXI_WUSER;
  wire m03_sc2axi_M_AXI_WVALID;
  wire [2:0]m04_exit_pipeline_m_axi_ARADDR;
  wire [1:0]m04_exit_pipeline_m_axi_ARBURST;
  wire [3:0]m04_exit_pipeline_m_axi_ARCACHE;
  wire [7:0]m04_exit_pipeline_m_axi_ARLEN;
  wire [0:0]m04_exit_pipeline_m_axi_ARLOCK;
  wire [2:0]m04_exit_pipeline_m_axi_ARPROT;
  wire [3:0]m04_exit_pipeline_m_axi_ARQOS;
  wire m04_exit_pipeline_m_axi_ARREADY;
  wire [2:0]m04_exit_pipeline_m_axi_ARSIZE;
  wire [3:0]m04_exit_pipeline_m_axi_ARUSER;
  wire m04_exit_pipeline_m_axi_ARVALID;
  wire [2:0]m04_exit_pipeline_m_axi_AWADDR;
  wire [1:0]m04_exit_pipeline_m_axi_AWBURST;
  wire [3:0]m04_exit_pipeline_m_axi_AWCACHE;
  wire [7:0]m04_exit_pipeline_m_axi_AWLEN;
  wire [0:0]m04_exit_pipeline_m_axi_AWLOCK;
  wire [2:0]m04_exit_pipeline_m_axi_AWPROT;
  wire [3:0]m04_exit_pipeline_m_axi_AWQOS;
  wire m04_exit_pipeline_m_axi_AWREADY;
  wire [2:0]m04_exit_pipeline_m_axi_AWSIZE;
  wire [3:0]m04_exit_pipeline_m_axi_AWUSER;
  wire m04_exit_pipeline_m_axi_AWVALID;
  wire m04_exit_pipeline_m_axi_BREADY;
  wire [1:0]m04_exit_pipeline_m_axi_BRESP;
  wire m04_exit_pipeline_m_axi_BVALID;
  wire [31:0]m04_exit_pipeline_m_axi_RDATA;
  wire m04_exit_pipeline_m_axi_RLAST;
  wire m04_exit_pipeline_m_axi_RREADY;
  wire [1:0]m04_exit_pipeline_m_axi_RRESP;
  wire m04_exit_pipeline_m_axi_RVALID;
  wire [31:0]m04_exit_pipeline_m_axi_WDATA;
  wire m04_exit_pipeline_m_axi_WLAST;
  wire m04_exit_pipeline_m_axi_WREADY;
  wire [3:0]m04_exit_pipeline_m_axi_WSTRB;
  wire m04_exit_pipeline_m_axi_WVALID;
  wire [0:0]m04_nodes_M_SC_AR_INFO;
  wire [155:0]m04_nodes_M_SC_AR_PAYLD;
  wire m04_nodes_M_SC_AR_RECV;
  wire [0:0]m04_nodes_M_SC_AR_REQ;
  wire [0:0]m04_nodes_M_SC_AR_SEND;
  wire [0:0]m04_nodes_M_SC_AW_INFO;
  wire [155:0]m04_nodes_M_SC_AW_PAYLD;
  wire m04_nodes_M_SC_AW_RECV;
  wire [0:0]m04_nodes_M_SC_AW_REQ;
  wire [0:0]m04_nodes_M_SC_AW_SEND;
  wire [3:0]m04_nodes_M_SC_B_INFO;
  wire [11:0]m04_nodes_M_SC_B_PAYLD;
  wire [3:0]m04_nodes_M_SC_B_RECV;
  wire [3:0]m04_nodes_M_SC_B_REQ;
  wire [3:0]m04_nodes_M_SC_B_SEND;
  wire [3:0]m04_nodes_M_SC_R_INFO;
  wire [89:0]m04_nodes_M_SC_R_PAYLD;
  wire [3:0]m04_nodes_M_SC_R_RECV;
  wire [3:0]m04_nodes_M_SC_R_REQ;
  wire [3:0]m04_nodes_M_SC_R_SEND;
  wire [0:0]m04_nodes_M_SC_W_INFO;
  wire [94:0]m04_nodes_M_SC_W_PAYLD;
  wire m04_nodes_M_SC_W_RECV;
  wire [0:0]m04_nodes_M_SC_W_REQ;
  wire [0:0]m04_nodes_M_SC_W_SEND;
  wire [2:0]m04_sc2axi_M_AXI_ARADDR;
  wire [3:0]m04_sc2axi_M_AXI_ARCACHE;
  wire [4:0]m04_sc2axi_M_AXI_ARID;
  wire [7:0]m04_sc2axi_M_AXI_ARLEN;
  wire [0:0]m04_sc2axi_M_AXI_ARLOCK;
  wire [2:0]m04_sc2axi_M_AXI_ARPROT;
  wire [3:0]m04_sc2axi_M_AXI_ARQOS;
  wire m04_sc2axi_M_AXI_ARREADY;
  wire [1023:0]m04_sc2axi_M_AXI_ARUSER;
  wire m04_sc2axi_M_AXI_ARVALID;
  wire [2:0]m04_sc2axi_M_AXI_AWADDR;
  wire [3:0]m04_sc2axi_M_AXI_AWCACHE;
  wire [4:0]m04_sc2axi_M_AXI_AWID;
  wire [7:0]m04_sc2axi_M_AXI_AWLEN;
  wire [0:0]m04_sc2axi_M_AXI_AWLOCK;
  wire [2:0]m04_sc2axi_M_AXI_AWPROT;
  wire [3:0]m04_sc2axi_M_AXI_AWQOS;
  wire m04_sc2axi_M_AXI_AWREADY;
  wire [1023:0]m04_sc2axi_M_AXI_AWUSER;
  wire m04_sc2axi_M_AXI_AWVALID;
  wire [4:0]m04_sc2axi_M_AXI_BID;
  wire m04_sc2axi_M_AXI_BREADY;
  wire [1:0]m04_sc2axi_M_AXI_BRESP;
  wire [1023:0]m04_sc2axi_M_AXI_BUSER;
  wire m04_sc2axi_M_AXI_BVALID;
  wire [31:0]m04_sc2axi_M_AXI_RDATA;
  wire [4:0]m04_sc2axi_M_AXI_RID;
  wire m04_sc2axi_M_AXI_RLAST;
  wire m04_sc2axi_M_AXI_RREADY;
  wire [1:0]m04_sc2axi_M_AXI_RRESP;
  wire [1023:0]m04_sc2axi_M_AXI_RUSER;
  wire m04_sc2axi_M_AXI_RVALID;
  wire [31:0]m04_sc2axi_M_AXI_WDATA;
  wire m04_sc2axi_M_AXI_WLAST;
  wire m04_sc2axi_M_AXI_WREADY;
  wire [3:0]m04_sc2axi_M_AXI_WSTRB;
  wire [1023:0]m04_sc2axi_M_AXI_WUSER;
  wire m04_sc2axi_M_AXI_WVALID;
  wire [2:0]m05_exit_pipeline_m_axi_ARADDR;
  wire [1:0]m05_exit_pipeline_m_axi_ARBURST;
  wire [3:0]m05_exit_pipeline_m_axi_ARCACHE;
  wire [7:0]m05_exit_pipeline_m_axi_ARLEN;
  wire [0:0]m05_exit_pipeline_m_axi_ARLOCK;
  wire [2:0]m05_exit_pipeline_m_axi_ARPROT;
  wire [3:0]m05_exit_pipeline_m_axi_ARQOS;
  wire m05_exit_pipeline_m_axi_ARREADY;
  wire [2:0]m05_exit_pipeline_m_axi_ARSIZE;
  wire [3:0]m05_exit_pipeline_m_axi_ARUSER;
  wire m05_exit_pipeline_m_axi_ARVALID;
  wire [2:0]m05_exit_pipeline_m_axi_AWADDR;
  wire [1:0]m05_exit_pipeline_m_axi_AWBURST;
  wire [3:0]m05_exit_pipeline_m_axi_AWCACHE;
  wire [7:0]m05_exit_pipeline_m_axi_AWLEN;
  wire [0:0]m05_exit_pipeline_m_axi_AWLOCK;
  wire [2:0]m05_exit_pipeline_m_axi_AWPROT;
  wire [3:0]m05_exit_pipeline_m_axi_AWQOS;
  wire m05_exit_pipeline_m_axi_AWREADY;
  wire [2:0]m05_exit_pipeline_m_axi_AWSIZE;
  wire [3:0]m05_exit_pipeline_m_axi_AWUSER;
  wire m05_exit_pipeline_m_axi_AWVALID;
  wire m05_exit_pipeline_m_axi_BREADY;
  wire [1:0]m05_exit_pipeline_m_axi_BRESP;
  wire m05_exit_pipeline_m_axi_BVALID;
  wire [31:0]m05_exit_pipeline_m_axi_RDATA;
  wire m05_exit_pipeline_m_axi_RLAST;
  wire m05_exit_pipeline_m_axi_RREADY;
  wire [1:0]m05_exit_pipeline_m_axi_RRESP;
  wire m05_exit_pipeline_m_axi_RVALID;
  wire [31:0]m05_exit_pipeline_m_axi_WDATA;
  wire m05_exit_pipeline_m_axi_WLAST;
  wire m05_exit_pipeline_m_axi_WREADY;
  wire [3:0]m05_exit_pipeline_m_axi_WSTRB;
  wire m05_exit_pipeline_m_axi_WVALID;
  wire [0:0]m05_nodes_M_SC_AR_INFO;
  wire [155:0]m05_nodes_M_SC_AR_PAYLD;
  wire m05_nodes_M_SC_AR_RECV;
  wire [0:0]m05_nodes_M_SC_AR_REQ;
  wire [0:0]m05_nodes_M_SC_AR_SEND;
  wire [0:0]m05_nodes_M_SC_AW_INFO;
  wire [155:0]m05_nodes_M_SC_AW_PAYLD;
  wire m05_nodes_M_SC_AW_RECV;
  wire [0:0]m05_nodes_M_SC_AW_REQ;
  wire [0:0]m05_nodes_M_SC_AW_SEND;
  wire [3:0]m05_nodes_M_SC_B_INFO;
  wire [11:0]m05_nodes_M_SC_B_PAYLD;
  wire [3:0]m05_nodes_M_SC_B_RECV;
  wire [3:0]m05_nodes_M_SC_B_REQ;
  wire [3:0]m05_nodes_M_SC_B_SEND;
  wire [3:0]m05_nodes_M_SC_R_INFO;
  wire [89:0]m05_nodes_M_SC_R_PAYLD;
  wire [3:0]m05_nodes_M_SC_R_RECV;
  wire [3:0]m05_nodes_M_SC_R_REQ;
  wire [3:0]m05_nodes_M_SC_R_SEND;
  wire [0:0]m05_nodes_M_SC_W_INFO;
  wire [94:0]m05_nodes_M_SC_W_PAYLD;
  wire m05_nodes_M_SC_W_RECV;
  wire [0:0]m05_nodes_M_SC_W_REQ;
  wire [0:0]m05_nodes_M_SC_W_SEND;
  wire [2:0]m05_sc2axi_M_AXI_ARADDR;
  wire [3:0]m05_sc2axi_M_AXI_ARCACHE;
  wire [4:0]m05_sc2axi_M_AXI_ARID;
  wire [7:0]m05_sc2axi_M_AXI_ARLEN;
  wire [0:0]m05_sc2axi_M_AXI_ARLOCK;
  wire [2:0]m05_sc2axi_M_AXI_ARPROT;
  wire [3:0]m05_sc2axi_M_AXI_ARQOS;
  wire m05_sc2axi_M_AXI_ARREADY;
  wire [1023:0]m05_sc2axi_M_AXI_ARUSER;
  wire m05_sc2axi_M_AXI_ARVALID;
  wire [2:0]m05_sc2axi_M_AXI_AWADDR;
  wire [3:0]m05_sc2axi_M_AXI_AWCACHE;
  wire [4:0]m05_sc2axi_M_AXI_AWID;
  wire [7:0]m05_sc2axi_M_AXI_AWLEN;
  wire [0:0]m05_sc2axi_M_AXI_AWLOCK;
  wire [2:0]m05_sc2axi_M_AXI_AWPROT;
  wire [3:0]m05_sc2axi_M_AXI_AWQOS;
  wire m05_sc2axi_M_AXI_AWREADY;
  wire [1023:0]m05_sc2axi_M_AXI_AWUSER;
  wire m05_sc2axi_M_AXI_AWVALID;
  wire [4:0]m05_sc2axi_M_AXI_BID;
  wire m05_sc2axi_M_AXI_BREADY;
  wire [1:0]m05_sc2axi_M_AXI_BRESP;
  wire [1023:0]m05_sc2axi_M_AXI_BUSER;
  wire m05_sc2axi_M_AXI_BVALID;
  wire [31:0]m05_sc2axi_M_AXI_RDATA;
  wire [4:0]m05_sc2axi_M_AXI_RID;
  wire m05_sc2axi_M_AXI_RLAST;
  wire m05_sc2axi_M_AXI_RREADY;
  wire [1:0]m05_sc2axi_M_AXI_RRESP;
  wire [1023:0]m05_sc2axi_M_AXI_RUSER;
  wire m05_sc2axi_M_AXI_RVALID;
  wire [31:0]m05_sc2axi_M_AXI_WDATA;
  wire m05_sc2axi_M_AXI_WLAST;
  wire m05_sc2axi_M_AXI_WREADY;
  wire [3:0]m05_sc2axi_M_AXI_WSTRB;
  wire [1023:0]m05_sc2axi_M_AXI_WUSER;
  wire m05_sc2axi_M_AXI_WVALID;
  wire [4:0]m06_exit_pipeline_m_axi_ARADDR;
  wire [2:0]m06_exit_pipeline_m_axi_ARPROT;
  wire m06_exit_pipeline_m_axi_ARREADY;
  wire m06_exit_pipeline_m_axi_ARVALID;
  wire [4:0]m06_exit_pipeline_m_axi_AWADDR;
  wire [2:0]m06_exit_pipeline_m_axi_AWPROT;
  wire m06_exit_pipeline_m_axi_AWREADY;
  wire m06_exit_pipeline_m_axi_AWVALID;
  wire m06_exit_pipeline_m_axi_BREADY;
  wire [1:0]m06_exit_pipeline_m_axi_BRESP;
  wire m06_exit_pipeline_m_axi_BVALID;
  wire [31:0]m06_exit_pipeline_m_axi_RDATA;
  wire m06_exit_pipeline_m_axi_RREADY;
  wire [1:0]m06_exit_pipeline_m_axi_RRESP;
  wire m06_exit_pipeline_m_axi_RVALID;
  wire [31:0]m06_exit_pipeline_m_axi_WDATA;
  wire m06_exit_pipeline_m_axi_WREADY;
  wire [3:0]m06_exit_pipeline_m_axi_WSTRB;
  wire m06_exit_pipeline_m_axi_WVALID;
  wire [0:0]m06_nodes_M_SC_AR_INFO;
  wire [155:0]m06_nodes_M_SC_AR_PAYLD;
  wire m06_nodes_M_SC_AR_RECV;
  wire [0:0]m06_nodes_M_SC_AR_REQ;
  wire [0:0]m06_nodes_M_SC_AR_SEND;
  wire [0:0]m06_nodes_M_SC_AW_INFO;
  wire [155:0]m06_nodes_M_SC_AW_PAYLD;
  wire m06_nodes_M_SC_AW_RECV;
  wire [0:0]m06_nodes_M_SC_AW_REQ;
  wire [0:0]m06_nodes_M_SC_AW_SEND;
  wire [3:0]m06_nodes_M_SC_B_INFO;
  wire [11:0]m06_nodes_M_SC_B_PAYLD;
  wire [3:0]m06_nodes_M_SC_B_RECV;
  wire [3:0]m06_nodes_M_SC_B_REQ;
  wire [3:0]m06_nodes_M_SC_B_SEND;
  wire [3:0]m06_nodes_M_SC_R_INFO;
  wire [89:0]m06_nodes_M_SC_R_PAYLD;
  wire [3:0]m06_nodes_M_SC_R_RECV;
  wire [3:0]m06_nodes_M_SC_R_REQ;
  wire [3:0]m06_nodes_M_SC_R_SEND;
  wire [0:0]m06_nodes_M_SC_W_INFO;
  wire [94:0]m06_nodes_M_SC_W_PAYLD;
  wire m06_nodes_M_SC_W_RECV;
  wire [0:0]m06_nodes_M_SC_W_REQ;
  wire [0:0]m06_nodes_M_SC_W_SEND;
  wire [4:0]m06_sc2axi_M_AXI_ARADDR;
  wire [3:0]m06_sc2axi_M_AXI_ARCACHE;
  wire [4:0]m06_sc2axi_M_AXI_ARID;
  wire [7:0]m06_sc2axi_M_AXI_ARLEN;
  wire [0:0]m06_sc2axi_M_AXI_ARLOCK;
  wire [2:0]m06_sc2axi_M_AXI_ARPROT;
  wire [3:0]m06_sc2axi_M_AXI_ARQOS;
  wire m06_sc2axi_M_AXI_ARREADY;
  wire [1023:0]m06_sc2axi_M_AXI_ARUSER;
  wire m06_sc2axi_M_AXI_ARVALID;
  wire [4:0]m06_sc2axi_M_AXI_AWADDR;
  wire [3:0]m06_sc2axi_M_AXI_AWCACHE;
  wire [4:0]m06_sc2axi_M_AXI_AWID;
  wire [7:0]m06_sc2axi_M_AXI_AWLEN;
  wire [0:0]m06_sc2axi_M_AXI_AWLOCK;
  wire [2:0]m06_sc2axi_M_AXI_AWPROT;
  wire [3:0]m06_sc2axi_M_AXI_AWQOS;
  wire m06_sc2axi_M_AXI_AWREADY;
  wire [1023:0]m06_sc2axi_M_AXI_AWUSER;
  wire m06_sc2axi_M_AXI_AWVALID;
  wire [4:0]m06_sc2axi_M_AXI_BID;
  wire m06_sc2axi_M_AXI_BREADY;
  wire [1:0]m06_sc2axi_M_AXI_BRESP;
  wire [1023:0]m06_sc2axi_M_AXI_BUSER;
  wire m06_sc2axi_M_AXI_BVALID;
  wire [31:0]m06_sc2axi_M_AXI_RDATA;
  wire [4:0]m06_sc2axi_M_AXI_RID;
  wire m06_sc2axi_M_AXI_RLAST;
  wire m06_sc2axi_M_AXI_RREADY;
  wire [1:0]m06_sc2axi_M_AXI_RRESP;
  wire [1023:0]m06_sc2axi_M_AXI_RUSER;
  wire m06_sc2axi_M_AXI_RVALID;
  wire [31:0]m06_sc2axi_M_AXI_WDATA;
  wire m06_sc2axi_M_AXI_WLAST;
  wire m06_sc2axi_M_AXI_WREADY;
  wire [3:0]m06_sc2axi_M_AXI_WSTRB;
  wire [1023:0]m06_sc2axi_M_AXI_WUSER;
  wire m06_sc2axi_M_AXI_WVALID;
  wire [12:0]m07_exit_pipeline_m_axi_ARADDR;
  wire [2:0]m07_exit_pipeline_m_axi_ARPROT;
  wire m07_exit_pipeline_m_axi_ARREADY;
  wire m07_exit_pipeline_m_axi_ARVALID;
  wire [12:0]m07_exit_pipeline_m_axi_AWADDR;
  wire [2:0]m07_exit_pipeline_m_axi_AWPROT;
  wire m07_exit_pipeline_m_axi_AWREADY;
  wire m07_exit_pipeline_m_axi_AWVALID;
  wire m07_exit_pipeline_m_axi_BREADY;
  wire [1:0]m07_exit_pipeline_m_axi_BRESP;
  wire m07_exit_pipeline_m_axi_BVALID;
  wire [31:0]m07_exit_pipeline_m_axi_RDATA;
  wire m07_exit_pipeline_m_axi_RREADY;
  wire [1:0]m07_exit_pipeline_m_axi_RRESP;
  wire m07_exit_pipeline_m_axi_RVALID;
  wire [31:0]m07_exit_pipeline_m_axi_WDATA;
  wire m07_exit_pipeline_m_axi_WREADY;
  wire [3:0]m07_exit_pipeline_m_axi_WSTRB;
  wire m07_exit_pipeline_m_axi_WVALID;
  wire [0:0]m07_nodes_M_SC_AR_INFO;
  wire [155:0]m07_nodes_M_SC_AR_PAYLD;
  wire m07_nodes_M_SC_AR_RECV;
  wire [0:0]m07_nodes_M_SC_AR_REQ;
  wire [0:0]m07_nodes_M_SC_AR_SEND;
  wire [0:0]m07_nodes_M_SC_AW_INFO;
  wire [155:0]m07_nodes_M_SC_AW_PAYLD;
  wire m07_nodes_M_SC_AW_RECV;
  wire [0:0]m07_nodes_M_SC_AW_REQ;
  wire [0:0]m07_nodes_M_SC_AW_SEND;
  wire [3:0]m07_nodes_M_SC_B_INFO;
  wire [11:0]m07_nodes_M_SC_B_PAYLD;
  wire [3:0]m07_nodes_M_SC_B_RECV;
  wire [3:0]m07_nodes_M_SC_B_REQ;
  wire [3:0]m07_nodes_M_SC_B_SEND;
  wire [3:0]m07_nodes_M_SC_R_INFO;
  wire [89:0]m07_nodes_M_SC_R_PAYLD;
  wire [3:0]m07_nodes_M_SC_R_RECV;
  wire [3:0]m07_nodes_M_SC_R_REQ;
  wire [3:0]m07_nodes_M_SC_R_SEND;
  wire [0:0]m07_nodes_M_SC_W_INFO;
  wire [94:0]m07_nodes_M_SC_W_PAYLD;
  wire m07_nodes_M_SC_W_RECV;
  wire [0:0]m07_nodes_M_SC_W_REQ;
  wire [0:0]m07_nodes_M_SC_W_SEND;
  wire [12:0]m07_sc2axi_M_AXI_ARADDR;
  wire [3:0]m07_sc2axi_M_AXI_ARCACHE;
  wire [4:0]m07_sc2axi_M_AXI_ARID;
  wire [7:0]m07_sc2axi_M_AXI_ARLEN;
  wire [0:0]m07_sc2axi_M_AXI_ARLOCK;
  wire [2:0]m07_sc2axi_M_AXI_ARPROT;
  wire [3:0]m07_sc2axi_M_AXI_ARQOS;
  wire m07_sc2axi_M_AXI_ARREADY;
  wire [1023:0]m07_sc2axi_M_AXI_ARUSER;
  wire m07_sc2axi_M_AXI_ARVALID;
  wire [12:0]m07_sc2axi_M_AXI_AWADDR;
  wire [3:0]m07_sc2axi_M_AXI_AWCACHE;
  wire [4:0]m07_sc2axi_M_AXI_AWID;
  wire [7:0]m07_sc2axi_M_AXI_AWLEN;
  wire [0:0]m07_sc2axi_M_AXI_AWLOCK;
  wire [2:0]m07_sc2axi_M_AXI_AWPROT;
  wire [3:0]m07_sc2axi_M_AXI_AWQOS;
  wire m07_sc2axi_M_AXI_AWREADY;
  wire [1023:0]m07_sc2axi_M_AXI_AWUSER;
  wire m07_sc2axi_M_AXI_AWVALID;
  wire [4:0]m07_sc2axi_M_AXI_BID;
  wire m07_sc2axi_M_AXI_BREADY;
  wire [1:0]m07_sc2axi_M_AXI_BRESP;
  wire [1023:0]m07_sc2axi_M_AXI_BUSER;
  wire m07_sc2axi_M_AXI_BVALID;
  wire [31:0]m07_sc2axi_M_AXI_RDATA;
  wire [4:0]m07_sc2axi_M_AXI_RID;
  wire m07_sc2axi_M_AXI_RLAST;
  wire m07_sc2axi_M_AXI_RREADY;
  wire [1:0]m07_sc2axi_M_AXI_RRESP;
  wire [1023:0]m07_sc2axi_M_AXI_RUSER;
  wire m07_sc2axi_M_AXI_RVALID;
  wire [31:0]m07_sc2axi_M_AXI_WDATA;
  wire m07_sc2axi_M_AXI_WLAST;
  wire m07_sc2axi_M_AXI_WREADY;
  wire [3:0]m07_sc2axi_M_AXI_WSTRB;
  wire [1023:0]m07_sc2axi_M_AXI_WUSER;
  wire m07_sc2axi_M_AXI_WVALID;
  wire [0:0]m_axi_aresetn_1;
  wire [0:0]m_axi_aresetn_2;
  wire [0:0]m_axi_aresetn_3;
  wire [0:0]m_axi_aresetn_4;
  wire [0:0]m_axi_aresetn_5;
  wire [0:0]m_axi_aresetn_6;
  wire [0:0]m_axi_aresetn_7;
  wire [0:0]m_axi_aresetn_8;
  wire [31:0]s00_entry_pipeline_m_axi_ARADDR;
  wire [3:0]s00_entry_pipeline_m_axi_ARCACHE;
  wire [4:0]s00_entry_pipeline_m_axi_ARID;
  wire [7:0]s00_entry_pipeline_m_axi_ARLEN;
  wire [0:0]s00_entry_pipeline_m_axi_ARLOCK;
  wire [2:0]s00_entry_pipeline_m_axi_ARPROT;
  wire [3:0]s00_entry_pipeline_m_axi_ARQOS;
  wire s00_entry_pipeline_m_axi_ARREADY;
  wire [1023:0]s00_entry_pipeline_m_axi_ARUSER;
  wire s00_entry_pipeline_m_axi_ARVALID;
  wire [31:0]s00_entry_pipeline_m_axi_AWADDR;
  wire [3:0]s00_entry_pipeline_m_axi_AWCACHE;
  wire [4:0]s00_entry_pipeline_m_axi_AWID;
  wire [7:0]s00_entry_pipeline_m_axi_AWLEN;
  wire [0:0]s00_entry_pipeline_m_axi_AWLOCK;
  wire [2:0]s00_entry_pipeline_m_axi_AWPROT;
  wire [3:0]s00_entry_pipeline_m_axi_AWQOS;
  wire s00_entry_pipeline_m_axi_AWREADY;
  wire [1023:0]s00_entry_pipeline_m_axi_AWUSER;
  wire s00_entry_pipeline_m_axi_AWVALID;
  wire [4:0]s00_entry_pipeline_m_axi_BID;
  wire s00_entry_pipeline_m_axi_BREADY;
  wire [1:0]s00_entry_pipeline_m_axi_BRESP;
  wire [1023:0]s00_entry_pipeline_m_axi_BUSER;
  wire s00_entry_pipeline_m_axi_BVALID;
  wire [31:0]s00_entry_pipeline_m_axi_RDATA;
  wire [4:0]s00_entry_pipeline_m_axi_RID;
  wire s00_entry_pipeline_m_axi_RLAST;
  wire s00_entry_pipeline_m_axi_RREADY;
  wire [1:0]s00_entry_pipeline_m_axi_RRESP;
  wire [1023:0]s00_entry_pipeline_m_axi_RUSER;
  wire s00_entry_pipeline_m_axi_RVALID;
  wire [31:0]s00_entry_pipeline_m_axi_WDATA;
  wire s00_entry_pipeline_m_axi_WLAST;
  wire s00_entry_pipeline_m_axi_WREADY;
  wire [3:0]s00_entry_pipeline_m_axi_WSTRB;
  wire [1023:0]s00_entry_pipeline_m_axi_WUSER;
  wire s00_entry_pipeline_m_axi_WVALID;
  wire [7:0]s00_nodes_M_SC_AR_INFO;
  wire [155:0]s00_nodes_M_SC_AR_PAYLD;
  wire [7:0]s00_nodes_M_SC_AR_RECV;
  wire [7:0]s00_nodes_M_SC_AR_REQ;
  wire [7:0]s00_nodes_M_SC_AR_SEND;
  wire [7:0]s00_nodes_M_SC_AW_INFO;
  wire [155:0]s00_nodes_M_SC_AW_PAYLD;
  wire [7:0]s00_nodes_M_SC_AW_RECV;
  wire [7:0]s00_nodes_M_SC_AW_REQ;
  wire [7:0]s00_nodes_M_SC_AW_SEND;
  wire [0:0]s00_nodes_M_SC_B_INFO;
  wire [11:0]s00_nodes_M_SC_B_PAYLD;
  wire s00_nodes_M_SC_B_RECV;
  wire [0:0]s00_nodes_M_SC_B_REQ;
  wire [0:0]s00_nodes_M_SC_B_SEND;
  wire [0:0]s00_nodes_M_SC_R_INFO;
  wire [89:0]s00_nodes_M_SC_R_PAYLD;
  wire s00_nodes_M_SC_R_RECV;
  wire [0:0]s00_nodes_M_SC_R_REQ;
  wire [0:0]s00_nodes_M_SC_R_SEND;
  wire [7:0]s00_nodes_M_SC_W_INFO;
  wire [94:0]s00_nodes_M_SC_W_PAYLD;
  wire [7:0]s00_nodes_M_SC_W_RECV;
  wire [7:0]s00_nodes_M_SC_W_REQ;
  wire [7:0]s00_nodes_M_SC_W_SEND;
  wire [31:0]s01_entry_pipeline_m_axi_ARADDR;
  wire [3:0]s01_entry_pipeline_m_axi_ARCACHE;
  wire [2:0]s01_entry_pipeline_m_axi_ARID;
  wire [7:0]s01_entry_pipeline_m_axi_ARLEN;
  wire [0:0]s01_entry_pipeline_m_axi_ARLOCK;
  wire [2:0]s01_entry_pipeline_m_axi_ARPROT;
  wire [3:0]s01_entry_pipeline_m_axi_ARQOS;
  wire s01_entry_pipeline_m_axi_ARREADY;
  wire [1023:0]s01_entry_pipeline_m_axi_ARUSER;
  wire s01_entry_pipeline_m_axi_ARVALID;
  wire [31:0]s01_entry_pipeline_m_axi_RDATA;
  wire [2:0]s01_entry_pipeline_m_axi_RID;
  wire s01_entry_pipeline_m_axi_RLAST;
  wire s01_entry_pipeline_m_axi_RREADY;
  wire [1:0]s01_entry_pipeline_m_axi_RRESP;
  wire [1023:0]s01_entry_pipeline_m_axi_RUSER;
  wire s01_entry_pipeline_m_axi_RVALID;
  wire [7:0]s01_nodes_M_SC_AR_INFO;
  wire [155:0]s01_nodes_M_SC_AR_PAYLD;
  wire [7:0]s01_nodes_M_SC_AR_RECV;
  wire [7:0]s01_nodes_M_SC_AR_REQ;
  wire [7:0]s01_nodes_M_SC_AR_SEND;
  wire [0:0]s01_nodes_M_SC_R_INFO;
  wire [89:0]s01_nodes_M_SC_R_PAYLD;
  wire s01_nodes_M_SC_R_RECV;
  wire [0:0]s01_nodes_M_SC_R_REQ;
  wire [0:0]s01_nodes_M_SC_R_SEND;
  wire [31:0]s02_entry_pipeline_m_axi_ARADDR;
  wire [3:0]s02_entry_pipeline_m_axi_ARCACHE;
  wire [2:0]s02_entry_pipeline_m_axi_ARID;
  wire [7:0]s02_entry_pipeline_m_axi_ARLEN;
  wire [0:0]s02_entry_pipeline_m_axi_ARLOCK;
  wire [2:0]s02_entry_pipeline_m_axi_ARPROT;
  wire [3:0]s02_entry_pipeline_m_axi_ARQOS;
  wire s02_entry_pipeline_m_axi_ARREADY;
  wire [1023:0]s02_entry_pipeline_m_axi_ARUSER;
  wire s02_entry_pipeline_m_axi_ARVALID;
  wire [31:0]s02_entry_pipeline_m_axi_AWADDR;
  wire [3:0]s02_entry_pipeline_m_axi_AWCACHE;
  wire [2:0]s02_entry_pipeline_m_axi_AWID;
  wire [7:0]s02_entry_pipeline_m_axi_AWLEN;
  wire [0:0]s02_entry_pipeline_m_axi_AWLOCK;
  wire [2:0]s02_entry_pipeline_m_axi_AWPROT;
  wire [3:0]s02_entry_pipeline_m_axi_AWQOS;
  wire s02_entry_pipeline_m_axi_AWREADY;
  wire [1023:0]s02_entry_pipeline_m_axi_AWUSER;
  wire s02_entry_pipeline_m_axi_AWVALID;
  wire [2:0]s02_entry_pipeline_m_axi_BID;
  wire s02_entry_pipeline_m_axi_BREADY;
  wire [1:0]s02_entry_pipeline_m_axi_BRESP;
  wire [1023:0]s02_entry_pipeline_m_axi_BUSER;
  wire s02_entry_pipeline_m_axi_BVALID;
  wire [31:0]s02_entry_pipeline_m_axi_RDATA;
  wire [2:0]s02_entry_pipeline_m_axi_RID;
  wire s02_entry_pipeline_m_axi_RLAST;
  wire s02_entry_pipeline_m_axi_RREADY;
  wire [1:0]s02_entry_pipeline_m_axi_RRESP;
  wire [1023:0]s02_entry_pipeline_m_axi_RUSER;
  wire s02_entry_pipeline_m_axi_RVALID;
  wire [31:0]s02_entry_pipeline_m_axi_WDATA;
  wire s02_entry_pipeline_m_axi_WLAST;
  wire s02_entry_pipeline_m_axi_WREADY;
  wire [3:0]s02_entry_pipeline_m_axi_WSTRB;
  wire [1023:0]s02_entry_pipeline_m_axi_WUSER;
  wire s02_entry_pipeline_m_axi_WVALID;
  wire [7:0]s02_nodes_M_SC_AR_INFO;
  wire [155:0]s02_nodes_M_SC_AR_PAYLD;
  wire [7:0]s02_nodes_M_SC_AR_RECV;
  wire [7:0]s02_nodes_M_SC_AR_REQ;
  wire [7:0]s02_nodes_M_SC_AR_SEND;
  wire [7:0]s02_nodes_M_SC_AW_INFO;
  wire [155:0]s02_nodes_M_SC_AW_PAYLD;
  wire [7:0]s02_nodes_M_SC_AW_RECV;
  wire [7:0]s02_nodes_M_SC_AW_REQ;
  wire [7:0]s02_nodes_M_SC_AW_SEND;
  wire [0:0]s02_nodes_M_SC_B_INFO;
  wire [11:0]s02_nodes_M_SC_B_PAYLD;
  wire s02_nodes_M_SC_B_RECV;
  wire [0:0]s02_nodes_M_SC_B_REQ;
  wire [0:0]s02_nodes_M_SC_B_SEND;
  wire [0:0]s02_nodes_M_SC_R_INFO;
  wire [89:0]s02_nodes_M_SC_R_PAYLD;
  wire s02_nodes_M_SC_R_RECV;
  wire [0:0]s02_nodes_M_SC_R_REQ;
  wire [0:0]s02_nodes_M_SC_R_SEND;
  wire [7:0]s02_nodes_M_SC_W_INFO;
  wire [94:0]s02_nodes_M_SC_W_PAYLD;
  wire [7:0]s02_nodes_M_SC_W_RECV;
  wire [7:0]s02_nodes_M_SC_W_REQ;
  wire [7:0]s02_nodes_M_SC_W_SEND;
  wire [31:0]s03_entry_pipeline_m_axi_AWADDR;
  wire [3:0]s03_entry_pipeline_m_axi_AWCACHE;
  wire [2:0]s03_entry_pipeline_m_axi_AWID;
  wire [7:0]s03_entry_pipeline_m_axi_AWLEN;
  wire [0:0]s03_entry_pipeline_m_axi_AWLOCK;
  wire [2:0]s03_entry_pipeline_m_axi_AWPROT;
  wire [3:0]s03_entry_pipeline_m_axi_AWQOS;
  wire s03_entry_pipeline_m_axi_AWREADY;
  wire [1023:0]s03_entry_pipeline_m_axi_AWUSER;
  wire s03_entry_pipeline_m_axi_AWVALID;
  wire [2:0]s03_entry_pipeline_m_axi_BID;
  wire s03_entry_pipeline_m_axi_BREADY;
  wire [1:0]s03_entry_pipeline_m_axi_BRESP;
  wire [1023:0]s03_entry_pipeline_m_axi_BUSER;
  wire s03_entry_pipeline_m_axi_BVALID;
  wire [31:0]s03_entry_pipeline_m_axi_WDATA;
  wire s03_entry_pipeline_m_axi_WLAST;
  wire s03_entry_pipeline_m_axi_WREADY;
  wire [3:0]s03_entry_pipeline_m_axi_WSTRB;
  wire [1023:0]s03_entry_pipeline_m_axi_WUSER;
  wire s03_entry_pipeline_m_axi_WVALID;
  wire [7:0]s03_nodes_M_SC_AW_INFO;
  wire [155:0]s03_nodes_M_SC_AW_PAYLD;
  wire [7:0]s03_nodes_M_SC_AW_RECV;
  wire [7:0]s03_nodes_M_SC_AW_REQ;
  wire [7:0]s03_nodes_M_SC_AW_SEND;
  wire [0:0]s03_nodes_M_SC_B_INFO;
  wire [11:0]s03_nodes_M_SC_B_PAYLD;
  wire s03_nodes_M_SC_B_RECV;
  wire [0:0]s03_nodes_M_SC_B_REQ;
  wire [0:0]s03_nodes_M_SC_B_SEND;
  wire [7:0]s03_nodes_M_SC_W_INFO;
  wire [94:0]s03_nodes_M_SC_W_PAYLD;
  wire [7:0]s03_nodes_M_SC_W_RECV;
  wire [7:0]s03_nodes_M_SC_W_REQ;
  wire [7:0]s03_nodes_M_SC_W_SEND;
  wire swbd_aclk_net;
  wire [0:0]swbd_aresetn_net;

  assign M00_AXI_araddr[31:0] = m00_exit_pipeline_m_axi_ARADDR;
  assign M00_AXI_arburst[1:0] = m00_exit_pipeline_m_axi_ARBURST;
  assign M00_AXI_arcache[3:0] = m00_exit_pipeline_m_axi_ARCACHE;
  assign M00_AXI_arlen[3:0] = m00_exit_pipeline_m_axi_ARLEN;
  assign M00_AXI_arlock[1:0] = m00_exit_pipeline_m_axi_ARLOCK;
  assign M00_AXI_arprot[2:0] = m00_exit_pipeline_m_axi_ARPROT;
  assign M00_AXI_arqos[3:0] = m00_exit_pipeline_m_axi_ARQOS;
  assign M00_AXI_arsize[2:0] = m00_exit_pipeline_m_axi_ARSIZE;
  assign M00_AXI_aruser[3:0] = m00_exit_pipeline_m_axi_ARUSER;
  assign M00_AXI_arvalid = m00_exit_pipeline_m_axi_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_exit_pipeline_m_axi_AWADDR;
  assign M00_AXI_awburst[1:0] = m00_exit_pipeline_m_axi_AWBURST;
  assign M00_AXI_awcache[3:0] = m00_exit_pipeline_m_axi_AWCACHE;
  assign M00_AXI_awlen[3:0] = m00_exit_pipeline_m_axi_AWLEN;
  assign M00_AXI_awlock[1:0] = m00_exit_pipeline_m_axi_AWLOCK;
  assign M00_AXI_awprot[2:0] = m00_exit_pipeline_m_axi_AWPROT;
  assign M00_AXI_awqos[3:0] = m00_exit_pipeline_m_axi_AWQOS;
  assign M00_AXI_awsize[2:0] = m00_exit_pipeline_m_axi_AWSIZE;
  assign M00_AXI_awuser[3:0] = m00_exit_pipeline_m_axi_AWUSER;
  assign M00_AXI_awvalid = m00_exit_pipeline_m_axi_AWVALID;
  assign M00_AXI_bready = m00_exit_pipeline_m_axi_BREADY;
  assign M00_AXI_rready = m00_exit_pipeline_m_axi_RREADY;
  assign M00_AXI_wdata[63:0] = m00_exit_pipeline_m_axi_WDATA;
  assign M00_AXI_wlast = m00_exit_pipeline_m_axi_WLAST;
  assign M00_AXI_wstrb[7:0] = m00_exit_pipeline_m_axi_WSTRB;
  assign M00_AXI_wvalid = m00_exit_pipeline_m_axi_WVALID;
  assign M01_AXI_araddr[11:0] = m01_exit_pipeline_m_axi_ARADDR;
  assign M01_AXI_arprot[2:0] = m01_exit_pipeline_m_axi_ARPROT;
  assign M01_AXI_arvalid = m01_exit_pipeline_m_axi_ARVALID;
  assign M01_AXI_awaddr[11:0] = m01_exit_pipeline_m_axi_AWADDR;
  assign M01_AXI_awprot[2:0] = m01_exit_pipeline_m_axi_AWPROT;
  assign M01_AXI_awvalid = m01_exit_pipeline_m_axi_AWVALID;
  assign M01_AXI_bready = m01_exit_pipeline_m_axi_BREADY;
  assign M01_AXI_rready = m01_exit_pipeline_m_axi_RREADY;
  assign M01_AXI_wdata[31:0] = m01_exit_pipeline_m_axi_WDATA;
  assign M01_AXI_wstrb[3:0] = m01_exit_pipeline_m_axi_WSTRB;
  assign M01_AXI_wvalid = m01_exit_pipeline_m_axi_WVALID;
  assign M02_AXI_araddr[8:0] = m02_exit_pipeline_m_axi_ARADDR;
  assign M02_AXI_arprot[2:0] = m02_exit_pipeline_m_axi_ARPROT;
  assign M02_AXI_arvalid = m02_exit_pipeline_m_axi_ARVALID;
  assign M02_AXI_awaddr[8:0] = m02_exit_pipeline_m_axi_AWADDR;
  assign M02_AXI_awprot[2:0] = m02_exit_pipeline_m_axi_AWPROT;
  assign M02_AXI_awvalid = m02_exit_pipeline_m_axi_AWVALID;
  assign M02_AXI_bready = m02_exit_pipeline_m_axi_BREADY;
  assign M02_AXI_rready = m02_exit_pipeline_m_axi_RREADY;
  assign M02_AXI_wdata[31:0] = m02_exit_pipeline_m_axi_WDATA;
  assign M02_AXI_wstrb[3:0] = m02_exit_pipeline_m_axi_WSTRB;
  assign M02_AXI_wvalid = m02_exit_pipeline_m_axi_WVALID;
  assign M03_AXI_araddr[8:0] = m03_exit_pipeline_m_axi_ARADDR;
  assign M03_AXI_arprot[2:0] = m03_exit_pipeline_m_axi_ARPROT;
  assign M03_AXI_arvalid = m03_exit_pipeline_m_axi_ARVALID;
  assign M03_AXI_awaddr[8:0] = m03_exit_pipeline_m_axi_AWADDR;
  assign M03_AXI_awprot[2:0] = m03_exit_pipeline_m_axi_AWPROT;
  assign M03_AXI_awvalid = m03_exit_pipeline_m_axi_AWVALID;
  assign M03_AXI_bready = m03_exit_pipeline_m_axi_BREADY;
  assign M03_AXI_rready = m03_exit_pipeline_m_axi_RREADY;
  assign M03_AXI_wdata[31:0] = m03_exit_pipeline_m_axi_WDATA;
  assign M03_AXI_wstrb[3:0] = m03_exit_pipeline_m_axi_WSTRB;
  assign M03_AXI_wvalid = m03_exit_pipeline_m_axi_WVALID;
  assign M04_AXI_araddr[2:0] = m04_exit_pipeline_m_axi_ARADDR;
  assign M04_AXI_arburst[1:0] = m04_exit_pipeline_m_axi_ARBURST;
  assign M04_AXI_arcache[3:0] = m04_exit_pipeline_m_axi_ARCACHE;
  assign M04_AXI_arlen[7:0] = m04_exit_pipeline_m_axi_ARLEN;
  assign M04_AXI_arlock[0] = m04_exit_pipeline_m_axi_ARLOCK;
  assign M04_AXI_arprot[2:0] = m04_exit_pipeline_m_axi_ARPROT;
  assign M04_AXI_arqos[3:0] = m04_exit_pipeline_m_axi_ARQOS;
  assign M04_AXI_arsize[2:0] = m04_exit_pipeline_m_axi_ARSIZE;
  assign M04_AXI_aruser[3:0] = m04_exit_pipeline_m_axi_ARUSER;
  assign M04_AXI_arvalid = m04_exit_pipeline_m_axi_ARVALID;
  assign M04_AXI_awaddr[2:0] = m04_exit_pipeline_m_axi_AWADDR;
  assign M04_AXI_awburst[1:0] = m04_exit_pipeline_m_axi_AWBURST;
  assign M04_AXI_awcache[3:0] = m04_exit_pipeline_m_axi_AWCACHE;
  assign M04_AXI_awlen[7:0] = m04_exit_pipeline_m_axi_AWLEN;
  assign M04_AXI_awlock[0] = m04_exit_pipeline_m_axi_AWLOCK;
  assign M04_AXI_awprot[2:0] = m04_exit_pipeline_m_axi_AWPROT;
  assign M04_AXI_awqos[3:0] = m04_exit_pipeline_m_axi_AWQOS;
  assign M04_AXI_awsize[2:0] = m04_exit_pipeline_m_axi_AWSIZE;
  assign M04_AXI_awuser[3:0] = m04_exit_pipeline_m_axi_AWUSER;
  assign M04_AXI_awvalid = m04_exit_pipeline_m_axi_AWVALID;
  assign M04_AXI_bready = m04_exit_pipeline_m_axi_BREADY;
  assign M04_AXI_rready = m04_exit_pipeline_m_axi_RREADY;
  assign M04_AXI_wdata[31:0] = m04_exit_pipeline_m_axi_WDATA;
  assign M04_AXI_wlast = m04_exit_pipeline_m_axi_WLAST;
  assign M04_AXI_wstrb[3:0] = m04_exit_pipeline_m_axi_WSTRB;
  assign M04_AXI_wvalid = m04_exit_pipeline_m_axi_WVALID;
  assign M05_AXI_araddr[2:0] = m05_exit_pipeline_m_axi_ARADDR;
  assign M05_AXI_arburst[1:0] = m05_exit_pipeline_m_axi_ARBURST;
  assign M05_AXI_arcache[3:0] = m05_exit_pipeline_m_axi_ARCACHE;
  assign M05_AXI_arlen[7:0] = m05_exit_pipeline_m_axi_ARLEN;
  assign M05_AXI_arlock[0] = m05_exit_pipeline_m_axi_ARLOCK;
  assign M05_AXI_arprot[2:0] = m05_exit_pipeline_m_axi_ARPROT;
  assign M05_AXI_arqos[3:0] = m05_exit_pipeline_m_axi_ARQOS;
  assign M05_AXI_arsize[2:0] = m05_exit_pipeline_m_axi_ARSIZE;
  assign M05_AXI_aruser[3:0] = m05_exit_pipeline_m_axi_ARUSER;
  assign M05_AXI_arvalid = m05_exit_pipeline_m_axi_ARVALID;
  assign M05_AXI_awaddr[2:0] = m05_exit_pipeline_m_axi_AWADDR;
  assign M05_AXI_awburst[1:0] = m05_exit_pipeline_m_axi_AWBURST;
  assign M05_AXI_awcache[3:0] = m05_exit_pipeline_m_axi_AWCACHE;
  assign M05_AXI_awlen[7:0] = m05_exit_pipeline_m_axi_AWLEN;
  assign M05_AXI_awlock[0] = m05_exit_pipeline_m_axi_AWLOCK;
  assign M05_AXI_awprot[2:0] = m05_exit_pipeline_m_axi_AWPROT;
  assign M05_AXI_awqos[3:0] = m05_exit_pipeline_m_axi_AWQOS;
  assign M05_AXI_awsize[2:0] = m05_exit_pipeline_m_axi_AWSIZE;
  assign M05_AXI_awuser[3:0] = m05_exit_pipeline_m_axi_AWUSER;
  assign M05_AXI_awvalid = m05_exit_pipeline_m_axi_AWVALID;
  assign M05_AXI_bready = m05_exit_pipeline_m_axi_BREADY;
  assign M05_AXI_rready = m05_exit_pipeline_m_axi_RREADY;
  assign M05_AXI_wdata[31:0] = m05_exit_pipeline_m_axi_WDATA;
  assign M05_AXI_wlast = m05_exit_pipeline_m_axi_WLAST;
  assign M05_AXI_wstrb[3:0] = m05_exit_pipeline_m_axi_WSTRB;
  assign M05_AXI_wvalid = m05_exit_pipeline_m_axi_WVALID;
  assign M06_AXI_araddr[4:0] = m06_exit_pipeline_m_axi_ARADDR;
  assign M06_AXI_arprot[2:0] = m06_exit_pipeline_m_axi_ARPROT;
  assign M06_AXI_arvalid = m06_exit_pipeline_m_axi_ARVALID;
  assign M06_AXI_awaddr[4:0] = m06_exit_pipeline_m_axi_AWADDR;
  assign M06_AXI_awprot[2:0] = m06_exit_pipeline_m_axi_AWPROT;
  assign M06_AXI_awvalid = m06_exit_pipeline_m_axi_AWVALID;
  assign M06_AXI_bready = m06_exit_pipeline_m_axi_BREADY;
  assign M06_AXI_rready = m06_exit_pipeline_m_axi_RREADY;
  assign M06_AXI_wdata[31:0] = m06_exit_pipeline_m_axi_WDATA;
  assign M06_AXI_wstrb[3:0] = m06_exit_pipeline_m_axi_WSTRB;
  assign M06_AXI_wvalid = m06_exit_pipeline_m_axi_WVALID;
  assign M07_AXI_araddr[12:0] = m07_exit_pipeline_m_axi_ARADDR;
  assign M07_AXI_arprot[2:0] = m07_exit_pipeline_m_axi_ARPROT;
  assign M07_AXI_arvalid = m07_exit_pipeline_m_axi_ARVALID;
  assign M07_AXI_awaddr[12:0] = m07_exit_pipeline_m_axi_AWADDR;
  assign M07_AXI_awprot[2:0] = m07_exit_pipeline_m_axi_AWPROT;
  assign M07_AXI_awvalid = m07_exit_pipeline_m_axi_AWVALID;
  assign M07_AXI_bready = m07_exit_pipeline_m_axi_BREADY;
  assign M07_AXI_rready = m07_exit_pipeline_m_axi_RREADY;
  assign M07_AXI_wdata[31:0] = m07_exit_pipeline_m_axi_WDATA;
  assign M07_AXI_wstrb[3:0] = m07_exit_pipeline_m_axi_WSTRB;
  assign M07_AXI_wvalid = m07_exit_pipeline_m_axi_WVALID;
  assign S00_AXI_1_ARADDR = S00_AXI_araddr[31:0];
  assign S00_AXI_1_ARBURST = S00_AXI_arburst[1:0];
  assign S00_AXI_1_ARCACHE = S00_AXI_arcache[3:0];
  assign S00_AXI_1_ARID = S00_AXI_arid[11:0];
  assign S00_AXI_1_ARLEN = S00_AXI_arlen[3:0];
  assign S00_AXI_1_ARLOCK = S00_AXI_arlock[1:0];
  assign S00_AXI_1_ARPROT = S00_AXI_arprot[2:0];
  assign S00_AXI_1_ARQOS = S00_AXI_arqos[3:0];
  assign S00_AXI_1_ARSIZE = S00_AXI_arsize[2:0];
  assign S00_AXI_1_ARVALID = S00_AXI_arvalid;
  assign S00_AXI_1_AWADDR = S00_AXI_awaddr[31:0];
  assign S00_AXI_1_AWBURST = S00_AXI_awburst[1:0];
  assign S00_AXI_1_AWCACHE = S00_AXI_awcache[3:0];
  assign S00_AXI_1_AWID = S00_AXI_awid[11:0];
  assign S00_AXI_1_AWLEN = S00_AXI_awlen[3:0];
  assign S00_AXI_1_AWLOCK = S00_AXI_awlock[1:0];
  assign S00_AXI_1_AWPROT = S00_AXI_awprot[2:0];
  assign S00_AXI_1_AWQOS = S00_AXI_awqos[3:0];
  assign S00_AXI_1_AWSIZE = S00_AXI_awsize[2:0];
  assign S00_AXI_1_AWVALID = S00_AXI_awvalid;
  assign S00_AXI_1_BREADY = S00_AXI_bready;
  assign S00_AXI_1_RREADY = S00_AXI_rready;
  assign S00_AXI_1_WDATA = S00_AXI_wdata[31:0];
  assign S00_AXI_1_WID = S00_AXI_wid[11:0];
  assign S00_AXI_1_WLAST = S00_AXI_wlast;
  assign S00_AXI_1_WSTRB = S00_AXI_wstrb[3:0];
  assign S00_AXI_1_WVALID = S00_AXI_wvalid;
  assign S00_AXI_arready = S00_AXI_1_ARREADY;
  assign S00_AXI_awready = S00_AXI_1_AWREADY;
  assign S00_AXI_bid[11:0] = S00_AXI_1_BID;
  assign S00_AXI_bresp[1:0] = S00_AXI_1_BRESP;
  assign S00_AXI_bvalid = S00_AXI_1_BVALID;
  assign S00_AXI_rdata[31:0] = S00_AXI_1_RDATA;
  assign S00_AXI_rid[11:0] = S00_AXI_1_RID;
  assign S00_AXI_rlast = S00_AXI_1_RLAST;
  assign S00_AXI_rresp[1:0] = S00_AXI_1_RRESP;
  assign S00_AXI_rvalid = S00_AXI_1_RVALID;
  assign S00_AXI_wready = S00_AXI_1_WREADY;
  assign S01_AXI_1_ARADDR = S01_AXI_araddr[31:0];
  assign S01_AXI_1_ARBURST = S01_AXI_arburst[1:0];
  assign S01_AXI_1_ARCACHE = S01_AXI_arcache[3:0];
  assign S01_AXI_1_ARLEN = S01_AXI_arlen[7:0];
  assign S01_AXI_1_ARLOCK = S01_AXI_arlock[0];
  assign S01_AXI_1_ARPROT = S01_AXI_arprot[2:0];
  assign S01_AXI_1_ARQOS = S01_AXI_arqos[3:0];
  assign S01_AXI_1_ARSIZE = S01_AXI_arsize[2:0];
  assign S01_AXI_1_ARUSER = S01_AXI_aruser[3:0];
  assign S01_AXI_1_ARVALID = S01_AXI_arvalid;
  assign S01_AXI_1_RREADY = S01_AXI_rready;
  assign S01_AXI_arready = S01_AXI_1_ARREADY;
  assign S01_AXI_rdata[31:0] = S01_AXI_1_RDATA;
  assign S01_AXI_rlast = S01_AXI_1_RLAST;
  assign S01_AXI_rresp[1:0] = S01_AXI_1_RRESP;
  assign S01_AXI_rvalid = S01_AXI_1_RVALID;
  assign S02_AXI_1_ARADDR = S02_AXI_araddr[31:0];
  assign S02_AXI_1_ARBURST = S02_AXI_arburst[1:0];
  assign S02_AXI_1_ARCACHE = S02_AXI_arcache[3:0];
  assign S02_AXI_1_ARLEN = S02_AXI_arlen[7:0];
  assign S02_AXI_1_ARLOCK = S02_AXI_arlock[0];
  assign S02_AXI_1_ARPROT = S02_AXI_arprot[2:0];
  assign S02_AXI_1_ARQOS = S02_AXI_arqos[3:0];
  assign S02_AXI_1_ARSIZE = S02_AXI_arsize[2:0];
  assign S02_AXI_1_ARUSER = S02_AXI_aruser[3:0];
  assign S02_AXI_1_ARVALID = S02_AXI_arvalid;
  assign S02_AXI_1_AWADDR = S02_AXI_awaddr[31:0];
  assign S02_AXI_1_AWBURST = S02_AXI_awburst[1:0];
  assign S02_AXI_1_AWCACHE = S02_AXI_awcache[3:0];
  assign S02_AXI_1_AWLEN = S02_AXI_awlen[7:0];
  assign S02_AXI_1_AWLOCK = S02_AXI_awlock[0];
  assign S02_AXI_1_AWPROT = S02_AXI_awprot[2:0];
  assign S02_AXI_1_AWQOS = S02_AXI_awqos[3:0];
  assign S02_AXI_1_AWSIZE = S02_AXI_awsize[2:0];
  assign S02_AXI_1_AWUSER = S02_AXI_awuser[3:0];
  assign S02_AXI_1_AWVALID = S02_AXI_awvalid;
  assign S02_AXI_1_BREADY = S02_AXI_bready;
  assign S02_AXI_1_RREADY = S02_AXI_rready;
  assign S02_AXI_1_WDATA = S02_AXI_wdata[31:0];
  assign S02_AXI_1_WLAST = S02_AXI_wlast;
  assign S02_AXI_1_WSTRB = S02_AXI_wstrb[3:0];
  assign S02_AXI_1_WVALID = S02_AXI_wvalid;
  assign S02_AXI_arready = S02_AXI_1_ARREADY;
  assign S02_AXI_awready = S02_AXI_1_AWREADY;
  assign S02_AXI_bresp[1:0] = S02_AXI_1_BRESP;
  assign S02_AXI_bvalid = S02_AXI_1_BVALID;
  assign S02_AXI_rdata[31:0] = S02_AXI_1_RDATA;
  assign S02_AXI_rlast = S02_AXI_1_RLAST;
  assign S02_AXI_rresp[1:0] = S02_AXI_1_RRESP;
  assign S02_AXI_rvalid = S02_AXI_1_RVALID;
  assign S02_AXI_wready = S02_AXI_1_WREADY;
  assign S03_AXI_1_AWADDR = S03_AXI_awaddr[31:0];
  assign S03_AXI_1_AWBURST = S03_AXI_awburst[1:0];
  assign S03_AXI_1_AWCACHE = S03_AXI_awcache[3:0];
  assign S03_AXI_1_AWLEN = S03_AXI_awlen[7:0];
  assign S03_AXI_1_AWLOCK = S03_AXI_awlock[0];
  assign S03_AXI_1_AWPROT = S03_AXI_awprot[2:0];
  assign S03_AXI_1_AWQOS = S03_AXI_awqos[3:0];
  assign S03_AXI_1_AWSIZE = S03_AXI_awsize[2:0];
  assign S03_AXI_1_AWUSER = S03_AXI_awuser[3:0];
  assign S03_AXI_1_AWVALID = S03_AXI_awvalid;
  assign S03_AXI_1_BREADY = S03_AXI_bready;
  assign S03_AXI_1_WDATA = S03_AXI_wdata[31:0];
  assign S03_AXI_1_WLAST = S03_AXI_wlast;
  assign S03_AXI_1_WSTRB = S03_AXI_wstrb[3:0];
  assign S03_AXI_1_WVALID = S03_AXI_wvalid;
  assign S03_AXI_awready = S03_AXI_1_AWREADY;
  assign S03_AXI_bresp[1:0] = S03_AXI_1_BRESP;
  assign S03_AXI_bvalid = S03_AXI_1_BVALID;
  assign S03_AXI_wready = S03_AXI_1_WREADY;
  assign aclk_net = aclk;
  assign aresetn_1 = aresetn;
  assign m00_exit_pipeline_m_axi_ARREADY = M00_AXI_arready;
  assign m00_exit_pipeline_m_axi_AWREADY = M00_AXI_awready;
  assign m00_exit_pipeline_m_axi_BRESP = M00_AXI_bresp[1:0];
  assign m00_exit_pipeline_m_axi_BVALID = M00_AXI_bvalid;
  assign m00_exit_pipeline_m_axi_RDATA = M00_AXI_rdata[63:0];
  assign m00_exit_pipeline_m_axi_RLAST = M00_AXI_rlast;
  assign m00_exit_pipeline_m_axi_RRESP = M00_AXI_rresp[1:0];
  assign m00_exit_pipeline_m_axi_RVALID = M00_AXI_rvalid;
  assign m00_exit_pipeline_m_axi_WREADY = M00_AXI_wready;
  assign m01_exit_pipeline_m_axi_ARREADY = M01_AXI_arready;
  assign m01_exit_pipeline_m_axi_AWREADY = M01_AXI_awready;
  assign m01_exit_pipeline_m_axi_BRESP = M01_AXI_bresp[1:0];
  assign m01_exit_pipeline_m_axi_BVALID = M01_AXI_bvalid;
  assign m01_exit_pipeline_m_axi_RDATA = M01_AXI_rdata[31:0];
  assign m01_exit_pipeline_m_axi_RRESP = M01_AXI_rresp[1:0];
  assign m01_exit_pipeline_m_axi_RVALID = M01_AXI_rvalid;
  assign m01_exit_pipeline_m_axi_WREADY = M01_AXI_wready;
  assign m02_exit_pipeline_m_axi_ARREADY = M02_AXI_arready;
  assign m02_exit_pipeline_m_axi_AWREADY = M02_AXI_awready;
  assign m02_exit_pipeline_m_axi_BRESP = M02_AXI_bresp[1:0];
  assign m02_exit_pipeline_m_axi_BVALID = M02_AXI_bvalid;
  assign m02_exit_pipeline_m_axi_RDATA = M02_AXI_rdata[31:0];
  assign m02_exit_pipeline_m_axi_RRESP = M02_AXI_rresp[1:0];
  assign m02_exit_pipeline_m_axi_RVALID = M02_AXI_rvalid;
  assign m02_exit_pipeline_m_axi_WREADY = M02_AXI_wready;
  assign m03_exit_pipeline_m_axi_ARREADY = M03_AXI_arready;
  assign m03_exit_pipeline_m_axi_AWREADY = M03_AXI_awready;
  assign m03_exit_pipeline_m_axi_BRESP = M03_AXI_bresp[1:0];
  assign m03_exit_pipeline_m_axi_BVALID = M03_AXI_bvalid;
  assign m03_exit_pipeline_m_axi_RDATA = M03_AXI_rdata[31:0];
  assign m03_exit_pipeline_m_axi_RRESP = M03_AXI_rresp[1:0];
  assign m03_exit_pipeline_m_axi_RVALID = M03_AXI_rvalid;
  assign m03_exit_pipeline_m_axi_WREADY = M03_AXI_wready;
  assign m04_exit_pipeline_m_axi_ARREADY = M04_AXI_arready;
  assign m04_exit_pipeline_m_axi_AWREADY = M04_AXI_awready;
  assign m04_exit_pipeline_m_axi_BRESP = M04_AXI_bresp[1:0];
  assign m04_exit_pipeline_m_axi_BVALID = M04_AXI_bvalid;
  assign m04_exit_pipeline_m_axi_RDATA = M04_AXI_rdata[31:0];
  assign m04_exit_pipeline_m_axi_RLAST = M04_AXI_rlast;
  assign m04_exit_pipeline_m_axi_RRESP = M04_AXI_rresp[1:0];
  assign m04_exit_pipeline_m_axi_RVALID = M04_AXI_rvalid;
  assign m04_exit_pipeline_m_axi_WREADY = M04_AXI_wready;
  assign m05_exit_pipeline_m_axi_ARREADY = M05_AXI_arready;
  assign m05_exit_pipeline_m_axi_AWREADY = M05_AXI_awready;
  assign m05_exit_pipeline_m_axi_BRESP = M05_AXI_bresp[1:0];
  assign m05_exit_pipeline_m_axi_BVALID = M05_AXI_bvalid;
  assign m05_exit_pipeline_m_axi_RDATA = M05_AXI_rdata[31:0];
  assign m05_exit_pipeline_m_axi_RLAST = M05_AXI_rlast;
  assign m05_exit_pipeline_m_axi_RRESP = M05_AXI_rresp[1:0];
  assign m05_exit_pipeline_m_axi_RVALID = M05_AXI_rvalid;
  assign m05_exit_pipeline_m_axi_WREADY = M05_AXI_wready;
  assign m06_exit_pipeline_m_axi_ARREADY = M06_AXI_arready;
  assign m06_exit_pipeline_m_axi_AWREADY = M06_AXI_awready;
  assign m06_exit_pipeline_m_axi_BRESP = M06_AXI_bresp[1:0];
  assign m06_exit_pipeline_m_axi_BVALID = M06_AXI_bvalid;
  assign m06_exit_pipeline_m_axi_RDATA = M06_AXI_rdata[31:0];
  assign m06_exit_pipeline_m_axi_RRESP = M06_AXI_rresp[1:0];
  assign m06_exit_pipeline_m_axi_RVALID = M06_AXI_rvalid;
  assign m06_exit_pipeline_m_axi_WREADY = M06_AXI_wready;
  assign m07_exit_pipeline_m_axi_ARREADY = M07_AXI_arready;
  assign m07_exit_pipeline_m_axi_AWREADY = M07_AXI_awready;
  assign m07_exit_pipeline_m_axi_BRESP = M07_AXI_bresp[1:0];
  assign m07_exit_pipeline_m_axi_BVALID = M07_AXI_bvalid;
  assign m07_exit_pipeline_m_axi_RDATA = M07_AXI_rdata[31:0];
  assign m07_exit_pipeline_m_axi_RRESP = M07_AXI_rresp[1:0];
  assign m07_exit_pipeline_m_axi_RVALID = M07_AXI_rvalid;
  assign m07_exit_pipeline_m_axi_WREADY = M07_AXI_wready;
  clk_map_imp_14DRM6U clk_map
       (.M00_ACLK(clk_map_M00_ACLK),
        .M00_ARESETN(m_axi_aresetn_1),
        .M01_ACLK(clk_map_M01_ACLK),
        .M01_ARESETN(m_axi_aresetn_2),
        .M02_ACLK(clk_map_M02_ACLK),
        .M02_ARESETN(m_axi_aresetn_3),
        .M03_ACLK(clk_map_M03_ACLK),
        .M03_ARESETN(m_axi_aresetn_4),
        .M04_ACLK(clk_map_M04_ACLK),
        .M04_ARESETN(m_axi_aresetn_5),
        .M05_ACLK(clk_map_M05_ACLK),
        .M05_ARESETN(m_axi_aresetn_6),
        .M06_ACLK(clk_map_M06_ACLK),
        .M06_ARESETN(m_axi_aresetn_7),
        .M07_ACLK(clk_map_M07_ACLK),
        .M07_ARESETN(m_axi_aresetn_8),
        .S00_ACLK(aclk_1),
        .S00_ARESETN(aresetn_2),
        .S01_ACLK(aclk_2),
        .S01_ARESETN(aresetn_3),
        .S02_ACLK(aclk_3),
        .S02_ARESETN(aresetn_4),
        .S03_ACLK(aclk_4),
        .S03_ARESETN(aresetn_5),
        .aclk(aclk_net),
        .aresetn(aresetn_1),
        .aresetn_out(aresetn_net),
        .swbd_aclk(swbd_aclk_net),
        .swbd_aresetn(swbd_aresetn_net));
  m00_exit_pipeline_imp_T69UQ5 m00_exit_pipeline
       (.aclk(clk_map_M00_ACLK),
        .aresetn(m_axi_aresetn_1),
        .m_axi_araddr(m00_exit_pipeline_m_axi_ARADDR),
        .m_axi_arburst(m00_exit_pipeline_m_axi_ARBURST),
        .m_axi_arcache(m00_exit_pipeline_m_axi_ARCACHE),
        .m_axi_arlen(m00_exit_pipeline_m_axi_ARLEN),
        .m_axi_arlock(m00_exit_pipeline_m_axi_ARLOCK),
        .m_axi_arprot(m00_exit_pipeline_m_axi_ARPROT),
        .m_axi_arqos(m00_exit_pipeline_m_axi_ARQOS),
        .m_axi_arready(m00_exit_pipeline_m_axi_ARREADY),
        .m_axi_arsize(m00_exit_pipeline_m_axi_ARSIZE),
        .m_axi_aruser(m00_exit_pipeline_m_axi_ARUSER),
        .m_axi_arvalid(m00_exit_pipeline_m_axi_ARVALID),
        .m_axi_awaddr(m00_exit_pipeline_m_axi_AWADDR),
        .m_axi_awburst(m00_exit_pipeline_m_axi_AWBURST),
        .m_axi_awcache(m00_exit_pipeline_m_axi_AWCACHE),
        .m_axi_awlen(m00_exit_pipeline_m_axi_AWLEN),
        .m_axi_awlock(m00_exit_pipeline_m_axi_AWLOCK),
        .m_axi_awprot(m00_exit_pipeline_m_axi_AWPROT),
        .m_axi_awqos(m00_exit_pipeline_m_axi_AWQOS),
        .m_axi_awready(m00_exit_pipeline_m_axi_AWREADY),
        .m_axi_awsize(m00_exit_pipeline_m_axi_AWSIZE),
        .m_axi_awuser(m00_exit_pipeline_m_axi_AWUSER),
        .m_axi_awvalid(m00_exit_pipeline_m_axi_AWVALID),
        .m_axi_bready(m00_exit_pipeline_m_axi_BREADY),
        .m_axi_bresp(m00_exit_pipeline_m_axi_BRESP),
        .m_axi_bvalid(m00_exit_pipeline_m_axi_BVALID),
        .m_axi_rdata(m00_exit_pipeline_m_axi_RDATA),
        .m_axi_rlast(m00_exit_pipeline_m_axi_RLAST),
        .m_axi_rready(m00_exit_pipeline_m_axi_RREADY),
        .m_axi_rresp(m00_exit_pipeline_m_axi_RRESP),
        .m_axi_rvalid(m00_exit_pipeline_m_axi_RVALID),
        .m_axi_wdata(m00_exit_pipeline_m_axi_WDATA),
        .m_axi_wlast(m00_exit_pipeline_m_axi_WLAST),
        .m_axi_wready(m00_exit_pipeline_m_axi_WREADY),
        .m_axi_wstrb(m00_exit_pipeline_m_axi_WSTRB),
        .m_axi_wvalid(m00_exit_pipeline_m_axi_WVALID),
        .s_axi_araddr(m00_sc2axi_M_AXI_ARADDR),
        .s_axi_arcache(m00_sc2axi_M_AXI_ARCACHE),
        .s_axi_arid(m00_sc2axi_M_AXI_ARID),
        .s_axi_arlen(m00_sc2axi_M_AXI_ARLEN),
        .s_axi_arlock(m00_sc2axi_M_AXI_ARLOCK),
        .s_axi_arprot(m00_sc2axi_M_AXI_ARPROT),
        .s_axi_arqos(m00_sc2axi_M_AXI_ARQOS),
        .s_axi_arready(m00_sc2axi_M_AXI_ARREADY),
        .s_axi_aruser(m00_sc2axi_M_AXI_ARUSER),
        .s_axi_arvalid(m00_sc2axi_M_AXI_ARVALID),
        .s_axi_awaddr(m00_sc2axi_M_AXI_AWADDR),
        .s_axi_awcache(m00_sc2axi_M_AXI_AWCACHE),
        .s_axi_awid(m00_sc2axi_M_AXI_AWID),
        .s_axi_awlen(m00_sc2axi_M_AXI_AWLEN),
        .s_axi_awlock(m00_sc2axi_M_AXI_AWLOCK),
        .s_axi_awprot(m00_sc2axi_M_AXI_AWPROT),
        .s_axi_awqos(m00_sc2axi_M_AXI_AWQOS),
        .s_axi_awready(m00_sc2axi_M_AXI_AWREADY),
        .s_axi_awuser(m00_sc2axi_M_AXI_AWUSER),
        .s_axi_awvalid(m00_sc2axi_M_AXI_AWVALID),
        .s_axi_bid(m00_sc2axi_M_AXI_BID),
        .s_axi_bready(m00_sc2axi_M_AXI_BREADY),
        .s_axi_bresp(m00_sc2axi_M_AXI_BRESP),
        .s_axi_buser(m00_sc2axi_M_AXI_BUSER),
        .s_axi_bvalid(m00_sc2axi_M_AXI_BVALID),
        .s_axi_rdata(m00_sc2axi_M_AXI_RDATA),
        .s_axi_rid(m00_sc2axi_M_AXI_RID),
        .s_axi_rlast(m00_sc2axi_M_AXI_RLAST),
        .s_axi_rready(m00_sc2axi_M_AXI_RREADY),
        .s_axi_rresp(m00_sc2axi_M_AXI_RRESP),
        .s_axi_ruser(m00_sc2axi_M_AXI_RUSER),
        .s_axi_rvalid(m00_sc2axi_M_AXI_RVALID),
        .s_axi_wdata(m00_sc2axi_M_AXI_WDATA),
        .s_axi_wlast(m00_sc2axi_M_AXI_WLAST),
        .s_axi_wready(m00_sc2axi_M_AXI_WREADY),
        .s_axi_wstrb(m00_sc2axi_M_AXI_WSTRB),
        .s_axi_wuser(m00_sc2axi_M_AXI_WUSER),
        .s_axi_wvalid(m00_sc2axi_M_AXI_WVALID));
  m00_nodes_imp_FTZN4X m00_nodes
       (.M_SC_AR_info(m00_nodes_M_SC_AR_INFO),
        .M_SC_AR_payld(m00_nodes_M_SC_AR_PAYLD),
        .M_SC_AR_recv(m00_nodes_M_SC_AR_RECV),
        .M_SC_AR_req(m00_nodes_M_SC_AR_REQ),
        .M_SC_AR_send(m00_nodes_M_SC_AR_SEND),
        .M_SC_AW_info(m00_nodes_M_SC_AW_INFO),
        .M_SC_AW_payld(m00_nodes_M_SC_AW_PAYLD),
        .M_SC_AW_recv(m00_nodes_M_SC_AW_RECV),
        .M_SC_AW_req(m00_nodes_M_SC_AW_REQ),
        .M_SC_AW_send(m00_nodes_M_SC_AW_SEND),
        .M_SC_B_info(m00_nodes_M_SC_B_INFO),
        .M_SC_B_payld(m00_nodes_M_SC_B_PAYLD),
        .M_SC_B_recv(m00_nodes_M_SC_B_RECV),
        .M_SC_B_req(m00_nodes_M_SC_B_REQ),
        .M_SC_B_send(m00_nodes_M_SC_B_SEND),
        .M_SC_R_info(m00_nodes_M_SC_R_INFO),
        .M_SC_R_payld(m00_nodes_M_SC_R_PAYLD),
        .M_SC_R_recv(m00_nodes_M_SC_R_RECV),
        .M_SC_R_req(m00_nodes_M_SC_R_REQ),
        .M_SC_R_send(m00_nodes_M_SC_R_SEND),
        .M_SC_W_info(m00_nodes_M_SC_W_INFO),
        .M_SC_W_payld(m00_nodes_M_SC_W_PAYLD),
        .M_SC_W_recv(m00_nodes_M_SC_W_RECV),
        .M_SC_W_req(m00_nodes_M_SC_W_REQ),
        .M_SC_W_send(m00_nodes_M_SC_W_SEND),
        .S_SC_AR_info(S_SC_AR_4_INFO),
        .S_SC_AR_payld(S_SC_AR_4_PAYLD),
        .S_SC_AR_recv(S_SC_AR_4_RECV),
        .S_SC_AR_req(S_SC_AR_4_REQ),
        .S_SC_AR_send(S_SC_AR_4_SEND),
        .S_SC_AW_info(S_SC_AW_4_INFO),
        .S_SC_AW_payld(S_SC_AW_4_PAYLD),
        .S_SC_AW_recv(S_SC_AW_4_RECV),
        .S_SC_AW_req(S_SC_AW_4_REQ),
        .S_SC_AW_send(S_SC_AW_4_SEND),
        .S_SC_B_info(S_SC_B_4_INFO),
        .S_SC_B_payld(S_SC_B_4_PAYLD),
        .S_SC_B_recv(S_SC_B_4_RECV),
        .S_SC_B_req(S_SC_B_4_REQ),
        .S_SC_B_send(S_SC_B_4_SEND),
        .S_SC_R_info(S_SC_R_4_INFO),
        .S_SC_R_payld(S_SC_R_4_PAYLD),
        .S_SC_R_recv(S_SC_R_4_RECV),
        .S_SC_R_req(S_SC_R_4_REQ),
        .S_SC_R_send(S_SC_R_4_SEND),
        .S_SC_W_info(S_SC_W_4_INFO),
        .S_SC_W_payld(S_SC_W_4_PAYLD),
        .S_SC_W_recv(S_SC_W_4_RECV),
        .S_SC_W_req(S_SC_W_4_REQ),
        .S_SC_W_send(S_SC_W_4_SEND),
        .m_axi_aclk(clk_map_M00_ACLK),
        .m_axi_aresetn(m_axi_aresetn_1),
        .s_axi_aclk(swbd_aclk_net),
        .s_axi_aresetn(swbd_aresetn_net));
  bd_63e1_m00s2a_0 m00_sc2axi
       (.aclk(clk_map_M00_ACLK),
        .m_axi_araddr(m00_sc2axi_M_AXI_ARADDR),
        .m_axi_arcache(m00_sc2axi_M_AXI_ARCACHE),
        .m_axi_arid(m00_sc2axi_M_AXI_ARID),
        .m_axi_arlen(m00_sc2axi_M_AXI_ARLEN),
        .m_axi_arlock(m00_sc2axi_M_AXI_ARLOCK),
        .m_axi_arprot(m00_sc2axi_M_AXI_ARPROT),
        .m_axi_arqos(m00_sc2axi_M_AXI_ARQOS),
        .m_axi_arready(m00_sc2axi_M_AXI_ARREADY),
        .m_axi_aruser(m00_sc2axi_M_AXI_ARUSER),
        .m_axi_arvalid(m00_sc2axi_M_AXI_ARVALID),
        .m_axi_awaddr(m00_sc2axi_M_AXI_AWADDR),
        .m_axi_awcache(m00_sc2axi_M_AXI_AWCACHE),
        .m_axi_awid(m00_sc2axi_M_AXI_AWID),
        .m_axi_awlen(m00_sc2axi_M_AXI_AWLEN),
        .m_axi_awlock(m00_sc2axi_M_AXI_AWLOCK),
        .m_axi_awprot(m00_sc2axi_M_AXI_AWPROT),
        .m_axi_awqos(m00_sc2axi_M_AXI_AWQOS),
        .m_axi_awready(m00_sc2axi_M_AXI_AWREADY),
        .m_axi_awuser(m00_sc2axi_M_AXI_AWUSER),
        .m_axi_awvalid(m00_sc2axi_M_AXI_AWVALID),
        .m_axi_bid(m00_sc2axi_M_AXI_BID),
        .m_axi_bready(m00_sc2axi_M_AXI_BREADY),
        .m_axi_bresp(m00_sc2axi_M_AXI_BRESP),
        .m_axi_buser(m00_sc2axi_M_AXI_BUSER),
        .m_axi_bvalid(m00_sc2axi_M_AXI_BVALID),
        .m_axi_rdata(m00_sc2axi_M_AXI_RDATA),
        .m_axi_rid(m00_sc2axi_M_AXI_RID),
        .m_axi_rlast(m00_sc2axi_M_AXI_RLAST),
        .m_axi_rready(m00_sc2axi_M_AXI_RREADY),
        .m_axi_rresp(m00_sc2axi_M_AXI_RRESP),
        .m_axi_ruser(m00_sc2axi_M_AXI_RUSER),
        .m_axi_rvalid(m00_sc2axi_M_AXI_RVALID),
        .m_axi_wdata(m00_sc2axi_M_AXI_WDATA),
        .m_axi_wlast(m00_sc2axi_M_AXI_WLAST),
        .m_axi_wready(m00_sc2axi_M_AXI_WREADY),
        .m_axi_wstrb(m00_sc2axi_M_AXI_WSTRB),
        .m_axi_wuser(m00_sc2axi_M_AXI_WUSER),
        .m_axi_wvalid(m00_sc2axi_M_AXI_WVALID),
        .m_sc_b_info(S_SC_B_4_INFO),
        .m_sc_b_payld(S_SC_B_4_PAYLD),
        .m_sc_b_recv(S_SC_B_4_RECV),
        .m_sc_b_req(S_SC_B_4_REQ),
        .m_sc_b_send(S_SC_B_4_SEND),
        .m_sc_r_info(S_SC_R_4_INFO),
        .m_sc_r_payld(S_SC_R_4_PAYLD),
        .m_sc_r_recv(S_SC_R_4_RECV),
        .m_sc_r_req(S_SC_R_4_REQ),
        .m_sc_r_send(S_SC_R_4_SEND),
        .s_sc_ar_info(m00_nodes_M_SC_AR_INFO),
        .s_sc_ar_payld(m00_nodes_M_SC_AR_PAYLD),
        .s_sc_ar_recv(m00_nodes_M_SC_AR_RECV),
        .s_sc_ar_req(m00_nodes_M_SC_AR_REQ),
        .s_sc_ar_send(m00_nodes_M_SC_AR_SEND),
        .s_sc_aw_info(m00_nodes_M_SC_AW_INFO),
        .s_sc_aw_payld(m00_nodes_M_SC_AW_PAYLD),
        .s_sc_aw_recv(m00_nodes_M_SC_AW_RECV),
        .s_sc_aw_req(m00_nodes_M_SC_AW_REQ),
        .s_sc_aw_send(m00_nodes_M_SC_AW_SEND),
        .s_sc_w_info(m00_nodes_M_SC_W_INFO),
        .s_sc_w_payld(m00_nodes_M_SC_W_PAYLD),
        .s_sc_w_recv(m00_nodes_M_SC_W_RECV),
        .s_sc_w_req(m00_nodes_M_SC_W_REQ),
        .s_sc_w_send(m00_nodes_M_SC_W_SEND));
  m01_exit_pipeline_imp_YZ3EVH m01_exit_pipeline
       (.aclk(clk_map_M01_ACLK),
        .aresetn(m_axi_aresetn_2),
        .m_axi_araddr(m01_exit_pipeline_m_axi_ARADDR),
        .m_axi_arprot(m01_exit_pipeline_m_axi_ARPROT),
        .m_axi_arready(m01_exit_pipeline_m_axi_ARREADY),
        .m_axi_arvalid(m01_exit_pipeline_m_axi_ARVALID),
        .m_axi_awaddr(m01_exit_pipeline_m_axi_AWADDR),
        .m_axi_awprot(m01_exit_pipeline_m_axi_AWPROT),
        .m_axi_awready(m01_exit_pipeline_m_axi_AWREADY),
        .m_axi_awvalid(m01_exit_pipeline_m_axi_AWVALID),
        .m_axi_bready(m01_exit_pipeline_m_axi_BREADY),
        .m_axi_bresp(m01_exit_pipeline_m_axi_BRESP),
        .m_axi_bvalid(m01_exit_pipeline_m_axi_BVALID),
        .m_axi_rdata(m01_exit_pipeline_m_axi_RDATA),
        .m_axi_rready(m01_exit_pipeline_m_axi_RREADY),
        .m_axi_rresp(m01_exit_pipeline_m_axi_RRESP),
        .m_axi_rvalid(m01_exit_pipeline_m_axi_RVALID),
        .m_axi_wdata(m01_exit_pipeline_m_axi_WDATA),
        .m_axi_wready(m01_exit_pipeline_m_axi_WREADY),
        .m_axi_wstrb(m01_exit_pipeline_m_axi_WSTRB),
        .m_axi_wvalid(m01_exit_pipeline_m_axi_WVALID),
        .s_axi_araddr(m01_sc2axi_M_AXI_ARADDR),
        .s_axi_arcache(m01_sc2axi_M_AXI_ARCACHE),
        .s_axi_arid(m01_sc2axi_M_AXI_ARID),
        .s_axi_arlen(m01_sc2axi_M_AXI_ARLEN),
        .s_axi_arlock(m01_sc2axi_M_AXI_ARLOCK),
        .s_axi_arprot(m01_sc2axi_M_AXI_ARPROT),
        .s_axi_arqos(m01_sc2axi_M_AXI_ARQOS),
        .s_axi_arready(m01_sc2axi_M_AXI_ARREADY),
        .s_axi_aruser(m01_sc2axi_M_AXI_ARUSER),
        .s_axi_arvalid(m01_sc2axi_M_AXI_ARVALID),
        .s_axi_awaddr(m01_sc2axi_M_AXI_AWADDR),
        .s_axi_awcache(m01_sc2axi_M_AXI_AWCACHE),
        .s_axi_awid(m01_sc2axi_M_AXI_AWID),
        .s_axi_awlen(m01_sc2axi_M_AXI_AWLEN),
        .s_axi_awlock(m01_sc2axi_M_AXI_AWLOCK),
        .s_axi_awprot(m01_sc2axi_M_AXI_AWPROT),
        .s_axi_awqos(m01_sc2axi_M_AXI_AWQOS),
        .s_axi_awready(m01_sc2axi_M_AXI_AWREADY),
        .s_axi_awuser(m01_sc2axi_M_AXI_AWUSER),
        .s_axi_awvalid(m01_sc2axi_M_AXI_AWVALID),
        .s_axi_bid(m01_sc2axi_M_AXI_BID),
        .s_axi_bready(m01_sc2axi_M_AXI_BREADY),
        .s_axi_bresp(m01_sc2axi_M_AXI_BRESP),
        .s_axi_buser(m01_sc2axi_M_AXI_BUSER),
        .s_axi_bvalid(m01_sc2axi_M_AXI_BVALID),
        .s_axi_rdata(m01_sc2axi_M_AXI_RDATA),
        .s_axi_rid(m01_sc2axi_M_AXI_RID),
        .s_axi_rlast(m01_sc2axi_M_AXI_RLAST),
        .s_axi_rready(m01_sc2axi_M_AXI_RREADY),
        .s_axi_rresp(m01_sc2axi_M_AXI_RRESP),
        .s_axi_ruser(m01_sc2axi_M_AXI_RUSER),
        .s_axi_rvalid(m01_sc2axi_M_AXI_RVALID),
        .s_axi_wdata(m01_sc2axi_M_AXI_WDATA),
        .s_axi_wlast(m01_sc2axi_M_AXI_WLAST),
        .s_axi_wready(m01_sc2axi_M_AXI_WREADY),
        .s_axi_wstrb(m01_sc2axi_M_AXI_WSTRB),
        .s_axi_wuser(m01_sc2axi_M_AXI_WUSER),
        .s_axi_wvalid(m01_sc2axi_M_AXI_WVALID));
  m01_nodes_imp_19JE5CN m01_nodes
       (.M_SC_AR_info(m01_nodes_M_SC_AR_INFO),
        .M_SC_AR_payld(m01_nodes_M_SC_AR_PAYLD),
        .M_SC_AR_recv(m01_nodes_M_SC_AR_RECV),
        .M_SC_AR_req(m01_nodes_M_SC_AR_REQ),
        .M_SC_AR_send(m01_nodes_M_SC_AR_SEND),
        .M_SC_AW_info(m01_nodes_M_SC_AW_INFO),
        .M_SC_AW_payld(m01_nodes_M_SC_AW_PAYLD),
        .M_SC_AW_recv(m01_nodes_M_SC_AW_RECV),
        .M_SC_AW_req(m01_nodes_M_SC_AW_REQ),
        .M_SC_AW_send(m01_nodes_M_SC_AW_SEND),
        .M_SC_B_info(m01_nodes_M_SC_B_INFO),
        .M_SC_B_payld(m01_nodes_M_SC_B_PAYLD),
        .M_SC_B_recv(m01_nodes_M_SC_B_RECV),
        .M_SC_B_req(m01_nodes_M_SC_B_REQ),
        .M_SC_B_send(m01_nodes_M_SC_B_SEND),
        .M_SC_R_info(m01_nodes_M_SC_R_INFO),
        .M_SC_R_payld(m01_nodes_M_SC_R_PAYLD),
        .M_SC_R_recv(m01_nodes_M_SC_R_RECV),
        .M_SC_R_req(m01_nodes_M_SC_R_REQ),
        .M_SC_R_send(m01_nodes_M_SC_R_SEND),
        .M_SC_W_info(m01_nodes_M_SC_W_INFO),
        .M_SC_W_payld(m01_nodes_M_SC_W_PAYLD),
        .M_SC_W_recv(m01_nodes_M_SC_W_RECV),
        .M_SC_W_req(m01_nodes_M_SC_W_REQ),
        .M_SC_W_send(m01_nodes_M_SC_W_SEND),
        .S_SC_AR_info(S_SC_AR_5_INFO),
        .S_SC_AR_payld(S_SC_AR_5_PAYLD),
        .S_SC_AR_recv(S_SC_AR_5_RECV),
        .S_SC_AR_req(S_SC_AR_5_REQ),
        .S_SC_AR_send(S_SC_AR_5_SEND),
        .S_SC_AW_info(S_SC_AW_5_INFO),
        .S_SC_AW_payld(S_SC_AW_5_PAYLD),
        .S_SC_AW_recv(S_SC_AW_5_RECV),
        .S_SC_AW_req(S_SC_AW_5_REQ),
        .S_SC_AW_send(S_SC_AW_5_SEND),
        .S_SC_B_info(S_SC_B_5_INFO),
        .S_SC_B_payld(S_SC_B_5_PAYLD),
        .S_SC_B_recv(S_SC_B_5_RECV),
        .S_SC_B_req(S_SC_B_5_REQ),
        .S_SC_B_send(S_SC_B_5_SEND),
        .S_SC_R_info(S_SC_R_5_INFO),
        .S_SC_R_payld(S_SC_R_5_PAYLD),
        .S_SC_R_recv(S_SC_R_5_RECV),
        .S_SC_R_req(S_SC_R_5_REQ),
        .S_SC_R_send(S_SC_R_5_SEND),
        .S_SC_W_info(S_SC_W_5_INFO),
        .S_SC_W_payld(S_SC_W_5_PAYLD),
        .S_SC_W_recv(S_SC_W_5_RECV),
        .S_SC_W_req(S_SC_W_5_REQ),
        .S_SC_W_send(S_SC_W_5_SEND),
        .m_axi_aclk(clk_map_M01_ACLK),
        .m_axi_aresetn(m_axi_aresetn_2),
        .s_axi_aclk(swbd_aclk_net),
        .s_axi_aresetn(swbd_aresetn_net));
  bd_63e1_m01s2a_0 m01_sc2axi
       (.aclk(clk_map_M01_ACLK),
        .m_axi_araddr(m01_sc2axi_M_AXI_ARADDR),
        .m_axi_arcache(m01_sc2axi_M_AXI_ARCACHE),
        .m_axi_arid(m01_sc2axi_M_AXI_ARID),
        .m_axi_arlen(m01_sc2axi_M_AXI_ARLEN),
        .m_axi_arlock(m01_sc2axi_M_AXI_ARLOCK),
        .m_axi_arprot(m01_sc2axi_M_AXI_ARPROT),
        .m_axi_arqos(m01_sc2axi_M_AXI_ARQOS),
        .m_axi_arready(m01_sc2axi_M_AXI_ARREADY),
        .m_axi_aruser(m01_sc2axi_M_AXI_ARUSER),
        .m_axi_arvalid(m01_sc2axi_M_AXI_ARVALID),
        .m_axi_awaddr(m01_sc2axi_M_AXI_AWADDR),
        .m_axi_awcache(m01_sc2axi_M_AXI_AWCACHE),
        .m_axi_awid(m01_sc2axi_M_AXI_AWID),
        .m_axi_awlen(m01_sc2axi_M_AXI_AWLEN),
        .m_axi_awlock(m01_sc2axi_M_AXI_AWLOCK),
        .m_axi_awprot(m01_sc2axi_M_AXI_AWPROT),
        .m_axi_awqos(m01_sc2axi_M_AXI_AWQOS),
        .m_axi_awready(m01_sc2axi_M_AXI_AWREADY),
        .m_axi_awuser(m01_sc2axi_M_AXI_AWUSER),
        .m_axi_awvalid(m01_sc2axi_M_AXI_AWVALID),
        .m_axi_bid(m01_sc2axi_M_AXI_BID),
        .m_axi_bready(m01_sc2axi_M_AXI_BREADY),
        .m_axi_bresp(m01_sc2axi_M_AXI_BRESP),
        .m_axi_buser(m01_sc2axi_M_AXI_BUSER),
        .m_axi_bvalid(m01_sc2axi_M_AXI_BVALID),
        .m_axi_rdata(m01_sc2axi_M_AXI_RDATA),
        .m_axi_rid(m01_sc2axi_M_AXI_RID),
        .m_axi_rlast(m01_sc2axi_M_AXI_RLAST),
        .m_axi_rready(m01_sc2axi_M_AXI_RREADY),
        .m_axi_rresp(m01_sc2axi_M_AXI_RRESP),
        .m_axi_ruser(m01_sc2axi_M_AXI_RUSER),
        .m_axi_rvalid(m01_sc2axi_M_AXI_RVALID),
        .m_axi_wdata(m01_sc2axi_M_AXI_WDATA),
        .m_axi_wlast(m01_sc2axi_M_AXI_WLAST),
        .m_axi_wready(m01_sc2axi_M_AXI_WREADY),
        .m_axi_wstrb(m01_sc2axi_M_AXI_WSTRB),
        .m_axi_wuser(m01_sc2axi_M_AXI_WUSER),
        .m_axi_wvalid(m01_sc2axi_M_AXI_WVALID),
        .m_sc_b_info(S_SC_B_5_INFO),
        .m_sc_b_payld(S_SC_B_5_PAYLD),
        .m_sc_b_recv(S_SC_B_5_RECV),
        .m_sc_b_req(S_SC_B_5_REQ),
        .m_sc_b_send(S_SC_B_5_SEND),
        .m_sc_r_info(S_SC_R_5_INFO),
        .m_sc_r_payld(S_SC_R_5_PAYLD),
        .m_sc_r_recv(S_SC_R_5_RECV),
        .m_sc_r_req(S_SC_R_5_REQ),
        .m_sc_r_send(S_SC_R_5_SEND),
        .s_sc_ar_info(m01_nodes_M_SC_AR_INFO),
        .s_sc_ar_payld(m01_nodes_M_SC_AR_PAYLD),
        .s_sc_ar_recv(m01_nodes_M_SC_AR_RECV),
        .s_sc_ar_req(m01_nodes_M_SC_AR_REQ),
        .s_sc_ar_send(m01_nodes_M_SC_AR_SEND),
        .s_sc_aw_info(m01_nodes_M_SC_AW_INFO),
        .s_sc_aw_payld(m01_nodes_M_SC_AW_PAYLD),
        .s_sc_aw_recv(m01_nodes_M_SC_AW_RECV),
        .s_sc_aw_req(m01_nodes_M_SC_AW_REQ),
        .s_sc_aw_send(m01_nodes_M_SC_AW_SEND),
        .s_sc_w_info(m01_nodes_M_SC_W_INFO),
        .s_sc_w_payld(m01_nodes_M_SC_W_PAYLD),
        .s_sc_w_recv(m01_nodes_M_SC_W_RECV),
        .s_sc_w_req(m01_nodes_M_SC_W_REQ),
        .s_sc_w_send(m01_nodes_M_SC_W_SEND));
  m02_exit_pipeline_imp_JTSBWT m02_exit_pipeline
       (.aclk(clk_map_M02_ACLK),
        .aresetn(m_axi_aresetn_3),
        .m_axi_araddr(m02_exit_pipeline_m_axi_ARADDR),
        .m_axi_arprot(m02_exit_pipeline_m_axi_ARPROT),
        .m_axi_arready(m02_exit_pipeline_m_axi_ARREADY),
        .m_axi_arvalid(m02_exit_pipeline_m_axi_ARVALID),
        .m_axi_awaddr(m02_exit_pipeline_m_axi_AWADDR),
        .m_axi_awprot(m02_exit_pipeline_m_axi_AWPROT),
        .m_axi_awready(m02_exit_pipeline_m_axi_AWREADY),
        .m_axi_awvalid(m02_exit_pipeline_m_axi_AWVALID),
        .m_axi_bready(m02_exit_pipeline_m_axi_BREADY),
        .m_axi_bresp(m02_exit_pipeline_m_axi_BRESP),
        .m_axi_bvalid(m02_exit_pipeline_m_axi_BVALID),
        .m_axi_rdata(m02_exit_pipeline_m_axi_RDATA),
        .m_axi_rready(m02_exit_pipeline_m_axi_RREADY),
        .m_axi_rresp(m02_exit_pipeline_m_axi_RRESP),
        .m_axi_rvalid(m02_exit_pipeline_m_axi_RVALID),
        .m_axi_wdata(m02_exit_pipeline_m_axi_WDATA),
        .m_axi_wready(m02_exit_pipeline_m_axi_WREADY),
        .m_axi_wstrb(m02_exit_pipeline_m_axi_WSTRB),
        .m_axi_wvalid(m02_exit_pipeline_m_axi_WVALID),
        .s_axi_araddr(m02_sc2axi_M_AXI_ARADDR),
        .s_axi_arcache(m02_sc2axi_M_AXI_ARCACHE),
        .s_axi_arid(m02_sc2axi_M_AXI_ARID),
        .s_axi_arlen(m02_sc2axi_M_AXI_ARLEN),
        .s_axi_arlock(m02_sc2axi_M_AXI_ARLOCK),
        .s_axi_arprot(m02_sc2axi_M_AXI_ARPROT),
        .s_axi_arqos(m02_sc2axi_M_AXI_ARQOS),
        .s_axi_arready(m02_sc2axi_M_AXI_ARREADY),
        .s_axi_aruser(m02_sc2axi_M_AXI_ARUSER),
        .s_axi_arvalid(m02_sc2axi_M_AXI_ARVALID),
        .s_axi_awaddr(m02_sc2axi_M_AXI_AWADDR),
        .s_axi_awcache(m02_sc2axi_M_AXI_AWCACHE),
        .s_axi_awid(m02_sc2axi_M_AXI_AWID),
        .s_axi_awlen(m02_sc2axi_M_AXI_AWLEN),
        .s_axi_awlock(m02_sc2axi_M_AXI_AWLOCK),
        .s_axi_awprot(m02_sc2axi_M_AXI_AWPROT),
        .s_axi_awqos(m02_sc2axi_M_AXI_AWQOS),
        .s_axi_awready(m02_sc2axi_M_AXI_AWREADY),
        .s_axi_awuser(m02_sc2axi_M_AXI_AWUSER),
        .s_axi_awvalid(m02_sc2axi_M_AXI_AWVALID),
        .s_axi_bid(m02_sc2axi_M_AXI_BID),
        .s_axi_bready(m02_sc2axi_M_AXI_BREADY),
        .s_axi_bresp(m02_sc2axi_M_AXI_BRESP),
        .s_axi_buser(m02_sc2axi_M_AXI_BUSER),
        .s_axi_bvalid(m02_sc2axi_M_AXI_BVALID),
        .s_axi_rdata(m02_sc2axi_M_AXI_RDATA),
        .s_axi_rid(m02_sc2axi_M_AXI_RID),
        .s_axi_rlast(m02_sc2axi_M_AXI_RLAST),
        .s_axi_rready(m02_sc2axi_M_AXI_RREADY),
        .s_axi_rresp(m02_sc2axi_M_AXI_RRESP),
        .s_axi_ruser(m02_sc2axi_M_AXI_RUSER),
        .s_axi_rvalid(m02_sc2axi_M_AXI_RVALID),
        .s_axi_wdata(m02_sc2axi_M_AXI_WDATA),
        .s_axi_wlast(m02_sc2axi_M_AXI_WLAST),
        .s_axi_wready(m02_sc2axi_M_AXI_WREADY),
        .s_axi_wstrb(m02_sc2axi_M_AXI_WSTRB),
        .s_axi_wuser(m02_sc2axi_M_AXI_WUSER),
        .s_axi_wvalid(m02_sc2axi_M_AXI_WVALID));
  m02_nodes_imp_1O2IO24 m02_nodes
       (.M_SC_AR_info(m02_nodes_M_SC_AR_INFO),
        .M_SC_AR_payld(m02_nodes_M_SC_AR_PAYLD),
        .M_SC_AR_recv(m02_nodes_M_SC_AR_RECV),
        .M_SC_AR_req(m02_nodes_M_SC_AR_REQ),
        .M_SC_AR_send(m02_nodes_M_SC_AR_SEND),
        .M_SC_AW_info(m02_nodes_M_SC_AW_INFO),
        .M_SC_AW_payld(m02_nodes_M_SC_AW_PAYLD),
        .M_SC_AW_recv(m02_nodes_M_SC_AW_RECV),
        .M_SC_AW_req(m02_nodes_M_SC_AW_REQ),
        .M_SC_AW_send(m02_nodes_M_SC_AW_SEND),
        .M_SC_B_info(m02_nodes_M_SC_B_INFO),
        .M_SC_B_payld(m02_nodes_M_SC_B_PAYLD),
        .M_SC_B_recv(m02_nodes_M_SC_B_RECV),
        .M_SC_B_req(m02_nodes_M_SC_B_REQ),
        .M_SC_B_send(m02_nodes_M_SC_B_SEND),
        .M_SC_R_info(m02_nodes_M_SC_R_INFO),
        .M_SC_R_payld(m02_nodes_M_SC_R_PAYLD),
        .M_SC_R_recv(m02_nodes_M_SC_R_RECV),
        .M_SC_R_req(m02_nodes_M_SC_R_REQ),
        .M_SC_R_send(m02_nodes_M_SC_R_SEND),
        .M_SC_W_info(m02_nodes_M_SC_W_INFO),
        .M_SC_W_payld(m02_nodes_M_SC_W_PAYLD),
        .M_SC_W_recv(m02_nodes_M_SC_W_RECV),
        .M_SC_W_req(m02_nodes_M_SC_W_REQ),
        .M_SC_W_send(m02_nodes_M_SC_W_SEND),
        .S_SC_AR_info(S_SC_AR_6_INFO),
        .S_SC_AR_payld(S_SC_AR_6_PAYLD),
        .S_SC_AR_recv(S_SC_AR_6_RECV),
        .S_SC_AR_req(S_SC_AR_6_REQ),
        .S_SC_AR_send(S_SC_AR_6_SEND),
        .S_SC_AW_info(S_SC_AW_6_INFO),
        .S_SC_AW_payld(S_SC_AW_6_PAYLD),
        .S_SC_AW_recv(S_SC_AW_6_RECV),
        .S_SC_AW_req(S_SC_AW_6_REQ),
        .S_SC_AW_send(S_SC_AW_6_SEND),
        .S_SC_B_info(S_SC_B_6_INFO),
        .S_SC_B_payld(S_SC_B_6_PAYLD),
        .S_SC_B_recv(S_SC_B_6_RECV),
        .S_SC_B_req(S_SC_B_6_REQ),
        .S_SC_B_send(S_SC_B_6_SEND),
        .S_SC_R_info(S_SC_R_6_INFO),
        .S_SC_R_payld(S_SC_R_6_PAYLD),
        .S_SC_R_recv(S_SC_R_6_RECV),
        .S_SC_R_req(S_SC_R_6_REQ),
        .S_SC_R_send(S_SC_R_6_SEND),
        .S_SC_W_info(S_SC_W_6_INFO),
        .S_SC_W_payld(S_SC_W_6_PAYLD),
        .S_SC_W_recv(S_SC_W_6_RECV),
        .S_SC_W_req(S_SC_W_6_REQ),
        .S_SC_W_send(S_SC_W_6_SEND),
        .m_axi_aclk(clk_map_M02_ACLK),
        .m_axi_aresetn(m_axi_aresetn_3),
        .s_axi_aclk(swbd_aclk_net),
        .s_axi_aresetn(swbd_aresetn_net));
  bd_63e1_m02s2a_0 m02_sc2axi
       (.aclk(clk_map_M02_ACLK),
        .m_axi_araddr(m02_sc2axi_M_AXI_ARADDR),
        .m_axi_arcache(m02_sc2axi_M_AXI_ARCACHE),
        .m_axi_arid(m02_sc2axi_M_AXI_ARID),
        .m_axi_arlen(m02_sc2axi_M_AXI_ARLEN),
        .m_axi_arlock(m02_sc2axi_M_AXI_ARLOCK),
        .m_axi_arprot(m02_sc2axi_M_AXI_ARPROT),
        .m_axi_arqos(m02_sc2axi_M_AXI_ARQOS),
        .m_axi_arready(m02_sc2axi_M_AXI_ARREADY),
        .m_axi_aruser(m02_sc2axi_M_AXI_ARUSER),
        .m_axi_arvalid(m02_sc2axi_M_AXI_ARVALID),
        .m_axi_awaddr(m02_sc2axi_M_AXI_AWADDR),
        .m_axi_awcache(m02_sc2axi_M_AXI_AWCACHE),
        .m_axi_awid(m02_sc2axi_M_AXI_AWID),
        .m_axi_awlen(m02_sc2axi_M_AXI_AWLEN),
        .m_axi_awlock(m02_sc2axi_M_AXI_AWLOCK),
        .m_axi_awprot(m02_sc2axi_M_AXI_AWPROT),
        .m_axi_awqos(m02_sc2axi_M_AXI_AWQOS),
        .m_axi_awready(m02_sc2axi_M_AXI_AWREADY),
        .m_axi_awuser(m02_sc2axi_M_AXI_AWUSER),
        .m_axi_awvalid(m02_sc2axi_M_AXI_AWVALID),
        .m_axi_bid(m02_sc2axi_M_AXI_BID),
        .m_axi_bready(m02_sc2axi_M_AXI_BREADY),
        .m_axi_bresp(m02_sc2axi_M_AXI_BRESP),
        .m_axi_buser(m02_sc2axi_M_AXI_BUSER),
        .m_axi_bvalid(m02_sc2axi_M_AXI_BVALID),
        .m_axi_rdata(m02_sc2axi_M_AXI_RDATA),
        .m_axi_rid(m02_sc2axi_M_AXI_RID),
        .m_axi_rlast(m02_sc2axi_M_AXI_RLAST),
        .m_axi_rready(m02_sc2axi_M_AXI_RREADY),
        .m_axi_rresp(m02_sc2axi_M_AXI_RRESP),
        .m_axi_ruser(m02_sc2axi_M_AXI_RUSER),
        .m_axi_rvalid(m02_sc2axi_M_AXI_RVALID),
        .m_axi_wdata(m02_sc2axi_M_AXI_WDATA),
        .m_axi_wlast(m02_sc2axi_M_AXI_WLAST),
        .m_axi_wready(m02_sc2axi_M_AXI_WREADY),
        .m_axi_wstrb(m02_sc2axi_M_AXI_WSTRB),
        .m_axi_wuser(m02_sc2axi_M_AXI_WUSER),
        .m_axi_wvalid(m02_sc2axi_M_AXI_WVALID),
        .m_sc_b_info(S_SC_B_6_INFO),
        .m_sc_b_payld(S_SC_B_6_PAYLD),
        .m_sc_b_recv(S_SC_B_6_RECV),
        .m_sc_b_req(S_SC_B_6_REQ),
        .m_sc_b_send(S_SC_B_6_SEND),
        .m_sc_r_info(S_SC_R_6_INFO),
        .m_sc_r_payld(S_SC_R_6_PAYLD),
        .m_sc_r_recv(S_SC_R_6_RECV),
        .m_sc_r_req(S_SC_R_6_REQ),
        .m_sc_r_send(S_SC_R_6_SEND),
        .s_sc_ar_info(m02_nodes_M_SC_AR_INFO),
        .s_sc_ar_payld(m02_nodes_M_SC_AR_PAYLD),
        .s_sc_ar_recv(m02_nodes_M_SC_AR_RECV),
        .s_sc_ar_req(m02_nodes_M_SC_AR_REQ),
        .s_sc_ar_send(m02_nodes_M_SC_AR_SEND),
        .s_sc_aw_info(m02_nodes_M_SC_AW_INFO),
        .s_sc_aw_payld(m02_nodes_M_SC_AW_PAYLD),
        .s_sc_aw_recv(m02_nodes_M_SC_AW_RECV),
        .s_sc_aw_req(m02_nodes_M_SC_AW_REQ),
        .s_sc_aw_send(m02_nodes_M_SC_AW_SEND),
        .s_sc_w_info(m02_nodes_M_SC_W_INFO),
        .s_sc_w_payld(m02_nodes_M_SC_W_PAYLD),
        .s_sc_w_recv(m02_nodes_M_SC_W_RECV),
        .s_sc_w_req(m02_nodes_M_SC_W_REQ),
        .s_sc_w_send(m02_nodes_M_SC_W_SEND));
  m03_exit_pipeline_imp_MARGY5 m03_exit_pipeline
       (.aclk(clk_map_M03_ACLK),
        .aresetn(m_axi_aresetn_4),
        .m_axi_araddr(m03_exit_pipeline_m_axi_ARADDR),
        .m_axi_arprot(m03_exit_pipeline_m_axi_ARPROT),
        .m_axi_arready(m03_exit_pipeline_m_axi_ARREADY),
        .m_axi_arvalid(m03_exit_pipeline_m_axi_ARVALID),
        .m_axi_awaddr(m03_exit_pipeline_m_axi_AWADDR),
        .m_axi_awprot(m03_exit_pipeline_m_axi_AWPROT),
        .m_axi_awready(m03_exit_pipeline_m_axi_AWREADY),
        .m_axi_awvalid(m03_exit_pipeline_m_axi_AWVALID),
        .m_axi_bready(m03_exit_pipeline_m_axi_BREADY),
        .m_axi_bresp(m03_exit_pipeline_m_axi_BRESP),
        .m_axi_bvalid(m03_exit_pipeline_m_axi_BVALID),
        .m_axi_rdata(m03_exit_pipeline_m_axi_RDATA),
        .m_axi_rready(m03_exit_pipeline_m_axi_RREADY),
        .m_axi_rresp(m03_exit_pipeline_m_axi_RRESP),
        .m_axi_rvalid(m03_exit_pipeline_m_axi_RVALID),
        .m_axi_wdata(m03_exit_pipeline_m_axi_WDATA),
        .m_axi_wready(m03_exit_pipeline_m_axi_WREADY),
        .m_axi_wstrb(m03_exit_pipeline_m_axi_WSTRB),
        .m_axi_wvalid(m03_exit_pipeline_m_axi_WVALID),
        .s_axi_araddr(m03_sc2axi_M_AXI_ARADDR),
        .s_axi_arcache(m03_sc2axi_M_AXI_ARCACHE),
        .s_axi_arid(m03_sc2axi_M_AXI_ARID),
        .s_axi_arlen(m03_sc2axi_M_AXI_ARLEN),
        .s_axi_arlock(m03_sc2axi_M_AXI_ARLOCK),
        .s_axi_arprot(m03_sc2axi_M_AXI_ARPROT),
        .s_axi_arqos(m03_sc2axi_M_AXI_ARQOS),
        .s_axi_arready(m03_sc2axi_M_AXI_ARREADY),
        .s_axi_aruser(m03_sc2axi_M_AXI_ARUSER),
        .s_axi_arvalid(m03_sc2axi_M_AXI_ARVALID),
        .s_axi_awaddr(m03_sc2axi_M_AXI_AWADDR),
        .s_axi_awcache(m03_sc2axi_M_AXI_AWCACHE),
        .s_axi_awid(m03_sc2axi_M_AXI_AWID),
        .s_axi_awlen(m03_sc2axi_M_AXI_AWLEN),
        .s_axi_awlock(m03_sc2axi_M_AXI_AWLOCK),
        .s_axi_awprot(m03_sc2axi_M_AXI_AWPROT),
        .s_axi_awqos(m03_sc2axi_M_AXI_AWQOS),
        .s_axi_awready(m03_sc2axi_M_AXI_AWREADY),
        .s_axi_awuser(m03_sc2axi_M_AXI_AWUSER),
        .s_axi_awvalid(m03_sc2axi_M_AXI_AWVALID),
        .s_axi_bid(m03_sc2axi_M_AXI_BID),
        .s_axi_bready(m03_sc2axi_M_AXI_BREADY),
        .s_axi_bresp(m03_sc2axi_M_AXI_BRESP),
        .s_axi_buser(m03_sc2axi_M_AXI_BUSER),
        .s_axi_bvalid(m03_sc2axi_M_AXI_BVALID),
        .s_axi_rdata(m03_sc2axi_M_AXI_RDATA),
        .s_axi_rid(m03_sc2axi_M_AXI_RID),
        .s_axi_rlast(m03_sc2axi_M_AXI_RLAST),
        .s_axi_rready(m03_sc2axi_M_AXI_RREADY),
        .s_axi_rresp(m03_sc2axi_M_AXI_RRESP),
        .s_axi_ruser(m03_sc2axi_M_AXI_RUSER),
        .s_axi_rvalid(m03_sc2axi_M_AXI_RVALID),
        .s_axi_wdata(m03_sc2axi_M_AXI_WDATA),
        .s_axi_wlast(m03_sc2axi_M_AXI_WLAST),
        .s_axi_wready(m03_sc2axi_M_AXI_WREADY),
        .s_axi_wstrb(m03_sc2axi_M_AXI_WSTRB),
        .s_axi_wuser(m03_sc2axi_M_AXI_WUSER),
        .s_axi_wvalid(m03_sc2axi_M_AXI_WVALID));
  m03_nodes_imp_J9MVCQ m03_nodes
       (.M_SC_AR_info(m03_nodes_M_SC_AR_INFO),
        .M_SC_AR_payld(m03_nodes_M_SC_AR_PAYLD),
        .M_SC_AR_recv(m03_nodes_M_SC_AR_RECV),
        .M_SC_AR_req(m03_nodes_M_SC_AR_REQ),
        .M_SC_AR_send(m03_nodes_M_SC_AR_SEND),
        .M_SC_AW_info(m03_nodes_M_SC_AW_INFO),
        .M_SC_AW_payld(m03_nodes_M_SC_AW_PAYLD),
        .M_SC_AW_recv(m03_nodes_M_SC_AW_RECV),
        .M_SC_AW_req(m03_nodes_M_SC_AW_REQ),
        .M_SC_AW_send(m03_nodes_M_SC_AW_SEND),
        .M_SC_B_info(m03_nodes_M_SC_B_INFO),
        .M_SC_B_payld(m03_nodes_M_SC_B_PAYLD),
        .M_SC_B_recv(m03_nodes_M_SC_B_RECV),
        .M_SC_B_req(m03_nodes_M_SC_B_REQ),
        .M_SC_B_send(m03_nodes_M_SC_B_SEND),
        .M_SC_R_info(m03_nodes_M_SC_R_INFO),
        .M_SC_R_payld(m03_nodes_M_SC_R_PAYLD),
        .M_SC_R_recv(m03_nodes_M_SC_R_RECV),
        .M_SC_R_req(m03_nodes_M_SC_R_REQ),
        .M_SC_R_send(m03_nodes_M_SC_R_SEND),
        .M_SC_W_info(m03_nodes_M_SC_W_INFO),
        .M_SC_W_payld(m03_nodes_M_SC_W_PAYLD),
        .M_SC_W_recv(m03_nodes_M_SC_W_RECV),
        .M_SC_W_req(m03_nodes_M_SC_W_REQ),
        .M_SC_W_send(m03_nodes_M_SC_W_SEND),
        .S_SC_AR_info(S_SC_AR_7_INFO),
        .S_SC_AR_payld(S_SC_AR_7_PAYLD),
        .S_SC_AR_recv(S_SC_AR_7_RECV),
        .S_SC_AR_req(S_SC_AR_7_REQ),
        .S_SC_AR_send(S_SC_AR_7_SEND),
        .S_SC_AW_info(S_SC_AW_7_INFO),
        .S_SC_AW_payld(S_SC_AW_7_PAYLD),
        .S_SC_AW_recv(S_SC_AW_7_RECV),
        .S_SC_AW_req(S_SC_AW_7_REQ),
        .S_SC_AW_send(S_SC_AW_7_SEND),
        .S_SC_B_info(S_SC_B_7_INFO),
        .S_SC_B_payld(S_SC_B_7_PAYLD),
        .S_SC_B_recv(S_SC_B_7_RECV),
        .S_SC_B_req(S_SC_B_7_REQ),
        .S_SC_B_send(S_SC_B_7_SEND),
        .S_SC_R_info(S_SC_R_7_INFO),
        .S_SC_R_payld(S_SC_R_7_PAYLD),
        .S_SC_R_recv(S_SC_R_7_RECV),
        .S_SC_R_req(S_SC_R_7_REQ),
        .S_SC_R_send(S_SC_R_7_SEND),
        .S_SC_W_info(S_SC_W_7_INFO),
        .S_SC_W_payld(S_SC_W_7_PAYLD),
        .S_SC_W_recv(S_SC_W_7_RECV),
        .S_SC_W_req(S_SC_W_7_REQ),
        .S_SC_W_send(S_SC_W_7_SEND),
        .m_axi_aclk(clk_map_M03_ACLK),
        .m_axi_aresetn(m_axi_aresetn_4),
        .s_axi_aclk(swbd_aclk_net),
        .s_axi_aresetn(swbd_aresetn_net));
  bd_63e1_m03s2a_0 m03_sc2axi
       (.aclk(clk_map_M03_ACLK),
        .m_axi_araddr(m03_sc2axi_M_AXI_ARADDR),
        .m_axi_arcache(m03_sc2axi_M_AXI_ARCACHE),
        .m_axi_arid(m03_sc2axi_M_AXI_ARID),
        .m_axi_arlen(m03_sc2axi_M_AXI_ARLEN),
        .m_axi_arlock(m03_sc2axi_M_AXI_ARLOCK),
        .m_axi_arprot(m03_sc2axi_M_AXI_ARPROT),
        .m_axi_arqos(m03_sc2axi_M_AXI_ARQOS),
        .m_axi_arready(m03_sc2axi_M_AXI_ARREADY),
        .m_axi_aruser(m03_sc2axi_M_AXI_ARUSER),
        .m_axi_arvalid(m03_sc2axi_M_AXI_ARVALID),
        .m_axi_awaddr(m03_sc2axi_M_AXI_AWADDR),
        .m_axi_awcache(m03_sc2axi_M_AXI_AWCACHE),
        .m_axi_awid(m03_sc2axi_M_AXI_AWID),
        .m_axi_awlen(m03_sc2axi_M_AXI_AWLEN),
        .m_axi_awlock(m03_sc2axi_M_AXI_AWLOCK),
        .m_axi_awprot(m03_sc2axi_M_AXI_AWPROT),
        .m_axi_awqos(m03_sc2axi_M_AXI_AWQOS),
        .m_axi_awready(m03_sc2axi_M_AXI_AWREADY),
        .m_axi_awuser(m03_sc2axi_M_AXI_AWUSER),
        .m_axi_awvalid(m03_sc2axi_M_AXI_AWVALID),
        .m_axi_bid(m03_sc2axi_M_AXI_BID),
        .m_axi_bready(m03_sc2axi_M_AXI_BREADY),
        .m_axi_bresp(m03_sc2axi_M_AXI_BRESP),
        .m_axi_buser(m03_sc2axi_M_AXI_BUSER),
        .m_axi_bvalid(m03_sc2axi_M_AXI_BVALID),
        .m_axi_rdata(m03_sc2axi_M_AXI_RDATA),
        .m_axi_rid(m03_sc2axi_M_AXI_RID),
        .m_axi_rlast(m03_sc2axi_M_AXI_RLAST),
        .m_axi_rready(m03_sc2axi_M_AXI_RREADY),
        .m_axi_rresp(m03_sc2axi_M_AXI_RRESP),
        .m_axi_ruser(m03_sc2axi_M_AXI_RUSER),
        .m_axi_rvalid(m03_sc2axi_M_AXI_RVALID),
        .m_axi_wdata(m03_sc2axi_M_AXI_WDATA),
        .m_axi_wlast(m03_sc2axi_M_AXI_WLAST),
        .m_axi_wready(m03_sc2axi_M_AXI_WREADY),
        .m_axi_wstrb(m03_sc2axi_M_AXI_WSTRB),
        .m_axi_wuser(m03_sc2axi_M_AXI_WUSER),
        .m_axi_wvalid(m03_sc2axi_M_AXI_WVALID),
        .m_sc_b_info(S_SC_B_7_INFO),
        .m_sc_b_payld(S_SC_B_7_PAYLD),
        .m_sc_b_recv(S_SC_B_7_RECV),
        .m_sc_b_req(S_SC_B_7_REQ),
        .m_sc_b_send(S_SC_B_7_SEND),
        .m_sc_r_info(S_SC_R_7_INFO),
        .m_sc_r_payld(S_SC_R_7_PAYLD),
        .m_sc_r_recv(S_SC_R_7_RECV),
        .m_sc_r_req(S_SC_R_7_REQ),
        .m_sc_r_send(S_SC_R_7_SEND),
        .s_sc_ar_info(m03_nodes_M_SC_AR_INFO),
        .s_sc_ar_payld(m03_nodes_M_SC_AR_PAYLD),
        .s_sc_ar_recv(m03_nodes_M_SC_AR_RECV),
        .s_sc_ar_req(m03_nodes_M_SC_AR_REQ),
        .s_sc_ar_send(m03_nodes_M_SC_AR_SEND),
        .s_sc_aw_info(m03_nodes_M_SC_AW_INFO),
        .s_sc_aw_payld(m03_nodes_M_SC_AW_PAYLD),
        .s_sc_aw_recv(m03_nodes_M_SC_AW_RECV),
        .s_sc_aw_req(m03_nodes_M_SC_AW_REQ),
        .s_sc_aw_send(m03_nodes_M_SC_AW_SEND),
        .s_sc_w_info(m03_nodes_M_SC_W_INFO),
        .s_sc_w_payld(m03_nodes_M_SC_W_PAYLD),
        .s_sc_w_recv(m03_nodes_M_SC_W_RECV),
        .s_sc_w_req(m03_nodes_M_SC_W_REQ),
        .s_sc_w_send(m03_nodes_M_SC_W_SEND));
  m04_exit_pipeline_imp_EUL13H m04_exit_pipeline
       (.aclk(clk_map_M04_ACLK),
        .aresetn(m_axi_aresetn_5),
        .m_axi_araddr(m04_exit_pipeline_m_axi_ARADDR),
        .m_axi_arburst(m04_exit_pipeline_m_axi_ARBURST),
        .m_axi_arcache(m04_exit_pipeline_m_axi_ARCACHE),
        .m_axi_arlen(m04_exit_pipeline_m_axi_ARLEN),
        .m_axi_arlock(m04_exit_pipeline_m_axi_ARLOCK),
        .m_axi_arprot(m04_exit_pipeline_m_axi_ARPROT),
        .m_axi_arqos(m04_exit_pipeline_m_axi_ARQOS),
        .m_axi_arready(m04_exit_pipeline_m_axi_ARREADY),
        .m_axi_arsize(m04_exit_pipeline_m_axi_ARSIZE),
        .m_axi_aruser(m04_exit_pipeline_m_axi_ARUSER),
        .m_axi_arvalid(m04_exit_pipeline_m_axi_ARVALID),
        .m_axi_awaddr(m04_exit_pipeline_m_axi_AWADDR),
        .m_axi_awburst(m04_exit_pipeline_m_axi_AWBURST),
        .m_axi_awcache(m04_exit_pipeline_m_axi_AWCACHE),
        .m_axi_awlen(m04_exit_pipeline_m_axi_AWLEN),
        .m_axi_awlock(m04_exit_pipeline_m_axi_AWLOCK),
        .m_axi_awprot(m04_exit_pipeline_m_axi_AWPROT),
        .m_axi_awqos(m04_exit_pipeline_m_axi_AWQOS),
        .m_axi_awready(m04_exit_pipeline_m_axi_AWREADY),
        .m_axi_awsize(m04_exit_pipeline_m_axi_AWSIZE),
        .m_axi_awuser(m04_exit_pipeline_m_axi_AWUSER),
        .m_axi_awvalid(m04_exit_pipeline_m_axi_AWVALID),
        .m_axi_bready(m04_exit_pipeline_m_axi_BREADY),
        .m_axi_bresp(m04_exit_pipeline_m_axi_BRESP),
        .m_axi_bvalid(m04_exit_pipeline_m_axi_BVALID),
        .m_axi_rdata(m04_exit_pipeline_m_axi_RDATA),
        .m_axi_rlast(m04_exit_pipeline_m_axi_RLAST),
        .m_axi_rready(m04_exit_pipeline_m_axi_RREADY),
        .m_axi_rresp(m04_exit_pipeline_m_axi_RRESP),
        .m_axi_rvalid(m04_exit_pipeline_m_axi_RVALID),
        .m_axi_wdata(m04_exit_pipeline_m_axi_WDATA),
        .m_axi_wlast(m04_exit_pipeline_m_axi_WLAST),
        .m_axi_wready(m04_exit_pipeline_m_axi_WREADY),
        .m_axi_wstrb(m04_exit_pipeline_m_axi_WSTRB),
        .m_axi_wvalid(m04_exit_pipeline_m_axi_WVALID),
        .s_axi_araddr(m04_sc2axi_M_AXI_ARADDR),
        .s_axi_arcache(m04_sc2axi_M_AXI_ARCACHE),
        .s_axi_arid(m04_sc2axi_M_AXI_ARID),
        .s_axi_arlen(m04_sc2axi_M_AXI_ARLEN),
        .s_axi_arlock(m04_sc2axi_M_AXI_ARLOCK),
        .s_axi_arprot(m04_sc2axi_M_AXI_ARPROT),
        .s_axi_arqos(m04_sc2axi_M_AXI_ARQOS),
        .s_axi_arready(m04_sc2axi_M_AXI_ARREADY),
        .s_axi_aruser(m04_sc2axi_M_AXI_ARUSER),
        .s_axi_arvalid(m04_sc2axi_M_AXI_ARVALID),
        .s_axi_awaddr(m04_sc2axi_M_AXI_AWADDR),
        .s_axi_awcache(m04_sc2axi_M_AXI_AWCACHE),
        .s_axi_awid(m04_sc2axi_M_AXI_AWID),
        .s_axi_awlen(m04_sc2axi_M_AXI_AWLEN),
        .s_axi_awlock(m04_sc2axi_M_AXI_AWLOCK),
        .s_axi_awprot(m04_sc2axi_M_AXI_AWPROT),
        .s_axi_awqos(m04_sc2axi_M_AXI_AWQOS),
        .s_axi_awready(m04_sc2axi_M_AXI_AWREADY),
        .s_axi_awuser(m04_sc2axi_M_AXI_AWUSER),
        .s_axi_awvalid(m04_sc2axi_M_AXI_AWVALID),
        .s_axi_bid(m04_sc2axi_M_AXI_BID),
        .s_axi_bready(m04_sc2axi_M_AXI_BREADY),
        .s_axi_bresp(m04_sc2axi_M_AXI_BRESP),
        .s_axi_buser(m04_sc2axi_M_AXI_BUSER),
        .s_axi_bvalid(m04_sc2axi_M_AXI_BVALID),
        .s_axi_rdata(m04_sc2axi_M_AXI_RDATA),
        .s_axi_rid(m04_sc2axi_M_AXI_RID),
        .s_axi_rlast(m04_sc2axi_M_AXI_RLAST),
        .s_axi_rready(m04_sc2axi_M_AXI_RREADY),
        .s_axi_rresp(m04_sc2axi_M_AXI_RRESP),
        .s_axi_ruser(m04_sc2axi_M_AXI_RUSER),
        .s_axi_rvalid(m04_sc2axi_M_AXI_RVALID),
        .s_axi_wdata(m04_sc2axi_M_AXI_WDATA),
        .s_axi_wlast(m04_sc2axi_M_AXI_WLAST),
        .s_axi_wready(m04_sc2axi_M_AXI_WREADY),
        .s_axi_wstrb(m04_sc2axi_M_AXI_WSTRB),
        .s_axi_wuser(m04_sc2axi_M_AXI_WUSER),
        .s_axi_wvalid(m04_sc2axi_M_AXI_WVALID));
  m04_nodes_imp_9303CQ m04_nodes
       (.M_SC_AR_info(m04_nodes_M_SC_AR_INFO),
        .M_SC_AR_payld(m04_nodes_M_SC_AR_PAYLD),
        .M_SC_AR_recv(m04_nodes_M_SC_AR_RECV),
        .M_SC_AR_req(m04_nodes_M_SC_AR_REQ),
        .M_SC_AR_send(m04_nodes_M_SC_AR_SEND),
        .M_SC_AW_info(m04_nodes_M_SC_AW_INFO),
        .M_SC_AW_payld(m04_nodes_M_SC_AW_PAYLD),
        .M_SC_AW_recv(m04_nodes_M_SC_AW_RECV),
        .M_SC_AW_req(m04_nodes_M_SC_AW_REQ),
        .M_SC_AW_send(m04_nodes_M_SC_AW_SEND),
        .M_SC_B_info(m04_nodes_M_SC_B_INFO),
        .M_SC_B_payld(m04_nodes_M_SC_B_PAYLD),
        .M_SC_B_recv(m04_nodes_M_SC_B_RECV),
        .M_SC_B_req(m04_nodes_M_SC_B_REQ),
        .M_SC_B_send(m04_nodes_M_SC_B_SEND),
        .M_SC_R_info(m04_nodes_M_SC_R_INFO),
        .M_SC_R_payld(m04_nodes_M_SC_R_PAYLD),
        .M_SC_R_recv(m04_nodes_M_SC_R_RECV),
        .M_SC_R_req(m04_nodes_M_SC_R_REQ),
        .M_SC_R_send(m04_nodes_M_SC_R_SEND),
        .M_SC_W_info(m04_nodes_M_SC_W_INFO),
        .M_SC_W_payld(m04_nodes_M_SC_W_PAYLD),
        .M_SC_W_recv(m04_nodes_M_SC_W_RECV),
        .M_SC_W_req(m04_nodes_M_SC_W_REQ),
        .M_SC_W_send(m04_nodes_M_SC_W_SEND),
        .S_SC_AR_info(S_SC_AR_8_INFO),
        .S_SC_AR_payld(S_SC_AR_8_PAYLD),
        .S_SC_AR_recv(S_SC_AR_8_RECV),
        .S_SC_AR_req(S_SC_AR_8_REQ),
        .S_SC_AR_send(S_SC_AR_8_SEND),
        .S_SC_AW_info(S_SC_AW_8_INFO),
        .S_SC_AW_payld(S_SC_AW_8_PAYLD),
        .S_SC_AW_recv(S_SC_AW_8_RECV),
        .S_SC_AW_req(S_SC_AW_8_REQ),
        .S_SC_AW_send(S_SC_AW_8_SEND),
        .S_SC_B_info(S_SC_B_8_INFO),
        .S_SC_B_payld(S_SC_B_8_PAYLD),
        .S_SC_B_recv(S_SC_B_8_RECV),
        .S_SC_B_req(S_SC_B_8_REQ),
        .S_SC_B_send(S_SC_B_8_SEND),
        .S_SC_R_info(S_SC_R_8_INFO),
        .S_SC_R_payld(S_SC_R_8_PAYLD),
        .S_SC_R_recv(S_SC_R_8_RECV),
        .S_SC_R_req(S_SC_R_8_REQ),
        .S_SC_R_send(S_SC_R_8_SEND),
        .S_SC_W_info(S_SC_W_8_INFO),
        .S_SC_W_payld(S_SC_W_8_PAYLD),
        .S_SC_W_recv(S_SC_W_8_RECV),
        .S_SC_W_req(S_SC_W_8_REQ),
        .S_SC_W_send(S_SC_W_8_SEND),
        .m_axi_aclk(clk_map_M04_ACLK),
        .m_axi_aresetn(m_axi_aresetn_5),
        .s_axi_aclk(swbd_aclk_net),
        .s_axi_aresetn(swbd_aresetn_net));
  bd_63e1_m04s2a_0 m04_sc2axi
       (.aclk(clk_map_M04_ACLK),
        .m_axi_araddr(m04_sc2axi_M_AXI_ARADDR),
        .m_axi_arcache(m04_sc2axi_M_AXI_ARCACHE),
        .m_axi_arid(m04_sc2axi_M_AXI_ARID),
        .m_axi_arlen(m04_sc2axi_M_AXI_ARLEN),
        .m_axi_arlock(m04_sc2axi_M_AXI_ARLOCK),
        .m_axi_arprot(m04_sc2axi_M_AXI_ARPROT),
        .m_axi_arqos(m04_sc2axi_M_AXI_ARQOS),
        .m_axi_arready(m04_sc2axi_M_AXI_ARREADY),
        .m_axi_aruser(m04_sc2axi_M_AXI_ARUSER),
        .m_axi_arvalid(m04_sc2axi_M_AXI_ARVALID),
        .m_axi_awaddr(m04_sc2axi_M_AXI_AWADDR),
        .m_axi_awcache(m04_sc2axi_M_AXI_AWCACHE),
        .m_axi_awid(m04_sc2axi_M_AXI_AWID),
        .m_axi_awlen(m04_sc2axi_M_AXI_AWLEN),
        .m_axi_awlock(m04_sc2axi_M_AXI_AWLOCK),
        .m_axi_awprot(m04_sc2axi_M_AXI_AWPROT),
        .m_axi_awqos(m04_sc2axi_M_AXI_AWQOS),
        .m_axi_awready(m04_sc2axi_M_AXI_AWREADY),
        .m_axi_awuser(m04_sc2axi_M_AXI_AWUSER),
        .m_axi_awvalid(m04_sc2axi_M_AXI_AWVALID),
        .m_axi_bid(m04_sc2axi_M_AXI_BID),
        .m_axi_bready(m04_sc2axi_M_AXI_BREADY),
        .m_axi_bresp(m04_sc2axi_M_AXI_BRESP),
        .m_axi_buser(m04_sc2axi_M_AXI_BUSER),
        .m_axi_bvalid(m04_sc2axi_M_AXI_BVALID),
        .m_axi_rdata(m04_sc2axi_M_AXI_RDATA),
        .m_axi_rid(m04_sc2axi_M_AXI_RID),
        .m_axi_rlast(m04_sc2axi_M_AXI_RLAST),
        .m_axi_rready(m04_sc2axi_M_AXI_RREADY),
        .m_axi_rresp(m04_sc2axi_M_AXI_RRESP),
        .m_axi_ruser(m04_sc2axi_M_AXI_RUSER),
        .m_axi_rvalid(m04_sc2axi_M_AXI_RVALID),
        .m_axi_wdata(m04_sc2axi_M_AXI_WDATA),
        .m_axi_wlast(m04_sc2axi_M_AXI_WLAST),
        .m_axi_wready(m04_sc2axi_M_AXI_WREADY),
        .m_axi_wstrb(m04_sc2axi_M_AXI_WSTRB),
        .m_axi_wuser(m04_sc2axi_M_AXI_WUSER),
        .m_axi_wvalid(m04_sc2axi_M_AXI_WVALID),
        .m_sc_b_info(S_SC_B_8_INFO),
        .m_sc_b_payld(S_SC_B_8_PAYLD),
        .m_sc_b_recv(S_SC_B_8_RECV),
        .m_sc_b_req(S_SC_B_8_REQ),
        .m_sc_b_send(S_SC_B_8_SEND),
        .m_sc_r_info(S_SC_R_8_INFO),
        .m_sc_r_payld(S_SC_R_8_PAYLD),
        .m_sc_r_recv(S_SC_R_8_RECV),
        .m_sc_r_req(S_SC_R_8_REQ),
        .m_sc_r_send(S_SC_R_8_SEND),
        .s_sc_ar_info(m04_nodes_M_SC_AR_INFO),
        .s_sc_ar_payld(m04_nodes_M_SC_AR_PAYLD),
        .s_sc_ar_recv(m04_nodes_M_SC_AR_RECV),
        .s_sc_ar_req(m04_nodes_M_SC_AR_REQ),
        .s_sc_ar_send(m04_nodes_M_SC_AR_SEND),
        .s_sc_aw_info(m04_nodes_M_SC_AW_INFO),
        .s_sc_aw_payld(m04_nodes_M_SC_AW_PAYLD),
        .s_sc_aw_recv(m04_nodes_M_SC_AW_RECV),
        .s_sc_aw_req(m04_nodes_M_SC_AW_REQ),
        .s_sc_aw_send(m04_nodes_M_SC_AW_SEND),
        .s_sc_w_info(m04_nodes_M_SC_W_INFO),
        .s_sc_w_payld(m04_nodes_M_SC_W_PAYLD),
        .s_sc_w_recv(m04_nodes_M_SC_W_RECV),
        .s_sc_w_req(m04_nodes_M_SC_W_REQ),
        .s_sc_w_send(m04_nodes_M_SC_W_SEND));
  m05_exit_pipeline_imp_9MCQA5 m05_exit_pipeline
       (.aclk(clk_map_M05_ACLK),
        .aresetn(m_axi_aresetn_6),
        .m_axi_araddr(m05_exit_pipeline_m_axi_ARADDR),
        .m_axi_arburst(m05_exit_pipeline_m_axi_ARBURST),
        .m_axi_arcache(m05_exit_pipeline_m_axi_ARCACHE),
        .m_axi_arlen(m05_exit_pipeline_m_axi_ARLEN),
        .m_axi_arlock(m05_exit_pipeline_m_axi_ARLOCK),
        .m_axi_arprot(m05_exit_pipeline_m_axi_ARPROT),
        .m_axi_arqos(m05_exit_pipeline_m_axi_ARQOS),
        .m_axi_arready(m05_exit_pipeline_m_axi_ARREADY),
        .m_axi_arsize(m05_exit_pipeline_m_axi_ARSIZE),
        .m_axi_aruser(m05_exit_pipeline_m_axi_ARUSER),
        .m_axi_arvalid(m05_exit_pipeline_m_axi_ARVALID),
        .m_axi_awaddr(m05_exit_pipeline_m_axi_AWADDR),
        .m_axi_awburst(m05_exit_pipeline_m_axi_AWBURST),
        .m_axi_awcache(m05_exit_pipeline_m_axi_AWCACHE),
        .m_axi_awlen(m05_exit_pipeline_m_axi_AWLEN),
        .m_axi_awlock(m05_exit_pipeline_m_axi_AWLOCK),
        .m_axi_awprot(m05_exit_pipeline_m_axi_AWPROT),
        .m_axi_awqos(m05_exit_pipeline_m_axi_AWQOS),
        .m_axi_awready(m05_exit_pipeline_m_axi_AWREADY),
        .m_axi_awsize(m05_exit_pipeline_m_axi_AWSIZE),
        .m_axi_awuser(m05_exit_pipeline_m_axi_AWUSER),
        .m_axi_awvalid(m05_exit_pipeline_m_axi_AWVALID),
        .m_axi_bready(m05_exit_pipeline_m_axi_BREADY),
        .m_axi_bresp(m05_exit_pipeline_m_axi_BRESP),
        .m_axi_bvalid(m05_exit_pipeline_m_axi_BVALID),
        .m_axi_rdata(m05_exit_pipeline_m_axi_RDATA),
        .m_axi_rlast(m05_exit_pipeline_m_axi_RLAST),
        .m_axi_rready(m05_exit_pipeline_m_axi_RREADY),
        .m_axi_rresp(m05_exit_pipeline_m_axi_RRESP),
        .m_axi_rvalid(m05_exit_pipeline_m_axi_RVALID),
        .m_axi_wdata(m05_exit_pipeline_m_axi_WDATA),
        .m_axi_wlast(m05_exit_pipeline_m_axi_WLAST),
        .m_axi_wready(m05_exit_pipeline_m_axi_WREADY),
        .m_axi_wstrb(m05_exit_pipeline_m_axi_WSTRB),
        .m_axi_wvalid(m05_exit_pipeline_m_axi_WVALID),
        .s_axi_araddr(m05_sc2axi_M_AXI_ARADDR),
        .s_axi_arcache(m05_sc2axi_M_AXI_ARCACHE),
        .s_axi_arid(m05_sc2axi_M_AXI_ARID),
        .s_axi_arlen(m05_sc2axi_M_AXI_ARLEN),
        .s_axi_arlock(m05_sc2axi_M_AXI_ARLOCK),
        .s_axi_arprot(m05_sc2axi_M_AXI_ARPROT),
        .s_axi_arqos(m05_sc2axi_M_AXI_ARQOS),
        .s_axi_arready(m05_sc2axi_M_AXI_ARREADY),
        .s_axi_aruser(m05_sc2axi_M_AXI_ARUSER),
        .s_axi_arvalid(m05_sc2axi_M_AXI_ARVALID),
        .s_axi_awaddr(m05_sc2axi_M_AXI_AWADDR),
        .s_axi_awcache(m05_sc2axi_M_AXI_AWCACHE),
        .s_axi_awid(m05_sc2axi_M_AXI_AWID),
        .s_axi_awlen(m05_sc2axi_M_AXI_AWLEN),
        .s_axi_awlock(m05_sc2axi_M_AXI_AWLOCK),
        .s_axi_awprot(m05_sc2axi_M_AXI_AWPROT),
        .s_axi_awqos(m05_sc2axi_M_AXI_AWQOS),
        .s_axi_awready(m05_sc2axi_M_AXI_AWREADY),
        .s_axi_awuser(m05_sc2axi_M_AXI_AWUSER),
        .s_axi_awvalid(m05_sc2axi_M_AXI_AWVALID),
        .s_axi_bid(m05_sc2axi_M_AXI_BID),
        .s_axi_bready(m05_sc2axi_M_AXI_BREADY),
        .s_axi_bresp(m05_sc2axi_M_AXI_BRESP),
        .s_axi_buser(m05_sc2axi_M_AXI_BUSER),
        .s_axi_bvalid(m05_sc2axi_M_AXI_BVALID),
        .s_axi_rdata(m05_sc2axi_M_AXI_RDATA),
        .s_axi_rid(m05_sc2axi_M_AXI_RID),
        .s_axi_rlast(m05_sc2axi_M_AXI_RLAST),
        .s_axi_rready(m05_sc2axi_M_AXI_RREADY),
        .s_axi_rresp(m05_sc2axi_M_AXI_RRESP),
        .s_axi_ruser(m05_sc2axi_M_AXI_RUSER),
        .s_axi_rvalid(m05_sc2axi_M_AXI_RVALID),
        .s_axi_wdata(m05_sc2axi_M_AXI_WDATA),
        .s_axi_wlast(m05_sc2axi_M_AXI_WLAST),
        .s_axi_wready(m05_sc2axi_M_AXI_WREADY),
        .s_axi_wstrb(m05_sc2axi_M_AXI_WSTRB),
        .s_axi_wuser(m05_sc2axi_M_AXI_WUSER),
        .s_axi_wvalid(m05_sc2axi_M_AXI_WVALID));
  m05_nodes_imp_1GMV630 m05_nodes
       (.M_SC_AR_info(m05_nodes_M_SC_AR_INFO),
        .M_SC_AR_payld(m05_nodes_M_SC_AR_PAYLD),
        .M_SC_AR_recv(m05_nodes_M_SC_AR_RECV),
        .M_SC_AR_req(m05_nodes_M_SC_AR_REQ),
        .M_SC_AR_send(m05_nodes_M_SC_AR_SEND),
        .M_SC_AW_info(m05_nodes_M_SC_AW_INFO),
        .M_SC_AW_payld(m05_nodes_M_SC_AW_PAYLD),
        .M_SC_AW_recv(m05_nodes_M_SC_AW_RECV),
        .M_SC_AW_req(m05_nodes_M_SC_AW_REQ),
        .M_SC_AW_send(m05_nodes_M_SC_AW_SEND),
        .M_SC_B_info(m05_nodes_M_SC_B_INFO),
        .M_SC_B_payld(m05_nodes_M_SC_B_PAYLD),
        .M_SC_B_recv(m05_nodes_M_SC_B_RECV),
        .M_SC_B_req(m05_nodes_M_SC_B_REQ),
        .M_SC_B_send(m05_nodes_M_SC_B_SEND),
        .M_SC_R_info(m05_nodes_M_SC_R_INFO),
        .M_SC_R_payld(m05_nodes_M_SC_R_PAYLD),
        .M_SC_R_recv(m05_nodes_M_SC_R_RECV),
        .M_SC_R_req(m05_nodes_M_SC_R_REQ),
        .M_SC_R_send(m05_nodes_M_SC_R_SEND),
        .M_SC_W_info(m05_nodes_M_SC_W_INFO),
        .M_SC_W_payld(m05_nodes_M_SC_W_PAYLD),
        .M_SC_W_recv(m05_nodes_M_SC_W_RECV),
        .M_SC_W_req(m05_nodes_M_SC_W_REQ),
        .M_SC_W_send(m05_nodes_M_SC_W_SEND),
        .S_SC_AR_info(S_SC_AR_9_INFO),
        .S_SC_AR_payld(S_SC_AR_9_PAYLD),
        .S_SC_AR_recv(S_SC_AR_9_RECV),
        .S_SC_AR_req(S_SC_AR_9_REQ),
        .S_SC_AR_send(S_SC_AR_9_SEND),
        .S_SC_AW_info(S_SC_AW_9_INFO),
        .S_SC_AW_payld(S_SC_AW_9_PAYLD),
        .S_SC_AW_recv(S_SC_AW_9_RECV),
        .S_SC_AW_req(S_SC_AW_9_REQ),
        .S_SC_AW_send(S_SC_AW_9_SEND),
        .S_SC_B_info(S_SC_B_9_INFO),
        .S_SC_B_payld(S_SC_B_9_PAYLD),
        .S_SC_B_recv(S_SC_B_9_RECV),
        .S_SC_B_req(S_SC_B_9_REQ),
        .S_SC_B_send(S_SC_B_9_SEND),
        .S_SC_R_info(S_SC_R_9_INFO),
        .S_SC_R_payld(S_SC_R_9_PAYLD),
        .S_SC_R_recv(S_SC_R_9_RECV),
        .S_SC_R_req(S_SC_R_9_REQ),
        .S_SC_R_send(S_SC_R_9_SEND),
        .S_SC_W_info(S_SC_W_9_INFO),
        .S_SC_W_payld(S_SC_W_9_PAYLD),
        .S_SC_W_recv(S_SC_W_9_RECV),
        .S_SC_W_req(S_SC_W_9_REQ),
        .S_SC_W_send(S_SC_W_9_SEND),
        .m_axi_aclk(clk_map_M05_ACLK),
        .m_axi_aresetn(m_axi_aresetn_6),
        .s_axi_aclk(swbd_aclk_net),
        .s_axi_aresetn(swbd_aresetn_net));
  bd_63e1_m05s2a_0 m05_sc2axi
       (.aclk(clk_map_M05_ACLK),
        .m_axi_araddr(m05_sc2axi_M_AXI_ARADDR),
        .m_axi_arcache(m05_sc2axi_M_AXI_ARCACHE),
        .m_axi_arid(m05_sc2axi_M_AXI_ARID),
        .m_axi_arlen(m05_sc2axi_M_AXI_ARLEN),
        .m_axi_arlock(m05_sc2axi_M_AXI_ARLOCK),
        .m_axi_arprot(m05_sc2axi_M_AXI_ARPROT),
        .m_axi_arqos(m05_sc2axi_M_AXI_ARQOS),
        .m_axi_arready(m05_sc2axi_M_AXI_ARREADY),
        .m_axi_aruser(m05_sc2axi_M_AXI_ARUSER),
        .m_axi_arvalid(m05_sc2axi_M_AXI_ARVALID),
        .m_axi_awaddr(m05_sc2axi_M_AXI_AWADDR),
        .m_axi_awcache(m05_sc2axi_M_AXI_AWCACHE),
        .m_axi_awid(m05_sc2axi_M_AXI_AWID),
        .m_axi_awlen(m05_sc2axi_M_AXI_AWLEN),
        .m_axi_awlock(m05_sc2axi_M_AXI_AWLOCK),
        .m_axi_awprot(m05_sc2axi_M_AXI_AWPROT),
        .m_axi_awqos(m05_sc2axi_M_AXI_AWQOS),
        .m_axi_awready(m05_sc2axi_M_AXI_AWREADY),
        .m_axi_awuser(m05_sc2axi_M_AXI_AWUSER),
        .m_axi_awvalid(m05_sc2axi_M_AXI_AWVALID),
        .m_axi_bid(m05_sc2axi_M_AXI_BID),
        .m_axi_bready(m05_sc2axi_M_AXI_BREADY),
        .m_axi_bresp(m05_sc2axi_M_AXI_BRESP),
        .m_axi_buser(m05_sc2axi_M_AXI_BUSER),
        .m_axi_bvalid(m05_sc2axi_M_AXI_BVALID),
        .m_axi_rdata(m05_sc2axi_M_AXI_RDATA),
        .m_axi_rid(m05_sc2axi_M_AXI_RID),
        .m_axi_rlast(m05_sc2axi_M_AXI_RLAST),
        .m_axi_rready(m05_sc2axi_M_AXI_RREADY),
        .m_axi_rresp(m05_sc2axi_M_AXI_RRESP),
        .m_axi_ruser(m05_sc2axi_M_AXI_RUSER),
        .m_axi_rvalid(m05_sc2axi_M_AXI_RVALID),
        .m_axi_wdata(m05_sc2axi_M_AXI_WDATA),
        .m_axi_wlast(m05_sc2axi_M_AXI_WLAST),
        .m_axi_wready(m05_sc2axi_M_AXI_WREADY),
        .m_axi_wstrb(m05_sc2axi_M_AXI_WSTRB),
        .m_axi_wuser(m05_sc2axi_M_AXI_WUSER),
        .m_axi_wvalid(m05_sc2axi_M_AXI_WVALID),
        .m_sc_b_info(S_SC_B_9_INFO),
        .m_sc_b_payld(S_SC_B_9_PAYLD),
        .m_sc_b_recv(S_SC_B_9_RECV),
        .m_sc_b_req(S_SC_B_9_REQ),
        .m_sc_b_send(S_SC_B_9_SEND),
        .m_sc_r_info(S_SC_R_9_INFO),
        .m_sc_r_payld(S_SC_R_9_PAYLD),
        .m_sc_r_recv(S_SC_R_9_RECV),
        .m_sc_r_req(S_SC_R_9_REQ),
        .m_sc_r_send(S_SC_R_9_SEND),
        .s_sc_ar_info(m05_nodes_M_SC_AR_INFO),
        .s_sc_ar_payld(m05_nodes_M_SC_AR_PAYLD),
        .s_sc_ar_recv(m05_nodes_M_SC_AR_RECV),
        .s_sc_ar_req(m05_nodes_M_SC_AR_REQ),
        .s_sc_ar_send(m05_nodes_M_SC_AR_SEND),
        .s_sc_aw_info(m05_nodes_M_SC_AW_INFO),
        .s_sc_aw_payld(m05_nodes_M_SC_AW_PAYLD),
        .s_sc_aw_recv(m05_nodes_M_SC_AW_RECV),
        .s_sc_aw_req(m05_nodes_M_SC_AW_REQ),
        .s_sc_aw_send(m05_nodes_M_SC_AW_SEND),
        .s_sc_w_info(m05_nodes_M_SC_W_INFO),
        .s_sc_w_payld(m05_nodes_M_SC_W_PAYLD),
        .s_sc_w_recv(m05_nodes_M_SC_W_RECV),
        .s_sc_w_req(m05_nodes_M_SC_W_REQ),
        .s_sc_w_send(m05_nodes_M_SC_W_SEND));
  m06_exit_pipeline_imp_7PYV65 m06_exit_pipeline
       (.aclk(clk_map_M06_ACLK),
        .aresetn(m_axi_aresetn_7),
        .m_axi_araddr(m06_exit_pipeline_m_axi_ARADDR),
        .m_axi_arprot(m06_exit_pipeline_m_axi_ARPROT),
        .m_axi_arready(m06_exit_pipeline_m_axi_ARREADY),
        .m_axi_arvalid(m06_exit_pipeline_m_axi_ARVALID),
        .m_axi_awaddr(m06_exit_pipeline_m_axi_AWADDR),
        .m_axi_awprot(m06_exit_pipeline_m_axi_AWPROT),
        .m_axi_awready(m06_exit_pipeline_m_axi_AWREADY),
        .m_axi_awvalid(m06_exit_pipeline_m_axi_AWVALID),
        .m_axi_bready(m06_exit_pipeline_m_axi_BREADY),
        .m_axi_bresp(m06_exit_pipeline_m_axi_BRESP),
        .m_axi_bvalid(m06_exit_pipeline_m_axi_BVALID),
        .m_axi_rdata(m06_exit_pipeline_m_axi_RDATA),
        .m_axi_rready(m06_exit_pipeline_m_axi_RREADY),
        .m_axi_rresp(m06_exit_pipeline_m_axi_RRESP),
        .m_axi_rvalid(m06_exit_pipeline_m_axi_RVALID),
        .m_axi_wdata(m06_exit_pipeline_m_axi_WDATA),
        .m_axi_wready(m06_exit_pipeline_m_axi_WREADY),
        .m_axi_wstrb(m06_exit_pipeline_m_axi_WSTRB),
        .m_axi_wvalid(m06_exit_pipeline_m_axi_WVALID),
        .s_axi_araddr(m06_sc2axi_M_AXI_ARADDR),
        .s_axi_arcache(m06_sc2axi_M_AXI_ARCACHE),
        .s_axi_arid(m06_sc2axi_M_AXI_ARID),
        .s_axi_arlen(m06_sc2axi_M_AXI_ARLEN),
        .s_axi_arlock(m06_sc2axi_M_AXI_ARLOCK),
        .s_axi_arprot(m06_sc2axi_M_AXI_ARPROT),
        .s_axi_arqos(m06_sc2axi_M_AXI_ARQOS),
        .s_axi_arready(m06_sc2axi_M_AXI_ARREADY),
        .s_axi_aruser(m06_sc2axi_M_AXI_ARUSER),
        .s_axi_arvalid(m06_sc2axi_M_AXI_ARVALID),
        .s_axi_awaddr(m06_sc2axi_M_AXI_AWADDR),
        .s_axi_awcache(m06_sc2axi_M_AXI_AWCACHE),
        .s_axi_awid(m06_sc2axi_M_AXI_AWID),
        .s_axi_awlen(m06_sc2axi_M_AXI_AWLEN),
        .s_axi_awlock(m06_sc2axi_M_AXI_AWLOCK),
        .s_axi_awprot(m06_sc2axi_M_AXI_AWPROT),
        .s_axi_awqos(m06_sc2axi_M_AXI_AWQOS),
        .s_axi_awready(m06_sc2axi_M_AXI_AWREADY),
        .s_axi_awuser(m06_sc2axi_M_AXI_AWUSER),
        .s_axi_awvalid(m06_sc2axi_M_AXI_AWVALID),
        .s_axi_bid(m06_sc2axi_M_AXI_BID),
        .s_axi_bready(m06_sc2axi_M_AXI_BREADY),
        .s_axi_bresp(m06_sc2axi_M_AXI_BRESP),
        .s_axi_buser(m06_sc2axi_M_AXI_BUSER),
        .s_axi_bvalid(m06_sc2axi_M_AXI_BVALID),
        .s_axi_rdata(m06_sc2axi_M_AXI_RDATA),
        .s_axi_rid(m06_sc2axi_M_AXI_RID),
        .s_axi_rlast(m06_sc2axi_M_AXI_RLAST),
        .s_axi_rready(m06_sc2axi_M_AXI_RREADY),
        .s_axi_rresp(m06_sc2axi_M_AXI_RRESP),
        .s_axi_ruser(m06_sc2axi_M_AXI_RUSER),
        .s_axi_rvalid(m06_sc2axi_M_AXI_RVALID),
        .s_axi_wdata(m06_sc2axi_M_AXI_WDATA),
        .s_axi_wlast(m06_sc2axi_M_AXI_WLAST),
        .s_axi_wready(m06_sc2axi_M_AXI_WREADY),
        .s_axi_wstrb(m06_sc2axi_M_AXI_WSTRB),
        .s_axi_wuser(m06_sc2axi_M_AXI_WUSER),
        .s_axi_wvalid(m06_sc2axi_M_AXI_WVALID));
  m06_nodes_imp_1HS18WN m06_nodes
       (.M_SC_AR_info(m06_nodes_M_SC_AR_INFO),
        .M_SC_AR_payld(m06_nodes_M_SC_AR_PAYLD),
        .M_SC_AR_recv(m06_nodes_M_SC_AR_RECV),
        .M_SC_AR_req(m06_nodes_M_SC_AR_REQ),
        .M_SC_AR_send(m06_nodes_M_SC_AR_SEND),
        .M_SC_AW_info(m06_nodes_M_SC_AW_INFO),
        .M_SC_AW_payld(m06_nodes_M_SC_AW_PAYLD),
        .M_SC_AW_recv(m06_nodes_M_SC_AW_RECV),
        .M_SC_AW_req(m06_nodes_M_SC_AW_REQ),
        .M_SC_AW_send(m06_nodes_M_SC_AW_SEND),
        .M_SC_B_info(m06_nodes_M_SC_B_INFO),
        .M_SC_B_payld(m06_nodes_M_SC_B_PAYLD),
        .M_SC_B_recv(m06_nodes_M_SC_B_RECV),
        .M_SC_B_req(m06_nodes_M_SC_B_REQ),
        .M_SC_B_send(m06_nodes_M_SC_B_SEND),
        .M_SC_R_info(m06_nodes_M_SC_R_INFO),
        .M_SC_R_payld(m06_nodes_M_SC_R_PAYLD),
        .M_SC_R_recv(m06_nodes_M_SC_R_RECV),
        .M_SC_R_req(m06_nodes_M_SC_R_REQ),
        .M_SC_R_send(m06_nodes_M_SC_R_SEND),
        .M_SC_W_info(m06_nodes_M_SC_W_INFO),
        .M_SC_W_payld(m06_nodes_M_SC_W_PAYLD),
        .M_SC_W_recv(m06_nodes_M_SC_W_RECV),
        .M_SC_W_req(m06_nodes_M_SC_W_REQ),
        .M_SC_W_send(m06_nodes_M_SC_W_SEND),
        .S_SC_AR_info(S_SC_AR_10_INFO),
        .S_SC_AR_payld(S_SC_AR_10_PAYLD),
        .S_SC_AR_recv(S_SC_AR_10_RECV),
        .S_SC_AR_req(S_SC_AR_10_REQ),
        .S_SC_AR_send(S_SC_AR_10_SEND),
        .S_SC_AW_info(S_SC_AW_10_INFO),
        .S_SC_AW_payld(S_SC_AW_10_PAYLD),
        .S_SC_AW_recv(S_SC_AW_10_RECV),
        .S_SC_AW_req(S_SC_AW_10_REQ),
        .S_SC_AW_send(S_SC_AW_10_SEND),
        .S_SC_B_info(S_SC_B_10_INFO),
        .S_SC_B_payld(S_SC_B_10_PAYLD),
        .S_SC_B_recv(S_SC_B_10_RECV),
        .S_SC_B_req(S_SC_B_10_REQ),
        .S_SC_B_send(S_SC_B_10_SEND),
        .S_SC_R_info(S_SC_R_10_INFO),
        .S_SC_R_payld(S_SC_R_10_PAYLD),
        .S_SC_R_recv(S_SC_R_10_RECV),
        .S_SC_R_req(S_SC_R_10_REQ),
        .S_SC_R_send(S_SC_R_10_SEND),
        .S_SC_W_info(S_SC_W_10_INFO),
        .S_SC_W_payld(S_SC_W_10_PAYLD),
        .S_SC_W_recv(S_SC_W_10_RECV),
        .S_SC_W_req(S_SC_W_10_REQ),
        .S_SC_W_send(S_SC_W_10_SEND),
        .m_axi_aclk(clk_map_M06_ACLK),
        .m_axi_aresetn(m_axi_aresetn_7),
        .s_axi_aclk(swbd_aclk_net),
        .s_axi_aresetn(swbd_aresetn_net));
  bd_63e1_m06s2a_0 m06_sc2axi
       (.aclk(clk_map_M06_ACLK),
        .m_axi_araddr(m06_sc2axi_M_AXI_ARADDR),
        .m_axi_arcache(m06_sc2axi_M_AXI_ARCACHE),
        .m_axi_arid(m06_sc2axi_M_AXI_ARID),
        .m_axi_arlen(m06_sc2axi_M_AXI_ARLEN),
        .m_axi_arlock(m06_sc2axi_M_AXI_ARLOCK),
        .m_axi_arprot(m06_sc2axi_M_AXI_ARPROT),
        .m_axi_arqos(m06_sc2axi_M_AXI_ARQOS),
        .m_axi_arready(m06_sc2axi_M_AXI_ARREADY),
        .m_axi_aruser(m06_sc2axi_M_AXI_ARUSER),
        .m_axi_arvalid(m06_sc2axi_M_AXI_ARVALID),
        .m_axi_awaddr(m06_sc2axi_M_AXI_AWADDR),
        .m_axi_awcache(m06_sc2axi_M_AXI_AWCACHE),
        .m_axi_awid(m06_sc2axi_M_AXI_AWID),
        .m_axi_awlen(m06_sc2axi_M_AXI_AWLEN),
        .m_axi_awlock(m06_sc2axi_M_AXI_AWLOCK),
        .m_axi_awprot(m06_sc2axi_M_AXI_AWPROT),
        .m_axi_awqos(m06_sc2axi_M_AXI_AWQOS),
        .m_axi_awready(m06_sc2axi_M_AXI_AWREADY),
        .m_axi_awuser(m06_sc2axi_M_AXI_AWUSER),
        .m_axi_awvalid(m06_sc2axi_M_AXI_AWVALID),
        .m_axi_bid(m06_sc2axi_M_AXI_BID),
        .m_axi_bready(m06_sc2axi_M_AXI_BREADY),
        .m_axi_bresp(m06_sc2axi_M_AXI_BRESP),
        .m_axi_buser(m06_sc2axi_M_AXI_BUSER),
        .m_axi_bvalid(m06_sc2axi_M_AXI_BVALID),
        .m_axi_rdata(m06_sc2axi_M_AXI_RDATA),
        .m_axi_rid(m06_sc2axi_M_AXI_RID),
        .m_axi_rlast(m06_sc2axi_M_AXI_RLAST),
        .m_axi_rready(m06_sc2axi_M_AXI_RREADY),
        .m_axi_rresp(m06_sc2axi_M_AXI_RRESP),
        .m_axi_ruser(m06_sc2axi_M_AXI_RUSER),
        .m_axi_rvalid(m06_sc2axi_M_AXI_RVALID),
        .m_axi_wdata(m06_sc2axi_M_AXI_WDATA),
        .m_axi_wlast(m06_sc2axi_M_AXI_WLAST),
        .m_axi_wready(m06_sc2axi_M_AXI_WREADY),
        .m_axi_wstrb(m06_sc2axi_M_AXI_WSTRB),
        .m_axi_wuser(m06_sc2axi_M_AXI_WUSER),
        .m_axi_wvalid(m06_sc2axi_M_AXI_WVALID),
        .m_sc_b_info(S_SC_B_10_INFO),
        .m_sc_b_payld(S_SC_B_10_PAYLD),
        .m_sc_b_recv(S_SC_B_10_RECV),
        .m_sc_b_req(S_SC_B_10_REQ),
        .m_sc_b_send(S_SC_B_10_SEND),
        .m_sc_r_info(S_SC_R_10_INFO),
        .m_sc_r_payld(S_SC_R_10_PAYLD),
        .m_sc_r_recv(S_SC_R_10_RECV),
        .m_sc_r_req(S_SC_R_10_REQ),
        .m_sc_r_send(S_SC_R_10_SEND),
        .s_sc_ar_info(m06_nodes_M_SC_AR_INFO),
        .s_sc_ar_payld(m06_nodes_M_SC_AR_PAYLD),
        .s_sc_ar_recv(m06_nodes_M_SC_AR_RECV),
        .s_sc_ar_req(m06_nodes_M_SC_AR_REQ),
        .s_sc_ar_send(m06_nodes_M_SC_AR_SEND),
        .s_sc_aw_info(m06_nodes_M_SC_AW_INFO),
        .s_sc_aw_payld(m06_nodes_M_SC_AW_PAYLD),
        .s_sc_aw_recv(m06_nodes_M_SC_AW_RECV),
        .s_sc_aw_req(m06_nodes_M_SC_AW_REQ),
        .s_sc_aw_send(m06_nodes_M_SC_AW_SEND),
        .s_sc_w_info(m06_nodes_M_SC_W_INFO),
        .s_sc_w_payld(m06_nodes_M_SC_W_PAYLD),
        .s_sc_w_recv(m06_nodes_M_SC_W_RECV),
        .s_sc_w_req(m06_nodes_M_SC_W_REQ),
        .s_sc_w_send(m06_nodes_M_SC_W_SEND));
  m07_exit_pipeline_imp_3LPND9 m07_exit_pipeline
       (.aclk(clk_map_M07_ACLK),
        .aresetn(m_axi_aresetn_8),
        .m_axi_araddr(m07_exit_pipeline_m_axi_ARADDR),
        .m_axi_arprot(m07_exit_pipeline_m_axi_ARPROT),
        .m_axi_arready(m07_exit_pipeline_m_axi_ARREADY),
        .m_axi_arvalid(m07_exit_pipeline_m_axi_ARVALID),
        .m_axi_awaddr(m07_exit_pipeline_m_axi_AWADDR),
        .m_axi_awprot(m07_exit_pipeline_m_axi_AWPROT),
        .m_axi_awready(m07_exit_pipeline_m_axi_AWREADY),
        .m_axi_awvalid(m07_exit_pipeline_m_axi_AWVALID),
        .m_axi_bready(m07_exit_pipeline_m_axi_BREADY),
        .m_axi_bresp(m07_exit_pipeline_m_axi_BRESP),
        .m_axi_bvalid(m07_exit_pipeline_m_axi_BVALID),
        .m_axi_rdata(m07_exit_pipeline_m_axi_RDATA),
        .m_axi_rready(m07_exit_pipeline_m_axi_RREADY),
        .m_axi_rresp(m07_exit_pipeline_m_axi_RRESP),
        .m_axi_rvalid(m07_exit_pipeline_m_axi_RVALID),
        .m_axi_wdata(m07_exit_pipeline_m_axi_WDATA),
        .m_axi_wready(m07_exit_pipeline_m_axi_WREADY),
        .m_axi_wstrb(m07_exit_pipeline_m_axi_WSTRB),
        .m_axi_wvalid(m07_exit_pipeline_m_axi_WVALID),
        .s_axi_araddr(m07_sc2axi_M_AXI_ARADDR),
        .s_axi_arcache(m07_sc2axi_M_AXI_ARCACHE),
        .s_axi_arid(m07_sc2axi_M_AXI_ARID),
        .s_axi_arlen(m07_sc2axi_M_AXI_ARLEN),
        .s_axi_arlock(m07_sc2axi_M_AXI_ARLOCK),
        .s_axi_arprot(m07_sc2axi_M_AXI_ARPROT),
        .s_axi_arqos(m07_sc2axi_M_AXI_ARQOS),
        .s_axi_arready(m07_sc2axi_M_AXI_ARREADY),
        .s_axi_aruser(m07_sc2axi_M_AXI_ARUSER),
        .s_axi_arvalid(m07_sc2axi_M_AXI_ARVALID),
        .s_axi_awaddr(m07_sc2axi_M_AXI_AWADDR),
        .s_axi_awcache(m07_sc2axi_M_AXI_AWCACHE),
        .s_axi_awid(m07_sc2axi_M_AXI_AWID),
        .s_axi_awlen(m07_sc2axi_M_AXI_AWLEN),
        .s_axi_awlock(m07_sc2axi_M_AXI_AWLOCK),
        .s_axi_awprot(m07_sc2axi_M_AXI_AWPROT),
        .s_axi_awqos(m07_sc2axi_M_AXI_AWQOS),
        .s_axi_awready(m07_sc2axi_M_AXI_AWREADY),
        .s_axi_awuser(m07_sc2axi_M_AXI_AWUSER),
        .s_axi_awvalid(m07_sc2axi_M_AXI_AWVALID),
        .s_axi_bid(m07_sc2axi_M_AXI_BID),
        .s_axi_bready(m07_sc2axi_M_AXI_BREADY),
        .s_axi_bresp(m07_sc2axi_M_AXI_BRESP),
        .s_axi_buser(m07_sc2axi_M_AXI_BUSER),
        .s_axi_bvalid(m07_sc2axi_M_AXI_BVALID),
        .s_axi_rdata(m07_sc2axi_M_AXI_RDATA),
        .s_axi_rid(m07_sc2axi_M_AXI_RID),
        .s_axi_rlast(m07_sc2axi_M_AXI_RLAST),
        .s_axi_rready(m07_sc2axi_M_AXI_RREADY),
        .s_axi_rresp(m07_sc2axi_M_AXI_RRESP),
        .s_axi_ruser(m07_sc2axi_M_AXI_RUSER),
        .s_axi_rvalid(m07_sc2axi_M_AXI_RVALID),
        .s_axi_wdata(m07_sc2axi_M_AXI_WDATA),
        .s_axi_wlast(m07_sc2axi_M_AXI_WLAST),
        .s_axi_wready(m07_sc2axi_M_AXI_WREADY),
        .s_axi_wstrb(m07_sc2axi_M_AXI_WSTRB),
        .s_axi_wuser(m07_sc2axi_M_AXI_WUSER),
        .s_axi_wvalid(m07_sc2axi_M_AXI_WVALID));
  m07_nodes_imp_PRLVKX m07_nodes
       (.M_SC_AR_info(m07_nodes_M_SC_AR_INFO),
        .M_SC_AR_payld(m07_nodes_M_SC_AR_PAYLD),
        .M_SC_AR_recv(m07_nodes_M_SC_AR_RECV),
        .M_SC_AR_req(m07_nodes_M_SC_AR_REQ),
        .M_SC_AR_send(m07_nodes_M_SC_AR_SEND),
        .M_SC_AW_info(m07_nodes_M_SC_AW_INFO),
        .M_SC_AW_payld(m07_nodes_M_SC_AW_PAYLD),
        .M_SC_AW_recv(m07_nodes_M_SC_AW_RECV),
        .M_SC_AW_req(m07_nodes_M_SC_AW_REQ),
        .M_SC_AW_send(m07_nodes_M_SC_AW_SEND),
        .M_SC_B_info(m07_nodes_M_SC_B_INFO),
        .M_SC_B_payld(m07_nodes_M_SC_B_PAYLD),
        .M_SC_B_recv(m07_nodes_M_SC_B_RECV),
        .M_SC_B_req(m07_nodes_M_SC_B_REQ),
        .M_SC_B_send(m07_nodes_M_SC_B_SEND),
        .M_SC_R_info(m07_nodes_M_SC_R_INFO),
        .M_SC_R_payld(m07_nodes_M_SC_R_PAYLD),
        .M_SC_R_recv(m07_nodes_M_SC_R_RECV),
        .M_SC_R_req(m07_nodes_M_SC_R_REQ),
        .M_SC_R_send(m07_nodes_M_SC_R_SEND),
        .M_SC_W_info(m07_nodes_M_SC_W_INFO),
        .M_SC_W_payld(m07_nodes_M_SC_W_PAYLD),
        .M_SC_W_recv(m07_nodes_M_SC_W_RECV),
        .M_SC_W_req(m07_nodes_M_SC_W_REQ),
        .M_SC_W_send(m07_nodes_M_SC_W_SEND),
        .S_SC_AR_info(S_SC_AR_11_INFO),
        .S_SC_AR_payld(S_SC_AR_11_PAYLD),
        .S_SC_AR_recv(S_SC_AR_11_RECV),
        .S_SC_AR_req(S_SC_AR_11_REQ),
        .S_SC_AR_send(S_SC_AR_11_SEND),
        .S_SC_AW_info(S_SC_AW_11_INFO),
        .S_SC_AW_payld(S_SC_AW_11_PAYLD),
        .S_SC_AW_recv(S_SC_AW_11_RECV),
        .S_SC_AW_req(S_SC_AW_11_REQ),
        .S_SC_AW_send(S_SC_AW_11_SEND),
        .S_SC_B_info(S_SC_B_11_INFO),
        .S_SC_B_payld(S_SC_B_11_PAYLD),
        .S_SC_B_recv(S_SC_B_11_RECV),
        .S_SC_B_req(S_SC_B_11_REQ),
        .S_SC_B_send(S_SC_B_11_SEND),
        .S_SC_R_info(S_SC_R_11_INFO),
        .S_SC_R_payld(S_SC_R_11_PAYLD),
        .S_SC_R_recv(S_SC_R_11_RECV),
        .S_SC_R_req(S_SC_R_11_REQ),
        .S_SC_R_send(S_SC_R_11_SEND),
        .S_SC_W_info(S_SC_W_11_INFO),
        .S_SC_W_payld(S_SC_W_11_PAYLD),
        .S_SC_W_recv(S_SC_W_11_RECV),
        .S_SC_W_req(S_SC_W_11_REQ),
        .S_SC_W_send(S_SC_W_11_SEND),
        .m_axi_aclk(clk_map_M07_ACLK),
        .m_axi_aresetn(m_axi_aresetn_8),
        .s_axi_aclk(swbd_aclk_net),
        .s_axi_aresetn(swbd_aresetn_net));
  bd_63e1_m07s2a_0 m07_sc2axi
       (.aclk(clk_map_M07_ACLK),
        .m_axi_araddr(m07_sc2axi_M_AXI_ARADDR),
        .m_axi_arcache(m07_sc2axi_M_AXI_ARCACHE),
        .m_axi_arid(m07_sc2axi_M_AXI_ARID),
        .m_axi_arlen(m07_sc2axi_M_AXI_ARLEN),
        .m_axi_arlock(m07_sc2axi_M_AXI_ARLOCK),
        .m_axi_arprot(m07_sc2axi_M_AXI_ARPROT),
        .m_axi_arqos(m07_sc2axi_M_AXI_ARQOS),
        .m_axi_arready(m07_sc2axi_M_AXI_ARREADY),
        .m_axi_aruser(m07_sc2axi_M_AXI_ARUSER),
        .m_axi_arvalid(m07_sc2axi_M_AXI_ARVALID),
        .m_axi_awaddr(m07_sc2axi_M_AXI_AWADDR),
        .m_axi_awcache(m07_sc2axi_M_AXI_AWCACHE),
        .m_axi_awid(m07_sc2axi_M_AXI_AWID),
        .m_axi_awlen(m07_sc2axi_M_AXI_AWLEN),
        .m_axi_awlock(m07_sc2axi_M_AXI_AWLOCK),
        .m_axi_awprot(m07_sc2axi_M_AXI_AWPROT),
        .m_axi_awqos(m07_sc2axi_M_AXI_AWQOS),
        .m_axi_awready(m07_sc2axi_M_AXI_AWREADY),
        .m_axi_awuser(m07_sc2axi_M_AXI_AWUSER),
        .m_axi_awvalid(m07_sc2axi_M_AXI_AWVALID),
        .m_axi_bid(m07_sc2axi_M_AXI_BID),
        .m_axi_bready(m07_sc2axi_M_AXI_BREADY),
        .m_axi_bresp(m07_sc2axi_M_AXI_BRESP),
        .m_axi_buser(m07_sc2axi_M_AXI_BUSER),
        .m_axi_bvalid(m07_sc2axi_M_AXI_BVALID),
        .m_axi_rdata(m07_sc2axi_M_AXI_RDATA),
        .m_axi_rid(m07_sc2axi_M_AXI_RID),
        .m_axi_rlast(m07_sc2axi_M_AXI_RLAST),
        .m_axi_rready(m07_sc2axi_M_AXI_RREADY),
        .m_axi_rresp(m07_sc2axi_M_AXI_RRESP),
        .m_axi_ruser(m07_sc2axi_M_AXI_RUSER),
        .m_axi_rvalid(m07_sc2axi_M_AXI_RVALID),
        .m_axi_wdata(m07_sc2axi_M_AXI_WDATA),
        .m_axi_wlast(m07_sc2axi_M_AXI_WLAST),
        .m_axi_wready(m07_sc2axi_M_AXI_WREADY),
        .m_axi_wstrb(m07_sc2axi_M_AXI_WSTRB),
        .m_axi_wuser(m07_sc2axi_M_AXI_WUSER),
        .m_axi_wvalid(m07_sc2axi_M_AXI_WVALID),
        .m_sc_b_info(S_SC_B_11_INFO),
        .m_sc_b_payld(S_SC_B_11_PAYLD),
        .m_sc_b_recv(S_SC_B_11_RECV),
        .m_sc_b_req(S_SC_B_11_REQ),
        .m_sc_b_send(S_SC_B_11_SEND),
        .m_sc_r_info(S_SC_R_11_INFO),
        .m_sc_r_payld(S_SC_R_11_PAYLD),
        .m_sc_r_recv(S_SC_R_11_RECV),
        .m_sc_r_req(S_SC_R_11_REQ),
        .m_sc_r_send(S_SC_R_11_SEND),
        .s_sc_ar_info(m07_nodes_M_SC_AR_INFO),
        .s_sc_ar_payld(m07_nodes_M_SC_AR_PAYLD),
        .s_sc_ar_recv(m07_nodes_M_SC_AR_RECV),
        .s_sc_ar_req(m07_nodes_M_SC_AR_REQ),
        .s_sc_ar_send(m07_nodes_M_SC_AR_SEND),
        .s_sc_aw_info(m07_nodes_M_SC_AW_INFO),
        .s_sc_aw_payld(m07_nodes_M_SC_AW_PAYLD),
        .s_sc_aw_recv(m07_nodes_M_SC_AW_RECV),
        .s_sc_aw_req(m07_nodes_M_SC_AW_REQ),
        .s_sc_aw_send(m07_nodes_M_SC_AW_SEND),
        .s_sc_w_info(m07_nodes_M_SC_W_INFO),
        .s_sc_w_payld(m07_nodes_M_SC_W_PAYLD),
        .s_sc_w_recv(m07_nodes_M_SC_W_RECV),
        .s_sc_w_req(m07_nodes_M_SC_W_REQ),
        .s_sc_w_send(m07_nodes_M_SC_W_SEND));
  bd_63e1_s00a2s_0 s00_axi2sc
       (.aclk(aclk_1),
        .m_sc_ar_info(S_SC_AR_1_INFO),
        .m_sc_ar_payld(S_SC_AR_1_PAYLD),
        .m_sc_ar_recv(S_SC_AR_1_RECV),
        .m_sc_ar_req(S_SC_AR_1_REQ),
        .m_sc_ar_send(S_SC_AR_1_SEND),
        .m_sc_aw_info(S_SC_AW_1_INFO),
        .m_sc_aw_payld(S_SC_AW_1_PAYLD),
        .m_sc_aw_recv(S_SC_AW_1_RECV),
        .m_sc_aw_req(S_SC_AW_1_REQ),
        .m_sc_aw_send(S_SC_AW_1_SEND),
        .m_sc_w_info(S_SC_W_1_INFO),
        .m_sc_w_payld(S_SC_W_1_PAYLD),
        .m_sc_w_recv(S_SC_W_1_RECV),
        .m_sc_w_req(S_SC_W_1_REQ),
        .m_sc_w_send(S_SC_W_1_SEND),
        .s_axi_araddr(s00_entry_pipeline_m_axi_ARADDR),
        .s_axi_arcache(s00_entry_pipeline_m_axi_ARCACHE),
        .s_axi_arid(s00_entry_pipeline_m_axi_ARID),
        .s_axi_arlen(s00_entry_pipeline_m_axi_ARLEN),
        .s_axi_arlock(s00_entry_pipeline_m_axi_ARLOCK),
        .s_axi_arprot(s00_entry_pipeline_m_axi_ARPROT),
        .s_axi_arqos(s00_entry_pipeline_m_axi_ARQOS),
        .s_axi_arready(s00_entry_pipeline_m_axi_ARREADY),
        .s_axi_aruser(s00_entry_pipeline_m_axi_ARUSER),
        .s_axi_arvalid(s00_entry_pipeline_m_axi_ARVALID),
        .s_axi_awaddr(s00_entry_pipeline_m_axi_AWADDR),
        .s_axi_awcache(s00_entry_pipeline_m_axi_AWCACHE),
        .s_axi_awid(s00_entry_pipeline_m_axi_AWID),
        .s_axi_awlen(s00_entry_pipeline_m_axi_AWLEN),
        .s_axi_awlock(s00_entry_pipeline_m_axi_AWLOCK),
        .s_axi_awprot(s00_entry_pipeline_m_axi_AWPROT),
        .s_axi_awqos(s00_entry_pipeline_m_axi_AWQOS),
        .s_axi_awready(s00_entry_pipeline_m_axi_AWREADY),
        .s_axi_awuser(s00_entry_pipeline_m_axi_AWUSER),
        .s_axi_awvalid(s00_entry_pipeline_m_axi_AWVALID),
        .s_axi_bid(s00_entry_pipeline_m_axi_BID),
        .s_axi_bready(s00_entry_pipeline_m_axi_BREADY),
        .s_axi_bresp(s00_entry_pipeline_m_axi_BRESP),
        .s_axi_buser(s00_entry_pipeline_m_axi_BUSER),
        .s_axi_bvalid(s00_entry_pipeline_m_axi_BVALID),
        .s_axi_rdata(s00_entry_pipeline_m_axi_RDATA),
        .s_axi_rid(s00_entry_pipeline_m_axi_RID),
        .s_axi_rlast(s00_entry_pipeline_m_axi_RLAST),
        .s_axi_rready(s00_entry_pipeline_m_axi_RREADY),
        .s_axi_rresp(s00_entry_pipeline_m_axi_RRESP),
        .s_axi_ruser(s00_entry_pipeline_m_axi_RUSER),
        .s_axi_rvalid(s00_entry_pipeline_m_axi_RVALID),
        .s_axi_wdata(s00_entry_pipeline_m_axi_WDATA),
        .s_axi_wlast(s00_entry_pipeline_m_axi_WLAST),
        .s_axi_wready(s00_entry_pipeline_m_axi_WREADY),
        .s_axi_wstrb(s00_entry_pipeline_m_axi_WSTRB),
        .s_axi_wuser(s00_entry_pipeline_m_axi_WUSER),
        .s_axi_wvalid(s00_entry_pipeline_m_axi_WVALID),
        .s_sc_b_info(s00_nodes_M_SC_B_INFO),
        .s_sc_b_payld(s00_nodes_M_SC_B_PAYLD),
        .s_sc_b_recv(s00_nodes_M_SC_B_RECV),
        .s_sc_b_req(s00_nodes_M_SC_B_REQ),
        .s_sc_b_send(s00_nodes_M_SC_B_SEND),
        .s_sc_r_info(s00_nodes_M_SC_R_INFO),
        .s_sc_r_payld(s00_nodes_M_SC_R_PAYLD),
        .s_sc_r_recv(s00_nodes_M_SC_R_RECV),
        .s_sc_r_req(s00_nodes_M_SC_R_REQ),
        .s_sc_r_send(s00_nodes_M_SC_R_SEND));
  s00_entry_pipeline_imp_1SXUVV2 s00_entry_pipeline
       (.aclk(aclk_1),
        .aresetn(aresetn_2),
        .m_axi_araddr(s00_entry_pipeline_m_axi_ARADDR),
        .m_axi_arcache(s00_entry_pipeline_m_axi_ARCACHE),
        .m_axi_arid(s00_entry_pipeline_m_axi_ARID),
        .m_axi_arlen(s00_entry_pipeline_m_axi_ARLEN),
        .m_axi_arlock(s00_entry_pipeline_m_axi_ARLOCK),
        .m_axi_arprot(s00_entry_pipeline_m_axi_ARPROT),
        .m_axi_arqos(s00_entry_pipeline_m_axi_ARQOS),
        .m_axi_arready(s00_entry_pipeline_m_axi_ARREADY),
        .m_axi_aruser(s00_entry_pipeline_m_axi_ARUSER),
        .m_axi_arvalid(s00_entry_pipeline_m_axi_ARVALID),
        .m_axi_awaddr(s00_entry_pipeline_m_axi_AWADDR),
        .m_axi_awcache(s00_entry_pipeline_m_axi_AWCACHE),
        .m_axi_awid(s00_entry_pipeline_m_axi_AWID),
        .m_axi_awlen(s00_entry_pipeline_m_axi_AWLEN),
        .m_axi_awlock(s00_entry_pipeline_m_axi_AWLOCK),
        .m_axi_awprot(s00_entry_pipeline_m_axi_AWPROT),
        .m_axi_awqos(s00_entry_pipeline_m_axi_AWQOS),
        .m_axi_awready(s00_entry_pipeline_m_axi_AWREADY),
        .m_axi_awuser(s00_entry_pipeline_m_axi_AWUSER),
        .m_axi_awvalid(s00_entry_pipeline_m_axi_AWVALID),
        .m_axi_bid(s00_entry_pipeline_m_axi_BID),
        .m_axi_bready(s00_entry_pipeline_m_axi_BREADY),
        .m_axi_bresp(s00_entry_pipeline_m_axi_BRESP),
        .m_axi_buser(s00_entry_pipeline_m_axi_BUSER),
        .m_axi_bvalid(s00_entry_pipeline_m_axi_BVALID),
        .m_axi_rdata(s00_entry_pipeline_m_axi_RDATA),
        .m_axi_rid(s00_entry_pipeline_m_axi_RID),
        .m_axi_rlast(s00_entry_pipeline_m_axi_RLAST),
        .m_axi_rready(s00_entry_pipeline_m_axi_RREADY),
        .m_axi_rresp(s00_entry_pipeline_m_axi_RRESP),
        .m_axi_ruser(s00_entry_pipeline_m_axi_RUSER),
        .m_axi_rvalid(s00_entry_pipeline_m_axi_RVALID),
        .m_axi_wdata(s00_entry_pipeline_m_axi_WDATA),
        .m_axi_wlast(s00_entry_pipeline_m_axi_WLAST),
        .m_axi_wready(s00_entry_pipeline_m_axi_WREADY),
        .m_axi_wstrb(s00_entry_pipeline_m_axi_WSTRB),
        .m_axi_wuser(s00_entry_pipeline_m_axi_WUSER),
        .m_axi_wvalid(s00_entry_pipeline_m_axi_WVALID),
        .s_axi_araddr(S00_AXI_1_ARADDR),
        .s_axi_arburst(S00_AXI_1_ARBURST),
        .s_axi_arcache(S00_AXI_1_ARCACHE),
        .s_axi_arid(S00_AXI_1_ARID),
        .s_axi_arlen(S00_AXI_1_ARLEN),
        .s_axi_arlock(S00_AXI_1_ARLOCK),
        .s_axi_arprot(S00_AXI_1_ARPROT),
        .s_axi_arqos(S00_AXI_1_ARQOS),
        .s_axi_arready(S00_AXI_1_ARREADY),
        .s_axi_arsize(S00_AXI_1_ARSIZE),
        .s_axi_arvalid(S00_AXI_1_ARVALID),
        .s_axi_awaddr(S00_AXI_1_AWADDR),
        .s_axi_awburst(S00_AXI_1_AWBURST),
        .s_axi_awcache(S00_AXI_1_AWCACHE),
        .s_axi_awid(S00_AXI_1_AWID),
        .s_axi_awlen(S00_AXI_1_AWLEN),
        .s_axi_awlock(S00_AXI_1_AWLOCK),
        .s_axi_awprot(S00_AXI_1_AWPROT),
        .s_axi_awqos(S00_AXI_1_AWQOS),
        .s_axi_awready(S00_AXI_1_AWREADY),
        .s_axi_awsize(S00_AXI_1_AWSIZE),
        .s_axi_awvalid(S00_AXI_1_AWVALID),
        .s_axi_bid(S00_AXI_1_BID),
        .s_axi_bready(S00_AXI_1_BREADY),
        .s_axi_bresp(S00_AXI_1_BRESP),
        .s_axi_bvalid(S00_AXI_1_BVALID),
        .s_axi_rdata(S00_AXI_1_RDATA),
        .s_axi_rid(S00_AXI_1_RID),
        .s_axi_rlast(S00_AXI_1_RLAST),
        .s_axi_rready(S00_AXI_1_RREADY),
        .s_axi_rresp(S00_AXI_1_RRESP),
        .s_axi_rvalid(S00_AXI_1_RVALID),
        .s_axi_wdata(S00_AXI_1_WDATA),
        .s_axi_wid(S00_AXI_1_WID),
        .s_axi_wlast(S00_AXI_1_WLAST),
        .s_axi_wready(S00_AXI_1_WREADY),
        .s_axi_wstrb(S00_AXI_1_WSTRB),
        .s_axi_wvalid(S00_AXI_1_WVALID));
  s00_nodes_imp_1YY80YC s00_nodes
       (.M_SC_AR_info(s00_nodes_M_SC_AR_INFO),
        .M_SC_AR_payld(s00_nodes_M_SC_AR_PAYLD),
        .M_SC_AR_recv(s00_nodes_M_SC_AR_RECV),
        .M_SC_AR_req(s00_nodes_M_SC_AR_REQ),
        .M_SC_AR_send(s00_nodes_M_SC_AR_SEND),
        .M_SC_AW_info(s00_nodes_M_SC_AW_INFO),
        .M_SC_AW_payld(s00_nodes_M_SC_AW_PAYLD),
        .M_SC_AW_recv(s00_nodes_M_SC_AW_RECV),
        .M_SC_AW_req(s00_nodes_M_SC_AW_REQ),
        .M_SC_AW_send(s00_nodes_M_SC_AW_SEND),
        .M_SC_B_info(s00_nodes_M_SC_B_INFO),
        .M_SC_B_payld(s00_nodes_M_SC_B_PAYLD),
        .M_SC_B_recv(s00_nodes_M_SC_B_RECV),
        .M_SC_B_req(s00_nodes_M_SC_B_REQ),
        .M_SC_B_send(s00_nodes_M_SC_B_SEND),
        .M_SC_R_info(s00_nodes_M_SC_R_INFO),
        .M_SC_R_payld(s00_nodes_M_SC_R_PAYLD),
        .M_SC_R_recv(s00_nodes_M_SC_R_RECV),
        .M_SC_R_req(s00_nodes_M_SC_R_REQ),
        .M_SC_R_send(s00_nodes_M_SC_R_SEND),
        .M_SC_W_info(s00_nodes_M_SC_W_INFO),
        .M_SC_W_payld(s00_nodes_M_SC_W_PAYLD),
        .M_SC_W_recv(s00_nodes_M_SC_W_RECV),
        .M_SC_W_req(s00_nodes_M_SC_W_REQ),
        .M_SC_W_send(s00_nodes_M_SC_W_SEND),
        .S_SC_AR_info(S_SC_AR_1_INFO),
        .S_SC_AR_payld(S_SC_AR_1_PAYLD),
        .S_SC_AR_recv(S_SC_AR_1_RECV),
        .S_SC_AR_req(S_SC_AR_1_REQ),
        .S_SC_AR_send(S_SC_AR_1_SEND),
        .S_SC_AW_info(S_SC_AW_1_INFO),
        .S_SC_AW_payld(S_SC_AW_1_PAYLD),
        .S_SC_AW_recv(S_SC_AW_1_RECV),
        .S_SC_AW_req(S_SC_AW_1_REQ),
        .S_SC_AW_send(S_SC_AW_1_SEND),
        .S_SC_B_info(S_SC_B_1_INFO),
        .S_SC_B_payld(S_SC_B_1_PAYLD),
        .S_SC_B_recv(S_SC_B_1_RECV),
        .S_SC_B_req(S_SC_B_1_REQ),
        .S_SC_B_send(S_SC_B_1_SEND),
        .S_SC_R_info(S_SC_R_1_INFO),
        .S_SC_R_payld(S_SC_R_1_PAYLD),
        .S_SC_R_recv(S_SC_R_1_RECV),
        .S_SC_R_req(S_SC_R_1_REQ),
        .S_SC_R_send(S_SC_R_1_SEND),
        .S_SC_W_info(S_SC_W_1_INFO),
        .S_SC_W_payld(S_SC_W_1_PAYLD),
        .S_SC_W_recv(S_SC_W_1_RECV),
        .S_SC_W_req(S_SC_W_1_REQ),
        .S_SC_W_send(S_SC_W_1_SEND),
        .m_sc_clk(swbd_aclk_net),
        .m_sc_resetn(swbd_aresetn_net),
        .s_sc_clk(aclk_1),
        .s_sc_resetn(aresetn_2));
  bd_63e1_s01a2s_0 s01_axi2sc
       (.aclk(aclk_2),
        .m_sc_ar_info(S_SC_AR_2_INFO),
        .m_sc_ar_payld(S_SC_AR_2_PAYLD),
        .m_sc_ar_recv(S_SC_AR_2_RECV),
        .m_sc_ar_req(S_SC_AR_2_REQ),
        .m_sc_ar_send(S_SC_AR_2_SEND),
        .s_axi_araddr(s01_entry_pipeline_m_axi_ARADDR),
        .s_axi_arcache(s01_entry_pipeline_m_axi_ARCACHE),
        .s_axi_arid(s01_entry_pipeline_m_axi_ARID),
        .s_axi_arlen(s01_entry_pipeline_m_axi_ARLEN),
        .s_axi_arlock(s01_entry_pipeline_m_axi_ARLOCK),
        .s_axi_arprot(s01_entry_pipeline_m_axi_ARPROT),
        .s_axi_arqos(s01_entry_pipeline_m_axi_ARQOS),
        .s_axi_arready(s01_entry_pipeline_m_axi_ARREADY),
        .s_axi_aruser(s01_entry_pipeline_m_axi_ARUSER),
        .s_axi_arvalid(s01_entry_pipeline_m_axi_ARVALID),
        .s_axi_rdata(s01_entry_pipeline_m_axi_RDATA),
        .s_axi_rid(s01_entry_pipeline_m_axi_RID),
        .s_axi_rlast(s01_entry_pipeline_m_axi_RLAST),
        .s_axi_rready(s01_entry_pipeline_m_axi_RREADY),
        .s_axi_rresp(s01_entry_pipeline_m_axi_RRESP),
        .s_axi_ruser(s01_entry_pipeline_m_axi_RUSER),
        .s_axi_rvalid(s01_entry_pipeline_m_axi_RVALID),
        .s_sc_r_info(s01_nodes_M_SC_R_INFO),
        .s_sc_r_payld(s01_nodes_M_SC_R_PAYLD),
        .s_sc_r_recv(s01_nodes_M_SC_R_RECV),
        .s_sc_r_req(s01_nodes_M_SC_R_REQ),
        .s_sc_r_send(s01_nodes_M_SC_R_SEND));
  s01_entry_pipeline_imp_VHOZKQ s01_entry_pipeline
       (.aclk(aclk_2),
        .aresetn(aresetn_3),
        .m_axi_araddr(s01_entry_pipeline_m_axi_ARADDR),
        .m_axi_arcache(s01_entry_pipeline_m_axi_ARCACHE),
        .m_axi_arid(s01_entry_pipeline_m_axi_ARID),
        .m_axi_arlen(s01_entry_pipeline_m_axi_ARLEN),
        .m_axi_arlock(s01_entry_pipeline_m_axi_ARLOCK),
        .m_axi_arprot(s01_entry_pipeline_m_axi_ARPROT),
        .m_axi_arqos(s01_entry_pipeline_m_axi_ARQOS),
        .m_axi_arready(s01_entry_pipeline_m_axi_ARREADY),
        .m_axi_aruser(s01_entry_pipeline_m_axi_ARUSER),
        .m_axi_arvalid(s01_entry_pipeline_m_axi_ARVALID),
        .m_axi_rdata(s01_entry_pipeline_m_axi_RDATA),
        .m_axi_rid(s01_entry_pipeline_m_axi_RID),
        .m_axi_rlast(s01_entry_pipeline_m_axi_RLAST),
        .m_axi_rready(s01_entry_pipeline_m_axi_RREADY),
        .m_axi_rresp(s01_entry_pipeline_m_axi_RRESP),
        .m_axi_ruser(s01_entry_pipeline_m_axi_RUSER),
        .m_axi_rvalid(s01_entry_pipeline_m_axi_RVALID),
        .s_axi_araddr(S01_AXI_1_ARADDR),
        .s_axi_arburst(S01_AXI_1_ARBURST),
        .s_axi_arcache(S01_AXI_1_ARCACHE),
        .s_axi_arlen(S01_AXI_1_ARLEN),
        .s_axi_arlock(S01_AXI_1_ARLOCK),
        .s_axi_arprot(S01_AXI_1_ARPROT),
        .s_axi_arqos(S01_AXI_1_ARQOS),
        .s_axi_arready(S01_AXI_1_ARREADY),
        .s_axi_arsize(S01_AXI_1_ARSIZE),
        .s_axi_aruser(S01_AXI_1_ARUSER),
        .s_axi_arvalid(S01_AXI_1_ARVALID),
        .s_axi_rdata(S01_AXI_1_RDATA),
        .s_axi_rlast(S01_AXI_1_RLAST),
        .s_axi_rready(S01_AXI_1_RREADY),
        .s_axi_rresp(S01_AXI_1_RRESP),
        .s_axi_rvalid(S01_AXI_1_RVALID));
  s01_nodes_imp_RE5KMA s01_nodes
       (.M_SC_AR_info(s01_nodes_M_SC_AR_INFO),
        .M_SC_AR_payld(s01_nodes_M_SC_AR_PAYLD),
        .M_SC_AR_recv(s01_nodes_M_SC_AR_RECV),
        .M_SC_AR_req(s01_nodes_M_SC_AR_REQ),
        .M_SC_AR_send(s01_nodes_M_SC_AR_SEND),
        .M_SC_R_info(s01_nodes_M_SC_R_INFO),
        .M_SC_R_payld(s01_nodes_M_SC_R_PAYLD),
        .M_SC_R_recv(s01_nodes_M_SC_R_RECV),
        .M_SC_R_req(s01_nodes_M_SC_R_REQ),
        .M_SC_R_send(s01_nodes_M_SC_R_SEND),
        .S_SC_AR_info(S_SC_AR_2_INFO),
        .S_SC_AR_payld(S_SC_AR_2_PAYLD),
        .S_SC_AR_recv(S_SC_AR_2_RECV),
        .S_SC_AR_req(S_SC_AR_2_REQ),
        .S_SC_AR_send(S_SC_AR_2_SEND),
        .S_SC_R_info(S_SC_R_2_INFO),
        .S_SC_R_payld(S_SC_R_2_PAYLD),
        .S_SC_R_recv(S_SC_R_2_RECV),
        .S_SC_R_req(S_SC_R_2_REQ),
        .S_SC_R_send(S_SC_R_2_SEND),
        .m_sc_clk(swbd_aclk_net),
        .m_sc_resetn(swbd_aresetn_net),
        .s_sc_clk(aclk_2),
        .s_sc_resetn(aresetn_3));
  bd_63e1_s02a2s_0 s02_axi2sc
       (.aclk(aclk_3),
        .m_sc_ar_info(S_SC_AR_3_INFO),
        .m_sc_ar_payld(S_SC_AR_3_PAYLD),
        .m_sc_ar_recv(S_SC_AR_3_RECV),
        .m_sc_ar_req(S_SC_AR_3_REQ),
        .m_sc_ar_send(S_SC_AR_3_SEND),
        .m_sc_aw_info(S_SC_AW_2_INFO),
        .m_sc_aw_payld(S_SC_AW_2_PAYLD),
        .m_sc_aw_recv(S_SC_AW_2_RECV),
        .m_sc_aw_req(S_SC_AW_2_REQ),
        .m_sc_aw_send(S_SC_AW_2_SEND),
        .m_sc_w_info(S_SC_W_2_INFO),
        .m_sc_w_payld(S_SC_W_2_PAYLD),
        .m_sc_w_recv(S_SC_W_2_RECV),
        .m_sc_w_req(S_SC_W_2_REQ),
        .m_sc_w_send(S_SC_W_2_SEND),
        .s_axi_araddr(s02_entry_pipeline_m_axi_ARADDR),
        .s_axi_arcache(s02_entry_pipeline_m_axi_ARCACHE),
        .s_axi_arid(s02_entry_pipeline_m_axi_ARID),
        .s_axi_arlen(s02_entry_pipeline_m_axi_ARLEN),
        .s_axi_arlock(s02_entry_pipeline_m_axi_ARLOCK),
        .s_axi_arprot(s02_entry_pipeline_m_axi_ARPROT),
        .s_axi_arqos(s02_entry_pipeline_m_axi_ARQOS),
        .s_axi_arready(s02_entry_pipeline_m_axi_ARREADY),
        .s_axi_aruser(s02_entry_pipeline_m_axi_ARUSER),
        .s_axi_arvalid(s02_entry_pipeline_m_axi_ARVALID),
        .s_axi_awaddr(s02_entry_pipeline_m_axi_AWADDR),
        .s_axi_awcache(s02_entry_pipeline_m_axi_AWCACHE),
        .s_axi_awid(s02_entry_pipeline_m_axi_AWID),
        .s_axi_awlen(s02_entry_pipeline_m_axi_AWLEN),
        .s_axi_awlock(s02_entry_pipeline_m_axi_AWLOCK),
        .s_axi_awprot(s02_entry_pipeline_m_axi_AWPROT),
        .s_axi_awqos(s02_entry_pipeline_m_axi_AWQOS),
        .s_axi_awready(s02_entry_pipeline_m_axi_AWREADY),
        .s_axi_awuser(s02_entry_pipeline_m_axi_AWUSER),
        .s_axi_awvalid(s02_entry_pipeline_m_axi_AWVALID),
        .s_axi_bid(s02_entry_pipeline_m_axi_BID),
        .s_axi_bready(s02_entry_pipeline_m_axi_BREADY),
        .s_axi_bresp(s02_entry_pipeline_m_axi_BRESP),
        .s_axi_buser(s02_entry_pipeline_m_axi_BUSER),
        .s_axi_bvalid(s02_entry_pipeline_m_axi_BVALID),
        .s_axi_rdata(s02_entry_pipeline_m_axi_RDATA),
        .s_axi_rid(s02_entry_pipeline_m_axi_RID),
        .s_axi_rlast(s02_entry_pipeline_m_axi_RLAST),
        .s_axi_rready(s02_entry_pipeline_m_axi_RREADY),
        .s_axi_rresp(s02_entry_pipeline_m_axi_RRESP),
        .s_axi_ruser(s02_entry_pipeline_m_axi_RUSER),
        .s_axi_rvalid(s02_entry_pipeline_m_axi_RVALID),
        .s_axi_wdata(s02_entry_pipeline_m_axi_WDATA),
        .s_axi_wlast(s02_entry_pipeline_m_axi_WLAST),
        .s_axi_wready(s02_entry_pipeline_m_axi_WREADY),
        .s_axi_wstrb(s02_entry_pipeline_m_axi_WSTRB),
        .s_axi_wuser(s02_entry_pipeline_m_axi_WUSER),
        .s_axi_wvalid(s02_entry_pipeline_m_axi_WVALID),
        .s_sc_b_info(s02_nodes_M_SC_B_INFO),
        .s_sc_b_payld(s02_nodes_M_SC_B_PAYLD),
        .s_sc_b_recv(s02_nodes_M_SC_B_RECV),
        .s_sc_b_req(s02_nodes_M_SC_B_REQ),
        .s_sc_b_send(s02_nodes_M_SC_B_SEND),
        .s_sc_r_info(s02_nodes_M_SC_R_INFO),
        .s_sc_r_payld(s02_nodes_M_SC_R_PAYLD),
        .s_sc_r_recv(s02_nodes_M_SC_R_RECV),
        .s_sc_r_req(s02_nodes_M_SC_R_REQ),
        .s_sc_r_send(s02_nodes_M_SC_R_SEND));
  s02_entry_pipeline_imp_23Y2W7 s02_entry_pipeline
       (.aclk(aclk_3),
        .aresetn(aresetn_4),
        .m_axi_araddr(s02_entry_pipeline_m_axi_ARADDR),
        .m_axi_arcache(s02_entry_pipeline_m_axi_ARCACHE),
        .m_axi_arid(s02_entry_pipeline_m_axi_ARID),
        .m_axi_arlen(s02_entry_pipeline_m_axi_ARLEN),
        .m_axi_arlock(s02_entry_pipeline_m_axi_ARLOCK),
        .m_axi_arprot(s02_entry_pipeline_m_axi_ARPROT),
        .m_axi_arqos(s02_entry_pipeline_m_axi_ARQOS),
        .m_axi_arready(s02_entry_pipeline_m_axi_ARREADY),
        .m_axi_aruser(s02_entry_pipeline_m_axi_ARUSER),
        .m_axi_arvalid(s02_entry_pipeline_m_axi_ARVALID),
        .m_axi_awaddr(s02_entry_pipeline_m_axi_AWADDR),
        .m_axi_awcache(s02_entry_pipeline_m_axi_AWCACHE),
        .m_axi_awid(s02_entry_pipeline_m_axi_AWID),
        .m_axi_awlen(s02_entry_pipeline_m_axi_AWLEN),
        .m_axi_awlock(s02_entry_pipeline_m_axi_AWLOCK),
        .m_axi_awprot(s02_entry_pipeline_m_axi_AWPROT),
        .m_axi_awqos(s02_entry_pipeline_m_axi_AWQOS),
        .m_axi_awready(s02_entry_pipeline_m_axi_AWREADY),
        .m_axi_awuser(s02_entry_pipeline_m_axi_AWUSER),
        .m_axi_awvalid(s02_entry_pipeline_m_axi_AWVALID),
        .m_axi_bid(s02_entry_pipeline_m_axi_BID),
        .m_axi_bready(s02_entry_pipeline_m_axi_BREADY),
        .m_axi_bresp(s02_entry_pipeline_m_axi_BRESP),
        .m_axi_buser(s02_entry_pipeline_m_axi_BUSER),
        .m_axi_bvalid(s02_entry_pipeline_m_axi_BVALID),
        .m_axi_rdata(s02_entry_pipeline_m_axi_RDATA),
        .m_axi_rid(s02_entry_pipeline_m_axi_RID),
        .m_axi_rlast(s02_entry_pipeline_m_axi_RLAST),
        .m_axi_rready(s02_entry_pipeline_m_axi_RREADY),
        .m_axi_rresp(s02_entry_pipeline_m_axi_RRESP),
        .m_axi_ruser(s02_entry_pipeline_m_axi_RUSER),
        .m_axi_rvalid(s02_entry_pipeline_m_axi_RVALID),
        .m_axi_wdata(s02_entry_pipeline_m_axi_WDATA),
        .m_axi_wlast(s02_entry_pipeline_m_axi_WLAST),
        .m_axi_wready(s02_entry_pipeline_m_axi_WREADY),
        .m_axi_wstrb(s02_entry_pipeline_m_axi_WSTRB),
        .m_axi_wuser(s02_entry_pipeline_m_axi_WUSER),
        .m_axi_wvalid(s02_entry_pipeline_m_axi_WVALID),
        .s_axi_araddr(S02_AXI_1_ARADDR),
        .s_axi_arburst(S02_AXI_1_ARBURST),
        .s_axi_arcache(S02_AXI_1_ARCACHE),
        .s_axi_arlen(S02_AXI_1_ARLEN),
        .s_axi_arlock(S02_AXI_1_ARLOCK),
        .s_axi_arprot(S02_AXI_1_ARPROT),
        .s_axi_arqos(S02_AXI_1_ARQOS),
        .s_axi_arready(S02_AXI_1_ARREADY),
        .s_axi_arsize(S02_AXI_1_ARSIZE),
        .s_axi_aruser(S02_AXI_1_ARUSER),
        .s_axi_arvalid(S02_AXI_1_ARVALID),
        .s_axi_awaddr(S02_AXI_1_AWADDR),
        .s_axi_awburst(S02_AXI_1_AWBURST),
        .s_axi_awcache(S02_AXI_1_AWCACHE),
        .s_axi_awlen(S02_AXI_1_AWLEN),
        .s_axi_awlock(S02_AXI_1_AWLOCK),
        .s_axi_awprot(S02_AXI_1_AWPROT),
        .s_axi_awqos(S02_AXI_1_AWQOS),
        .s_axi_awready(S02_AXI_1_AWREADY),
        .s_axi_awsize(S02_AXI_1_AWSIZE),
        .s_axi_awuser(S02_AXI_1_AWUSER),
        .s_axi_awvalid(S02_AXI_1_AWVALID),
        .s_axi_bready(S02_AXI_1_BREADY),
        .s_axi_bresp(S02_AXI_1_BRESP),
        .s_axi_bvalid(S02_AXI_1_BVALID),
        .s_axi_rdata(S02_AXI_1_RDATA),
        .s_axi_rlast(S02_AXI_1_RLAST),
        .s_axi_rready(S02_AXI_1_RREADY),
        .s_axi_rresp(S02_AXI_1_RRESP),
        .s_axi_rvalid(S02_AXI_1_RVALID),
        .s_axi_wdata(S02_AXI_1_WDATA),
        .s_axi_wlast(S02_AXI_1_WLAST),
        .s_axi_wready(S02_AXI_1_WREADY),
        .s_axi_wstrb(S02_AXI_1_WSTRB),
        .s_axi_wvalid(S02_AXI_1_WVALID));
  s02_nodes_imp_8K7Q7T s02_nodes
       (.M_SC_AR_info(s02_nodes_M_SC_AR_INFO),
        .M_SC_AR_payld(s02_nodes_M_SC_AR_PAYLD),
        .M_SC_AR_recv(s02_nodes_M_SC_AR_RECV),
        .M_SC_AR_req(s02_nodes_M_SC_AR_REQ),
        .M_SC_AR_send(s02_nodes_M_SC_AR_SEND),
        .M_SC_AW_info(s02_nodes_M_SC_AW_INFO),
        .M_SC_AW_payld(s02_nodes_M_SC_AW_PAYLD),
        .M_SC_AW_recv(s02_nodes_M_SC_AW_RECV),
        .M_SC_AW_req(s02_nodes_M_SC_AW_REQ),
        .M_SC_AW_send(s02_nodes_M_SC_AW_SEND),
        .M_SC_B_info(s02_nodes_M_SC_B_INFO),
        .M_SC_B_payld(s02_nodes_M_SC_B_PAYLD),
        .M_SC_B_recv(s02_nodes_M_SC_B_RECV),
        .M_SC_B_req(s02_nodes_M_SC_B_REQ),
        .M_SC_B_send(s02_nodes_M_SC_B_SEND),
        .M_SC_R_info(s02_nodes_M_SC_R_INFO),
        .M_SC_R_payld(s02_nodes_M_SC_R_PAYLD),
        .M_SC_R_recv(s02_nodes_M_SC_R_RECV),
        .M_SC_R_req(s02_nodes_M_SC_R_REQ),
        .M_SC_R_send(s02_nodes_M_SC_R_SEND),
        .M_SC_W_info(s02_nodes_M_SC_W_INFO),
        .M_SC_W_payld(s02_nodes_M_SC_W_PAYLD),
        .M_SC_W_recv(s02_nodes_M_SC_W_RECV),
        .M_SC_W_req(s02_nodes_M_SC_W_REQ),
        .M_SC_W_send(s02_nodes_M_SC_W_SEND),
        .S_SC_AR_info(S_SC_AR_3_INFO),
        .S_SC_AR_payld(S_SC_AR_3_PAYLD),
        .S_SC_AR_recv(S_SC_AR_3_RECV),
        .S_SC_AR_req(S_SC_AR_3_REQ),
        .S_SC_AR_send(S_SC_AR_3_SEND),
        .S_SC_AW_info(S_SC_AW_2_INFO),
        .S_SC_AW_payld(S_SC_AW_2_PAYLD),
        .S_SC_AW_recv(S_SC_AW_2_RECV),
        .S_SC_AW_req(S_SC_AW_2_REQ),
        .S_SC_AW_send(S_SC_AW_2_SEND),
        .S_SC_B_info(S_SC_B_2_INFO),
        .S_SC_B_payld(S_SC_B_2_PAYLD),
        .S_SC_B_recv(S_SC_B_2_RECV),
        .S_SC_B_req(S_SC_B_2_REQ),
        .S_SC_B_send(S_SC_B_2_SEND),
        .S_SC_R_info(S_SC_R_3_INFO),
        .S_SC_R_payld(S_SC_R_3_PAYLD),
        .S_SC_R_recv(S_SC_R_3_RECV),
        .S_SC_R_req(S_SC_R_3_REQ),
        .S_SC_R_send(S_SC_R_3_SEND),
        .S_SC_W_info(S_SC_W_2_INFO),
        .S_SC_W_payld(S_SC_W_2_PAYLD),
        .S_SC_W_recv(S_SC_W_2_RECV),
        .S_SC_W_req(S_SC_W_2_REQ),
        .S_SC_W_send(S_SC_W_2_SEND),
        .m_sc_clk(swbd_aclk_net),
        .m_sc_resetn(swbd_aresetn_net),
        .s_sc_clk(aclk_3),
        .s_sc_resetn(aresetn_4));
  bd_63e1_s03a2s_0 s03_axi2sc
       (.aclk(aclk_4),
        .m_sc_aw_info(S_SC_AW_3_INFO),
        .m_sc_aw_payld(S_SC_AW_3_PAYLD),
        .m_sc_aw_recv(S_SC_AW_3_RECV),
        .m_sc_aw_req(S_SC_AW_3_REQ),
        .m_sc_aw_send(S_SC_AW_3_SEND),
        .m_sc_w_info(S_SC_W_3_INFO),
        .m_sc_w_payld(S_SC_W_3_PAYLD),
        .m_sc_w_recv(S_SC_W_3_RECV),
        .m_sc_w_req(S_SC_W_3_REQ),
        .m_sc_w_send(S_SC_W_3_SEND),
        .s_axi_awaddr(s03_entry_pipeline_m_axi_AWADDR),
        .s_axi_awcache(s03_entry_pipeline_m_axi_AWCACHE),
        .s_axi_awid(s03_entry_pipeline_m_axi_AWID),
        .s_axi_awlen(s03_entry_pipeline_m_axi_AWLEN),
        .s_axi_awlock(s03_entry_pipeline_m_axi_AWLOCK),
        .s_axi_awprot(s03_entry_pipeline_m_axi_AWPROT),
        .s_axi_awqos(s03_entry_pipeline_m_axi_AWQOS),
        .s_axi_awready(s03_entry_pipeline_m_axi_AWREADY),
        .s_axi_awuser(s03_entry_pipeline_m_axi_AWUSER),
        .s_axi_awvalid(s03_entry_pipeline_m_axi_AWVALID),
        .s_axi_bid(s03_entry_pipeline_m_axi_BID),
        .s_axi_bready(s03_entry_pipeline_m_axi_BREADY),
        .s_axi_bresp(s03_entry_pipeline_m_axi_BRESP),
        .s_axi_buser(s03_entry_pipeline_m_axi_BUSER),
        .s_axi_bvalid(s03_entry_pipeline_m_axi_BVALID),
        .s_axi_wdata(s03_entry_pipeline_m_axi_WDATA),
        .s_axi_wlast(s03_entry_pipeline_m_axi_WLAST),
        .s_axi_wready(s03_entry_pipeline_m_axi_WREADY),
        .s_axi_wstrb(s03_entry_pipeline_m_axi_WSTRB),
        .s_axi_wuser(s03_entry_pipeline_m_axi_WUSER),
        .s_axi_wvalid(s03_entry_pipeline_m_axi_WVALID),
        .s_sc_b_info(s03_nodes_M_SC_B_INFO),
        .s_sc_b_payld(s03_nodes_M_SC_B_PAYLD),
        .s_sc_b_recv(s03_nodes_M_SC_B_RECV),
        .s_sc_b_req(s03_nodes_M_SC_B_REQ),
        .s_sc_b_send(s03_nodes_M_SC_B_SEND));
  s03_entry_pipeline_imp_17JCOAB s03_entry_pipeline
       (.aclk(aclk_4),
        .aresetn(aresetn_5),
        .m_axi_awaddr(s03_entry_pipeline_m_axi_AWADDR),
        .m_axi_awcache(s03_entry_pipeline_m_axi_AWCACHE),
        .m_axi_awid(s03_entry_pipeline_m_axi_AWID),
        .m_axi_awlen(s03_entry_pipeline_m_axi_AWLEN),
        .m_axi_awlock(s03_entry_pipeline_m_axi_AWLOCK),
        .m_axi_awprot(s03_entry_pipeline_m_axi_AWPROT),
        .m_axi_awqos(s03_entry_pipeline_m_axi_AWQOS),
        .m_axi_awready(s03_entry_pipeline_m_axi_AWREADY),
        .m_axi_awuser(s03_entry_pipeline_m_axi_AWUSER),
        .m_axi_awvalid(s03_entry_pipeline_m_axi_AWVALID),
        .m_axi_bid(s03_entry_pipeline_m_axi_BID),
        .m_axi_bready(s03_entry_pipeline_m_axi_BREADY),
        .m_axi_bresp(s03_entry_pipeline_m_axi_BRESP),
        .m_axi_buser(s03_entry_pipeline_m_axi_BUSER),
        .m_axi_bvalid(s03_entry_pipeline_m_axi_BVALID),
        .m_axi_wdata(s03_entry_pipeline_m_axi_WDATA),
        .m_axi_wlast(s03_entry_pipeline_m_axi_WLAST),
        .m_axi_wready(s03_entry_pipeline_m_axi_WREADY),
        .m_axi_wstrb(s03_entry_pipeline_m_axi_WSTRB),
        .m_axi_wuser(s03_entry_pipeline_m_axi_WUSER),
        .m_axi_wvalid(s03_entry_pipeline_m_axi_WVALID),
        .s_axi_awaddr(S03_AXI_1_AWADDR),
        .s_axi_awburst(S03_AXI_1_AWBURST),
        .s_axi_awcache(S03_AXI_1_AWCACHE),
        .s_axi_awlen(S03_AXI_1_AWLEN),
        .s_axi_awlock(S03_AXI_1_AWLOCK),
        .s_axi_awprot(S03_AXI_1_AWPROT),
        .s_axi_awqos(S03_AXI_1_AWQOS),
        .s_axi_awready(S03_AXI_1_AWREADY),
        .s_axi_awsize(S03_AXI_1_AWSIZE),
        .s_axi_awuser(S03_AXI_1_AWUSER),
        .s_axi_awvalid(S03_AXI_1_AWVALID),
        .s_axi_bready(S03_AXI_1_BREADY),
        .s_axi_bresp(S03_AXI_1_BRESP),
        .s_axi_bvalid(S03_AXI_1_BVALID),
        .s_axi_wdata(S03_AXI_1_WDATA),
        .s_axi_wlast(S03_AXI_1_WLAST),
        .s_axi_wready(S03_AXI_1_WREADY),
        .s_axi_wstrb(S03_AXI_1_WSTRB),
        .s_axi_wvalid(S03_AXI_1_WVALID));
  s03_nodes_imp_10KTRM7 s03_nodes
       (.M_SC_AW_info(s03_nodes_M_SC_AW_INFO),
        .M_SC_AW_payld(s03_nodes_M_SC_AW_PAYLD),
        .M_SC_AW_recv(s03_nodes_M_SC_AW_RECV),
        .M_SC_AW_req(s03_nodes_M_SC_AW_REQ),
        .M_SC_AW_send(s03_nodes_M_SC_AW_SEND),
        .M_SC_B_info(s03_nodes_M_SC_B_INFO),
        .M_SC_B_payld(s03_nodes_M_SC_B_PAYLD),
        .M_SC_B_recv(s03_nodes_M_SC_B_RECV),
        .M_SC_B_req(s03_nodes_M_SC_B_REQ),
        .M_SC_B_send(s03_nodes_M_SC_B_SEND),
        .M_SC_W_info(s03_nodes_M_SC_W_INFO),
        .M_SC_W_payld(s03_nodes_M_SC_W_PAYLD),
        .M_SC_W_recv(s03_nodes_M_SC_W_RECV),
        .M_SC_W_req(s03_nodes_M_SC_W_REQ),
        .M_SC_W_send(s03_nodes_M_SC_W_SEND),
        .S_SC_AW_info(S_SC_AW_3_INFO),
        .S_SC_AW_payld(S_SC_AW_3_PAYLD),
        .S_SC_AW_recv(S_SC_AW_3_RECV),
        .S_SC_AW_req(S_SC_AW_3_REQ),
        .S_SC_AW_send(S_SC_AW_3_SEND),
        .S_SC_B_info(S_SC_B_3_INFO),
        .S_SC_B_payld(S_SC_B_3_PAYLD),
        .S_SC_B_recv(S_SC_B_3_RECV),
        .S_SC_B_req(S_SC_B_3_REQ),
        .S_SC_B_send(S_SC_B_3_SEND),
        .S_SC_W_info(S_SC_W_3_INFO),
        .S_SC_W_payld(S_SC_W_3_PAYLD),
        .S_SC_W_recv(S_SC_W_3_RECV),
        .S_SC_W_req(S_SC_W_3_REQ),
        .S_SC_W_send(S_SC_W_3_SEND),
        .m_sc_clk(swbd_aclk_net),
        .m_sc_resetn(swbd_aresetn_net),
        .s_sc_clk(aclk_4),
        .s_sc_resetn(aresetn_5));
  switchboards_imp_154XAYO switchboards
       (.M00_SC_AR_info(S_SC_AR_4_INFO),
        .M00_SC_AR_payld(S_SC_AR_4_PAYLD),
        .M00_SC_AR_recv(S_SC_AR_4_RECV),
        .M00_SC_AR_req(S_SC_AR_4_REQ),
        .M00_SC_AR_send(S_SC_AR_4_SEND),
        .M00_SC_AW_info(S_SC_AW_4_INFO),
        .M00_SC_AW_payld(S_SC_AW_4_PAYLD),
        .M00_SC_AW_recv(S_SC_AW_4_RECV),
        .M00_SC_AW_req(S_SC_AW_4_REQ),
        .M00_SC_AW_send(S_SC_AW_4_SEND),
        .M00_SC_B_info(S_SC_B_1_INFO),
        .M00_SC_B_payld(S_SC_B_1_PAYLD),
        .M00_SC_B_recv(S_SC_B_1_RECV),
        .M00_SC_B_req(S_SC_B_1_REQ),
        .M00_SC_B_send(S_SC_B_1_SEND),
        .M00_SC_R_info(S_SC_R_1_INFO),
        .M00_SC_R_payld(S_SC_R_1_PAYLD),
        .M00_SC_R_recv(S_SC_R_1_RECV),
        .M00_SC_R_req(S_SC_R_1_REQ),
        .M00_SC_R_send(S_SC_R_1_SEND),
        .M00_SC_W_info(S_SC_W_4_INFO),
        .M00_SC_W_payld(S_SC_W_4_PAYLD),
        .M00_SC_W_recv(S_SC_W_4_RECV),
        .M00_SC_W_req(S_SC_W_4_REQ),
        .M00_SC_W_send(S_SC_W_4_SEND),
        .M01_SC_AR_info(S_SC_AR_5_INFO),
        .M01_SC_AR_payld(S_SC_AR_5_PAYLD),
        .M01_SC_AR_recv(S_SC_AR_5_RECV),
        .M01_SC_AR_req(S_SC_AR_5_REQ),
        .M01_SC_AR_send(S_SC_AR_5_SEND),
        .M01_SC_AW_info(S_SC_AW_5_INFO),
        .M01_SC_AW_payld(S_SC_AW_5_PAYLD),
        .M01_SC_AW_recv(S_SC_AW_5_RECV),
        .M01_SC_AW_req(S_SC_AW_5_REQ),
        .M01_SC_AW_send(S_SC_AW_5_SEND),
        .M01_SC_B_recv(1'b0),
        .M01_SC_R_info(S_SC_R_2_INFO),
        .M01_SC_R_payld(S_SC_R_2_PAYLD),
        .M01_SC_R_recv(S_SC_R_2_RECV),
        .M01_SC_R_req(S_SC_R_2_REQ),
        .M01_SC_R_send(S_SC_R_2_SEND),
        .M01_SC_W_info(S_SC_W_5_INFO),
        .M01_SC_W_payld(S_SC_W_5_PAYLD),
        .M01_SC_W_recv(S_SC_W_5_RECV),
        .M01_SC_W_req(S_SC_W_5_REQ),
        .M01_SC_W_send(S_SC_W_5_SEND),
        .M02_SC_AR_info(S_SC_AR_6_INFO),
        .M02_SC_AR_payld(S_SC_AR_6_PAYLD),
        .M02_SC_AR_recv(S_SC_AR_6_RECV),
        .M02_SC_AR_req(S_SC_AR_6_REQ),
        .M02_SC_AR_send(S_SC_AR_6_SEND),
        .M02_SC_AW_info(S_SC_AW_6_INFO),
        .M02_SC_AW_payld(S_SC_AW_6_PAYLD),
        .M02_SC_AW_recv(S_SC_AW_6_RECV),
        .M02_SC_AW_req(S_SC_AW_6_REQ),
        .M02_SC_AW_send(S_SC_AW_6_SEND),
        .M02_SC_B_info(S_SC_B_2_INFO),
        .M02_SC_B_payld(S_SC_B_2_PAYLD),
        .M02_SC_B_recv(S_SC_B_2_RECV),
        .M02_SC_B_req(S_SC_B_2_REQ),
        .M02_SC_B_send(S_SC_B_2_SEND),
        .M02_SC_R_info(S_SC_R_3_INFO),
        .M02_SC_R_payld(S_SC_R_3_PAYLD),
        .M02_SC_R_recv(S_SC_R_3_RECV),
        .M02_SC_R_req(S_SC_R_3_REQ),
        .M02_SC_R_send(S_SC_R_3_SEND),
        .M02_SC_W_info(S_SC_W_6_INFO),
        .M02_SC_W_payld(S_SC_W_6_PAYLD),
        .M02_SC_W_recv(S_SC_W_6_RECV),
        .M02_SC_W_req(S_SC_W_6_REQ),
        .M02_SC_W_send(S_SC_W_6_SEND),
        .M03_SC_AR_info(S_SC_AR_7_INFO),
        .M03_SC_AR_payld(S_SC_AR_7_PAYLD),
        .M03_SC_AR_recv(S_SC_AR_7_RECV),
        .M03_SC_AR_req(S_SC_AR_7_REQ),
        .M03_SC_AR_send(S_SC_AR_7_SEND),
        .M03_SC_AW_info(S_SC_AW_7_INFO),
        .M03_SC_AW_payld(S_SC_AW_7_PAYLD),
        .M03_SC_AW_recv(S_SC_AW_7_RECV),
        .M03_SC_AW_req(S_SC_AW_7_REQ),
        .M03_SC_AW_send(S_SC_AW_7_SEND),
        .M03_SC_B_info(S_SC_B_3_INFO),
        .M03_SC_B_payld(S_SC_B_3_PAYLD),
        .M03_SC_B_recv(S_SC_B_3_RECV),
        .M03_SC_B_req(S_SC_B_3_REQ),
        .M03_SC_B_send(S_SC_B_3_SEND),
        .M03_SC_R_recv(1'b0),
        .M03_SC_W_info(S_SC_W_7_INFO),
        .M03_SC_W_payld(S_SC_W_7_PAYLD),
        .M03_SC_W_recv(S_SC_W_7_RECV),
        .M03_SC_W_req(S_SC_W_7_REQ),
        .M03_SC_W_send(S_SC_W_7_SEND),
        .M04_SC_AR_info(S_SC_AR_8_INFO),
        .M04_SC_AR_payld(S_SC_AR_8_PAYLD),
        .M04_SC_AR_recv(S_SC_AR_8_RECV),
        .M04_SC_AR_req(S_SC_AR_8_REQ),
        .M04_SC_AR_send(S_SC_AR_8_SEND),
        .M04_SC_AW_info(S_SC_AW_8_INFO),
        .M04_SC_AW_payld(S_SC_AW_8_PAYLD),
        .M04_SC_AW_recv(S_SC_AW_8_RECV),
        .M04_SC_AW_req(S_SC_AW_8_REQ),
        .M04_SC_AW_send(S_SC_AW_8_SEND),
        .M04_SC_W_info(S_SC_W_8_INFO),
        .M04_SC_W_payld(S_SC_W_8_PAYLD),
        .M04_SC_W_recv(S_SC_W_8_RECV),
        .M04_SC_W_req(S_SC_W_8_REQ),
        .M04_SC_W_send(S_SC_W_8_SEND),
        .M05_SC_AR_info(S_SC_AR_9_INFO),
        .M05_SC_AR_payld(S_SC_AR_9_PAYLD),
        .M05_SC_AR_recv(S_SC_AR_9_RECV),
        .M05_SC_AR_req(S_SC_AR_9_REQ),
        .M05_SC_AR_send(S_SC_AR_9_SEND),
        .M05_SC_AW_info(S_SC_AW_9_INFO),
        .M05_SC_AW_payld(S_SC_AW_9_PAYLD),
        .M05_SC_AW_recv(S_SC_AW_9_RECV),
        .M05_SC_AW_req(S_SC_AW_9_REQ),
        .M05_SC_AW_send(S_SC_AW_9_SEND),
        .M05_SC_W_info(S_SC_W_9_INFO),
        .M05_SC_W_payld(S_SC_W_9_PAYLD),
        .M05_SC_W_recv(S_SC_W_9_RECV),
        .M05_SC_W_req(S_SC_W_9_REQ),
        .M05_SC_W_send(S_SC_W_9_SEND),
        .M06_SC_AR_info(S_SC_AR_10_INFO),
        .M06_SC_AR_payld(S_SC_AR_10_PAYLD),
        .M06_SC_AR_recv(S_SC_AR_10_RECV),
        .M06_SC_AR_req(S_SC_AR_10_REQ),
        .M06_SC_AR_send(S_SC_AR_10_SEND),
        .M06_SC_AW_info(S_SC_AW_10_INFO),
        .M06_SC_AW_payld(S_SC_AW_10_PAYLD),
        .M06_SC_AW_recv(S_SC_AW_10_RECV),
        .M06_SC_AW_req(S_SC_AW_10_REQ),
        .M06_SC_AW_send(S_SC_AW_10_SEND),
        .M06_SC_W_info(S_SC_W_10_INFO),
        .M06_SC_W_payld(S_SC_W_10_PAYLD),
        .M06_SC_W_recv(S_SC_W_10_RECV),
        .M06_SC_W_req(S_SC_W_10_REQ),
        .M06_SC_W_send(S_SC_W_10_SEND),
        .M07_SC_AR_info(S_SC_AR_11_INFO),
        .M07_SC_AR_payld(S_SC_AR_11_PAYLD),
        .M07_SC_AR_recv(S_SC_AR_11_RECV),
        .M07_SC_AR_req(S_SC_AR_11_REQ),
        .M07_SC_AR_send(S_SC_AR_11_SEND),
        .M07_SC_AW_info(S_SC_AW_11_INFO),
        .M07_SC_AW_payld(S_SC_AW_11_PAYLD),
        .M07_SC_AW_recv(S_SC_AW_11_RECV),
        .M07_SC_AW_req(S_SC_AW_11_REQ),
        .M07_SC_AW_send(S_SC_AW_11_SEND),
        .M07_SC_W_info(S_SC_W_11_INFO),
        .M07_SC_W_payld(S_SC_W_11_PAYLD),
        .M07_SC_W_recv(S_SC_W_11_RECV),
        .M07_SC_W_req(S_SC_W_11_REQ),
        .M07_SC_W_send(S_SC_W_11_SEND),
        .S00_SC_AR_info(s00_nodes_M_SC_AR_INFO),
        .S00_SC_AR_payld(s00_nodes_M_SC_AR_PAYLD),
        .S00_SC_AR_recv(s00_nodes_M_SC_AR_RECV),
        .S00_SC_AR_req(s00_nodes_M_SC_AR_REQ),
        .S00_SC_AR_send(s00_nodes_M_SC_AR_SEND),
        .S00_SC_AW_info(s00_nodes_M_SC_AW_INFO),
        .S00_SC_AW_payld(s00_nodes_M_SC_AW_PAYLD),
        .S00_SC_AW_recv(s00_nodes_M_SC_AW_RECV),
        .S00_SC_AW_req(s00_nodes_M_SC_AW_REQ),
        .S00_SC_AW_send(s00_nodes_M_SC_AW_SEND),
        .S00_SC_B_info(m00_nodes_M_SC_B_INFO),
        .S00_SC_B_payld(m00_nodes_M_SC_B_PAYLD),
        .S00_SC_B_recv(m00_nodes_M_SC_B_RECV),
        .S00_SC_B_req(m00_nodes_M_SC_B_REQ),
        .S00_SC_B_send(m00_nodes_M_SC_B_SEND),
        .S00_SC_R_info(m00_nodes_M_SC_R_INFO),
        .S00_SC_R_payld(m00_nodes_M_SC_R_PAYLD),
        .S00_SC_R_recv(m00_nodes_M_SC_R_RECV),
        .S00_SC_R_req(m00_nodes_M_SC_R_REQ),
        .S00_SC_R_send(m00_nodes_M_SC_R_SEND),
        .S00_SC_W_info(s00_nodes_M_SC_W_INFO),
        .S00_SC_W_payld(s00_nodes_M_SC_W_PAYLD),
        .S00_SC_W_recv(s00_nodes_M_SC_W_RECV),
        .S00_SC_W_req(s00_nodes_M_SC_W_REQ),
        .S00_SC_W_send(s00_nodes_M_SC_W_SEND),
        .S01_SC_AR_info(s01_nodes_M_SC_AR_INFO),
        .S01_SC_AR_payld(s01_nodes_M_SC_AR_PAYLD),
        .S01_SC_AR_recv(s01_nodes_M_SC_AR_RECV),
        .S01_SC_AR_req(s01_nodes_M_SC_AR_REQ),
        .S01_SC_AR_send(s01_nodes_M_SC_AR_SEND),
        .S01_SC_AW_info(1'b0),
        .S01_SC_AW_payld(1'b0),
        .S01_SC_AW_req(1'b0),
        .S01_SC_AW_send(1'b0),
        .S01_SC_B_info(m01_nodes_M_SC_B_INFO),
        .S01_SC_B_payld(m01_nodes_M_SC_B_PAYLD),
        .S01_SC_B_recv(m01_nodes_M_SC_B_RECV),
        .S01_SC_B_req(m01_nodes_M_SC_B_REQ),
        .S01_SC_B_send(m01_nodes_M_SC_B_SEND),
        .S01_SC_R_info(m01_nodes_M_SC_R_INFO),
        .S01_SC_R_payld(m01_nodes_M_SC_R_PAYLD),
        .S01_SC_R_recv(m01_nodes_M_SC_R_RECV),
        .S01_SC_R_req(m01_nodes_M_SC_R_REQ),
        .S01_SC_R_send(m01_nodes_M_SC_R_SEND),
        .S01_SC_W_info(1'b0),
        .S01_SC_W_payld(1'b0),
        .S01_SC_W_req(1'b0),
        .S01_SC_W_send(1'b0),
        .S02_SC_AR_info(s02_nodes_M_SC_AR_INFO),
        .S02_SC_AR_payld(s02_nodes_M_SC_AR_PAYLD),
        .S02_SC_AR_recv(s02_nodes_M_SC_AR_RECV),
        .S02_SC_AR_req(s02_nodes_M_SC_AR_REQ),
        .S02_SC_AR_send(s02_nodes_M_SC_AR_SEND),
        .S02_SC_AW_info(s02_nodes_M_SC_AW_INFO),
        .S02_SC_AW_payld(s02_nodes_M_SC_AW_PAYLD),
        .S02_SC_AW_recv(s02_nodes_M_SC_AW_RECV),
        .S02_SC_AW_req(s02_nodes_M_SC_AW_REQ),
        .S02_SC_AW_send(s02_nodes_M_SC_AW_SEND),
        .S02_SC_B_info(m02_nodes_M_SC_B_INFO),
        .S02_SC_B_payld(m02_nodes_M_SC_B_PAYLD),
        .S02_SC_B_recv(m02_nodes_M_SC_B_RECV),
        .S02_SC_B_req(m02_nodes_M_SC_B_REQ),
        .S02_SC_B_send(m02_nodes_M_SC_B_SEND),
        .S02_SC_R_info(m02_nodes_M_SC_R_INFO),
        .S02_SC_R_payld(m02_nodes_M_SC_R_PAYLD),
        .S02_SC_R_recv(m02_nodes_M_SC_R_RECV),
        .S02_SC_R_req(m02_nodes_M_SC_R_REQ),
        .S02_SC_R_send(m02_nodes_M_SC_R_SEND),
        .S02_SC_W_info(s02_nodes_M_SC_W_INFO),
        .S02_SC_W_payld(s02_nodes_M_SC_W_PAYLD),
        .S02_SC_W_recv(s02_nodes_M_SC_W_RECV),
        .S02_SC_W_req(s02_nodes_M_SC_W_REQ),
        .S02_SC_W_send(s02_nodes_M_SC_W_SEND),
        .S03_SC_AR_info(1'b0),
        .S03_SC_AR_payld(1'b0),
        .S03_SC_AR_req(1'b0),
        .S03_SC_AR_send(1'b0),
        .S03_SC_AW_info(s03_nodes_M_SC_AW_INFO),
        .S03_SC_AW_payld(s03_nodes_M_SC_AW_PAYLD),
        .S03_SC_AW_recv(s03_nodes_M_SC_AW_RECV),
        .S03_SC_AW_req(s03_nodes_M_SC_AW_REQ),
        .S03_SC_AW_send(s03_nodes_M_SC_AW_SEND),
        .S03_SC_B_info(m03_nodes_M_SC_B_INFO),
        .S03_SC_B_payld(m03_nodes_M_SC_B_PAYLD),
        .S03_SC_B_recv(m03_nodes_M_SC_B_RECV),
        .S03_SC_B_req(m03_nodes_M_SC_B_REQ),
        .S03_SC_B_send(m03_nodes_M_SC_B_SEND),
        .S03_SC_R_info(m03_nodes_M_SC_R_INFO),
        .S03_SC_R_payld(m03_nodes_M_SC_R_PAYLD),
        .S03_SC_R_recv(m03_nodes_M_SC_R_RECV),
        .S03_SC_R_req(m03_nodes_M_SC_R_REQ),
        .S03_SC_R_send(m03_nodes_M_SC_R_SEND),
        .S03_SC_W_info(s03_nodes_M_SC_W_INFO),
        .S03_SC_W_payld(s03_nodes_M_SC_W_PAYLD),
        .S03_SC_W_recv(s03_nodes_M_SC_W_RECV),
        .S03_SC_W_req(s03_nodes_M_SC_W_REQ),
        .S03_SC_W_send(s03_nodes_M_SC_W_SEND),
        .S04_SC_B_info(m04_nodes_M_SC_B_INFO),
        .S04_SC_B_payld(m04_nodes_M_SC_B_PAYLD),
        .S04_SC_B_recv(m04_nodes_M_SC_B_RECV),
        .S04_SC_B_req(m04_nodes_M_SC_B_REQ),
        .S04_SC_B_send(m04_nodes_M_SC_B_SEND),
        .S04_SC_R_info(m04_nodes_M_SC_R_INFO),
        .S04_SC_R_payld(m04_nodes_M_SC_R_PAYLD),
        .S04_SC_R_recv(m04_nodes_M_SC_R_RECV),
        .S04_SC_R_req(m04_nodes_M_SC_R_REQ),
        .S04_SC_R_send(m04_nodes_M_SC_R_SEND),
        .S05_SC_B_info(m05_nodes_M_SC_B_INFO),
        .S05_SC_B_payld(m05_nodes_M_SC_B_PAYLD),
        .S05_SC_B_recv(m05_nodes_M_SC_B_RECV),
        .S05_SC_B_req(m05_nodes_M_SC_B_REQ),
        .S05_SC_B_send(m05_nodes_M_SC_B_SEND),
        .S05_SC_R_info(m05_nodes_M_SC_R_INFO),
        .S05_SC_R_payld(m05_nodes_M_SC_R_PAYLD),
        .S05_SC_R_recv(m05_nodes_M_SC_R_RECV),
        .S05_SC_R_req(m05_nodes_M_SC_R_REQ),
        .S05_SC_R_send(m05_nodes_M_SC_R_SEND),
        .S06_SC_B_info(m06_nodes_M_SC_B_INFO),
        .S06_SC_B_payld(m06_nodes_M_SC_B_PAYLD),
        .S06_SC_B_recv(m06_nodes_M_SC_B_RECV),
        .S06_SC_B_req(m06_nodes_M_SC_B_REQ),
        .S06_SC_B_send(m06_nodes_M_SC_B_SEND),
        .S06_SC_R_info(m06_nodes_M_SC_R_INFO),
        .S06_SC_R_payld(m06_nodes_M_SC_R_PAYLD),
        .S06_SC_R_recv(m06_nodes_M_SC_R_RECV),
        .S06_SC_R_req(m06_nodes_M_SC_R_REQ),
        .S06_SC_R_send(m06_nodes_M_SC_R_SEND),
        .S07_SC_B_info(m07_nodes_M_SC_B_INFO),
        .S07_SC_B_payld(m07_nodes_M_SC_B_PAYLD),
        .S07_SC_B_recv(m07_nodes_M_SC_B_RECV),
        .S07_SC_B_req(m07_nodes_M_SC_B_REQ),
        .S07_SC_B_send(m07_nodes_M_SC_B_SEND),
        .S07_SC_R_info(m07_nodes_M_SC_R_INFO),
        .S07_SC_R_payld(m07_nodes_M_SC_R_PAYLD),
        .S07_SC_R_recv(m07_nodes_M_SC_R_RECV),
        .S07_SC_R_req(m07_nodes_M_SC_R_REQ),
        .S07_SC_R_send(m07_nodes_M_SC_R_SEND),
        .aclk(swbd_aclk_net),
        .aresetn(swbd_aresetn_net));
endmodule

module clk_map_imp_14DRM6U
   (M00_ACLK,
    M00_ARESETN,
    M01_ACLK,
    M01_ARESETN,
    M02_ACLK,
    M02_ARESETN,
    M03_ACLK,
    M03_ARESETN,
    M04_ACLK,
    M04_ARESETN,
    M05_ACLK,
    M05_ARESETN,
    M06_ACLK,
    M06_ARESETN,
    M07_ACLK,
    M07_ARESETN,
    S00_ACLK,
    S00_ARESETN,
    S01_ACLK,
    S01_ARESETN,
    S02_ACLK,
    S02_ARESETN,
    S03_ACLK,
    S03_ARESETN,
    aclk,
    aresetn,
    aresetn_out,
    swbd_aclk,
    swbd_aresetn);
  output M00_ACLK;
  output [0:0]M00_ARESETN;
  output M01_ACLK;
  output [0:0]M01_ARESETN;
  output M02_ACLK;
  output [0:0]M02_ARESETN;
  output M03_ACLK;
  output [0:0]M03_ARESETN;
  output M04_ACLK;
  output [0:0]M04_ARESETN;
  output M05_ACLK;
  output [0:0]M05_ARESETN;
  output M06_ACLK;
  output [0:0]M06_ARESETN;
  output M07_ACLK;
  output [0:0]M07_ARESETN;
  output S00_ACLK;
  output [0:0]S00_ARESETN;
  output S01_ACLK;
  output [0:0]S01_ARESETN;
  output S02_ACLK;
  output [0:0]S02_ARESETN;
  output S03_ACLK;
  output [0:0]S03_ARESETN;
  input aclk;
  input aresetn;
  output aresetn_out;
  output swbd_aclk;
  output [0:0]swbd_aresetn;

  wire clk_map_aclk_net;
  wire clk_map_aresetn_net;
  wire [0:0]one_dout;
  wire [0:0]psr_aclk_interconnect_aresetn;

  assign M00_ACLK = clk_map_aclk_net;
  assign M00_ARESETN[0] = psr_aclk_interconnect_aresetn;
  assign M01_ACLK = clk_map_aclk_net;
  assign M01_ARESETN[0] = psr_aclk_interconnect_aresetn;
  assign M02_ACLK = clk_map_aclk_net;
  assign M02_ARESETN[0] = psr_aclk_interconnect_aresetn;
  assign M03_ACLK = clk_map_aclk_net;
  assign M03_ARESETN[0] = psr_aclk_interconnect_aresetn;
  assign M04_ACLK = clk_map_aclk_net;
  assign M04_ARESETN[0] = psr_aclk_interconnect_aresetn;
  assign M05_ACLK = clk_map_aclk_net;
  assign M05_ARESETN[0] = psr_aclk_interconnect_aresetn;
  assign M06_ACLK = clk_map_aclk_net;
  assign M06_ARESETN[0] = psr_aclk_interconnect_aresetn;
  assign M07_ACLK = clk_map_aclk_net;
  assign M07_ARESETN[0] = psr_aclk_interconnect_aresetn;
  assign S00_ACLK = clk_map_aclk_net;
  assign S00_ARESETN[0] = psr_aclk_interconnect_aresetn;
  assign S01_ACLK = clk_map_aclk_net;
  assign S01_ARESETN[0] = psr_aclk_interconnect_aresetn;
  assign S02_ACLK = clk_map_aclk_net;
  assign S02_ARESETN[0] = psr_aclk_interconnect_aresetn;
  assign S03_ACLK = clk_map_aclk_net;
  assign S03_ARESETN[0] = psr_aclk_interconnect_aresetn;
  assign clk_map_aclk_net = aclk;
  assign clk_map_aresetn_net = aresetn;
  assign swbd_aclk = clk_map_aclk_net;
  assign swbd_aresetn[0] = psr_aclk_interconnect_aresetn;
  bd_63e1_one_0 one
       (.dout(one_dout));
  bd_63e1_psr_aclk_0 psr_aclk
       (.aux_reset_in(clk_map_aresetn_net),
        .dcm_locked(1'b1),
        .ext_reset_in(one_dout),
        .interconnect_aresetn(psr_aclk_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .slowest_sync_clk(clk_map_aclk_net));
endmodule

module m00_exit_pipeline_imp_T69UQ5
   (aclk,
    aresetn,
    m_axi_araddr,
    m_axi_arburst,
    m_axi_arcache,
    m_axi_arlen,
    m_axi_arlock,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arready,
    m_axi_arsize,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_awaddr,
    m_axi_awburst,
    m_axi_awcache,
    m_axi_awlen,
    m_axi_awlock,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awready,
    m_axi_awsize,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_bready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_rdata,
    m_axi_rlast,
    m_axi_rready,
    m_axi_rresp,
    m_axi_rvalid,
    m_axi_wdata,
    m_axi_wlast,
    m_axi_wready,
    m_axi_wstrb,
    m_axi_wvalid,
    s_axi_araddr,
    s_axi_arcache,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arlock,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arready,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_awaddr,
    s_axi_awcache,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awlock,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awready,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_bid,
    s_axi_bready,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_rdata,
    s_axi_rid,
    s_axi_rlast,
    s_axi_rready,
    s_axi_rresp,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_wdata,
    s_axi_wlast,
    s_axi_wready,
    s_axi_wstrb,
    s_axi_wuser,
    s_axi_wvalid);
  input aclk;
  input aresetn;
  output [31:0]m_axi_araddr;
  output [1:0]m_axi_arburst;
  output [3:0]m_axi_arcache;
  output [3:0]m_axi_arlen;
  output [1:0]m_axi_arlock;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  input m_axi_arready;
  output [2:0]m_axi_arsize;
  output [3:0]m_axi_aruser;
  output m_axi_arvalid;
  output [31:0]m_axi_awaddr;
  output [1:0]m_axi_awburst;
  output [3:0]m_axi_awcache;
  output [3:0]m_axi_awlen;
  output [1:0]m_axi_awlock;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  input m_axi_awready;
  output [2:0]m_axi_awsize;
  output [3:0]m_axi_awuser;
  output m_axi_awvalid;
  output m_axi_bready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  input [63:0]m_axi_rdata;
  input m_axi_rlast;
  output m_axi_rready;
  input [1:0]m_axi_rresp;
  input m_axi_rvalid;
  output [63:0]m_axi_wdata;
  output m_axi_wlast;
  input m_axi_wready;
  output [7:0]m_axi_wstrb;
  output m_axi_wvalid;
  input [31:0]s_axi_araddr;
  input [3:0]s_axi_arcache;
  input [4:0]s_axi_arid;
  input [7:0]s_axi_arlen;
  input [0:0]s_axi_arlock;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  output s_axi_arready;
  input [1023:0]s_axi_aruser;
  input s_axi_arvalid;
  input [31:0]s_axi_awaddr;
  input [3:0]s_axi_awcache;
  input [4:0]s_axi_awid;
  input [7:0]s_axi_awlen;
  input [0:0]s_axi_awlock;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  output s_axi_awready;
  input [1023:0]s_axi_awuser;
  input s_axi_awvalid;
  output [4:0]s_axi_bid;
  input s_axi_bready;
  output [1:0]s_axi_bresp;
  output [1023:0]s_axi_buser;
  output s_axi_bvalid;
  output [63:0]s_axi_rdata;
  output [4:0]s_axi_rid;
  output s_axi_rlast;
  input s_axi_rready;
  output [1:0]s_axi_rresp;
  output [1023:0]s_axi_ruser;
  output s_axi_rvalid;
  input [63:0]s_axi_wdata;
  input s_axi_wlast;
  output s_axi_wready;
  input [7:0]s_axi_wstrb;
  input [1023:0]s_axi_wuser;
  input s_axi_wvalid;

  wire aclk_1;
  wire aresetn_1;
  wire [31:0]m00_exit_M_AXI_ARADDR;
  wire [1:0]m00_exit_M_AXI_ARBURST;
  wire [3:0]m00_exit_M_AXI_ARCACHE;
  wire [3:0]m00_exit_M_AXI_ARLEN;
  wire [1:0]m00_exit_M_AXI_ARLOCK;
  wire [2:0]m00_exit_M_AXI_ARPROT;
  wire [3:0]m00_exit_M_AXI_ARQOS;
  wire m00_exit_M_AXI_ARREADY;
  wire [2:0]m00_exit_M_AXI_ARSIZE;
  wire [3:0]m00_exit_M_AXI_ARUSER;
  wire m00_exit_M_AXI_ARVALID;
  wire [31:0]m00_exit_M_AXI_AWADDR;
  wire [1:0]m00_exit_M_AXI_AWBURST;
  wire [3:0]m00_exit_M_AXI_AWCACHE;
  wire [3:0]m00_exit_M_AXI_AWLEN;
  wire [1:0]m00_exit_M_AXI_AWLOCK;
  wire [2:0]m00_exit_M_AXI_AWPROT;
  wire [3:0]m00_exit_M_AXI_AWQOS;
  wire m00_exit_M_AXI_AWREADY;
  wire [2:0]m00_exit_M_AXI_AWSIZE;
  wire [3:0]m00_exit_M_AXI_AWUSER;
  wire m00_exit_M_AXI_AWVALID;
  wire m00_exit_M_AXI_BREADY;
  wire [1:0]m00_exit_M_AXI_BRESP;
  wire m00_exit_M_AXI_BVALID;
  wire [63:0]m00_exit_M_AXI_RDATA;
  wire m00_exit_M_AXI_RLAST;
  wire m00_exit_M_AXI_RREADY;
  wire [1:0]m00_exit_M_AXI_RRESP;
  wire m00_exit_M_AXI_RVALID;
  wire [63:0]m00_exit_M_AXI_WDATA;
  wire m00_exit_M_AXI_WLAST;
  wire m00_exit_M_AXI_WREADY;
  wire [7:0]m00_exit_M_AXI_WSTRB;
  wire m00_exit_M_AXI_WVALID;
  wire [31:0]s_axi_1_ARADDR;
  wire [3:0]s_axi_1_ARCACHE;
  wire [4:0]s_axi_1_ARID;
  wire [7:0]s_axi_1_ARLEN;
  wire [0:0]s_axi_1_ARLOCK;
  wire [2:0]s_axi_1_ARPROT;
  wire [3:0]s_axi_1_ARQOS;
  wire s_axi_1_ARREADY;
  wire [1023:0]s_axi_1_ARUSER;
  wire s_axi_1_ARVALID;
  wire [31:0]s_axi_1_AWADDR;
  wire [3:0]s_axi_1_AWCACHE;
  wire [4:0]s_axi_1_AWID;
  wire [7:0]s_axi_1_AWLEN;
  wire [0:0]s_axi_1_AWLOCK;
  wire [2:0]s_axi_1_AWPROT;
  wire [3:0]s_axi_1_AWQOS;
  wire s_axi_1_AWREADY;
  wire [1023:0]s_axi_1_AWUSER;
  wire s_axi_1_AWVALID;
  wire [4:0]s_axi_1_BID;
  wire s_axi_1_BREADY;
  wire [1:0]s_axi_1_BRESP;
  wire [1023:0]s_axi_1_BUSER;
  wire s_axi_1_BVALID;
  wire [63:0]s_axi_1_RDATA;
  wire [4:0]s_axi_1_RID;
  wire s_axi_1_RLAST;
  wire s_axi_1_RREADY;
  wire [1:0]s_axi_1_RRESP;
  wire [1023:0]s_axi_1_RUSER;
  wire s_axi_1_RVALID;
  wire [63:0]s_axi_1_WDATA;
  wire s_axi_1_WLAST;
  wire s_axi_1_WREADY;
  wire [7:0]s_axi_1_WSTRB;
  wire [1023:0]s_axi_1_WUSER;
  wire s_axi_1_WVALID;

  assign aclk_1 = aclk;
  assign aresetn_1 = aresetn;
  assign m00_exit_M_AXI_ARREADY = m_axi_arready;
  assign m00_exit_M_AXI_AWREADY = m_axi_awready;
  assign m00_exit_M_AXI_BRESP = m_axi_bresp[1:0];
  assign m00_exit_M_AXI_BVALID = m_axi_bvalid;
  assign m00_exit_M_AXI_RDATA = m_axi_rdata[63:0];
  assign m00_exit_M_AXI_RLAST = m_axi_rlast;
  assign m00_exit_M_AXI_RRESP = m_axi_rresp[1:0];
  assign m00_exit_M_AXI_RVALID = m_axi_rvalid;
  assign m00_exit_M_AXI_WREADY = m_axi_wready;
  assign m_axi_araddr[31:0] = m00_exit_M_AXI_ARADDR;
  assign m_axi_arburst[1:0] = m00_exit_M_AXI_ARBURST;
  assign m_axi_arcache[3:0] = m00_exit_M_AXI_ARCACHE;
  assign m_axi_arlen[3:0] = m00_exit_M_AXI_ARLEN;
  assign m_axi_arlock[1:0] = m00_exit_M_AXI_ARLOCK;
  assign m_axi_arprot[2:0] = m00_exit_M_AXI_ARPROT;
  assign m_axi_arqos[3:0] = m00_exit_M_AXI_ARQOS;
  assign m_axi_arsize[2:0] = m00_exit_M_AXI_ARSIZE;
  assign m_axi_aruser[3:0] = m00_exit_M_AXI_ARUSER;
  assign m_axi_arvalid = m00_exit_M_AXI_ARVALID;
  assign m_axi_awaddr[31:0] = m00_exit_M_AXI_AWADDR;
  assign m_axi_awburst[1:0] = m00_exit_M_AXI_AWBURST;
  assign m_axi_awcache[3:0] = m00_exit_M_AXI_AWCACHE;
  assign m_axi_awlen[3:0] = m00_exit_M_AXI_AWLEN;
  assign m_axi_awlock[1:0] = m00_exit_M_AXI_AWLOCK;
  assign m_axi_awprot[2:0] = m00_exit_M_AXI_AWPROT;
  assign m_axi_awqos[3:0] = m00_exit_M_AXI_AWQOS;
  assign m_axi_awsize[2:0] = m00_exit_M_AXI_AWSIZE;
  assign m_axi_awuser[3:0] = m00_exit_M_AXI_AWUSER;
  assign m_axi_awvalid = m00_exit_M_AXI_AWVALID;
  assign m_axi_bready = m00_exit_M_AXI_BREADY;
  assign m_axi_rready = m00_exit_M_AXI_RREADY;
  assign m_axi_wdata[63:0] = m00_exit_M_AXI_WDATA;
  assign m_axi_wlast = m00_exit_M_AXI_WLAST;
  assign m_axi_wstrb[7:0] = m00_exit_M_AXI_WSTRB;
  assign m_axi_wvalid = m00_exit_M_AXI_WVALID;
  assign s_axi_1_ARADDR = s_axi_araddr[31:0];
  assign s_axi_1_ARCACHE = s_axi_arcache[3:0];
  assign s_axi_1_ARID = s_axi_arid[4:0];
  assign s_axi_1_ARLEN = s_axi_arlen[7:0];
  assign s_axi_1_ARLOCK = s_axi_arlock[0];
  assign s_axi_1_ARPROT = s_axi_arprot[2:0];
  assign s_axi_1_ARQOS = s_axi_arqos[3:0];
  assign s_axi_1_ARUSER = s_axi_aruser[1023:0];
  assign s_axi_1_ARVALID = s_axi_arvalid;
  assign s_axi_1_AWADDR = s_axi_awaddr[31:0];
  assign s_axi_1_AWCACHE = s_axi_awcache[3:0];
  assign s_axi_1_AWID = s_axi_awid[4:0];
  assign s_axi_1_AWLEN = s_axi_awlen[7:0];
  assign s_axi_1_AWLOCK = s_axi_awlock[0];
  assign s_axi_1_AWPROT = s_axi_awprot[2:0];
  assign s_axi_1_AWQOS = s_axi_awqos[3:0];
  assign s_axi_1_AWUSER = s_axi_awuser[1023:0];
  assign s_axi_1_AWVALID = s_axi_awvalid;
  assign s_axi_1_BREADY = s_axi_bready;
  assign s_axi_1_RREADY = s_axi_rready;
  assign s_axi_1_WDATA = s_axi_wdata[63:0];
  assign s_axi_1_WLAST = s_axi_wlast;
  assign s_axi_1_WSTRB = s_axi_wstrb[7:0];
  assign s_axi_1_WUSER = s_axi_wuser[1023:0];
  assign s_axi_1_WVALID = s_axi_wvalid;
  assign s_axi_arready = s_axi_1_ARREADY;
  assign s_axi_awready = s_axi_1_AWREADY;
  assign s_axi_bid[4:0] = s_axi_1_BID;
  assign s_axi_bresp[1:0] = s_axi_1_BRESP;
  assign s_axi_buser[1023:0] = s_axi_1_BUSER;
  assign s_axi_bvalid = s_axi_1_BVALID;
  assign s_axi_rdata[63:0] = s_axi_1_RDATA;
  assign s_axi_rid[4:0] = s_axi_1_RID;
  assign s_axi_rlast = s_axi_1_RLAST;
  assign s_axi_rresp[1:0] = s_axi_1_RRESP;
  assign s_axi_ruser[1023:0] = s_axi_1_RUSER;
  assign s_axi_rvalid = s_axi_1_RVALID;
  assign s_axi_wready = s_axi_1_WREADY;
  bd_63e1_m00e_0 m00_exit
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_araddr(m00_exit_M_AXI_ARADDR),
        .m_axi_arburst(m00_exit_M_AXI_ARBURST),
        .m_axi_arcache(m00_exit_M_AXI_ARCACHE),
        .m_axi_arlen(m00_exit_M_AXI_ARLEN),
        .m_axi_arlock(m00_exit_M_AXI_ARLOCK),
        .m_axi_arprot(m00_exit_M_AXI_ARPROT),
        .m_axi_arqos(m00_exit_M_AXI_ARQOS),
        .m_axi_arready(m00_exit_M_AXI_ARREADY),
        .m_axi_arsize(m00_exit_M_AXI_ARSIZE),
        .m_axi_aruser(m00_exit_M_AXI_ARUSER),
        .m_axi_arvalid(m00_exit_M_AXI_ARVALID),
        .m_axi_awaddr(m00_exit_M_AXI_AWADDR),
        .m_axi_awburst(m00_exit_M_AXI_AWBURST),
        .m_axi_awcache(m00_exit_M_AXI_AWCACHE),
        .m_axi_awlen(m00_exit_M_AXI_AWLEN),
        .m_axi_awlock(m00_exit_M_AXI_AWLOCK),
        .m_axi_awprot(m00_exit_M_AXI_AWPROT),
        .m_axi_awqos(m00_exit_M_AXI_AWQOS),
        .m_axi_awready(m00_exit_M_AXI_AWREADY),
        .m_axi_awsize(m00_exit_M_AXI_AWSIZE),
        .m_axi_awuser(m00_exit_M_AXI_AWUSER),
        .m_axi_awvalid(m00_exit_M_AXI_AWVALID),
        .m_axi_bready(m00_exit_M_AXI_BREADY),
        .m_axi_bresp(m00_exit_M_AXI_BRESP),
        .m_axi_bvalid(m00_exit_M_AXI_BVALID),
        .m_axi_rdata(m00_exit_M_AXI_RDATA),
        .m_axi_rlast(m00_exit_M_AXI_RLAST),
        .m_axi_rready(m00_exit_M_AXI_RREADY),
        .m_axi_rresp(m00_exit_M_AXI_RRESP),
        .m_axi_rvalid(m00_exit_M_AXI_RVALID),
        .m_axi_wdata(m00_exit_M_AXI_WDATA),
        .m_axi_wlast(m00_exit_M_AXI_WLAST),
        .m_axi_wready(m00_exit_M_AXI_WREADY),
        .m_axi_wstrb(m00_exit_M_AXI_WSTRB),
        .m_axi_wvalid(m00_exit_M_AXI_WVALID),
        .s_axi_araddr(s_axi_1_ARADDR),
        .s_axi_arcache(s_axi_1_ARCACHE),
        .s_axi_arid(s_axi_1_ARID),
        .s_axi_arlen(s_axi_1_ARLEN),
        .s_axi_arlock(s_axi_1_ARLOCK),
        .s_axi_arprot(s_axi_1_ARPROT),
        .s_axi_arqos(s_axi_1_ARQOS),
        .s_axi_arready(s_axi_1_ARREADY),
        .s_axi_aruser(s_axi_1_ARUSER),
        .s_axi_arvalid(s_axi_1_ARVALID),
        .s_axi_awaddr(s_axi_1_AWADDR),
        .s_axi_awcache(s_axi_1_AWCACHE),
        .s_axi_awid(s_axi_1_AWID),
        .s_axi_awlen(s_axi_1_AWLEN),
        .s_axi_awlock(s_axi_1_AWLOCK),
        .s_axi_awprot(s_axi_1_AWPROT),
        .s_axi_awqos(s_axi_1_AWQOS),
        .s_axi_awready(s_axi_1_AWREADY),
        .s_axi_awuser(s_axi_1_AWUSER),
        .s_axi_awvalid(s_axi_1_AWVALID),
        .s_axi_bid(s_axi_1_BID),
        .s_axi_bready(s_axi_1_BREADY),
        .s_axi_bresp(s_axi_1_BRESP),
        .s_axi_buser(s_axi_1_BUSER),
        .s_axi_bvalid(s_axi_1_BVALID),
        .s_axi_rdata(s_axi_1_RDATA),
        .s_axi_rid(s_axi_1_RID),
        .s_axi_rlast(s_axi_1_RLAST),
        .s_axi_rready(s_axi_1_RREADY),
        .s_axi_rresp(s_axi_1_RRESP),
        .s_axi_ruser(s_axi_1_RUSER),
        .s_axi_rvalid(s_axi_1_RVALID),
        .s_axi_wdata(s_axi_1_WDATA),
        .s_axi_wlast(s_axi_1_WLAST),
        .s_axi_wready(s_axi_1_WREADY),
        .s_axi_wstrb(s_axi_1_WSTRB),
        .s_axi_wuser(s_axi_1_WUSER),
        .s_axi_wvalid(s_axi_1_WVALID));
endmodule

module m00_nodes_imp_FTZN4X
   (M_SC_AR_info,
    M_SC_AR_payld,
    M_SC_AR_recv,
    M_SC_AR_req,
    M_SC_AR_send,
    M_SC_AW_info,
    M_SC_AW_payld,
    M_SC_AW_recv,
    M_SC_AW_req,
    M_SC_AW_send,
    M_SC_B_info,
    M_SC_B_payld,
    M_SC_B_recv,
    M_SC_B_req,
    M_SC_B_send,
    M_SC_R_info,
    M_SC_R_payld,
    M_SC_R_recv,
    M_SC_R_req,
    M_SC_R_send,
    M_SC_W_info,
    M_SC_W_payld,
    M_SC_W_recv,
    M_SC_W_req,
    M_SC_W_send,
    S_SC_AR_info,
    S_SC_AR_payld,
    S_SC_AR_recv,
    S_SC_AR_req,
    S_SC_AR_send,
    S_SC_AW_info,
    S_SC_AW_payld,
    S_SC_AW_recv,
    S_SC_AW_req,
    S_SC_AW_send,
    S_SC_B_info,
    S_SC_B_payld,
    S_SC_B_recv,
    S_SC_B_req,
    S_SC_B_send,
    S_SC_R_info,
    S_SC_R_payld,
    S_SC_R_recv,
    S_SC_R_req,
    S_SC_R_send,
    S_SC_W_info,
    S_SC_W_payld,
    S_SC_W_recv,
    S_SC_W_req,
    S_SC_W_send,
    m_axi_aclk,
    m_axi_aresetn,
    s_axi_aclk,
    s_axi_aresetn);
  output [0:0]M_SC_AR_info;
  output [155:0]M_SC_AR_payld;
  input [0:0]M_SC_AR_recv;
  output [0:0]M_SC_AR_req;
  output [0:0]M_SC_AR_send;
  output [0:0]M_SC_AW_info;
  output [155:0]M_SC_AW_payld;
  input [0:0]M_SC_AW_recv;
  output [0:0]M_SC_AW_req;
  output [0:0]M_SC_AW_send;
  output [3:0]M_SC_B_info;
  output [11:0]M_SC_B_payld;
  input [3:0]M_SC_B_recv;
  output [3:0]M_SC_B_req;
  output [3:0]M_SC_B_send;
  output [3:0]M_SC_R_info;
  output [89:0]M_SC_R_payld;
  input [3:0]M_SC_R_recv;
  output [3:0]M_SC_R_req;
  output [3:0]M_SC_R_send;
  output [0:0]M_SC_W_info;
  output [94:0]M_SC_W_payld;
  input [0:0]M_SC_W_recv;
  output [0:0]M_SC_W_req;
  output [0:0]M_SC_W_send;
  input [3:0]S_SC_AR_info;
  input [155:0]S_SC_AR_payld;
  output [3:0]S_SC_AR_recv;
  input [3:0]S_SC_AR_req;
  input [3:0]S_SC_AR_send;
  input [3:0]S_SC_AW_info;
  input [155:0]S_SC_AW_payld;
  output [3:0]S_SC_AW_recv;
  input [3:0]S_SC_AW_req;
  input [3:0]S_SC_AW_send;
  input [0:0]S_SC_B_info;
  input [11:0]S_SC_B_payld;
  output [0:0]S_SC_B_recv;
  input [0:0]S_SC_B_req;
  input [0:0]S_SC_B_send;
  input [0:0]S_SC_R_info;
  input [89:0]S_SC_R_payld;
  output [0:0]S_SC_R_recv;
  input [0:0]S_SC_R_req;
  input [0:0]S_SC_R_send;
  input [3:0]S_SC_W_info;
  input [94:0]S_SC_W_payld;
  output [3:0]S_SC_W_recv;
  input [3:0]S_SC_W_req;
  input [3:0]S_SC_W_send;
  input m_axi_aclk;
  input m_axi_aresetn;
  input s_axi_aclk;
  input s_axi_aresetn;

  wire [3:0]S_SC_AR_1_INFO;
  wire [155:0]S_SC_AR_1_PAYLD;
  wire [3:0]S_SC_AR_1_RECV;
  wire [3:0]S_SC_AR_1_REQ;
  wire [3:0]S_SC_AR_1_SEND;
  wire [3:0]S_SC_AW_1_INFO;
  wire [155:0]S_SC_AW_1_PAYLD;
  wire [3:0]S_SC_AW_1_RECV;
  wire [3:0]S_SC_AW_1_REQ;
  wire [3:0]S_SC_AW_1_SEND;
  wire [0:0]S_SC_B_1_INFO;
  wire [11:0]S_SC_B_1_PAYLD;
  wire [0:0]S_SC_B_1_RECV;
  wire [0:0]S_SC_B_1_REQ;
  wire [0:0]S_SC_B_1_SEND;
  wire [0:0]S_SC_R_1_INFO;
  wire [89:0]S_SC_R_1_PAYLD;
  wire [0:0]S_SC_R_1_RECV;
  wire [0:0]S_SC_R_1_REQ;
  wire [0:0]S_SC_R_1_SEND;
  wire [3:0]S_SC_W_1_INFO;
  wire [94:0]S_SC_W_1_PAYLD;
  wire [3:0]S_SC_W_1_RECV;
  wire [3:0]S_SC_W_1_REQ;
  wire [3:0]S_SC_W_1_SEND;
  wire [0:0]m00_ar_node_M_SC_INFO;
  wire [155:0]m00_ar_node_M_SC_PAYLD;
  wire [0:0]m00_ar_node_M_SC_RECV;
  wire [0:0]m00_ar_node_M_SC_REQ;
  wire [0:0]m00_ar_node_M_SC_SEND;
  wire [15:0]m00_aw_node_M_AXIS_ARB_TDATA;
  wire m00_aw_node_M_AXIS_ARB_TREADY;
  wire m00_aw_node_M_AXIS_ARB_TVALID;
  wire [0:0]m00_aw_node_M_SC_INFO;
  wire [155:0]m00_aw_node_M_SC_PAYLD;
  wire [0:0]m00_aw_node_M_SC_RECV;
  wire [0:0]m00_aw_node_M_SC_REQ;
  wire [0:0]m00_aw_node_M_SC_SEND;
  wire [3:0]m00_b_node_M_SC_INFO;
  wire [11:0]m00_b_node_M_SC_PAYLD;
  wire [3:0]m00_b_node_M_SC_RECV;
  wire [3:0]m00_b_node_M_SC_REQ;
  wire [3:0]m00_b_node_M_SC_SEND;
  wire [3:0]m00_r_node_M_SC_INFO;
  wire [89:0]m00_r_node_M_SC_PAYLD;
  wire [3:0]m00_r_node_M_SC_RECV;
  wire [3:0]m00_r_node_M_SC_REQ;
  wire [3:0]m00_r_node_M_SC_SEND;
  wire [0:0]m00_w_node_M_SC_INFO;
  wire [94:0]m00_w_node_M_SC_PAYLD;
  wire [0:0]m00_w_node_M_SC_RECV;
  wire [0:0]m00_w_node_M_SC_REQ;
  wire [0:0]m00_w_node_M_SC_SEND;
  wire m_axi_aclk_1;
  wire m_axi_aresetn_1;
  wire s_axi_aclk_1;
  wire s_axi_aresetn_1;

  assign M_SC_AR_info[0] = m00_ar_node_M_SC_INFO;
  assign M_SC_AR_payld[155:0] = m00_ar_node_M_SC_PAYLD;
  assign M_SC_AR_req[0] = m00_ar_node_M_SC_REQ;
  assign M_SC_AR_send[0] = m00_ar_node_M_SC_SEND;
  assign M_SC_AW_info[0] = m00_aw_node_M_SC_INFO;
  assign M_SC_AW_payld[155:0] = m00_aw_node_M_SC_PAYLD;
  assign M_SC_AW_req[0] = m00_aw_node_M_SC_REQ;
  assign M_SC_AW_send[0] = m00_aw_node_M_SC_SEND;
  assign M_SC_B_info[3:0] = m00_b_node_M_SC_INFO;
  assign M_SC_B_payld[11:0] = m00_b_node_M_SC_PAYLD;
  assign M_SC_B_req[3:0] = m00_b_node_M_SC_REQ;
  assign M_SC_B_send[3:0] = m00_b_node_M_SC_SEND;
  assign M_SC_R_info[3:0] = m00_r_node_M_SC_INFO;
  assign M_SC_R_payld[89:0] = m00_r_node_M_SC_PAYLD;
  assign M_SC_R_req[3:0] = m00_r_node_M_SC_REQ;
  assign M_SC_R_send[3:0] = m00_r_node_M_SC_SEND;
  assign M_SC_W_info[0] = m00_w_node_M_SC_INFO;
  assign M_SC_W_payld[94:0] = m00_w_node_M_SC_PAYLD;
  assign M_SC_W_req[0] = m00_w_node_M_SC_REQ;
  assign M_SC_W_send[0] = m00_w_node_M_SC_SEND;
  assign S_SC_AR_1_INFO = S_SC_AR_info[3:0];
  assign S_SC_AR_1_PAYLD = S_SC_AR_payld[155:0];
  assign S_SC_AR_1_REQ = S_SC_AR_req[3:0];
  assign S_SC_AR_1_SEND = S_SC_AR_send[3:0];
  assign S_SC_AR_recv[3:0] = S_SC_AR_1_RECV;
  assign S_SC_AW_1_INFO = S_SC_AW_info[3:0];
  assign S_SC_AW_1_PAYLD = S_SC_AW_payld[155:0];
  assign S_SC_AW_1_REQ = S_SC_AW_req[3:0];
  assign S_SC_AW_1_SEND = S_SC_AW_send[3:0];
  assign S_SC_AW_recv[3:0] = S_SC_AW_1_RECV;
  assign S_SC_B_1_INFO = S_SC_B_info[0];
  assign S_SC_B_1_PAYLD = S_SC_B_payld[11:0];
  assign S_SC_B_1_REQ = S_SC_B_req[0];
  assign S_SC_B_1_SEND = S_SC_B_send[0];
  assign S_SC_B_recv[0] = S_SC_B_1_RECV;
  assign S_SC_R_1_INFO = S_SC_R_info[0];
  assign S_SC_R_1_PAYLD = S_SC_R_payld[89:0];
  assign S_SC_R_1_REQ = S_SC_R_req[0];
  assign S_SC_R_1_SEND = S_SC_R_send[0];
  assign S_SC_R_recv[0] = S_SC_R_1_RECV;
  assign S_SC_W_1_INFO = S_SC_W_info[3:0];
  assign S_SC_W_1_PAYLD = S_SC_W_payld[94:0];
  assign S_SC_W_1_REQ = S_SC_W_req[3:0];
  assign S_SC_W_1_SEND = S_SC_W_send[3:0];
  assign S_SC_W_recv[3:0] = S_SC_W_1_RECV;
  assign m00_ar_node_M_SC_RECV = M_SC_AR_recv[0];
  assign m00_aw_node_M_SC_RECV = M_SC_AW_recv[0];
  assign m00_b_node_M_SC_RECV = M_SC_B_recv[3:0];
  assign m00_r_node_M_SC_RECV = M_SC_R_recv[3:0];
  assign m00_w_node_M_SC_RECV = M_SC_W_recv[0];
  assign m_axi_aclk_1 = m_axi_aclk;
  assign m_axi_aresetn_1 = m_axi_aresetn;
  assign s_axi_aclk_1 = s_axi_aclk;
  assign s_axi_aresetn_1 = s_axi_aresetn;
  bd_63e1_m00arn_0 m00_ar_node
       (.m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m00_ar_node_M_SC_INFO),
        .m_sc_payld(m00_ar_node_M_SC_PAYLD),
        .m_sc_recv(m00_ar_node_M_SC_RECV),
        .m_sc_req(m00_ar_node_M_SC_REQ),
        .m_sc_send(m00_ar_node_M_SC_SEND),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_AR_1_INFO),
        .s_sc_payld(S_SC_AR_1_PAYLD),
        .s_sc_recv(S_SC_AR_1_RECV),
        .s_sc_req(S_SC_AR_1_REQ),
        .s_sc_send(S_SC_AR_1_SEND));
  bd_63e1_m00awn_0 m00_aw_node
       (.m_axis_arb_tdata(m00_aw_node_M_AXIS_ARB_TDATA),
        .m_axis_arb_tready(m00_aw_node_M_AXIS_ARB_TREADY),
        .m_axis_arb_tvalid(m00_aw_node_M_AXIS_ARB_TVALID),
        .m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m00_aw_node_M_SC_INFO),
        .m_sc_payld(m00_aw_node_M_SC_PAYLD),
        .m_sc_recv(m00_aw_node_M_SC_RECV),
        .m_sc_req(m00_aw_node_M_SC_REQ),
        .m_sc_send(m00_aw_node_M_SC_SEND),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_AW_1_INFO),
        .s_sc_payld(S_SC_AW_1_PAYLD),
        .s_sc_recv(S_SC_AW_1_RECV),
        .s_sc_req(S_SC_AW_1_REQ),
        .s_sc_send(S_SC_AW_1_SEND));
  bd_63e1_m00bn_0 m00_b_node
       (.m_sc_aclk(s_axi_aclk_1),
        .m_sc_aresetn(s_axi_aresetn_1),
        .m_sc_info(m00_b_node_M_SC_INFO),
        .m_sc_payld(m00_b_node_M_SC_PAYLD),
        .m_sc_recv(m00_b_node_M_SC_RECV),
        .m_sc_req(m00_b_node_M_SC_REQ),
        .m_sc_send(m00_b_node_M_SC_SEND),
        .s_sc_aclk(m_axi_aclk_1),
        .s_sc_aresetn(m_axi_aresetn_1),
        .s_sc_info(S_SC_B_1_INFO),
        .s_sc_payld(S_SC_B_1_PAYLD),
        .s_sc_recv(S_SC_B_1_RECV),
        .s_sc_req(S_SC_B_1_REQ),
        .s_sc_send(S_SC_B_1_SEND));
  bd_63e1_m00rn_0 m00_r_node
       (.m_sc_aclk(s_axi_aclk_1),
        .m_sc_aresetn(s_axi_aresetn_1),
        .m_sc_info(m00_r_node_M_SC_INFO),
        .m_sc_payld(m00_r_node_M_SC_PAYLD),
        .m_sc_recv(m00_r_node_M_SC_RECV),
        .m_sc_req(m00_r_node_M_SC_REQ),
        .m_sc_send(m00_r_node_M_SC_SEND),
        .s_sc_aclk(m_axi_aclk_1),
        .s_sc_aresetn(m_axi_aresetn_1),
        .s_sc_info(S_SC_R_1_INFO),
        .s_sc_payld(S_SC_R_1_PAYLD),
        .s_sc_recv(S_SC_R_1_RECV),
        .s_sc_req(S_SC_R_1_REQ),
        .s_sc_send(S_SC_R_1_SEND));
  bd_63e1_m00wn_0 m00_w_node
       (.m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m00_w_node_M_SC_INFO),
        .m_sc_payld(m00_w_node_M_SC_PAYLD),
        .m_sc_recv(m00_w_node_M_SC_RECV),
        .m_sc_req(m00_w_node_M_SC_REQ),
        .m_sc_send(m00_w_node_M_SC_SEND),
        .s_axis_arb_tdata(m00_aw_node_M_AXIS_ARB_TDATA),
        .s_axis_arb_tready(m00_aw_node_M_AXIS_ARB_TREADY),
        .s_axis_arb_tvalid(m00_aw_node_M_AXIS_ARB_TVALID),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_W_1_INFO),
        .s_sc_payld(S_SC_W_1_PAYLD),
        .s_sc_recv(S_SC_W_1_RECV),
        .s_sc_req(S_SC_W_1_REQ),
        .s_sc_send(S_SC_W_1_SEND));
endmodule

module m01_exit_pipeline_imp_YZ3EVH
   (aclk,
    aresetn,
    m_axi_araddr,
    m_axi_arprot,
    m_axi_arready,
    m_axi_arvalid,
    m_axi_awaddr,
    m_axi_awprot,
    m_axi_awready,
    m_axi_awvalid,
    m_axi_bready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_rdata,
    m_axi_rready,
    m_axi_rresp,
    m_axi_rvalid,
    m_axi_wdata,
    m_axi_wready,
    m_axi_wstrb,
    m_axi_wvalid,
    s_axi_araddr,
    s_axi_arcache,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arlock,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arready,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_awaddr,
    s_axi_awcache,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awlock,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awready,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_bid,
    s_axi_bready,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_rdata,
    s_axi_rid,
    s_axi_rlast,
    s_axi_rready,
    s_axi_rresp,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_wdata,
    s_axi_wlast,
    s_axi_wready,
    s_axi_wstrb,
    s_axi_wuser,
    s_axi_wvalid);
  input aclk;
  input aresetn;
  output [11:0]m_axi_araddr;
  output [2:0]m_axi_arprot;
  input m_axi_arready;
  output m_axi_arvalid;
  output [11:0]m_axi_awaddr;
  output [2:0]m_axi_awprot;
  input m_axi_awready;
  output m_axi_awvalid;
  output m_axi_bready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  input [31:0]m_axi_rdata;
  output m_axi_rready;
  input [1:0]m_axi_rresp;
  input m_axi_rvalid;
  output [31:0]m_axi_wdata;
  input m_axi_wready;
  output [3:0]m_axi_wstrb;
  output m_axi_wvalid;
  input [11:0]s_axi_araddr;
  input [3:0]s_axi_arcache;
  input [4:0]s_axi_arid;
  input [7:0]s_axi_arlen;
  input [0:0]s_axi_arlock;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  output s_axi_arready;
  input [1023:0]s_axi_aruser;
  input s_axi_arvalid;
  input [11:0]s_axi_awaddr;
  input [3:0]s_axi_awcache;
  input [4:0]s_axi_awid;
  input [7:0]s_axi_awlen;
  input [0:0]s_axi_awlock;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  output s_axi_awready;
  input [1023:0]s_axi_awuser;
  input s_axi_awvalid;
  output [4:0]s_axi_bid;
  input s_axi_bready;
  output [1:0]s_axi_bresp;
  output [1023:0]s_axi_buser;
  output s_axi_bvalid;
  output [31:0]s_axi_rdata;
  output [4:0]s_axi_rid;
  output s_axi_rlast;
  input s_axi_rready;
  output [1:0]s_axi_rresp;
  output [1023:0]s_axi_ruser;
  output s_axi_rvalid;
  input [31:0]s_axi_wdata;
  input s_axi_wlast;
  output s_axi_wready;
  input [3:0]s_axi_wstrb;
  input [1023:0]s_axi_wuser;
  input s_axi_wvalid;

  wire aclk_1;
  wire aresetn_1;
  wire [11:0]m01_exit_M_AXI_ARADDR;
  wire [2:0]m01_exit_M_AXI_ARPROT;
  wire m01_exit_M_AXI_ARREADY;
  wire m01_exit_M_AXI_ARVALID;
  wire [11:0]m01_exit_M_AXI_AWADDR;
  wire [2:0]m01_exit_M_AXI_AWPROT;
  wire m01_exit_M_AXI_AWREADY;
  wire m01_exit_M_AXI_AWVALID;
  wire m01_exit_M_AXI_BREADY;
  wire [1:0]m01_exit_M_AXI_BRESP;
  wire m01_exit_M_AXI_BVALID;
  wire [31:0]m01_exit_M_AXI_RDATA;
  wire m01_exit_M_AXI_RREADY;
  wire [1:0]m01_exit_M_AXI_RRESP;
  wire m01_exit_M_AXI_RVALID;
  wire [31:0]m01_exit_M_AXI_WDATA;
  wire m01_exit_M_AXI_WREADY;
  wire [3:0]m01_exit_M_AXI_WSTRB;
  wire m01_exit_M_AXI_WVALID;
  wire [11:0]s_axi_1_ARADDR;
  wire [3:0]s_axi_1_ARCACHE;
  wire [4:0]s_axi_1_ARID;
  wire [7:0]s_axi_1_ARLEN;
  wire [0:0]s_axi_1_ARLOCK;
  wire [2:0]s_axi_1_ARPROT;
  wire [3:0]s_axi_1_ARQOS;
  wire s_axi_1_ARREADY;
  wire [1023:0]s_axi_1_ARUSER;
  wire s_axi_1_ARVALID;
  wire [11:0]s_axi_1_AWADDR;
  wire [3:0]s_axi_1_AWCACHE;
  wire [4:0]s_axi_1_AWID;
  wire [7:0]s_axi_1_AWLEN;
  wire [0:0]s_axi_1_AWLOCK;
  wire [2:0]s_axi_1_AWPROT;
  wire [3:0]s_axi_1_AWQOS;
  wire s_axi_1_AWREADY;
  wire [1023:0]s_axi_1_AWUSER;
  wire s_axi_1_AWVALID;
  wire [4:0]s_axi_1_BID;
  wire s_axi_1_BREADY;
  wire [1:0]s_axi_1_BRESP;
  wire [1023:0]s_axi_1_BUSER;
  wire s_axi_1_BVALID;
  wire [31:0]s_axi_1_RDATA;
  wire [4:0]s_axi_1_RID;
  wire s_axi_1_RLAST;
  wire s_axi_1_RREADY;
  wire [1:0]s_axi_1_RRESP;
  wire [1023:0]s_axi_1_RUSER;
  wire s_axi_1_RVALID;
  wire [31:0]s_axi_1_WDATA;
  wire s_axi_1_WLAST;
  wire s_axi_1_WREADY;
  wire [3:0]s_axi_1_WSTRB;
  wire [1023:0]s_axi_1_WUSER;
  wire s_axi_1_WVALID;

  assign aclk_1 = aclk;
  assign aresetn_1 = aresetn;
  assign m01_exit_M_AXI_ARREADY = m_axi_arready;
  assign m01_exit_M_AXI_AWREADY = m_axi_awready;
  assign m01_exit_M_AXI_BRESP = m_axi_bresp[1:0];
  assign m01_exit_M_AXI_BVALID = m_axi_bvalid;
  assign m01_exit_M_AXI_RDATA = m_axi_rdata[31:0];
  assign m01_exit_M_AXI_RRESP = m_axi_rresp[1:0];
  assign m01_exit_M_AXI_RVALID = m_axi_rvalid;
  assign m01_exit_M_AXI_WREADY = m_axi_wready;
  assign m_axi_araddr[11:0] = m01_exit_M_AXI_ARADDR;
  assign m_axi_arprot[2:0] = m01_exit_M_AXI_ARPROT;
  assign m_axi_arvalid = m01_exit_M_AXI_ARVALID;
  assign m_axi_awaddr[11:0] = m01_exit_M_AXI_AWADDR;
  assign m_axi_awprot[2:0] = m01_exit_M_AXI_AWPROT;
  assign m_axi_awvalid = m01_exit_M_AXI_AWVALID;
  assign m_axi_bready = m01_exit_M_AXI_BREADY;
  assign m_axi_rready = m01_exit_M_AXI_RREADY;
  assign m_axi_wdata[31:0] = m01_exit_M_AXI_WDATA;
  assign m_axi_wstrb[3:0] = m01_exit_M_AXI_WSTRB;
  assign m_axi_wvalid = m01_exit_M_AXI_WVALID;
  assign s_axi_1_ARADDR = s_axi_araddr[11:0];
  assign s_axi_1_ARCACHE = s_axi_arcache[3:0];
  assign s_axi_1_ARID = s_axi_arid[4:0];
  assign s_axi_1_ARLEN = s_axi_arlen[7:0];
  assign s_axi_1_ARLOCK = s_axi_arlock[0];
  assign s_axi_1_ARPROT = s_axi_arprot[2:0];
  assign s_axi_1_ARQOS = s_axi_arqos[3:0];
  assign s_axi_1_ARUSER = s_axi_aruser[1023:0];
  assign s_axi_1_ARVALID = s_axi_arvalid;
  assign s_axi_1_AWADDR = s_axi_awaddr[11:0];
  assign s_axi_1_AWCACHE = s_axi_awcache[3:0];
  assign s_axi_1_AWID = s_axi_awid[4:0];
  assign s_axi_1_AWLEN = s_axi_awlen[7:0];
  assign s_axi_1_AWLOCK = s_axi_awlock[0];
  assign s_axi_1_AWPROT = s_axi_awprot[2:0];
  assign s_axi_1_AWQOS = s_axi_awqos[3:0];
  assign s_axi_1_AWUSER = s_axi_awuser[1023:0];
  assign s_axi_1_AWVALID = s_axi_awvalid;
  assign s_axi_1_BREADY = s_axi_bready;
  assign s_axi_1_RREADY = s_axi_rready;
  assign s_axi_1_WDATA = s_axi_wdata[31:0];
  assign s_axi_1_WLAST = s_axi_wlast;
  assign s_axi_1_WSTRB = s_axi_wstrb[3:0];
  assign s_axi_1_WUSER = s_axi_wuser[1023:0];
  assign s_axi_1_WVALID = s_axi_wvalid;
  assign s_axi_arready = s_axi_1_ARREADY;
  assign s_axi_awready = s_axi_1_AWREADY;
  assign s_axi_bid[4:0] = s_axi_1_BID;
  assign s_axi_bresp[1:0] = s_axi_1_BRESP;
  assign s_axi_buser[1023:0] = s_axi_1_BUSER;
  assign s_axi_bvalid = s_axi_1_BVALID;
  assign s_axi_rdata[31:0] = s_axi_1_RDATA;
  assign s_axi_rid[4:0] = s_axi_1_RID;
  assign s_axi_rlast = s_axi_1_RLAST;
  assign s_axi_rresp[1:0] = s_axi_1_RRESP;
  assign s_axi_ruser[1023:0] = s_axi_1_RUSER;
  assign s_axi_rvalid = s_axi_1_RVALID;
  assign s_axi_wready = s_axi_1_WREADY;
  bd_63e1_m01e_0 m01_exit
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_araddr(m01_exit_M_AXI_ARADDR),
        .m_axi_arprot(m01_exit_M_AXI_ARPROT),
        .m_axi_arready(m01_exit_M_AXI_ARREADY),
        .m_axi_arvalid(m01_exit_M_AXI_ARVALID),
        .m_axi_awaddr(m01_exit_M_AXI_AWADDR),
        .m_axi_awprot(m01_exit_M_AXI_AWPROT),
        .m_axi_awready(m01_exit_M_AXI_AWREADY),
        .m_axi_awvalid(m01_exit_M_AXI_AWVALID),
        .m_axi_bready(m01_exit_M_AXI_BREADY),
        .m_axi_bresp(m01_exit_M_AXI_BRESP),
        .m_axi_bvalid(m01_exit_M_AXI_BVALID),
        .m_axi_rdata(m01_exit_M_AXI_RDATA),
        .m_axi_rready(m01_exit_M_AXI_RREADY),
        .m_axi_rresp(m01_exit_M_AXI_RRESP),
        .m_axi_rvalid(m01_exit_M_AXI_RVALID),
        .m_axi_wdata(m01_exit_M_AXI_WDATA),
        .m_axi_wready(m01_exit_M_AXI_WREADY),
        .m_axi_wstrb(m01_exit_M_AXI_WSTRB),
        .m_axi_wvalid(m01_exit_M_AXI_WVALID),
        .s_axi_araddr(s_axi_1_ARADDR),
        .s_axi_arcache(s_axi_1_ARCACHE),
        .s_axi_arid(s_axi_1_ARID),
        .s_axi_arlen(s_axi_1_ARLEN),
        .s_axi_arlock(s_axi_1_ARLOCK),
        .s_axi_arprot(s_axi_1_ARPROT),
        .s_axi_arqos(s_axi_1_ARQOS),
        .s_axi_arready(s_axi_1_ARREADY),
        .s_axi_aruser(s_axi_1_ARUSER),
        .s_axi_arvalid(s_axi_1_ARVALID),
        .s_axi_awaddr(s_axi_1_AWADDR),
        .s_axi_awcache(s_axi_1_AWCACHE),
        .s_axi_awid(s_axi_1_AWID),
        .s_axi_awlen(s_axi_1_AWLEN),
        .s_axi_awlock(s_axi_1_AWLOCK),
        .s_axi_awprot(s_axi_1_AWPROT),
        .s_axi_awqos(s_axi_1_AWQOS),
        .s_axi_awready(s_axi_1_AWREADY),
        .s_axi_awuser(s_axi_1_AWUSER),
        .s_axi_awvalid(s_axi_1_AWVALID),
        .s_axi_bid(s_axi_1_BID),
        .s_axi_bready(s_axi_1_BREADY),
        .s_axi_bresp(s_axi_1_BRESP),
        .s_axi_buser(s_axi_1_BUSER),
        .s_axi_bvalid(s_axi_1_BVALID),
        .s_axi_rdata(s_axi_1_RDATA),
        .s_axi_rid(s_axi_1_RID),
        .s_axi_rlast(s_axi_1_RLAST),
        .s_axi_rready(s_axi_1_RREADY),
        .s_axi_rresp(s_axi_1_RRESP),
        .s_axi_ruser(s_axi_1_RUSER),
        .s_axi_rvalid(s_axi_1_RVALID),
        .s_axi_wdata(s_axi_1_WDATA),
        .s_axi_wlast(s_axi_1_WLAST),
        .s_axi_wready(s_axi_1_WREADY),
        .s_axi_wstrb(s_axi_1_WSTRB),
        .s_axi_wuser(s_axi_1_WUSER),
        .s_axi_wvalid(s_axi_1_WVALID));
endmodule

module m01_nodes_imp_19JE5CN
   (M_SC_AR_info,
    M_SC_AR_payld,
    M_SC_AR_recv,
    M_SC_AR_req,
    M_SC_AR_send,
    M_SC_AW_info,
    M_SC_AW_payld,
    M_SC_AW_recv,
    M_SC_AW_req,
    M_SC_AW_send,
    M_SC_B_info,
    M_SC_B_payld,
    M_SC_B_recv,
    M_SC_B_req,
    M_SC_B_send,
    M_SC_R_info,
    M_SC_R_payld,
    M_SC_R_recv,
    M_SC_R_req,
    M_SC_R_send,
    M_SC_W_info,
    M_SC_W_payld,
    M_SC_W_recv,
    M_SC_W_req,
    M_SC_W_send,
    S_SC_AR_info,
    S_SC_AR_payld,
    S_SC_AR_recv,
    S_SC_AR_req,
    S_SC_AR_send,
    S_SC_AW_info,
    S_SC_AW_payld,
    S_SC_AW_recv,
    S_SC_AW_req,
    S_SC_AW_send,
    S_SC_B_info,
    S_SC_B_payld,
    S_SC_B_recv,
    S_SC_B_req,
    S_SC_B_send,
    S_SC_R_info,
    S_SC_R_payld,
    S_SC_R_recv,
    S_SC_R_req,
    S_SC_R_send,
    S_SC_W_info,
    S_SC_W_payld,
    S_SC_W_recv,
    S_SC_W_req,
    S_SC_W_send,
    m_axi_aclk,
    m_axi_aresetn,
    s_axi_aclk,
    s_axi_aresetn);
  output [0:0]M_SC_AR_info;
  output [155:0]M_SC_AR_payld;
  input [0:0]M_SC_AR_recv;
  output [0:0]M_SC_AR_req;
  output [0:0]M_SC_AR_send;
  output [0:0]M_SC_AW_info;
  output [155:0]M_SC_AW_payld;
  input [0:0]M_SC_AW_recv;
  output [0:0]M_SC_AW_req;
  output [0:0]M_SC_AW_send;
  output [3:0]M_SC_B_info;
  output [11:0]M_SC_B_payld;
  input [3:0]M_SC_B_recv;
  output [3:0]M_SC_B_req;
  output [3:0]M_SC_B_send;
  output [3:0]M_SC_R_info;
  output [89:0]M_SC_R_payld;
  input [3:0]M_SC_R_recv;
  output [3:0]M_SC_R_req;
  output [3:0]M_SC_R_send;
  output [0:0]M_SC_W_info;
  output [94:0]M_SC_W_payld;
  input [0:0]M_SC_W_recv;
  output [0:0]M_SC_W_req;
  output [0:0]M_SC_W_send;
  input [3:0]S_SC_AR_info;
  input [155:0]S_SC_AR_payld;
  output [3:0]S_SC_AR_recv;
  input [3:0]S_SC_AR_req;
  input [3:0]S_SC_AR_send;
  input [3:0]S_SC_AW_info;
  input [155:0]S_SC_AW_payld;
  output [3:0]S_SC_AW_recv;
  input [3:0]S_SC_AW_req;
  input [3:0]S_SC_AW_send;
  input [0:0]S_SC_B_info;
  input [11:0]S_SC_B_payld;
  output [0:0]S_SC_B_recv;
  input [0:0]S_SC_B_req;
  input [0:0]S_SC_B_send;
  input [0:0]S_SC_R_info;
  input [89:0]S_SC_R_payld;
  output [0:0]S_SC_R_recv;
  input [0:0]S_SC_R_req;
  input [0:0]S_SC_R_send;
  input [3:0]S_SC_W_info;
  input [94:0]S_SC_W_payld;
  output [3:0]S_SC_W_recv;
  input [3:0]S_SC_W_req;
  input [3:0]S_SC_W_send;
  input m_axi_aclk;
  input m_axi_aresetn;
  input s_axi_aclk;
  input s_axi_aresetn;

  wire [3:0]S_SC_AR_1_INFO;
  wire [155:0]S_SC_AR_1_PAYLD;
  wire [3:0]S_SC_AR_1_RECV;
  wire [3:0]S_SC_AR_1_REQ;
  wire [3:0]S_SC_AR_1_SEND;
  wire [3:0]S_SC_AW_1_INFO;
  wire [155:0]S_SC_AW_1_PAYLD;
  wire [3:0]S_SC_AW_1_RECV;
  wire [3:0]S_SC_AW_1_REQ;
  wire [3:0]S_SC_AW_1_SEND;
  wire [0:0]S_SC_B_1_INFO;
  wire [11:0]S_SC_B_1_PAYLD;
  wire [0:0]S_SC_B_1_RECV;
  wire [0:0]S_SC_B_1_REQ;
  wire [0:0]S_SC_B_1_SEND;
  wire [0:0]S_SC_R_1_INFO;
  wire [89:0]S_SC_R_1_PAYLD;
  wire [0:0]S_SC_R_1_RECV;
  wire [0:0]S_SC_R_1_REQ;
  wire [0:0]S_SC_R_1_SEND;
  wire [3:0]S_SC_W_1_INFO;
  wire [94:0]S_SC_W_1_PAYLD;
  wire [3:0]S_SC_W_1_RECV;
  wire [3:0]S_SC_W_1_REQ;
  wire [3:0]S_SC_W_1_SEND;
  wire [0:0]m01_ar_node_M_SC_INFO;
  wire [155:0]m01_ar_node_M_SC_PAYLD;
  wire [0:0]m01_ar_node_M_SC_RECV;
  wire [0:0]m01_ar_node_M_SC_REQ;
  wire [0:0]m01_ar_node_M_SC_SEND;
  wire [15:0]m01_aw_node_M_AXIS_ARB_TDATA;
  wire m01_aw_node_M_AXIS_ARB_TREADY;
  wire m01_aw_node_M_AXIS_ARB_TVALID;
  wire [0:0]m01_aw_node_M_SC_INFO;
  wire [155:0]m01_aw_node_M_SC_PAYLD;
  wire [0:0]m01_aw_node_M_SC_RECV;
  wire [0:0]m01_aw_node_M_SC_REQ;
  wire [0:0]m01_aw_node_M_SC_SEND;
  wire [3:0]m01_b_node_M_SC_INFO;
  wire [11:0]m01_b_node_M_SC_PAYLD;
  wire [3:0]m01_b_node_M_SC_RECV;
  wire [3:0]m01_b_node_M_SC_REQ;
  wire [3:0]m01_b_node_M_SC_SEND;
  wire [3:0]m01_r_node_M_SC_INFO;
  wire [89:0]m01_r_node_M_SC_PAYLD;
  wire [3:0]m01_r_node_M_SC_RECV;
  wire [3:0]m01_r_node_M_SC_REQ;
  wire [3:0]m01_r_node_M_SC_SEND;
  wire [0:0]m01_w_node_M_SC_INFO;
  wire [94:0]m01_w_node_M_SC_PAYLD;
  wire [0:0]m01_w_node_M_SC_RECV;
  wire [0:0]m01_w_node_M_SC_REQ;
  wire [0:0]m01_w_node_M_SC_SEND;
  wire m_axi_aclk_1;
  wire m_axi_aresetn_1;
  wire s_axi_aclk_1;
  wire s_axi_aresetn_1;

  assign M_SC_AR_info[0] = m01_ar_node_M_SC_INFO;
  assign M_SC_AR_payld[155:0] = m01_ar_node_M_SC_PAYLD;
  assign M_SC_AR_req[0] = m01_ar_node_M_SC_REQ;
  assign M_SC_AR_send[0] = m01_ar_node_M_SC_SEND;
  assign M_SC_AW_info[0] = m01_aw_node_M_SC_INFO;
  assign M_SC_AW_payld[155:0] = m01_aw_node_M_SC_PAYLD;
  assign M_SC_AW_req[0] = m01_aw_node_M_SC_REQ;
  assign M_SC_AW_send[0] = m01_aw_node_M_SC_SEND;
  assign M_SC_B_info[3:0] = m01_b_node_M_SC_INFO;
  assign M_SC_B_payld[11:0] = m01_b_node_M_SC_PAYLD;
  assign M_SC_B_req[3:0] = m01_b_node_M_SC_REQ;
  assign M_SC_B_send[3:0] = m01_b_node_M_SC_SEND;
  assign M_SC_R_info[3:0] = m01_r_node_M_SC_INFO;
  assign M_SC_R_payld[89:0] = m01_r_node_M_SC_PAYLD;
  assign M_SC_R_req[3:0] = m01_r_node_M_SC_REQ;
  assign M_SC_R_send[3:0] = m01_r_node_M_SC_SEND;
  assign M_SC_W_info[0] = m01_w_node_M_SC_INFO;
  assign M_SC_W_payld[94:0] = m01_w_node_M_SC_PAYLD;
  assign M_SC_W_req[0] = m01_w_node_M_SC_REQ;
  assign M_SC_W_send[0] = m01_w_node_M_SC_SEND;
  assign S_SC_AR_1_INFO = S_SC_AR_info[3:0];
  assign S_SC_AR_1_PAYLD = S_SC_AR_payld[155:0];
  assign S_SC_AR_1_REQ = S_SC_AR_req[3:0];
  assign S_SC_AR_1_SEND = S_SC_AR_send[3:0];
  assign S_SC_AR_recv[3:0] = S_SC_AR_1_RECV;
  assign S_SC_AW_1_INFO = S_SC_AW_info[3:0];
  assign S_SC_AW_1_PAYLD = S_SC_AW_payld[155:0];
  assign S_SC_AW_1_REQ = S_SC_AW_req[3:0];
  assign S_SC_AW_1_SEND = S_SC_AW_send[3:0];
  assign S_SC_AW_recv[3:0] = S_SC_AW_1_RECV;
  assign S_SC_B_1_INFO = S_SC_B_info[0];
  assign S_SC_B_1_PAYLD = S_SC_B_payld[11:0];
  assign S_SC_B_1_REQ = S_SC_B_req[0];
  assign S_SC_B_1_SEND = S_SC_B_send[0];
  assign S_SC_B_recv[0] = S_SC_B_1_RECV;
  assign S_SC_R_1_INFO = S_SC_R_info[0];
  assign S_SC_R_1_PAYLD = S_SC_R_payld[89:0];
  assign S_SC_R_1_REQ = S_SC_R_req[0];
  assign S_SC_R_1_SEND = S_SC_R_send[0];
  assign S_SC_R_recv[0] = S_SC_R_1_RECV;
  assign S_SC_W_1_INFO = S_SC_W_info[3:0];
  assign S_SC_W_1_PAYLD = S_SC_W_payld[94:0];
  assign S_SC_W_1_REQ = S_SC_W_req[3:0];
  assign S_SC_W_1_SEND = S_SC_W_send[3:0];
  assign S_SC_W_recv[3:0] = S_SC_W_1_RECV;
  assign m01_ar_node_M_SC_RECV = M_SC_AR_recv[0];
  assign m01_aw_node_M_SC_RECV = M_SC_AW_recv[0];
  assign m01_b_node_M_SC_RECV = M_SC_B_recv[3:0];
  assign m01_r_node_M_SC_RECV = M_SC_R_recv[3:0];
  assign m01_w_node_M_SC_RECV = M_SC_W_recv[0];
  assign m_axi_aclk_1 = m_axi_aclk;
  assign m_axi_aresetn_1 = m_axi_aresetn;
  assign s_axi_aclk_1 = s_axi_aclk;
  assign s_axi_aresetn_1 = s_axi_aresetn;
  bd_63e1_m01arn_0 m01_ar_node
       (.m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m01_ar_node_M_SC_INFO),
        .m_sc_payld(m01_ar_node_M_SC_PAYLD),
        .m_sc_recv(m01_ar_node_M_SC_RECV),
        .m_sc_req(m01_ar_node_M_SC_REQ),
        .m_sc_send(m01_ar_node_M_SC_SEND),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_AR_1_INFO),
        .s_sc_payld(S_SC_AR_1_PAYLD),
        .s_sc_recv(S_SC_AR_1_RECV),
        .s_sc_req(S_SC_AR_1_REQ),
        .s_sc_send(S_SC_AR_1_SEND));
  bd_63e1_m01awn_0 m01_aw_node
       (.m_axis_arb_tdata(m01_aw_node_M_AXIS_ARB_TDATA),
        .m_axis_arb_tready(m01_aw_node_M_AXIS_ARB_TREADY),
        .m_axis_arb_tvalid(m01_aw_node_M_AXIS_ARB_TVALID),
        .m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m01_aw_node_M_SC_INFO),
        .m_sc_payld(m01_aw_node_M_SC_PAYLD),
        .m_sc_recv(m01_aw_node_M_SC_RECV),
        .m_sc_req(m01_aw_node_M_SC_REQ),
        .m_sc_send(m01_aw_node_M_SC_SEND),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_AW_1_INFO),
        .s_sc_payld(S_SC_AW_1_PAYLD),
        .s_sc_recv(S_SC_AW_1_RECV),
        .s_sc_req(S_SC_AW_1_REQ),
        .s_sc_send(S_SC_AW_1_SEND));
  bd_63e1_m01bn_0 m01_b_node
       (.m_sc_aclk(s_axi_aclk_1),
        .m_sc_aresetn(s_axi_aresetn_1),
        .m_sc_info(m01_b_node_M_SC_INFO),
        .m_sc_payld(m01_b_node_M_SC_PAYLD),
        .m_sc_recv(m01_b_node_M_SC_RECV),
        .m_sc_req(m01_b_node_M_SC_REQ),
        .m_sc_send(m01_b_node_M_SC_SEND),
        .s_sc_aclk(m_axi_aclk_1),
        .s_sc_aresetn(m_axi_aresetn_1),
        .s_sc_info(S_SC_B_1_INFO),
        .s_sc_payld(S_SC_B_1_PAYLD),
        .s_sc_recv(S_SC_B_1_RECV),
        .s_sc_req(S_SC_B_1_REQ),
        .s_sc_send(S_SC_B_1_SEND));
  bd_63e1_m01rn_0 m01_r_node
       (.m_sc_aclk(s_axi_aclk_1),
        .m_sc_aresetn(s_axi_aresetn_1),
        .m_sc_info(m01_r_node_M_SC_INFO),
        .m_sc_payld(m01_r_node_M_SC_PAYLD),
        .m_sc_recv(m01_r_node_M_SC_RECV),
        .m_sc_req(m01_r_node_M_SC_REQ),
        .m_sc_send(m01_r_node_M_SC_SEND),
        .s_sc_aclk(m_axi_aclk_1),
        .s_sc_aresetn(m_axi_aresetn_1),
        .s_sc_info(S_SC_R_1_INFO),
        .s_sc_payld(S_SC_R_1_PAYLD),
        .s_sc_recv(S_SC_R_1_RECV),
        .s_sc_req(S_SC_R_1_REQ),
        .s_sc_send(S_SC_R_1_SEND));
  bd_63e1_m01wn_0 m01_w_node
       (.m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m01_w_node_M_SC_INFO),
        .m_sc_payld(m01_w_node_M_SC_PAYLD),
        .m_sc_recv(m01_w_node_M_SC_RECV),
        .m_sc_req(m01_w_node_M_SC_REQ),
        .m_sc_send(m01_w_node_M_SC_SEND),
        .s_axis_arb_tdata(m01_aw_node_M_AXIS_ARB_TDATA),
        .s_axis_arb_tready(m01_aw_node_M_AXIS_ARB_TREADY),
        .s_axis_arb_tvalid(m01_aw_node_M_AXIS_ARB_TVALID),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_W_1_INFO),
        .s_sc_payld(S_SC_W_1_PAYLD),
        .s_sc_recv(S_SC_W_1_RECV),
        .s_sc_req(S_SC_W_1_REQ),
        .s_sc_send(S_SC_W_1_SEND));
endmodule

module m02_exit_pipeline_imp_JTSBWT
   (aclk,
    aresetn,
    m_axi_araddr,
    m_axi_arprot,
    m_axi_arready,
    m_axi_arvalid,
    m_axi_awaddr,
    m_axi_awprot,
    m_axi_awready,
    m_axi_awvalid,
    m_axi_bready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_rdata,
    m_axi_rready,
    m_axi_rresp,
    m_axi_rvalid,
    m_axi_wdata,
    m_axi_wready,
    m_axi_wstrb,
    m_axi_wvalid,
    s_axi_araddr,
    s_axi_arcache,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arlock,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arready,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_awaddr,
    s_axi_awcache,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awlock,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awready,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_bid,
    s_axi_bready,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_rdata,
    s_axi_rid,
    s_axi_rlast,
    s_axi_rready,
    s_axi_rresp,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_wdata,
    s_axi_wlast,
    s_axi_wready,
    s_axi_wstrb,
    s_axi_wuser,
    s_axi_wvalid);
  input aclk;
  input aresetn;
  output [8:0]m_axi_araddr;
  output [2:0]m_axi_arprot;
  input m_axi_arready;
  output m_axi_arvalid;
  output [8:0]m_axi_awaddr;
  output [2:0]m_axi_awprot;
  input m_axi_awready;
  output m_axi_awvalid;
  output m_axi_bready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  input [31:0]m_axi_rdata;
  output m_axi_rready;
  input [1:0]m_axi_rresp;
  input m_axi_rvalid;
  output [31:0]m_axi_wdata;
  input m_axi_wready;
  output [3:0]m_axi_wstrb;
  output m_axi_wvalid;
  input [8:0]s_axi_araddr;
  input [3:0]s_axi_arcache;
  input [4:0]s_axi_arid;
  input [7:0]s_axi_arlen;
  input [0:0]s_axi_arlock;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  output s_axi_arready;
  input [1023:0]s_axi_aruser;
  input s_axi_arvalid;
  input [8:0]s_axi_awaddr;
  input [3:0]s_axi_awcache;
  input [4:0]s_axi_awid;
  input [7:0]s_axi_awlen;
  input [0:0]s_axi_awlock;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  output s_axi_awready;
  input [1023:0]s_axi_awuser;
  input s_axi_awvalid;
  output [4:0]s_axi_bid;
  input s_axi_bready;
  output [1:0]s_axi_bresp;
  output [1023:0]s_axi_buser;
  output s_axi_bvalid;
  output [31:0]s_axi_rdata;
  output [4:0]s_axi_rid;
  output s_axi_rlast;
  input s_axi_rready;
  output [1:0]s_axi_rresp;
  output [1023:0]s_axi_ruser;
  output s_axi_rvalid;
  input [31:0]s_axi_wdata;
  input s_axi_wlast;
  output s_axi_wready;
  input [3:0]s_axi_wstrb;
  input [1023:0]s_axi_wuser;
  input s_axi_wvalid;

  wire aclk_1;
  wire aresetn_1;
  wire [8:0]m02_exit_M_AXI_ARADDR;
  wire [2:0]m02_exit_M_AXI_ARPROT;
  wire m02_exit_M_AXI_ARREADY;
  wire m02_exit_M_AXI_ARVALID;
  wire [8:0]m02_exit_M_AXI_AWADDR;
  wire [2:0]m02_exit_M_AXI_AWPROT;
  wire m02_exit_M_AXI_AWREADY;
  wire m02_exit_M_AXI_AWVALID;
  wire m02_exit_M_AXI_BREADY;
  wire [1:0]m02_exit_M_AXI_BRESP;
  wire m02_exit_M_AXI_BVALID;
  wire [31:0]m02_exit_M_AXI_RDATA;
  wire m02_exit_M_AXI_RREADY;
  wire [1:0]m02_exit_M_AXI_RRESP;
  wire m02_exit_M_AXI_RVALID;
  wire [31:0]m02_exit_M_AXI_WDATA;
  wire m02_exit_M_AXI_WREADY;
  wire [3:0]m02_exit_M_AXI_WSTRB;
  wire m02_exit_M_AXI_WVALID;
  wire [8:0]s_axi_1_ARADDR;
  wire [3:0]s_axi_1_ARCACHE;
  wire [4:0]s_axi_1_ARID;
  wire [7:0]s_axi_1_ARLEN;
  wire [0:0]s_axi_1_ARLOCK;
  wire [2:0]s_axi_1_ARPROT;
  wire [3:0]s_axi_1_ARQOS;
  wire s_axi_1_ARREADY;
  wire [1023:0]s_axi_1_ARUSER;
  wire s_axi_1_ARVALID;
  wire [8:0]s_axi_1_AWADDR;
  wire [3:0]s_axi_1_AWCACHE;
  wire [4:0]s_axi_1_AWID;
  wire [7:0]s_axi_1_AWLEN;
  wire [0:0]s_axi_1_AWLOCK;
  wire [2:0]s_axi_1_AWPROT;
  wire [3:0]s_axi_1_AWQOS;
  wire s_axi_1_AWREADY;
  wire [1023:0]s_axi_1_AWUSER;
  wire s_axi_1_AWVALID;
  wire [4:0]s_axi_1_BID;
  wire s_axi_1_BREADY;
  wire [1:0]s_axi_1_BRESP;
  wire [1023:0]s_axi_1_BUSER;
  wire s_axi_1_BVALID;
  wire [31:0]s_axi_1_RDATA;
  wire [4:0]s_axi_1_RID;
  wire s_axi_1_RLAST;
  wire s_axi_1_RREADY;
  wire [1:0]s_axi_1_RRESP;
  wire [1023:0]s_axi_1_RUSER;
  wire s_axi_1_RVALID;
  wire [31:0]s_axi_1_WDATA;
  wire s_axi_1_WLAST;
  wire s_axi_1_WREADY;
  wire [3:0]s_axi_1_WSTRB;
  wire [1023:0]s_axi_1_WUSER;
  wire s_axi_1_WVALID;

  assign aclk_1 = aclk;
  assign aresetn_1 = aresetn;
  assign m02_exit_M_AXI_ARREADY = m_axi_arready;
  assign m02_exit_M_AXI_AWREADY = m_axi_awready;
  assign m02_exit_M_AXI_BRESP = m_axi_bresp[1:0];
  assign m02_exit_M_AXI_BVALID = m_axi_bvalid;
  assign m02_exit_M_AXI_RDATA = m_axi_rdata[31:0];
  assign m02_exit_M_AXI_RRESP = m_axi_rresp[1:0];
  assign m02_exit_M_AXI_RVALID = m_axi_rvalid;
  assign m02_exit_M_AXI_WREADY = m_axi_wready;
  assign m_axi_araddr[8:0] = m02_exit_M_AXI_ARADDR;
  assign m_axi_arprot[2:0] = m02_exit_M_AXI_ARPROT;
  assign m_axi_arvalid = m02_exit_M_AXI_ARVALID;
  assign m_axi_awaddr[8:0] = m02_exit_M_AXI_AWADDR;
  assign m_axi_awprot[2:0] = m02_exit_M_AXI_AWPROT;
  assign m_axi_awvalid = m02_exit_M_AXI_AWVALID;
  assign m_axi_bready = m02_exit_M_AXI_BREADY;
  assign m_axi_rready = m02_exit_M_AXI_RREADY;
  assign m_axi_wdata[31:0] = m02_exit_M_AXI_WDATA;
  assign m_axi_wstrb[3:0] = m02_exit_M_AXI_WSTRB;
  assign m_axi_wvalid = m02_exit_M_AXI_WVALID;
  assign s_axi_1_ARADDR = s_axi_araddr[8:0];
  assign s_axi_1_ARCACHE = s_axi_arcache[3:0];
  assign s_axi_1_ARID = s_axi_arid[4:0];
  assign s_axi_1_ARLEN = s_axi_arlen[7:0];
  assign s_axi_1_ARLOCK = s_axi_arlock[0];
  assign s_axi_1_ARPROT = s_axi_arprot[2:0];
  assign s_axi_1_ARQOS = s_axi_arqos[3:0];
  assign s_axi_1_ARUSER = s_axi_aruser[1023:0];
  assign s_axi_1_ARVALID = s_axi_arvalid;
  assign s_axi_1_AWADDR = s_axi_awaddr[8:0];
  assign s_axi_1_AWCACHE = s_axi_awcache[3:0];
  assign s_axi_1_AWID = s_axi_awid[4:0];
  assign s_axi_1_AWLEN = s_axi_awlen[7:0];
  assign s_axi_1_AWLOCK = s_axi_awlock[0];
  assign s_axi_1_AWPROT = s_axi_awprot[2:0];
  assign s_axi_1_AWQOS = s_axi_awqos[3:0];
  assign s_axi_1_AWUSER = s_axi_awuser[1023:0];
  assign s_axi_1_AWVALID = s_axi_awvalid;
  assign s_axi_1_BREADY = s_axi_bready;
  assign s_axi_1_RREADY = s_axi_rready;
  assign s_axi_1_WDATA = s_axi_wdata[31:0];
  assign s_axi_1_WLAST = s_axi_wlast;
  assign s_axi_1_WSTRB = s_axi_wstrb[3:0];
  assign s_axi_1_WUSER = s_axi_wuser[1023:0];
  assign s_axi_1_WVALID = s_axi_wvalid;
  assign s_axi_arready = s_axi_1_ARREADY;
  assign s_axi_awready = s_axi_1_AWREADY;
  assign s_axi_bid[4:0] = s_axi_1_BID;
  assign s_axi_bresp[1:0] = s_axi_1_BRESP;
  assign s_axi_buser[1023:0] = s_axi_1_BUSER;
  assign s_axi_bvalid = s_axi_1_BVALID;
  assign s_axi_rdata[31:0] = s_axi_1_RDATA;
  assign s_axi_rid[4:0] = s_axi_1_RID;
  assign s_axi_rlast = s_axi_1_RLAST;
  assign s_axi_rresp[1:0] = s_axi_1_RRESP;
  assign s_axi_ruser[1023:0] = s_axi_1_RUSER;
  assign s_axi_rvalid = s_axi_1_RVALID;
  assign s_axi_wready = s_axi_1_WREADY;
  bd_63e1_m02e_0 m02_exit
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_araddr(m02_exit_M_AXI_ARADDR),
        .m_axi_arprot(m02_exit_M_AXI_ARPROT),
        .m_axi_arready(m02_exit_M_AXI_ARREADY),
        .m_axi_arvalid(m02_exit_M_AXI_ARVALID),
        .m_axi_awaddr(m02_exit_M_AXI_AWADDR),
        .m_axi_awprot(m02_exit_M_AXI_AWPROT),
        .m_axi_awready(m02_exit_M_AXI_AWREADY),
        .m_axi_awvalid(m02_exit_M_AXI_AWVALID),
        .m_axi_bready(m02_exit_M_AXI_BREADY),
        .m_axi_bresp(m02_exit_M_AXI_BRESP),
        .m_axi_bvalid(m02_exit_M_AXI_BVALID),
        .m_axi_rdata(m02_exit_M_AXI_RDATA),
        .m_axi_rready(m02_exit_M_AXI_RREADY),
        .m_axi_rresp(m02_exit_M_AXI_RRESP),
        .m_axi_rvalid(m02_exit_M_AXI_RVALID),
        .m_axi_wdata(m02_exit_M_AXI_WDATA),
        .m_axi_wready(m02_exit_M_AXI_WREADY),
        .m_axi_wstrb(m02_exit_M_AXI_WSTRB),
        .m_axi_wvalid(m02_exit_M_AXI_WVALID),
        .s_axi_araddr(s_axi_1_ARADDR),
        .s_axi_arcache(s_axi_1_ARCACHE),
        .s_axi_arid(s_axi_1_ARID),
        .s_axi_arlen(s_axi_1_ARLEN),
        .s_axi_arlock(s_axi_1_ARLOCK),
        .s_axi_arprot(s_axi_1_ARPROT),
        .s_axi_arqos(s_axi_1_ARQOS),
        .s_axi_arready(s_axi_1_ARREADY),
        .s_axi_aruser(s_axi_1_ARUSER),
        .s_axi_arvalid(s_axi_1_ARVALID),
        .s_axi_awaddr(s_axi_1_AWADDR),
        .s_axi_awcache(s_axi_1_AWCACHE),
        .s_axi_awid(s_axi_1_AWID),
        .s_axi_awlen(s_axi_1_AWLEN),
        .s_axi_awlock(s_axi_1_AWLOCK),
        .s_axi_awprot(s_axi_1_AWPROT),
        .s_axi_awqos(s_axi_1_AWQOS),
        .s_axi_awready(s_axi_1_AWREADY),
        .s_axi_awuser(s_axi_1_AWUSER),
        .s_axi_awvalid(s_axi_1_AWVALID),
        .s_axi_bid(s_axi_1_BID),
        .s_axi_bready(s_axi_1_BREADY),
        .s_axi_bresp(s_axi_1_BRESP),
        .s_axi_buser(s_axi_1_BUSER),
        .s_axi_bvalid(s_axi_1_BVALID),
        .s_axi_rdata(s_axi_1_RDATA),
        .s_axi_rid(s_axi_1_RID),
        .s_axi_rlast(s_axi_1_RLAST),
        .s_axi_rready(s_axi_1_RREADY),
        .s_axi_rresp(s_axi_1_RRESP),
        .s_axi_ruser(s_axi_1_RUSER),
        .s_axi_rvalid(s_axi_1_RVALID),
        .s_axi_wdata(s_axi_1_WDATA),
        .s_axi_wlast(s_axi_1_WLAST),
        .s_axi_wready(s_axi_1_WREADY),
        .s_axi_wstrb(s_axi_1_WSTRB),
        .s_axi_wuser(s_axi_1_WUSER),
        .s_axi_wvalid(s_axi_1_WVALID));
endmodule

module m02_nodes_imp_1O2IO24
   (M_SC_AR_info,
    M_SC_AR_payld,
    M_SC_AR_recv,
    M_SC_AR_req,
    M_SC_AR_send,
    M_SC_AW_info,
    M_SC_AW_payld,
    M_SC_AW_recv,
    M_SC_AW_req,
    M_SC_AW_send,
    M_SC_B_info,
    M_SC_B_payld,
    M_SC_B_recv,
    M_SC_B_req,
    M_SC_B_send,
    M_SC_R_info,
    M_SC_R_payld,
    M_SC_R_recv,
    M_SC_R_req,
    M_SC_R_send,
    M_SC_W_info,
    M_SC_W_payld,
    M_SC_W_recv,
    M_SC_W_req,
    M_SC_W_send,
    S_SC_AR_info,
    S_SC_AR_payld,
    S_SC_AR_recv,
    S_SC_AR_req,
    S_SC_AR_send,
    S_SC_AW_info,
    S_SC_AW_payld,
    S_SC_AW_recv,
    S_SC_AW_req,
    S_SC_AW_send,
    S_SC_B_info,
    S_SC_B_payld,
    S_SC_B_recv,
    S_SC_B_req,
    S_SC_B_send,
    S_SC_R_info,
    S_SC_R_payld,
    S_SC_R_recv,
    S_SC_R_req,
    S_SC_R_send,
    S_SC_W_info,
    S_SC_W_payld,
    S_SC_W_recv,
    S_SC_W_req,
    S_SC_W_send,
    m_axi_aclk,
    m_axi_aresetn,
    s_axi_aclk,
    s_axi_aresetn);
  output [0:0]M_SC_AR_info;
  output [155:0]M_SC_AR_payld;
  input [0:0]M_SC_AR_recv;
  output [0:0]M_SC_AR_req;
  output [0:0]M_SC_AR_send;
  output [0:0]M_SC_AW_info;
  output [155:0]M_SC_AW_payld;
  input [0:0]M_SC_AW_recv;
  output [0:0]M_SC_AW_req;
  output [0:0]M_SC_AW_send;
  output [3:0]M_SC_B_info;
  output [11:0]M_SC_B_payld;
  input [3:0]M_SC_B_recv;
  output [3:0]M_SC_B_req;
  output [3:0]M_SC_B_send;
  output [3:0]M_SC_R_info;
  output [89:0]M_SC_R_payld;
  input [3:0]M_SC_R_recv;
  output [3:0]M_SC_R_req;
  output [3:0]M_SC_R_send;
  output [0:0]M_SC_W_info;
  output [94:0]M_SC_W_payld;
  input [0:0]M_SC_W_recv;
  output [0:0]M_SC_W_req;
  output [0:0]M_SC_W_send;
  input [3:0]S_SC_AR_info;
  input [155:0]S_SC_AR_payld;
  output [3:0]S_SC_AR_recv;
  input [3:0]S_SC_AR_req;
  input [3:0]S_SC_AR_send;
  input [3:0]S_SC_AW_info;
  input [155:0]S_SC_AW_payld;
  output [3:0]S_SC_AW_recv;
  input [3:0]S_SC_AW_req;
  input [3:0]S_SC_AW_send;
  input [0:0]S_SC_B_info;
  input [11:0]S_SC_B_payld;
  output [0:0]S_SC_B_recv;
  input [0:0]S_SC_B_req;
  input [0:0]S_SC_B_send;
  input [0:0]S_SC_R_info;
  input [89:0]S_SC_R_payld;
  output [0:0]S_SC_R_recv;
  input [0:0]S_SC_R_req;
  input [0:0]S_SC_R_send;
  input [3:0]S_SC_W_info;
  input [94:0]S_SC_W_payld;
  output [3:0]S_SC_W_recv;
  input [3:0]S_SC_W_req;
  input [3:0]S_SC_W_send;
  input m_axi_aclk;
  input m_axi_aresetn;
  input s_axi_aclk;
  input s_axi_aresetn;

  wire [3:0]S_SC_AR_1_INFO;
  wire [155:0]S_SC_AR_1_PAYLD;
  wire [3:0]S_SC_AR_1_RECV;
  wire [3:0]S_SC_AR_1_REQ;
  wire [3:0]S_SC_AR_1_SEND;
  wire [3:0]S_SC_AW_1_INFO;
  wire [155:0]S_SC_AW_1_PAYLD;
  wire [3:0]S_SC_AW_1_RECV;
  wire [3:0]S_SC_AW_1_REQ;
  wire [3:0]S_SC_AW_1_SEND;
  wire [0:0]S_SC_B_1_INFO;
  wire [11:0]S_SC_B_1_PAYLD;
  wire [0:0]S_SC_B_1_RECV;
  wire [0:0]S_SC_B_1_REQ;
  wire [0:0]S_SC_B_1_SEND;
  wire [0:0]S_SC_R_1_INFO;
  wire [89:0]S_SC_R_1_PAYLD;
  wire [0:0]S_SC_R_1_RECV;
  wire [0:0]S_SC_R_1_REQ;
  wire [0:0]S_SC_R_1_SEND;
  wire [3:0]S_SC_W_1_INFO;
  wire [94:0]S_SC_W_1_PAYLD;
  wire [3:0]S_SC_W_1_RECV;
  wire [3:0]S_SC_W_1_REQ;
  wire [3:0]S_SC_W_1_SEND;
  wire [0:0]m02_ar_node_M_SC_INFO;
  wire [155:0]m02_ar_node_M_SC_PAYLD;
  wire [0:0]m02_ar_node_M_SC_RECV;
  wire [0:0]m02_ar_node_M_SC_REQ;
  wire [0:0]m02_ar_node_M_SC_SEND;
  wire [15:0]m02_aw_node_M_AXIS_ARB_TDATA;
  wire m02_aw_node_M_AXIS_ARB_TREADY;
  wire m02_aw_node_M_AXIS_ARB_TVALID;
  wire [0:0]m02_aw_node_M_SC_INFO;
  wire [155:0]m02_aw_node_M_SC_PAYLD;
  wire [0:0]m02_aw_node_M_SC_RECV;
  wire [0:0]m02_aw_node_M_SC_REQ;
  wire [0:0]m02_aw_node_M_SC_SEND;
  wire [3:0]m02_b_node_M_SC_INFO;
  wire [11:0]m02_b_node_M_SC_PAYLD;
  wire [3:0]m02_b_node_M_SC_RECV;
  wire [3:0]m02_b_node_M_SC_REQ;
  wire [3:0]m02_b_node_M_SC_SEND;
  wire [3:0]m02_r_node_M_SC_INFO;
  wire [89:0]m02_r_node_M_SC_PAYLD;
  wire [3:0]m02_r_node_M_SC_RECV;
  wire [3:0]m02_r_node_M_SC_REQ;
  wire [3:0]m02_r_node_M_SC_SEND;
  wire [0:0]m02_w_node_M_SC_INFO;
  wire [94:0]m02_w_node_M_SC_PAYLD;
  wire [0:0]m02_w_node_M_SC_RECV;
  wire [0:0]m02_w_node_M_SC_REQ;
  wire [0:0]m02_w_node_M_SC_SEND;
  wire m_axi_aclk_1;
  wire m_axi_aresetn_1;
  wire s_axi_aclk_1;
  wire s_axi_aresetn_1;

  assign M_SC_AR_info[0] = m02_ar_node_M_SC_INFO;
  assign M_SC_AR_payld[155:0] = m02_ar_node_M_SC_PAYLD;
  assign M_SC_AR_req[0] = m02_ar_node_M_SC_REQ;
  assign M_SC_AR_send[0] = m02_ar_node_M_SC_SEND;
  assign M_SC_AW_info[0] = m02_aw_node_M_SC_INFO;
  assign M_SC_AW_payld[155:0] = m02_aw_node_M_SC_PAYLD;
  assign M_SC_AW_req[0] = m02_aw_node_M_SC_REQ;
  assign M_SC_AW_send[0] = m02_aw_node_M_SC_SEND;
  assign M_SC_B_info[3:0] = m02_b_node_M_SC_INFO;
  assign M_SC_B_payld[11:0] = m02_b_node_M_SC_PAYLD;
  assign M_SC_B_req[3:0] = m02_b_node_M_SC_REQ;
  assign M_SC_B_send[3:0] = m02_b_node_M_SC_SEND;
  assign M_SC_R_info[3:0] = m02_r_node_M_SC_INFO;
  assign M_SC_R_payld[89:0] = m02_r_node_M_SC_PAYLD;
  assign M_SC_R_req[3:0] = m02_r_node_M_SC_REQ;
  assign M_SC_R_send[3:0] = m02_r_node_M_SC_SEND;
  assign M_SC_W_info[0] = m02_w_node_M_SC_INFO;
  assign M_SC_W_payld[94:0] = m02_w_node_M_SC_PAYLD;
  assign M_SC_W_req[0] = m02_w_node_M_SC_REQ;
  assign M_SC_W_send[0] = m02_w_node_M_SC_SEND;
  assign S_SC_AR_1_INFO = S_SC_AR_info[3:0];
  assign S_SC_AR_1_PAYLD = S_SC_AR_payld[155:0];
  assign S_SC_AR_1_REQ = S_SC_AR_req[3:0];
  assign S_SC_AR_1_SEND = S_SC_AR_send[3:0];
  assign S_SC_AR_recv[3:0] = S_SC_AR_1_RECV;
  assign S_SC_AW_1_INFO = S_SC_AW_info[3:0];
  assign S_SC_AW_1_PAYLD = S_SC_AW_payld[155:0];
  assign S_SC_AW_1_REQ = S_SC_AW_req[3:0];
  assign S_SC_AW_1_SEND = S_SC_AW_send[3:0];
  assign S_SC_AW_recv[3:0] = S_SC_AW_1_RECV;
  assign S_SC_B_1_INFO = S_SC_B_info[0];
  assign S_SC_B_1_PAYLD = S_SC_B_payld[11:0];
  assign S_SC_B_1_REQ = S_SC_B_req[0];
  assign S_SC_B_1_SEND = S_SC_B_send[0];
  assign S_SC_B_recv[0] = S_SC_B_1_RECV;
  assign S_SC_R_1_INFO = S_SC_R_info[0];
  assign S_SC_R_1_PAYLD = S_SC_R_payld[89:0];
  assign S_SC_R_1_REQ = S_SC_R_req[0];
  assign S_SC_R_1_SEND = S_SC_R_send[0];
  assign S_SC_R_recv[0] = S_SC_R_1_RECV;
  assign S_SC_W_1_INFO = S_SC_W_info[3:0];
  assign S_SC_W_1_PAYLD = S_SC_W_payld[94:0];
  assign S_SC_W_1_REQ = S_SC_W_req[3:0];
  assign S_SC_W_1_SEND = S_SC_W_send[3:0];
  assign S_SC_W_recv[3:0] = S_SC_W_1_RECV;
  assign m02_ar_node_M_SC_RECV = M_SC_AR_recv[0];
  assign m02_aw_node_M_SC_RECV = M_SC_AW_recv[0];
  assign m02_b_node_M_SC_RECV = M_SC_B_recv[3:0];
  assign m02_r_node_M_SC_RECV = M_SC_R_recv[3:0];
  assign m02_w_node_M_SC_RECV = M_SC_W_recv[0];
  assign m_axi_aclk_1 = m_axi_aclk;
  assign m_axi_aresetn_1 = m_axi_aresetn;
  assign s_axi_aclk_1 = s_axi_aclk;
  assign s_axi_aresetn_1 = s_axi_aresetn;
  bd_63e1_m02arn_0 m02_ar_node
       (.m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m02_ar_node_M_SC_INFO),
        .m_sc_payld(m02_ar_node_M_SC_PAYLD),
        .m_sc_recv(m02_ar_node_M_SC_RECV),
        .m_sc_req(m02_ar_node_M_SC_REQ),
        .m_sc_send(m02_ar_node_M_SC_SEND),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_AR_1_INFO),
        .s_sc_payld(S_SC_AR_1_PAYLD),
        .s_sc_recv(S_SC_AR_1_RECV),
        .s_sc_req(S_SC_AR_1_REQ),
        .s_sc_send(S_SC_AR_1_SEND));
  bd_63e1_m02awn_0 m02_aw_node
       (.m_axis_arb_tdata(m02_aw_node_M_AXIS_ARB_TDATA),
        .m_axis_arb_tready(m02_aw_node_M_AXIS_ARB_TREADY),
        .m_axis_arb_tvalid(m02_aw_node_M_AXIS_ARB_TVALID),
        .m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m02_aw_node_M_SC_INFO),
        .m_sc_payld(m02_aw_node_M_SC_PAYLD),
        .m_sc_recv(m02_aw_node_M_SC_RECV),
        .m_sc_req(m02_aw_node_M_SC_REQ),
        .m_sc_send(m02_aw_node_M_SC_SEND),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_AW_1_INFO),
        .s_sc_payld(S_SC_AW_1_PAYLD),
        .s_sc_recv(S_SC_AW_1_RECV),
        .s_sc_req(S_SC_AW_1_REQ),
        .s_sc_send(S_SC_AW_1_SEND));
  bd_63e1_m02bn_0 m02_b_node
       (.m_sc_aclk(s_axi_aclk_1),
        .m_sc_aresetn(s_axi_aresetn_1),
        .m_sc_info(m02_b_node_M_SC_INFO),
        .m_sc_payld(m02_b_node_M_SC_PAYLD),
        .m_sc_recv(m02_b_node_M_SC_RECV),
        .m_sc_req(m02_b_node_M_SC_REQ),
        .m_sc_send(m02_b_node_M_SC_SEND),
        .s_sc_aclk(m_axi_aclk_1),
        .s_sc_aresetn(m_axi_aresetn_1),
        .s_sc_info(S_SC_B_1_INFO),
        .s_sc_payld(S_SC_B_1_PAYLD),
        .s_sc_recv(S_SC_B_1_RECV),
        .s_sc_req(S_SC_B_1_REQ),
        .s_sc_send(S_SC_B_1_SEND));
  bd_63e1_m02rn_0 m02_r_node
       (.m_sc_aclk(s_axi_aclk_1),
        .m_sc_aresetn(s_axi_aresetn_1),
        .m_sc_info(m02_r_node_M_SC_INFO),
        .m_sc_payld(m02_r_node_M_SC_PAYLD),
        .m_sc_recv(m02_r_node_M_SC_RECV),
        .m_sc_req(m02_r_node_M_SC_REQ),
        .m_sc_send(m02_r_node_M_SC_SEND),
        .s_sc_aclk(m_axi_aclk_1),
        .s_sc_aresetn(m_axi_aresetn_1),
        .s_sc_info(S_SC_R_1_INFO),
        .s_sc_payld(S_SC_R_1_PAYLD),
        .s_sc_recv(S_SC_R_1_RECV),
        .s_sc_req(S_SC_R_1_REQ),
        .s_sc_send(S_SC_R_1_SEND));
  bd_63e1_m02wn_0 m02_w_node
       (.m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m02_w_node_M_SC_INFO),
        .m_sc_payld(m02_w_node_M_SC_PAYLD),
        .m_sc_recv(m02_w_node_M_SC_RECV),
        .m_sc_req(m02_w_node_M_SC_REQ),
        .m_sc_send(m02_w_node_M_SC_SEND),
        .s_axis_arb_tdata(m02_aw_node_M_AXIS_ARB_TDATA),
        .s_axis_arb_tready(m02_aw_node_M_AXIS_ARB_TREADY),
        .s_axis_arb_tvalid(m02_aw_node_M_AXIS_ARB_TVALID),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_W_1_INFO),
        .s_sc_payld(S_SC_W_1_PAYLD),
        .s_sc_recv(S_SC_W_1_RECV),
        .s_sc_req(S_SC_W_1_REQ),
        .s_sc_send(S_SC_W_1_SEND));
endmodule

module m03_exit_pipeline_imp_MARGY5
   (aclk,
    aresetn,
    m_axi_araddr,
    m_axi_arprot,
    m_axi_arready,
    m_axi_arvalid,
    m_axi_awaddr,
    m_axi_awprot,
    m_axi_awready,
    m_axi_awvalid,
    m_axi_bready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_rdata,
    m_axi_rready,
    m_axi_rresp,
    m_axi_rvalid,
    m_axi_wdata,
    m_axi_wready,
    m_axi_wstrb,
    m_axi_wvalid,
    s_axi_araddr,
    s_axi_arcache,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arlock,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arready,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_awaddr,
    s_axi_awcache,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awlock,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awready,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_bid,
    s_axi_bready,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_rdata,
    s_axi_rid,
    s_axi_rlast,
    s_axi_rready,
    s_axi_rresp,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_wdata,
    s_axi_wlast,
    s_axi_wready,
    s_axi_wstrb,
    s_axi_wuser,
    s_axi_wvalid);
  input aclk;
  input aresetn;
  output [8:0]m_axi_araddr;
  output [2:0]m_axi_arprot;
  input m_axi_arready;
  output m_axi_arvalid;
  output [8:0]m_axi_awaddr;
  output [2:0]m_axi_awprot;
  input m_axi_awready;
  output m_axi_awvalid;
  output m_axi_bready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  input [31:0]m_axi_rdata;
  output m_axi_rready;
  input [1:0]m_axi_rresp;
  input m_axi_rvalid;
  output [31:0]m_axi_wdata;
  input m_axi_wready;
  output [3:0]m_axi_wstrb;
  output m_axi_wvalid;
  input [8:0]s_axi_araddr;
  input [3:0]s_axi_arcache;
  input [4:0]s_axi_arid;
  input [7:0]s_axi_arlen;
  input [0:0]s_axi_arlock;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  output s_axi_arready;
  input [1023:0]s_axi_aruser;
  input s_axi_arvalid;
  input [8:0]s_axi_awaddr;
  input [3:0]s_axi_awcache;
  input [4:0]s_axi_awid;
  input [7:0]s_axi_awlen;
  input [0:0]s_axi_awlock;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  output s_axi_awready;
  input [1023:0]s_axi_awuser;
  input s_axi_awvalid;
  output [4:0]s_axi_bid;
  input s_axi_bready;
  output [1:0]s_axi_bresp;
  output [1023:0]s_axi_buser;
  output s_axi_bvalid;
  output [31:0]s_axi_rdata;
  output [4:0]s_axi_rid;
  output s_axi_rlast;
  input s_axi_rready;
  output [1:0]s_axi_rresp;
  output [1023:0]s_axi_ruser;
  output s_axi_rvalid;
  input [31:0]s_axi_wdata;
  input s_axi_wlast;
  output s_axi_wready;
  input [3:0]s_axi_wstrb;
  input [1023:0]s_axi_wuser;
  input s_axi_wvalid;

  wire aclk_1;
  wire aresetn_1;
  wire [8:0]m03_exit_M_AXI_ARADDR;
  wire [2:0]m03_exit_M_AXI_ARPROT;
  wire m03_exit_M_AXI_ARREADY;
  wire m03_exit_M_AXI_ARVALID;
  wire [8:0]m03_exit_M_AXI_AWADDR;
  wire [2:0]m03_exit_M_AXI_AWPROT;
  wire m03_exit_M_AXI_AWREADY;
  wire m03_exit_M_AXI_AWVALID;
  wire m03_exit_M_AXI_BREADY;
  wire [1:0]m03_exit_M_AXI_BRESP;
  wire m03_exit_M_AXI_BVALID;
  wire [31:0]m03_exit_M_AXI_RDATA;
  wire m03_exit_M_AXI_RREADY;
  wire [1:0]m03_exit_M_AXI_RRESP;
  wire m03_exit_M_AXI_RVALID;
  wire [31:0]m03_exit_M_AXI_WDATA;
  wire m03_exit_M_AXI_WREADY;
  wire [3:0]m03_exit_M_AXI_WSTRB;
  wire m03_exit_M_AXI_WVALID;
  wire [8:0]s_axi_1_ARADDR;
  wire [3:0]s_axi_1_ARCACHE;
  wire [4:0]s_axi_1_ARID;
  wire [7:0]s_axi_1_ARLEN;
  wire [0:0]s_axi_1_ARLOCK;
  wire [2:0]s_axi_1_ARPROT;
  wire [3:0]s_axi_1_ARQOS;
  wire s_axi_1_ARREADY;
  wire [1023:0]s_axi_1_ARUSER;
  wire s_axi_1_ARVALID;
  wire [8:0]s_axi_1_AWADDR;
  wire [3:0]s_axi_1_AWCACHE;
  wire [4:0]s_axi_1_AWID;
  wire [7:0]s_axi_1_AWLEN;
  wire [0:0]s_axi_1_AWLOCK;
  wire [2:0]s_axi_1_AWPROT;
  wire [3:0]s_axi_1_AWQOS;
  wire s_axi_1_AWREADY;
  wire [1023:0]s_axi_1_AWUSER;
  wire s_axi_1_AWVALID;
  wire [4:0]s_axi_1_BID;
  wire s_axi_1_BREADY;
  wire [1:0]s_axi_1_BRESP;
  wire [1023:0]s_axi_1_BUSER;
  wire s_axi_1_BVALID;
  wire [31:0]s_axi_1_RDATA;
  wire [4:0]s_axi_1_RID;
  wire s_axi_1_RLAST;
  wire s_axi_1_RREADY;
  wire [1:0]s_axi_1_RRESP;
  wire [1023:0]s_axi_1_RUSER;
  wire s_axi_1_RVALID;
  wire [31:0]s_axi_1_WDATA;
  wire s_axi_1_WLAST;
  wire s_axi_1_WREADY;
  wire [3:0]s_axi_1_WSTRB;
  wire [1023:0]s_axi_1_WUSER;
  wire s_axi_1_WVALID;

  assign aclk_1 = aclk;
  assign aresetn_1 = aresetn;
  assign m03_exit_M_AXI_ARREADY = m_axi_arready;
  assign m03_exit_M_AXI_AWREADY = m_axi_awready;
  assign m03_exit_M_AXI_BRESP = m_axi_bresp[1:0];
  assign m03_exit_M_AXI_BVALID = m_axi_bvalid;
  assign m03_exit_M_AXI_RDATA = m_axi_rdata[31:0];
  assign m03_exit_M_AXI_RRESP = m_axi_rresp[1:0];
  assign m03_exit_M_AXI_RVALID = m_axi_rvalid;
  assign m03_exit_M_AXI_WREADY = m_axi_wready;
  assign m_axi_araddr[8:0] = m03_exit_M_AXI_ARADDR;
  assign m_axi_arprot[2:0] = m03_exit_M_AXI_ARPROT;
  assign m_axi_arvalid = m03_exit_M_AXI_ARVALID;
  assign m_axi_awaddr[8:0] = m03_exit_M_AXI_AWADDR;
  assign m_axi_awprot[2:0] = m03_exit_M_AXI_AWPROT;
  assign m_axi_awvalid = m03_exit_M_AXI_AWVALID;
  assign m_axi_bready = m03_exit_M_AXI_BREADY;
  assign m_axi_rready = m03_exit_M_AXI_RREADY;
  assign m_axi_wdata[31:0] = m03_exit_M_AXI_WDATA;
  assign m_axi_wstrb[3:0] = m03_exit_M_AXI_WSTRB;
  assign m_axi_wvalid = m03_exit_M_AXI_WVALID;
  assign s_axi_1_ARADDR = s_axi_araddr[8:0];
  assign s_axi_1_ARCACHE = s_axi_arcache[3:0];
  assign s_axi_1_ARID = s_axi_arid[4:0];
  assign s_axi_1_ARLEN = s_axi_arlen[7:0];
  assign s_axi_1_ARLOCK = s_axi_arlock[0];
  assign s_axi_1_ARPROT = s_axi_arprot[2:0];
  assign s_axi_1_ARQOS = s_axi_arqos[3:0];
  assign s_axi_1_ARUSER = s_axi_aruser[1023:0];
  assign s_axi_1_ARVALID = s_axi_arvalid;
  assign s_axi_1_AWADDR = s_axi_awaddr[8:0];
  assign s_axi_1_AWCACHE = s_axi_awcache[3:0];
  assign s_axi_1_AWID = s_axi_awid[4:0];
  assign s_axi_1_AWLEN = s_axi_awlen[7:0];
  assign s_axi_1_AWLOCK = s_axi_awlock[0];
  assign s_axi_1_AWPROT = s_axi_awprot[2:0];
  assign s_axi_1_AWQOS = s_axi_awqos[3:0];
  assign s_axi_1_AWUSER = s_axi_awuser[1023:0];
  assign s_axi_1_AWVALID = s_axi_awvalid;
  assign s_axi_1_BREADY = s_axi_bready;
  assign s_axi_1_RREADY = s_axi_rready;
  assign s_axi_1_WDATA = s_axi_wdata[31:0];
  assign s_axi_1_WLAST = s_axi_wlast;
  assign s_axi_1_WSTRB = s_axi_wstrb[3:0];
  assign s_axi_1_WUSER = s_axi_wuser[1023:0];
  assign s_axi_1_WVALID = s_axi_wvalid;
  assign s_axi_arready = s_axi_1_ARREADY;
  assign s_axi_awready = s_axi_1_AWREADY;
  assign s_axi_bid[4:0] = s_axi_1_BID;
  assign s_axi_bresp[1:0] = s_axi_1_BRESP;
  assign s_axi_buser[1023:0] = s_axi_1_BUSER;
  assign s_axi_bvalid = s_axi_1_BVALID;
  assign s_axi_rdata[31:0] = s_axi_1_RDATA;
  assign s_axi_rid[4:0] = s_axi_1_RID;
  assign s_axi_rlast = s_axi_1_RLAST;
  assign s_axi_rresp[1:0] = s_axi_1_RRESP;
  assign s_axi_ruser[1023:0] = s_axi_1_RUSER;
  assign s_axi_rvalid = s_axi_1_RVALID;
  assign s_axi_wready = s_axi_1_WREADY;
  bd_63e1_m03e_0 m03_exit
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_araddr(m03_exit_M_AXI_ARADDR),
        .m_axi_arprot(m03_exit_M_AXI_ARPROT),
        .m_axi_arready(m03_exit_M_AXI_ARREADY),
        .m_axi_arvalid(m03_exit_M_AXI_ARVALID),
        .m_axi_awaddr(m03_exit_M_AXI_AWADDR),
        .m_axi_awprot(m03_exit_M_AXI_AWPROT),
        .m_axi_awready(m03_exit_M_AXI_AWREADY),
        .m_axi_awvalid(m03_exit_M_AXI_AWVALID),
        .m_axi_bready(m03_exit_M_AXI_BREADY),
        .m_axi_bresp(m03_exit_M_AXI_BRESP),
        .m_axi_bvalid(m03_exit_M_AXI_BVALID),
        .m_axi_rdata(m03_exit_M_AXI_RDATA),
        .m_axi_rready(m03_exit_M_AXI_RREADY),
        .m_axi_rresp(m03_exit_M_AXI_RRESP),
        .m_axi_rvalid(m03_exit_M_AXI_RVALID),
        .m_axi_wdata(m03_exit_M_AXI_WDATA),
        .m_axi_wready(m03_exit_M_AXI_WREADY),
        .m_axi_wstrb(m03_exit_M_AXI_WSTRB),
        .m_axi_wvalid(m03_exit_M_AXI_WVALID),
        .s_axi_araddr(s_axi_1_ARADDR),
        .s_axi_arcache(s_axi_1_ARCACHE),
        .s_axi_arid(s_axi_1_ARID),
        .s_axi_arlen(s_axi_1_ARLEN),
        .s_axi_arlock(s_axi_1_ARLOCK),
        .s_axi_arprot(s_axi_1_ARPROT),
        .s_axi_arqos(s_axi_1_ARQOS),
        .s_axi_arready(s_axi_1_ARREADY),
        .s_axi_aruser(s_axi_1_ARUSER),
        .s_axi_arvalid(s_axi_1_ARVALID),
        .s_axi_awaddr(s_axi_1_AWADDR),
        .s_axi_awcache(s_axi_1_AWCACHE),
        .s_axi_awid(s_axi_1_AWID),
        .s_axi_awlen(s_axi_1_AWLEN),
        .s_axi_awlock(s_axi_1_AWLOCK),
        .s_axi_awprot(s_axi_1_AWPROT),
        .s_axi_awqos(s_axi_1_AWQOS),
        .s_axi_awready(s_axi_1_AWREADY),
        .s_axi_awuser(s_axi_1_AWUSER),
        .s_axi_awvalid(s_axi_1_AWVALID),
        .s_axi_bid(s_axi_1_BID),
        .s_axi_bready(s_axi_1_BREADY),
        .s_axi_bresp(s_axi_1_BRESP),
        .s_axi_buser(s_axi_1_BUSER),
        .s_axi_bvalid(s_axi_1_BVALID),
        .s_axi_rdata(s_axi_1_RDATA),
        .s_axi_rid(s_axi_1_RID),
        .s_axi_rlast(s_axi_1_RLAST),
        .s_axi_rready(s_axi_1_RREADY),
        .s_axi_rresp(s_axi_1_RRESP),
        .s_axi_ruser(s_axi_1_RUSER),
        .s_axi_rvalid(s_axi_1_RVALID),
        .s_axi_wdata(s_axi_1_WDATA),
        .s_axi_wlast(s_axi_1_WLAST),
        .s_axi_wready(s_axi_1_WREADY),
        .s_axi_wstrb(s_axi_1_WSTRB),
        .s_axi_wuser(s_axi_1_WUSER),
        .s_axi_wvalid(s_axi_1_WVALID));
endmodule

module m03_nodes_imp_J9MVCQ
   (M_SC_AR_info,
    M_SC_AR_payld,
    M_SC_AR_recv,
    M_SC_AR_req,
    M_SC_AR_send,
    M_SC_AW_info,
    M_SC_AW_payld,
    M_SC_AW_recv,
    M_SC_AW_req,
    M_SC_AW_send,
    M_SC_B_info,
    M_SC_B_payld,
    M_SC_B_recv,
    M_SC_B_req,
    M_SC_B_send,
    M_SC_R_info,
    M_SC_R_payld,
    M_SC_R_recv,
    M_SC_R_req,
    M_SC_R_send,
    M_SC_W_info,
    M_SC_W_payld,
    M_SC_W_recv,
    M_SC_W_req,
    M_SC_W_send,
    S_SC_AR_info,
    S_SC_AR_payld,
    S_SC_AR_recv,
    S_SC_AR_req,
    S_SC_AR_send,
    S_SC_AW_info,
    S_SC_AW_payld,
    S_SC_AW_recv,
    S_SC_AW_req,
    S_SC_AW_send,
    S_SC_B_info,
    S_SC_B_payld,
    S_SC_B_recv,
    S_SC_B_req,
    S_SC_B_send,
    S_SC_R_info,
    S_SC_R_payld,
    S_SC_R_recv,
    S_SC_R_req,
    S_SC_R_send,
    S_SC_W_info,
    S_SC_W_payld,
    S_SC_W_recv,
    S_SC_W_req,
    S_SC_W_send,
    m_axi_aclk,
    m_axi_aresetn,
    s_axi_aclk,
    s_axi_aresetn);
  output [0:0]M_SC_AR_info;
  output [155:0]M_SC_AR_payld;
  input [0:0]M_SC_AR_recv;
  output [0:0]M_SC_AR_req;
  output [0:0]M_SC_AR_send;
  output [0:0]M_SC_AW_info;
  output [155:0]M_SC_AW_payld;
  input [0:0]M_SC_AW_recv;
  output [0:0]M_SC_AW_req;
  output [0:0]M_SC_AW_send;
  output [3:0]M_SC_B_info;
  output [11:0]M_SC_B_payld;
  input [3:0]M_SC_B_recv;
  output [3:0]M_SC_B_req;
  output [3:0]M_SC_B_send;
  output [3:0]M_SC_R_info;
  output [89:0]M_SC_R_payld;
  input [3:0]M_SC_R_recv;
  output [3:0]M_SC_R_req;
  output [3:0]M_SC_R_send;
  output [0:0]M_SC_W_info;
  output [94:0]M_SC_W_payld;
  input [0:0]M_SC_W_recv;
  output [0:0]M_SC_W_req;
  output [0:0]M_SC_W_send;
  input [3:0]S_SC_AR_info;
  input [155:0]S_SC_AR_payld;
  output [3:0]S_SC_AR_recv;
  input [3:0]S_SC_AR_req;
  input [3:0]S_SC_AR_send;
  input [3:0]S_SC_AW_info;
  input [155:0]S_SC_AW_payld;
  output [3:0]S_SC_AW_recv;
  input [3:0]S_SC_AW_req;
  input [3:0]S_SC_AW_send;
  input [0:0]S_SC_B_info;
  input [11:0]S_SC_B_payld;
  output [0:0]S_SC_B_recv;
  input [0:0]S_SC_B_req;
  input [0:0]S_SC_B_send;
  input [0:0]S_SC_R_info;
  input [89:0]S_SC_R_payld;
  output [0:0]S_SC_R_recv;
  input [0:0]S_SC_R_req;
  input [0:0]S_SC_R_send;
  input [3:0]S_SC_W_info;
  input [94:0]S_SC_W_payld;
  output [3:0]S_SC_W_recv;
  input [3:0]S_SC_W_req;
  input [3:0]S_SC_W_send;
  input m_axi_aclk;
  input m_axi_aresetn;
  input s_axi_aclk;
  input s_axi_aresetn;

  wire [3:0]S_SC_AR_1_INFO;
  wire [155:0]S_SC_AR_1_PAYLD;
  wire [3:0]S_SC_AR_1_RECV;
  wire [3:0]S_SC_AR_1_REQ;
  wire [3:0]S_SC_AR_1_SEND;
  wire [3:0]S_SC_AW_1_INFO;
  wire [155:0]S_SC_AW_1_PAYLD;
  wire [3:0]S_SC_AW_1_RECV;
  wire [3:0]S_SC_AW_1_REQ;
  wire [3:0]S_SC_AW_1_SEND;
  wire [0:0]S_SC_B_1_INFO;
  wire [11:0]S_SC_B_1_PAYLD;
  wire [0:0]S_SC_B_1_RECV;
  wire [0:0]S_SC_B_1_REQ;
  wire [0:0]S_SC_B_1_SEND;
  wire [0:0]S_SC_R_1_INFO;
  wire [89:0]S_SC_R_1_PAYLD;
  wire [0:0]S_SC_R_1_RECV;
  wire [0:0]S_SC_R_1_REQ;
  wire [0:0]S_SC_R_1_SEND;
  wire [3:0]S_SC_W_1_INFO;
  wire [94:0]S_SC_W_1_PAYLD;
  wire [3:0]S_SC_W_1_RECV;
  wire [3:0]S_SC_W_1_REQ;
  wire [3:0]S_SC_W_1_SEND;
  wire [0:0]m03_ar_node_M_SC_INFO;
  wire [155:0]m03_ar_node_M_SC_PAYLD;
  wire [0:0]m03_ar_node_M_SC_RECV;
  wire [0:0]m03_ar_node_M_SC_REQ;
  wire [0:0]m03_ar_node_M_SC_SEND;
  wire [15:0]m03_aw_node_M_AXIS_ARB_TDATA;
  wire m03_aw_node_M_AXIS_ARB_TREADY;
  wire m03_aw_node_M_AXIS_ARB_TVALID;
  wire [0:0]m03_aw_node_M_SC_INFO;
  wire [155:0]m03_aw_node_M_SC_PAYLD;
  wire [0:0]m03_aw_node_M_SC_RECV;
  wire [0:0]m03_aw_node_M_SC_REQ;
  wire [0:0]m03_aw_node_M_SC_SEND;
  wire [3:0]m03_b_node_M_SC_INFO;
  wire [11:0]m03_b_node_M_SC_PAYLD;
  wire [3:0]m03_b_node_M_SC_RECV;
  wire [3:0]m03_b_node_M_SC_REQ;
  wire [3:0]m03_b_node_M_SC_SEND;
  wire [3:0]m03_r_node_M_SC_INFO;
  wire [89:0]m03_r_node_M_SC_PAYLD;
  wire [3:0]m03_r_node_M_SC_RECV;
  wire [3:0]m03_r_node_M_SC_REQ;
  wire [3:0]m03_r_node_M_SC_SEND;
  wire [0:0]m03_w_node_M_SC_INFO;
  wire [94:0]m03_w_node_M_SC_PAYLD;
  wire [0:0]m03_w_node_M_SC_RECV;
  wire [0:0]m03_w_node_M_SC_REQ;
  wire [0:0]m03_w_node_M_SC_SEND;
  wire m_axi_aclk_1;
  wire m_axi_aresetn_1;
  wire s_axi_aclk_1;
  wire s_axi_aresetn_1;

  assign M_SC_AR_info[0] = m03_ar_node_M_SC_INFO;
  assign M_SC_AR_payld[155:0] = m03_ar_node_M_SC_PAYLD;
  assign M_SC_AR_req[0] = m03_ar_node_M_SC_REQ;
  assign M_SC_AR_send[0] = m03_ar_node_M_SC_SEND;
  assign M_SC_AW_info[0] = m03_aw_node_M_SC_INFO;
  assign M_SC_AW_payld[155:0] = m03_aw_node_M_SC_PAYLD;
  assign M_SC_AW_req[0] = m03_aw_node_M_SC_REQ;
  assign M_SC_AW_send[0] = m03_aw_node_M_SC_SEND;
  assign M_SC_B_info[3:0] = m03_b_node_M_SC_INFO;
  assign M_SC_B_payld[11:0] = m03_b_node_M_SC_PAYLD;
  assign M_SC_B_req[3:0] = m03_b_node_M_SC_REQ;
  assign M_SC_B_send[3:0] = m03_b_node_M_SC_SEND;
  assign M_SC_R_info[3:0] = m03_r_node_M_SC_INFO;
  assign M_SC_R_payld[89:0] = m03_r_node_M_SC_PAYLD;
  assign M_SC_R_req[3:0] = m03_r_node_M_SC_REQ;
  assign M_SC_R_send[3:0] = m03_r_node_M_SC_SEND;
  assign M_SC_W_info[0] = m03_w_node_M_SC_INFO;
  assign M_SC_W_payld[94:0] = m03_w_node_M_SC_PAYLD;
  assign M_SC_W_req[0] = m03_w_node_M_SC_REQ;
  assign M_SC_W_send[0] = m03_w_node_M_SC_SEND;
  assign S_SC_AR_1_INFO = S_SC_AR_info[3:0];
  assign S_SC_AR_1_PAYLD = S_SC_AR_payld[155:0];
  assign S_SC_AR_1_REQ = S_SC_AR_req[3:0];
  assign S_SC_AR_1_SEND = S_SC_AR_send[3:0];
  assign S_SC_AR_recv[3:0] = S_SC_AR_1_RECV;
  assign S_SC_AW_1_INFO = S_SC_AW_info[3:0];
  assign S_SC_AW_1_PAYLD = S_SC_AW_payld[155:0];
  assign S_SC_AW_1_REQ = S_SC_AW_req[3:0];
  assign S_SC_AW_1_SEND = S_SC_AW_send[3:0];
  assign S_SC_AW_recv[3:0] = S_SC_AW_1_RECV;
  assign S_SC_B_1_INFO = S_SC_B_info[0];
  assign S_SC_B_1_PAYLD = S_SC_B_payld[11:0];
  assign S_SC_B_1_REQ = S_SC_B_req[0];
  assign S_SC_B_1_SEND = S_SC_B_send[0];
  assign S_SC_B_recv[0] = S_SC_B_1_RECV;
  assign S_SC_R_1_INFO = S_SC_R_info[0];
  assign S_SC_R_1_PAYLD = S_SC_R_payld[89:0];
  assign S_SC_R_1_REQ = S_SC_R_req[0];
  assign S_SC_R_1_SEND = S_SC_R_send[0];
  assign S_SC_R_recv[0] = S_SC_R_1_RECV;
  assign S_SC_W_1_INFO = S_SC_W_info[3:0];
  assign S_SC_W_1_PAYLD = S_SC_W_payld[94:0];
  assign S_SC_W_1_REQ = S_SC_W_req[3:0];
  assign S_SC_W_1_SEND = S_SC_W_send[3:0];
  assign S_SC_W_recv[3:0] = S_SC_W_1_RECV;
  assign m03_ar_node_M_SC_RECV = M_SC_AR_recv[0];
  assign m03_aw_node_M_SC_RECV = M_SC_AW_recv[0];
  assign m03_b_node_M_SC_RECV = M_SC_B_recv[3:0];
  assign m03_r_node_M_SC_RECV = M_SC_R_recv[3:0];
  assign m03_w_node_M_SC_RECV = M_SC_W_recv[0];
  assign m_axi_aclk_1 = m_axi_aclk;
  assign m_axi_aresetn_1 = m_axi_aresetn;
  assign s_axi_aclk_1 = s_axi_aclk;
  assign s_axi_aresetn_1 = s_axi_aresetn;
  bd_63e1_m03arn_0 m03_ar_node
       (.m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m03_ar_node_M_SC_INFO),
        .m_sc_payld(m03_ar_node_M_SC_PAYLD),
        .m_sc_recv(m03_ar_node_M_SC_RECV),
        .m_sc_req(m03_ar_node_M_SC_REQ),
        .m_sc_send(m03_ar_node_M_SC_SEND),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_AR_1_INFO),
        .s_sc_payld(S_SC_AR_1_PAYLD),
        .s_sc_recv(S_SC_AR_1_RECV),
        .s_sc_req(S_SC_AR_1_REQ),
        .s_sc_send(S_SC_AR_1_SEND));
  bd_63e1_m03awn_0 m03_aw_node
       (.m_axis_arb_tdata(m03_aw_node_M_AXIS_ARB_TDATA),
        .m_axis_arb_tready(m03_aw_node_M_AXIS_ARB_TREADY),
        .m_axis_arb_tvalid(m03_aw_node_M_AXIS_ARB_TVALID),
        .m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m03_aw_node_M_SC_INFO),
        .m_sc_payld(m03_aw_node_M_SC_PAYLD),
        .m_sc_recv(m03_aw_node_M_SC_RECV),
        .m_sc_req(m03_aw_node_M_SC_REQ),
        .m_sc_send(m03_aw_node_M_SC_SEND),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_AW_1_INFO),
        .s_sc_payld(S_SC_AW_1_PAYLD),
        .s_sc_recv(S_SC_AW_1_RECV),
        .s_sc_req(S_SC_AW_1_REQ),
        .s_sc_send(S_SC_AW_1_SEND));
  bd_63e1_m03bn_0 m03_b_node
       (.m_sc_aclk(s_axi_aclk_1),
        .m_sc_aresetn(s_axi_aresetn_1),
        .m_sc_info(m03_b_node_M_SC_INFO),
        .m_sc_payld(m03_b_node_M_SC_PAYLD),
        .m_sc_recv(m03_b_node_M_SC_RECV),
        .m_sc_req(m03_b_node_M_SC_REQ),
        .m_sc_send(m03_b_node_M_SC_SEND),
        .s_sc_aclk(m_axi_aclk_1),
        .s_sc_aresetn(m_axi_aresetn_1),
        .s_sc_info(S_SC_B_1_INFO),
        .s_sc_payld(S_SC_B_1_PAYLD),
        .s_sc_recv(S_SC_B_1_RECV),
        .s_sc_req(S_SC_B_1_REQ),
        .s_sc_send(S_SC_B_1_SEND));
  bd_63e1_m03rn_0 m03_r_node
       (.m_sc_aclk(s_axi_aclk_1),
        .m_sc_aresetn(s_axi_aresetn_1),
        .m_sc_info(m03_r_node_M_SC_INFO),
        .m_sc_payld(m03_r_node_M_SC_PAYLD),
        .m_sc_recv(m03_r_node_M_SC_RECV),
        .m_sc_req(m03_r_node_M_SC_REQ),
        .m_sc_send(m03_r_node_M_SC_SEND),
        .s_sc_aclk(m_axi_aclk_1),
        .s_sc_aresetn(m_axi_aresetn_1),
        .s_sc_info(S_SC_R_1_INFO),
        .s_sc_payld(S_SC_R_1_PAYLD),
        .s_sc_recv(S_SC_R_1_RECV),
        .s_sc_req(S_SC_R_1_REQ),
        .s_sc_send(S_SC_R_1_SEND));
  bd_63e1_m03wn_0 m03_w_node
       (.m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m03_w_node_M_SC_INFO),
        .m_sc_payld(m03_w_node_M_SC_PAYLD),
        .m_sc_recv(m03_w_node_M_SC_RECV),
        .m_sc_req(m03_w_node_M_SC_REQ),
        .m_sc_send(m03_w_node_M_SC_SEND),
        .s_axis_arb_tdata(m03_aw_node_M_AXIS_ARB_TDATA),
        .s_axis_arb_tready(m03_aw_node_M_AXIS_ARB_TREADY),
        .s_axis_arb_tvalid(m03_aw_node_M_AXIS_ARB_TVALID),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_W_1_INFO),
        .s_sc_payld(S_SC_W_1_PAYLD),
        .s_sc_recv(S_SC_W_1_RECV),
        .s_sc_req(S_SC_W_1_REQ),
        .s_sc_send(S_SC_W_1_SEND));
endmodule

module m04_exit_pipeline_imp_EUL13H
   (aclk,
    aresetn,
    m_axi_araddr,
    m_axi_arburst,
    m_axi_arcache,
    m_axi_arlen,
    m_axi_arlock,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arready,
    m_axi_arsize,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_awaddr,
    m_axi_awburst,
    m_axi_awcache,
    m_axi_awlen,
    m_axi_awlock,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awready,
    m_axi_awsize,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_bready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_rdata,
    m_axi_rlast,
    m_axi_rready,
    m_axi_rresp,
    m_axi_rvalid,
    m_axi_wdata,
    m_axi_wlast,
    m_axi_wready,
    m_axi_wstrb,
    m_axi_wvalid,
    s_axi_araddr,
    s_axi_arcache,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arlock,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arready,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_awaddr,
    s_axi_awcache,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awlock,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awready,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_bid,
    s_axi_bready,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_rdata,
    s_axi_rid,
    s_axi_rlast,
    s_axi_rready,
    s_axi_rresp,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_wdata,
    s_axi_wlast,
    s_axi_wready,
    s_axi_wstrb,
    s_axi_wuser,
    s_axi_wvalid);
  input aclk;
  input aresetn;
  output [2:0]m_axi_araddr;
  output [1:0]m_axi_arburst;
  output [3:0]m_axi_arcache;
  output [7:0]m_axi_arlen;
  output [0:0]m_axi_arlock;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  input m_axi_arready;
  output [2:0]m_axi_arsize;
  output [3:0]m_axi_aruser;
  output m_axi_arvalid;
  output [2:0]m_axi_awaddr;
  output [1:0]m_axi_awburst;
  output [3:0]m_axi_awcache;
  output [7:0]m_axi_awlen;
  output [0:0]m_axi_awlock;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  input m_axi_awready;
  output [2:0]m_axi_awsize;
  output [3:0]m_axi_awuser;
  output m_axi_awvalid;
  output m_axi_bready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  input [31:0]m_axi_rdata;
  input m_axi_rlast;
  output m_axi_rready;
  input [1:0]m_axi_rresp;
  input m_axi_rvalid;
  output [31:0]m_axi_wdata;
  output m_axi_wlast;
  input m_axi_wready;
  output [3:0]m_axi_wstrb;
  output m_axi_wvalid;
  input [2:0]s_axi_araddr;
  input [3:0]s_axi_arcache;
  input [4:0]s_axi_arid;
  input [7:0]s_axi_arlen;
  input [0:0]s_axi_arlock;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  output s_axi_arready;
  input [1023:0]s_axi_aruser;
  input s_axi_arvalid;
  input [2:0]s_axi_awaddr;
  input [3:0]s_axi_awcache;
  input [4:0]s_axi_awid;
  input [7:0]s_axi_awlen;
  input [0:0]s_axi_awlock;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  output s_axi_awready;
  input [1023:0]s_axi_awuser;
  input s_axi_awvalid;
  output [4:0]s_axi_bid;
  input s_axi_bready;
  output [1:0]s_axi_bresp;
  output [1023:0]s_axi_buser;
  output s_axi_bvalid;
  output [31:0]s_axi_rdata;
  output [4:0]s_axi_rid;
  output s_axi_rlast;
  input s_axi_rready;
  output [1:0]s_axi_rresp;
  output [1023:0]s_axi_ruser;
  output s_axi_rvalid;
  input [31:0]s_axi_wdata;
  input s_axi_wlast;
  output s_axi_wready;
  input [3:0]s_axi_wstrb;
  input [1023:0]s_axi_wuser;
  input s_axi_wvalid;

  wire aclk_1;
  wire aresetn_1;
  wire [2:0]m04_exit_M_AXI_ARADDR;
  wire [1:0]m04_exit_M_AXI_ARBURST;
  wire [3:0]m04_exit_M_AXI_ARCACHE;
  wire [7:0]m04_exit_M_AXI_ARLEN;
  wire [0:0]m04_exit_M_AXI_ARLOCK;
  wire [2:0]m04_exit_M_AXI_ARPROT;
  wire [3:0]m04_exit_M_AXI_ARQOS;
  wire m04_exit_M_AXI_ARREADY;
  wire [2:0]m04_exit_M_AXI_ARSIZE;
  wire [3:0]m04_exit_M_AXI_ARUSER;
  wire m04_exit_M_AXI_ARVALID;
  wire [2:0]m04_exit_M_AXI_AWADDR;
  wire [1:0]m04_exit_M_AXI_AWBURST;
  wire [3:0]m04_exit_M_AXI_AWCACHE;
  wire [7:0]m04_exit_M_AXI_AWLEN;
  wire [0:0]m04_exit_M_AXI_AWLOCK;
  wire [2:0]m04_exit_M_AXI_AWPROT;
  wire [3:0]m04_exit_M_AXI_AWQOS;
  wire m04_exit_M_AXI_AWREADY;
  wire [2:0]m04_exit_M_AXI_AWSIZE;
  wire [3:0]m04_exit_M_AXI_AWUSER;
  wire m04_exit_M_AXI_AWVALID;
  wire m04_exit_M_AXI_BREADY;
  wire [1:0]m04_exit_M_AXI_BRESP;
  wire m04_exit_M_AXI_BVALID;
  wire [31:0]m04_exit_M_AXI_RDATA;
  wire m04_exit_M_AXI_RLAST;
  wire m04_exit_M_AXI_RREADY;
  wire [1:0]m04_exit_M_AXI_RRESP;
  wire m04_exit_M_AXI_RVALID;
  wire [31:0]m04_exit_M_AXI_WDATA;
  wire m04_exit_M_AXI_WLAST;
  wire m04_exit_M_AXI_WREADY;
  wire [3:0]m04_exit_M_AXI_WSTRB;
  wire m04_exit_M_AXI_WVALID;
  wire [2:0]s_axi_1_ARADDR;
  wire [3:0]s_axi_1_ARCACHE;
  wire [4:0]s_axi_1_ARID;
  wire [7:0]s_axi_1_ARLEN;
  wire [0:0]s_axi_1_ARLOCK;
  wire [2:0]s_axi_1_ARPROT;
  wire [3:0]s_axi_1_ARQOS;
  wire s_axi_1_ARREADY;
  wire [1023:0]s_axi_1_ARUSER;
  wire s_axi_1_ARVALID;
  wire [2:0]s_axi_1_AWADDR;
  wire [3:0]s_axi_1_AWCACHE;
  wire [4:0]s_axi_1_AWID;
  wire [7:0]s_axi_1_AWLEN;
  wire [0:0]s_axi_1_AWLOCK;
  wire [2:0]s_axi_1_AWPROT;
  wire [3:0]s_axi_1_AWQOS;
  wire s_axi_1_AWREADY;
  wire [1023:0]s_axi_1_AWUSER;
  wire s_axi_1_AWVALID;
  wire [4:0]s_axi_1_BID;
  wire s_axi_1_BREADY;
  wire [1:0]s_axi_1_BRESP;
  wire [1023:0]s_axi_1_BUSER;
  wire s_axi_1_BVALID;
  wire [31:0]s_axi_1_RDATA;
  wire [4:0]s_axi_1_RID;
  wire s_axi_1_RLAST;
  wire s_axi_1_RREADY;
  wire [1:0]s_axi_1_RRESP;
  wire [1023:0]s_axi_1_RUSER;
  wire s_axi_1_RVALID;
  wire [31:0]s_axi_1_WDATA;
  wire s_axi_1_WLAST;
  wire s_axi_1_WREADY;
  wire [3:0]s_axi_1_WSTRB;
  wire [1023:0]s_axi_1_WUSER;
  wire s_axi_1_WVALID;

  assign aclk_1 = aclk;
  assign aresetn_1 = aresetn;
  assign m04_exit_M_AXI_ARREADY = m_axi_arready;
  assign m04_exit_M_AXI_AWREADY = m_axi_awready;
  assign m04_exit_M_AXI_BRESP = m_axi_bresp[1:0];
  assign m04_exit_M_AXI_BVALID = m_axi_bvalid;
  assign m04_exit_M_AXI_RDATA = m_axi_rdata[31:0];
  assign m04_exit_M_AXI_RLAST = m_axi_rlast;
  assign m04_exit_M_AXI_RRESP = m_axi_rresp[1:0];
  assign m04_exit_M_AXI_RVALID = m_axi_rvalid;
  assign m04_exit_M_AXI_WREADY = m_axi_wready;
  assign m_axi_araddr[2:0] = m04_exit_M_AXI_ARADDR;
  assign m_axi_arburst[1:0] = m04_exit_M_AXI_ARBURST;
  assign m_axi_arcache[3:0] = m04_exit_M_AXI_ARCACHE;
  assign m_axi_arlen[7:0] = m04_exit_M_AXI_ARLEN;
  assign m_axi_arlock[0] = m04_exit_M_AXI_ARLOCK;
  assign m_axi_arprot[2:0] = m04_exit_M_AXI_ARPROT;
  assign m_axi_arqos[3:0] = m04_exit_M_AXI_ARQOS;
  assign m_axi_arsize[2:0] = m04_exit_M_AXI_ARSIZE;
  assign m_axi_aruser[3:0] = m04_exit_M_AXI_ARUSER;
  assign m_axi_arvalid = m04_exit_M_AXI_ARVALID;
  assign m_axi_awaddr[2:0] = m04_exit_M_AXI_AWADDR;
  assign m_axi_awburst[1:0] = m04_exit_M_AXI_AWBURST;
  assign m_axi_awcache[3:0] = m04_exit_M_AXI_AWCACHE;
  assign m_axi_awlen[7:0] = m04_exit_M_AXI_AWLEN;
  assign m_axi_awlock[0] = m04_exit_M_AXI_AWLOCK;
  assign m_axi_awprot[2:0] = m04_exit_M_AXI_AWPROT;
  assign m_axi_awqos[3:0] = m04_exit_M_AXI_AWQOS;
  assign m_axi_awsize[2:0] = m04_exit_M_AXI_AWSIZE;
  assign m_axi_awuser[3:0] = m04_exit_M_AXI_AWUSER;
  assign m_axi_awvalid = m04_exit_M_AXI_AWVALID;
  assign m_axi_bready = m04_exit_M_AXI_BREADY;
  assign m_axi_rready = m04_exit_M_AXI_RREADY;
  assign m_axi_wdata[31:0] = m04_exit_M_AXI_WDATA;
  assign m_axi_wlast = m04_exit_M_AXI_WLAST;
  assign m_axi_wstrb[3:0] = m04_exit_M_AXI_WSTRB;
  assign m_axi_wvalid = m04_exit_M_AXI_WVALID;
  assign s_axi_1_ARADDR = s_axi_araddr[2:0];
  assign s_axi_1_ARCACHE = s_axi_arcache[3:0];
  assign s_axi_1_ARID = s_axi_arid[4:0];
  assign s_axi_1_ARLEN = s_axi_arlen[7:0];
  assign s_axi_1_ARLOCK = s_axi_arlock[0];
  assign s_axi_1_ARPROT = s_axi_arprot[2:0];
  assign s_axi_1_ARQOS = s_axi_arqos[3:0];
  assign s_axi_1_ARUSER = s_axi_aruser[1023:0];
  assign s_axi_1_ARVALID = s_axi_arvalid;
  assign s_axi_1_AWADDR = s_axi_awaddr[2:0];
  assign s_axi_1_AWCACHE = s_axi_awcache[3:0];
  assign s_axi_1_AWID = s_axi_awid[4:0];
  assign s_axi_1_AWLEN = s_axi_awlen[7:0];
  assign s_axi_1_AWLOCK = s_axi_awlock[0];
  assign s_axi_1_AWPROT = s_axi_awprot[2:0];
  assign s_axi_1_AWQOS = s_axi_awqos[3:0];
  assign s_axi_1_AWUSER = s_axi_awuser[1023:0];
  assign s_axi_1_AWVALID = s_axi_awvalid;
  assign s_axi_1_BREADY = s_axi_bready;
  assign s_axi_1_RREADY = s_axi_rready;
  assign s_axi_1_WDATA = s_axi_wdata[31:0];
  assign s_axi_1_WLAST = s_axi_wlast;
  assign s_axi_1_WSTRB = s_axi_wstrb[3:0];
  assign s_axi_1_WUSER = s_axi_wuser[1023:0];
  assign s_axi_1_WVALID = s_axi_wvalid;
  assign s_axi_arready = s_axi_1_ARREADY;
  assign s_axi_awready = s_axi_1_AWREADY;
  assign s_axi_bid[4:0] = s_axi_1_BID;
  assign s_axi_bresp[1:0] = s_axi_1_BRESP;
  assign s_axi_buser[1023:0] = s_axi_1_BUSER;
  assign s_axi_bvalid = s_axi_1_BVALID;
  assign s_axi_rdata[31:0] = s_axi_1_RDATA;
  assign s_axi_rid[4:0] = s_axi_1_RID;
  assign s_axi_rlast = s_axi_1_RLAST;
  assign s_axi_rresp[1:0] = s_axi_1_RRESP;
  assign s_axi_ruser[1023:0] = s_axi_1_RUSER;
  assign s_axi_rvalid = s_axi_1_RVALID;
  assign s_axi_wready = s_axi_1_WREADY;
  bd_63e1_m04e_0 m04_exit
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_araddr(m04_exit_M_AXI_ARADDR),
        .m_axi_arburst(m04_exit_M_AXI_ARBURST),
        .m_axi_arcache(m04_exit_M_AXI_ARCACHE),
        .m_axi_arlen(m04_exit_M_AXI_ARLEN),
        .m_axi_arlock(m04_exit_M_AXI_ARLOCK),
        .m_axi_arprot(m04_exit_M_AXI_ARPROT),
        .m_axi_arqos(m04_exit_M_AXI_ARQOS),
        .m_axi_arready(m04_exit_M_AXI_ARREADY),
        .m_axi_arsize(m04_exit_M_AXI_ARSIZE),
        .m_axi_aruser(m04_exit_M_AXI_ARUSER),
        .m_axi_arvalid(m04_exit_M_AXI_ARVALID),
        .m_axi_awaddr(m04_exit_M_AXI_AWADDR),
        .m_axi_awburst(m04_exit_M_AXI_AWBURST),
        .m_axi_awcache(m04_exit_M_AXI_AWCACHE),
        .m_axi_awlen(m04_exit_M_AXI_AWLEN),
        .m_axi_awlock(m04_exit_M_AXI_AWLOCK),
        .m_axi_awprot(m04_exit_M_AXI_AWPROT),
        .m_axi_awqos(m04_exit_M_AXI_AWQOS),
        .m_axi_awready(m04_exit_M_AXI_AWREADY),
        .m_axi_awsize(m04_exit_M_AXI_AWSIZE),
        .m_axi_awuser(m04_exit_M_AXI_AWUSER),
        .m_axi_awvalid(m04_exit_M_AXI_AWVALID),
        .m_axi_bready(m04_exit_M_AXI_BREADY),
        .m_axi_bresp(m04_exit_M_AXI_BRESP),
        .m_axi_bvalid(m04_exit_M_AXI_BVALID),
        .m_axi_rdata(m04_exit_M_AXI_RDATA),
        .m_axi_rlast(m04_exit_M_AXI_RLAST),
        .m_axi_rready(m04_exit_M_AXI_RREADY),
        .m_axi_rresp(m04_exit_M_AXI_RRESP),
        .m_axi_rvalid(m04_exit_M_AXI_RVALID),
        .m_axi_wdata(m04_exit_M_AXI_WDATA),
        .m_axi_wlast(m04_exit_M_AXI_WLAST),
        .m_axi_wready(m04_exit_M_AXI_WREADY),
        .m_axi_wstrb(m04_exit_M_AXI_WSTRB),
        .m_axi_wvalid(m04_exit_M_AXI_WVALID),
        .s_axi_araddr(s_axi_1_ARADDR),
        .s_axi_arcache(s_axi_1_ARCACHE),
        .s_axi_arid(s_axi_1_ARID),
        .s_axi_arlen(s_axi_1_ARLEN),
        .s_axi_arlock(s_axi_1_ARLOCK),
        .s_axi_arprot(s_axi_1_ARPROT),
        .s_axi_arqos(s_axi_1_ARQOS),
        .s_axi_arready(s_axi_1_ARREADY),
        .s_axi_aruser(s_axi_1_ARUSER),
        .s_axi_arvalid(s_axi_1_ARVALID),
        .s_axi_awaddr(s_axi_1_AWADDR),
        .s_axi_awcache(s_axi_1_AWCACHE),
        .s_axi_awid(s_axi_1_AWID),
        .s_axi_awlen(s_axi_1_AWLEN),
        .s_axi_awlock(s_axi_1_AWLOCK),
        .s_axi_awprot(s_axi_1_AWPROT),
        .s_axi_awqos(s_axi_1_AWQOS),
        .s_axi_awready(s_axi_1_AWREADY),
        .s_axi_awuser(s_axi_1_AWUSER),
        .s_axi_awvalid(s_axi_1_AWVALID),
        .s_axi_bid(s_axi_1_BID),
        .s_axi_bready(s_axi_1_BREADY),
        .s_axi_bresp(s_axi_1_BRESP),
        .s_axi_buser(s_axi_1_BUSER),
        .s_axi_bvalid(s_axi_1_BVALID),
        .s_axi_rdata(s_axi_1_RDATA),
        .s_axi_rid(s_axi_1_RID),
        .s_axi_rlast(s_axi_1_RLAST),
        .s_axi_rready(s_axi_1_RREADY),
        .s_axi_rresp(s_axi_1_RRESP),
        .s_axi_ruser(s_axi_1_RUSER),
        .s_axi_rvalid(s_axi_1_RVALID),
        .s_axi_wdata(s_axi_1_WDATA),
        .s_axi_wlast(s_axi_1_WLAST),
        .s_axi_wready(s_axi_1_WREADY),
        .s_axi_wstrb(s_axi_1_WSTRB),
        .s_axi_wuser(s_axi_1_WUSER),
        .s_axi_wvalid(s_axi_1_WVALID));
endmodule

module m04_nodes_imp_9303CQ
   (M_SC_AR_info,
    M_SC_AR_payld,
    M_SC_AR_recv,
    M_SC_AR_req,
    M_SC_AR_send,
    M_SC_AW_info,
    M_SC_AW_payld,
    M_SC_AW_recv,
    M_SC_AW_req,
    M_SC_AW_send,
    M_SC_B_info,
    M_SC_B_payld,
    M_SC_B_recv,
    M_SC_B_req,
    M_SC_B_send,
    M_SC_R_info,
    M_SC_R_payld,
    M_SC_R_recv,
    M_SC_R_req,
    M_SC_R_send,
    M_SC_W_info,
    M_SC_W_payld,
    M_SC_W_recv,
    M_SC_W_req,
    M_SC_W_send,
    S_SC_AR_info,
    S_SC_AR_payld,
    S_SC_AR_recv,
    S_SC_AR_req,
    S_SC_AR_send,
    S_SC_AW_info,
    S_SC_AW_payld,
    S_SC_AW_recv,
    S_SC_AW_req,
    S_SC_AW_send,
    S_SC_B_info,
    S_SC_B_payld,
    S_SC_B_recv,
    S_SC_B_req,
    S_SC_B_send,
    S_SC_R_info,
    S_SC_R_payld,
    S_SC_R_recv,
    S_SC_R_req,
    S_SC_R_send,
    S_SC_W_info,
    S_SC_W_payld,
    S_SC_W_recv,
    S_SC_W_req,
    S_SC_W_send,
    m_axi_aclk,
    m_axi_aresetn,
    s_axi_aclk,
    s_axi_aresetn);
  output [0:0]M_SC_AR_info;
  output [155:0]M_SC_AR_payld;
  input [0:0]M_SC_AR_recv;
  output [0:0]M_SC_AR_req;
  output [0:0]M_SC_AR_send;
  output [0:0]M_SC_AW_info;
  output [155:0]M_SC_AW_payld;
  input [0:0]M_SC_AW_recv;
  output [0:0]M_SC_AW_req;
  output [0:0]M_SC_AW_send;
  output [3:0]M_SC_B_info;
  output [11:0]M_SC_B_payld;
  input [3:0]M_SC_B_recv;
  output [3:0]M_SC_B_req;
  output [3:0]M_SC_B_send;
  output [3:0]M_SC_R_info;
  output [89:0]M_SC_R_payld;
  input [3:0]M_SC_R_recv;
  output [3:0]M_SC_R_req;
  output [3:0]M_SC_R_send;
  output [0:0]M_SC_W_info;
  output [94:0]M_SC_W_payld;
  input [0:0]M_SC_W_recv;
  output [0:0]M_SC_W_req;
  output [0:0]M_SC_W_send;
  input [3:0]S_SC_AR_info;
  input [155:0]S_SC_AR_payld;
  output [3:0]S_SC_AR_recv;
  input [3:0]S_SC_AR_req;
  input [3:0]S_SC_AR_send;
  input [3:0]S_SC_AW_info;
  input [155:0]S_SC_AW_payld;
  output [3:0]S_SC_AW_recv;
  input [3:0]S_SC_AW_req;
  input [3:0]S_SC_AW_send;
  input [0:0]S_SC_B_info;
  input [11:0]S_SC_B_payld;
  output [0:0]S_SC_B_recv;
  input [0:0]S_SC_B_req;
  input [0:0]S_SC_B_send;
  input [0:0]S_SC_R_info;
  input [89:0]S_SC_R_payld;
  output [0:0]S_SC_R_recv;
  input [0:0]S_SC_R_req;
  input [0:0]S_SC_R_send;
  input [3:0]S_SC_W_info;
  input [94:0]S_SC_W_payld;
  output [3:0]S_SC_W_recv;
  input [3:0]S_SC_W_req;
  input [3:0]S_SC_W_send;
  input m_axi_aclk;
  input m_axi_aresetn;
  input s_axi_aclk;
  input s_axi_aresetn;

  wire [3:0]S_SC_AR_1_INFO;
  wire [155:0]S_SC_AR_1_PAYLD;
  wire [3:0]S_SC_AR_1_RECV;
  wire [3:0]S_SC_AR_1_REQ;
  wire [3:0]S_SC_AR_1_SEND;
  wire [3:0]S_SC_AW_1_INFO;
  wire [155:0]S_SC_AW_1_PAYLD;
  wire [3:0]S_SC_AW_1_RECV;
  wire [3:0]S_SC_AW_1_REQ;
  wire [3:0]S_SC_AW_1_SEND;
  wire [0:0]S_SC_B_1_INFO;
  wire [11:0]S_SC_B_1_PAYLD;
  wire [0:0]S_SC_B_1_RECV;
  wire [0:0]S_SC_B_1_REQ;
  wire [0:0]S_SC_B_1_SEND;
  wire [0:0]S_SC_R_1_INFO;
  wire [89:0]S_SC_R_1_PAYLD;
  wire [0:0]S_SC_R_1_RECV;
  wire [0:0]S_SC_R_1_REQ;
  wire [0:0]S_SC_R_1_SEND;
  wire [3:0]S_SC_W_1_INFO;
  wire [94:0]S_SC_W_1_PAYLD;
  wire [3:0]S_SC_W_1_RECV;
  wire [3:0]S_SC_W_1_REQ;
  wire [3:0]S_SC_W_1_SEND;
  wire [0:0]m04_ar_node_M_SC_INFO;
  wire [155:0]m04_ar_node_M_SC_PAYLD;
  wire [0:0]m04_ar_node_M_SC_RECV;
  wire [0:0]m04_ar_node_M_SC_REQ;
  wire [0:0]m04_ar_node_M_SC_SEND;
  wire [15:0]m04_aw_node_M_AXIS_ARB_TDATA;
  wire m04_aw_node_M_AXIS_ARB_TREADY;
  wire m04_aw_node_M_AXIS_ARB_TVALID;
  wire [0:0]m04_aw_node_M_SC_INFO;
  wire [155:0]m04_aw_node_M_SC_PAYLD;
  wire [0:0]m04_aw_node_M_SC_RECV;
  wire [0:0]m04_aw_node_M_SC_REQ;
  wire [0:0]m04_aw_node_M_SC_SEND;
  wire [3:0]m04_b_node_M_SC_INFO;
  wire [11:0]m04_b_node_M_SC_PAYLD;
  wire [3:0]m04_b_node_M_SC_RECV;
  wire [3:0]m04_b_node_M_SC_REQ;
  wire [3:0]m04_b_node_M_SC_SEND;
  wire [3:0]m04_r_node_M_SC_INFO;
  wire [89:0]m04_r_node_M_SC_PAYLD;
  wire [3:0]m04_r_node_M_SC_RECV;
  wire [3:0]m04_r_node_M_SC_REQ;
  wire [3:0]m04_r_node_M_SC_SEND;
  wire [0:0]m04_w_node_M_SC_INFO;
  wire [94:0]m04_w_node_M_SC_PAYLD;
  wire [0:0]m04_w_node_M_SC_RECV;
  wire [0:0]m04_w_node_M_SC_REQ;
  wire [0:0]m04_w_node_M_SC_SEND;
  wire m_axi_aclk_1;
  wire m_axi_aresetn_1;
  wire s_axi_aclk_1;
  wire s_axi_aresetn_1;

  assign M_SC_AR_info[0] = m04_ar_node_M_SC_INFO;
  assign M_SC_AR_payld[155:0] = m04_ar_node_M_SC_PAYLD;
  assign M_SC_AR_req[0] = m04_ar_node_M_SC_REQ;
  assign M_SC_AR_send[0] = m04_ar_node_M_SC_SEND;
  assign M_SC_AW_info[0] = m04_aw_node_M_SC_INFO;
  assign M_SC_AW_payld[155:0] = m04_aw_node_M_SC_PAYLD;
  assign M_SC_AW_req[0] = m04_aw_node_M_SC_REQ;
  assign M_SC_AW_send[0] = m04_aw_node_M_SC_SEND;
  assign M_SC_B_info[3:0] = m04_b_node_M_SC_INFO;
  assign M_SC_B_payld[11:0] = m04_b_node_M_SC_PAYLD;
  assign M_SC_B_req[3:0] = m04_b_node_M_SC_REQ;
  assign M_SC_B_send[3:0] = m04_b_node_M_SC_SEND;
  assign M_SC_R_info[3:0] = m04_r_node_M_SC_INFO;
  assign M_SC_R_payld[89:0] = m04_r_node_M_SC_PAYLD;
  assign M_SC_R_req[3:0] = m04_r_node_M_SC_REQ;
  assign M_SC_R_send[3:0] = m04_r_node_M_SC_SEND;
  assign M_SC_W_info[0] = m04_w_node_M_SC_INFO;
  assign M_SC_W_payld[94:0] = m04_w_node_M_SC_PAYLD;
  assign M_SC_W_req[0] = m04_w_node_M_SC_REQ;
  assign M_SC_W_send[0] = m04_w_node_M_SC_SEND;
  assign S_SC_AR_1_INFO = S_SC_AR_info[3:0];
  assign S_SC_AR_1_PAYLD = S_SC_AR_payld[155:0];
  assign S_SC_AR_1_REQ = S_SC_AR_req[3:0];
  assign S_SC_AR_1_SEND = S_SC_AR_send[3:0];
  assign S_SC_AR_recv[3:0] = S_SC_AR_1_RECV;
  assign S_SC_AW_1_INFO = S_SC_AW_info[3:0];
  assign S_SC_AW_1_PAYLD = S_SC_AW_payld[155:0];
  assign S_SC_AW_1_REQ = S_SC_AW_req[3:0];
  assign S_SC_AW_1_SEND = S_SC_AW_send[3:0];
  assign S_SC_AW_recv[3:0] = S_SC_AW_1_RECV;
  assign S_SC_B_1_INFO = S_SC_B_info[0];
  assign S_SC_B_1_PAYLD = S_SC_B_payld[11:0];
  assign S_SC_B_1_REQ = S_SC_B_req[0];
  assign S_SC_B_1_SEND = S_SC_B_send[0];
  assign S_SC_B_recv[0] = S_SC_B_1_RECV;
  assign S_SC_R_1_INFO = S_SC_R_info[0];
  assign S_SC_R_1_PAYLD = S_SC_R_payld[89:0];
  assign S_SC_R_1_REQ = S_SC_R_req[0];
  assign S_SC_R_1_SEND = S_SC_R_send[0];
  assign S_SC_R_recv[0] = S_SC_R_1_RECV;
  assign S_SC_W_1_INFO = S_SC_W_info[3:0];
  assign S_SC_W_1_PAYLD = S_SC_W_payld[94:0];
  assign S_SC_W_1_REQ = S_SC_W_req[3:0];
  assign S_SC_W_1_SEND = S_SC_W_send[3:0];
  assign S_SC_W_recv[3:0] = S_SC_W_1_RECV;
  assign m04_ar_node_M_SC_RECV = M_SC_AR_recv[0];
  assign m04_aw_node_M_SC_RECV = M_SC_AW_recv[0];
  assign m04_b_node_M_SC_RECV = M_SC_B_recv[3:0];
  assign m04_r_node_M_SC_RECV = M_SC_R_recv[3:0];
  assign m04_w_node_M_SC_RECV = M_SC_W_recv[0];
  assign m_axi_aclk_1 = m_axi_aclk;
  assign m_axi_aresetn_1 = m_axi_aresetn;
  assign s_axi_aclk_1 = s_axi_aclk;
  assign s_axi_aresetn_1 = s_axi_aresetn;
  bd_63e1_m04arn_0 m04_ar_node
       (.m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m04_ar_node_M_SC_INFO),
        .m_sc_payld(m04_ar_node_M_SC_PAYLD),
        .m_sc_recv(m04_ar_node_M_SC_RECV),
        .m_sc_req(m04_ar_node_M_SC_REQ),
        .m_sc_send(m04_ar_node_M_SC_SEND),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_AR_1_INFO),
        .s_sc_payld(S_SC_AR_1_PAYLD),
        .s_sc_recv(S_SC_AR_1_RECV),
        .s_sc_req(S_SC_AR_1_REQ),
        .s_sc_send(S_SC_AR_1_SEND));
  bd_63e1_m04awn_0 m04_aw_node
       (.m_axis_arb_tdata(m04_aw_node_M_AXIS_ARB_TDATA),
        .m_axis_arb_tready(m04_aw_node_M_AXIS_ARB_TREADY),
        .m_axis_arb_tvalid(m04_aw_node_M_AXIS_ARB_TVALID),
        .m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m04_aw_node_M_SC_INFO),
        .m_sc_payld(m04_aw_node_M_SC_PAYLD),
        .m_sc_recv(m04_aw_node_M_SC_RECV),
        .m_sc_req(m04_aw_node_M_SC_REQ),
        .m_sc_send(m04_aw_node_M_SC_SEND),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_AW_1_INFO),
        .s_sc_payld(S_SC_AW_1_PAYLD),
        .s_sc_recv(S_SC_AW_1_RECV),
        .s_sc_req(S_SC_AW_1_REQ),
        .s_sc_send(S_SC_AW_1_SEND));
  bd_63e1_m04bn_0 m04_b_node
       (.m_sc_aclk(s_axi_aclk_1),
        .m_sc_aresetn(s_axi_aresetn_1),
        .m_sc_info(m04_b_node_M_SC_INFO),
        .m_sc_payld(m04_b_node_M_SC_PAYLD),
        .m_sc_recv(m04_b_node_M_SC_RECV),
        .m_sc_req(m04_b_node_M_SC_REQ),
        .m_sc_send(m04_b_node_M_SC_SEND),
        .s_sc_aclk(m_axi_aclk_1),
        .s_sc_aresetn(m_axi_aresetn_1),
        .s_sc_info(S_SC_B_1_INFO),
        .s_sc_payld(S_SC_B_1_PAYLD),
        .s_sc_recv(S_SC_B_1_RECV),
        .s_sc_req(S_SC_B_1_REQ),
        .s_sc_send(S_SC_B_1_SEND));
  bd_63e1_m04rn_0 m04_r_node
       (.m_sc_aclk(s_axi_aclk_1),
        .m_sc_aresetn(s_axi_aresetn_1),
        .m_sc_info(m04_r_node_M_SC_INFO),
        .m_sc_payld(m04_r_node_M_SC_PAYLD),
        .m_sc_recv(m04_r_node_M_SC_RECV),
        .m_sc_req(m04_r_node_M_SC_REQ),
        .m_sc_send(m04_r_node_M_SC_SEND),
        .s_sc_aclk(m_axi_aclk_1),
        .s_sc_aresetn(m_axi_aresetn_1),
        .s_sc_info(S_SC_R_1_INFO),
        .s_sc_payld(S_SC_R_1_PAYLD),
        .s_sc_recv(S_SC_R_1_RECV),
        .s_sc_req(S_SC_R_1_REQ),
        .s_sc_send(S_SC_R_1_SEND));
  bd_63e1_m04wn_0 m04_w_node
       (.m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m04_w_node_M_SC_INFO),
        .m_sc_payld(m04_w_node_M_SC_PAYLD),
        .m_sc_recv(m04_w_node_M_SC_RECV),
        .m_sc_req(m04_w_node_M_SC_REQ),
        .m_sc_send(m04_w_node_M_SC_SEND),
        .s_axis_arb_tdata(m04_aw_node_M_AXIS_ARB_TDATA),
        .s_axis_arb_tready(m04_aw_node_M_AXIS_ARB_TREADY),
        .s_axis_arb_tvalid(m04_aw_node_M_AXIS_ARB_TVALID),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_W_1_INFO),
        .s_sc_payld(S_SC_W_1_PAYLD),
        .s_sc_recv(S_SC_W_1_RECV),
        .s_sc_req(S_SC_W_1_REQ),
        .s_sc_send(S_SC_W_1_SEND));
endmodule

module m05_exit_pipeline_imp_9MCQA5
   (aclk,
    aresetn,
    m_axi_araddr,
    m_axi_arburst,
    m_axi_arcache,
    m_axi_arlen,
    m_axi_arlock,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arready,
    m_axi_arsize,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_awaddr,
    m_axi_awburst,
    m_axi_awcache,
    m_axi_awlen,
    m_axi_awlock,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awready,
    m_axi_awsize,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_bready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_rdata,
    m_axi_rlast,
    m_axi_rready,
    m_axi_rresp,
    m_axi_rvalid,
    m_axi_wdata,
    m_axi_wlast,
    m_axi_wready,
    m_axi_wstrb,
    m_axi_wvalid,
    s_axi_araddr,
    s_axi_arcache,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arlock,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arready,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_awaddr,
    s_axi_awcache,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awlock,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awready,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_bid,
    s_axi_bready,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_rdata,
    s_axi_rid,
    s_axi_rlast,
    s_axi_rready,
    s_axi_rresp,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_wdata,
    s_axi_wlast,
    s_axi_wready,
    s_axi_wstrb,
    s_axi_wuser,
    s_axi_wvalid);
  input aclk;
  input aresetn;
  output [2:0]m_axi_araddr;
  output [1:0]m_axi_arburst;
  output [3:0]m_axi_arcache;
  output [7:0]m_axi_arlen;
  output [0:0]m_axi_arlock;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  input m_axi_arready;
  output [2:0]m_axi_arsize;
  output [3:0]m_axi_aruser;
  output m_axi_arvalid;
  output [2:0]m_axi_awaddr;
  output [1:0]m_axi_awburst;
  output [3:0]m_axi_awcache;
  output [7:0]m_axi_awlen;
  output [0:0]m_axi_awlock;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  input m_axi_awready;
  output [2:0]m_axi_awsize;
  output [3:0]m_axi_awuser;
  output m_axi_awvalid;
  output m_axi_bready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  input [31:0]m_axi_rdata;
  input m_axi_rlast;
  output m_axi_rready;
  input [1:0]m_axi_rresp;
  input m_axi_rvalid;
  output [31:0]m_axi_wdata;
  output m_axi_wlast;
  input m_axi_wready;
  output [3:0]m_axi_wstrb;
  output m_axi_wvalid;
  input [2:0]s_axi_araddr;
  input [3:0]s_axi_arcache;
  input [4:0]s_axi_arid;
  input [7:0]s_axi_arlen;
  input [0:0]s_axi_arlock;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  output s_axi_arready;
  input [1023:0]s_axi_aruser;
  input s_axi_arvalid;
  input [2:0]s_axi_awaddr;
  input [3:0]s_axi_awcache;
  input [4:0]s_axi_awid;
  input [7:0]s_axi_awlen;
  input [0:0]s_axi_awlock;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  output s_axi_awready;
  input [1023:0]s_axi_awuser;
  input s_axi_awvalid;
  output [4:0]s_axi_bid;
  input s_axi_bready;
  output [1:0]s_axi_bresp;
  output [1023:0]s_axi_buser;
  output s_axi_bvalid;
  output [31:0]s_axi_rdata;
  output [4:0]s_axi_rid;
  output s_axi_rlast;
  input s_axi_rready;
  output [1:0]s_axi_rresp;
  output [1023:0]s_axi_ruser;
  output s_axi_rvalid;
  input [31:0]s_axi_wdata;
  input s_axi_wlast;
  output s_axi_wready;
  input [3:0]s_axi_wstrb;
  input [1023:0]s_axi_wuser;
  input s_axi_wvalid;

  wire aclk_1;
  wire aresetn_1;
  wire [2:0]m05_exit_M_AXI_ARADDR;
  wire [1:0]m05_exit_M_AXI_ARBURST;
  wire [3:0]m05_exit_M_AXI_ARCACHE;
  wire [7:0]m05_exit_M_AXI_ARLEN;
  wire [0:0]m05_exit_M_AXI_ARLOCK;
  wire [2:0]m05_exit_M_AXI_ARPROT;
  wire [3:0]m05_exit_M_AXI_ARQOS;
  wire m05_exit_M_AXI_ARREADY;
  wire [2:0]m05_exit_M_AXI_ARSIZE;
  wire [3:0]m05_exit_M_AXI_ARUSER;
  wire m05_exit_M_AXI_ARVALID;
  wire [2:0]m05_exit_M_AXI_AWADDR;
  wire [1:0]m05_exit_M_AXI_AWBURST;
  wire [3:0]m05_exit_M_AXI_AWCACHE;
  wire [7:0]m05_exit_M_AXI_AWLEN;
  wire [0:0]m05_exit_M_AXI_AWLOCK;
  wire [2:0]m05_exit_M_AXI_AWPROT;
  wire [3:0]m05_exit_M_AXI_AWQOS;
  wire m05_exit_M_AXI_AWREADY;
  wire [2:0]m05_exit_M_AXI_AWSIZE;
  wire [3:0]m05_exit_M_AXI_AWUSER;
  wire m05_exit_M_AXI_AWVALID;
  wire m05_exit_M_AXI_BREADY;
  wire [1:0]m05_exit_M_AXI_BRESP;
  wire m05_exit_M_AXI_BVALID;
  wire [31:0]m05_exit_M_AXI_RDATA;
  wire m05_exit_M_AXI_RLAST;
  wire m05_exit_M_AXI_RREADY;
  wire [1:0]m05_exit_M_AXI_RRESP;
  wire m05_exit_M_AXI_RVALID;
  wire [31:0]m05_exit_M_AXI_WDATA;
  wire m05_exit_M_AXI_WLAST;
  wire m05_exit_M_AXI_WREADY;
  wire [3:0]m05_exit_M_AXI_WSTRB;
  wire m05_exit_M_AXI_WVALID;
  wire [2:0]s_axi_1_ARADDR;
  wire [3:0]s_axi_1_ARCACHE;
  wire [4:0]s_axi_1_ARID;
  wire [7:0]s_axi_1_ARLEN;
  wire [0:0]s_axi_1_ARLOCK;
  wire [2:0]s_axi_1_ARPROT;
  wire [3:0]s_axi_1_ARQOS;
  wire s_axi_1_ARREADY;
  wire [1023:0]s_axi_1_ARUSER;
  wire s_axi_1_ARVALID;
  wire [2:0]s_axi_1_AWADDR;
  wire [3:0]s_axi_1_AWCACHE;
  wire [4:0]s_axi_1_AWID;
  wire [7:0]s_axi_1_AWLEN;
  wire [0:0]s_axi_1_AWLOCK;
  wire [2:0]s_axi_1_AWPROT;
  wire [3:0]s_axi_1_AWQOS;
  wire s_axi_1_AWREADY;
  wire [1023:0]s_axi_1_AWUSER;
  wire s_axi_1_AWVALID;
  wire [4:0]s_axi_1_BID;
  wire s_axi_1_BREADY;
  wire [1:0]s_axi_1_BRESP;
  wire [1023:0]s_axi_1_BUSER;
  wire s_axi_1_BVALID;
  wire [31:0]s_axi_1_RDATA;
  wire [4:0]s_axi_1_RID;
  wire s_axi_1_RLAST;
  wire s_axi_1_RREADY;
  wire [1:0]s_axi_1_RRESP;
  wire [1023:0]s_axi_1_RUSER;
  wire s_axi_1_RVALID;
  wire [31:0]s_axi_1_WDATA;
  wire s_axi_1_WLAST;
  wire s_axi_1_WREADY;
  wire [3:0]s_axi_1_WSTRB;
  wire [1023:0]s_axi_1_WUSER;
  wire s_axi_1_WVALID;

  assign aclk_1 = aclk;
  assign aresetn_1 = aresetn;
  assign m05_exit_M_AXI_ARREADY = m_axi_arready;
  assign m05_exit_M_AXI_AWREADY = m_axi_awready;
  assign m05_exit_M_AXI_BRESP = m_axi_bresp[1:0];
  assign m05_exit_M_AXI_BVALID = m_axi_bvalid;
  assign m05_exit_M_AXI_RDATA = m_axi_rdata[31:0];
  assign m05_exit_M_AXI_RLAST = m_axi_rlast;
  assign m05_exit_M_AXI_RRESP = m_axi_rresp[1:0];
  assign m05_exit_M_AXI_RVALID = m_axi_rvalid;
  assign m05_exit_M_AXI_WREADY = m_axi_wready;
  assign m_axi_araddr[2:0] = m05_exit_M_AXI_ARADDR;
  assign m_axi_arburst[1:0] = m05_exit_M_AXI_ARBURST;
  assign m_axi_arcache[3:0] = m05_exit_M_AXI_ARCACHE;
  assign m_axi_arlen[7:0] = m05_exit_M_AXI_ARLEN;
  assign m_axi_arlock[0] = m05_exit_M_AXI_ARLOCK;
  assign m_axi_arprot[2:0] = m05_exit_M_AXI_ARPROT;
  assign m_axi_arqos[3:0] = m05_exit_M_AXI_ARQOS;
  assign m_axi_arsize[2:0] = m05_exit_M_AXI_ARSIZE;
  assign m_axi_aruser[3:0] = m05_exit_M_AXI_ARUSER;
  assign m_axi_arvalid = m05_exit_M_AXI_ARVALID;
  assign m_axi_awaddr[2:0] = m05_exit_M_AXI_AWADDR;
  assign m_axi_awburst[1:0] = m05_exit_M_AXI_AWBURST;
  assign m_axi_awcache[3:0] = m05_exit_M_AXI_AWCACHE;
  assign m_axi_awlen[7:0] = m05_exit_M_AXI_AWLEN;
  assign m_axi_awlock[0] = m05_exit_M_AXI_AWLOCK;
  assign m_axi_awprot[2:0] = m05_exit_M_AXI_AWPROT;
  assign m_axi_awqos[3:0] = m05_exit_M_AXI_AWQOS;
  assign m_axi_awsize[2:0] = m05_exit_M_AXI_AWSIZE;
  assign m_axi_awuser[3:0] = m05_exit_M_AXI_AWUSER;
  assign m_axi_awvalid = m05_exit_M_AXI_AWVALID;
  assign m_axi_bready = m05_exit_M_AXI_BREADY;
  assign m_axi_rready = m05_exit_M_AXI_RREADY;
  assign m_axi_wdata[31:0] = m05_exit_M_AXI_WDATA;
  assign m_axi_wlast = m05_exit_M_AXI_WLAST;
  assign m_axi_wstrb[3:0] = m05_exit_M_AXI_WSTRB;
  assign m_axi_wvalid = m05_exit_M_AXI_WVALID;
  assign s_axi_1_ARADDR = s_axi_araddr[2:0];
  assign s_axi_1_ARCACHE = s_axi_arcache[3:0];
  assign s_axi_1_ARID = s_axi_arid[4:0];
  assign s_axi_1_ARLEN = s_axi_arlen[7:0];
  assign s_axi_1_ARLOCK = s_axi_arlock[0];
  assign s_axi_1_ARPROT = s_axi_arprot[2:0];
  assign s_axi_1_ARQOS = s_axi_arqos[3:0];
  assign s_axi_1_ARUSER = s_axi_aruser[1023:0];
  assign s_axi_1_ARVALID = s_axi_arvalid;
  assign s_axi_1_AWADDR = s_axi_awaddr[2:0];
  assign s_axi_1_AWCACHE = s_axi_awcache[3:0];
  assign s_axi_1_AWID = s_axi_awid[4:0];
  assign s_axi_1_AWLEN = s_axi_awlen[7:0];
  assign s_axi_1_AWLOCK = s_axi_awlock[0];
  assign s_axi_1_AWPROT = s_axi_awprot[2:0];
  assign s_axi_1_AWQOS = s_axi_awqos[3:0];
  assign s_axi_1_AWUSER = s_axi_awuser[1023:0];
  assign s_axi_1_AWVALID = s_axi_awvalid;
  assign s_axi_1_BREADY = s_axi_bready;
  assign s_axi_1_RREADY = s_axi_rready;
  assign s_axi_1_WDATA = s_axi_wdata[31:0];
  assign s_axi_1_WLAST = s_axi_wlast;
  assign s_axi_1_WSTRB = s_axi_wstrb[3:0];
  assign s_axi_1_WUSER = s_axi_wuser[1023:0];
  assign s_axi_1_WVALID = s_axi_wvalid;
  assign s_axi_arready = s_axi_1_ARREADY;
  assign s_axi_awready = s_axi_1_AWREADY;
  assign s_axi_bid[4:0] = s_axi_1_BID;
  assign s_axi_bresp[1:0] = s_axi_1_BRESP;
  assign s_axi_buser[1023:0] = s_axi_1_BUSER;
  assign s_axi_bvalid = s_axi_1_BVALID;
  assign s_axi_rdata[31:0] = s_axi_1_RDATA;
  assign s_axi_rid[4:0] = s_axi_1_RID;
  assign s_axi_rlast = s_axi_1_RLAST;
  assign s_axi_rresp[1:0] = s_axi_1_RRESP;
  assign s_axi_ruser[1023:0] = s_axi_1_RUSER;
  assign s_axi_rvalid = s_axi_1_RVALID;
  assign s_axi_wready = s_axi_1_WREADY;
  bd_63e1_m05e_0 m05_exit
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_araddr(m05_exit_M_AXI_ARADDR),
        .m_axi_arburst(m05_exit_M_AXI_ARBURST),
        .m_axi_arcache(m05_exit_M_AXI_ARCACHE),
        .m_axi_arlen(m05_exit_M_AXI_ARLEN),
        .m_axi_arlock(m05_exit_M_AXI_ARLOCK),
        .m_axi_arprot(m05_exit_M_AXI_ARPROT),
        .m_axi_arqos(m05_exit_M_AXI_ARQOS),
        .m_axi_arready(m05_exit_M_AXI_ARREADY),
        .m_axi_arsize(m05_exit_M_AXI_ARSIZE),
        .m_axi_aruser(m05_exit_M_AXI_ARUSER),
        .m_axi_arvalid(m05_exit_M_AXI_ARVALID),
        .m_axi_awaddr(m05_exit_M_AXI_AWADDR),
        .m_axi_awburst(m05_exit_M_AXI_AWBURST),
        .m_axi_awcache(m05_exit_M_AXI_AWCACHE),
        .m_axi_awlen(m05_exit_M_AXI_AWLEN),
        .m_axi_awlock(m05_exit_M_AXI_AWLOCK),
        .m_axi_awprot(m05_exit_M_AXI_AWPROT),
        .m_axi_awqos(m05_exit_M_AXI_AWQOS),
        .m_axi_awready(m05_exit_M_AXI_AWREADY),
        .m_axi_awsize(m05_exit_M_AXI_AWSIZE),
        .m_axi_awuser(m05_exit_M_AXI_AWUSER),
        .m_axi_awvalid(m05_exit_M_AXI_AWVALID),
        .m_axi_bready(m05_exit_M_AXI_BREADY),
        .m_axi_bresp(m05_exit_M_AXI_BRESP),
        .m_axi_bvalid(m05_exit_M_AXI_BVALID),
        .m_axi_rdata(m05_exit_M_AXI_RDATA),
        .m_axi_rlast(m05_exit_M_AXI_RLAST),
        .m_axi_rready(m05_exit_M_AXI_RREADY),
        .m_axi_rresp(m05_exit_M_AXI_RRESP),
        .m_axi_rvalid(m05_exit_M_AXI_RVALID),
        .m_axi_wdata(m05_exit_M_AXI_WDATA),
        .m_axi_wlast(m05_exit_M_AXI_WLAST),
        .m_axi_wready(m05_exit_M_AXI_WREADY),
        .m_axi_wstrb(m05_exit_M_AXI_WSTRB),
        .m_axi_wvalid(m05_exit_M_AXI_WVALID),
        .s_axi_araddr(s_axi_1_ARADDR),
        .s_axi_arcache(s_axi_1_ARCACHE),
        .s_axi_arid(s_axi_1_ARID),
        .s_axi_arlen(s_axi_1_ARLEN),
        .s_axi_arlock(s_axi_1_ARLOCK),
        .s_axi_arprot(s_axi_1_ARPROT),
        .s_axi_arqos(s_axi_1_ARQOS),
        .s_axi_arready(s_axi_1_ARREADY),
        .s_axi_aruser(s_axi_1_ARUSER),
        .s_axi_arvalid(s_axi_1_ARVALID),
        .s_axi_awaddr(s_axi_1_AWADDR),
        .s_axi_awcache(s_axi_1_AWCACHE),
        .s_axi_awid(s_axi_1_AWID),
        .s_axi_awlen(s_axi_1_AWLEN),
        .s_axi_awlock(s_axi_1_AWLOCK),
        .s_axi_awprot(s_axi_1_AWPROT),
        .s_axi_awqos(s_axi_1_AWQOS),
        .s_axi_awready(s_axi_1_AWREADY),
        .s_axi_awuser(s_axi_1_AWUSER),
        .s_axi_awvalid(s_axi_1_AWVALID),
        .s_axi_bid(s_axi_1_BID),
        .s_axi_bready(s_axi_1_BREADY),
        .s_axi_bresp(s_axi_1_BRESP),
        .s_axi_buser(s_axi_1_BUSER),
        .s_axi_bvalid(s_axi_1_BVALID),
        .s_axi_rdata(s_axi_1_RDATA),
        .s_axi_rid(s_axi_1_RID),
        .s_axi_rlast(s_axi_1_RLAST),
        .s_axi_rready(s_axi_1_RREADY),
        .s_axi_rresp(s_axi_1_RRESP),
        .s_axi_ruser(s_axi_1_RUSER),
        .s_axi_rvalid(s_axi_1_RVALID),
        .s_axi_wdata(s_axi_1_WDATA),
        .s_axi_wlast(s_axi_1_WLAST),
        .s_axi_wready(s_axi_1_WREADY),
        .s_axi_wstrb(s_axi_1_WSTRB),
        .s_axi_wuser(s_axi_1_WUSER),
        .s_axi_wvalid(s_axi_1_WVALID));
endmodule

module m05_nodes_imp_1GMV630
   (M_SC_AR_info,
    M_SC_AR_payld,
    M_SC_AR_recv,
    M_SC_AR_req,
    M_SC_AR_send,
    M_SC_AW_info,
    M_SC_AW_payld,
    M_SC_AW_recv,
    M_SC_AW_req,
    M_SC_AW_send,
    M_SC_B_info,
    M_SC_B_payld,
    M_SC_B_recv,
    M_SC_B_req,
    M_SC_B_send,
    M_SC_R_info,
    M_SC_R_payld,
    M_SC_R_recv,
    M_SC_R_req,
    M_SC_R_send,
    M_SC_W_info,
    M_SC_W_payld,
    M_SC_W_recv,
    M_SC_W_req,
    M_SC_W_send,
    S_SC_AR_info,
    S_SC_AR_payld,
    S_SC_AR_recv,
    S_SC_AR_req,
    S_SC_AR_send,
    S_SC_AW_info,
    S_SC_AW_payld,
    S_SC_AW_recv,
    S_SC_AW_req,
    S_SC_AW_send,
    S_SC_B_info,
    S_SC_B_payld,
    S_SC_B_recv,
    S_SC_B_req,
    S_SC_B_send,
    S_SC_R_info,
    S_SC_R_payld,
    S_SC_R_recv,
    S_SC_R_req,
    S_SC_R_send,
    S_SC_W_info,
    S_SC_W_payld,
    S_SC_W_recv,
    S_SC_W_req,
    S_SC_W_send,
    m_axi_aclk,
    m_axi_aresetn,
    s_axi_aclk,
    s_axi_aresetn);
  output [0:0]M_SC_AR_info;
  output [155:0]M_SC_AR_payld;
  input [0:0]M_SC_AR_recv;
  output [0:0]M_SC_AR_req;
  output [0:0]M_SC_AR_send;
  output [0:0]M_SC_AW_info;
  output [155:0]M_SC_AW_payld;
  input [0:0]M_SC_AW_recv;
  output [0:0]M_SC_AW_req;
  output [0:0]M_SC_AW_send;
  output [3:0]M_SC_B_info;
  output [11:0]M_SC_B_payld;
  input [3:0]M_SC_B_recv;
  output [3:0]M_SC_B_req;
  output [3:0]M_SC_B_send;
  output [3:0]M_SC_R_info;
  output [89:0]M_SC_R_payld;
  input [3:0]M_SC_R_recv;
  output [3:0]M_SC_R_req;
  output [3:0]M_SC_R_send;
  output [0:0]M_SC_W_info;
  output [94:0]M_SC_W_payld;
  input [0:0]M_SC_W_recv;
  output [0:0]M_SC_W_req;
  output [0:0]M_SC_W_send;
  input [3:0]S_SC_AR_info;
  input [155:0]S_SC_AR_payld;
  output [3:0]S_SC_AR_recv;
  input [3:0]S_SC_AR_req;
  input [3:0]S_SC_AR_send;
  input [3:0]S_SC_AW_info;
  input [155:0]S_SC_AW_payld;
  output [3:0]S_SC_AW_recv;
  input [3:0]S_SC_AW_req;
  input [3:0]S_SC_AW_send;
  input [0:0]S_SC_B_info;
  input [11:0]S_SC_B_payld;
  output [0:0]S_SC_B_recv;
  input [0:0]S_SC_B_req;
  input [0:0]S_SC_B_send;
  input [0:0]S_SC_R_info;
  input [89:0]S_SC_R_payld;
  output [0:0]S_SC_R_recv;
  input [0:0]S_SC_R_req;
  input [0:0]S_SC_R_send;
  input [3:0]S_SC_W_info;
  input [94:0]S_SC_W_payld;
  output [3:0]S_SC_W_recv;
  input [3:0]S_SC_W_req;
  input [3:0]S_SC_W_send;
  input m_axi_aclk;
  input m_axi_aresetn;
  input s_axi_aclk;
  input s_axi_aresetn;

  wire [3:0]S_SC_AR_1_INFO;
  wire [155:0]S_SC_AR_1_PAYLD;
  wire [3:0]S_SC_AR_1_RECV;
  wire [3:0]S_SC_AR_1_REQ;
  wire [3:0]S_SC_AR_1_SEND;
  wire [3:0]S_SC_AW_1_INFO;
  wire [155:0]S_SC_AW_1_PAYLD;
  wire [3:0]S_SC_AW_1_RECV;
  wire [3:0]S_SC_AW_1_REQ;
  wire [3:0]S_SC_AW_1_SEND;
  wire [0:0]S_SC_B_1_INFO;
  wire [11:0]S_SC_B_1_PAYLD;
  wire [0:0]S_SC_B_1_RECV;
  wire [0:0]S_SC_B_1_REQ;
  wire [0:0]S_SC_B_1_SEND;
  wire [0:0]S_SC_R_1_INFO;
  wire [89:0]S_SC_R_1_PAYLD;
  wire [0:0]S_SC_R_1_RECV;
  wire [0:0]S_SC_R_1_REQ;
  wire [0:0]S_SC_R_1_SEND;
  wire [3:0]S_SC_W_1_INFO;
  wire [94:0]S_SC_W_1_PAYLD;
  wire [3:0]S_SC_W_1_RECV;
  wire [3:0]S_SC_W_1_REQ;
  wire [3:0]S_SC_W_1_SEND;
  wire [0:0]m05_ar_node_M_SC_INFO;
  wire [155:0]m05_ar_node_M_SC_PAYLD;
  wire [0:0]m05_ar_node_M_SC_RECV;
  wire [0:0]m05_ar_node_M_SC_REQ;
  wire [0:0]m05_ar_node_M_SC_SEND;
  wire [15:0]m05_aw_node_M_AXIS_ARB_TDATA;
  wire m05_aw_node_M_AXIS_ARB_TREADY;
  wire m05_aw_node_M_AXIS_ARB_TVALID;
  wire [0:0]m05_aw_node_M_SC_INFO;
  wire [155:0]m05_aw_node_M_SC_PAYLD;
  wire [0:0]m05_aw_node_M_SC_RECV;
  wire [0:0]m05_aw_node_M_SC_REQ;
  wire [0:0]m05_aw_node_M_SC_SEND;
  wire [3:0]m05_b_node_M_SC_INFO;
  wire [11:0]m05_b_node_M_SC_PAYLD;
  wire [3:0]m05_b_node_M_SC_RECV;
  wire [3:0]m05_b_node_M_SC_REQ;
  wire [3:0]m05_b_node_M_SC_SEND;
  wire [3:0]m05_r_node_M_SC_INFO;
  wire [89:0]m05_r_node_M_SC_PAYLD;
  wire [3:0]m05_r_node_M_SC_RECV;
  wire [3:0]m05_r_node_M_SC_REQ;
  wire [3:0]m05_r_node_M_SC_SEND;
  wire [0:0]m05_w_node_M_SC_INFO;
  wire [94:0]m05_w_node_M_SC_PAYLD;
  wire [0:0]m05_w_node_M_SC_RECV;
  wire [0:0]m05_w_node_M_SC_REQ;
  wire [0:0]m05_w_node_M_SC_SEND;
  wire m_axi_aclk_1;
  wire m_axi_aresetn_1;
  wire s_axi_aclk_1;
  wire s_axi_aresetn_1;

  assign M_SC_AR_info[0] = m05_ar_node_M_SC_INFO;
  assign M_SC_AR_payld[155:0] = m05_ar_node_M_SC_PAYLD;
  assign M_SC_AR_req[0] = m05_ar_node_M_SC_REQ;
  assign M_SC_AR_send[0] = m05_ar_node_M_SC_SEND;
  assign M_SC_AW_info[0] = m05_aw_node_M_SC_INFO;
  assign M_SC_AW_payld[155:0] = m05_aw_node_M_SC_PAYLD;
  assign M_SC_AW_req[0] = m05_aw_node_M_SC_REQ;
  assign M_SC_AW_send[0] = m05_aw_node_M_SC_SEND;
  assign M_SC_B_info[3:0] = m05_b_node_M_SC_INFO;
  assign M_SC_B_payld[11:0] = m05_b_node_M_SC_PAYLD;
  assign M_SC_B_req[3:0] = m05_b_node_M_SC_REQ;
  assign M_SC_B_send[3:0] = m05_b_node_M_SC_SEND;
  assign M_SC_R_info[3:0] = m05_r_node_M_SC_INFO;
  assign M_SC_R_payld[89:0] = m05_r_node_M_SC_PAYLD;
  assign M_SC_R_req[3:0] = m05_r_node_M_SC_REQ;
  assign M_SC_R_send[3:0] = m05_r_node_M_SC_SEND;
  assign M_SC_W_info[0] = m05_w_node_M_SC_INFO;
  assign M_SC_W_payld[94:0] = m05_w_node_M_SC_PAYLD;
  assign M_SC_W_req[0] = m05_w_node_M_SC_REQ;
  assign M_SC_W_send[0] = m05_w_node_M_SC_SEND;
  assign S_SC_AR_1_INFO = S_SC_AR_info[3:0];
  assign S_SC_AR_1_PAYLD = S_SC_AR_payld[155:0];
  assign S_SC_AR_1_REQ = S_SC_AR_req[3:0];
  assign S_SC_AR_1_SEND = S_SC_AR_send[3:0];
  assign S_SC_AR_recv[3:0] = S_SC_AR_1_RECV;
  assign S_SC_AW_1_INFO = S_SC_AW_info[3:0];
  assign S_SC_AW_1_PAYLD = S_SC_AW_payld[155:0];
  assign S_SC_AW_1_REQ = S_SC_AW_req[3:0];
  assign S_SC_AW_1_SEND = S_SC_AW_send[3:0];
  assign S_SC_AW_recv[3:0] = S_SC_AW_1_RECV;
  assign S_SC_B_1_INFO = S_SC_B_info[0];
  assign S_SC_B_1_PAYLD = S_SC_B_payld[11:0];
  assign S_SC_B_1_REQ = S_SC_B_req[0];
  assign S_SC_B_1_SEND = S_SC_B_send[0];
  assign S_SC_B_recv[0] = S_SC_B_1_RECV;
  assign S_SC_R_1_INFO = S_SC_R_info[0];
  assign S_SC_R_1_PAYLD = S_SC_R_payld[89:0];
  assign S_SC_R_1_REQ = S_SC_R_req[0];
  assign S_SC_R_1_SEND = S_SC_R_send[0];
  assign S_SC_R_recv[0] = S_SC_R_1_RECV;
  assign S_SC_W_1_INFO = S_SC_W_info[3:0];
  assign S_SC_W_1_PAYLD = S_SC_W_payld[94:0];
  assign S_SC_W_1_REQ = S_SC_W_req[3:0];
  assign S_SC_W_1_SEND = S_SC_W_send[3:0];
  assign S_SC_W_recv[3:0] = S_SC_W_1_RECV;
  assign m05_ar_node_M_SC_RECV = M_SC_AR_recv[0];
  assign m05_aw_node_M_SC_RECV = M_SC_AW_recv[0];
  assign m05_b_node_M_SC_RECV = M_SC_B_recv[3:0];
  assign m05_r_node_M_SC_RECV = M_SC_R_recv[3:0];
  assign m05_w_node_M_SC_RECV = M_SC_W_recv[0];
  assign m_axi_aclk_1 = m_axi_aclk;
  assign m_axi_aresetn_1 = m_axi_aresetn;
  assign s_axi_aclk_1 = s_axi_aclk;
  assign s_axi_aresetn_1 = s_axi_aresetn;
  bd_63e1_m05arn_0 m05_ar_node
       (.m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m05_ar_node_M_SC_INFO),
        .m_sc_payld(m05_ar_node_M_SC_PAYLD),
        .m_sc_recv(m05_ar_node_M_SC_RECV),
        .m_sc_req(m05_ar_node_M_SC_REQ),
        .m_sc_send(m05_ar_node_M_SC_SEND),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_AR_1_INFO),
        .s_sc_payld(S_SC_AR_1_PAYLD),
        .s_sc_recv(S_SC_AR_1_RECV),
        .s_sc_req(S_SC_AR_1_REQ),
        .s_sc_send(S_SC_AR_1_SEND));
  bd_63e1_m05awn_0 m05_aw_node
       (.m_axis_arb_tdata(m05_aw_node_M_AXIS_ARB_TDATA),
        .m_axis_arb_tready(m05_aw_node_M_AXIS_ARB_TREADY),
        .m_axis_arb_tvalid(m05_aw_node_M_AXIS_ARB_TVALID),
        .m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m05_aw_node_M_SC_INFO),
        .m_sc_payld(m05_aw_node_M_SC_PAYLD),
        .m_sc_recv(m05_aw_node_M_SC_RECV),
        .m_sc_req(m05_aw_node_M_SC_REQ),
        .m_sc_send(m05_aw_node_M_SC_SEND),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_AW_1_INFO),
        .s_sc_payld(S_SC_AW_1_PAYLD),
        .s_sc_recv(S_SC_AW_1_RECV),
        .s_sc_req(S_SC_AW_1_REQ),
        .s_sc_send(S_SC_AW_1_SEND));
  bd_63e1_m05bn_0 m05_b_node
       (.m_sc_aclk(s_axi_aclk_1),
        .m_sc_aresetn(s_axi_aresetn_1),
        .m_sc_info(m05_b_node_M_SC_INFO),
        .m_sc_payld(m05_b_node_M_SC_PAYLD),
        .m_sc_recv(m05_b_node_M_SC_RECV),
        .m_sc_req(m05_b_node_M_SC_REQ),
        .m_sc_send(m05_b_node_M_SC_SEND),
        .s_sc_aclk(m_axi_aclk_1),
        .s_sc_aresetn(m_axi_aresetn_1),
        .s_sc_info(S_SC_B_1_INFO),
        .s_sc_payld(S_SC_B_1_PAYLD),
        .s_sc_recv(S_SC_B_1_RECV),
        .s_sc_req(S_SC_B_1_REQ),
        .s_sc_send(S_SC_B_1_SEND));
  bd_63e1_m05rn_0 m05_r_node
       (.m_sc_aclk(s_axi_aclk_1),
        .m_sc_aresetn(s_axi_aresetn_1),
        .m_sc_info(m05_r_node_M_SC_INFO),
        .m_sc_payld(m05_r_node_M_SC_PAYLD),
        .m_sc_recv(m05_r_node_M_SC_RECV),
        .m_sc_req(m05_r_node_M_SC_REQ),
        .m_sc_send(m05_r_node_M_SC_SEND),
        .s_sc_aclk(m_axi_aclk_1),
        .s_sc_aresetn(m_axi_aresetn_1),
        .s_sc_info(S_SC_R_1_INFO),
        .s_sc_payld(S_SC_R_1_PAYLD),
        .s_sc_recv(S_SC_R_1_RECV),
        .s_sc_req(S_SC_R_1_REQ),
        .s_sc_send(S_SC_R_1_SEND));
  bd_63e1_m05wn_0 m05_w_node
       (.m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m05_w_node_M_SC_INFO),
        .m_sc_payld(m05_w_node_M_SC_PAYLD),
        .m_sc_recv(m05_w_node_M_SC_RECV),
        .m_sc_req(m05_w_node_M_SC_REQ),
        .m_sc_send(m05_w_node_M_SC_SEND),
        .s_axis_arb_tdata(m05_aw_node_M_AXIS_ARB_TDATA),
        .s_axis_arb_tready(m05_aw_node_M_AXIS_ARB_TREADY),
        .s_axis_arb_tvalid(m05_aw_node_M_AXIS_ARB_TVALID),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_W_1_INFO),
        .s_sc_payld(S_SC_W_1_PAYLD),
        .s_sc_recv(S_SC_W_1_RECV),
        .s_sc_req(S_SC_W_1_REQ),
        .s_sc_send(S_SC_W_1_SEND));
endmodule

module m06_exit_pipeline_imp_7PYV65
   (aclk,
    aresetn,
    m_axi_araddr,
    m_axi_arprot,
    m_axi_arready,
    m_axi_arvalid,
    m_axi_awaddr,
    m_axi_awprot,
    m_axi_awready,
    m_axi_awvalid,
    m_axi_bready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_rdata,
    m_axi_rready,
    m_axi_rresp,
    m_axi_rvalid,
    m_axi_wdata,
    m_axi_wready,
    m_axi_wstrb,
    m_axi_wvalid,
    s_axi_araddr,
    s_axi_arcache,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arlock,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arready,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_awaddr,
    s_axi_awcache,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awlock,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awready,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_bid,
    s_axi_bready,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_rdata,
    s_axi_rid,
    s_axi_rlast,
    s_axi_rready,
    s_axi_rresp,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_wdata,
    s_axi_wlast,
    s_axi_wready,
    s_axi_wstrb,
    s_axi_wuser,
    s_axi_wvalid);
  input aclk;
  input aresetn;
  output [4:0]m_axi_araddr;
  output [2:0]m_axi_arprot;
  input m_axi_arready;
  output m_axi_arvalid;
  output [4:0]m_axi_awaddr;
  output [2:0]m_axi_awprot;
  input m_axi_awready;
  output m_axi_awvalid;
  output m_axi_bready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  input [31:0]m_axi_rdata;
  output m_axi_rready;
  input [1:0]m_axi_rresp;
  input m_axi_rvalid;
  output [31:0]m_axi_wdata;
  input m_axi_wready;
  output [3:0]m_axi_wstrb;
  output m_axi_wvalid;
  input [4:0]s_axi_araddr;
  input [3:0]s_axi_arcache;
  input [4:0]s_axi_arid;
  input [7:0]s_axi_arlen;
  input [0:0]s_axi_arlock;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  output s_axi_arready;
  input [1023:0]s_axi_aruser;
  input s_axi_arvalid;
  input [4:0]s_axi_awaddr;
  input [3:0]s_axi_awcache;
  input [4:0]s_axi_awid;
  input [7:0]s_axi_awlen;
  input [0:0]s_axi_awlock;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  output s_axi_awready;
  input [1023:0]s_axi_awuser;
  input s_axi_awvalid;
  output [4:0]s_axi_bid;
  input s_axi_bready;
  output [1:0]s_axi_bresp;
  output [1023:0]s_axi_buser;
  output s_axi_bvalid;
  output [31:0]s_axi_rdata;
  output [4:0]s_axi_rid;
  output s_axi_rlast;
  input s_axi_rready;
  output [1:0]s_axi_rresp;
  output [1023:0]s_axi_ruser;
  output s_axi_rvalid;
  input [31:0]s_axi_wdata;
  input s_axi_wlast;
  output s_axi_wready;
  input [3:0]s_axi_wstrb;
  input [1023:0]s_axi_wuser;
  input s_axi_wvalid;

  wire aclk_1;
  wire aresetn_1;
  wire [4:0]m06_exit_M_AXI_ARADDR;
  wire [2:0]m06_exit_M_AXI_ARPROT;
  wire m06_exit_M_AXI_ARREADY;
  wire m06_exit_M_AXI_ARVALID;
  wire [4:0]m06_exit_M_AXI_AWADDR;
  wire [2:0]m06_exit_M_AXI_AWPROT;
  wire m06_exit_M_AXI_AWREADY;
  wire m06_exit_M_AXI_AWVALID;
  wire m06_exit_M_AXI_BREADY;
  wire [1:0]m06_exit_M_AXI_BRESP;
  wire m06_exit_M_AXI_BVALID;
  wire [31:0]m06_exit_M_AXI_RDATA;
  wire m06_exit_M_AXI_RREADY;
  wire [1:0]m06_exit_M_AXI_RRESP;
  wire m06_exit_M_AXI_RVALID;
  wire [31:0]m06_exit_M_AXI_WDATA;
  wire m06_exit_M_AXI_WREADY;
  wire [3:0]m06_exit_M_AXI_WSTRB;
  wire m06_exit_M_AXI_WVALID;
  wire [4:0]s_axi_1_ARADDR;
  wire [3:0]s_axi_1_ARCACHE;
  wire [4:0]s_axi_1_ARID;
  wire [7:0]s_axi_1_ARLEN;
  wire [0:0]s_axi_1_ARLOCK;
  wire [2:0]s_axi_1_ARPROT;
  wire [3:0]s_axi_1_ARQOS;
  wire s_axi_1_ARREADY;
  wire [1023:0]s_axi_1_ARUSER;
  wire s_axi_1_ARVALID;
  wire [4:0]s_axi_1_AWADDR;
  wire [3:0]s_axi_1_AWCACHE;
  wire [4:0]s_axi_1_AWID;
  wire [7:0]s_axi_1_AWLEN;
  wire [0:0]s_axi_1_AWLOCK;
  wire [2:0]s_axi_1_AWPROT;
  wire [3:0]s_axi_1_AWQOS;
  wire s_axi_1_AWREADY;
  wire [1023:0]s_axi_1_AWUSER;
  wire s_axi_1_AWVALID;
  wire [4:0]s_axi_1_BID;
  wire s_axi_1_BREADY;
  wire [1:0]s_axi_1_BRESP;
  wire [1023:0]s_axi_1_BUSER;
  wire s_axi_1_BVALID;
  wire [31:0]s_axi_1_RDATA;
  wire [4:0]s_axi_1_RID;
  wire s_axi_1_RLAST;
  wire s_axi_1_RREADY;
  wire [1:0]s_axi_1_RRESP;
  wire [1023:0]s_axi_1_RUSER;
  wire s_axi_1_RVALID;
  wire [31:0]s_axi_1_WDATA;
  wire s_axi_1_WLAST;
  wire s_axi_1_WREADY;
  wire [3:0]s_axi_1_WSTRB;
  wire [1023:0]s_axi_1_WUSER;
  wire s_axi_1_WVALID;

  assign aclk_1 = aclk;
  assign aresetn_1 = aresetn;
  assign m06_exit_M_AXI_ARREADY = m_axi_arready;
  assign m06_exit_M_AXI_AWREADY = m_axi_awready;
  assign m06_exit_M_AXI_BRESP = m_axi_bresp[1:0];
  assign m06_exit_M_AXI_BVALID = m_axi_bvalid;
  assign m06_exit_M_AXI_RDATA = m_axi_rdata[31:0];
  assign m06_exit_M_AXI_RRESP = m_axi_rresp[1:0];
  assign m06_exit_M_AXI_RVALID = m_axi_rvalid;
  assign m06_exit_M_AXI_WREADY = m_axi_wready;
  assign m_axi_araddr[4:0] = m06_exit_M_AXI_ARADDR;
  assign m_axi_arprot[2:0] = m06_exit_M_AXI_ARPROT;
  assign m_axi_arvalid = m06_exit_M_AXI_ARVALID;
  assign m_axi_awaddr[4:0] = m06_exit_M_AXI_AWADDR;
  assign m_axi_awprot[2:0] = m06_exit_M_AXI_AWPROT;
  assign m_axi_awvalid = m06_exit_M_AXI_AWVALID;
  assign m_axi_bready = m06_exit_M_AXI_BREADY;
  assign m_axi_rready = m06_exit_M_AXI_RREADY;
  assign m_axi_wdata[31:0] = m06_exit_M_AXI_WDATA;
  assign m_axi_wstrb[3:0] = m06_exit_M_AXI_WSTRB;
  assign m_axi_wvalid = m06_exit_M_AXI_WVALID;
  assign s_axi_1_ARADDR = s_axi_araddr[4:0];
  assign s_axi_1_ARCACHE = s_axi_arcache[3:0];
  assign s_axi_1_ARID = s_axi_arid[4:0];
  assign s_axi_1_ARLEN = s_axi_arlen[7:0];
  assign s_axi_1_ARLOCK = s_axi_arlock[0];
  assign s_axi_1_ARPROT = s_axi_arprot[2:0];
  assign s_axi_1_ARQOS = s_axi_arqos[3:0];
  assign s_axi_1_ARUSER = s_axi_aruser[1023:0];
  assign s_axi_1_ARVALID = s_axi_arvalid;
  assign s_axi_1_AWADDR = s_axi_awaddr[4:0];
  assign s_axi_1_AWCACHE = s_axi_awcache[3:0];
  assign s_axi_1_AWID = s_axi_awid[4:0];
  assign s_axi_1_AWLEN = s_axi_awlen[7:0];
  assign s_axi_1_AWLOCK = s_axi_awlock[0];
  assign s_axi_1_AWPROT = s_axi_awprot[2:0];
  assign s_axi_1_AWQOS = s_axi_awqos[3:0];
  assign s_axi_1_AWUSER = s_axi_awuser[1023:0];
  assign s_axi_1_AWVALID = s_axi_awvalid;
  assign s_axi_1_BREADY = s_axi_bready;
  assign s_axi_1_RREADY = s_axi_rready;
  assign s_axi_1_WDATA = s_axi_wdata[31:0];
  assign s_axi_1_WLAST = s_axi_wlast;
  assign s_axi_1_WSTRB = s_axi_wstrb[3:0];
  assign s_axi_1_WUSER = s_axi_wuser[1023:0];
  assign s_axi_1_WVALID = s_axi_wvalid;
  assign s_axi_arready = s_axi_1_ARREADY;
  assign s_axi_awready = s_axi_1_AWREADY;
  assign s_axi_bid[4:0] = s_axi_1_BID;
  assign s_axi_bresp[1:0] = s_axi_1_BRESP;
  assign s_axi_buser[1023:0] = s_axi_1_BUSER;
  assign s_axi_bvalid = s_axi_1_BVALID;
  assign s_axi_rdata[31:0] = s_axi_1_RDATA;
  assign s_axi_rid[4:0] = s_axi_1_RID;
  assign s_axi_rlast = s_axi_1_RLAST;
  assign s_axi_rresp[1:0] = s_axi_1_RRESP;
  assign s_axi_ruser[1023:0] = s_axi_1_RUSER;
  assign s_axi_rvalid = s_axi_1_RVALID;
  assign s_axi_wready = s_axi_1_WREADY;
  bd_63e1_m06e_0 m06_exit
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_araddr(m06_exit_M_AXI_ARADDR),
        .m_axi_arprot(m06_exit_M_AXI_ARPROT),
        .m_axi_arready(m06_exit_M_AXI_ARREADY),
        .m_axi_arvalid(m06_exit_M_AXI_ARVALID),
        .m_axi_awaddr(m06_exit_M_AXI_AWADDR),
        .m_axi_awprot(m06_exit_M_AXI_AWPROT),
        .m_axi_awready(m06_exit_M_AXI_AWREADY),
        .m_axi_awvalid(m06_exit_M_AXI_AWVALID),
        .m_axi_bready(m06_exit_M_AXI_BREADY),
        .m_axi_bresp(m06_exit_M_AXI_BRESP),
        .m_axi_bvalid(m06_exit_M_AXI_BVALID),
        .m_axi_rdata(m06_exit_M_AXI_RDATA),
        .m_axi_rready(m06_exit_M_AXI_RREADY),
        .m_axi_rresp(m06_exit_M_AXI_RRESP),
        .m_axi_rvalid(m06_exit_M_AXI_RVALID),
        .m_axi_wdata(m06_exit_M_AXI_WDATA),
        .m_axi_wready(m06_exit_M_AXI_WREADY),
        .m_axi_wstrb(m06_exit_M_AXI_WSTRB),
        .m_axi_wvalid(m06_exit_M_AXI_WVALID),
        .s_axi_araddr(s_axi_1_ARADDR),
        .s_axi_arcache(s_axi_1_ARCACHE),
        .s_axi_arid(s_axi_1_ARID),
        .s_axi_arlen(s_axi_1_ARLEN),
        .s_axi_arlock(s_axi_1_ARLOCK),
        .s_axi_arprot(s_axi_1_ARPROT),
        .s_axi_arqos(s_axi_1_ARQOS),
        .s_axi_arready(s_axi_1_ARREADY),
        .s_axi_aruser(s_axi_1_ARUSER),
        .s_axi_arvalid(s_axi_1_ARVALID),
        .s_axi_awaddr(s_axi_1_AWADDR),
        .s_axi_awcache(s_axi_1_AWCACHE),
        .s_axi_awid(s_axi_1_AWID),
        .s_axi_awlen(s_axi_1_AWLEN),
        .s_axi_awlock(s_axi_1_AWLOCK),
        .s_axi_awprot(s_axi_1_AWPROT),
        .s_axi_awqos(s_axi_1_AWQOS),
        .s_axi_awready(s_axi_1_AWREADY),
        .s_axi_awuser(s_axi_1_AWUSER),
        .s_axi_awvalid(s_axi_1_AWVALID),
        .s_axi_bid(s_axi_1_BID),
        .s_axi_bready(s_axi_1_BREADY),
        .s_axi_bresp(s_axi_1_BRESP),
        .s_axi_buser(s_axi_1_BUSER),
        .s_axi_bvalid(s_axi_1_BVALID),
        .s_axi_rdata(s_axi_1_RDATA),
        .s_axi_rid(s_axi_1_RID),
        .s_axi_rlast(s_axi_1_RLAST),
        .s_axi_rready(s_axi_1_RREADY),
        .s_axi_rresp(s_axi_1_RRESP),
        .s_axi_ruser(s_axi_1_RUSER),
        .s_axi_rvalid(s_axi_1_RVALID),
        .s_axi_wdata(s_axi_1_WDATA),
        .s_axi_wlast(s_axi_1_WLAST),
        .s_axi_wready(s_axi_1_WREADY),
        .s_axi_wstrb(s_axi_1_WSTRB),
        .s_axi_wuser(s_axi_1_WUSER),
        .s_axi_wvalid(s_axi_1_WVALID));
endmodule

module m06_nodes_imp_1HS18WN
   (M_SC_AR_info,
    M_SC_AR_payld,
    M_SC_AR_recv,
    M_SC_AR_req,
    M_SC_AR_send,
    M_SC_AW_info,
    M_SC_AW_payld,
    M_SC_AW_recv,
    M_SC_AW_req,
    M_SC_AW_send,
    M_SC_B_info,
    M_SC_B_payld,
    M_SC_B_recv,
    M_SC_B_req,
    M_SC_B_send,
    M_SC_R_info,
    M_SC_R_payld,
    M_SC_R_recv,
    M_SC_R_req,
    M_SC_R_send,
    M_SC_W_info,
    M_SC_W_payld,
    M_SC_W_recv,
    M_SC_W_req,
    M_SC_W_send,
    S_SC_AR_info,
    S_SC_AR_payld,
    S_SC_AR_recv,
    S_SC_AR_req,
    S_SC_AR_send,
    S_SC_AW_info,
    S_SC_AW_payld,
    S_SC_AW_recv,
    S_SC_AW_req,
    S_SC_AW_send,
    S_SC_B_info,
    S_SC_B_payld,
    S_SC_B_recv,
    S_SC_B_req,
    S_SC_B_send,
    S_SC_R_info,
    S_SC_R_payld,
    S_SC_R_recv,
    S_SC_R_req,
    S_SC_R_send,
    S_SC_W_info,
    S_SC_W_payld,
    S_SC_W_recv,
    S_SC_W_req,
    S_SC_W_send,
    m_axi_aclk,
    m_axi_aresetn,
    s_axi_aclk,
    s_axi_aresetn);
  output [0:0]M_SC_AR_info;
  output [155:0]M_SC_AR_payld;
  input [0:0]M_SC_AR_recv;
  output [0:0]M_SC_AR_req;
  output [0:0]M_SC_AR_send;
  output [0:0]M_SC_AW_info;
  output [155:0]M_SC_AW_payld;
  input [0:0]M_SC_AW_recv;
  output [0:0]M_SC_AW_req;
  output [0:0]M_SC_AW_send;
  output [3:0]M_SC_B_info;
  output [11:0]M_SC_B_payld;
  input [3:0]M_SC_B_recv;
  output [3:0]M_SC_B_req;
  output [3:0]M_SC_B_send;
  output [3:0]M_SC_R_info;
  output [89:0]M_SC_R_payld;
  input [3:0]M_SC_R_recv;
  output [3:0]M_SC_R_req;
  output [3:0]M_SC_R_send;
  output [0:0]M_SC_W_info;
  output [94:0]M_SC_W_payld;
  input [0:0]M_SC_W_recv;
  output [0:0]M_SC_W_req;
  output [0:0]M_SC_W_send;
  input [3:0]S_SC_AR_info;
  input [155:0]S_SC_AR_payld;
  output [3:0]S_SC_AR_recv;
  input [3:0]S_SC_AR_req;
  input [3:0]S_SC_AR_send;
  input [3:0]S_SC_AW_info;
  input [155:0]S_SC_AW_payld;
  output [3:0]S_SC_AW_recv;
  input [3:0]S_SC_AW_req;
  input [3:0]S_SC_AW_send;
  input [0:0]S_SC_B_info;
  input [11:0]S_SC_B_payld;
  output [0:0]S_SC_B_recv;
  input [0:0]S_SC_B_req;
  input [0:0]S_SC_B_send;
  input [0:0]S_SC_R_info;
  input [89:0]S_SC_R_payld;
  output [0:0]S_SC_R_recv;
  input [0:0]S_SC_R_req;
  input [0:0]S_SC_R_send;
  input [3:0]S_SC_W_info;
  input [94:0]S_SC_W_payld;
  output [3:0]S_SC_W_recv;
  input [3:0]S_SC_W_req;
  input [3:0]S_SC_W_send;
  input m_axi_aclk;
  input m_axi_aresetn;
  input s_axi_aclk;
  input s_axi_aresetn;

  wire [3:0]S_SC_AR_1_INFO;
  wire [155:0]S_SC_AR_1_PAYLD;
  wire [3:0]S_SC_AR_1_RECV;
  wire [3:0]S_SC_AR_1_REQ;
  wire [3:0]S_SC_AR_1_SEND;
  wire [3:0]S_SC_AW_1_INFO;
  wire [155:0]S_SC_AW_1_PAYLD;
  wire [3:0]S_SC_AW_1_RECV;
  wire [3:0]S_SC_AW_1_REQ;
  wire [3:0]S_SC_AW_1_SEND;
  wire [0:0]S_SC_B_1_INFO;
  wire [11:0]S_SC_B_1_PAYLD;
  wire [0:0]S_SC_B_1_RECV;
  wire [0:0]S_SC_B_1_REQ;
  wire [0:0]S_SC_B_1_SEND;
  wire [0:0]S_SC_R_1_INFO;
  wire [89:0]S_SC_R_1_PAYLD;
  wire [0:0]S_SC_R_1_RECV;
  wire [0:0]S_SC_R_1_REQ;
  wire [0:0]S_SC_R_1_SEND;
  wire [3:0]S_SC_W_1_INFO;
  wire [94:0]S_SC_W_1_PAYLD;
  wire [3:0]S_SC_W_1_RECV;
  wire [3:0]S_SC_W_1_REQ;
  wire [3:0]S_SC_W_1_SEND;
  wire [0:0]m06_ar_node_M_SC_INFO;
  wire [155:0]m06_ar_node_M_SC_PAYLD;
  wire [0:0]m06_ar_node_M_SC_RECV;
  wire [0:0]m06_ar_node_M_SC_REQ;
  wire [0:0]m06_ar_node_M_SC_SEND;
  wire [15:0]m06_aw_node_M_AXIS_ARB_TDATA;
  wire m06_aw_node_M_AXIS_ARB_TREADY;
  wire m06_aw_node_M_AXIS_ARB_TVALID;
  wire [0:0]m06_aw_node_M_SC_INFO;
  wire [155:0]m06_aw_node_M_SC_PAYLD;
  wire [0:0]m06_aw_node_M_SC_RECV;
  wire [0:0]m06_aw_node_M_SC_REQ;
  wire [0:0]m06_aw_node_M_SC_SEND;
  wire [3:0]m06_b_node_M_SC_INFO;
  wire [11:0]m06_b_node_M_SC_PAYLD;
  wire [3:0]m06_b_node_M_SC_RECV;
  wire [3:0]m06_b_node_M_SC_REQ;
  wire [3:0]m06_b_node_M_SC_SEND;
  wire [3:0]m06_r_node_M_SC_INFO;
  wire [89:0]m06_r_node_M_SC_PAYLD;
  wire [3:0]m06_r_node_M_SC_RECV;
  wire [3:0]m06_r_node_M_SC_REQ;
  wire [3:0]m06_r_node_M_SC_SEND;
  wire [0:0]m06_w_node_M_SC_INFO;
  wire [94:0]m06_w_node_M_SC_PAYLD;
  wire [0:0]m06_w_node_M_SC_RECV;
  wire [0:0]m06_w_node_M_SC_REQ;
  wire [0:0]m06_w_node_M_SC_SEND;
  wire m_axi_aclk_1;
  wire m_axi_aresetn_1;
  wire s_axi_aclk_1;
  wire s_axi_aresetn_1;

  assign M_SC_AR_info[0] = m06_ar_node_M_SC_INFO;
  assign M_SC_AR_payld[155:0] = m06_ar_node_M_SC_PAYLD;
  assign M_SC_AR_req[0] = m06_ar_node_M_SC_REQ;
  assign M_SC_AR_send[0] = m06_ar_node_M_SC_SEND;
  assign M_SC_AW_info[0] = m06_aw_node_M_SC_INFO;
  assign M_SC_AW_payld[155:0] = m06_aw_node_M_SC_PAYLD;
  assign M_SC_AW_req[0] = m06_aw_node_M_SC_REQ;
  assign M_SC_AW_send[0] = m06_aw_node_M_SC_SEND;
  assign M_SC_B_info[3:0] = m06_b_node_M_SC_INFO;
  assign M_SC_B_payld[11:0] = m06_b_node_M_SC_PAYLD;
  assign M_SC_B_req[3:0] = m06_b_node_M_SC_REQ;
  assign M_SC_B_send[3:0] = m06_b_node_M_SC_SEND;
  assign M_SC_R_info[3:0] = m06_r_node_M_SC_INFO;
  assign M_SC_R_payld[89:0] = m06_r_node_M_SC_PAYLD;
  assign M_SC_R_req[3:0] = m06_r_node_M_SC_REQ;
  assign M_SC_R_send[3:0] = m06_r_node_M_SC_SEND;
  assign M_SC_W_info[0] = m06_w_node_M_SC_INFO;
  assign M_SC_W_payld[94:0] = m06_w_node_M_SC_PAYLD;
  assign M_SC_W_req[0] = m06_w_node_M_SC_REQ;
  assign M_SC_W_send[0] = m06_w_node_M_SC_SEND;
  assign S_SC_AR_1_INFO = S_SC_AR_info[3:0];
  assign S_SC_AR_1_PAYLD = S_SC_AR_payld[155:0];
  assign S_SC_AR_1_REQ = S_SC_AR_req[3:0];
  assign S_SC_AR_1_SEND = S_SC_AR_send[3:0];
  assign S_SC_AR_recv[3:0] = S_SC_AR_1_RECV;
  assign S_SC_AW_1_INFO = S_SC_AW_info[3:0];
  assign S_SC_AW_1_PAYLD = S_SC_AW_payld[155:0];
  assign S_SC_AW_1_REQ = S_SC_AW_req[3:0];
  assign S_SC_AW_1_SEND = S_SC_AW_send[3:0];
  assign S_SC_AW_recv[3:0] = S_SC_AW_1_RECV;
  assign S_SC_B_1_INFO = S_SC_B_info[0];
  assign S_SC_B_1_PAYLD = S_SC_B_payld[11:0];
  assign S_SC_B_1_REQ = S_SC_B_req[0];
  assign S_SC_B_1_SEND = S_SC_B_send[0];
  assign S_SC_B_recv[0] = S_SC_B_1_RECV;
  assign S_SC_R_1_INFO = S_SC_R_info[0];
  assign S_SC_R_1_PAYLD = S_SC_R_payld[89:0];
  assign S_SC_R_1_REQ = S_SC_R_req[0];
  assign S_SC_R_1_SEND = S_SC_R_send[0];
  assign S_SC_R_recv[0] = S_SC_R_1_RECV;
  assign S_SC_W_1_INFO = S_SC_W_info[3:0];
  assign S_SC_W_1_PAYLD = S_SC_W_payld[94:0];
  assign S_SC_W_1_REQ = S_SC_W_req[3:0];
  assign S_SC_W_1_SEND = S_SC_W_send[3:0];
  assign S_SC_W_recv[3:0] = S_SC_W_1_RECV;
  assign m06_ar_node_M_SC_RECV = M_SC_AR_recv[0];
  assign m06_aw_node_M_SC_RECV = M_SC_AW_recv[0];
  assign m06_b_node_M_SC_RECV = M_SC_B_recv[3:0];
  assign m06_r_node_M_SC_RECV = M_SC_R_recv[3:0];
  assign m06_w_node_M_SC_RECV = M_SC_W_recv[0];
  assign m_axi_aclk_1 = m_axi_aclk;
  assign m_axi_aresetn_1 = m_axi_aresetn;
  assign s_axi_aclk_1 = s_axi_aclk;
  assign s_axi_aresetn_1 = s_axi_aresetn;
  bd_63e1_m06arn_0 m06_ar_node
       (.m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m06_ar_node_M_SC_INFO),
        .m_sc_payld(m06_ar_node_M_SC_PAYLD),
        .m_sc_recv(m06_ar_node_M_SC_RECV),
        .m_sc_req(m06_ar_node_M_SC_REQ),
        .m_sc_send(m06_ar_node_M_SC_SEND),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_AR_1_INFO),
        .s_sc_payld(S_SC_AR_1_PAYLD),
        .s_sc_recv(S_SC_AR_1_RECV),
        .s_sc_req(S_SC_AR_1_REQ),
        .s_sc_send(S_SC_AR_1_SEND));
  bd_63e1_m06awn_0 m06_aw_node
       (.m_axis_arb_tdata(m06_aw_node_M_AXIS_ARB_TDATA),
        .m_axis_arb_tready(m06_aw_node_M_AXIS_ARB_TREADY),
        .m_axis_arb_tvalid(m06_aw_node_M_AXIS_ARB_TVALID),
        .m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m06_aw_node_M_SC_INFO),
        .m_sc_payld(m06_aw_node_M_SC_PAYLD),
        .m_sc_recv(m06_aw_node_M_SC_RECV),
        .m_sc_req(m06_aw_node_M_SC_REQ),
        .m_sc_send(m06_aw_node_M_SC_SEND),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_AW_1_INFO),
        .s_sc_payld(S_SC_AW_1_PAYLD),
        .s_sc_recv(S_SC_AW_1_RECV),
        .s_sc_req(S_SC_AW_1_REQ),
        .s_sc_send(S_SC_AW_1_SEND));
  bd_63e1_m06bn_0 m06_b_node
       (.m_sc_aclk(s_axi_aclk_1),
        .m_sc_aresetn(s_axi_aresetn_1),
        .m_sc_info(m06_b_node_M_SC_INFO),
        .m_sc_payld(m06_b_node_M_SC_PAYLD),
        .m_sc_recv(m06_b_node_M_SC_RECV),
        .m_sc_req(m06_b_node_M_SC_REQ),
        .m_sc_send(m06_b_node_M_SC_SEND),
        .s_sc_aclk(m_axi_aclk_1),
        .s_sc_aresetn(m_axi_aresetn_1),
        .s_sc_info(S_SC_B_1_INFO),
        .s_sc_payld(S_SC_B_1_PAYLD),
        .s_sc_recv(S_SC_B_1_RECV),
        .s_sc_req(S_SC_B_1_REQ),
        .s_sc_send(S_SC_B_1_SEND));
  bd_63e1_m06rn_0 m06_r_node
       (.m_sc_aclk(s_axi_aclk_1),
        .m_sc_aresetn(s_axi_aresetn_1),
        .m_sc_info(m06_r_node_M_SC_INFO),
        .m_sc_payld(m06_r_node_M_SC_PAYLD),
        .m_sc_recv(m06_r_node_M_SC_RECV),
        .m_sc_req(m06_r_node_M_SC_REQ),
        .m_sc_send(m06_r_node_M_SC_SEND),
        .s_sc_aclk(m_axi_aclk_1),
        .s_sc_aresetn(m_axi_aresetn_1),
        .s_sc_info(S_SC_R_1_INFO),
        .s_sc_payld(S_SC_R_1_PAYLD),
        .s_sc_recv(S_SC_R_1_RECV),
        .s_sc_req(S_SC_R_1_REQ),
        .s_sc_send(S_SC_R_1_SEND));
  bd_63e1_m06wn_0 m06_w_node
       (.m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m06_w_node_M_SC_INFO),
        .m_sc_payld(m06_w_node_M_SC_PAYLD),
        .m_sc_recv(m06_w_node_M_SC_RECV),
        .m_sc_req(m06_w_node_M_SC_REQ),
        .m_sc_send(m06_w_node_M_SC_SEND),
        .s_axis_arb_tdata(m06_aw_node_M_AXIS_ARB_TDATA),
        .s_axis_arb_tready(m06_aw_node_M_AXIS_ARB_TREADY),
        .s_axis_arb_tvalid(m06_aw_node_M_AXIS_ARB_TVALID),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_W_1_INFO),
        .s_sc_payld(S_SC_W_1_PAYLD),
        .s_sc_recv(S_SC_W_1_RECV),
        .s_sc_req(S_SC_W_1_REQ),
        .s_sc_send(S_SC_W_1_SEND));
endmodule

module m07_exit_pipeline_imp_3LPND9
   (aclk,
    aresetn,
    m_axi_araddr,
    m_axi_arprot,
    m_axi_arready,
    m_axi_arvalid,
    m_axi_awaddr,
    m_axi_awprot,
    m_axi_awready,
    m_axi_awvalid,
    m_axi_bready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_rdata,
    m_axi_rready,
    m_axi_rresp,
    m_axi_rvalid,
    m_axi_wdata,
    m_axi_wready,
    m_axi_wstrb,
    m_axi_wvalid,
    s_axi_araddr,
    s_axi_arcache,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arlock,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arready,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_awaddr,
    s_axi_awcache,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awlock,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awready,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_bid,
    s_axi_bready,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_rdata,
    s_axi_rid,
    s_axi_rlast,
    s_axi_rready,
    s_axi_rresp,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_wdata,
    s_axi_wlast,
    s_axi_wready,
    s_axi_wstrb,
    s_axi_wuser,
    s_axi_wvalid);
  input aclk;
  input aresetn;
  output [12:0]m_axi_araddr;
  output [2:0]m_axi_arprot;
  input m_axi_arready;
  output m_axi_arvalid;
  output [12:0]m_axi_awaddr;
  output [2:0]m_axi_awprot;
  input m_axi_awready;
  output m_axi_awvalid;
  output m_axi_bready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  input [31:0]m_axi_rdata;
  output m_axi_rready;
  input [1:0]m_axi_rresp;
  input m_axi_rvalid;
  output [31:0]m_axi_wdata;
  input m_axi_wready;
  output [3:0]m_axi_wstrb;
  output m_axi_wvalid;
  input [12:0]s_axi_araddr;
  input [3:0]s_axi_arcache;
  input [4:0]s_axi_arid;
  input [7:0]s_axi_arlen;
  input [0:0]s_axi_arlock;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  output s_axi_arready;
  input [1023:0]s_axi_aruser;
  input s_axi_arvalid;
  input [12:0]s_axi_awaddr;
  input [3:0]s_axi_awcache;
  input [4:0]s_axi_awid;
  input [7:0]s_axi_awlen;
  input [0:0]s_axi_awlock;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  output s_axi_awready;
  input [1023:0]s_axi_awuser;
  input s_axi_awvalid;
  output [4:0]s_axi_bid;
  input s_axi_bready;
  output [1:0]s_axi_bresp;
  output [1023:0]s_axi_buser;
  output s_axi_bvalid;
  output [31:0]s_axi_rdata;
  output [4:0]s_axi_rid;
  output s_axi_rlast;
  input s_axi_rready;
  output [1:0]s_axi_rresp;
  output [1023:0]s_axi_ruser;
  output s_axi_rvalid;
  input [31:0]s_axi_wdata;
  input s_axi_wlast;
  output s_axi_wready;
  input [3:0]s_axi_wstrb;
  input [1023:0]s_axi_wuser;
  input s_axi_wvalid;

  wire aclk_1;
  wire aresetn_1;
  wire [12:0]m07_exit_M_AXI_ARADDR;
  wire [2:0]m07_exit_M_AXI_ARPROT;
  wire m07_exit_M_AXI_ARREADY;
  wire m07_exit_M_AXI_ARVALID;
  wire [12:0]m07_exit_M_AXI_AWADDR;
  wire [2:0]m07_exit_M_AXI_AWPROT;
  wire m07_exit_M_AXI_AWREADY;
  wire m07_exit_M_AXI_AWVALID;
  wire m07_exit_M_AXI_BREADY;
  wire [1:0]m07_exit_M_AXI_BRESP;
  wire m07_exit_M_AXI_BVALID;
  wire [31:0]m07_exit_M_AXI_RDATA;
  wire m07_exit_M_AXI_RREADY;
  wire [1:0]m07_exit_M_AXI_RRESP;
  wire m07_exit_M_AXI_RVALID;
  wire [31:0]m07_exit_M_AXI_WDATA;
  wire m07_exit_M_AXI_WREADY;
  wire [3:0]m07_exit_M_AXI_WSTRB;
  wire m07_exit_M_AXI_WVALID;
  wire [12:0]s_axi_1_ARADDR;
  wire [3:0]s_axi_1_ARCACHE;
  wire [4:0]s_axi_1_ARID;
  wire [7:0]s_axi_1_ARLEN;
  wire [0:0]s_axi_1_ARLOCK;
  wire [2:0]s_axi_1_ARPROT;
  wire [3:0]s_axi_1_ARQOS;
  wire s_axi_1_ARREADY;
  wire [1023:0]s_axi_1_ARUSER;
  wire s_axi_1_ARVALID;
  wire [12:0]s_axi_1_AWADDR;
  wire [3:0]s_axi_1_AWCACHE;
  wire [4:0]s_axi_1_AWID;
  wire [7:0]s_axi_1_AWLEN;
  wire [0:0]s_axi_1_AWLOCK;
  wire [2:0]s_axi_1_AWPROT;
  wire [3:0]s_axi_1_AWQOS;
  wire s_axi_1_AWREADY;
  wire [1023:0]s_axi_1_AWUSER;
  wire s_axi_1_AWVALID;
  wire [4:0]s_axi_1_BID;
  wire s_axi_1_BREADY;
  wire [1:0]s_axi_1_BRESP;
  wire [1023:0]s_axi_1_BUSER;
  wire s_axi_1_BVALID;
  wire [31:0]s_axi_1_RDATA;
  wire [4:0]s_axi_1_RID;
  wire s_axi_1_RLAST;
  wire s_axi_1_RREADY;
  wire [1:0]s_axi_1_RRESP;
  wire [1023:0]s_axi_1_RUSER;
  wire s_axi_1_RVALID;
  wire [31:0]s_axi_1_WDATA;
  wire s_axi_1_WLAST;
  wire s_axi_1_WREADY;
  wire [3:0]s_axi_1_WSTRB;
  wire [1023:0]s_axi_1_WUSER;
  wire s_axi_1_WVALID;

  assign aclk_1 = aclk;
  assign aresetn_1 = aresetn;
  assign m07_exit_M_AXI_ARREADY = m_axi_arready;
  assign m07_exit_M_AXI_AWREADY = m_axi_awready;
  assign m07_exit_M_AXI_BRESP = m_axi_bresp[1:0];
  assign m07_exit_M_AXI_BVALID = m_axi_bvalid;
  assign m07_exit_M_AXI_RDATA = m_axi_rdata[31:0];
  assign m07_exit_M_AXI_RRESP = m_axi_rresp[1:0];
  assign m07_exit_M_AXI_RVALID = m_axi_rvalid;
  assign m07_exit_M_AXI_WREADY = m_axi_wready;
  assign m_axi_araddr[12:0] = m07_exit_M_AXI_ARADDR;
  assign m_axi_arprot[2:0] = m07_exit_M_AXI_ARPROT;
  assign m_axi_arvalid = m07_exit_M_AXI_ARVALID;
  assign m_axi_awaddr[12:0] = m07_exit_M_AXI_AWADDR;
  assign m_axi_awprot[2:0] = m07_exit_M_AXI_AWPROT;
  assign m_axi_awvalid = m07_exit_M_AXI_AWVALID;
  assign m_axi_bready = m07_exit_M_AXI_BREADY;
  assign m_axi_rready = m07_exit_M_AXI_RREADY;
  assign m_axi_wdata[31:0] = m07_exit_M_AXI_WDATA;
  assign m_axi_wstrb[3:0] = m07_exit_M_AXI_WSTRB;
  assign m_axi_wvalid = m07_exit_M_AXI_WVALID;
  assign s_axi_1_ARADDR = s_axi_araddr[12:0];
  assign s_axi_1_ARCACHE = s_axi_arcache[3:0];
  assign s_axi_1_ARID = s_axi_arid[4:0];
  assign s_axi_1_ARLEN = s_axi_arlen[7:0];
  assign s_axi_1_ARLOCK = s_axi_arlock[0];
  assign s_axi_1_ARPROT = s_axi_arprot[2:0];
  assign s_axi_1_ARQOS = s_axi_arqos[3:0];
  assign s_axi_1_ARUSER = s_axi_aruser[1023:0];
  assign s_axi_1_ARVALID = s_axi_arvalid;
  assign s_axi_1_AWADDR = s_axi_awaddr[12:0];
  assign s_axi_1_AWCACHE = s_axi_awcache[3:0];
  assign s_axi_1_AWID = s_axi_awid[4:0];
  assign s_axi_1_AWLEN = s_axi_awlen[7:0];
  assign s_axi_1_AWLOCK = s_axi_awlock[0];
  assign s_axi_1_AWPROT = s_axi_awprot[2:0];
  assign s_axi_1_AWQOS = s_axi_awqos[3:0];
  assign s_axi_1_AWUSER = s_axi_awuser[1023:0];
  assign s_axi_1_AWVALID = s_axi_awvalid;
  assign s_axi_1_BREADY = s_axi_bready;
  assign s_axi_1_RREADY = s_axi_rready;
  assign s_axi_1_WDATA = s_axi_wdata[31:0];
  assign s_axi_1_WLAST = s_axi_wlast;
  assign s_axi_1_WSTRB = s_axi_wstrb[3:0];
  assign s_axi_1_WUSER = s_axi_wuser[1023:0];
  assign s_axi_1_WVALID = s_axi_wvalid;
  assign s_axi_arready = s_axi_1_ARREADY;
  assign s_axi_awready = s_axi_1_AWREADY;
  assign s_axi_bid[4:0] = s_axi_1_BID;
  assign s_axi_bresp[1:0] = s_axi_1_BRESP;
  assign s_axi_buser[1023:0] = s_axi_1_BUSER;
  assign s_axi_bvalid = s_axi_1_BVALID;
  assign s_axi_rdata[31:0] = s_axi_1_RDATA;
  assign s_axi_rid[4:0] = s_axi_1_RID;
  assign s_axi_rlast = s_axi_1_RLAST;
  assign s_axi_rresp[1:0] = s_axi_1_RRESP;
  assign s_axi_ruser[1023:0] = s_axi_1_RUSER;
  assign s_axi_rvalid = s_axi_1_RVALID;
  assign s_axi_wready = s_axi_1_WREADY;
  bd_63e1_m07e_0 m07_exit
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_araddr(m07_exit_M_AXI_ARADDR),
        .m_axi_arprot(m07_exit_M_AXI_ARPROT),
        .m_axi_arready(m07_exit_M_AXI_ARREADY),
        .m_axi_arvalid(m07_exit_M_AXI_ARVALID),
        .m_axi_awaddr(m07_exit_M_AXI_AWADDR),
        .m_axi_awprot(m07_exit_M_AXI_AWPROT),
        .m_axi_awready(m07_exit_M_AXI_AWREADY),
        .m_axi_awvalid(m07_exit_M_AXI_AWVALID),
        .m_axi_bready(m07_exit_M_AXI_BREADY),
        .m_axi_bresp(m07_exit_M_AXI_BRESP),
        .m_axi_bvalid(m07_exit_M_AXI_BVALID),
        .m_axi_rdata(m07_exit_M_AXI_RDATA),
        .m_axi_rready(m07_exit_M_AXI_RREADY),
        .m_axi_rresp(m07_exit_M_AXI_RRESP),
        .m_axi_rvalid(m07_exit_M_AXI_RVALID),
        .m_axi_wdata(m07_exit_M_AXI_WDATA),
        .m_axi_wready(m07_exit_M_AXI_WREADY),
        .m_axi_wstrb(m07_exit_M_AXI_WSTRB),
        .m_axi_wvalid(m07_exit_M_AXI_WVALID),
        .s_axi_araddr(s_axi_1_ARADDR),
        .s_axi_arcache(s_axi_1_ARCACHE),
        .s_axi_arid(s_axi_1_ARID),
        .s_axi_arlen(s_axi_1_ARLEN),
        .s_axi_arlock(s_axi_1_ARLOCK),
        .s_axi_arprot(s_axi_1_ARPROT),
        .s_axi_arqos(s_axi_1_ARQOS),
        .s_axi_arready(s_axi_1_ARREADY),
        .s_axi_aruser(s_axi_1_ARUSER),
        .s_axi_arvalid(s_axi_1_ARVALID),
        .s_axi_awaddr(s_axi_1_AWADDR),
        .s_axi_awcache(s_axi_1_AWCACHE),
        .s_axi_awid(s_axi_1_AWID),
        .s_axi_awlen(s_axi_1_AWLEN),
        .s_axi_awlock(s_axi_1_AWLOCK),
        .s_axi_awprot(s_axi_1_AWPROT),
        .s_axi_awqos(s_axi_1_AWQOS),
        .s_axi_awready(s_axi_1_AWREADY),
        .s_axi_awuser(s_axi_1_AWUSER),
        .s_axi_awvalid(s_axi_1_AWVALID),
        .s_axi_bid(s_axi_1_BID),
        .s_axi_bready(s_axi_1_BREADY),
        .s_axi_bresp(s_axi_1_BRESP),
        .s_axi_buser(s_axi_1_BUSER),
        .s_axi_bvalid(s_axi_1_BVALID),
        .s_axi_rdata(s_axi_1_RDATA),
        .s_axi_rid(s_axi_1_RID),
        .s_axi_rlast(s_axi_1_RLAST),
        .s_axi_rready(s_axi_1_RREADY),
        .s_axi_rresp(s_axi_1_RRESP),
        .s_axi_ruser(s_axi_1_RUSER),
        .s_axi_rvalid(s_axi_1_RVALID),
        .s_axi_wdata(s_axi_1_WDATA),
        .s_axi_wlast(s_axi_1_WLAST),
        .s_axi_wready(s_axi_1_WREADY),
        .s_axi_wstrb(s_axi_1_WSTRB),
        .s_axi_wuser(s_axi_1_WUSER),
        .s_axi_wvalid(s_axi_1_WVALID));
endmodule

module m07_nodes_imp_PRLVKX
   (M_SC_AR_info,
    M_SC_AR_payld,
    M_SC_AR_recv,
    M_SC_AR_req,
    M_SC_AR_send,
    M_SC_AW_info,
    M_SC_AW_payld,
    M_SC_AW_recv,
    M_SC_AW_req,
    M_SC_AW_send,
    M_SC_B_info,
    M_SC_B_payld,
    M_SC_B_recv,
    M_SC_B_req,
    M_SC_B_send,
    M_SC_R_info,
    M_SC_R_payld,
    M_SC_R_recv,
    M_SC_R_req,
    M_SC_R_send,
    M_SC_W_info,
    M_SC_W_payld,
    M_SC_W_recv,
    M_SC_W_req,
    M_SC_W_send,
    S_SC_AR_info,
    S_SC_AR_payld,
    S_SC_AR_recv,
    S_SC_AR_req,
    S_SC_AR_send,
    S_SC_AW_info,
    S_SC_AW_payld,
    S_SC_AW_recv,
    S_SC_AW_req,
    S_SC_AW_send,
    S_SC_B_info,
    S_SC_B_payld,
    S_SC_B_recv,
    S_SC_B_req,
    S_SC_B_send,
    S_SC_R_info,
    S_SC_R_payld,
    S_SC_R_recv,
    S_SC_R_req,
    S_SC_R_send,
    S_SC_W_info,
    S_SC_W_payld,
    S_SC_W_recv,
    S_SC_W_req,
    S_SC_W_send,
    m_axi_aclk,
    m_axi_aresetn,
    s_axi_aclk,
    s_axi_aresetn);
  output [0:0]M_SC_AR_info;
  output [155:0]M_SC_AR_payld;
  input [0:0]M_SC_AR_recv;
  output [0:0]M_SC_AR_req;
  output [0:0]M_SC_AR_send;
  output [0:0]M_SC_AW_info;
  output [155:0]M_SC_AW_payld;
  input [0:0]M_SC_AW_recv;
  output [0:0]M_SC_AW_req;
  output [0:0]M_SC_AW_send;
  output [3:0]M_SC_B_info;
  output [11:0]M_SC_B_payld;
  input [3:0]M_SC_B_recv;
  output [3:0]M_SC_B_req;
  output [3:0]M_SC_B_send;
  output [3:0]M_SC_R_info;
  output [89:0]M_SC_R_payld;
  input [3:0]M_SC_R_recv;
  output [3:0]M_SC_R_req;
  output [3:0]M_SC_R_send;
  output [0:0]M_SC_W_info;
  output [94:0]M_SC_W_payld;
  input [0:0]M_SC_W_recv;
  output [0:0]M_SC_W_req;
  output [0:0]M_SC_W_send;
  input [3:0]S_SC_AR_info;
  input [155:0]S_SC_AR_payld;
  output [3:0]S_SC_AR_recv;
  input [3:0]S_SC_AR_req;
  input [3:0]S_SC_AR_send;
  input [3:0]S_SC_AW_info;
  input [155:0]S_SC_AW_payld;
  output [3:0]S_SC_AW_recv;
  input [3:0]S_SC_AW_req;
  input [3:0]S_SC_AW_send;
  input [0:0]S_SC_B_info;
  input [11:0]S_SC_B_payld;
  output [0:0]S_SC_B_recv;
  input [0:0]S_SC_B_req;
  input [0:0]S_SC_B_send;
  input [0:0]S_SC_R_info;
  input [89:0]S_SC_R_payld;
  output [0:0]S_SC_R_recv;
  input [0:0]S_SC_R_req;
  input [0:0]S_SC_R_send;
  input [3:0]S_SC_W_info;
  input [94:0]S_SC_W_payld;
  output [3:0]S_SC_W_recv;
  input [3:0]S_SC_W_req;
  input [3:0]S_SC_W_send;
  input m_axi_aclk;
  input m_axi_aresetn;
  input s_axi_aclk;
  input s_axi_aresetn;

  wire [3:0]S_SC_AR_1_INFO;
  wire [155:0]S_SC_AR_1_PAYLD;
  wire [3:0]S_SC_AR_1_RECV;
  wire [3:0]S_SC_AR_1_REQ;
  wire [3:0]S_SC_AR_1_SEND;
  wire [3:0]S_SC_AW_1_INFO;
  wire [155:0]S_SC_AW_1_PAYLD;
  wire [3:0]S_SC_AW_1_RECV;
  wire [3:0]S_SC_AW_1_REQ;
  wire [3:0]S_SC_AW_1_SEND;
  wire [0:0]S_SC_B_1_INFO;
  wire [11:0]S_SC_B_1_PAYLD;
  wire [0:0]S_SC_B_1_RECV;
  wire [0:0]S_SC_B_1_REQ;
  wire [0:0]S_SC_B_1_SEND;
  wire [0:0]S_SC_R_1_INFO;
  wire [89:0]S_SC_R_1_PAYLD;
  wire [0:0]S_SC_R_1_RECV;
  wire [0:0]S_SC_R_1_REQ;
  wire [0:0]S_SC_R_1_SEND;
  wire [3:0]S_SC_W_1_INFO;
  wire [94:0]S_SC_W_1_PAYLD;
  wire [3:0]S_SC_W_1_RECV;
  wire [3:0]S_SC_W_1_REQ;
  wire [3:0]S_SC_W_1_SEND;
  wire [0:0]m07_ar_node_M_SC_INFO;
  wire [155:0]m07_ar_node_M_SC_PAYLD;
  wire [0:0]m07_ar_node_M_SC_RECV;
  wire [0:0]m07_ar_node_M_SC_REQ;
  wire [0:0]m07_ar_node_M_SC_SEND;
  wire [15:0]m07_aw_node_M_AXIS_ARB_TDATA;
  wire m07_aw_node_M_AXIS_ARB_TREADY;
  wire m07_aw_node_M_AXIS_ARB_TVALID;
  wire [0:0]m07_aw_node_M_SC_INFO;
  wire [155:0]m07_aw_node_M_SC_PAYLD;
  wire [0:0]m07_aw_node_M_SC_RECV;
  wire [0:0]m07_aw_node_M_SC_REQ;
  wire [0:0]m07_aw_node_M_SC_SEND;
  wire [3:0]m07_b_node_M_SC_INFO;
  wire [11:0]m07_b_node_M_SC_PAYLD;
  wire [3:0]m07_b_node_M_SC_RECV;
  wire [3:0]m07_b_node_M_SC_REQ;
  wire [3:0]m07_b_node_M_SC_SEND;
  wire [3:0]m07_r_node_M_SC_INFO;
  wire [89:0]m07_r_node_M_SC_PAYLD;
  wire [3:0]m07_r_node_M_SC_RECV;
  wire [3:0]m07_r_node_M_SC_REQ;
  wire [3:0]m07_r_node_M_SC_SEND;
  wire [0:0]m07_w_node_M_SC_INFO;
  wire [94:0]m07_w_node_M_SC_PAYLD;
  wire [0:0]m07_w_node_M_SC_RECV;
  wire [0:0]m07_w_node_M_SC_REQ;
  wire [0:0]m07_w_node_M_SC_SEND;
  wire m_axi_aclk_1;
  wire m_axi_aresetn_1;
  wire s_axi_aclk_1;
  wire s_axi_aresetn_1;

  assign M_SC_AR_info[0] = m07_ar_node_M_SC_INFO;
  assign M_SC_AR_payld[155:0] = m07_ar_node_M_SC_PAYLD;
  assign M_SC_AR_req[0] = m07_ar_node_M_SC_REQ;
  assign M_SC_AR_send[0] = m07_ar_node_M_SC_SEND;
  assign M_SC_AW_info[0] = m07_aw_node_M_SC_INFO;
  assign M_SC_AW_payld[155:0] = m07_aw_node_M_SC_PAYLD;
  assign M_SC_AW_req[0] = m07_aw_node_M_SC_REQ;
  assign M_SC_AW_send[0] = m07_aw_node_M_SC_SEND;
  assign M_SC_B_info[3:0] = m07_b_node_M_SC_INFO;
  assign M_SC_B_payld[11:0] = m07_b_node_M_SC_PAYLD;
  assign M_SC_B_req[3:0] = m07_b_node_M_SC_REQ;
  assign M_SC_B_send[3:0] = m07_b_node_M_SC_SEND;
  assign M_SC_R_info[3:0] = m07_r_node_M_SC_INFO;
  assign M_SC_R_payld[89:0] = m07_r_node_M_SC_PAYLD;
  assign M_SC_R_req[3:0] = m07_r_node_M_SC_REQ;
  assign M_SC_R_send[3:0] = m07_r_node_M_SC_SEND;
  assign M_SC_W_info[0] = m07_w_node_M_SC_INFO;
  assign M_SC_W_payld[94:0] = m07_w_node_M_SC_PAYLD;
  assign M_SC_W_req[0] = m07_w_node_M_SC_REQ;
  assign M_SC_W_send[0] = m07_w_node_M_SC_SEND;
  assign S_SC_AR_1_INFO = S_SC_AR_info[3:0];
  assign S_SC_AR_1_PAYLD = S_SC_AR_payld[155:0];
  assign S_SC_AR_1_REQ = S_SC_AR_req[3:0];
  assign S_SC_AR_1_SEND = S_SC_AR_send[3:0];
  assign S_SC_AR_recv[3:0] = S_SC_AR_1_RECV;
  assign S_SC_AW_1_INFO = S_SC_AW_info[3:0];
  assign S_SC_AW_1_PAYLD = S_SC_AW_payld[155:0];
  assign S_SC_AW_1_REQ = S_SC_AW_req[3:0];
  assign S_SC_AW_1_SEND = S_SC_AW_send[3:0];
  assign S_SC_AW_recv[3:0] = S_SC_AW_1_RECV;
  assign S_SC_B_1_INFO = S_SC_B_info[0];
  assign S_SC_B_1_PAYLD = S_SC_B_payld[11:0];
  assign S_SC_B_1_REQ = S_SC_B_req[0];
  assign S_SC_B_1_SEND = S_SC_B_send[0];
  assign S_SC_B_recv[0] = S_SC_B_1_RECV;
  assign S_SC_R_1_INFO = S_SC_R_info[0];
  assign S_SC_R_1_PAYLD = S_SC_R_payld[89:0];
  assign S_SC_R_1_REQ = S_SC_R_req[0];
  assign S_SC_R_1_SEND = S_SC_R_send[0];
  assign S_SC_R_recv[0] = S_SC_R_1_RECV;
  assign S_SC_W_1_INFO = S_SC_W_info[3:0];
  assign S_SC_W_1_PAYLD = S_SC_W_payld[94:0];
  assign S_SC_W_1_REQ = S_SC_W_req[3:0];
  assign S_SC_W_1_SEND = S_SC_W_send[3:0];
  assign S_SC_W_recv[3:0] = S_SC_W_1_RECV;
  assign m07_ar_node_M_SC_RECV = M_SC_AR_recv[0];
  assign m07_aw_node_M_SC_RECV = M_SC_AW_recv[0];
  assign m07_b_node_M_SC_RECV = M_SC_B_recv[3:0];
  assign m07_r_node_M_SC_RECV = M_SC_R_recv[3:0];
  assign m07_w_node_M_SC_RECV = M_SC_W_recv[0];
  assign m_axi_aclk_1 = m_axi_aclk;
  assign m_axi_aresetn_1 = m_axi_aresetn;
  assign s_axi_aclk_1 = s_axi_aclk;
  assign s_axi_aresetn_1 = s_axi_aresetn;
  bd_63e1_m07arn_0 m07_ar_node
       (.m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m07_ar_node_M_SC_INFO),
        .m_sc_payld(m07_ar_node_M_SC_PAYLD),
        .m_sc_recv(m07_ar_node_M_SC_RECV),
        .m_sc_req(m07_ar_node_M_SC_REQ),
        .m_sc_send(m07_ar_node_M_SC_SEND),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_AR_1_INFO),
        .s_sc_payld(S_SC_AR_1_PAYLD),
        .s_sc_recv(S_SC_AR_1_RECV),
        .s_sc_req(S_SC_AR_1_REQ),
        .s_sc_send(S_SC_AR_1_SEND));
  bd_63e1_m07awn_0 m07_aw_node
       (.m_axis_arb_tdata(m07_aw_node_M_AXIS_ARB_TDATA),
        .m_axis_arb_tready(m07_aw_node_M_AXIS_ARB_TREADY),
        .m_axis_arb_tvalid(m07_aw_node_M_AXIS_ARB_TVALID),
        .m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m07_aw_node_M_SC_INFO),
        .m_sc_payld(m07_aw_node_M_SC_PAYLD),
        .m_sc_recv(m07_aw_node_M_SC_RECV),
        .m_sc_req(m07_aw_node_M_SC_REQ),
        .m_sc_send(m07_aw_node_M_SC_SEND),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_AW_1_INFO),
        .s_sc_payld(S_SC_AW_1_PAYLD),
        .s_sc_recv(S_SC_AW_1_RECV),
        .s_sc_req(S_SC_AW_1_REQ),
        .s_sc_send(S_SC_AW_1_SEND));
  bd_63e1_m07bn_0 m07_b_node
       (.m_sc_aclk(s_axi_aclk_1),
        .m_sc_aresetn(s_axi_aresetn_1),
        .m_sc_info(m07_b_node_M_SC_INFO),
        .m_sc_payld(m07_b_node_M_SC_PAYLD),
        .m_sc_recv(m07_b_node_M_SC_RECV),
        .m_sc_req(m07_b_node_M_SC_REQ),
        .m_sc_send(m07_b_node_M_SC_SEND),
        .s_sc_aclk(m_axi_aclk_1),
        .s_sc_aresetn(m_axi_aresetn_1),
        .s_sc_info(S_SC_B_1_INFO),
        .s_sc_payld(S_SC_B_1_PAYLD),
        .s_sc_recv(S_SC_B_1_RECV),
        .s_sc_req(S_SC_B_1_REQ),
        .s_sc_send(S_SC_B_1_SEND));
  bd_63e1_m07rn_0 m07_r_node
       (.m_sc_aclk(s_axi_aclk_1),
        .m_sc_aresetn(s_axi_aresetn_1),
        .m_sc_info(m07_r_node_M_SC_INFO),
        .m_sc_payld(m07_r_node_M_SC_PAYLD),
        .m_sc_recv(m07_r_node_M_SC_RECV),
        .m_sc_req(m07_r_node_M_SC_REQ),
        .m_sc_send(m07_r_node_M_SC_SEND),
        .s_sc_aclk(m_axi_aclk_1),
        .s_sc_aresetn(m_axi_aresetn_1),
        .s_sc_info(S_SC_R_1_INFO),
        .s_sc_payld(S_SC_R_1_PAYLD),
        .s_sc_recv(S_SC_R_1_RECV),
        .s_sc_req(S_SC_R_1_REQ),
        .s_sc_send(S_SC_R_1_SEND));
  bd_63e1_m07wn_0 m07_w_node
       (.m_sc_aclk(m_axi_aclk_1),
        .m_sc_aresetn(m_axi_aresetn_1),
        .m_sc_info(m07_w_node_M_SC_INFO),
        .m_sc_payld(m07_w_node_M_SC_PAYLD),
        .m_sc_recv(m07_w_node_M_SC_RECV),
        .m_sc_req(m07_w_node_M_SC_REQ),
        .m_sc_send(m07_w_node_M_SC_SEND),
        .s_axis_arb_tdata(m07_aw_node_M_AXIS_ARB_TDATA),
        .s_axis_arb_tready(m07_aw_node_M_AXIS_ARB_TREADY),
        .s_axis_arb_tvalid(m07_aw_node_M_AXIS_ARB_TVALID),
        .s_sc_aclk(s_axi_aclk_1),
        .s_sc_aresetn(s_axi_aresetn_1),
        .s_sc_info(S_SC_W_1_INFO),
        .s_sc_payld(S_SC_W_1_PAYLD),
        .s_sc_recv(S_SC_W_1_RECV),
        .s_sc_req(S_SC_W_1_REQ),
        .s_sc_send(S_SC_W_1_SEND));
endmodule

module s00_entry_pipeline_imp_1SXUVV2
   (aclk,
    aresetn,
    m_axi_araddr,
    m_axi_arcache,
    m_axi_arid,
    m_axi_arlen,
    m_axi_arlock,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arready,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_awaddr,
    m_axi_awcache,
    m_axi_awid,
    m_axi_awlen,
    m_axi_awlock,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awready,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_bid,
    m_axi_bready,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_rdata,
    m_axi_rid,
    m_axi_rlast,
    m_axi_rready,
    m_axi_rresp,
    m_axi_ruser,
    m_axi_rvalid,
    m_axi_wdata,
    m_axi_wlast,
    m_axi_wready,
    m_axi_wstrb,
    m_axi_wuser,
    m_axi_wvalid,
    s_axi_araddr,
    s_axi_arburst,
    s_axi_arcache,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arlock,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arready,
    s_axi_arsize,
    s_axi_arvalid,
    s_axi_awaddr,
    s_axi_awburst,
    s_axi_awcache,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awlock,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awready,
    s_axi_awsize,
    s_axi_awvalid,
    s_axi_bid,
    s_axi_bready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_rdata,
    s_axi_rid,
    s_axi_rlast,
    s_axi_rready,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_wdata,
    s_axi_wid,
    s_axi_wlast,
    s_axi_wready,
    s_axi_wstrb,
    s_axi_wvalid);
  input aclk;
  input aresetn;
  output [31:0]m_axi_araddr;
  output [3:0]m_axi_arcache;
  output [4:0]m_axi_arid;
  output [7:0]m_axi_arlen;
  output [0:0]m_axi_arlock;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  input m_axi_arready;
  output [1023:0]m_axi_aruser;
  output m_axi_arvalid;
  output [31:0]m_axi_awaddr;
  output [3:0]m_axi_awcache;
  output [4:0]m_axi_awid;
  output [7:0]m_axi_awlen;
  output [0:0]m_axi_awlock;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  input m_axi_awready;
  output [1023:0]m_axi_awuser;
  output m_axi_awvalid;
  input [4:0]m_axi_bid;
  output m_axi_bready;
  input [1:0]m_axi_bresp;
  input [1023:0]m_axi_buser;
  input m_axi_bvalid;
  input [31:0]m_axi_rdata;
  input [4:0]m_axi_rid;
  input m_axi_rlast;
  output m_axi_rready;
  input [1:0]m_axi_rresp;
  input [1023:0]m_axi_ruser;
  input m_axi_rvalid;
  output [31:0]m_axi_wdata;
  output m_axi_wlast;
  input m_axi_wready;
  output [3:0]m_axi_wstrb;
  output [1023:0]m_axi_wuser;
  output m_axi_wvalid;
  input [31:0]s_axi_araddr;
  input [1:0]s_axi_arburst;
  input [3:0]s_axi_arcache;
  input [11:0]s_axi_arid;
  input [3:0]s_axi_arlen;
  input [1:0]s_axi_arlock;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  output s_axi_arready;
  input [2:0]s_axi_arsize;
  input s_axi_arvalid;
  input [31:0]s_axi_awaddr;
  input [1:0]s_axi_awburst;
  input [3:0]s_axi_awcache;
  input [11:0]s_axi_awid;
  input [3:0]s_axi_awlen;
  input [1:0]s_axi_awlock;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  output s_axi_awready;
  input [2:0]s_axi_awsize;
  input s_axi_awvalid;
  output [11:0]s_axi_bid;
  input s_axi_bready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  output [31:0]s_axi_rdata;
  output [11:0]s_axi_rid;
  output s_axi_rlast;
  input s_axi_rready;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;
  input [31:0]s_axi_wdata;
  input [11:0]s_axi_wid;
  input s_axi_wlast;
  output s_axi_wready;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;

  wire aclk_1;
  wire aresetn_1;
  wire [31:0]s00_mmu_M_AXI_ARADDR;
  wire [1:0]s00_mmu_M_AXI_ARBURST;
  wire [3:0]s00_mmu_M_AXI_ARCACHE;
  wire [11:0]s00_mmu_M_AXI_ARID;
  wire [7:0]s00_mmu_M_AXI_ARLEN;
  wire [0:0]s00_mmu_M_AXI_ARLOCK;
  wire [2:0]s00_mmu_M_AXI_ARPROT;
  wire [3:0]s00_mmu_M_AXI_ARQOS;
  wire s00_mmu_M_AXI_ARREADY;
  wire [2:0]s00_mmu_M_AXI_ARSIZE;
  wire [1023:0]s00_mmu_M_AXI_ARUSER;
  wire s00_mmu_M_AXI_ARVALID;
  wire [31:0]s00_mmu_M_AXI_AWADDR;
  wire [1:0]s00_mmu_M_AXI_AWBURST;
  wire [3:0]s00_mmu_M_AXI_AWCACHE;
  wire [11:0]s00_mmu_M_AXI_AWID;
  wire [7:0]s00_mmu_M_AXI_AWLEN;
  wire [0:0]s00_mmu_M_AXI_AWLOCK;
  wire [2:0]s00_mmu_M_AXI_AWPROT;
  wire [3:0]s00_mmu_M_AXI_AWQOS;
  wire s00_mmu_M_AXI_AWREADY;
  wire [2:0]s00_mmu_M_AXI_AWSIZE;
  wire [1023:0]s00_mmu_M_AXI_AWUSER;
  wire s00_mmu_M_AXI_AWVALID;
  wire [11:0]s00_mmu_M_AXI_BID;
  wire s00_mmu_M_AXI_BREADY;
  wire [1:0]s00_mmu_M_AXI_BRESP;
  wire [1023:0]s00_mmu_M_AXI_BUSER;
  wire s00_mmu_M_AXI_BVALID;
  wire [31:0]s00_mmu_M_AXI_RDATA;
  wire [11:0]s00_mmu_M_AXI_RID;
  wire s00_mmu_M_AXI_RLAST;
  wire s00_mmu_M_AXI_RREADY;
  wire [1:0]s00_mmu_M_AXI_RRESP;
  wire [1023:0]s00_mmu_M_AXI_RUSER;
  wire s00_mmu_M_AXI_RVALID;
  wire [31:0]s00_mmu_M_AXI_WDATA;
  wire s00_mmu_M_AXI_WLAST;
  wire s00_mmu_M_AXI_WREADY;
  wire [3:0]s00_mmu_M_AXI_WSTRB;
  wire [1023:0]s00_mmu_M_AXI_WUSER;
  wire s00_mmu_M_AXI_WVALID;
  wire [31:0]s00_si_converter_M_AXI_ARADDR;
  wire [3:0]s00_si_converter_M_AXI_ARCACHE;
  wire [4:0]s00_si_converter_M_AXI_ARID;
  wire [7:0]s00_si_converter_M_AXI_ARLEN;
  wire [0:0]s00_si_converter_M_AXI_ARLOCK;
  wire [2:0]s00_si_converter_M_AXI_ARPROT;
  wire [3:0]s00_si_converter_M_AXI_ARQOS;
  wire s00_si_converter_M_AXI_ARREADY;
  wire [1023:0]s00_si_converter_M_AXI_ARUSER;
  wire s00_si_converter_M_AXI_ARVALID;
  wire [31:0]s00_si_converter_M_AXI_AWADDR;
  wire [3:0]s00_si_converter_M_AXI_AWCACHE;
  wire [4:0]s00_si_converter_M_AXI_AWID;
  wire [7:0]s00_si_converter_M_AXI_AWLEN;
  wire [0:0]s00_si_converter_M_AXI_AWLOCK;
  wire [2:0]s00_si_converter_M_AXI_AWPROT;
  wire [3:0]s00_si_converter_M_AXI_AWQOS;
  wire s00_si_converter_M_AXI_AWREADY;
  wire [1023:0]s00_si_converter_M_AXI_AWUSER;
  wire s00_si_converter_M_AXI_AWVALID;
  wire [4:0]s00_si_converter_M_AXI_BID;
  wire s00_si_converter_M_AXI_BREADY;
  wire [1:0]s00_si_converter_M_AXI_BRESP;
  wire [1023:0]s00_si_converter_M_AXI_BUSER;
  wire s00_si_converter_M_AXI_BVALID;
  wire [31:0]s00_si_converter_M_AXI_RDATA;
  wire [4:0]s00_si_converter_M_AXI_RID;
  wire s00_si_converter_M_AXI_RLAST;
  wire s00_si_converter_M_AXI_RREADY;
  wire [1:0]s00_si_converter_M_AXI_RRESP;
  wire [1023:0]s00_si_converter_M_AXI_RUSER;
  wire s00_si_converter_M_AXI_RVALID;
  wire [31:0]s00_si_converter_M_AXI_WDATA;
  wire s00_si_converter_M_AXI_WLAST;
  wire s00_si_converter_M_AXI_WREADY;
  wire [3:0]s00_si_converter_M_AXI_WSTRB;
  wire [1023:0]s00_si_converter_M_AXI_WUSER;
  wire s00_si_converter_M_AXI_WVALID;
  wire [31:0]s00_transaction_regulator_M_AXI_ARADDR;
  wire [1:0]s00_transaction_regulator_M_AXI_ARBURST;
  wire [3:0]s00_transaction_regulator_M_AXI_ARCACHE;
  wire [4:0]s00_transaction_regulator_M_AXI_ARID;
  wire [7:0]s00_transaction_regulator_M_AXI_ARLEN;
  wire [0:0]s00_transaction_regulator_M_AXI_ARLOCK;
  wire [2:0]s00_transaction_regulator_M_AXI_ARPROT;
  wire [3:0]s00_transaction_regulator_M_AXI_ARQOS;
  wire s00_transaction_regulator_M_AXI_ARREADY;
  wire [2:0]s00_transaction_regulator_M_AXI_ARSIZE;
  wire [1023:0]s00_transaction_regulator_M_AXI_ARUSER;
  wire s00_transaction_regulator_M_AXI_ARVALID;
  wire [31:0]s00_transaction_regulator_M_AXI_AWADDR;
  wire [1:0]s00_transaction_regulator_M_AXI_AWBURST;
  wire [3:0]s00_transaction_regulator_M_AXI_AWCACHE;
  wire [4:0]s00_transaction_regulator_M_AXI_AWID;
  wire [7:0]s00_transaction_regulator_M_AXI_AWLEN;
  wire [0:0]s00_transaction_regulator_M_AXI_AWLOCK;
  wire [2:0]s00_transaction_regulator_M_AXI_AWPROT;
  wire [3:0]s00_transaction_regulator_M_AXI_AWQOS;
  wire s00_transaction_regulator_M_AXI_AWREADY;
  wire [2:0]s00_transaction_regulator_M_AXI_AWSIZE;
  wire [1023:0]s00_transaction_regulator_M_AXI_AWUSER;
  wire s00_transaction_regulator_M_AXI_AWVALID;
  wire [4:0]s00_transaction_regulator_M_AXI_BID;
  wire s00_transaction_regulator_M_AXI_BREADY;
  wire [1:0]s00_transaction_regulator_M_AXI_BRESP;
  wire [1023:0]s00_transaction_regulator_M_AXI_BUSER;
  wire s00_transaction_regulator_M_AXI_BVALID;
  wire [31:0]s00_transaction_regulator_M_AXI_RDATA;
  wire [4:0]s00_transaction_regulator_M_AXI_RID;
  wire s00_transaction_regulator_M_AXI_RLAST;
  wire s00_transaction_regulator_M_AXI_RREADY;
  wire [1:0]s00_transaction_regulator_M_AXI_RRESP;
  wire [1023:0]s00_transaction_regulator_M_AXI_RUSER;
  wire s00_transaction_regulator_M_AXI_RVALID;
  wire [31:0]s00_transaction_regulator_M_AXI_WDATA;
  wire s00_transaction_regulator_M_AXI_WLAST;
  wire s00_transaction_regulator_M_AXI_WREADY;
  wire [3:0]s00_transaction_regulator_M_AXI_WSTRB;
  wire [1023:0]s00_transaction_regulator_M_AXI_WUSER;
  wire s00_transaction_regulator_M_AXI_WVALID;
  wire [31:0]s_axi_1_ARADDR;
  wire [1:0]s_axi_1_ARBURST;
  wire [3:0]s_axi_1_ARCACHE;
  wire [11:0]s_axi_1_ARID;
  wire [3:0]s_axi_1_ARLEN;
  wire [1:0]s_axi_1_ARLOCK;
  wire [2:0]s_axi_1_ARPROT;
  wire [3:0]s_axi_1_ARQOS;
  wire s_axi_1_ARREADY;
  wire [2:0]s_axi_1_ARSIZE;
  wire s_axi_1_ARVALID;
  wire [31:0]s_axi_1_AWADDR;
  wire [1:0]s_axi_1_AWBURST;
  wire [3:0]s_axi_1_AWCACHE;
  wire [11:0]s_axi_1_AWID;
  wire [3:0]s_axi_1_AWLEN;
  wire [1:0]s_axi_1_AWLOCK;
  wire [2:0]s_axi_1_AWPROT;
  wire [3:0]s_axi_1_AWQOS;
  wire s_axi_1_AWREADY;
  wire [2:0]s_axi_1_AWSIZE;
  wire s_axi_1_AWVALID;
  wire [11:0]s_axi_1_BID;
  wire s_axi_1_BREADY;
  wire [1:0]s_axi_1_BRESP;
  wire s_axi_1_BVALID;
  wire [31:0]s_axi_1_RDATA;
  wire [11:0]s_axi_1_RID;
  wire s_axi_1_RLAST;
  wire s_axi_1_RREADY;
  wire [1:0]s_axi_1_RRESP;
  wire s_axi_1_RVALID;
  wire [31:0]s_axi_1_WDATA;
  wire [11:0]s_axi_1_WID;
  wire s_axi_1_WLAST;
  wire s_axi_1_WREADY;
  wire [3:0]s_axi_1_WSTRB;
  wire s_axi_1_WVALID;

  assign aclk_1 = aclk;
  assign aresetn_1 = aresetn;
  assign m_axi_araddr[31:0] = s00_si_converter_M_AXI_ARADDR;
  assign m_axi_arcache[3:0] = s00_si_converter_M_AXI_ARCACHE;
  assign m_axi_arid[4:0] = s00_si_converter_M_AXI_ARID;
  assign m_axi_arlen[7:0] = s00_si_converter_M_AXI_ARLEN;
  assign m_axi_arlock[0] = s00_si_converter_M_AXI_ARLOCK;
  assign m_axi_arprot[2:0] = s00_si_converter_M_AXI_ARPROT;
  assign m_axi_arqos[3:0] = s00_si_converter_M_AXI_ARQOS;
  assign m_axi_aruser[1023:0] = s00_si_converter_M_AXI_ARUSER;
  assign m_axi_arvalid = s00_si_converter_M_AXI_ARVALID;
  assign m_axi_awaddr[31:0] = s00_si_converter_M_AXI_AWADDR;
  assign m_axi_awcache[3:0] = s00_si_converter_M_AXI_AWCACHE;
  assign m_axi_awid[4:0] = s00_si_converter_M_AXI_AWID;
  assign m_axi_awlen[7:0] = s00_si_converter_M_AXI_AWLEN;
  assign m_axi_awlock[0] = s00_si_converter_M_AXI_AWLOCK;
  assign m_axi_awprot[2:0] = s00_si_converter_M_AXI_AWPROT;
  assign m_axi_awqos[3:0] = s00_si_converter_M_AXI_AWQOS;
  assign m_axi_awuser[1023:0] = s00_si_converter_M_AXI_AWUSER;
  assign m_axi_awvalid = s00_si_converter_M_AXI_AWVALID;
  assign m_axi_bready = s00_si_converter_M_AXI_BREADY;
  assign m_axi_rready = s00_si_converter_M_AXI_RREADY;
  assign m_axi_wdata[31:0] = s00_si_converter_M_AXI_WDATA;
  assign m_axi_wlast = s00_si_converter_M_AXI_WLAST;
  assign m_axi_wstrb[3:0] = s00_si_converter_M_AXI_WSTRB;
  assign m_axi_wuser[1023:0] = s00_si_converter_M_AXI_WUSER;
  assign m_axi_wvalid = s00_si_converter_M_AXI_WVALID;
  assign s00_si_converter_M_AXI_ARREADY = m_axi_arready;
  assign s00_si_converter_M_AXI_AWREADY = m_axi_awready;
  assign s00_si_converter_M_AXI_BID = m_axi_bid[4:0];
  assign s00_si_converter_M_AXI_BRESP = m_axi_bresp[1:0];
  assign s00_si_converter_M_AXI_BUSER = m_axi_buser[1023:0];
  assign s00_si_converter_M_AXI_BVALID = m_axi_bvalid;
  assign s00_si_converter_M_AXI_RDATA = m_axi_rdata[31:0];
  assign s00_si_converter_M_AXI_RID = m_axi_rid[4:0];
  assign s00_si_converter_M_AXI_RLAST = m_axi_rlast;
  assign s00_si_converter_M_AXI_RRESP = m_axi_rresp[1:0];
  assign s00_si_converter_M_AXI_RUSER = m_axi_ruser[1023:0];
  assign s00_si_converter_M_AXI_RVALID = m_axi_rvalid;
  assign s00_si_converter_M_AXI_WREADY = m_axi_wready;
  assign s_axi_1_ARADDR = s_axi_araddr[31:0];
  assign s_axi_1_ARBURST = s_axi_arburst[1:0];
  assign s_axi_1_ARCACHE = s_axi_arcache[3:0];
  assign s_axi_1_ARID = s_axi_arid[11:0];
  assign s_axi_1_ARLEN = s_axi_arlen[3:0];
  assign s_axi_1_ARLOCK = s_axi_arlock[1:0];
  assign s_axi_1_ARPROT = s_axi_arprot[2:0];
  assign s_axi_1_ARQOS = s_axi_arqos[3:0];
  assign s_axi_1_ARSIZE = s_axi_arsize[2:0];
  assign s_axi_1_ARVALID = s_axi_arvalid;
  assign s_axi_1_AWADDR = s_axi_awaddr[31:0];
  assign s_axi_1_AWBURST = s_axi_awburst[1:0];
  assign s_axi_1_AWCACHE = s_axi_awcache[3:0];
  assign s_axi_1_AWID = s_axi_awid[11:0];
  assign s_axi_1_AWLEN = s_axi_awlen[3:0];
  assign s_axi_1_AWLOCK = s_axi_awlock[1:0];
  assign s_axi_1_AWPROT = s_axi_awprot[2:0];
  assign s_axi_1_AWQOS = s_axi_awqos[3:0];
  assign s_axi_1_AWSIZE = s_axi_awsize[2:0];
  assign s_axi_1_AWVALID = s_axi_awvalid;
  assign s_axi_1_BREADY = s_axi_bready;
  assign s_axi_1_RREADY = s_axi_rready;
  assign s_axi_1_WDATA = s_axi_wdata[31:0];
  assign s_axi_1_WID = s_axi_wid[11:0];
  assign s_axi_1_WLAST = s_axi_wlast;
  assign s_axi_1_WSTRB = s_axi_wstrb[3:0];
  assign s_axi_1_WVALID = s_axi_wvalid;
  assign s_axi_arready = s_axi_1_ARREADY;
  assign s_axi_awready = s_axi_1_AWREADY;
  assign s_axi_bid[11:0] = s_axi_1_BID;
  assign s_axi_bresp[1:0] = s_axi_1_BRESP;
  assign s_axi_bvalid = s_axi_1_BVALID;
  assign s_axi_rdata[31:0] = s_axi_1_RDATA;
  assign s_axi_rid[11:0] = s_axi_1_RID;
  assign s_axi_rlast = s_axi_1_RLAST;
  assign s_axi_rresp[1:0] = s_axi_1_RRESP;
  assign s_axi_rvalid = s_axi_1_RVALID;
  assign s_axi_wready = s_axi_1_WREADY;
  bd_63e1_s00mmu_0 s00_mmu
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_araddr(s00_mmu_M_AXI_ARADDR),
        .m_axi_arburst(s00_mmu_M_AXI_ARBURST),
        .m_axi_arcache(s00_mmu_M_AXI_ARCACHE),
        .m_axi_arid(s00_mmu_M_AXI_ARID),
        .m_axi_arlen(s00_mmu_M_AXI_ARLEN),
        .m_axi_arlock(s00_mmu_M_AXI_ARLOCK),
        .m_axi_arprot(s00_mmu_M_AXI_ARPROT),
        .m_axi_arqos(s00_mmu_M_AXI_ARQOS),
        .m_axi_arready(s00_mmu_M_AXI_ARREADY),
        .m_axi_arsize(s00_mmu_M_AXI_ARSIZE),
        .m_axi_aruser(s00_mmu_M_AXI_ARUSER),
        .m_axi_arvalid(s00_mmu_M_AXI_ARVALID),
        .m_axi_awaddr(s00_mmu_M_AXI_AWADDR),
        .m_axi_awburst(s00_mmu_M_AXI_AWBURST),
        .m_axi_awcache(s00_mmu_M_AXI_AWCACHE),
        .m_axi_awid(s00_mmu_M_AXI_AWID),
        .m_axi_awlen(s00_mmu_M_AXI_AWLEN),
        .m_axi_awlock(s00_mmu_M_AXI_AWLOCK),
        .m_axi_awprot(s00_mmu_M_AXI_AWPROT),
        .m_axi_awqos(s00_mmu_M_AXI_AWQOS),
        .m_axi_awready(s00_mmu_M_AXI_AWREADY),
        .m_axi_awsize(s00_mmu_M_AXI_AWSIZE),
        .m_axi_awuser(s00_mmu_M_AXI_AWUSER),
        .m_axi_awvalid(s00_mmu_M_AXI_AWVALID),
        .m_axi_bid(s00_mmu_M_AXI_BID),
        .m_axi_bready(s00_mmu_M_AXI_BREADY),
        .m_axi_bresp(s00_mmu_M_AXI_BRESP),
        .m_axi_buser(s00_mmu_M_AXI_BUSER),
        .m_axi_bvalid(s00_mmu_M_AXI_BVALID),
        .m_axi_rdata(s00_mmu_M_AXI_RDATA),
        .m_axi_rid(s00_mmu_M_AXI_RID),
        .m_axi_rlast(s00_mmu_M_AXI_RLAST),
        .m_axi_rready(s00_mmu_M_AXI_RREADY),
        .m_axi_rresp(s00_mmu_M_AXI_RRESP),
        .m_axi_ruser(s00_mmu_M_AXI_RUSER),
        .m_axi_rvalid(s00_mmu_M_AXI_RVALID),
        .m_axi_wdata(s00_mmu_M_AXI_WDATA),
        .m_axi_wlast(s00_mmu_M_AXI_WLAST),
        .m_axi_wready(s00_mmu_M_AXI_WREADY),
        .m_axi_wstrb(s00_mmu_M_AXI_WSTRB),
        .m_axi_wuser(s00_mmu_M_AXI_WUSER),
        .m_axi_wvalid(s00_mmu_M_AXI_WVALID),
        .s_axi_araddr(s_axi_1_ARADDR),
        .s_axi_arburst(s_axi_1_ARBURST),
        .s_axi_arcache(s_axi_1_ARCACHE),
        .s_axi_arid(s_axi_1_ARID),
        .s_axi_arlen(s_axi_1_ARLEN),
        .s_axi_arlock(s_axi_1_ARLOCK),
        .s_axi_arprot(s_axi_1_ARPROT),
        .s_axi_arqos(s_axi_1_ARQOS),
        .s_axi_arready(s_axi_1_ARREADY),
        .s_axi_arsize(s_axi_1_ARSIZE),
        .s_axi_arvalid(s_axi_1_ARVALID),
        .s_axi_awaddr(s_axi_1_AWADDR),
        .s_axi_awburst(s_axi_1_AWBURST),
        .s_axi_awcache(s_axi_1_AWCACHE),
        .s_axi_awid(s_axi_1_AWID),
        .s_axi_awlen(s_axi_1_AWLEN),
        .s_axi_awlock(s_axi_1_AWLOCK),
        .s_axi_awprot(s_axi_1_AWPROT),
        .s_axi_awqos(s_axi_1_AWQOS),
        .s_axi_awready(s_axi_1_AWREADY),
        .s_axi_awsize(s_axi_1_AWSIZE),
        .s_axi_awvalid(s_axi_1_AWVALID),
        .s_axi_bid(s_axi_1_BID),
        .s_axi_bready(s_axi_1_BREADY),
        .s_axi_bresp(s_axi_1_BRESP),
        .s_axi_bvalid(s_axi_1_BVALID),
        .s_axi_rdata(s_axi_1_RDATA),
        .s_axi_rid(s_axi_1_RID),
        .s_axi_rlast(s_axi_1_RLAST),
        .s_axi_rready(s_axi_1_RREADY),
        .s_axi_rresp(s_axi_1_RRESP),
        .s_axi_rvalid(s_axi_1_RVALID),
        .s_axi_wdata(s_axi_1_WDATA),
        .s_axi_wid(s_axi_1_WID),
        .s_axi_wlast(s_axi_1_WLAST),
        .s_axi_wready(s_axi_1_WREADY),
        .s_axi_wstrb(s_axi_1_WSTRB),
        .s_axi_wvalid(s_axi_1_WVALID));
  bd_63e1_s00sic_0 s00_si_converter
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_araddr(s00_si_converter_M_AXI_ARADDR),
        .m_axi_arcache(s00_si_converter_M_AXI_ARCACHE),
        .m_axi_arid(s00_si_converter_M_AXI_ARID),
        .m_axi_arlen(s00_si_converter_M_AXI_ARLEN),
        .m_axi_arlock(s00_si_converter_M_AXI_ARLOCK),
        .m_axi_arprot(s00_si_converter_M_AXI_ARPROT),
        .m_axi_arqos(s00_si_converter_M_AXI_ARQOS),
        .m_axi_arready(s00_si_converter_M_AXI_ARREADY),
        .m_axi_aruser(s00_si_converter_M_AXI_ARUSER),
        .m_axi_arvalid(s00_si_converter_M_AXI_ARVALID),
        .m_axi_awaddr(s00_si_converter_M_AXI_AWADDR),
        .m_axi_awcache(s00_si_converter_M_AXI_AWCACHE),
        .m_axi_awid(s00_si_converter_M_AXI_AWID),
        .m_axi_awlen(s00_si_converter_M_AXI_AWLEN),
        .m_axi_awlock(s00_si_converter_M_AXI_AWLOCK),
        .m_axi_awprot(s00_si_converter_M_AXI_AWPROT),
        .m_axi_awqos(s00_si_converter_M_AXI_AWQOS),
        .m_axi_awready(s00_si_converter_M_AXI_AWREADY),
        .m_axi_awuser(s00_si_converter_M_AXI_AWUSER),
        .m_axi_awvalid(s00_si_converter_M_AXI_AWVALID),
        .m_axi_bid(s00_si_converter_M_AXI_BID),
        .m_axi_bready(s00_si_converter_M_AXI_BREADY),
        .m_axi_bresp(s00_si_converter_M_AXI_BRESP),
        .m_axi_buser(s00_si_converter_M_AXI_BUSER),
        .m_axi_bvalid(s00_si_converter_M_AXI_BVALID),
        .m_axi_rdata(s00_si_converter_M_AXI_RDATA),
        .m_axi_rid(s00_si_converter_M_AXI_RID),
        .m_axi_rlast(s00_si_converter_M_AXI_RLAST),
        .m_axi_rready(s00_si_converter_M_AXI_RREADY),
        .m_axi_rresp(s00_si_converter_M_AXI_RRESP),
        .m_axi_ruser(s00_si_converter_M_AXI_RUSER),
        .m_axi_rvalid(s00_si_converter_M_AXI_RVALID),
        .m_axi_wdata(s00_si_converter_M_AXI_WDATA),
        .m_axi_wlast(s00_si_converter_M_AXI_WLAST),
        .m_axi_wready(s00_si_converter_M_AXI_WREADY),
        .m_axi_wstrb(s00_si_converter_M_AXI_WSTRB),
        .m_axi_wuser(s00_si_converter_M_AXI_WUSER),
        .m_axi_wvalid(s00_si_converter_M_AXI_WVALID),
        .s_axi_araddr(s00_transaction_regulator_M_AXI_ARADDR),
        .s_axi_arburst(s00_transaction_regulator_M_AXI_ARBURST),
        .s_axi_arcache(s00_transaction_regulator_M_AXI_ARCACHE),
        .s_axi_arid(s00_transaction_regulator_M_AXI_ARID),
        .s_axi_arlen(s00_transaction_regulator_M_AXI_ARLEN),
        .s_axi_arlock(s00_transaction_regulator_M_AXI_ARLOCK),
        .s_axi_arprot(s00_transaction_regulator_M_AXI_ARPROT),
        .s_axi_arqos(s00_transaction_regulator_M_AXI_ARQOS),
        .s_axi_arready(s00_transaction_regulator_M_AXI_ARREADY),
        .s_axi_arsize(s00_transaction_regulator_M_AXI_ARSIZE),
        .s_axi_aruser(s00_transaction_regulator_M_AXI_ARUSER),
        .s_axi_arvalid(s00_transaction_regulator_M_AXI_ARVALID),
        .s_axi_awaddr(s00_transaction_regulator_M_AXI_AWADDR),
        .s_axi_awburst(s00_transaction_regulator_M_AXI_AWBURST),
        .s_axi_awcache(s00_transaction_regulator_M_AXI_AWCACHE),
        .s_axi_awid(s00_transaction_regulator_M_AXI_AWID),
        .s_axi_awlen(s00_transaction_regulator_M_AXI_AWLEN),
        .s_axi_awlock(s00_transaction_regulator_M_AXI_AWLOCK),
        .s_axi_awprot(s00_transaction_regulator_M_AXI_AWPROT),
        .s_axi_awqos(s00_transaction_regulator_M_AXI_AWQOS),
        .s_axi_awready(s00_transaction_regulator_M_AXI_AWREADY),
        .s_axi_awsize(s00_transaction_regulator_M_AXI_AWSIZE),
        .s_axi_awuser(s00_transaction_regulator_M_AXI_AWUSER),
        .s_axi_awvalid(s00_transaction_regulator_M_AXI_AWVALID),
        .s_axi_bid(s00_transaction_regulator_M_AXI_BID),
        .s_axi_bready(s00_transaction_regulator_M_AXI_BREADY),
        .s_axi_bresp(s00_transaction_regulator_M_AXI_BRESP),
        .s_axi_buser(s00_transaction_regulator_M_AXI_BUSER),
        .s_axi_bvalid(s00_transaction_regulator_M_AXI_BVALID),
        .s_axi_rdata(s00_transaction_regulator_M_AXI_RDATA),
        .s_axi_rid(s00_transaction_regulator_M_AXI_RID),
        .s_axi_rlast(s00_transaction_regulator_M_AXI_RLAST),
        .s_axi_rready(s00_transaction_regulator_M_AXI_RREADY),
        .s_axi_rresp(s00_transaction_regulator_M_AXI_RRESP),
        .s_axi_ruser(s00_transaction_regulator_M_AXI_RUSER),
        .s_axi_rvalid(s00_transaction_regulator_M_AXI_RVALID),
        .s_axi_wdata(s00_transaction_regulator_M_AXI_WDATA),
        .s_axi_wlast(s00_transaction_regulator_M_AXI_WLAST),
        .s_axi_wready(s00_transaction_regulator_M_AXI_WREADY),
        .s_axi_wstrb(s00_transaction_regulator_M_AXI_WSTRB),
        .s_axi_wuser(s00_transaction_regulator_M_AXI_WUSER),
        .s_axi_wvalid(s00_transaction_regulator_M_AXI_WVALID));
  bd_63e1_s00tr_0 s00_transaction_regulator
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_araddr(s00_transaction_regulator_M_AXI_ARADDR),
        .m_axi_arburst(s00_transaction_regulator_M_AXI_ARBURST),
        .m_axi_arcache(s00_transaction_regulator_M_AXI_ARCACHE),
        .m_axi_arid(s00_transaction_regulator_M_AXI_ARID),
        .m_axi_arlen(s00_transaction_regulator_M_AXI_ARLEN),
        .m_axi_arlock(s00_transaction_regulator_M_AXI_ARLOCK),
        .m_axi_arprot(s00_transaction_regulator_M_AXI_ARPROT),
        .m_axi_arqos(s00_transaction_regulator_M_AXI_ARQOS),
        .m_axi_arready(s00_transaction_regulator_M_AXI_ARREADY),
        .m_axi_arsize(s00_transaction_regulator_M_AXI_ARSIZE),
        .m_axi_aruser(s00_transaction_regulator_M_AXI_ARUSER),
        .m_axi_arvalid(s00_transaction_regulator_M_AXI_ARVALID),
        .m_axi_awaddr(s00_transaction_regulator_M_AXI_AWADDR),
        .m_axi_awburst(s00_transaction_regulator_M_AXI_AWBURST),
        .m_axi_awcache(s00_transaction_regulator_M_AXI_AWCACHE),
        .m_axi_awid(s00_transaction_regulator_M_AXI_AWID),
        .m_axi_awlen(s00_transaction_regulator_M_AXI_AWLEN),
        .m_axi_awlock(s00_transaction_regulator_M_AXI_AWLOCK),
        .m_axi_awprot(s00_transaction_regulator_M_AXI_AWPROT),
        .m_axi_awqos(s00_transaction_regulator_M_AXI_AWQOS),
        .m_axi_awready(s00_transaction_regulator_M_AXI_AWREADY),
        .m_axi_awsize(s00_transaction_regulator_M_AXI_AWSIZE),
        .m_axi_awuser(s00_transaction_regulator_M_AXI_AWUSER),
        .m_axi_awvalid(s00_transaction_regulator_M_AXI_AWVALID),
        .m_axi_bid(s00_transaction_regulator_M_AXI_BID),
        .m_axi_bready(s00_transaction_regulator_M_AXI_BREADY),
        .m_axi_bresp(s00_transaction_regulator_M_AXI_BRESP),
        .m_axi_buser(s00_transaction_regulator_M_AXI_BUSER),
        .m_axi_bvalid(s00_transaction_regulator_M_AXI_BVALID),
        .m_axi_rdata(s00_transaction_regulator_M_AXI_RDATA),
        .m_axi_rid(s00_transaction_regulator_M_AXI_RID),
        .m_axi_rlast(s00_transaction_regulator_M_AXI_RLAST),
        .m_axi_rready(s00_transaction_regulator_M_AXI_RREADY),
        .m_axi_rresp(s00_transaction_regulator_M_AXI_RRESP),
        .m_axi_ruser(s00_transaction_regulator_M_AXI_RUSER),
        .m_axi_rvalid(s00_transaction_regulator_M_AXI_RVALID),
        .m_axi_wdata(s00_transaction_regulator_M_AXI_WDATA),
        .m_axi_wlast(s00_transaction_regulator_M_AXI_WLAST),
        .m_axi_wready(s00_transaction_regulator_M_AXI_WREADY),
        .m_axi_wstrb(s00_transaction_regulator_M_AXI_WSTRB),
        .m_axi_wuser(s00_transaction_regulator_M_AXI_WUSER),
        .m_axi_wvalid(s00_transaction_regulator_M_AXI_WVALID),
        .s_axi_araddr(s00_mmu_M_AXI_ARADDR),
        .s_axi_arburst(s00_mmu_M_AXI_ARBURST),
        .s_axi_arcache(s00_mmu_M_AXI_ARCACHE),
        .s_axi_arid(s00_mmu_M_AXI_ARID),
        .s_axi_arlen(s00_mmu_M_AXI_ARLEN),
        .s_axi_arlock(s00_mmu_M_AXI_ARLOCK),
        .s_axi_arprot(s00_mmu_M_AXI_ARPROT),
        .s_axi_arqos(s00_mmu_M_AXI_ARQOS),
        .s_axi_arready(s00_mmu_M_AXI_ARREADY),
        .s_axi_arsize(s00_mmu_M_AXI_ARSIZE),
        .s_axi_aruser(s00_mmu_M_AXI_ARUSER),
        .s_axi_arvalid(s00_mmu_M_AXI_ARVALID),
        .s_axi_awaddr(s00_mmu_M_AXI_AWADDR),
        .s_axi_awburst(s00_mmu_M_AXI_AWBURST),
        .s_axi_awcache(s00_mmu_M_AXI_AWCACHE),
        .s_axi_awid(s00_mmu_M_AXI_AWID),
        .s_axi_awlen(s00_mmu_M_AXI_AWLEN),
        .s_axi_awlock(s00_mmu_M_AXI_AWLOCK),
        .s_axi_awprot(s00_mmu_M_AXI_AWPROT),
        .s_axi_awqos(s00_mmu_M_AXI_AWQOS),
        .s_axi_awready(s00_mmu_M_AXI_AWREADY),
        .s_axi_awsize(s00_mmu_M_AXI_AWSIZE),
        .s_axi_awuser(s00_mmu_M_AXI_AWUSER),
        .s_axi_awvalid(s00_mmu_M_AXI_AWVALID),
        .s_axi_bid(s00_mmu_M_AXI_BID),
        .s_axi_bready(s00_mmu_M_AXI_BREADY),
        .s_axi_bresp(s00_mmu_M_AXI_BRESP),
        .s_axi_buser(s00_mmu_M_AXI_BUSER),
        .s_axi_bvalid(s00_mmu_M_AXI_BVALID),
        .s_axi_rdata(s00_mmu_M_AXI_RDATA),
        .s_axi_rid(s00_mmu_M_AXI_RID),
        .s_axi_rlast(s00_mmu_M_AXI_RLAST),
        .s_axi_rready(s00_mmu_M_AXI_RREADY),
        .s_axi_rresp(s00_mmu_M_AXI_RRESP),
        .s_axi_ruser(s00_mmu_M_AXI_RUSER),
        .s_axi_rvalid(s00_mmu_M_AXI_RVALID),
        .s_axi_wdata(s00_mmu_M_AXI_WDATA),
        .s_axi_wlast(s00_mmu_M_AXI_WLAST),
        .s_axi_wready(s00_mmu_M_AXI_WREADY),
        .s_axi_wstrb(s00_mmu_M_AXI_WSTRB),
        .s_axi_wuser(s00_mmu_M_AXI_WUSER),
        .s_axi_wvalid(s00_mmu_M_AXI_WVALID));
endmodule

module s00_nodes_imp_1YY80YC
   (M_SC_AR_info,
    M_SC_AR_payld,
    M_SC_AR_recv,
    M_SC_AR_req,
    M_SC_AR_send,
    M_SC_AW_info,
    M_SC_AW_payld,
    M_SC_AW_recv,
    M_SC_AW_req,
    M_SC_AW_send,
    M_SC_B_info,
    M_SC_B_payld,
    M_SC_B_recv,
    M_SC_B_req,
    M_SC_B_send,
    M_SC_R_info,
    M_SC_R_payld,
    M_SC_R_recv,
    M_SC_R_req,
    M_SC_R_send,
    M_SC_W_info,
    M_SC_W_payld,
    M_SC_W_recv,
    M_SC_W_req,
    M_SC_W_send,
    S_SC_AR_info,
    S_SC_AR_payld,
    S_SC_AR_recv,
    S_SC_AR_req,
    S_SC_AR_send,
    S_SC_AW_info,
    S_SC_AW_payld,
    S_SC_AW_recv,
    S_SC_AW_req,
    S_SC_AW_send,
    S_SC_B_info,
    S_SC_B_payld,
    S_SC_B_recv,
    S_SC_B_req,
    S_SC_B_send,
    S_SC_R_info,
    S_SC_R_payld,
    S_SC_R_recv,
    S_SC_R_req,
    S_SC_R_send,
    S_SC_W_info,
    S_SC_W_payld,
    S_SC_W_recv,
    S_SC_W_req,
    S_SC_W_send,
    m_sc_clk,
    m_sc_resetn,
    s_sc_clk,
    s_sc_resetn);
  output [7:0]M_SC_AR_info;
  output [155:0]M_SC_AR_payld;
  input [7:0]M_SC_AR_recv;
  output [7:0]M_SC_AR_req;
  output [7:0]M_SC_AR_send;
  output [7:0]M_SC_AW_info;
  output [155:0]M_SC_AW_payld;
  input [7:0]M_SC_AW_recv;
  output [7:0]M_SC_AW_req;
  output [7:0]M_SC_AW_send;
  output [0:0]M_SC_B_info;
  output [11:0]M_SC_B_payld;
  input [0:0]M_SC_B_recv;
  output [0:0]M_SC_B_req;
  output [0:0]M_SC_B_send;
  output [0:0]M_SC_R_info;
  output [89:0]M_SC_R_payld;
  input [0:0]M_SC_R_recv;
  output [0:0]M_SC_R_req;
  output [0:0]M_SC_R_send;
  output [7:0]M_SC_W_info;
  output [94:0]M_SC_W_payld;
  input [7:0]M_SC_W_recv;
  output [7:0]M_SC_W_req;
  output [7:0]M_SC_W_send;
  input [0:0]S_SC_AR_info;
  input [155:0]S_SC_AR_payld;
  output [0:0]S_SC_AR_recv;
  input [0:0]S_SC_AR_req;
  input [0:0]S_SC_AR_send;
  input [0:0]S_SC_AW_info;
  input [155:0]S_SC_AW_payld;
  output [0:0]S_SC_AW_recv;
  input [0:0]S_SC_AW_req;
  input [0:0]S_SC_AW_send;
  input [7:0]S_SC_B_info;
  input [11:0]S_SC_B_payld;
  output [7:0]S_SC_B_recv;
  input [7:0]S_SC_B_req;
  input [7:0]S_SC_B_send;
  input [7:0]S_SC_R_info;
  input [89:0]S_SC_R_payld;
  output [7:0]S_SC_R_recv;
  input [7:0]S_SC_R_req;
  input [7:0]S_SC_R_send;
  input [0:0]S_SC_W_info;
  input [94:0]S_SC_W_payld;
  output [0:0]S_SC_W_recv;
  input [0:0]S_SC_W_req;
  input [0:0]S_SC_W_send;
  input m_sc_clk;
  input m_sc_resetn;
  input s_sc_clk;
  input s_sc_resetn;

  wire [0:0]S_SC_AR_1_INFO;
  wire [155:0]S_SC_AR_1_PAYLD;
  wire [0:0]S_SC_AR_1_RECV;
  wire [0:0]S_SC_AR_1_REQ;
  wire [0:0]S_SC_AR_1_SEND;
  wire [0:0]S_SC_AW_1_INFO;
  wire [155:0]S_SC_AW_1_PAYLD;
  wire [0:0]S_SC_AW_1_RECV;
  wire [0:0]S_SC_AW_1_REQ;
  wire [0:0]S_SC_AW_1_SEND;
  wire [7:0]S_SC_B_1_INFO;
  wire [11:0]S_SC_B_1_PAYLD;
  wire [7:0]S_SC_B_1_RECV;
  wire [7:0]S_SC_B_1_REQ;
  wire [7:0]S_SC_B_1_SEND;
  wire [7:0]S_SC_R_1_INFO;
  wire [89:0]S_SC_R_1_PAYLD;
  wire [7:0]S_SC_R_1_RECV;
  wire [7:0]S_SC_R_1_REQ;
  wire [7:0]S_SC_R_1_SEND;
  wire [0:0]S_SC_W_1_INFO;
  wire [94:0]S_SC_W_1_PAYLD;
  wire [0:0]S_SC_W_1_RECV;
  wire [0:0]S_SC_W_1_REQ;
  wire [0:0]S_SC_W_1_SEND;
  wire m_sc_clk_1;
  wire m_sc_resetn_1;
  wire [7:0]s00_ar_node_M_SC_INFO;
  wire [155:0]s00_ar_node_M_SC_PAYLD;
  wire [7:0]s00_ar_node_M_SC_RECV;
  wire [7:0]s00_ar_node_M_SC_REQ;
  wire [7:0]s00_ar_node_M_SC_SEND;
  wire [7:0]s00_aw_node_M_SC_INFO;
  wire [155:0]s00_aw_node_M_SC_PAYLD;
  wire [7:0]s00_aw_node_M_SC_RECV;
  wire [7:0]s00_aw_node_M_SC_REQ;
  wire [7:0]s00_aw_node_M_SC_SEND;
  wire [0:0]s00_b_node_M_SC_INFO;
  wire [11:0]s00_b_node_M_SC_PAYLD;
  wire [0:0]s00_b_node_M_SC_RECV;
  wire [0:0]s00_b_node_M_SC_REQ;
  wire [0:0]s00_b_node_M_SC_SEND;
  wire [0:0]s00_r_node_M_SC_INFO;
  wire [89:0]s00_r_node_M_SC_PAYLD;
  wire [0:0]s00_r_node_M_SC_RECV;
  wire [0:0]s00_r_node_M_SC_REQ;
  wire [0:0]s00_r_node_M_SC_SEND;
  wire [7:0]s00_w_node_M_SC_INFO;
  wire [94:0]s00_w_node_M_SC_PAYLD;
  wire [7:0]s00_w_node_M_SC_RECV;
  wire [7:0]s00_w_node_M_SC_REQ;
  wire [7:0]s00_w_node_M_SC_SEND;
  wire s_sc_clk_1;
  wire s_sc_resetn_1;

  assign M_SC_AR_info[7:0] = s00_ar_node_M_SC_INFO;
  assign M_SC_AR_payld[155:0] = s00_ar_node_M_SC_PAYLD;
  assign M_SC_AR_req[7:0] = s00_ar_node_M_SC_REQ;
  assign M_SC_AR_send[7:0] = s00_ar_node_M_SC_SEND;
  assign M_SC_AW_info[7:0] = s00_aw_node_M_SC_INFO;
  assign M_SC_AW_payld[155:0] = s00_aw_node_M_SC_PAYLD;
  assign M_SC_AW_req[7:0] = s00_aw_node_M_SC_REQ;
  assign M_SC_AW_send[7:0] = s00_aw_node_M_SC_SEND;
  assign M_SC_B_info[0] = s00_b_node_M_SC_INFO;
  assign M_SC_B_payld[11:0] = s00_b_node_M_SC_PAYLD;
  assign M_SC_B_req[0] = s00_b_node_M_SC_REQ;
  assign M_SC_B_send[0] = s00_b_node_M_SC_SEND;
  assign M_SC_R_info[0] = s00_r_node_M_SC_INFO;
  assign M_SC_R_payld[89:0] = s00_r_node_M_SC_PAYLD;
  assign M_SC_R_req[0] = s00_r_node_M_SC_REQ;
  assign M_SC_R_send[0] = s00_r_node_M_SC_SEND;
  assign M_SC_W_info[7:0] = s00_w_node_M_SC_INFO;
  assign M_SC_W_payld[94:0] = s00_w_node_M_SC_PAYLD;
  assign M_SC_W_req[7:0] = s00_w_node_M_SC_REQ;
  assign M_SC_W_send[7:0] = s00_w_node_M_SC_SEND;
  assign S_SC_AR_1_INFO = S_SC_AR_info[0];
  assign S_SC_AR_1_PAYLD = S_SC_AR_payld[155:0];
  assign S_SC_AR_1_REQ = S_SC_AR_req[0];
  assign S_SC_AR_1_SEND = S_SC_AR_send[0];
  assign S_SC_AR_recv[0] = S_SC_AR_1_RECV;
  assign S_SC_AW_1_INFO = S_SC_AW_info[0];
  assign S_SC_AW_1_PAYLD = S_SC_AW_payld[155:0];
  assign S_SC_AW_1_REQ = S_SC_AW_req[0];
  assign S_SC_AW_1_SEND = S_SC_AW_send[0];
  assign S_SC_AW_recv[0] = S_SC_AW_1_RECV;
  assign S_SC_B_1_INFO = S_SC_B_info[7:0];
  assign S_SC_B_1_PAYLD = S_SC_B_payld[11:0];
  assign S_SC_B_1_REQ = S_SC_B_req[7:0];
  assign S_SC_B_1_SEND = S_SC_B_send[7:0];
  assign S_SC_B_recv[7:0] = S_SC_B_1_RECV;
  assign S_SC_R_1_INFO = S_SC_R_info[7:0];
  assign S_SC_R_1_PAYLD = S_SC_R_payld[89:0];
  assign S_SC_R_1_REQ = S_SC_R_req[7:0];
  assign S_SC_R_1_SEND = S_SC_R_send[7:0];
  assign S_SC_R_recv[7:0] = S_SC_R_1_RECV;
  assign S_SC_W_1_INFO = S_SC_W_info[0];
  assign S_SC_W_1_PAYLD = S_SC_W_payld[94:0];
  assign S_SC_W_1_REQ = S_SC_W_req[0];
  assign S_SC_W_1_SEND = S_SC_W_send[0];
  assign S_SC_W_recv[0] = S_SC_W_1_RECV;
  assign m_sc_clk_1 = m_sc_clk;
  assign m_sc_resetn_1 = m_sc_resetn;
  assign s00_ar_node_M_SC_RECV = M_SC_AR_recv[7:0];
  assign s00_aw_node_M_SC_RECV = M_SC_AW_recv[7:0];
  assign s00_b_node_M_SC_RECV = M_SC_B_recv[0];
  assign s00_r_node_M_SC_RECV = M_SC_R_recv[0];
  assign s00_w_node_M_SC_RECV = M_SC_W_recv[7:0];
  assign s_sc_clk_1 = s_sc_clk;
  assign s_sc_resetn_1 = s_sc_resetn;
  bd_63e1_sarn_0 s00_ar_node
       (.m_sc_aclk(m_sc_clk_1),
        .m_sc_aresetn(m_sc_resetn_1),
        .m_sc_info(s00_ar_node_M_SC_INFO),
        .m_sc_payld(s00_ar_node_M_SC_PAYLD),
        .m_sc_recv(s00_ar_node_M_SC_RECV),
        .m_sc_req(s00_ar_node_M_SC_REQ),
        .m_sc_send(s00_ar_node_M_SC_SEND),
        .s_sc_aclk(s_sc_clk_1),
        .s_sc_aresetn(s_sc_resetn_1),
        .s_sc_info(S_SC_AR_1_INFO),
        .s_sc_payld(S_SC_AR_1_PAYLD),
        .s_sc_recv(S_SC_AR_1_RECV),
        .s_sc_req(S_SC_AR_1_REQ),
        .s_sc_send(S_SC_AR_1_SEND));
  bd_63e1_sawn_0 s00_aw_node
       (.m_sc_aclk(m_sc_clk_1),
        .m_sc_aresetn(m_sc_resetn_1),
        .m_sc_info(s00_aw_node_M_SC_INFO),
        .m_sc_payld(s00_aw_node_M_SC_PAYLD),
        .m_sc_recv(s00_aw_node_M_SC_RECV),
        .m_sc_req(s00_aw_node_M_SC_REQ),
        .m_sc_send(s00_aw_node_M_SC_SEND),
        .s_sc_aclk(s_sc_clk_1),
        .s_sc_aresetn(s_sc_resetn_1),
        .s_sc_info(S_SC_AW_1_INFO),
        .s_sc_payld(S_SC_AW_1_PAYLD),
        .s_sc_recv(S_SC_AW_1_RECV),
        .s_sc_req(S_SC_AW_1_REQ),
        .s_sc_send(S_SC_AW_1_SEND));
  bd_63e1_sbn_0 s00_b_node
       (.m_sc_aclk(s_sc_clk_1),
        .m_sc_aresetn(s_sc_resetn_1),
        .m_sc_info(s00_b_node_M_SC_INFO),
        .m_sc_payld(s00_b_node_M_SC_PAYLD),
        .m_sc_recv(s00_b_node_M_SC_RECV),
        .m_sc_req(s00_b_node_M_SC_REQ),
        .m_sc_send(s00_b_node_M_SC_SEND),
        .s_sc_aclk(m_sc_clk_1),
        .s_sc_aresetn(m_sc_resetn_1),
        .s_sc_info(S_SC_B_1_INFO),
        .s_sc_payld(S_SC_B_1_PAYLD),
        .s_sc_recv(S_SC_B_1_RECV),
        .s_sc_req(S_SC_B_1_REQ),
        .s_sc_send(S_SC_B_1_SEND));
  bd_63e1_srn_0 s00_r_node
       (.m_sc_aclk(s_sc_clk_1),
        .m_sc_aresetn(s_sc_resetn_1),
        .m_sc_info(s00_r_node_M_SC_INFO),
        .m_sc_payld(s00_r_node_M_SC_PAYLD),
        .m_sc_recv(s00_r_node_M_SC_RECV),
        .m_sc_req(s00_r_node_M_SC_REQ),
        .m_sc_send(s00_r_node_M_SC_SEND),
        .s_sc_aclk(m_sc_clk_1),
        .s_sc_aresetn(m_sc_resetn_1),
        .s_sc_info(S_SC_R_1_INFO),
        .s_sc_payld(S_SC_R_1_PAYLD),
        .s_sc_recv(S_SC_R_1_RECV),
        .s_sc_req(S_SC_R_1_REQ),
        .s_sc_send(S_SC_R_1_SEND));
  bd_63e1_swn_0 s00_w_node
       (.m_sc_aclk(m_sc_clk_1),
        .m_sc_aresetn(m_sc_resetn_1),
        .m_sc_info(s00_w_node_M_SC_INFO),
        .m_sc_payld(s00_w_node_M_SC_PAYLD),
        .m_sc_recv(s00_w_node_M_SC_RECV),
        .m_sc_req(s00_w_node_M_SC_REQ),
        .m_sc_send(s00_w_node_M_SC_SEND),
        .s_sc_aclk(s_sc_clk_1),
        .s_sc_aresetn(s_sc_resetn_1),
        .s_sc_info(S_SC_W_1_INFO),
        .s_sc_payld(S_SC_W_1_PAYLD),
        .s_sc_recv(S_SC_W_1_RECV),
        .s_sc_req(S_SC_W_1_REQ),
        .s_sc_send(S_SC_W_1_SEND));
endmodule

module s01_entry_pipeline_imp_VHOZKQ
   (aclk,
    aresetn,
    m_axi_araddr,
    m_axi_arcache,
    m_axi_arid,
    m_axi_arlen,
    m_axi_arlock,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arready,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_rdata,
    m_axi_rid,
    m_axi_rlast,
    m_axi_rready,
    m_axi_rresp,
    m_axi_ruser,
    m_axi_rvalid,
    s_axi_araddr,
    s_axi_arburst,
    s_axi_arcache,
    s_axi_arlen,
    s_axi_arlock,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arready,
    s_axi_arsize,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_rdata,
    s_axi_rlast,
    s_axi_rready,
    s_axi_rresp,
    s_axi_rvalid);
  input aclk;
  input aresetn;
  output [31:0]m_axi_araddr;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arid;
  output [7:0]m_axi_arlen;
  output [0:0]m_axi_arlock;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  input m_axi_arready;
  output [1023:0]m_axi_aruser;
  output m_axi_arvalid;
  input [31:0]m_axi_rdata;
  input [2:0]m_axi_rid;
  input m_axi_rlast;
  output m_axi_rready;
  input [1:0]m_axi_rresp;
  input [1023:0]m_axi_ruser;
  input m_axi_rvalid;
  input [31:0]s_axi_araddr;
  input [1:0]s_axi_arburst;
  input [3:0]s_axi_arcache;
  input [7:0]s_axi_arlen;
  input [0:0]s_axi_arlock;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  output s_axi_arready;
  input [2:0]s_axi_arsize;
  input [3:0]s_axi_aruser;
  input s_axi_arvalid;
  output [31:0]s_axi_rdata;
  output s_axi_rlast;
  input s_axi_rready;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;

  wire aclk_1;
  wire aresetn_1;
  wire [31:0]s01_mmu_M_AXI_ARADDR;
  wire [1:0]s01_mmu_M_AXI_ARBURST;
  wire [3:0]s01_mmu_M_AXI_ARCACHE;
  wire [7:0]s01_mmu_M_AXI_ARLEN;
  wire [0:0]s01_mmu_M_AXI_ARLOCK;
  wire [2:0]s01_mmu_M_AXI_ARPROT;
  wire [3:0]s01_mmu_M_AXI_ARQOS;
  wire s01_mmu_M_AXI_ARREADY;
  wire [2:0]s01_mmu_M_AXI_ARSIZE;
  wire [1023:0]s01_mmu_M_AXI_ARUSER;
  wire s01_mmu_M_AXI_ARVALID;
  wire [31:0]s01_mmu_M_AXI_RDATA;
  wire s01_mmu_M_AXI_RLAST;
  wire s01_mmu_M_AXI_RREADY;
  wire [1:0]s01_mmu_M_AXI_RRESP;
  wire [1023:0]s01_mmu_M_AXI_RUSER;
  wire s01_mmu_M_AXI_RVALID;
  wire [31:0]s01_si_converter_M_AXI_ARADDR;
  wire [3:0]s01_si_converter_M_AXI_ARCACHE;
  wire [2:0]s01_si_converter_M_AXI_ARID;
  wire [7:0]s01_si_converter_M_AXI_ARLEN;
  wire [0:0]s01_si_converter_M_AXI_ARLOCK;
  wire [2:0]s01_si_converter_M_AXI_ARPROT;
  wire [3:0]s01_si_converter_M_AXI_ARQOS;
  wire s01_si_converter_M_AXI_ARREADY;
  wire [1023:0]s01_si_converter_M_AXI_ARUSER;
  wire s01_si_converter_M_AXI_ARVALID;
  wire [31:0]s01_si_converter_M_AXI_RDATA;
  wire [2:0]s01_si_converter_M_AXI_RID;
  wire s01_si_converter_M_AXI_RLAST;
  wire s01_si_converter_M_AXI_RREADY;
  wire [1:0]s01_si_converter_M_AXI_RRESP;
  wire [1023:0]s01_si_converter_M_AXI_RUSER;
  wire s01_si_converter_M_AXI_RVALID;
  wire [31:0]s01_transaction_regulator_M_AXI_ARADDR;
  wire [3:0]s01_transaction_regulator_M_AXI_ARCACHE;
  wire [2:0]s01_transaction_regulator_M_AXI_ARID;
  wire [7:0]s01_transaction_regulator_M_AXI_ARLEN;
  wire [0:0]s01_transaction_regulator_M_AXI_ARLOCK;
  wire [2:0]s01_transaction_regulator_M_AXI_ARPROT;
  wire [3:0]s01_transaction_regulator_M_AXI_ARQOS;
  wire s01_transaction_regulator_M_AXI_ARREADY;
  wire [2:0]s01_transaction_regulator_M_AXI_ARSIZE;
  wire [1023:0]s01_transaction_regulator_M_AXI_ARUSER;
  wire s01_transaction_regulator_M_AXI_ARVALID;
  wire [31:0]s01_transaction_regulator_M_AXI_RDATA;
  wire [2:0]s01_transaction_regulator_M_AXI_RID;
  wire s01_transaction_regulator_M_AXI_RLAST;
  wire s01_transaction_regulator_M_AXI_RREADY;
  wire [1:0]s01_transaction_regulator_M_AXI_RRESP;
  wire [1023:0]s01_transaction_regulator_M_AXI_RUSER;
  wire s01_transaction_regulator_M_AXI_RVALID;
  wire [31:0]s_axi_1_ARADDR;
  wire [1:0]s_axi_1_ARBURST;
  wire [3:0]s_axi_1_ARCACHE;
  wire [7:0]s_axi_1_ARLEN;
  wire [0:0]s_axi_1_ARLOCK;
  wire [2:0]s_axi_1_ARPROT;
  wire [3:0]s_axi_1_ARQOS;
  wire s_axi_1_ARREADY;
  wire [2:0]s_axi_1_ARSIZE;
  wire [3:0]s_axi_1_ARUSER;
  wire s_axi_1_ARVALID;
  wire [31:0]s_axi_1_RDATA;
  wire s_axi_1_RLAST;
  wire s_axi_1_RREADY;
  wire [1:0]s_axi_1_RRESP;
  wire s_axi_1_RVALID;

  assign aclk_1 = aclk;
  assign aresetn_1 = aresetn;
  assign m_axi_araddr[31:0] = s01_si_converter_M_AXI_ARADDR;
  assign m_axi_arcache[3:0] = s01_si_converter_M_AXI_ARCACHE;
  assign m_axi_arid[2:0] = s01_si_converter_M_AXI_ARID;
  assign m_axi_arlen[7:0] = s01_si_converter_M_AXI_ARLEN;
  assign m_axi_arlock[0] = s01_si_converter_M_AXI_ARLOCK;
  assign m_axi_arprot[2:0] = s01_si_converter_M_AXI_ARPROT;
  assign m_axi_arqos[3:0] = s01_si_converter_M_AXI_ARQOS;
  assign m_axi_aruser[1023:0] = s01_si_converter_M_AXI_ARUSER;
  assign m_axi_arvalid = s01_si_converter_M_AXI_ARVALID;
  assign m_axi_rready = s01_si_converter_M_AXI_RREADY;
  assign s01_si_converter_M_AXI_ARREADY = m_axi_arready;
  assign s01_si_converter_M_AXI_RDATA = m_axi_rdata[31:0];
  assign s01_si_converter_M_AXI_RID = m_axi_rid[2:0];
  assign s01_si_converter_M_AXI_RLAST = m_axi_rlast;
  assign s01_si_converter_M_AXI_RRESP = m_axi_rresp[1:0];
  assign s01_si_converter_M_AXI_RUSER = m_axi_ruser[1023:0];
  assign s01_si_converter_M_AXI_RVALID = m_axi_rvalid;
  assign s_axi_1_ARADDR = s_axi_araddr[31:0];
  assign s_axi_1_ARBURST = s_axi_arburst[1:0];
  assign s_axi_1_ARCACHE = s_axi_arcache[3:0];
  assign s_axi_1_ARLEN = s_axi_arlen[7:0];
  assign s_axi_1_ARLOCK = s_axi_arlock[0];
  assign s_axi_1_ARPROT = s_axi_arprot[2:0];
  assign s_axi_1_ARQOS = s_axi_arqos[3:0];
  assign s_axi_1_ARSIZE = s_axi_arsize[2:0];
  assign s_axi_1_ARUSER = s_axi_aruser[3:0];
  assign s_axi_1_ARVALID = s_axi_arvalid;
  assign s_axi_1_RREADY = s_axi_rready;
  assign s_axi_arready = s_axi_1_ARREADY;
  assign s_axi_rdata[31:0] = s_axi_1_RDATA;
  assign s_axi_rlast = s_axi_1_RLAST;
  assign s_axi_rresp[1:0] = s_axi_1_RRESP;
  assign s_axi_rvalid = s_axi_1_RVALID;
  bd_63e1_s01mmu_0 s01_mmu
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_araddr(s01_mmu_M_AXI_ARADDR),
        .m_axi_arburst(s01_mmu_M_AXI_ARBURST),
        .m_axi_arcache(s01_mmu_M_AXI_ARCACHE),
        .m_axi_arlen(s01_mmu_M_AXI_ARLEN),
        .m_axi_arlock(s01_mmu_M_AXI_ARLOCK),
        .m_axi_arprot(s01_mmu_M_AXI_ARPROT),
        .m_axi_arqos(s01_mmu_M_AXI_ARQOS),
        .m_axi_arready(s01_mmu_M_AXI_ARREADY),
        .m_axi_arsize(s01_mmu_M_AXI_ARSIZE),
        .m_axi_aruser(s01_mmu_M_AXI_ARUSER),
        .m_axi_arvalid(s01_mmu_M_AXI_ARVALID),
        .m_axi_rdata(s01_mmu_M_AXI_RDATA),
        .m_axi_rlast(s01_mmu_M_AXI_RLAST),
        .m_axi_rready(s01_mmu_M_AXI_RREADY),
        .m_axi_rresp(s01_mmu_M_AXI_RRESP),
        .m_axi_ruser(s01_mmu_M_AXI_RUSER),
        .m_axi_rvalid(s01_mmu_M_AXI_RVALID),
        .s_axi_araddr(s_axi_1_ARADDR),
        .s_axi_arburst(s_axi_1_ARBURST),
        .s_axi_arcache(s_axi_1_ARCACHE),
        .s_axi_arlen(s_axi_1_ARLEN),
        .s_axi_arlock(s_axi_1_ARLOCK),
        .s_axi_arprot(s_axi_1_ARPROT),
        .s_axi_arqos(s_axi_1_ARQOS),
        .s_axi_arready(s_axi_1_ARREADY),
        .s_axi_arsize(s_axi_1_ARSIZE),
        .s_axi_aruser(s_axi_1_ARUSER),
        .s_axi_arvalid(s_axi_1_ARVALID),
        .s_axi_rdata(s_axi_1_RDATA),
        .s_axi_rlast(s_axi_1_RLAST),
        .s_axi_rready(s_axi_1_RREADY),
        .s_axi_rresp(s_axi_1_RRESP),
        .s_axi_rvalid(s_axi_1_RVALID));
  bd_63e1_s01sic_0 s01_si_converter
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_araddr(s01_si_converter_M_AXI_ARADDR),
        .m_axi_arcache(s01_si_converter_M_AXI_ARCACHE),
        .m_axi_arid(s01_si_converter_M_AXI_ARID),
        .m_axi_arlen(s01_si_converter_M_AXI_ARLEN),
        .m_axi_arlock(s01_si_converter_M_AXI_ARLOCK),
        .m_axi_arprot(s01_si_converter_M_AXI_ARPROT),
        .m_axi_arqos(s01_si_converter_M_AXI_ARQOS),
        .m_axi_arready(s01_si_converter_M_AXI_ARREADY),
        .m_axi_aruser(s01_si_converter_M_AXI_ARUSER),
        .m_axi_arvalid(s01_si_converter_M_AXI_ARVALID),
        .m_axi_rdata(s01_si_converter_M_AXI_RDATA),
        .m_axi_rid(s01_si_converter_M_AXI_RID),
        .m_axi_rlast(s01_si_converter_M_AXI_RLAST),
        .m_axi_rready(s01_si_converter_M_AXI_RREADY),
        .m_axi_rresp(s01_si_converter_M_AXI_RRESP),
        .m_axi_ruser(s01_si_converter_M_AXI_RUSER),
        .m_axi_rvalid(s01_si_converter_M_AXI_RVALID),
        .s_axi_araddr(s01_transaction_regulator_M_AXI_ARADDR),
        .s_axi_arcache(s01_transaction_regulator_M_AXI_ARCACHE),
        .s_axi_arid(s01_transaction_regulator_M_AXI_ARID),
        .s_axi_arlen(s01_transaction_regulator_M_AXI_ARLEN),
        .s_axi_arlock(s01_transaction_regulator_M_AXI_ARLOCK),
        .s_axi_arprot(s01_transaction_regulator_M_AXI_ARPROT),
        .s_axi_arqos(s01_transaction_regulator_M_AXI_ARQOS),
        .s_axi_arready(s01_transaction_regulator_M_AXI_ARREADY),
        .s_axi_arsize(s01_transaction_regulator_M_AXI_ARSIZE),
        .s_axi_aruser(s01_transaction_regulator_M_AXI_ARUSER),
        .s_axi_arvalid(s01_transaction_regulator_M_AXI_ARVALID),
        .s_axi_rdata(s01_transaction_regulator_M_AXI_RDATA),
        .s_axi_rid(s01_transaction_regulator_M_AXI_RID),
        .s_axi_rlast(s01_transaction_regulator_M_AXI_RLAST),
        .s_axi_rready(s01_transaction_regulator_M_AXI_RREADY),
        .s_axi_rresp(s01_transaction_regulator_M_AXI_RRESP),
        .s_axi_ruser(s01_transaction_regulator_M_AXI_RUSER),
        .s_axi_rvalid(s01_transaction_regulator_M_AXI_RVALID));
  bd_63e1_s01tr_0 s01_transaction_regulator
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_araddr(s01_transaction_regulator_M_AXI_ARADDR),
        .m_axi_arcache(s01_transaction_regulator_M_AXI_ARCACHE),
        .m_axi_arid(s01_transaction_regulator_M_AXI_ARID),
        .m_axi_arlen(s01_transaction_regulator_M_AXI_ARLEN),
        .m_axi_arlock(s01_transaction_regulator_M_AXI_ARLOCK),
        .m_axi_arprot(s01_transaction_regulator_M_AXI_ARPROT),
        .m_axi_arqos(s01_transaction_regulator_M_AXI_ARQOS),
        .m_axi_arready(s01_transaction_regulator_M_AXI_ARREADY),
        .m_axi_arsize(s01_transaction_regulator_M_AXI_ARSIZE),
        .m_axi_aruser(s01_transaction_regulator_M_AXI_ARUSER),
        .m_axi_arvalid(s01_transaction_regulator_M_AXI_ARVALID),
        .m_axi_rdata(s01_transaction_regulator_M_AXI_RDATA),
        .m_axi_rid(s01_transaction_regulator_M_AXI_RID),
        .m_axi_rlast(s01_transaction_regulator_M_AXI_RLAST),
        .m_axi_rready(s01_transaction_regulator_M_AXI_RREADY),
        .m_axi_rresp(s01_transaction_regulator_M_AXI_RRESP),
        .m_axi_ruser(s01_transaction_regulator_M_AXI_RUSER),
        .m_axi_rvalid(s01_transaction_regulator_M_AXI_RVALID),
        .s_axi_araddr(s01_mmu_M_AXI_ARADDR),
        .s_axi_arburst(s01_mmu_M_AXI_ARBURST),
        .s_axi_arcache(s01_mmu_M_AXI_ARCACHE),
        .s_axi_arlen(s01_mmu_M_AXI_ARLEN),
        .s_axi_arlock(s01_mmu_M_AXI_ARLOCK),
        .s_axi_arprot(s01_mmu_M_AXI_ARPROT),
        .s_axi_arqos(s01_mmu_M_AXI_ARQOS),
        .s_axi_arready(s01_mmu_M_AXI_ARREADY),
        .s_axi_arsize(s01_mmu_M_AXI_ARSIZE),
        .s_axi_aruser(s01_mmu_M_AXI_ARUSER),
        .s_axi_arvalid(s01_mmu_M_AXI_ARVALID),
        .s_axi_rdata(s01_mmu_M_AXI_RDATA),
        .s_axi_rlast(s01_mmu_M_AXI_RLAST),
        .s_axi_rready(s01_mmu_M_AXI_RREADY),
        .s_axi_rresp(s01_mmu_M_AXI_RRESP),
        .s_axi_ruser(s01_mmu_M_AXI_RUSER),
        .s_axi_rvalid(s01_mmu_M_AXI_RVALID));
endmodule

module s01_nodes_imp_RE5KMA
   (M_SC_AR_info,
    M_SC_AR_payld,
    M_SC_AR_recv,
    M_SC_AR_req,
    M_SC_AR_send,
    M_SC_R_info,
    M_SC_R_payld,
    M_SC_R_recv,
    M_SC_R_req,
    M_SC_R_send,
    S_SC_AR_info,
    S_SC_AR_payld,
    S_SC_AR_recv,
    S_SC_AR_req,
    S_SC_AR_send,
    S_SC_R_info,
    S_SC_R_payld,
    S_SC_R_recv,
    S_SC_R_req,
    S_SC_R_send,
    m_sc_clk,
    m_sc_resetn,
    s_sc_clk,
    s_sc_resetn);
  output [7:0]M_SC_AR_info;
  output [155:0]M_SC_AR_payld;
  input [7:0]M_SC_AR_recv;
  output [7:0]M_SC_AR_req;
  output [7:0]M_SC_AR_send;
  output [0:0]M_SC_R_info;
  output [89:0]M_SC_R_payld;
  input [0:0]M_SC_R_recv;
  output [0:0]M_SC_R_req;
  output [0:0]M_SC_R_send;
  input [0:0]S_SC_AR_info;
  input [155:0]S_SC_AR_payld;
  output [0:0]S_SC_AR_recv;
  input [0:0]S_SC_AR_req;
  input [0:0]S_SC_AR_send;
  input [7:0]S_SC_R_info;
  input [89:0]S_SC_R_payld;
  output [7:0]S_SC_R_recv;
  input [7:0]S_SC_R_req;
  input [7:0]S_SC_R_send;
  input m_sc_clk;
  input m_sc_resetn;
  input s_sc_clk;
  input s_sc_resetn;

  wire [0:0]S_SC_AR_1_INFO;
  wire [155:0]S_SC_AR_1_PAYLD;
  wire [0:0]S_SC_AR_1_RECV;
  wire [0:0]S_SC_AR_1_REQ;
  wire [0:0]S_SC_AR_1_SEND;
  wire [7:0]S_SC_R_1_INFO;
  wire [89:0]S_SC_R_1_PAYLD;
  wire [7:0]S_SC_R_1_RECV;
  wire [7:0]S_SC_R_1_REQ;
  wire [7:0]S_SC_R_1_SEND;
  wire m_sc_clk_1;
  wire m_sc_resetn_1;
  wire [7:0]s01_ar_node_M_SC_INFO;
  wire [155:0]s01_ar_node_M_SC_PAYLD;
  wire [7:0]s01_ar_node_M_SC_RECV;
  wire [7:0]s01_ar_node_M_SC_REQ;
  wire [7:0]s01_ar_node_M_SC_SEND;
  wire [0:0]s01_r_node_M_SC_INFO;
  wire [89:0]s01_r_node_M_SC_PAYLD;
  wire [0:0]s01_r_node_M_SC_RECV;
  wire [0:0]s01_r_node_M_SC_REQ;
  wire [0:0]s01_r_node_M_SC_SEND;
  wire s_sc_clk_1;
  wire s_sc_resetn_1;

  assign M_SC_AR_info[7:0] = s01_ar_node_M_SC_INFO;
  assign M_SC_AR_payld[155:0] = s01_ar_node_M_SC_PAYLD;
  assign M_SC_AR_req[7:0] = s01_ar_node_M_SC_REQ;
  assign M_SC_AR_send[7:0] = s01_ar_node_M_SC_SEND;
  assign M_SC_R_info[0] = s01_r_node_M_SC_INFO;
  assign M_SC_R_payld[89:0] = s01_r_node_M_SC_PAYLD;
  assign M_SC_R_req[0] = s01_r_node_M_SC_REQ;
  assign M_SC_R_send[0] = s01_r_node_M_SC_SEND;
  assign S_SC_AR_1_INFO = S_SC_AR_info[0];
  assign S_SC_AR_1_PAYLD = S_SC_AR_payld[155:0];
  assign S_SC_AR_1_REQ = S_SC_AR_req[0];
  assign S_SC_AR_1_SEND = S_SC_AR_send[0];
  assign S_SC_AR_recv[0] = S_SC_AR_1_RECV;
  assign S_SC_R_1_INFO = S_SC_R_info[7:0];
  assign S_SC_R_1_PAYLD = S_SC_R_payld[89:0];
  assign S_SC_R_1_REQ = S_SC_R_req[7:0];
  assign S_SC_R_1_SEND = S_SC_R_send[7:0];
  assign S_SC_R_recv[7:0] = S_SC_R_1_RECV;
  assign m_sc_clk_1 = m_sc_clk;
  assign m_sc_resetn_1 = m_sc_resetn;
  assign s01_ar_node_M_SC_RECV = M_SC_AR_recv[7:0];
  assign s01_r_node_M_SC_RECV = M_SC_R_recv[0];
  assign s_sc_clk_1 = s_sc_clk;
  assign s_sc_resetn_1 = s_sc_resetn;
  bd_63e1_sarn_1 s01_ar_node
       (.m_sc_aclk(m_sc_clk_1),
        .m_sc_aresetn(m_sc_resetn_1),
        .m_sc_info(s01_ar_node_M_SC_INFO),
        .m_sc_payld(s01_ar_node_M_SC_PAYLD),
        .m_sc_recv(s01_ar_node_M_SC_RECV),
        .m_sc_req(s01_ar_node_M_SC_REQ),
        .m_sc_send(s01_ar_node_M_SC_SEND),
        .s_sc_aclk(s_sc_clk_1),
        .s_sc_aresetn(s_sc_resetn_1),
        .s_sc_info(S_SC_AR_1_INFO),
        .s_sc_payld(S_SC_AR_1_PAYLD),
        .s_sc_recv(S_SC_AR_1_RECV),
        .s_sc_req(S_SC_AR_1_REQ),
        .s_sc_send(S_SC_AR_1_SEND));
  bd_63e1_srn_1 s01_r_node
       (.m_sc_aclk(s_sc_clk_1),
        .m_sc_aresetn(s_sc_resetn_1),
        .m_sc_info(s01_r_node_M_SC_INFO),
        .m_sc_payld(s01_r_node_M_SC_PAYLD),
        .m_sc_recv(s01_r_node_M_SC_RECV),
        .m_sc_req(s01_r_node_M_SC_REQ),
        .m_sc_send(s01_r_node_M_SC_SEND),
        .s_sc_aclk(m_sc_clk_1),
        .s_sc_aresetn(m_sc_resetn_1),
        .s_sc_info(S_SC_R_1_INFO),
        .s_sc_payld(S_SC_R_1_PAYLD),
        .s_sc_recv(S_SC_R_1_RECV),
        .s_sc_req(S_SC_R_1_REQ),
        .s_sc_send(S_SC_R_1_SEND));
endmodule

module s02_entry_pipeline_imp_23Y2W7
   (aclk,
    aresetn,
    m_axi_araddr,
    m_axi_arcache,
    m_axi_arid,
    m_axi_arlen,
    m_axi_arlock,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arready,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_awaddr,
    m_axi_awcache,
    m_axi_awid,
    m_axi_awlen,
    m_axi_awlock,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awready,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_bid,
    m_axi_bready,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_rdata,
    m_axi_rid,
    m_axi_rlast,
    m_axi_rready,
    m_axi_rresp,
    m_axi_ruser,
    m_axi_rvalid,
    m_axi_wdata,
    m_axi_wlast,
    m_axi_wready,
    m_axi_wstrb,
    m_axi_wuser,
    m_axi_wvalid,
    s_axi_araddr,
    s_axi_arburst,
    s_axi_arcache,
    s_axi_arlen,
    s_axi_arlock,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arready,
    s_axi_arsize,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_awaddr,
    s_axi_awburst,
    s_axi_awcache,
    s_axi_awlen,
    s_axi_awlock,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awready,
    s_axi_awsize,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_bready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_rdata,
    s_axi_rlast,
    s_axi_rready,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_wdata,
    s_axi_wlast,
    s_axi_wready,
    s_axi_wstrb,
    s_axi_wvalid);
  input aclk;
  input aresetn;
  output [31:0]m_axi_araddr;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arid;
  output [7:0]m_axi_arlen;
  output [0:0]m_axi_arlock;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  input m_axi_arready;
  output [1023:0]m_axi_aruser;
  output m_axi_arvalid;
  output [31:0]m_axi_awaddr;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awid;
  output [7:0]m_axi_awlen;
  output [0:0]m_axi_awlock;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  input m_axi_awready;
  output [1023:0]m_axi_awuser;
  output m_axi_awvalid;
  input [2:0]m_axi_bid;
  output m_axi_bready;
  input [1:0]m_axi_bresp;
  input [1023:0]m_axi_buser;
  input m_axi_bvalid;
  input [31:0]m_axi_rdata;
  input [2:0]m_axi_rid;
  input m_axi_rlast;
  output m_axi_rready;
  input [1:0]m_axi_rresp;
  input [1023:0]m_axi_ruser;
  input m_axi_rvalid;
  output [31:0]m_axi_wdata;
  output m_axi_wlast;
  input m_axi_wready;
  output [3:0]m_axi_wstrb;
  output [1023:0]m_axi_wuser;
  output m_axi_wvalid;
  input [31:0]s_axi_araddr;
  input [1:0]s_axi_arburst;
  input [3:0]s_axi_arcache;
  input [7:0]s_axi_arlen;
  input [0:0]s_axi_arlock;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  output s_axi_arready;
  input [2:0]s_axi_arsize;
  input [3:0]s_axi_aruser;
  input s_axi_arvalid;
  input [31:0]s_axi_awaddr;
  input [1:0]s_axi_awburst;
  input [3:0]s_axi_awcache;
  input [7:0]s_axi_awlen;
  input [0:0]s_axi_awlock;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  output s_axi_awready;
  input [2:0]s_axi_awsize;
  input [3:0]s_axi_awuser;
  input s_axi_awvalid;
  input s_axi_bready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  output [31:0]s_axi_rdata;
  output s_axi_rlast;
  input s_axi_rready;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;
  input [31:0]s_axi_wdata;
  input s_axi_wlast;
  output s_axi_wready;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;

  wire aclk_1;
  wire aresetn_1;
  wire [31:0]s02_mmu_M_AXI_ARADDR;
  wire [1:0]s02_mmu_M_AXI_ARBURST;
  wire [3:0]s02_mmu_M_AXI_ARCACHE;
  wire [7:0]s02_mmu_M_AXI_ARLEN;
  wire [0:0]s02_mmu_M_AXI_ARLOCK;
  wire [2:0]s02_mmu_M_AXI_ARPROT;
  wire [3:0]s02_mmu_M_AXI_ARQOS;
  wire s02_mmu_M_AXI_ARREADY;
  wire [2:0]s02_mmu_M_AXI_ARSIZE;
  wire [1023:0]s02_mmu_M_AXI_ARUSER;
  wire s02_mmu_M_AXI_ARVALID;
  wire [31:0]s02_mmu_M_AXI_AWADDR;
  wire [1:0]s02_mmu_M_AXI_AWBURST;
  wire [3:0]s02_mmu_M_AXI_AWCACHE;
  wire [7:0]s02_mmu_M_AXI_AWLEN;
  wire [0:0]s02_mmu_M_AXI_AWLOCK;
  wire [2:0]s02_mmu_M_AXI_AWPROT;
  wire [3:0]s02_mmu_M_AXI_AWQOS;
  wire s02_mmu_M_AXI_AWREADY;
  wire [2:0]s02_mmu_M_AXI_AWSIZE;
  wire [1023:0]s02_mmu_M_AXI_AWUSER;
  wire s02_mmu_M_AXI_AWVALID;
  wire s02_mmu_M_AXI_BREADY;
  wire [1:0]s02_mmu_M_AXI_BRESP;
  wire [1023:0]s02_mmu_M_AXI_BUSER;
  wire s02_mmu_M_AXI_BVALID;
  wire [31:0]s02_mmu_M_AXI_RDATA;
  wire s02_mmu_M_AXI_RLAST;
  wire s02_mmu_M_AXI_RREADY;
  wire [1:0]s02_mmu_M_AXI_RRESP;
  wire [1023:0]s02_mmu_M_AXI_RUSER;
  wire s02_mmu_M_AXI_RVALID;
  wire [31:0]s02_mmu_M_AXI_WDATA;
  wire s02_mmu_M_AXI_WLAST;
  wire s02_mmu_M_AXI_WREADY;
  wire [3:0]s02_mmu_M_AXI_WSTRB;
  wire [1023:0]s02_mmu_M_AXI_WUSER;
  wire s02_mmu_M_AXI_WVALID;
  wire [31:0]s02_si_converter_M_AXI_ARADDR;
  wire [3:0]s02_si_converter_M_AXI_ARCACHE;
  wire [2:0]s02_si_converter_M_AXI_ARID;
  wire [7:0]s02_si_converter_M_AXI_ARLEN;
  wire [0:0]s02_si_converter_M_AXI_ARLOCK;
  wire [2:0]s02_si_converter_M_AXI_ARPROT;
  wire [3:0]s02_si_converter_M_AXI_ARQOS;
  wire s02_si_converter_M_AXI_ARREADY;
  wire [1023:0]s02_si_converter_M_AXI_ARUSER;
  wire s02_si_converter_M_AXI_ARVALID;
  wire [31:0]s02_si_converter_M_AXI_AWADDR;
  wire [3:0]s02_si_converter_M_AXI_AWCACHE;
  wire [2:0]s02_si_converter_M_AXI_AWID;
  wire [7:0]s02_si_converter_M_AXI_AWLEN;
  wire [0:0]s02_si_converter_M_AXI_AWLOCK;
  wire [2:0]s02_si_converter_M_AXI_AWPROT;
  wire [3:0]s02_si_converter_M_AXI_AWQOS;
  wire s02_si_converter_M_AXI_AWREADY;
  wire [1023:0]s02_si_converter_M_AXI_AWUSER;
  wire s02_si_converter_M_AXI_AWVALID;
  wire [2:0]s02_si_converter_M_AXI_BID;
  wire s02_si_converter_M_AXI_BREADY;
  wire [1:0]s02_si_converter_M_AXI_BRESP;
  wire [1023:0]s02_si_converter_M_AXI_BUSER;
  wire s02_si_converter_M_AXI_BVALID;
  wire [31:0]s02_si_converter_M_AXI_RDATA;
  wire [2:0]s02_si_converter_M_AXI_RID;
  wire s02_si_converter_M_AXI_RLAST;
  wire s02_si_converter_M_AXI_RREADY;
  wire [1:0]s02_si_converter_M_AXI_RRESP;
  wire [1023:0]s02_si_converter_M_AXI_RUSER;
  wire s02_si_converter_M_AXI_RVALID;
  wire [31:0]s02_si_converter_M_AXI_WDATA;
  wire s02_si_converter_M_AXI_WLAST;
  wire s02_si_converter_M_AXI_WREADY;
  wire [3:0]s02_si_converter_M_AXI_WSTRB;
  wire [1023:0]s02_si_converter_M_AXI_WUSER;
  wire s02_si_converter_M_AXI_WVALID;
  wire [31:0]s02_transaction_regulator_M_AXI_ARADDR;
  wire [3:0]s02_transaction_regulator_M_AXI_ARCACHE;
  wire [2:0]s02_transaction_regulator_M_AXI_ARID;
  wire [7:0]s02_transaction_regulator_M_AXI_ARLEN;
  wire [0:0]s02_transaction_regulator_M_AXI_ARLOCK;
  wire [2:0]s02_transaction_regulator_M_AXI_ARPROT;
  wire [3:0]s02_transaction_regulator_M_AXI_ARQOS;
  wire s02_transaction_regulator_M_AXI_ARREADY;
  wire [2:0]s02_transaction_regulator_M_AXI_ARSIZE;
  wire [1023:0]s02_transaction_regulator_M_AXI_ARUSER;
  wire s02_transaction_regulator_M_AXI_ARVALID;
  wire [31:0]s02_transaction_regulator_M_AXI_AWADDR;
  wire [3:0]s02_transaction_regulator_M_AXI_AWCACHE;
  wire [2:0]s02_transaction_regulator_M_AXI_AWID;
  wire [7:0]s02_transaction_regulator_M_AXI_AWLEN;
  wire [0:0]s02_transaction_regulator_M_AXI_AWLOCK;
  wire [2:0]s02_transaction_regulator_M_AXI_AWPROT;
  wire [3:0]s02_transaction_regulator_M_AXI_AWQOS;
  wire s02_transaction_regulator_M_AXI_AWREADY;
  wire [2:0]s02_transaction_regulator_M_AXI_AWSIZE;
  wire [1023:0]s02_transaction_regulator_M_AXI_AWUSER;
  wire s02_transaction_regulator_M_AXI_AWVALID;
  wire [2:0]s02_transaction_regulator_M_AXI_BID;
  wire s02_transaction_regulator_M_AXI_BREADY;
  wire [1:0]s02_transaction_regulator_M_AXI_BRESP;
  wire [1023:0]s02_transaction_regulator_M_AXI_BUSER;
  wire s02_transaction_regulator_M_AXI_BVALID;
  wire [31:0]s02_transaction_regulator_M_AXI_RDATA;
  wire [2:0]s02_transaction_regulator_M_AXI_RID;
  wire s02_transaction_regulator_M_AXI_RLAST;
  wire s02_transaction_regulator_M_AXI_RREADY;
  wire [1:0]s02_transaction_regulator_M_AXI_RRESP;
  wire [1023:0]s02_transaction_regulator_M_AXI_RUSER;
  wire s02_transaction_regulator_M_AXI_RVALID;
  wire [31:0]s02_transaction_regulator_M_AXI_WDATA;
  wire s02_transaction_regulator_M_AXI_WLAST;
  wire s02_transaction_regulator_M_AXI_WREADY;
  wire [3:0]s02_transaction_regulator_M_AXI_WSTRB;
  wire [1023:0]s02_transaction_regulator_M_AXI_WUSER;
  wire s02_transaction_regulator_M_AXI_WVALID;
  wire [31:0]s_axi_1_ARADDR;
  wire [1:0]s_axi_1_ARBURST;
  wire [3:0]s_axi_1_ARCACHE;
  wire [7:0]s_axi_1_ARLEN;
  wire [0:0]s_axi_1_ARLOCK;
  wire [2:0]s_axi_1_ARPROT;
  wire [3:0]s_axi_1_ARQOS;
  wire s_axi_1_ARREADY;
  wire [2:0]s_axi_1_ARSIZE;
  wire [3:0]s_axi_1_ARUSER;
  wire s_axi_1_ARVALID;
  wire [31:0]s_axi_1_AWADDR;
  wire [1:0]s_axi_1_AWBURST;
  wire [3:0]s_axi_1_AWCACHE;
  wire [7:0]s_axi_1_AWLEN;
  wire [0:0]s_axi_1_AWLOCK;
  wire [2:0]s_axi_1_AWPROT;
  wire [3:0]s_axi_1_AWQOS;
  wire s_axi_1_AWREADY;
  wire [2:0]s_axi_1_AWSIZE;
  wire [3:0]s_axi_1_AWUSER;
  wire s_axi_1_AWVALID;
  wire s_axi_1_BREADY;
  wire [1:0]s_axi_1_BRESP;
  wire s_axi_1_BVALID;
  wire [31:0]s_axi_1_RDATA;
  wire s_axi_1_RLAST;
  wire s_axi_1_RREADY;
  wire [1:0]s_axi_1_RRESP;
  wire s_axi_1_RVALID;
  wire [31:0]s_axi_1_WDATA;
  wire s_axi_1_WLAST;
  wire s_axi_1_WREADY;
  wire [3:0]s_axi_1_WSTRB;
  wire s_axi_1_WVALID;

  assign aclk_1 = aclk;
  assign aresetn_1 = aresetn;
  assign m_axi_araddr[31:0] = s02_si_converter_M_AXI_ARADDR;
  assign m_axi_arcache[3:0] = s02_si_converter_M_AXI_ARCACHE;
  assign m_axi_arid[2:0] = s02_si_converter_M_AXI_ARID;
  assign m_axi_arlen[7:0] = s02_si_converter_M_AXI_ARLEN;
  assign m_axi_arlock[0] = s02_si_converter_M_AXI_ARLOCK;
  assign m_axi_arprot[2:0] = s02_si_converter_M_AXI_ARPROT;
  assign m_axi_arqos[3:0] = s02_si_converter_M_AXI_ARQOS;
  assign m_axi_aruser[1023:0] = s02_si_converter_M_AXI_ARUSER;
  assign m_axi_arvalid = s02_si_converter_M_AXI_ARVALID;
  assign m_axi_awaddr[31:0] = s02_si_converter_M_AXI_AWADDR;
  assign m_axi_awcache[3:0] = s02_si_converter_M_AXI_AWCACHE;
  assign m_axi_awid[2:0] = s02_si_converter_M_AXI_AWID;
  assign m_axi_awlen[7:0] = s02_si_converter_M_AXI_AWLEN;
  assign m_axi_awlock[0] = s02_si_converter_M_AXI_AWLOCK;
  assign m_axi_awprot[2:0] = s02_si_converter_M_AXI_AWPROT;
  assign m_axi_awqos[3:0] = s02_si_converter_M_AXI_AWQOS;
  assign m_axi_awuser[1023:0] = s02_si_converter_M_AXI_AWUSER;
  assign m_axi_awvalid = s02_si_converter_M_AXI_AWVALID;
  assign m_axi_bready = s02_si_converter_M_AXI_BREADY;
  assign m_axi_rready = s02_si_converter_M_AXI_RREADY;
  assign m_axi_wdata[31:0] = s02_si_converter_M_AXI_WDATA;
  assign m_axi_wlast = s02_si_converter_M_AXI_WLAST;
  assign m_axi_wstrb[3:0] = s02_si_converter_M_AXI_WSTRB;
  assign m_axi_wuser[1023:0] = s02_si_converter_M_AXI_WUSER;
  assign m_axi_wvalid = s02_si_converter_M_AXI_WVALID;
  assign s02_si_converter_M_AXI_ARREADY = m_axi_arready;
  assign s02_si_converter_M_AXI_AWREADY = m_axi_awready;
  assign s02_si_converter_M_AXI_BID = m_axi_bid[2:0];
  assign s02_si_converter_M_AXI_BRESP = m_axi_bresp[1:0];
  assign s02_si_converter_M_AXI_BUSER = m_axi_buser[1023:0];
  assign s02_si_converter_M_AXI_BVALID = m_axi_bvalid;
  assign s02_si_converter_M_AXI_RDATA = m_axi_rdata[31:0];
  assign s02_si_converter_M_AXI_RID = m_axi_rid[2:0];
  assign s02_si_converter_M_AXI_RLAST = m_axi_rlast;
  assign s02_si_converter_M_AXI_RRESP = m_axi_rresp[1:0];
  assign s02_si_converter_M_AXI_RUSER = m_axi_ruser[1023:0];
  assign s02_si_converter_M_AXI_RVALID = m_axi_rvalid;
  assign s02_si_converter_M_AXI_WREADY = m_axi_wready;
  assign s_axi_1_ARADDR = s_axi_araddr[31:0];
  assign s_axi_1_ARBURST = s_axi_arburst[1:0];
  assign s_axi_1_ARCACHE = s_axi_arcache[3:0];
  assign s_axi_1_ARLEN = s_axi_arlen[7:0];
  assign s_axi_1_ARLOCK = s_axi_arlock[0];
  assign s_axi_1_ARPROT = s_axi_arprot[2:0];
  assign s_axi_1_ARQOS = s_axi_arqos[3:0];
  assign s_axi_1_ARSIZE = s_axi_arsize[2:0];
  assign s_axi_1_ARUSER = s_axi_aruser[3:0];
  assign s_axi_1_ARVALID = s_axi_arvalid;
  assign s_axi_1_AWADDR = s_axi_awaddr[31:0];
  assign s_axi_1_AWBURST = s_axi_awburst[1:0];
  assign s_axi_1_AWCACHE = s_axi_awcache[3:0];
  assign s_axi_1_AWLEN = s_axi_awlen[7:0];
  assign s_axi_1_AWLOCK = s_axi_awlock[0];
  assign s_axi_1_AWPROT = s_axi_awprot[2:0];
  assign s_axi_1_AWQOS = s_axi_awqos[3:0];
  assign s_axi_1_AWSIZE = s_axi_awsize[2:0];
  assign s_axi_1_AWUSER = s_axi_awuser[3:0];
  assign s_axi_1_AWVALID = s_axi_awvalid;
  assign s_axi_1_BREADY = s_axi_bready;
  assign s_axi_1_RREADY = s_axi_rready;
  assign s_axi_1_WDATA = s_axi_wdata[31:0];
  assign s_axi_1_WLAST = s_axi_wlast;
  assign s_axi_1_WSTRB = s_axi_wstrb[3:0];
  assign s_axi_1_WVALID = s_axi_wvalid;
  assign s_axi_arready = s_axi_1_ARREADY;
  assign s_axi_awready = s_axi_1_AWREADY;
  assign s_axi_bresp[1:0] = s_axi_1_BRESP;
  assign s_axi_bvalid = s_axi_1_BVALID;
  assign s_axi_rdata[31:0] = s_axi_1_RDATA;
  assign s_axi_rlast = s_axi_1_RLAST;
  assign s_axi_rresp[1:0] = s_axi_1_RRESP;
  assign s_axi_rvalid = s_axi_1_RVALID;
  assign s_axi_wready = s_axi_1_WREADY;
  bd_63e1_s02mmu_0 s02_mmu
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_araddr(s02_mmu_M_AXI_ARADDR),
        .m_axi_arburst(s02_mmu_M_AXI_ARBURST),
        .m_axi_arcache(s02_mmu_M_AXI_ARCACHE),
        .m_axi_arlen(s02_mmu_M_AXI_ARLEN),
        .m_axi_arlock(s02_mmu_M_AXI_ARLOCK),
        .m_axi_arprot(s02_mmu_M_AXI_ARPROT),
        .m_axi_arqos(s02_mmu_M_AXI_ARQOS),
        .m_axi_arready(s02_mmu_M_AXI_ARREADY),
        .m_axi_arsize(s02_mmu_M_AXI_ARSIZE),
        .m_axi_aruser(s02_mmu_M_AXI_ARUSER),
        .m_axi_arvalid(s02_mmu_M_AXI_ARVALID),
        .m_axi_awaddr(s02_mmu_M_AXI_AWADDR),
        .m_axi_awburst(s02_mmu_M_AXI_AWBURST),
        .m_axi_awcache(s02_mmu_M_AXI_AWCACHE),
        .m_axi_awlen(s02_mmu_M_AXI_AWLEN),
        .m_axi_awlock(s02_mmu_M_AXI_AWLOCK),
        .m_axi_awprot(s02_mmu_M_AXI_AWPROT),
        .m_axi_awqos(s02_mmu_M_AXI_AWQOS),
        .m_axi_awready(s02_mmu_M_AXI_AWREADY),
        .m_axi_awsize(s02_mmu_M_AXI_AWSIZE),
        .m_axi_awuser(s02_mmu_M_AXI_AWUSER),
        .m_axi_awvalid(s02_mmu_M_AXI_AWVALID),
        .m_axi_bready(s02_mmu_M_AXI_BREADY),
        .m_axi_bresp(s02_mmu_M_AXI_BRESP),
        .m_axi_buser(s02_mmu_M_AXI_BUSER),
        .m_axi_bvalid(s02_mmu_M_AXI_BVALID),
        .m_axi_rdata(s02_mmu_M_AXI_RDATA),
        .m_axi_rlast(s02_mmu_M_AXI_RLAST),
        .m_axi_rready(s02_mmu_M_AXI_RREADY),
        .m_axi_rresp(s02_mmu_M_AXI_RRESP),
        .m_axi_ruser(s02_mmu_M_AXI_RUSER),
        .m_axi_rvalid(s02_mmu_M_AXI_RVALID),
        .m_axi_wdata(s02_mmu_M_AXI_WDATA),
        .m_axi_wlast(s02_mmu_M_AXI_WLAST),
        .m_axi_wready(s02_mmu_M_AXI_WREADY),
        .m_axi_wstrb(s02_mmu_M_AXI_WSTRB),
        .m_axi_wuser(s02_mmu_M_AXI_WUSER),
        .m_axi_wvalid(s02_mmu_M_AXI_WVALID),
        .s_axi_araddr(s_axi_1_ARADDR),
        .s_axi_arburst(s_axi_1_ARBURST),
        .s_axi_arcache(s_axi_1_ARCACHE),
        .s_axi_arlen(s_axi_1_ARLEN),
        .s_axi_arlock(s_axi_1_ARLOCK),
        .s_axi_arprot(s_axi_1_ARPROT),
        .s_axi_arqos(s_axi_1_ARQOS),
        .s_axi_arready(s_axi_1_ARREADY),
        .s_axi_arsize(s_axi_1_ARSIZE),
        .s_axi_aruser(s_axi_1_ARUSER),
        .s_axi_arvalid(s_axi_1_ARVALID),
        .s_axi_awaddr(s_axi_1_AWADDR),
        .s_axi_awburst(s_axi_1_AWBURST),
        .s_axi_awcache(s_axi_1_AWCACHE),
        .s_axi_awlen(s_axi_1_AWLEN),
        .s_axi_awlock(s_axi_1_AWLOCK),
        .s_axi_awprot(s_axi_1_AWPROT),
        .s_axi_awqos(s_axi_1_AWQOS),
        .s_axi_awready(s_axi_1_AWREADY),
        .s_axi_awsize(s_axi_1_AWSIZE),
        .s_axi_awuser(s_axi_1_AWUSER),
        .s_axi_awvalid(s_axi_1_AWVALID),
        .s_axi_bready(s_axi_1_BREADY),
        .s_axi_bresp(s_axi_1_BRESP),
        .s_axi_bvalid(s_axi_1_BVALID),
        .s_axi_rdata(s_axi_1_RDATA),
        .s_axi_rlast(s_axi_1_RLAST),
        .s_axi_rready(s_axi_1_RREADY),
        .s_axi_rresp(s_axi_1_RRESP),
        .s_axi_rvalid(s_axi_1_RVALID),
        .s_axi_wdata(s_axi_1_WDATA),
        .s_axi_wlast(s_axi_1_WLAST),
        .s_axi_wready(s_axi_1_WREADY),
        .s_axi_wstrb(s_axi_1_WSTRB),
        .s_axi_wvalid(s_axi_1_WVALID));
  bd_63e1_s02sic_0 s02_si_converter
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_araddr(s02_si_converter_M_AXI_ARADDR),
        .m_axi_arcache(s02_si_converter_M_AXI_ARCACHE),
        .m_axi_arid(s02_si_converter_M_AXI_ARID),
        .m_axi_arlen(s02_si_converter_M_AXI_ARLEN),
        .m_axi_arlock(s02_si_converter_M_AXI_ARLOCK),
        .m_axi_arprot(s02_si_converter_M_AXI_ARPROT),
        .m_axi_arqos(s02_si_converter_M_AXI_ARQOS),
        .m_axi_arready(s02_si_converter_M_AXI_ARREADY),
        .m_axi_aruser(s02_si_converter_M_AXI_ARUSER),
        .m_axi_arvalid(s02_si_converter_M_AXI_ARVALID),
        .m_axi_awaddr(s02_si_converter_M_AXI_AWADDR),
        .m_axi_awcache(s02_si_converter_M_AXI_AWCACHE),
        .m_axi_awid(s02_si_converter_M_AXI_AWID),
        .m_axi_awlen(s02_si_converter_M_AXI_AWLEN),
        .m_axi_awlock(s02_si_converter_M_AXI_AWLOCK),
        .m_axi_awprot(s02_si_converter_M_AXI_AWPROT),
        .m_axi_awqos(s02_si_converter_M_AXI_AWQOS),
        .m_axi_awready(s02_si_converter_M_AXI_AWREADY),
        .m_axi_awuser(s02_si_converter_M_AXI_AWUSER),
        .m_axi_awvalid(s02_si_converter_M_AXI_AWVALID),
        .m_axi_bid(s02_si_converter_M_AXI_BID),
        .m_axi_bready(s02_si_converter_M_AXI_BREADY),
        .m_axi_bresp(s02_si_converter_M_AXI_BRESP),
        .m_axi_buser(s02_si_converter_M_AXI_BUSER),
        .m_axi_bvalid(s02_si_converter_M_AXI_BVALID),
        .m_axi_rdata(s02_si_converter_M_AXI_RDATA),
        .m_axi_rid(s02_si_converter_M_AXI_RID),
        .m_axi_rlast(s02_si_converter_M_AXI_RLAST),
        .m_axi_rready(s02_si_converter_M_AXI_RREADY),
        .m_axi_rresp(s02_si_converter_M_AXI_RRESP),
        .m_axi_ruser(s02_si_converter_M_AXI_RUSER),
        .m_axi_rvalid(s02_si_converter_M_AXI_RVALID),
        .m_axi_wdata(s02_si_converter_M_AXI_WDATA),
        .m_axi_wlast(s02_si_converter_M_AXI_WLAST),
        .m_axi_wready(s02_si_converter_M_AXI_WREADY),
        .m_axi_wstrb(s02_si_converter_M_AXI_WSTRB),
        .m_axi_wuser(s02_si_converter_M_AXI_WUSER),
        .m_axi_wvalid(s02_si_converter_M_AXI_WVALID),
        .s_axi_araddr(s02_transaction_regulator_M_AXI_ARADDR),
        .s_axi_arcache(s02_transaction_regulator_M_AXI_ARCACHE),
        .s_axi_arid(s02_transaction_regulator_M_AXI_ARID),
        .s_axi_arlen(s02_transaction_regulator_M_AXI_ARLEN),
        .s_axi_arlock(s02_transaction_regulator_M_AXI_ARLOCK),
        .s_axi_arprot(s02_transaction_regulator_M_AXI_ARPROT),
        .s_axi_arqos(s02_transaction_regulator_M_AXI_ARQOS),
        .s_axi_arready(s02_transaction_regulator_M_AXI_ARREADY),
        .s_axi_arsize(s02_transaction_regulator_M_AXI_ARSIZE),
        .s_axi_aruser(s02_transaction_regulator_M_AXI_ARUSER),
        .s_axi_arvalid(s02_transaction_regulator_M_AXI_ARVALID),
        .s_axi_awaddr(s02_transaction_regulator_M_AXI_AWADDR),
        .s_axi_awcache(s02_transaction_regulator_M_AXI_AWCACHE),
        .s_axi_awid(s02_transaction_regulator_M_AXI_AWID),
        .s_axi_awlen(s02_transaction_regulator_M_AXI_AWLEN),
        .s_axi_awlock(s02_transaction_regulator_M_AXI_AWLOCK),
        .s_axi_awprot(s02_transaction_regulator_M_AXI_AWPROT),
        .s_axi_awqos(s02_transaction_regulator_M_AXI_AWQOS),
        .s_axi_awready(s02_transaction_regulator_M_AXI_AWREADY),
        .s_axi_awsize(s02_transaction_regulator_M_AXI_AWSIZE),
        .s_axi_awuser(s02_transaction_regulator_M_AXI_AWUSER),
        .s_axi_awvalid(s02_transaction_regulator_M_AXI_AWVALID),
        .s_axi_bid(s02_transaction_regulator_M_AXI_BID),
        .s_axi_bready(s02_transaction_regulator_M_AXI_BREADY),
        .s_axi_bresp(s02_transaction_regulator_M_AXI_BRESP),
        .s_axi_buser(s02_transaction_regulator_M_AXI_BUSER),
        .s_axi_bvalid(s02_transaction_regulator_M_AXI_BVALID),
        .s_axi_rdata(s02_transaction_regulator_M_AXI_RDATA),
        .s_axi_rid(s02_transaction_regulator_M_AXI_RID),
        .s_axi_rlast(s02_transaction_regulator_M_AXI_RLAST),
        .s_axi_rready(s02_transaction_regulator_M_AXI_RREADY),
        .s_axi_rresp(s02_transaction_regulator_M_AXI_RRESP),
        .s_axi_ruser(s02_transaction_regulator_M_AXI_RUSER),
        .s_axi_rvalid(s02_transaction_regulator_M_AXI_RVALID),
        .s_axi_wdata(s02_transaction_regulator_M_AXI_WDATA),
        .s_axi_wlast(s02_transaction_regulator_M_AXI_WLAST),
        .s_axi_wready(s02_transaction_regulator_M_AXI_WREADY),
        .s_axi_wstrb(s02_transaction_regulator_M_AXI_WSTRB),
        .s_axi_wuser(s02_transaction_regulator_M_AXI_WUSER),
        .s_axi_wvalid(s02_transaction_regulator_M_AXI_WVALID));
  bd_63e1_s02tr_0 s02_transaction_regulator
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_araddr(s02_transaction_regulator_M_AXI_ARADDR),
        .m_axi_arcache(s02_transaction_regulator_M_AXI_ARCACHE),
        .m_axi_arid(s02_transaction_regulator_M_AXI_ARID),
        .m_axi_arlen(s02_transaction_regulator_M_AXI_ARLEN),
        .m_axi_arlock(s02_transaction_regulator_M_AXI_ARLOCK),
        .m_axi_arprot(s02_transaction_regulator_M_AXI_ARPROT),
        .m_axi_arqos(s02_transaction_regulator_M_AXI_ARQOS),
        .m_axi_arready(s02_transaction_regulator_M_AXI_ARREADY),
        .m_axi_arsize(s02_transaction_regulator_M_AXI_ARSIZE),
        .m_axi_aruser(s02_transaction_regulator_M_AXI_ARUSER),
        .m_axi_arvalid(s02_transaction_regulator_M_AXI_ARVALID),
        .m_axi_awaddr(s02_transaction_regulator_M_AXI_AWADDR),
        .m_axi_awcache(s02_transaction_regulator_M_AXI_AWCACHE),
        .m_axi_awid(s02_transaction_regulator_M_AXI_AWID),
        .m_axi_awlen(s02_transaction_regulator_M_AXI_AWLEN),
        .m_axi_awlock(s02_transaction_regulator_M_AXI_AWLOCK),
        .m_axi_awprot(s02_transaction_regulator_M_AXI_AWPROT),
        .m_axi_awqos(s02_transaction_regulator_M_AXI_AWQOS),
        .m_axi_awready(s02_transaction_regulator_M_AXI_AWREADY),
        .m_axi_awsize(s02_transaction_regulator_M_AXI_AWSIZE),
        .m_axi_awuser(s02_transaction_regulator_M_AXI_AWUSER),
        .m_axi_awvalid(s02_transaction_regulator_M_AXI_AWVALID),
        .m_axi_bid(s02_transaction_regulator_M_AXI_BID),
        .m_axi_bready(s02_transaction_regulator_M_AXI_BREADY),
        .m_axi_bresp(s02_transaction_regulator_M_AXI_BRESP),
        .m_axi_buser(s02_transaction_regulator_M_AXI_BUSER),
        .m_axi_bvalid(s02_transaction_regulator_M_AXI_BVALID),
        .m_axi_rdata(s02_transaction_regulator_M_AXI_RDATA),
        .m_axi_rid(s02_transaction_regulator_M_AXI_RID),
        .m_axi_rlast(s02_transaction_regulator_M_AXI_RLAST),
        .m_axi_rready(s02_transaction_regulator_M_AXI_RREADY),
        .m_axi_rresp(s02_transaction_regulator_M_AXI_RRESP),
        .m_axi_ruser(s02_transaction_regulator_M_AXI_RUSER),
        .m_axi_rvalid(s02_transaction_regulator_M_AXI_RVALID),
        .m_axi_wdata(s02_transaction_regulator_M_AXI_WDATA),
        .m_axi_wlast(s02_transaction_regulator_M_AXI_WLAST),
        .m_axi_wready(s02_transaction_regulator_M_AXI_WREADY),
        .m_axi_wstrb(s02_transaction_regulator_M_AXI_WSTRB),
        .m_axi_wuser(s02_transaction_regulator_M_AXI_WUSER),
        .m_axi_wvalid(s02_transaction_regulator_M_AXI_WVALID),
        .s_axi_araddr(s02_mmu_M_AXI_ARADDR),
        .s_axi_arburst(s02_mmu_M_AXI_ARBURST),
        .s_axi_arcache(s02_mmu_M_AXI_ARCACHE),
        .s_axi_arlen(s02_mmu_M_AXI_ARLEN),
        .s_axi_arlock(s02_mmu_M_AXI_ARLOCK),
        .s_axi_arprot(s02_mmu_M_AXI_ARPROT),
        .s_axi_arqos(s02_mmu_M_AXI_ARQOS),
        .s_axi_arready(s02_mmu_M_AXI_ARREADY),
        .s_axi_arsize(s02_mmu_M_AXI_ARSIZE),
        .s_axi_aruser(s02_mmu_M_AXI_ARUSER),
        .s_axi_arvalid(s02_mmu_M_AXI_ARVALID),
        .s_axi_awaddr(s02_mmu_M_AXI_AWADDR),
        .s_axi_awburst(s02_mmu_M_AXI_AWBURST),
        .s_axi_awcache(s02_mmu_M_AXI_AWCACHE),
        .s_axi_awlen(s02_mmu_M_AXI_AWLEN),
        .s_axi_awlock(s02_mmu_M_AXI_AWLOCK),
        .s_axi_awprot(s02_mmu_M_AXI_AWPROT),
        .s_axi_awqos(s02_mmu_M_AXI_AWQOS),
        .s_axi_awready(s02_mmu_M_AXI_AWREADY),
        .s_axi_awsize(s02_mmu_M_AXI_AWSIZE),
        .s_axi_awuser(s02_mmu_M_AXI_AWUSER),
        .s_axi_awvalid(s02_mmu_M_AXI_AWVALID),
        .s_axi_bready(s02_mmu_M_AXI_BREADY),
        .s_axi_bresp(s02_mmu_M_AXI_BRESP),
        .s_axi_buser(s02_mmu_M_AXI_BUSER),
        .s_axi_bvalid(s02_mmu_M_AXI_BVALID),
        .s_axi_rdata(s02_mmu_M_AXI_RDATA),
        .s_axi_rlast(s02_mmu_M_AXI_RLAST),
        .s_axi_rready(s02_mmu_M_AXI_RREADY),
        .s_axi_rresp(s02_mmu_M_AXI_RRESP),
        .s_axi_ruser(s02_mmu_M_AXI_RUSER),
        .s_axi_rvalid(s02_mmu_M_AXI_RVALID),
        .s_axi_wdata(s02_mmu_M_AXI_WDATA),
        .s_axi_wlast(s02_mmu_M_AXI_WLAST),
        .s_axi_wready(s02_mmu_M_AXI_WREADY),
        .s_axi_wstrb(s02_mmu_M_AXI_WSTRB),
        .s_axi_wuser(s02_mmu_M_AXI_WUSER),
        .s_axi_wvalid(s02_mmu_M_AXI_WVALID));
endmodule

module s02_nodes_imp_8K7Q7T
   (M_SC_AR_info,
    M_SC_AR_payld,
    M_SC_AR_recv,
    M_SC_AR_req,
    M_SC_AR_send,
    M_SC_AW_info,
    M_SC_AW_payld,
    M_SC_AW_recv,
    M_SC_AW_req,
    M_SC_AW_send,
    M_SC_B_info,
    M_SC_B_payld,
    M_SC_B_recv,
    M_SC_B_req,
    M_SC_B_send,
    M_SC_R_info,
    M_SC_R_payld,
    M_SC_R_recv,
    M_SC_R_req,
    M_SC_R_send,
    M_SC_W_info,
    M_SC_W_payld,
    M_SC_W_recv,
    M_SC_W_req,
    M_SC_W_send,
    S_SC_AR_info,
    S_SC_AR_payld,
    S_SC_AR_recv,
    S_SC_AR_req,
    S_SC_AR_send,
    S_SC_AW_info,
    S_SC_AW_payld,
    S_SC_AW_recv,
    S_SC_AW_req,
    S_SC_AW_send,
    S_SC_B_info,
    S_SC_B_payld,
    S_SC_B_recv,
    S_SC_B_req,
    S_SC_B_send,
    S_SC_R_info,
    S_SC_R_payld,
    S_SC_R_recv,
    S_SC_R_req,
    S_SC_R_send,
    S_SC_W_info,
    S_SC_W_payld,
    S_SC_W_recv,
    S_SC_W_req,
    S_SC_W_send,
    m_sc_clk,
    m_sc_resetn,
    s_sc_clk,
    s_sc_resetn);
  output [7:0]M_SC_AR_info;
  output [155:0]M_SC_AR_payld;
  input [7:0]M_SC_AR_recv;
  output [7:0]M_SC_AR_req;
  output [7:0]M_SC_AR_send;
  output [7:0]M_SC_AW_info;
  output [155:0]M_SC_AW_payld;
  input [7:0]M_SC_AW_recv;
  output [7:0]M_SC_AW_req;
  output [7:0]M_SC_AW_send;
  output [0:0]M_SC_B_info;
  output [11:0]M_SC_B_payld;
  input [0:0]M_SC_B_recv;
  output [0:0]M_SC_B_req;
  output [0:0]M_SC_B_send;
  output [0:0]M_SC_R_info;
  output [89:0]M_SC_R_payld;
  input [0:0]M_SC_R_recv;
  output [0:0]M_SC_R_req;
  output [0:0]M_SC_R_send;
  output [7:0]M_SC_W_info;
  output [94:0]M_SC_W_payld;
  input [7:0]M_SC_W_recv;
  output [7:0]M_SC_W_req;
  output [7:0]M_SC_W_send;
  input [0:0]S_SC_AR_info;
  input [155:0]S_SC_AR_payld;
  output [0:0]S_SC_AR_recv;
  input [0:0]S_SC_AR_req;
  input [0:0]S_SC_AR_send;
  input [0:0]S_SC_AW_info;
  input [155:0]S_SC_AW_payld;
  output [0:0]S_SC_AW_recv;
  input [0:0]S_SC_AW_req;
  input [0:0]S_SC_AW_send;
  input [7:0]S_SC_B_info;
  input [11:0]S_SC_B_payld;
  output [7:0]S_SC_B_recv;
  input [7:0]S_SC_B_req;
  input [7:0]S_SC_B_send;
  input [7:0]S_SC_R_info;
  input [89:0]S_SC_R_payld;
  output [7:0]S_SC_R_recv;
  input [7:0]S_SC_R_req;
  input [7:0]S_SC_R_send;
  input [0:0]S_SC_W_info;
  input [94:0]S_SC_W_payld;
  output [0:0]S_SC_W_recv;
  input [0:0]S_SC_W_req;
  input [0:0]S_SC_W_send;
  input m_sc_clk;
  input m_sc_resetn;
  input s_sc_clk;
  input s_sc_resetn;

  wire [0:0]S_SC_AR_1_INFO;
  wire [155:0]S_SC_AR_1_PAYLD;
  wire [0:0]S_SC_AR_1_RECV;
  wire [0:0]S_SC_AR_1_REQ;
  wire [0:0]S_SC_AR_1_SEND;
  wire [0:0]S_SC_AW_1_INFO;
  wire [155:0]S_SC_AW_1_PAYLD;
  wire [0:0]S_SC_AW_1_RECV;
  wire [0:0]S_SC_AW_1_REQ;
  wire [0:0]S_SC_AW_1_SEND;
  wire [7:0]S_SC_B_1_INFO;
  wire [11:0]S_SC_B_1_PAYLD;
  wire [7:0]S_SC_B_1_RECV;
  wire [7:0]S_SC_B_1_REQ;
  wire [7:0]S_SC_B_1_SEND;
  wire [7:0]S_SC_R_1_INFO;
  wire [89:0]S_SC_R_1_PAYLD;
  wire [7:0]S_SC_R_1_RECV;
  wire [7:0]S_SC_R_1_REQ;
  wire [7:0]S_SC_R_1_SEND;
  wire [0:0]S_SC_W_1_INFO;
  wire [94:0]S_SC_W_1_PAYLD;
  wire [0:0]S_SC_W_1_RECV;
  wire [0:0]S_SC_W_1_REQ;
  wire [0:0]S_SC_W_1_SEND;
  wire m_sc_clk_1;
  wire m_sc_resetn_1;
  wire [7:0]s02_ar_node_M_SC_INFO;
  wire [155:0]s02_ar_node_M_SC_PAYLD;
  wire [7:0]s02_ar_node_M_SC_RECV;
  wire [7:0]s02_ar_node_M_SC_REQ;
  wire [7:0]s02_ar_node_M_SC_SEND;
  wire [7:0]s02_aw_node_M_SC_INFO;
  wire [155:0]s02_aw_node_M_SC_PAYLD;
  wire [7:0]s02_aw_node_M_SC_RECV;
  wire [7:0]s02_aw_node_M_SC_REQ;
  wire [7:0]s02_aw_node_M_SC_SEND;
  wire [0:0]s02_b_node_M_SC_INFO;
  wire [11:0]s02_b_node_M_SC_PAYLD;
  wire [0:0]s02_b_node_M_SC_RECV;
  wire [0:0]s02_b_node_M_SC_REQ;
  wire [0:0]s02_b_node_M_SC_SEND;
  wire [0:0]s02_r_node_M_SC_INFO;
  wire [89:0]s02_r_node_M_SC_PAYLD;
  wire [0:0]s02_r_node_M_SC_RECV;
  wire [0:0]s02_r_node_M_SC_REQ;
  wire [0:0]s02_r_node_M_SC_SEND;
  wire [7:0]s02_w_node_M_SC_INFO;
  wire [94:0]s02_w_node_M_SC_PAYLD;
  wire [7:0]s02_w_node_M_SC_RECV;
  wire [7:0]s02_w_node_M_SC_REQ;
  wire [7:0]s02_w_node_M_SC_SEND;
  wire s_sc_clk_1;
  wire s_sc_resetn_1;

  assign M_SC_AR_info[7:0] = s02_ar_node_M_SC_INFO;
  assign M_SC_AR_payld[155:0] = s02_ar_node_M_SC_PAYLD;
  assign M_SC_AR_req[7:0] = s02_ar_node_M_SC_REQ;
  assign M_SC_AR_send[7:0] = s02_ar_node_M_SC_SEND;
  assign M_SC_AW_info[7:0] = s02_aw_node_M_SC_INFO;
  assign M_SC_AW_payld[155:0] = s02_aw_node_M_SC_PAYLD;
  assign M_SC_AW_req[7:0] = s02_aw_node_M_SC_REQ;
  assign M_SC_AW_send[7:0] = s02_aw_node_M_SC_SEND;
  assign M_SC_B_info[0] = s02_b_node_M_SC_INFO;
  assign M_SC_B_payld[11:0] = s02_b_node_M_SC_PAYLD;
  assign M_SC_B_req[0] = s02_b_node_M_SC_REQ;
  assign M_SC_B_send[0] = s02_b_node_M_SC_SEND;
  assign M_SC_R_info[0] = s02_r_node_M_SC_INFO;
  assign M_SC_R_payld[89:0] = s02_r_node_M_SC_PAYLD;
  assign M_SC_R_req[0] = s02_r_node_M_SC_REQ;
  assign M_SC_R_send[0] = s02_r_node_M_SC_SEND;
  assign M_SC_W_info[7:0] = s02_w_node_M_SC_INFO;
  assign M_SC_W_payld[94:0] = s02_w_node_M_SC_PAYLD;
  assign M_SC_W_req[7:0] = s02_w_node_M_SC_REQ;
  assign M_SC_W_send[7:0] = s02_w_node_M_SC_SEND;
  assign S_SC_AR_1_INFO = S_SC_AR_info[0];
  assign S_SC_AR_1_PAYLD = S_SC_AR_payld[155:0];
  assign S_SC_AR_1_REQ = S_SC_AR_req[0];
  assign S_SC_AR_1_SEND = S_SC_AR_send[0];
  assign S_SC_AR_recv[0] = S_SC_AR_1_RECV;
  assign S_SC_AW_1_INFO = S_SC_AW_info[0];
  assign S_SC_AW_1_PAYLD = S_SC_AW_payld[155:0];
  assign S_SC_AW_1_REQ = S_SC_AW_req[0];
  assign S_SC_AW_1_SEND = S_SC_AW_send[0];
  assign S_SC_AW_recv[0] = S_SC_AW_1_RECV;
  assign S_SC_B_1_INFO = S_SC_B_info[7:0];
  assign S_SC_B_1_PAYLD = S_SC_B_payld[11:0];
  assign S_SC_B_1_REQ = S_SC_B_req[7:0];
  assign S_SC_B_1_SEND = S_SC_B_send[7:0];
  assign S_SC_B_recv[7:0] = S_SC_B_1_RECV;
  assign S_SC_R_1_INFO = S_SC_R_info[7:0];
  assign S_SC_R_1_PAYLD = S_SC_R_payld[89:0];
  assign S_SC_R_1_REQ = S_SC_R_req[7:0];
  assign S_SC_R_1_SEND = S_SC_R_send[7:0];
  assign S_SC_R_recv[7:0] = S_SC_R_1_RECV;
  assign S_SC_W_1_INFO = S_SC_W_info[0];
  assign S_SC_W_1_PAYLD = S_SC_W_payld[94:0];
  assign S_SC_W_1_REQ = S_SC_W_req[0];
  assign S_SC_W_1_SEND = S_SC_W_send[0];
  assign S_SC_W_recv[0] = S_SC_W_1_RECV;
  assign m_sc_clk_1 = m_sc_clk;
  assign m_sc_resetn_1 = m_sc_resetn;
  assign s02_ar_node_M_SC_RECV = M_SC_AR_recv[7:0];
  assign s02_aw_node_M_SC_RECV = M_SC_AW_recv[7:0];
  assign s02_b_node_M_SC_RECV = M_SC_B_recv[0];
  assign s02_r_node_M_SC_RECV = M_SC_R_recv[0];
  assign s02_w_node_M_SC_RECV = M_SC_W_recv[7:0];
  assign s_sc_clk_1 = s_sc_clk;
  assign s_sc_resetn_1 = s_sc_resetn;
  bd_63e1_sarn_2 s02_ar_node
       (.m_sc_aclk(m_sc_clk_1),
        .m_sc_aresetn(m_sc_resetn_1),
        .m_sc_info(s02_ar_node_M_SC_INFO),
        .m_sc_payld(s02_ar_node_M_SC_PAYLD),
        .m_sc_recv(s02_ar_node_M_SC_RECV),
        .m_sc_req(s02_ar_node_M_SC_REQ),
        .m_sc_send(s02_ar_node_M_SC_SEND),
        .s_sc_aclk(s_sc_clk_1),
        .s_sc_aresetn(s_sc_resetn_1),
        .s_sc_info(S_SC_AR_1_INFO),
        .s_sc_payld(S_SC_AR_1_PAYLD),
        .s_sc_recv(S_SC_AR_1_RECV),
        .s_sc_req(S_SC_AR_1_REQ),
        .s_sc_send(S_SC_AR_1_SEND));
  bd_63e1_sawn_1 s02_aw_node
       (.m_sc_aclk(m_sc_clk_1),
        .m_sc_aresetn(m_sc_resetn_1),
        .m_sc_info(s02_aw_node_M_SC_INFO),
        .m_sc_payld(s02_aw_node_M_SC_PAYLD),
        .m_sc_recv(s02_aw_node_M_SC_RECV),
        .m_sc_req(s02_aw_node_M_SC_REQ),
        .m_sc_send(s02_aw_node_M_SC_SEND),
        .s_sc_aclk(s_sc_clk_1),
        .s_sc_aresetn(s_sc_resetn_1),
        .s_sc_info(S_SC_AW_1_INFO),
        .s_sc_payld(S_SC_AW_1_PAYLD),
        .s_sc_recv(S_SC_AW_1_RECV),
        .s_sc_req(S_SC_AW_1_REQ),
        .s_sc_send(S_SC_AW_1_SEND));
  bd_63e1_sbn_1 s02_b_node
       (.m_sc_aclk(s_sc_clk_1),
        .m_sc_aresetn(s_sc_resetn_1),
        .m_sc_info(s02_b_node_M_SC_INFO),
        .m_sc_payld(s02_b_node_M_SC_PAYLD),
        .m_sc_recv(s02_b_node_M_SC_RECV),
        .m_sc_req(s02_b_node_M_SC_REQ),
        .m_sc_send(s02_b_node_M_SC_SEND),
        .s_sc_aclk(m_sc_clk_1),
        .s_sc_aresetn(m_sc_resetn_1),
        .s_sc_info(S_SC_B_1_INFO),
        .s_sc_payld(S_SC_B_1_PAYLD),
        .s_sc_recv(S_SC_B_1_RECV),
        .s_sc_req(S_SC_B_1_REQ),
        .s_sc_send(S_SC_B_1_SEND));
  bd_63e1_srn_2 s02_r_node
       (.m_sc_aclk(s_sc_clk_1),
        .m_sc_aresetn(s_sc_resetn_1),
        .m_sc_info(s02_r_node_M_SC_INFO),
        .m_sc_payld(s02_r_node_M_SC_PAYLD),
        .m_sc_recv(s02_r_node_M_SC_RECV),
        .m_sc_req(s02_r_node_M_SC_REQ),
        .m_sc_send(s02_r_node_M_SC_SEND),
        .s_sc_aclk(m_sc_clk_1),
        .s_sc_aresetn(m_sc_resetn_1),
        .s_sc_info(S_SC_R_1_INFO),
        .s_sc_payld(S_SC_R_1_PAYLD),
        .s_sc_recv(S_SC_R_1_RECV),
        .s_sc_req(S_SC_R_1_REQ),
        .s_sc_send(S_SC_R_1_SEND));
  bd_63e1_swn_1 s02_w_node
       (.m_sc_aclk(m_sc_clk_1),
        .m_sc_aresetn(m_sc_resetn_1),
        .m_sc_info(s02_w_node_M_SC_INFO),
        .m_sc_payld(s02_w_node_M_SC_PAYLD),
        .m_sc_recv(s02_w_node_M_SC_RECV),
        .m_sc_req(s02_w_node_M_SC_REQ),
        .m_sc_send(s02_w_node_M_SC_SEND),
        .s_sc_aclk(s_sc_clk_1),
        .s_sc_aresetn(s_sc_resetn_1),
        .s_sc_info(S_SC_W_1_INFO),
        .s_sc_payld(S_SC_W_1_PAYLD),
        .s_sc_recv(S_SC_W_1_RECV),
        .s_sc_req(S_SC_W_1_REQ),
        .s_sc_send(S_SC_W_1_SEND));
endmodule

module s03_entry_pipeline_imp_17JCOAB
   (aclk,
    aresetn,
    m_axi_awaddr,
    m_axi_awcache,
    m_axi_awid,
    m_axi_awlen,
    m_axi_awlock,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awready,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_bid,
    m_axi_bready,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_wdata,
    m_axi_wlast,
    m_axi_wready,
    m_axi_wstrb,
    m_axi_wuser,
    m_axi_wvalid,
    s_axi_awaddr,
    s_axi_awburst,
    s_axi_awcache,
    s_axi_awlen,
    s_axi_awlock,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awready,
    s_axi_awsize,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_bready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_wdata,
    s_axi_wlast,
    s_axi_wready,
    s_axi_wstrb,
    s_axi_wvalid);
  input aclk;
  input aresetn;
  output [31:0]m_axi_awaddr;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awid;
  output [7:0]m_axi_awlen;
  output [0:0]m_axi_awlock;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  input m_axi_awready;
  output [1023:0]m_axi_awuser;
  output m_axi_awvalid;
  input [2:0]m_axi_bid;
  output m_axi_bready;
  input [1:0]m_axi_bresp;
  input [1023:0]m_axi_buser;
  input m_axi_bvalid;
  output [31:0]m_axi_wdata;
  output m_axi_wlast;
  input m_axi_wready;
  output [3:0]m_axi_wstrb;
  output [1023:0]m_axi_wuser;
  output m_axi_wvalid;
  input [31:0]s_axi_awaddr;
  input [1:0]s_axi_awburst;
  input [3:0]s_axi_awcache;
  input [7:0]s_axi_awlen;
  input [0:0]s_axi_awlock;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  output s_axi_awready;
  input [2:0]s_axi_awsize;
  input [3:0]s_axi_awuser;
  input s_axi_awvalid;
  input s_axi_bready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input [31:0]s_axi_wdata;
  input s_axi_wlast;
  output s_axi_wready;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;

  wire aclk_1;
  wire aresetn_1;
  wire [31:0]s03_mmu_M_AXI_AWADDR;
  wire [1:0]s03_mmu_M_AXI_AWBURST;
  wire [3:0]s03_mmu_M_AXI_AWCACHE;
  wire [7:0]s03_mmu_M_AXI_AWLEN;
  wire [0:0]s03_mmu_M_AXI_AWLOCK;
  wire [2:0]s03_mmu_M_AXI_AWPROT;
  wire [3:0]s03_mmu_M_AXI_AWQOS;
  wire s03_mmu_M_AXI_AWREADY;
  wire [2:0]s03_mmu_M_AXI_AWSIZE;
  wire [1023:0]s03_mmu_M_AXI_AWUSER;
  wire s03_mmu_M_AXI_AWVALID;
  wire s03_mmu_M_AXI_BREADY;
  wire [1:0]s03_mmu_M_AXI_BRESP;
  wire [1023:0]s03_mmu_M_AXI_BUSER;
  wire s03_mmu_M_AXI_BVALID;
  wire [31:0]s03_mmu_M_AXI_WDATA;
  wire s03_mmu_M_AXI_WLAST;
  wire s03_mmu_M_AXI_WREADY;
  wire [3:0]s03_mmu_M_AXI_WSTRB;
  wire [1023:0]s03_mmu_M_AXI_WUSER;
  wire s03_mmu_M_AXI_WVALID;
  wire [31:0]s03_si_converter_M_AXI_AWADDR;
  wire [3:0]s03_si_converter_M_AXI_AWCACHE;
  wire [2:0]s03_si_converter_M_AXI_AWID;
  wire [7:0]s03_si_converter_M_AXI_AWLEN;
  wire [0:0]s03_si_converter_M_AXI_AWLOCK;
  wire [2:0]s03_si_converter_M_AXI_AWPROT;
  wire [3:0]s03_si_converter_M_AXI_AWQOS;
  wire s03_si_converter_M_AXI_AWREADY;
  wire [1023:0]s03_si_converter_M_AXI_AWUSER;
  wire s03_si_converter_M_AXI_AWVALID;
  wire [2:0]s03_si_converter_M_AXI_BID;
  wire s03_si_converter_M_AXI_BREADY;
  wire [1:0]s03_si_converter_M_AXI_BRESP;
  wire [1023:0]s03_si_converter_M_AXI_BUSER;
  wire s03_si_converter_M_AXI_BVALID;
  wire [31:0]s03_si_converter_M_AXI_WDATA;
  wire s03_si_converter_M_AXI_WLAST;
  wire s03_si_converter_M_AXI_WREADY;
  wire [3:0]s03_si_converter_M_AXI_WSTRB;
  wire [1023:0]s03_si_converter_M_AXI_WUSER;
  wire s03_si_converter_M_AXI_WVALID;
  wire [31:0]s03_transaction_regulator_M_AXI_AWADDR;
  wire [3:0]s03_transaction_regulator_M_AXI_AWCACHE;
  wire [2:0]s03_transaction_regulator_M_AXI_AWID;
  wire [7:0]s03_transaction_regulator_M_AXI_AWLEN;
  wire [0:0]s03_transaction_regulator_M_AXI_AWLOCK;
  wire [2:0]s03_transaction_regulator_M_AXI_AWPROT;
  wire [3:0]s03_transaction_regulator_M_AXI_AWQOS;
  wire s03_transaction_regulator_M_AXI_AWREADY;
  wire [2:0]s03_transaction_regulator_M_AXI_AWSIZE;
  wire [1023:0]s03_transaction_regulator_M_AXI_AWUSER;
  wire s03_transaction_regulator_M_AXI_AWVALID;
  wire [2:0]s03_transaction_regulator_M_AXI_BID;
  wire s03_transaction_regulator_M_AXI_BREADY;
  wire [1:0]s03_transaction_regulator_M_AXI_BRESP;
  wire [1023:0]s03_transaction_regulator_M_AXI_BUSER;
  wire s03_transaction_regulator_M_AXI_BVALID;
  wire [31:0]s03_transaction_regulator_M_AXI_WDATA;
  wire s03_transaction_regulator_M_AXI_WLAST;
  wire s03_transaction_regulator_M_AXI_WREADY;
  wire [3:0]s03_transaction_regulator_M_AXI_WSTRB;
  wire [1023:0]s03_transaction_regulator_M_AXI_WUSER;
  wire s03_transaction_regulator_M_AXI_WVALID;
  wire [31:0]s_axi_1_AWADDR;
  wire [1:0]s_axi_1_AWBURST;
  wire [3:0]s_axi_1_AWCACHE;
  wire [7:0]s_axi_1_AWLEN;
  wire [0:0]s_axi_1_AWLOCK;
  wire [2:0]s_axi_1_AWPROT;
  wire [3:0]s_axi_1_AWQOS;
  wire s_axi_1_AWREADY;
  wire [2:0]s_axi_1_AWSIZE;
  wire [3:0]s_axi_1_AWUSER;
  wire s_axi_1_AWVALID;
  wire s_axi_1_BREADY;
  wire [1:0]s_axi_1_BRESP;
  wire s_axi_1_BVALID;
  wire [31:0]s_axi_1_WDATA;
  wire s_axi_1_WLAST;
  wire s_axi_1_WREADY;
  wire [3:0]s_axi_1_WSTRB;
  wire s_axi_1_WVALID;

  assign aclk_1 = aclk;
  assign aresetn_1 = aresetn;
  assign m_axi_awaddr[31:0] = s03_si_converter_M_AXI_AWADDR;
  assign m_axi_awcache[3:0] = s03_si_converter_M_AXI_AWCACHE;
  assign m_axi_awid[2:0] = s03_si_converter_M_AXI_AWID;
  assign m_axi_awlen[7:0] = s03_si_converter_M_AXI_AWLEN;
  assign m_axi_awlock[0] = s03_si_converter_M_AXI_AWLOCK;
  assign m_axi_awprot[2:0] = s03_si_converter_M_AXI_AWPROT;
  assign m_axi_awqos[3:0] = s03_si_converter_M_AXI_AWQOS;
  assign m_axi_awuser[1023:0] = s03_si_converter_M_AXI_AWUSER;
  assign m_axi_awvalid = s03_si_converter_M_AXI_AWVALID;
  assign m_axi_bready = s03_si_converter_M_AXI_BREADY;
  assign m_axi_wdata[31:0] = s03_si_converter_M_AXI_WDATA;
  assign m_axi_wlast = s03_si_converter_M_AXI_WLAST;
  assign m_axi_wstrb[3:0] = s03_si_converter_M_AXI_WSTRB;
  assign m_axi_wuser[1023:0] = s03_si_converter_M_AXI_WUSER;
  assign m_axi_wvalid = s03_si_converter_M_AXI_WVALID;
  assign s03_si_converter_M_AXI_AWREADY = m_axi_awready;
  assign s03_si_converter_M_AXI_BID = m_axi_bid[2:0];
  assign s03_si_converter_M_AXI_BRESP = m_axi_bresp[1:0];
  assign s03_si_converter_M_AXI_BUSER = m_axi_buser[1023:0];
  assign s03_si_converter_M_AXI_BVALID = m_axi_bvalid;
  assign s03_si_converter_M_AXI_WREADY = m_axi_wready;
  assign s_axi_1_AWADDR = s_axi_awaddr[31:0];
  assign s_axi_1_AWBURST = s_axi_awburst[1:0];
  assign s_axi_1_AWCACHE = s_axi_awcache[3:0];
  assign s_axi_1_AWLEN = s_axi_awlen[7:0];
  assign s_axi_1_AWLOCK = s_axi_awlock[0];
  assign s_axi_1_AWPROT = s_axi_awprot[2:0];
  assign s_axi_1_AWQOS = s_axi_awqos[3:0];
  assign s_axi_1_AWSIZE = s_axi_awsize[2:0];
  assign s_axi_1_AWUSER = s_axi_awuser[3:0];
  assign s_axi_1_AWVALID = s_axi_awvalid;
  assign s_axi_1_BREADY = s_axi_bready;
  assign s_axi_1_WDATA = s_axi_wdata[31:0];
  assign s_axi_1_WLAST = s_axi_wlast;
  assign s_axi_1_WSTRB = s_axi_wstrb[3:0];
  assign s_axi_1_WVALID = s_axi_wvalid;
  assign s_axi_awready = s_axi_1_AWREADY;
  assign s_axi_bresp[1:0] = s_axi_1_BRESP;
  assign s_axi_bvalid = s_axi_1_BVALID;
  assign s_axi_wready = s_axi_1_WREADY;
  bd_63e1_s03mmu_0 s03_mmu
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_awaddr(s03_mmu_M_AXI_AWADDR),
        .m_axi_awburst(s03_mmu_M_AXI_AWBURST),
        .m_axi_awcache(s03_mmu_M_AXI_AWCACHE),
        .m_axi_awlen(s03_mmu_M_AXI_AWLEN),
        .m_axi_awlock(s03_mmu_M_AXI_AWLOCK),
        .m_axi_awprot(s03_mmu_M_AXI_AWPROT),
        .m_axi_awqos(s03_mmu_M_AXI_AWQOS),
        .m_axi_awready(s03_mmu_M_AXI_AWREADY),
        .m_axi_awsize(s03_mmu_M_AXI_AWSIZE),
        .m_axi_awuser(s03_mmu_M_AXI_AWUSER),
        .m_axi_awvalid(s03_mmu_M_AXI_AWVALID),
        .m_axi_bready(s03_mmu_M_AXI_BREADY),
        .m_axi_bresp(s03_mmu_M_AXI_BRESP),
        .m_axi_buser(s03_mmu_M_AXI_BUSER),
        .m_axi_bvalid(s03_mmu_M_AXI_BVALID),
        .m_axi_wdata(s03_mmu_M_AXI_WDATA),
        .m_axi_wlast(s03_mmu_M_AXI_WLAST),
        .m_axi_wready(s03_mmu_M_AXI_WREADY),
        .m_axi_wstrb(s03_mmu_M_AXI_WSTRB),
        .m_axi_wuser(s03_mmu_M_AXI_WUSER),
        .m_axi_wvalid(s03_mmu_M_AXI_WVALID),
        .s_axi_awaddr(s_axi_1_AWADDR),
        .s_axi_awburst(s_axi_1_AWBURST),
        .s_axi_awcache(s_axi_1_AWCACHE),
        .s_axi_awlen(s_axi_1_AWLEN),
        .s_axi_awlock(s_axi_1_AWLOCK),
        .s_axi_awprot(s_axi_1_AWPROT),
        .s_axi_awqos(s_axi_1_AWQOS),
        .s_axi_awready(s_axi_1_AWREADY),
        .s_axi_awsize(s_axi_1_AWSIZE),
        .s_axi_awuser(s_axi_1_AWUSER),
        .s_axi_awvalid(s_axi_1_AWVALID),
        .s_axi_bready(s_axi_1_BREADY),
        .s_axi_bresp(s_axi_1_BRESP),
        .s_axi_bvalid(s_axi_1_BVALID),
        .s_axi_wdata(s_axi_1_WDATA),
        .s_axi_wlast(s_axi_1_WLAST),
        .s_axi_wready(s_axi_1_WREADY),
        .s_axi_wstrb(s_axi_1_WSTRB),
        .s_axi_wvalid(s_axi_1_WVALID));
  bd_63e1_s03sic_0 s03_si_converter
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_awaddr(s03_si_converter_M_AXI_AWADDR),
        .m_axi_awcache(s03_si_converter_M_AXI_AWCACHE),
        .m_axi_awid(s03_si_converter_M_AXI_AWID),
        .m_axi_awlen(s03_si_converter_M_AXI_AWLEN),
        .m_axi_awlock(s03_si_converter_M_AXI_AWLOCK),
        .m_axi_awprot(s03_si_converter_M_AXI_AWPROT),
        .m_axi_awqos(s03_si_converter_M_AXI_AWQOS),
        .m_axi_awready(s03_si_converter_M_AXI_AWREADY),
        .m_axi_awuser(s03_si_converter_M_AXI_AWUSER),
        .m_axi_awvalid(s03_si_converter_M_AXI_AWVALID),
        .m_axi_bid(s03_si_converter_M_AXI_BID),
        .m_axi_bready(s03_si_converter_M_AXI_BREADY),
        .m_axi_bresp(s03_si_converter_M_AXI_BRESP),
        .m_axi_buser(s03_si_converter_M_AXI_BUSER),
        .m_axi_bvalid(s03_si_converter_M_AXI_BVALID),
        .m_axi_wdata(s03_si_converter_M_AXI_WDATA),
        .m_axi_wlast(s03_si_converter_M_AXI_WLAST),
        .m_axi_wready(s03_si_converter_M_AXI_WREADY),
        .m_axi_wstrb(s03_si_converter_M_AXI_WSTRB),
        .m_axi_wuser(s03_si_converter_M_AXI_WUSER),
        .m_axi_wvalid(s03_si_converter_M_AXI_WVALID),
        .s_axi_awaddr(s03_transaction_regulator_M_AXI_AWADDR),
        .s_axi_awcache(s03_transaction_regulator_M_AXI_AWCACHE),
        .s_axi_awid(s03_transaction_regulator_M_AXI_AWID),
        .s_axi_awlen(s03_transaction_regulator_M_AXI_AWLEN),
        .s_axi_awlock(s03_transaction_regulator_M_AXI_AWLOCK),
        .s_axi_awprot(s03_transaction_regulator_M_AXI_AWPROT),
        .s_axi_awqos(s03_transaction_regulator_M_AXI_AWQOS),
        .s_axi_awready(s03_transaction_regulator_M_AXI_AWREADY),
        .s_axi_awsize(s03_transaction_regulator_M_AXI_AWSIZE),
        .s_axi_awuser(s03_transaction_regulator_M_AXI_AWUSER),
        .s_axi_awvalid(s03_transaction_regulator_M_AXI_AWVALID),
        .s_axi_bid(s03_transaction_regulator_M_AXI_BID),
        .s_axi_bready(s03_transaction_regulator_M_AXI_BREADY),
        .s_axi_bresp(s03_transaction_regulator_M_AXI_BRESP),
        .s_axi_buser(s03_transaction_regulator_M_AXI_BUSER),
        .s_axi_bvalid(s03_transaction_regulator_M_AXI_BVALID),
        .s_axi_wdata(s03_transaction_regulator_M_AXI_WDATA),
        .s_axi_wlast(s03_transaction_regulator_M_AXI_WLAST),
        .s_axi_wready(s03_transaction_regulator_M_AXI_WREADY),
        .s_axi_wstrb(s03_transaction_regulator_M_AXI_WSTRB),
        .s_axi_wuser(s03_transaction_regulator_M_AXI_WUSER),
        .s_axi_wvalid(s03_transaction_regulator_M_AXI_WVALID));
  bd_63e1_s03tr_0 s03_transaction_regulator
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_awaddr(s03_transaction_regulator_M_AXI_AWADDR),
        .m_axi_awcache(s03_transaction_regulator_M_AXI_AWCACHE),
        .m_axi_awid(s03_transaction_regulator_M_AXI_AWID),
        .m_axi_awlen(s03_transaction_regulator_M_AXI_AWLEN),
        .m_axi_awlock(s03_transaction_regulator_M_AXI_AWLOCK),
        .m_axi_awprot(s03_transaction_regulator_M_AXI_AWPROT),
        .m_axi_awqos(s03_transaction_regulator_M_AXI_AWQOS),
        .m_axi_awready(s03_transaction_regulator_M_AXI_AWREADY),
        .m_axi_awsize(s03_transaction_regulator_M_AXI_AWSIZE),
        .m_axi_awuser(s03_transaction_regulator_M_AXI_AWUSER),
        .m_axi_awvalid(s03_transaction_regulator_M_AXI_AWVALID),
        .m_axi_bid(s03_transaction_regulator_M_AXI_BID),
        .m_axi_bready(s03_transaction_regulator_M_AXI_BREADY),
        .m_axi_bresp(s03_transaction_regulator_M_AXI_BRESP),
        .m_axi_buser(s03_transaction_regulator_M_AXI_BUSER),
        .m_axi_bvalid(s03_transaction_regulator_M_AXI_BVALID),
        .m_axi_wdata(s03_transaction_regulator_M_AXI_WDATA),
        .m_axi_wlast(s03_transaction_regulator_M_AXI_WLAST),
        .m_axi_wready(s03_transaction_regulator_M_AXI_WREADY),
        .m_axi_wstrb(s03_transaction_regulator_M_AXI_WSTRB),
        .m_axi_wuser(s03_transaction_regulator_M_AXI_WUSER),
        .m_axi_wvalid(s03_transaction_regulator_M_AXI_WVALID),
        .s_axi_awaddr(s03_mmu_M_AXI_AWADDR),
        .s_axi_awburst(s03_mmu_M_AXI_AWBURST),
        .s_axi_awcache(s03_mmu_M_AXI_AWCACHE),
        .s_axi_awlen(s03_mmu_M_AXI_AWLEN),
        .s_axi_awlock(s03_mmu_M_AXI_AWLOCK),
        .s_axi_awprot(s03_mmu_M_AXI_AWPROT),
        .s_axi_awqos(s03_mmu_M_AXI_AWQOS),
        .s_axi_awready(s03_mmu_M_AXI_AWREADY),
        .s_axi_awsize(s03_mmu_M_AXI_AWSIZE),
        .s_axi_awuser(s03_mmu_M_AXI_AWUSER),
        .s_axi_awvalid(s03_mmu_M_AXI_AWVALID),
        .s_axi_bready(s03_mmu_M_AXI_BREADY),
        .s_axi_bresp(s03_mmu_M_AXI_BRESP),
        .s_axi_buser(s03_mmu_M_AXI_BUSER),
        .s_axi_bvalid(s03_mmu_M_AXI_BVALID),
        .s_axi_wdata(s03_mmu_M_AXI_WDATA),
        .s_axi_wlast(s03_mmu_M_AXI_WLAST),
        .s_axi_wready(s03_mmu_M_AXI_WREADY),
        .s_axi_wstrb(s03_mmu_M_AXI_WSTRB),
        .s_axi_wuser(s03_mmu_M_AXI_WUSER),
        .s_axi_wvalid(s03_mmu_M_AXI_WVALID));
endmodule

module s03_nodes_imp_10KTRM7
   (M_SC_AW_info,
    M_SC_AW_payld,
    M_SC_AW_recv,
    M_SC_AW_req,
    M_SC_AW_send,
    M_SC_B_info,
    M_SC_B_payld,
    M_SC_B_recv,
    M_SC_B_req,
    M_SC_B_send,
    M_SC_W_info,
    M_SC_W_payld,
    M_SC_W_recv,
    M_SC_W_req,
    M_SC_W_send,
    S_SC_AW_info,
    S_SC_AW_payld,
    S_SC_AW_recv,
    S_SC_AW_req,
    S_SC_AW_send,
    S_SC_B_info,
    S_SC_B_payld,
    S_SC_B_recv,
    S_SC_B_req,
    S_SC_B_send,
    S_SC_W_info,
    S_SC_W_payld,
    S_SC_W_recv,
    S_SC_W_req,
    S_SC_W_send,
    m_sc_clk,
    m_sc_resetn,
    s_sc_clk,
    s_sc_resetn);
  output [7:0]M_SC_AW_info;
  output [155:0]M_SC_AW_payld;
  input [7:0]M_SC_AW_recv;
  output [7:0]M_SC_AW_req;
  output [7:0]M_SC_AW_send;
  output [0:0]M_SC_B_info;
  output [11:0]M_SC_B_payld;
  input [0:0]M_SC_B_recv;
  output [0:0]M_SC_B_req;
  output [0:0]M_SC_B_send;
  output [7:0]M_SC_W_info;
  output [94:0]M_SC_W_payld;
  input [7:0]M_SC_W_recv;
  output [7:0]M_SC_W_req;
  output [7:0]M_SC_W_send;
  input [0:0]S_SC_AW_info;
  input [155:0]S_SC_AW_payld;
  output [0:0]S_SC_AW_recv;
  input [0:0]S_SC_AW_req;
  input [0:0]S_SC_AW_send;
  input [7:0]S_SC_B_info;
  input [11:0]S_SC_B_payld;
  output [7:0]S_SC_B_recv;
  input [7:0]S_SC_B_req;
  input [7:0]S_SC_B_send;
  input [0:0]S_SC_W_info;
  input [94:0]S_SC_W_payld;
  output [0:0]S_SC_W_recv;
  input [0:0]S_SC_W_req;
  input [0:0]S_SC_W_send;
  input m_sc_clk;
  input m_sc_resetn;
  input s_sc_clk;
  input s_sc_resetn;

  wire [0:0]S_SC_AW_1_INFO;
  wire [155:0]S_SC_AW_1_PAYLD;
  wire [0:0]S_SC_AW_1_RECV;
  wire [0:0]S_SC_AW_1_REQ;
  wire [0:0]S_SC_AW_1_SEND;
  wire [7:0]S_SC_B_1_INFO;
  wire [11:0]S_SC_B_1_PAYLD;
  wire [7:0]S_SC_B_1_RECV;
  wire [7:0]S_SC_B_1_REQ;
  wire [7:0]S_SC_B_1_SEND;
  wire [0:0]S_SC_W_1_INFO;
  wire [94:0]S_SC_W_1_PAYLD;
  wire [0:0]S_SC_W_1_RECV;
  wire [0:0]S_SC_W_1_REQ;
  wire [0:0]S_SC_W_1_SEND;
  wire m_sc_clk_1;
  wire m_sc_resetn_1;
  wire [7:0]s03_aw_node_M_SC_INFO;
  wire [155:0]s03_aw_node_M_SC_PAYLD;
  wire [7:0]s03_aw_node_M_SC_RECV;
  wire [7:0]s03_aw_node_M_SC_REQ;
  wire [7:0]s03_aw_node_M_SC_SEND;
  wire [0:0]s03_b_node_M_SC_INFO;
  wire [11:0]s03_b_node_M_SC_PAYLD;
  wire [0:0]s03_b_node_M_SC_RECV;
  wire [0:0]s03_b_node_M_SC_REQ;
  wire [0:0]s03_b_node_M_SC_SEND;
  wire [7:0]s03_w_node_M_SC_INFO;
  wire [94:0]s03_w_node_M_SC_PAYLD;
  wire [7:0]s03_w_node_M_SC_RECV;
  wire [7:0]s03_w_node_M_SC_REQ;
  wire [7:0]s03_w_node_M_SC_SEND;
  wire s_sc_clk_1;
  wire s_sc_resetn_1;

  assign M_SC_AW_info[7:0] = s03_aw_node_M_SC_INFO;
  assign M_SC_AW_payld[155:0] = s03_aw_node_M_SC_PAYLD;
  assign M_SC_AW_req[7:0] = s03_aw_node_M_SC_REQ;
  assign M_SC_AW_send[7:0] = s03_aw_node_M_SC_SEND;
  assign M_SC_B_info[0] = s03_b_node_M_SC_INFO;
  assign M_SC_B_payld[11:0] = s03_b_node_M_SC_PAYLD;
  assign M_SC_B_req[0] = s03_b_node_M_SC_REQ;
  assign M_SC_B_send[0] = s03_b_node_M_SC_SEND;
  assign M_SC_W_info[7:0] = s03_w_node_M_SC_INFO;
  assign M_SC_W_payld[94:0] = s03_w_node_M_SC_PAYLD;
  assign M_SC_W_req[7:0] = s03_w_node_M_SC_REQ;
  assign M_SC_W_send[7:0] = s03_w_node_M_SC_SEND;
  assign S_SC_AW_1_INFO = S_SC_AW_info[0];
  assign S_SC_AW_1_PAYLD = S_SC_AW_payld[155:0];
  assign S_SC_AW_1_REQ = S_SC_AW_req[0];
  assign S_SC_AW_1_SEND = S_SC_AW_send[0];
  assign S_SC_AW_recv[0] = S_SC_AW_1_RECV;
  assign S_SC_B_1_INFO = S_SC_B_info[7:0];
  assign S_SC_B_1_PAYLD = S_SC_B_payld[11:0];
  assign S_SC_B_1_REQ = S_SC_B_req[7:0];
  assign S_SC_B_1_SEND = S_SC_B_send[7:0];
  assign S_SC_B_recv[7:0] = S_SC_B_1_RECV;
  assign S_SC_W_1_INFO = S_SC_W_info[0];
  assign S_SC_W_1_PAYLD = S_SC_W_payld[94:0];
  assign S_SC_W_1_REQ = S_SC_W_req[0];
  assign S_SC_W_1_SEND = S_SC_W_send[0];
  assign S_SC_W_recv[0] = S_SC_W_1_RECV;
  assign m_sc_clk_1 = m_sc_clk;
  assign m_sc_resetn_1 = m_sc_resetn;
  assign s03_aw_node_M_SC_RECV = M_SC_AW_recv[7:0];
  assign s03_b_node_M_SC_RECV = M_SC_B_recv[0];
  assign s03_w_node_M_SC_RECV = M_SC_W_recv[7:0];
  assign s_sc_clk_1 = s_sc_clk;
  assign s_sc_resetn_1 = s_sc_resetn;
  bd_63e1_sawn_2 s03_aw_node
       (.m_sc_aclk(m_sc_clk_1),
        .m_sc_aresetn(m_sc_resetn_1),
        .m_sc_info(s03_aw_node_M_SC_INFO),
        .m_sc_payld(s03_aw_node_M_SC_PAYLD),
        .m_sc_recv(s03_aw_node_M_SC_RECV),
        .m_sc_req(s03_aw_node_M_SC_REQ),
        .m_sc_send(s03_aw_node_M_SC_SEND),
        .s_sc_aclk(s_sc_clk_1),
        .s_sc_aresetn(s_sc_resetn_1),
        .s_sc_info(S_SC_AW_1_INFO),
        .s_sc_payld(S_SC_AW_1_PAYLD),
        .s_sc_recv(S_SC_AW_1_RECV),
        .s_sc_req(S_SC_AW_1_REQ),
        .s_sc_send(S_SC_AW_1_SEND));
  bd_63e1_sbn_2 s03_b_node
       (.m_sc_aclk(s_sc_clk_1),
        .m_sc_aresetn(s_sc_resetn_1),
        .m_sc_info(s03_b_node_M_SC_INFO),
        .m_sc_payld(s03_b_node_M_SC_PAYLD),
        .m_sc_recv(s03_b_node_M_SC_RECV),
        .m_sc_req(s03_b_node_M_SC_REQ),
        .m_sc_send(s03_b_node_M_SC_SEND),
        .s_sc_aclk(m_sc_clk_1),
        .s_sc_aresetn(m_sc_resetn_1),
        .s_sc_info(S_SC_B_1_INFO),
        .s_sc_payld(S_SC_B_1_PAYLD),
        .s_sc_recv(S_SC_B_1_RECV),
        .s_sc_req(S_SC_B_1_REQ),
        .s_sc_send(S_SC_B_1_SEND));
  bd_63e1_swn_2 s03_w_node
       (.m_sc_aclk(m_sc_clk_1),
        .m_sc_aresetn(m_sc_resetn_1),
        .m_sc_info(s03_w_node_M_SC_INFO),
        .m_sc_payld(s03_w_node_M_SC_PAYLD),
        .m_sc_recv(s03_w_node_M_SC_RECV),
        .m_sc_req(s03_w_node_M_SC_REQ),
        .m_sc_send(s03_w_node_M_SC_SEND),
        .s_sc_aclk(s_sc_clk_1),
        .s_sc_aresetn(s_sc_resetn_1),
        .s_sc_info(S_SC_W_1_INFO),
        .s_sc_payld(S_SC_W_1_PAYLD),
        .s_sc_recv(S_SC_W_1_RECV),
        .s_sc_req(S_SC_W_1_REQ),
        .s_sc_send(S_SC_W_1_SEND));
endmodule

module switchboards_imp_154XAYO
   (M00_SC_AR_info,
    M00_SC_AR_payld,
    M00_SC_AR_recv,
    M00_SC_AR_req,
    M00_SC_AR_send,
    M00_SC_AW_info,
    M00_SC_AW_payld,
    M00_SC_AW_recv,
    M00_SC_AW_req,
    M00_SC_AW_send,
    M00_SC_B_info,
    M00_SC_B_payld,
    M00_SC_B_recv,
    M00_SC_B_req,
    M00_SC_B_send,
    M00_SC_R_info,
    M00_SC_R_payld,
    M00_SC_R_recv,
    M00_SC_R_req,
    M00_SC_R_send,
    M00_SC_W_info,
    M00_SC_W_payld,
    M00_SC_W_recv,
    M00_SC_W_req,
    M00_SC_W_send,
    M01_SC_AR_info,
    M01_SC_AR_payld,
    M01_SC_AR_recv,
    M01_SC_AR_req,
    M01_SC_AR_send,
    M01_SC_AW_info,
    M01_SC_AW_payld,
    M01_SC_AW_recv,
    M01_SC_AW_req,
    M01_SC_AW_send,
    M01_SC_B_info,
    M01_SC_B_payld,
    M01_SC_B_recv,
    M01_SC_B_req,
    M01_SC_B_send,
    M01_SC_R_info,
    M01_SC_R_payld,
    M01_SC_R_recv,
    M01_SC_R_req,
    M01_SC_R_send,
    M01_SC_W_info,
    M01_SC_W_payld,
    M01_SC_W_recv,
    M01_SC_W_req,
    M01_SC_W_send,
    M02_SC_AR_info,
    M02_SC_AR_payld,
    M02_SC_AR_recv,
    M02_SC_AR_req,
    M02_SC_AR_send,
    M02_SC_AW_info,
    M02_SC_AW_payld,
    M02_SC_AW_recv,
    M02_SC_AW_req,
    M02_SC_AW_send,
    M02_SC_B_info,
    M02_SC_B_payld,
    M02_SC_B_recv,
    M02_SC_B_req,
    M02_SC_B_send,
    M02_SC_R_info,
    M02_SC_R_payld,
    M02_SC_R_recv,
    M02_SC_R_req,
    M02_SC_R_send,
    M02_SC_W_info,
    M02_SC_W_payld,
    M02_SC_W_recv,
    M02_SC_W_req,
    M02_SC_W_send,
    M03_SC_AR_info,
    M03_SC_AR_payld,
    M03_SC_AR_recv,
    M03_SC_AR_req,
    M03_SC_AR_send,
    M03_SC_AW_info,
    M03_SC_AW_payld,
    M03_SC_AW_recv,
    M03_SC_AW_req,
    M03_SC_AW_send,
    M03_SC_B_info,
    M03_SC_B_payld,
    M03_SC_B_recv,
    M03_SC_B_req,
    M03_SC_B_send,
    M03_SC_R_info,
    M03_SC_R_payld,
    M03_SC_R_recv,
    M03_SC_R_req,
    M03_SC_R_send,
    M03_SC_W_info,
    M03_SC_W_payld,
    M03_SC_W_recv,
    M03_SC_W_req,
    M03_SC_W_send,
    M04_SC_AR_info,
    M04_SC_AR_payld,
    M04_SC_AR_recv,
    M04_SC_AR_req,
    M04_SC_AR_send,
    M04_SC_AW_info,
    M04_SC_AW_payld,
    M04_SC_AW_recv,
    M04_SC_AW_req,
    M04_SC_AW_send,
    M04_SC_W_info,
    M04_SC_W_payld,
    M04_SC_W_recv,
    M04_SC_W_req,
    M04_SC_W_send,
    M05_SC_AR_info,
    M05_SC_AR_payld,
    M05_SC_AR_recv,
    M05_SC_AR_req,
    M05_SC_AR_send,
    M05_SC_AW_info,
    M05_SC_AW_payld,
    M05_SC_AW_recv,
    M05_SC_AW_req,
    M05_SC_AW_send,
    M05_SC_W_info,
    M05_SC_W_payld,
    M05_SC_W_recv,
    M05_SC_W_req,
    M05_SC_W_send,
    M06_SC_AR_info,
    M06_SC_AR_payld,
    M06_SC_AR_recv,
    M06_SC_AR_req,
    M06_SC_AR_send,
    M06_SC_AW_info,
    M06_SC_AW_payld,
    M06_SC_AW_recv,
    M06_SC_AW_req,
    M06_SC_AW_send,
    M06_SC_W_info,
    M06_SC_W_payld,
    M06_SC_W_recv,
    M06_SC_W_req,
    M06_SC_W_send,
    M07_SC_AR_info,
    M07_SC_AR_payld,
    M07_SC_AR_recv,
    M07_SC_AR_req,
    M07_SC_AR_send,
    M07_SC_AW_info,
    M07_SC_AW_payld,
    M07_SC_AW_recv,
    M07_SC_AW_req,
    M07_SC_AW_send,
    M07_SC_W_info,
    M07_SC_W_payld,
    M07_SC_W_recv,
    M07_SC_W_req,
    M07_SC_W_send,
    S00_SC_AR_info,
    S00_SC_AR_payld,
    S00_SC_AR_recv,
    S00_SC_AR_req,
    S00_SC_AR_send,
    S00_SC_AW_info,
    S00_SC_AW_payld,
    S00_SC_AW_recv,
    S00_SC_AW_req,
    S00_SC_AW_send,
    S00_SC_B_info,
    S00_SC_B_payld,
    S00_SC_B_recv,
    S00_SC_B_req,
    S00_SC_B_send,
    S00_SC_R_info,
    S00_SC_R_payld,
    S00_SC_R_recv,
    S00_SC_R_req,
    S00_SC_R_send,
    S00_SC_W_info,
    S00_SC_W_payld,
    S00_SC_W_recv,
    S00_SC_W_req,
    S00_SC_W_send,
    S01_SC_AR_info,
    S01_SC_AR_payld,
    S01_SC_AR_recv,
    S01_SC_AR_req,
    S01_SC_AR_send,
    S01_SC_AW_info,
    S01_SC_AW_payld,
    S01_SC_AW_recv,
    S01_SC_AW_req,
    S01_SC_AW_send,
    S01_SC_B_info,
    S01_SC_B_payld,
    S01_SC_B_recv,
    S01_SC_B_req,
    S01_SC_B_send,
    S01_SC_R_info,
    S01_SC_R_payld,
    S01_SC_R_recv,
    S01_SC_R_req,
    S01_SC_R_send,
    S01_SC_W_info,
    S01_SC_W_payld,
    S01_SC_W_recv,
    S01_SC_W_req,
    S01_SC_W_send,
    S02_SC_AR_info,
    S02_SC_AR_payld,
    S02_SC_AR_recv,
    S02_SC_AR_req,
    S02_SC_AR_send,
    S02_SC_AW_info,
    S02_SC_AW_payld,
    S02_SC_AW_recv,
    S02_SC_AW_req,
    S02_SC_AW_send,
    S02_SC_B_info,
    S02_SC_B_payld,
    S02_SC_B_recv,
    S02_SC_B_req,
    S02_SC_B_send,
    S02_SC_R_info,
    S02_SC_R_payld,
    S02_SC_R_recv,
    S02_SC_R_req,
    S02_SC_R_send,
    S02_SC_W_info,
    S02_SC_W_payld,
    S02_SC_W_recv,
    S02_SC_W_req,
    S02_SC_W_send,
    S03_SC_AR_info,
    S03_SC_AR_payld,
    S03_SC_AR_recv,
    S03_SC_AR_req,
    S03_SC_AR_send,
    S03_SC_AW_info,
    S03_SC_AW_payld,
    S03_SC_AW_recv,
    S03_SC_AW_req,
    S03_SC_AW_send,
    S03_SC_B_info,
    S03_SC_B_payld,
    S03_SC_B_recv,
    S03_SC_B_req,
    S03_SC_B_send,
    S03_SC_R_info,
    S03_SC_R_payld,
    S03_SC_R_recv,
    S03_SC_R_req,
    S03_SC_R_send,
    S03_SC_W_info,
    S03_SC_W_payld,
    S03_SC_W_recv,
    S03_SC_W_req,
    S03_SC_W_send,
    S04_SC_B_info,
    S04_SC_B_payld,
    S04_SC_B_recv,
    S04_SC_B_req,
    S04_SC_B_send,
    S04_SC_R_info,
    S04_SC_R_payld,
    S04_SC_R_recv,
    S04_SC_R_req,
    S04_SC_R_send,
    S05_SC_B_info,
    S05_SC_B_payld,
    S05_SC_B_recv,
    S05_SC_B_req,
    S05_SC_B_send,
    S05_SC_R_info,
    S05_SC_R_payld,
    S05_SC_R_recv,
    S05_SC_R_req,
    S05_SC_R_send,
    S06_SC_B_info,
    S06_SC_B_payld,
    S06_SC_B_recv,
    S06_SC_B_req,
    S06_SC_B_send,
    S06_SC_R_info,
    S06_SC_R_payld,
    S06_SC_R_recv,
    S06_SC_R_req,
    S06_SC_R_send,
    S07_SC_B_info,
    S07_SC_B_payld,
    S07_SC_B_recv,
    S07_SC_B_req,
    S07_SC_B_send,
    S07_SC_R_info,
    S07_SC_R_payld,
    S07_SC_R_recv,
    S07_SC_R_req,
    S07_SC_R_send,
    aclk,
    aresetn);
  output [3:0]M00_SC_AR_info;
  output [155:0]M00_SC_AR_payld;
  input [3:0]M00_SC_AR_recv;
  output [3:0]M00_SC_AR_req;
  output [3:0]M00_SC_AR_send;
  output [3:0]M00_SC_AW_info;
  output [155:0]M00_SC_AW_payld;
  input [3:0]M00_SC_AW_recv;
  output [3:0]M00_SC_AW_req;
  output [3:0]M00_SC_AW_send;
  output [7:0]M00_SC_B_info;
  output [11:0]M00_SC_B_payld;
  input [7:0]M00_SC_B_recv;
  output [7:0]M00_SC_B_req;
  output [7:0]M00_SC_B_send;
  output [7:0]M00_SC_R_info;
  output [89:0]M00_SC_R_payld;
  input [7:0]M00_SC_R_recv;
  output [7:0]M00_SC_R_req;
  output [7:0]M00_SC_R_send;
  output [3:0]M00_SC_W_info;
  output [94:0]M00_SC_W_payld;
  input [3:0]M00_SC_W_recv;
  output [3:0]M00_SC_W_req;
  output [3:0]M00_SC_W_send;
  output [3:0]M01_SC_AR_info;
  output [155:0]M01_SC_AR_payld;
  input [3:0]M01_SC_AR_recv;
  output [3:0]M01_SC_AR_req;
  output [3:0]M01_SC_AR_send;
  output [3:0]M01_SC_AW_info;
  output [155:0]M01_SC_AW_payld;
  input [3:0]M01_SC_AW_recv;
  output [3:0]M01_SC_AW_req;
  output [3:0]M01_SC_AW_send;
  output M01_SC_B_info;
  output M01_SC_B_payld;
  input M01_SC_B_recv;
  output M01_SC_B_req;
  output M01_SC_B_send;
  output [7:0]M01_SC_R_info;
  output [89:0]M01_SC_R_payld;
  input [7:0]M01_SC_R_recv;
  output [7:0]M01_SC_R_req;
  output [7:0]M01_SC_R_send;
  output [3:0]M01_SC_W_info;
  output [94:0]M01_SC_W_payld;
  input [3:0]M01_SC_W_recv;
  output [3:0]M01_SC_W_req;
  output [3:0]M01_SC_W_send;
  output [3:0]M02_SC_AR_info;
  output [155:0]M02_SC_AR_payld;
  input [3:0]M02_SC_AR_recv;
  output [3:0]M02_SC_AR_req;
  output [3:0]M02_SC_AR_send;
  output [3:0]M02_SC_AW_info;
  output [155:0]M02_SC_AW_payld;
  input [3:0]M02_SC_AW_recv;
  output [3:0]M02_SC_AW_req;
  output [3:0]M02_SC_AW_send;
  output [7:0]M02_SC_B_info;
  output [11:0]M02_SC_B_payld;
  input [7:0]M02_SC_B_recv;
  output [7:0]M02_SC_B_req;
  output [7:0]M02_SC_B_send;
  output [7:0]M02_SC_R_info;
  output [89:0]M02_SC_R_payld;
  input [7:0]M02_SC_R_recv;
  output [7:0]M02_SC_R_req;
  output [7:0]M02_SC_R_send;
  output [3:0]M02_SC_W_info;
  output [94:0]M02_SC_W_payld;
  input [3:0]M02_SC_W_recv;
  output [3:0]M02_SC_W_req;
  output [3:0]M02_SC_W_send;
  output [3:0]M03_SC_AR_info;
  output [155:0]M03_SC_AR_payld;
  input [3:0]M03_SC_AR_recv;
  output [3:0]M03_SC_AR_req;
  output [3:0]M03_SC_AR_send;
  output [3:0]M03_SC_AW_info;
  output [155:0]M03_SC_AW_payld;
  input [3:0]M03_SC_AW_recv;
  output [3:0]M03_SC_AW_req;
  output [3:0]M03_SC_AW_send;
  output [7:0]M03_SC_B_info;
  output [11:0]M03_SC_B_payld;
  input [7:0]M03_SC_B_recv;
  output [7:0]M03_SC_B_req;
  output [7:0]M03_SC_B_send;
  output M03_SC_R_info;
  output M03_SC_R_payld;
  input M03_SC_R_recv;
  output M03_SC_R_req;
  output M03_SC_R_send;
  output [3:0]M03_SC_W_info;
  output [94:0]M03_SC_W_payld;
  input [3:0]M03_SC_W_recv;
  output [3:0]M03_SC_W_req;
  output [3:0]M03_SC_W_send;
  output [3:0]M04_SC_AR_info;
  output [155:0]M04_SC_AR_payld;
  input [3:0]M04_SC_AR_recv;
  output [3:0]M04_SC_AR_req;
  output [3:0]M04_SC_AR_send;
  output [3:0]M04_SC_AW_info;
  output [155:0]M04_SC_AW_payld;
  input [3:0]M04_SC_AW_recv;
  output [3:0]M04_SC_AW_req;
  output [3:0]M04_SC_AW_send;
  output [3:0]M04_SC_W_info;
  output [94:0]M04_SC_W_payld;
  input [3:0]M04_SC_W_recv;
  output [3:0]M04_SC_W_req;
  output [3:0]M04_SC_W_send;
  output [3:0]M05_SC_AR_info;
  output [155:0]M05_SC_AR_payld;
  input [3:0]M05_SC_AR_recv;
  output [3:0]M05_SC_AR_req;
  output [3:0]M05_SC_AR_send;
  output [3:0]M05_SC_AW_info;
  output [155:0]M05_SC_AW_payld;
  input [3:0]M05_SC_AW_recv;
  output [3:0]M05_SC_AW_req;
  output [3:0]M05_SC_AW_send;
  output [3:0]M05_SC_W_info;
  output [94:0]M05_SC_W_payld;
  input [3:0]M05_SC_W_recv;
  output [3:0]M05_SC_W_req;
  output [3:0]M05_SC_W_send;
  output [3:0]M06_SC_AR_info;
  output [155:0]M06_SC_AR_payld;
  input [3:0]M06_SC_AR_recv;
  output [3:0]M06_SC_AR_req;
  output [3:0]M06_SC_AR_send;
  output [3:0]M06_SC_AW_info;
  output [155:0]M06_SC_AW_payld;
  input [3:0]M06_SC_AW_recv;
  output [3:0]M06_SC_AW_req;
  output [3:0]M06_SC_AW_send;
  output [3:0]M06_SC_W_info;
  output [94:0]M06_SC_W_payld;
  input [3:0]M06_SC_W_recv;
  output [3:0]M06_SC_W_req;
  output [3:0]M06_SC_W_send;
  output [3:0]M07_SC_AR_info;
  output [155:0]M07_SC_AR_payld;
  input [3:0]M07_SC_AR_recv;
  output [3:0]M07_SC_AR_req;
  output [3:0]M07_SC_AR_send;
  output [3:0]M07_SC_AW_info;
  output [155:0]M07_SC_AW_payld;
  input [3:0]M07_SC_AW_recv;
  output [3:0]M07_SC_AW_req;
  output [3:0]M07_SC_AW_send;
  output [3:0]M07_SC_W_info;
  output [94:0]M07_SC_W_payld;
  input [3:0]M07_SC_W_recv;
  output [3:0]M07_SC_W_req;
  output [3:0]M07_SC_W_send;
  input [7:0]S00_SC_AR_info;
  input [155:0]S00_SC_AR_payld;
  output [7:0]S00_SC_AR_recv;
  input [7:0]S00_SC_AR_req;
  input [7:0]S00_SC_AR_send;
  input [7:0]S00_SC_AW_info;
  input [155:0]S00_SC_AW_payld;
  output [7:0]S00_SC_AW_recv;
  input [7:0]S00_SC_AW_req;
  input [7:0]S00_SC_AW_send;
  input [3:0]S00_SC_B_info;
  input [11:0]S00_SC_B_payld;
  output [3:0]S00_SC_B_recv;
  input [3:0]S00_SC_B_req;
  input [3:0]S00_SC_B_send;
  input [3:0]S00_SC_R_info;
  input [89:0]S00_SC_R_payld;
  output [3:0]S00_SC_R_recv;
  input [3:0]S00_SC_R_req;
  input [3:0]S00_SC_R_send;
  input [7:0]S00_SC_W_info;
  input [94:0]S00_SC_W_payld;
  output [7:0]S00_SC_W_recv;
  input [7:0]S00_SC_W_req;
  input [7:0]S00_SC_W_send;
  input [7:0]S01_SC_AR_info;
  input [155:0]S01_SC_AR_payld;
  output [7:0]S01_SC_AR_recv;
  input [7:0]S01_SC_AR_req;
  input [7:0]S01_SC_AR_send;
  input S01_SC_AW_info;
  input S01_SC_AW_payld;
  output S01_SC_AW_recv;
  input S01_SC_AW_req;
  input S01_SC_AW_send;
  input [3:0]S01_SC_B_info;
  input [11:0]S01_SC_B_payld;
  output [3:0]S01_SC_B_recv;
  input [3:0]S01_SC_B_req;
  input [3:0]S01_SC_B_send;
  input [3:0]S01_SC_R_info;
  input [89:0]S01_SC_R_payld;
  output [3:0]S01_SC_R_recv;
  input [3:0]S01_SC_R_req;
  input [3:0]S01_SC_R_send;
  input S01_SC_W_info;
  input S01_SC_W_payld;
  output S01_SC_W_recv;
  input S01_SC_W_req;
  input S01_SC_W_send;
  input [7:0]S02_SC_AR_info;
  input [155:0]S02_SC_AR_payld;
  output [7:0]S02_SC_AR_recv;
  input [7:0]S02_SC_AR_req;
  input [7:0]S02_SC_AR_send;
  input [7:0]S02_SC_AW_info;
  input [155:0]S02_SC_AW_payld;
  output [7:0]S02_SC_AW_recv;
  input [7:0]S02_SC_AW_req;
  input [7:0]S02_SC_AW_send;
  input [3:0]S02_SC_B_info;
  input [11:0]S02_SC_B_payld;
  output [3:0]S02_SC_B_recv;
  input [3:0]S02_SC_B_req;
  input [3:0]S02_SC_B_send;
  input [3:0]S02_SC_R_info;
  input [89:0]S02_SC_R_payld;
  output [3:0]S02_SC_R_recv;
  input [3:0]S02_SC_R_req;
  input [3:0]S02_SC_R_send;
  input [7:0]S02_SC_W_info;
  input [94:0]S02_SC_W_payld;
  output [7:0]S02_SC_W_recv;
  input [7:0]S02_SC_W_req;
  input [7:0]S02_SC_W_send;
  input S03_SC_AR_info;
  input S03_SC_AR_payld;
  output S03_SC_AR_recv;
  input S03_SC_AR_req;
  input S03_SC_AR_send;
  input [7:0]S03_SC_AW_info;
  input [155:0]S03_SC_AW_payld;
  output [7:0]S03_SC_AW_recv;
  input [7:0]S03_SC_AW_req;
  input [7:0]S03_SC_AW_send;
  input [3:0]S03_SC_B_info;
  input [11:0]S03_SC_B_payld;
  output [3:0]S03_SC_B_recv;
  input [3:0]S03_SC_B_req;
  input [3:0]S03_SC_B_send;
  input [3:0]S03_SC_R_info;
  input [89:0]S03_SC_R_payld;
  output [3:0]S03_SC_R_recv;
  input [3:0]S03_SC_R_req;
  input [3:0]S03_SC_R_send;
  input [7:0]S03_SC_W_info;
  input [94:0]S03_SC_W_payld;
  output [7:0]S03_SC_W_recv;
  input [7:0]S03_SC_W_req;
  input [7:0]S03_SC_W_send;
  input [3:0]S04_SC_B_info;
  input [11:0]S04_SC_B_payld;
  output [3:0]S04_SC_B_recv;
  input [3:0]S04_SC_B_req;
  input [3:0]S04_SC_B_send;
  input [3:0]S04_SC_R_info;
  input [89:0]S04_SC_R_payld;
  output [3:0]S04_SC_R_recv;
  input [3:0]S04_SC_R_req;
  input [3:0]S04_SC_R_send;
  input [3:0]S05_SC_B_info;
  input [11:0]S05_SC_B_payld;
  output [3:0]S05_SC_B_recv;
  input [3:0]S05_SC_B_req;
  input [3:0]S05_SC_B_send;
  input [3:0]S05_SC_R_info;
  input [89:0]S05_SC_R_payld;
  output [3:0]S05_SC_R_recv;
  input [3:0]S05_SC_R_req;
  input [3:0]S05_SC_R_send;
  input [3:0]S06_SC_B_info;
  input [11:0]S06_SC_B_payld;
  output [3:0]S06_SC_B_recv;
  input [3:0]S06_SC_B_req;
  input [3:0]S06_SC_B_send;
  input [3:0]S06_SC_R_info;
  input [89:0]S06_SC_R_payld;
  output [3:0]S06_SC_R_recv;
  input [3:0]S06_SC_R_req;
  input [3:0]S06_SC_R_send;
  input [3:0]S07_SC_B_info;
  input [11:0]S07_SC_B_payld;
  output [3:0]S07_SC_B_recv;
  input [3:0]S07_SC_B_req;
  input [3:0]S07_SC_B_send;
  input [3:0]S07_SC_R_info;
  input [89:0]S07_SC_R_payld;
  output [3:0]S07_SC_R_recv;
  input [3:0]S07_SC_R_req;
  input [3:0]S07_SC_R_send;
  input aclk;
  input aresetn;

  wire [7:0]S00_SC_AR_1_INFO;
  wire [155:0]S00_SC_AR_1_PAYLD;
  wire [7:0]S00_SC_AR_1_RECV;
  wire [7:0]S00_SC_AR_1_REQ;
  wire [7:0]S00_SC_AR_1_SEND;
  wire [7:0]S00_SC_AW_1_INFO;
  wire [155:0]S00_SC_AW_1_PAYLD;
  wire [7:0]S00_SC_AW_1_RECV;
  wire [7:0]S00_SC_AW_1_REQ;
  wire [7:0]S00_SC_AW_1_SEND;
  wire [3:0]S00_SC_B_1_INFO;
  wire [11:0]S00_SC_B_1_PAYLD;
  wire [3:0]S00_SC_B_1_RECV;
  wire [3:0]S00_SC_B_1_REQ;
  wire [3:0]S00_SC_B_1_SEND;
  wire [3:0]S00_SC_R_1_INFO;
  wire [89:0]S00_SC_R_1_PAYLD;
  wire [3:0]S00_SC_R_1_RECV;
  wire [3:0]S00_SC_R_1_REQ;
  wire [3:0]S00_SC_R_1_SEND;
  wire [7:0]S00_SC_W_1_INFO;
  wire [94:0]S00_SC_W_1_PAYLD;
  wire [7:0]S00_SC_W_1_RECV;
  wire [7:0]S00_SC_W_1_REQ;
  wire [7:0]S00_SC_W_1_SEND;
  wire [7:0]S01_SC_AR_1_INFO;
  wire [155:0]S01_SC_AR_1_PAYLD;
  wire [15:8]S01_SC_AR_1_RECV;
  wire [7:0]S01_SC_AR_1_REQ;
  wire [7:0]S01_SC_AR_1_SEND;
  wire S01_SC_AW_1_INFO;
  wire S01_SC_AW_1_PAYLD;
  wire [15:8]S01_SC_AW_1_RECV;
  wire S01_SC_AW_1_REQ;
  wire S01_SC_AW_1_SEND;
  wire [3:0]S01_SC_B_1_INFO;
  wire [11:0]S01_SC_B_1_PAYLD;
  wire [7:4]S01_SC_B_1_RECV;
  wire [3:0]S01_SC_B_1_REQ;
  wire [3:0]S01_SC_B_1_SEND;
  wire [3:0]S01_SC_R_1_INFO;
  wire [89:0]S01_SC_R_1_PAYLD;
  wire [7:4]S01_SC_R_1_RECV;
  wire [3:0]S01_SC_R_1_REQ;
  wire [3:0]S01_SC_R_1_SEND;
  wire S01_SC_W_1_INFO;
  wire S01_SC_W_1_PAYLD;
  wire [15:8]S01_SC_W_1_RECV;
  wire S01_SC_W_1_REQ;
  wire S01_SC_W_1_SEND;
  wire [7:0]S02_SC_AR_1_INFO;
  wire [155:0]S02_SC_AR_1_PAYLD;
  wire [23:16]S02_SC_AR_1_RECV;
  wire [7:0]S02_SC_AR_1_REQ;
  wire [7:0]S02_SC_AR_1_SEND;
  wire [7:0]S02_SC_AW_1_INFO;
  wire [155:0]S02_SC_AW_1_PAYLD;
  wire [23:16]S02_SC_AW_1_RECV;
  wire [7:0]S02_SC_AW_1_REQ;
  wire [7:0]S02_SC_AW_1_SEND;
  wire [3:0]S02_SC_B_1_INFO;
  wire [11:0]S02_SC_B_1_PAYLD;
  wire [11:8]S02_SC_B_1_RECV;
  wire [3:0]S02_SC_B_1_REQ;
  wire [3:0]S02_SC_B_1_SEND;
  wire [3:0]S02_SC_R_1_INFO;
  wire [89:0]S02_SC_R_1_PAYLD;
  wire [11:8]S02_SC_R_1_RECV;
  wire [3:0]S02_SC_R_1_REQ;
  wire [3:0]S02_SC_R_1_SEND;
  wire [7:0]S02_SC_W_1_INFO;
  wire [94:0]S02_SC_W_1_PAYLD;
  wire [23:16]S02_SC_W_1_RECV;
  wire [7:0]S02_SC_W_1_REQ;
  wire [7:0]S02_SC_W_1_SEND;
  wire S03_SC_AR_1_INFO;
  wire S03_SC_AR_1_PAYLD;
  wire [31:24]S03_SC_AR_1_RECV;
  wire S03_SC_AR_1_REQ;
  wire S03_SC_AR_1_SEND;
  wire [7:0]S03_SC_AW_1_INFO;
  wire [155:0]S03_SC_AW_1_PAYLD;
  wire [31:24]S03_SC_AW_1_RECV;
  wire [7:0]S03_SC_AW_1_REQ;
  wire [7:0]S03_SC_AW_1_SEND;
  wire [3:0]S03_SC_B_1_INFO;
  wire [11:0]S03_SC_B_1_PAYLD;
  wire [15:12]S03_SC_B_1_RECV;
  wire [3:0]S03_SC_B_1_REQ;
  wire [3:0]S03_SC_B_1_SEND;
  wire [3:0]S03_SC_R_1_INFO;
  wire [89:0]S03_SC_R_1_PAYLD;
  wire [15:12]S03_SC_R_1_RECV;
  wire [3:0]S03_SC_R_1_REQ;
  wire [3:0]S03_SC_R_1_SEND;
  wire [7:0]S03_SC_W_1_INFO;
  wire [94:0]S03_SC_W_1_PAYLD;
  wire [31:24]S03_SC_W_1_RECV;
  wire [7:0]S03_SC_W_1_REQ;
  wire [7:0]S03_SC_W_1_SEND;
  wire [3:0]S04_SC_B_1_INFO;
  wire [11:0]S04_SC_B_1_PAYLD;
  wire [19:16]S04_SC_B_1_RECV;
  wire [3:0]S04_SC_B_1_REQ;
  wire [3:0]S04_SC_B_1_SEND;
  wire [3:0]S04_SC_R_1_INFO;
  wire [89:0]S04_SC_R_1_PAYLD;
  wire [19:16]S04_SC_R_1_RECV;
  wire [3:0]S04_SC_R_1_REQ;
  wire [3:0]S04_SC_R_1_SEND;
  wire [3:0]S05_SC_B_1_INFO;
  wire [11:0]S05_SC_B_1_PAYLD;
  wire [23:20]S05_SC_B_1_RECV;
  wire [3:0]S05_SC_B_1_REQ;
  wire [3:0]S05_SC_B_1_SEND;
  wire [3:0]S05_SC_R_1_INFO;
  wire [89:0]S05_SC_R_1_PAYLD;
  wire [23:20]S05_SC_R_1_RECV;
  wire [3:0]S05_SC_R_1_REQ;
  wire [3:0]S05_SC_R_1_SEND;
  wire [3:0]S06_SC_B_1_INFO;
  wire [11:0]S06_SC_B_1_PAYLD;
  wire [27:24]S06_SC_B_1_RECV;
  wire [3:0]S06_SC_B_1_REQ;
  wire [3:0]S06_SC_B_1_SEND;
  wire [3:0]S06_SC_R_1_INFO;
  wire [89:0]S06_SC_R_1_PAYLD;
  wire [27:24]S06_SC_R_1_RECV;
  wire [3:0]S06_SC_R_1_REQ;
  wire [3:0]S06_SC_R_1_SEND;
  wire [3:0]S07_SC_B_1_INFO;
  wire [11:0]S07_SC_B_1_PAYLD;
  wire [31:28]S07_SC_B_1_RECV;
  wire [3:0]S07_SC_B_1_REQ;
  wire [3:0]S07_SC_B_1_SEND;
  wire [3:0]S07_SC_R_1_INFO;
  wire [89:0]S07_SC_R_1_PAYLD;
  wire [31:28]S07_SC_R_1_RECV;
  wire [3:0]S07_SC_R_1_REQ;
  wire [3:0]S07_SC_R_1_SEND;
  wire aclk_1;
  wire [3:0]ar_switchboard_M00_SC_INFO;
  wire [155:0]ar_switchboard_M00_SC_PAYLD;
  wire [3:0]ar_switchboard_M00_SC_RECV;
  wire [3:0]ar_switchboard_M00_SC_REQ;
  wire [3:0]ar_switchboard_M00_SC_SEND;
  wire [7:4]ar_switchboard_M01_SC_INFO;
  wire [311:156]ar_switchboard_M01_SC_PAYLD;
  wire [3:0]ar_switchboard_M01_SC_RECV;
  wire [7:4]ar_switchboard_M01_SC_REQ;
  wire [7:4]ar_switchboard_M01_SC_SEND;
  wire [11:8]ar_switchboard_M02_SC_INFO;
  wire [467:312]ar_switchboard_M02_SC_PAYLD;
  wire [3:0]ar_switchboard_M02_SC_RECV;
  wire [11:8]ar_switchboard_M02_SC_REQ;
  wire [11:8]ar_switchboard_M02_SC_SEND;
  wire [15:12]ar_switchboard_M03_SC_INFO;
  wire [623:468]ar_switchboard_M03_SC_PAYLD;
  wire [3:0]ar_switchboard_M03_SC_RECV;
  wire [15:12]ar_switchboard_M03_SC_REQ;
  wire [15:12]ar_switchboard_M03_SC_SEND;
  wire [19:16]ar_switchboard_M04_SC_INFO;
  wire [779:624]ar_switchboard_M04_SC_PAYLD;
  wire [3:0]ar_switchboard_M04_SC_RECV;
  wire [19:16]ar_switchboard_M04_SC_REQ;
  wire [19:16]ar_switchboard_M04_SC_SEND;
  wire [23:20]ar_switchboard_M05_SC_INFO;
  wire [935:780]ar_switchboard_M05_SC_PAYLD;
  wire [3:0]ar_switchboard_M05_SC_RECV;
  wire [23:20]ar_switchboard_M05_SC_REQ;
  wire [23:20]ar_switchboard_M05_SC_SEND;
  wire [27:24]ar_switchboard_M06_SC_INFO;
  wire [1091:936]ar_switchboard_M06_SC_PAYLD;
  wire [3:0]ar_switchboard_M06_SC_RECV;
  wire [27:24]ar_switchboard_M06_SC_REQ;
  wire [27:24]ar_switchboard_M06_SC_SEND;
  wire [31:28]ar_switchboard_M07_SC_INFO;
  wire [1247:1092]ar_switchboard_M07_SC_PAYLD;
  wire [3:0]ar_switchboard_M07_SC_RECV;
  wire [31:28]ar_switchboard_M07_SC_REQ;
  wire [31:28]ar_switchboard_M07_SC_SEND;
  wire [3:0]aw_switchboard_M00_SC_INFO;
  wire [155:0]aw_switchboard_M00_SC_PAYLD;
  wire [3:0]aw_switchboard_M00_SC_RECV;
  wire [3:0]aw_switchboard_M00_SC_REQ;
  wire [3:0]aw_switchboard_M00_SC_SEND;
  wire [7:4]aw_switchboard_M01_SC_INFO;
  wire [311:156]aw_switchboard_M01_SC_PAYLD;
  wire [3:0]aw_switchboard_M01_SC_RECV;
  wire [7:4]aw_switchboard_M01_SC_REQ;
  wire [7:4]aw_switchboard_M01_SC_SEND;
  wire [11:8]aw_switchboard_M02_SC_INFO;
  wire [467:312]aw_switchboard_M02_SC_PAYLD;
  wire [3:0]aw_switchboard_M02_SC_RECV;
  wire [11:8]aw_switchboard_M02_SC_REQ;
  wire [11:8]aw_switchboard_M02_SC_SEND;
  wire [15:12]aw_switchboard_M03_SC_INFO;
  wire [623:468]aw_switchboard_M03_SC_PAYLD;
  wire [3:0]aw_switchboard_M03_SC_RECV;
  wire [15:12]aw_switchboard_M03_SC_REQ;
  wire [15:12]aw_switchboard_M03_SC_SEND;
  wire [19:16]aw_switchboard_M04_SC_INFO;
  wire [779:624]aw_switchboard_M04_SC_PAYLD;
  wire [3:0]aw_switchboard_M04_SC_RECV;
  wire [19:16]aw_switchboard_M04_SC_REQ;
  wire [19:16]aw_switchboard_M04_SC_SEND;
  wire [23:20]aw_switchboard_M05_SC_INFO;
  wire [935:780]aw_switchboard_M05_SC_PAYLD;
  wire [3:0]aw_switchboard_M05_SC_RECV;
  wire [23:20]aw_switchboard_M05_SC_REQ;
  wire [23:20]aw_switchboard_M05_SC_SEND;
  wire [27:24]aw_switchboard_M06_SC_INFO;
  wire [1091:936]aw_switchboard_M06_SC_PAYLD;
  wire [3:0]aw_switchboard_M06_SC_RECV;
  wire [27:24]aw_switchboard_M06_SC_REQ;
  wire [27:24]aw_switchboard_M06_SC_SEND;
  wire [31:28]aw_switchboard_M07_SC_INFO;
  wire [1247:1092]aw_switchboard_M07_SC_PAYLD;
  wire [3:0]aw_switchboard_M07_SC_RECV;
  wire [31:28]aw_switchboard_M07_SC_REQ;
  wire [31:28]aw_switchboard_M07_SC_SEND;
  wire [7:0]b_switchboard_M00_SC_INFO;
  wire [11:0]b_switchboard_M00_SC_PAYLD;
  wire [7:0]b_switchboard_M00_SC_RECV;
  wire [7:0]b_switchboard_M00_SC_REQ;
  wire [7:0]b_switchboard_M00_SC_SEND;
  wire [15:8]b_switchboard_M01_SC_INFO;
  wire [23:12]b_switchboard_M01_SC_PAYLD;
  wire b_switchboard_M01_SC_RECV;
  wire [15:8]b_switchboard_M01_SC_REQ;
  wire [15:8]b_switchboard_M01_SC_SEND;
  wire [23:16]b_switchboard_M02_SC_INFO;
  wire [35:24]b_switchboard_M02_SC_PAYLD;
  wire [7:0]b_switchboard_M02_SC_RECV;
  wire [23:16]b_switchboard_M02_SC_REQ;
  wire [23:16]b_switchboard_M02_SC_SEND;
  wire [31:24]b_switchboard_M03_SC_INFO;
  wire [47:36]b_switchboard_M03_SC_PAYLD;
  wire [7:0]b_switchboard_M03_SC_RECV;
  wire [31:24]b_switchboard_M03_SC_REQ;
  wire [31:24]b_switchboard_M03_SC_SEND;
  wire [7:0]r_switchboard_M00_SC_INFO;
  wire [89:0]r_switchboard_M00_SC_PAYLD;
  wire [7:0]r_switchboard_M00_SC_RECV;
  wire [7:0]r_switchboard_M00_SC_REQ;
  wire [7:0]r_switchboard_M00_SC_SEND;
  wire [15:8]r_switchboard_M01_SC_INFO;
  wire [179:90]r_switchboard_M01_SC_PAYLD;
  wire [7:0]r_switchboard_M01_SC_RECV;
  wire [15:8]r_switchboard_M01_SC_REQ;
  wire [15:8]r_switchboard_M01_SC_SEND;
  wire [23:16]r_switchboard_M02_SC_INFO;
  wire [269:180]r_switchboard_M02_SC_PAYLD;
  wire [7:0]r_switchboard_M02_SC_RECV;
  wire [23:16]r_switchboard_M02_SC_REQ;
  wire [23:16]r_switchboard_M02_SC_SEND;
  wire [31:24]r_switchboard_M03_SC_INFO;
  wire [359:270]r_switchboard_M03_SC_PAYLD;
  wire r_switchboard_M03_SC_RECV;
  wire [31:24]r_switchboard_M03_SC_REQ;
  wire [31:24]r_switchboard_M03_SC_SEND;
  wire [3:0]w_switchboard_M00_SC_INFO;
  wire [94:0]w_switchboard_M00_SC_PAYLD;
  wire [3:0]w_switchboard_M00_SC_RECV;
  wire [3:0]w_switchboard_M00_SC_REQ;
  wire [3:0]w_switchboard_M00_SC_SEND;
  wire [7:4]w_switchboard_M01_SC_INFO;
  wire [189:95]w_switchboard_M01_SC_PAYLD;
  wire [3:0]w_switchboard_M01_SC_RECV;
  wire [7:4]w_switchboard_M01_SC_REQ;
  wire [7:4]w_switchboard_M01_SC_SEND;
  wire [11:8]w_switchboard_M02_SC_INFO;
  wire [284:190]w_switchboard_M02_SC_PAYLD;
  wire [3:0]w_switchboard_M02_SC_RECV;
  wire [11:8]w_switchboard_M02_SC_REQ;
  wire [11:8]w_switchboard_M02_SC_SEND;
  wire [15:12]w_switchboard_M03_SC_INFO;
  wire [379:285]w_switchboard_M03_SC_PAYLD;
  wire [3:0]w_switchboard_M03_SC_RECV;
  wire [15:12]w_switchboard_M03_SC_REQ;
  wire [15:12]w_switchboard_M03_SC_SEND;
  wire [19:16]w_switchboard_M04_SC_INFO;
  wire [474:380]w_switchboard_M04_SC_PAYLD;
  wire [3:0]w_switchboard_M04_SC_RECV;
  wire [19:16]w_switchboard_M04_SC_REQ;
  wire [19:16]w_switchboard_M04_SC_SEND;
  wire [23:20]w_switchboard_M05_SC_INFO;
  wire [569:475]w_switchboard_M05_SC_PAYLD;
  wire [3:0]w_switchboard_M05_SC_RECV;
  wire [23:20]w_switchboard_M05_SC_REQ;
  wire [23:20]w_switchboard_M05_SC_SEND;
  wire [27:24]w_switchboard_M06_SC_INFO;
  wire [664:570]w_switchboard_M06_SC_PAYLD;
  wire [3:0]w_switchboard_M06_SC_RECV;
  wire [27:24]w_switchboard_M06_SC_REQ;
  wire [27:24]w_switchboard_M06_SC_SEND;
  wire [31:28]w_switchboard_M07_SC_INFO;
  wire [759:665]w_switchboard_M07_SC_PAYLD;
  wire [3:0]w_switchboard_M07_SC_RECV;
  wire [31:28]w_switchboard_M07_SC_REQ;
  wire [31:28]w_switchboard_M07_SC_SEND;

  assign M00_SC_AR_info[3:0] = ar_switchboard_M00_SC_INFO;
  assign M00_SC_AR_payld[155:0] = ar_switchboard_M00_SC_PAYLD;
  assign M00_SC_AR_req[3:0] = ar_switchboard_M00_SC_REQ;
  assign M00_SC_AR_send[3:0] = ar_switchboard_M00_SC_SEND;
  assign M00_SC_AW_info[3:0] = aw_switchboard_M00_SC_INFO;
  assign M00_SC_AW_payld[155:0] = aw_switchboard_M00_SC_PAYLD;
  assign M00_SC_AW_req[3:0] = aw_switchboard_M00_SC_REQ;
  assign M00_SC_AW_send[3:0] = aw_switchboard_M00_SC_SEND;
  assign M00_SC_B_info[7:0] = b_switchboard_M00_SC_INFO;
  assign M00_SC_B_payld[11:0] = b_switchboard_M00_SC_PAYLD;
  assign M00_SC_B_req[7:0] = b_switchboard_M00_SC_REQ;
  assign M00_SC_B_send[7:0] = b_switchboard_M00_SC_SEND;
  assign M00_SC_R_info[7:0] = r_switchboard_M00_SC_INFO;
  assign M00_SC_R_payld[89:0] = r_switchboard_M00_SC_PAYLD;
  assign M00_SC_R_req[7:0] = r_switchboard_M00_SC_REQ;
  assign M00_SC_R_send[7:0] = r_switchboard_M00_SC_SEND;
  assign M00_SC_W_info[3:0] = w_switchboard_M00_SC_INFO;
  assign M00_SC_W_payld[94:0] = w_switchboard_M00_SC_PAYLD;
  assign M00_SC_W_req[3:0] = w_switchboard_M00_SC_REQ;
  assign M00_SC_W_send[3:0] = w_switchboard_M00_SC_SEND;
  assign M01_SC_AR_info[3:0] = ar_switchboard_M01_SC_INFO;
  assign M01_SC_AR_payld[155:0] = ar_switchboard_M01_SC_PAYLD;
  assign M01_SC_AR_req[3:0] = ar_switchboard_M01_SC_REQ;
  assign M01_SC_AR_send[3:0] = ar_switchboard_M01_SC_SEND;
  assign M01_SC_AW_info[3:0] = aw_switchboard_M01_SC_INFO;
  assign M01_SC_AW_payld[155:0] = aw_switchboard_M01_SC_PAYLD;
  assign M01_SC_AW_req[3:0] = aw_switchboard_M01_SC_REQ;
  assign M01_SC_AW_send[3:0] = aw_switchboard_M01_SC_SEND;
  assign M01_SC_B_info = b_switchboard_M01_SC_INFO[8];
  assign M01_SC_B_payld = b_switchboard_M01_SC_PAYLD[12];
  assign M01_SC_B_req = b_switchboard_M01_SC_REQ[8];
  assign M01_SC_B_send = b_switchboard_M01_SC_SEND[8];
  assign M01_SC_R_info[7:0] = r_switchboard_M01_SC_INFO;
  assign M01_SC_R_payld[89:0] = r_switchboard_M01_SC_PAYLD;
  assign M01_SC_R_req[7:0] = r_switchboard_M01_SC_REQ;
  assign M01_SC_R_send[7:0] = r_switchboard_M01_SC_SEND;
  assign M01_SC_W_info[3:0] = w_switchboard_M01_SC_INFO;
  assign M01_SC_W_payld[94:0] = w_switchboard_M01_SC_PAYLD;
  assign M01_SC_W_req[3:0] = w_switchboard_M01_SC_REQ;
  assign M01_SC_W_send[3:0] = w_switchboard_M01_SC_SEND;
  assign M02_SC_AR_info[3:0] = ar_switchboard_M02_SC_INFO;
  assign M02_SC_AR_payld[155:0] = ar_switchboard_M02_SC_PAYLD;
  assign M02_SC_AR_req[3:0] = ar_switchboard_M02_SC_REQ;
  assign M02_SC_AR_send[3:0] = ar_switchboard_M02_SC_SEND;
  assign M02_SC_AW_info[3:0] = aw_switchboard_M02_SC_INFO;
  assign M02_SC_AW_payld[155:0] = aw_switchboard_M02_SC_PAYLD;
  assign M02_SC_AW_req[3:0] = aw_switchboard_M02_SC_REQ;
  assign M02_SC_AW_send[3:0] = aw_switchboard_M02_SC_SEND;
  assign M02_SC_B_info[7:0] = b_switchboard_M02_SC_INFO;
  assign M02_SC_B_payld[11:0] = b_switchboard_M02_SC_PAYLD;
  assign M02_SC_B_req[7:0] = b_switchboard_M02_SC_REQ;
  assign M02_SC_B_send[7:0] = b_switchboard_M02_SC_SEND;
  assign M02_SC_R_info[7:0] = r_switchboard_M02_SC_INFO;
  assign M02_SC_R_payld[89:0] = r_switchboard_M02_SC_PAYLD;
  assign M02_SC_R_req[7:0] = r_switchboard_M02_SC_REQ;
  assign M02_SC_R_send[7:0] = r_switchboard_M02_SC_SEND;
  assign M02_SC_W_info[3:0] = w_switchboard_M02_SC_INFO;
  assign M02_SC_W_payld[94:0] = w_switchboard_M02_SC_PAYLD;
  assign M02_SC_W_req[3:0] = w_switchboard_M02_SC_REQ;
  assign M02_SC_W_send[3:0] = w_switchboard_M02_SC_SEND;
  assign M03_SC_AR_info[3:0] = ar_switchboard_M03_SC_INFO;
  assign M03_SC_AR_payld[155:0] = ar_switchboard_M03_SC_PAYLD;
  assign M03_SC_AR_req[3:0] = ar_switchboard_M03_SC_REQ;
  assign M03_SC_AR_send[3:0] = ar_switchboard_M03_SC_SEND;
  assign M03_SC_AW_info[3:0] = aw_switchboard_M03_SC_INFO;
  assign M03_SC_AW_payld[155:0] = aw_switchboard_M03_SC_PAYLD;
  assign M03_SC_AW_req[3:0] = aw_switchboard_M03_SC_REQ;
  assign M03_SC_AW_send[3:0] = aw_switchboard_M03_SC_SEND;
  assign M03_SC_B_info[7:0] = b_switchboard_M03_SC_INFO;
  assign M03_SC_B_payld[11:0] = b_switchboard_M03_SC_PAYLD;
  assign M03_SC_B_req[7:0] = b_switchboard_M03_SC_REQ;
  assign M03_SC_B_send[7:0] = b_switchboard_M03_SC_SEND;
  assign M03_SC_R_info = r_switchboard_M03_SC_INFO[24];
  assign M03_SC_R_payld = r_switchboard_M03_SC_PAYLD[270];
  assign M03_SC_R_req = r_switchboard_M03_SC_REQ[24];
  assign M03_SC_R_send = r_switchboard_M03_SC_SEND[24];
  assign M03_SC_W_info[3:0] = w_switchboard_M03_SC_INFO;
  assign M03_SC_W_payld[94:0] = w_switchboard_M03_SC_PAYLD;
  assign M03_SC_W_req[3:0] = w_switchboard_M03_SC_REQ;
  assign M03_SC_W_send[3:0] = w_switchboard_M03_SC_SEND;
  assign M04_SC_AR_info[3:0] = ar_switchboard_M04_SC_INFO;
  assign M04_SC_AR_payld[155:0] = ar_switchboard_M04_SC_PAYLD;
  assign M04_SC_AR_req[3:0] = ar_switchboard_M04_SC_REQ;
  assign M04_SC_AR_send[3:0] = ar_switchboard_M04_SC_SEND;
  assign M04_SC_AW_info[3:0] = aw_switchboard_M04_SC_INFO;
  assign M04_SC_AW_payld[155:0] = aw_switchboard_M04_SC_PAYLD;
  assign M04_SC_AW_req[3:0] = aw_switchboard_M04_SC_REQ;
  assign M04_SC_AW_send[3:0] = aw_switchboard_M04_SC_SEND;
  assign M04_SC_W_info[3:0] = w_switchboard_M04_SC_INFO;
  assign M04_SC_W_payld[94:0] = w_switchboard_M04_SC_PAYLD;
  assign M04_SC_W_req[3:0] = w_switchboard_M04_SC_REQ;
  assign M04_SC_W_send[3:0] = w_switchboard_M04_SC_SEND;
  assign M05_SC_AR_info[3:0] = ar_switchboard_M05_SC_INFO;
  assign M05_SC_AR_payld[155:0] = ar_switchboard_M05_SC_PAYLD;
  assign M05_SC_AR_req[3:0] = ar_switchboard_M05_SC_REQ;
  assign M05_SC_AR_send[3:0] = ar_switchboard_M05_SC_SEND;
  assign M05_SC_AW_info[3:0] = aw_switchboard_M05_SC_INFO;
  assign M05_SC_AW_payld[155:0] = aw_switchboard_M05_SC_PAYLD;
  assign M05_SC_AW_req[3:0] = aw_switchboard_M05_SC_REQ;
  assign M05_SC_AW_send[3:0] = aw_switchboard_M05_SC_SEND;
  assign M05_SC_W_info[3:0] = w_switchboard_M05_SC_INFO;
  assign M05_SC_W_payld[94:0] = w_switchboard_M05_SC_PAYLD;
  assign M05_SC_W_req[3:0] = w_switchboard_M05_SC_REQ;
  assign M05_SC_W_send[3:0] = w_switchboard_M05_SC_SEND;
  assign M06_SC_AR_info[3:0] = ar_switchboard_M06_SC_INFO;
  assign M06_SC_AR_payld[155:0] = ar_switchboard_M06_SC_PAYLD;
  assign M06_SC_AR_req[3:0] = ar_switchboard_M06_SC_REQ;
  assign M06_SC_AR_send[3:0] = ar_switchboard_M06_SC_SEND;
  assign M06_SC_AW_info[3:0] = aw_switchboard_M06_SC_INFO;
  assign M06_SC_AW_payld[155:0] = aw_switchboard_M06_SC_PAYLD;
  assign M06_SC_AW_req[3:0] = aw_switchboard_M06_SC_REQ;
  assign M06_SC_AW_send[3:0] = aw_switchboard_M06_SC_SEND;
  assign M06_SC_W_info[3:0] = w_switchboard_M06_SC_INFO;
  assign M06_SC_W_payld[94:0] = w_switchboard_M06_SC_PAYLD;
  assign M06_SC_W_req[3:0] = w_switchboard_M06_SC_REQ;
  assign M06_SC_W_send[3:0] = w_switchboard_M06_SC_SEND;
  assign M07_SC_AR_info[3:0] = ar_switchboard_M07_SC_INFO;
  assign M07_SC_AR_payld[155:0] = ar_switchboard_M07_SC_PAYLD;
  assign M07_SC_AR_req[3:0] = ar_switchboard_M07_SC_REQ;
  assign M07_SC_AR_send[3:0] = ar_switchboard_M07_SC_SEND;
  assign M07_SC_AW_info[3:0] = aw_switchboard_M07_SC_INFO;
  assign M07_SC_AW_payld[155:0] = aw_switchboard_M07_SC_PAYLD;
  assign M07_SC_AW_req[3:0] = aw_switchboard_M07_SC_REQ;
  assign M07_SC_AW_send[3:0] = aw_switchboard_M07_SC_SEND;
  assign M07_SC_W_info[3:0] = w_switchboard_M07_SC_INFO;
  assign M07_SC_W_payld[94:0] = w_switchboard_M07_SC_PAYLD;
  assign M07_SC_W_req[3:0] = w_switchboard_M07_SC_REQ;
  assign M07_SC_W_send[3:0] = w_switchboard_M07_SC_SEND;
  assign S00_SC_AR_1_INFO = S00_SC_AR_info[7:0];
  assign S00_SC_AR_1_PAYLD = S00_SC_AR_payld[155:0];
  assign S00_SC_AR_1_REQ = S00_SC_AR_req[7:0];
  assign S00_SC_AR_1_SEND = S00_SC_AR_send[7:0];
  assign S00_SC_AR_recv[7:0] = S00_SC_AR_1_RECV;
  assign S00_SC_AW_1_INFO = S00_SC_AW_info[7:0];
  assign S00_SC_AW_1_PAYLD = S00_SC_AW_payld[155:0];
  assign S00_SC_AW_1_REQ = S00_SC_AW_req[7:0];
  assign S00_SC_AW_1_SEND = S00_SC_AW_send[7:0];
  assign S00_SC_AW_recv[7:0] = S00_SC_AW_1_RECV;
  assign S00_SC_B_1_INFO = S00_SC_B_info[3:0];
  assign S00_SC_B_1_PAYLD = S00_SC_B_payld[11:0];
  assign S00_SC_B_1_REQ = S00_SC_B_req[3:0];
  assign S00_SC_B_1_SEND = S00_SC_B_send[3:0];
  assign S00_SC_B_recv[3:0] = S00_SC_B_1_RECV;
  assign S00_SC_R_1_INFO = S00_SC_R_info[3:0];
  assign S00_SC_R_1_PAYLD = S00_SC_R_payld[89:0];
  assign S00_SC_R_1_REQ = S00_SC_R_req[3:0];
  assign S00_SC_R_1_SEND = S00_SC_R_send[3:0];
  assign S00_SC_R_recv[3:0] = S00_SC_R_1_RECV;
  assign S00_SC_W_1_INFO = S00_SC_W_info[7:0];
  assign S00_SC_W_1_PAYLD = S00_SC_W_payld[94:0];
  assign S00_SC_W_1_REQ = S00_SC_W_req[7:0];
  assign S00_SC_W_1_SEND = S00_SC_W_send[7:0];
  assign S00_SC_W_recv[7:0] = S00_SC_W_1_RECV;
  assign S01_SC_AR_1_INFO = S01_SC_AR_info[7:0];
  assign S01_SC_AR_1_PAYLD = S01_SC_AR_payld[155:0];
  assign S01_SC_AR_1_REQ = S01_SC_AR_req[7:0];
  assign S01_SC_AR_1_SEND = S01_SC_AR_send[7:0];
  assign S01_SC_AR_recv[7:0] = S01_SC_AR_1_RECV;
  assign S01_SC_AW_1_INFO = S01_SC_AW_info;
  assign S01_SC_AW_1_PAYLD = S01_SC_AW_payld;
  assign S01_SC_AW_1_REQ = S01_SC_AW_req;
  assign S01_SC_AW_1_SEND = S01_SC_AW_send;
  assign S01_SC_AW_recv = S01_SC_AW_1_RECV[8];
  assign S01_SC_B_1_INFO = S01_SC_B_info[3:0];
  assign S01_SC_B_1_PAYLD = S01_SC_B_payld[11:0];
  assign S01_SC_B_1_REQ = S01_SC_B_req[3:0];
  assign S01_SC_B_1_SEND = S01_SC_B_send[3:0];
  assign S01_SC_B_recv[3:0] = S01_SC_B_1_RECV;
  assign S01_SC_R_1_INFO = S01_SC_R_info[3:0];
  assign S01_SC_R_1_PAYLD = S01_SC_R_payld[89:0];
  assign S01_SC_R_1_REQ = S01_SC_R_req[3:0];
  assign S01_SC_R_1_SEND = S01_SC_R_send[3:0];
  assign S01_SC_R_recv[3:0] = S01_SC_R_1_RECV;
  assign S01_SC_W_1_INFO = S01_SC_W_info;
  assign S01_SC_W_1_PAYLD = S01_SC_W_payld;
  assign S01_SC_W_1_REQ = S01_SC_W_req;
  assign S01_SC_W_1_SEND = S01_SC_W_send;
  assign S01_SC_W_recv = S01_SC_W_1_RECV[8];
  assign S02_SC_AR_1_INFO = S02_SC_AR_info[7:0];
  assign S02_SC_AR_1_PAYLD = S02_SC_AR_payld[155:0];
  assign S02_SC_AR_1_REQ = S02_SC_AR_req[7:0];
  assign S02_SC_AR_1_SEND = S02_SC_AR_send[7:0];
  assign S02_SC_AR_recv[7:0] = S02_SC_AR_1_RECV;
  assign S02_SC_AW_1_INFO = S02_SC_AW_info[7:0];
  assign S02_SC_AW_1_PAYLD = S02_SC_AW_payld[155:0];
  assign S02_SC_AW_1_REQ = S02_SC_AW_req[7:0];
  assign S02_SC_AW_1_SEND = S02_SC_AW_send[7:0];
  assign S02_SC_AW_recv[7:0] = S02_SC_AW_1_RECV;
  assign S02_SC_B_1_INFO = S02_SC_B_info[3:0];
  assign S02_SC_B_1_PAYLD = S02_SC_B_payld[11:0];
  assign S02_SC_B_1_REQ = S02_SC_B_req[3:0];
  assign S02_SC_B_1_SEND = S02_SC_B_send[3:0];
  assign S02_SC_B_recv[3:0] = S02_SC_B_1_RECV;
  assign S02_SC_R_1_INFO = S02_SC_R_info[3:0];
  assign S02_SC_R_1_PAYLD = S02_SC_R_payld[89:0];
  assign S02_SC_R_1_REQ = S02_SC_R_req[3:0];
  assign S02_SC_R_1_SEND = S02_SC_R_send[3:0];
  assign S02_SC_R_recv[3:0] = S02_SC_R_1_RECV;
  assign S02_SC_W_1_INFO = S02_SC_W_info[7:0];
  assign S02_SC_W_1_PAYLD = S02_SC_W_payld[94:0];
  assign S02_SC_W_1_REQ = S02_SC_W_req[7:0];
  assign S02_SC_W_1_SEND = S02_SC_W_send[7:0];
  assign S02_SC_W_recv[7:0] = S02_SC_W_1_RECV;
  assign S03_SC_AR_1_INFO = S03_SC_AR_info;
  assign S03_SC_AR_1_PAYLD = S03_SC_AR_payld;
  assign S03_SC_AR_1_REQ = S03_SC_AR_req;
  assign S03_SC_AR_1_SEND = S03_SC_AR_send;
  assign S03_SC_AR_recv = S03_SC_AR_1_RECV[24];
  assign S03_SC_AW_1_INFO = S03_SC_AW_info[7:0];
  assign S03_SC_AW_1_PAYLD = S03_SC_AW_payld[155:0];
  assign S03_SC_AW_1_REQ = S03_SC_AW_req[7:0];
  assign S03_SC_AW_1_SEND = S03_SC_AW_send[7:0];
  assign S03_SC_AW_recv[7:0] = S03_SC_AW_1_RECV;
  assign S03_SC_B_1_INFO = S03_SC_B_info[3:0];
  assign S03_SC_B_1_PAYLD = S03_SC_B_payld[11:0];
  assign S03_SC_B_1_REQ = S03_SC_B_req[3:0];
  assign S03_SC_B_1_SEND = S03_SC_B_send[3:0];
  assign S03_SC_B_recv[3:0] = S03_SC_B_1_RECV;
  assign S03_SC_R_1_INFO = S03_SC_R_info[3:0];
  assign S03_SC_R_1_PAYLD = S03_SC_R_payld[89:0];
  assign S03_SC_R_1_REQ = S03_SC_R_req[3:0];
  assign S03_SC_R_1_SEND = S03_SC_R_send[3:0];
  assign S03_SC_R_recv[3:0] = S03_SC_R_1_RECV;
  assign S03_SC_W_1_INFO = S03_SC_W_info[7:0];
  assign S03_SC_W_1_PAYLD = S03_SC_W_payld[94:0];
  assign S03_SC_W_1_REQ = S03_SC_W_req[7:0];
  assign S03_SC_W_1_SEND = S03_SC_W_send[7:0];
  assign S03_SC_W_recv[7:0] = S03_SC_W_1_RECV;
  assign S04_SC_B_1_INFO = S04_SC_B_info[3:0];
  assign S04_SC_B_1_PAYLD = S04_SC_B_payld[11:0];
  assign S04_SC_B_1_REQ = S04_SC_B_req[3:0];
  assign S04_SC_B_1_SEND = S04_SC_B_send[3:0];
  assign S04_SC_B_recv[3:0] = S04_SC_B_1_RECV;
  assign S04_SC_R_1_INFO = S04_SC_R_info[3:0];
  assign S04_SC_R_1_PAYLD = S04_SC_R_payld[89:0];
  assign S04_SC_R_1_REQ = S04_SC_R_req[3:0];
  assign S04_SC_R_1_SEND = S04_SC_R_send[3:0];
  assign S04_SC_R_recv[3:0] = S04_SC_R_1_RECV;
  assign S05_SC_B_1_INFO = S05_SC_B_info[3:0];
  assign S05_SC_B_1_PAYLD = S05_SC_B_payld[11:0];
  assign S05_SC_B_1_REQ = S05_SC_B_req[3:0];
  assign S05_SC_B_1_SEND = S05_SC_B_send[3:0];
  assign S05_SC_B_recv[3:0] = S05_SC_B_1_RECV;
  assign S05_SC_R_1_INFO = S05_SC_R_info[3:0];
  assign S05_SC_R_1_PAYLD = S05_SC_R_payld[89:0];
  assign S05_SC_R_1_REQ = S05_SC_R_req[3:0];
  assign S05_SC_R_1_SEND = S05_SC_R_send[3:0];
  assign S05_SC_R_recv[3:0] = S05_SC_R_1_RECV;
  assign S06_SC_B_1_INFO = S06_SC_B_info[3:0];
  assign S06_SC_B_1_PAYLD = S06_SC_B_payld[11:0];
  assign S06_SC_B_1_REQ = S06_SC_B_req[3:0];
  assign S06_SC_B_1_SEND = S06_SC_B_send[3:0];
  assign S06_SC_B_recv[3:0] = S06_SC_B_1_RECV;
  assign S06_SC_R_1_INFO = S06_SC_R_info[3:0];
  assign S06_SC_R_1_PAYLD = S06_SC_R_payld[89:0];
  assign S06_SC_R_1_REQ = S06_SC_R_req[3:0];
  assign S06_SC_R_1_SEND = S06_SC_R_send[3:0];
  assign S06_SC_R_recv[3:0] = S06_SC_R_1_RECV;
  assign S07_SC_B_1_INFO = S07_SC_B_info[3:0];
  assign S07_SC_B_1_PAYLD = S07_SC_B_payld[11:0];
  assign S07_SC_B_1_REQ = S07_SC_B_req[3:0];
  assign S07_SC_B_1_SEND = S07_SC_B_send[3:0];
  assign S07_SC_B_recv[3:0] = S07_SC_B_1_RECV;
  assign S07_SC_R_1_INFO = S07_SC_R_info[3:0];
  assign S07_SC_R_1_PAYLD = S07_SC_R_payld[89:0];
  assign S07_SC_R_1_REQ = S07_SC_R_req[3:0];
  assign S07_SC_R_1_SEND = S07_SC_R_send[3:0];
  assign S07_SC_R_recv[3:0] = S07_SC_R_1_RECV;
  assign aclk_1 = aclk;
  assign ar_switchboard_M00_SC_RECV = M00_SC_AR_recv[3:0];
  assign ar_switchboard_M01_SC_RECV = M01_SC_AR_recv[3:0];
  assign ar_switchboard_M02_SC_RECV = M02_SC_AR_recv[3:0];
  assign ar_switchboard_M03_SC_RECV = M03_SC_AR_recv[3:0];
  assign ar_switchboard_M04_SC_RECV = M04_SC_AR_recv[3:0];
  assign ar_switchboard_M05_SC_RECV = M05_SC_AR_recv[3:0];
  assign ar_switchboard_M06_SC_RECV = M06_SC_AR_recv[3:0];
  assign ar_switchboard_M07_SC_RECV = M07_SC_AR_recv[3:0];
  assign aw_switchboard_M00_SC_RECV = M00_SC_AW_recv[3:0];
  assign aw_switchboard_M01_SC_RECV = M01_SC_AW_recv[3:0];
  assign aw_switchboard_M02_SC_RECV = M02_SC_AW_recv[3:0];
  assign aw_switchboard_M03_SC_RECV = M03_SC_AW_recv[3:0];
  assign aw_switchboard_M04_SC_RECV = M04_SC_AW_recv[3:0];
  assign aw_switchboard_M05_SC_RECV = M05_SC_AW_recv[3:0];
  assign aw_switchboard_M06_SC_RECV = M06_SC_AW_recv[3:0];
  assign aw_switchboard_M07_SC_RECV = M07_SC_AW_recv[3:0];
  assign b_switchboard_M00_SC_RECV = M00_SC_B_recv[7:0];
  assign b_switchboard_M01_SC_RECV = M01_SC_B_recv;
  assign b_switchboard_M02_SC_RECV = M02_SC_B_recv[7:0];
  assign b_switchboard_M03_SC_RECV = M03_SC_B_recv[7:0];
  assign r_switchboard_M00_SC_RECV = M00_SC_R_recv[7:0];
  assign r_switchboard_M01_SC_RECV = M01_SC_R_recv[7:0];
  assign r_switchboard_M02_SC_RECV = M02_SC_R_recv[7:0];
  assign r_switchboard_M03_SC_RECV = M03_SC_R_recv;
  assign w_switchboard_M00_SC_RECV = M00_SC_W_recv[3:0];
  assign w_switchboard_M01_SC_RECV = M01_SC_W_recv[3:0];
  assign w_switchboard_M02_SC_RECV = M02_SC_W_recv[3:0];
  assign w_switchboard_M03_SC_RECV = M03_SC_W_recv[3:0];
  assign w_switchboard_M04_SC_RECV = M04_SC_W_recv[3:0];
  assign w_switchboard_M05_SC_RECV = M05_SC_W_recv[3:0];
  assign w_switchboard_M06_SC_RECV = M06_SC_W_recv[3:0];
  assign w_switchboard_M07_SC_RECV = M07_SC_W_recv[3:0];
  bd_63e1_arsw_0 ar_switchboard
       (.aclk(aclk_1),
        .aclken(1'b1),
        .m_sc_info({ar_switchboard_M07_SC_INFO,ar_switchboard_M06_SC_INFO,ar_switchboard_M05_SC_INFO,ar_switchboard_M04_SC_INFO,ar_switchboard_M03_SC_INFO,ar_switchboard_M02_SC_INFO,ar_switchboard_M01_SC_INFO,ar_switchboard_M00_SC_INFO}),
        .m_sc_payld({ar_switchboard_M07_SC_PAYLD,ar_switchboard_M06_SC_PAYLD,ar_switchboard_M05_SC_PAYLD,ar_switchboard_M04_SC_PAYLD,ar_switchboard_M03_SC_PAYLD,ar_switchboard_M02_SC_PAYLD,ar_switchboard_M01_SC_PAYLD,ar_switchboard_M00_SC_PAYLD}),
        .m_sc_recv({ar_switchboard_M07_SC_RECV,ar_switchboard_M06_SC_RECV,ar_switchboard_M05_SC_RECV,ar_switchboard_M04_SC_RECV,ar_switchboard_M03_SC_RECV,ar_switchboard_M02_SC_RECV,ar_switchboard_M01_SC_RECV,ar_switchboard_M00_SC_RECV}),
        .m_sc_req({ar_switchboard_M07_SC_REQ,ar_switchboard_M06_SC_REQ,ar_switchboard_M05_SC_REQ,ar_switchboard_M04_SC_REQ,ar_switchboard_M03_SC_REQ,ar_switchboard_M02_SC_REQ,ar_switchboard_M01_SC_REQ,ar_switchboard_M00_SC_REQ}),
        .m_sc_send({ar_switchboard_M07_SC_SEND,ar_switchboard_M06_SC_SEND,ar_switchboard_M05_SC_SEND,ar_switchboard_M04_SC_SEND,ar_switchboard_M03_SC_SEND,ar_switchboard_M02_SC_SEND,ar_switchboard_M01_SC_SEND,ar_switchboard_M00_SC_SEND}),
        .s_sc_info({S03_SC_AR_1_INFO,S03_SC_AR_1_INFO,S03_SC_AR_1_INFO,S03_SC_AR_1_INFO,S03_SC_AR_1_INFO,S03_SC_AR_1_INFO,S03_SC_AR_1_INFO,S03_SC_AR_1_INFO,S02_SC_AR_1_INFO,S01_SC_AR_1_INFO,S00_SC_AR_1_INFO}),
        .s_sc_payld({S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S03_SC_AR_1_PAYLD,S02_SC_AR_1_PAYLD,S01_SC_AR_1_PAYLD,S00_SC_AR_1_PAYLD}),
        .s_sc_recv({S03_SC_AR_1_RECV,S02_SC_AR_1_RECV,S01_SC_AR_1_RECV,S00_SC_AR_1_RECV}),
        .s_sc_req({S03_SC_AR_1_REQ,S03_SC_AR_1_REQ,S03_SC_AR_1_REQ,S03_SC_AR_1_REQ,S03_SC_AR_1_REQ,S03_SC_AR_1_REQ,S03_SC_AR_1_REQ,S03_SC_AR_1_REQ,S02_SC_AR_1_REQ,S01_SC_AR_1_REQ,S00_SC_AR_1_REQ}),
        .s_sc_send({S03_SC_AR_1_SEND,S03_SC_AR_1_SEND,S03_SC_AR_1_SEND,S03_SC_AR_1_SEND,S03_SC_AR_1_SEND,S03_SC_AR_1_SEND,S03_SC_AR_1_SEND,S03_SC_AR_1_SEND,S02_SC_AR_1_SEND,S01_SC_AR_1_SEND,S00_SC_AR_1_SEND}));
  bd_63e1_awsw_0 aw_switchboard
       (.aclk(aclk_1),
        .aclken(1'b1),
        .m_sc_info({aw_switchboard_M07_SC_INFO,aw_switchboard_M06_SC_INFO,aw_switchboard_M05_SC_INFO,aw_switchboard_M04_SC_INFO,aw_switchboard_M03_SC_INFO,aw_switchboard_M02_SC_INFO,aw_switchboard_M01_SC_INFO,aw_switchboard_M00_SC_INFO}),
        .m_sc_payld({aw_switchboard_M07_SC_PAYLD,aw_switchboard_M06_SC_PAYLD,aw_switchboard_M05_SC_PAYLD,aw_switchboard_M04_SC_PAYLD,aw_switchboard_M03_SC_PAYLD,aw_switchboard_M02_SC_PAYLD,aw_switchboard_M01_SC_PAYLD,aw_switchboard_M00_SC_PAYLD}),
        .m_sc_recv({aw_switchboard_M07_SC_RECV,aw_switchboard_M06_SC_RECV,aw_switchboard_M05_SC_RECV,aw_switchboard_M04_SC_RECV,aw_switchboard_M03_SC_RECV,aw_switchboard_M02_SC_RECV,aw_switchboard_M01_SC_RECV,aw_switchboard_M00_SC_RECV}),
        .m_sc_req({aw_switchboard_M07_SC_REQ,aw_switchboard_M06_SC_REQ,aw_switchboard_M05_SC_REQ,aw_switchboard_M04_SC_REQ,aw_switchboard_M03_SC_REQ,aw_switchboard_M02_SC_REQ,aw_switchboard_M01_SC_REQ,aw_switchboard_M00_SC_REQ}),
        .m_sc_send({aw_switchboard_M07_SC_SEND,aw_switchboard_M06_SC_SEND,aw_switchboard_M05_SC_SEND,aw_switchboard_M04_SC_SEND,aw_switchboard_M03_SC_SEND,aw_switchboard_M02_SC_SEND,aw_switchboard_M01_SC_SEND,aw_switchboard_M00_SC_SEND}),
        .s_sc_info({S03_SC_AW_1_INFO,S02_SC_AW_1_INFO,S01_SC_AW_1_INFO,S01_SC_AW_1_INFO,S01_SC_AW_1_INFO,S01_SC_AW_1_INFO,S01_SC_AW_1_INFO,S01_SC_AW_1_INFO,S01_SC_AW_1_INFO,S01_SC_AW_1_INFO,S00_SC_AW_1_INFO}),
        .s_sc_payld({S03_SC_AW_1_PAYLD,S02_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S01_SC_AW_1_PAYLD,S00_SC_AW_1_PAYLD}),
        .s_sc_recv({S03_SC_AW_1_RECV,S02_SC_AW_1_RECV,S01_SC_AW_1_RECV,S00_SC_AW_1_RECV}),
        .s_sc_req({S03_SC_AW_1_REQ,S02_SC_AW_1_REQ,S01_SC_AW_1_REQ,S01_SC_AW_1_REQ,S01_SC_AW_1_REQ,S01_SC_AW_1_REQ,S01_SC_AW_1_REQ,S01_SC_AW_1_REQ,S01_SC_AW_1_REQ,S01_SC_AW_1_REQ,S00_SC_AW_1_REQ}),
        .s_sc_send({S03_SC_AW_1_SEND,S02_SC_AW_1_SEND,S01_SC_AW_1_SEND,S01_SC_AW_1_SEND,S01_SC_AW_1_SEND,S01_SC_AW_1_SEND,S01_SC_AW_1_SEND,S01_SC_AW_1_SEND,S01_SC_AW_1_SEND,S01_SC_AW_1_SEND,S00_SC_AW_1_SEND}));
  bd_63e1_bsw_0 b_switchboard
       (.aclk(aclk_1),
        .aclken(1'b1),
        .m_sc_info({b_switchboard_M03_SC_INFO,b_switchboard_M02_SC_INFO,b_switchboard_M01_SC_INFO,b_switchboard_M00_SC_INFO}),
        .m_sc_payld({b_switchboard_M03_SC_PAYLD,b_switchboard_M02_SC_PAYLD,b_switchboard_M01_SC_PAYLD,b_switchboard_M00_SC_PAYLD}),
        .m_sc_recv({b_switchboard_M03_SC_RECV,b_switchboard_M02_SC_RECV,b_switchboard_M01_SC_RECV,b_switchboard_M01_SC_RECV,b_switchboard_M01_SC_RECV,b_switchboard_M01_SC_RECV,b_switchboard_M01_SC_RECV,b_switchboard_M01_SC_RECV,b_switchboard_M01_SC_RECV,b_switchboard_M01_SC_RECV,b_switchboard_M00_SC_RECV}),
        .m_sc_req({b_switchboard_M03_SC_REQ,b_switchboard_M02_SC_REQ,b_switchboard_M01_SC_REQ,b_switchboard_M00_SC_REQ}),
        .m_sc_send({b_switchboard_M03_SC_SEND,b_switchboard_M02_SC_SEND,b_switchboard_M01_SC_SEND,b_switchboard_M00_SC_SEND}),
        .s_sc_info({S07_SC_B_1_INFO,S06_SC_B_1_INFO,S05_SC_B_1_INFO,S04_SC_B_1_INFO,S03_SC_B_1_INFO,S02_SC_B_1_INFO,S01_SC_B_1_INFO,S00_SC_B_1_INFO}),
        .s_sc_payld({S07_SC_B_1_PAYLD,S06_SC_B_1_PAYLD,S05_SC_B_1_PAYLD,S04_SC_B_1_PAYLD,S03_SC_B_1_PAYLD,S02_SC_B_1_PAYLD,S01_SC_B_1_PAYLD,S00_SC_B_1_PAYLD}),
        .s_sc_recv({S07_SC_B_1_RECV,S06_SC_B_1_RECV,S05_SC_B_1_RECV,S04_SC_B_1_RECV,S03_SC_B_1_RECV,S02_SC_B_1_RECV,S01_SC_B_1_RECV,S00_SC_B_1_RECV}),
        .s_sc_req({S07_SC_B_1_REQ,S06_SC_B_1_REQ,S05_SC_B_1_REQ,S04_SC_B_1_REQ,S03_SC_B_1_REQ,S02_SC_B_1_REQ,S01_SC_B_1_REQ,S00_SC_B_1_REQ}),
        .s_sc_send({S07_SC_B_1_SEND,S06_SC_B_1_SEND,S05_SC_B_1_SEND,S04_SC_B_1_SEND,S03_SC_B_1_SEND,S02_SC_B_1_SEND,S01_SC_B_1_SEND,S00_SC_B_1_SEND}));
  bd_63e1_rsw_0 r_switchboard
       (.aclk(aclk_1),
        .aclken(1'b1),
        .m_sc_info({r_switchboard_M03_SC_INFO,r_switchboard_M02_SC_INFO,r_switchboard_M01_SC_INFO,r_switchboard_M00_SC_INFO}),
        .m_sc_payld({r_switchboard_M03_SC_PAYLD,r_switchboard_M02_SC_PAYLD,r_switchboard_M01_SC_PAYLD,r_switchboard_M00_SC_PAYLD}),
        .m_sc_recv({r_switchboard_M03_SC_RECV,r_switchboard_M03_SC_RECV,r_switchboard_M03_SC_RECV,r_switchboard_M03_SC_RECV,r_switchboard_M03_SC_RECV,r_switchboard_M03_SC_RECV,r_switchboard_M03_SC_RECV,r_switchboard_M03_SC_RECV,r_switchboard_M02_SC_RECV,r_switchboard_M01_SC_RECV,r_switchboard_M00_SC_RECV}),
        .m_sc_req({r_switchboard_M03_SC_REQ,r_switchboard_M02_SC_REQ,r_switchboard_M01_SC_REQ,r_switchboard_M00_SC_REQ}),
        .m_sc_send({r_switchboard_M03_SC_SEND,r_switchboard_M02_SC_SEND,r_switchboard_M01_SC_SEND,r_switchboard_M00_SC_SEND}),
        .s_sc_info({S07_SC_R_1_INFO,S06_SC_R_1_INFO,S05_SC_R_1_INFO,S04_SC_R_1_INFO,S03_SC_R_1_INFO,S02_SC_R_1_INFO,S01_SC_R_1_INFO,S00_SC_R_1_INFO}),
        .s_sc_payld({S07_SC_R_1_PAYLD,S06_SC_R_1_PAYLD,S05_SC_R_1_PAYLD,S04_SC_R_1_PAYLD,S03_SC_R_1_PAYLD,S02_SC_R_1_PAYLD,S01_SC_R_1_PAYLD,S00_SC_R_1_PAYLD}),
        .s_sc_recv({S07_SC_R_1_RECV,S06_SC_R_1_RECV,S05_SC_R_1_RECV,S04_SC_R_1_RECV,S03_SC_R_1_RECV,S02_SC_R_1_RECV,S01_SC_R_1_RECV,S00_SC_R_1_RECV}),
        .s_sc_req({S07_SC_R_1_REQ,S06_SC_R_1_REQ,S05_SC_R_1_REQ,S04_SC_R_1_REQ,S03_SC_R_1_REQ,S02_SC_R_1_REQ,S01_SC_R_1_REQ,S00_SC_R_1_REQ}),
        .s_sc_send({S07_SC_R_1_SEND,S06_SC_R_1_SEND,S05_SC_R_1_SEND,S04_SC_R_1_SEND,S03_SC_R_1_SEND,S02_SC_R_1_SEND,S01_SC_R_1_SEND,S00_SC_R_1_SEND}));
  bd_63e1_wsw_0 w_switchboard
       (.aclk(aclk_1),
        .aclken(1'b1),
        .m_sc_info({w_switchboard_M07_SC_INFO,w_switchboard_M06_SC_INFO,w_switchboard_M05_SC_INFO,w_switchboard_M04_SC_INFO,w_switchboard_M03_SC_INFO,w_switchboard_M02_SC_INFO,w_switchboard_M01_SC_INFO,w_switchboard_M00_SC_INFO}),
        .m_sc_payld({w_switchboard_M07_SC_PAYLD,w_switchboard_M06_SC_PAYLD,w_switchboard_M05_SC_PAYLD,w_switchboard_M04_SC_PAYLD,w_switchboard_M03_SC_PAYLD,w_switchboard_M02_SC_PAYLD,w_switchboard_M01_SC_PAYLD,w_switchboard_M00_SC_PAYLD}),
        .m_sc_recv({w_switchboard_M07_SC_RECV,w_switchboard_M06_SC_RECV,w_switchboard_M05_SC_RECV,w_switchboard_M04_SC_RECV,w_switchboard_M03_SC_RECV,w_switchboard_M02_SC_RECV,w_switchboard_M01_SC_RECV,w_switchboard_M00_SC_RECV}),
        .m_sc_req({w_switchboard_M07_SC_REQ,w_switchboard_M06_SC_REQ,w_switchboard_M05_SC_REQ,w_switchboard_M04_SC_REQ,w_switchboard_M03_SC_REQ,w_switchboard_M02_SC_REQ,w_switchboard_M01_SC_REQ,w_switchboard_M00_SC_REQ}),
        .m_sc_send({w_switchboard_M07_SC_SEND,w_switchboard_M06_SC_SEND,w_switchboard_M05_SC_SEND,w_switchboard_M04_SC_SEND,w_switchboard_M03_SC_SEND,w_switchboard_M02_SC_SEND,w_switchboard_M01_SC_SEND,w_switchboard_M00_SC_SEND}),
        .s_sc_info({S03_SC_W_1_INFO,S02_SC_W_1_INFO,S01_SC_W_1_INFO,S01_SC_W_1_INFO,S01_SC_W_1_INFO,S01_SC_W_1_INFO,S01_SC_W_1_INFO,S01_SC_W_1_INFO,S01_SC_W_1_INFO,S01_SC_W_1_INFO,S00_SC_W_1_INFO}),
        .s_sc_payld({S03_SC_W_1_PAYLD,S02_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S01_SC_W_1_PAYLD,S00_SC_W_1_PAYLD}),
        .s_sc_recv({S03_SC_W_1_RECV,S02_SC_W_1_RECV,S01_SC_W_1_RECV,S00_SC_W_1_RECV}),
        .s_sc_req({S03_SC_W_1_REQ,S02_SC_W_1_REQ,S01_SC_W_1_REQ,S01_SC_W_1_REQ,S01_SC_W_1_REQ,S01_SC_W_1_REQ,S01_SC_W_1_REQ,S01_SC_W_1_REQ,S01_SC_W_1_REQ,S01_SC_W_1_REQ,S00_SC_W_1_REQ}),
        .s_sc_send({S03_SC_W_1_SEND,S02_SC_W_1_SEND,S01_SC_W_1_SEND,S01_SC_W_1_SEND,S01_SC_W_1_SEND,S01_SC_W_1_SEND,S01_SC_W_1_SEND,S01_SC_W_1_SEND,S01_SC_W_1_SEND,S01_SC_W_1_SEND,S00_SC_W_1_SEND}));
endmodule
