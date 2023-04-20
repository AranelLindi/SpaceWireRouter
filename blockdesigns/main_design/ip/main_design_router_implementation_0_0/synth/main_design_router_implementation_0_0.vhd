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

-- IP VLNV: xilinx.com:module_ref:router_implementation:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY main_design_router_implementation_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    rxclk : IN STD_LOGIC;
    txclk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    rx : IN STD_LOGIC;
    tx : OUT STD_LOGIC;
    spw_di_0 : IN STD_LOGIC;
    spw_si_0 : IN STD_LOGIC;
    spw_do_0 : OUT STD_LOGIC;
    spw_so_0 : OUT STD_LOGIC;
    spw_di_1 : IN STD_LOGIC;
    spw_si_1 : IN STD_LOGIC;
    spw_do_1 : OUT STD_LOGIC;
    spw_so_1 : OUT STD_LOGIC;
    spw_di_2 : IN STD_LOGIC;
    spw_si_2 : IN STD_LOGIC;
    spw_do_2 : OUT STD_LOGIC;
    spw_so_2 : OUT STD_LOGIC;
    spw_di_3 : IN STD_LOGIC;
    spw_si_3 : IN STD_LOGIC;
    spw_do_3 : OUT STD_LOGIC;
    spw_so_3 : OUT STD_LOGIC;
    spw_di_4 : IN STD_LOGIC;
    spw_si_4 : IN STD_LOGIC;
    spw_do_4 : OUT STD_LOGIC;
    spw_so_4 : OUT STD_LOGIC;
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ena : IN STD_LOGIC;
    rsta : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END main_design_router_implementation_0_0;

ARCHITECTURE main_design_router_implementation_0_0_arch OF main_design_router_implementation_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF main_design_router_implementation_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT router_implementation IS
    PORT (
      clk : IN STD_LOGIC;
      rxclk : IN STD_LOGIC;
      txclk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      rx : IN STD_LOGIC;
      tx : OUT STD_LOGIC;
      spw_di_0 : IN STD_LOGIC;
      spw_si_0 : IN STD_LOGIC;
      spw_do_0 : OUT STD_LOGIC;
      spw_so_0 : OUT STD_LOGIC;
      spw_di_1 : IN STD_LOGIC;
      spw_si_1 : IN STD_LOGIC;
      spw_do_1 : OUT STD_LOGIC;
      spw_so_1 : OUT STD_LOGIC;
      spw_di_2 : IN STD_LOGIC;
      spw_si_2 : IN STD_LOGIC;
      spw_do_2 : OUT STD_LOGIC;
      spw_so_2 : OUT STD_LOGIC;
      spw_di_3 : IN STD_LOGIC;
      spw_si_3 : IN STD_LOGIC;
      spw_do_3 : OUT STD_LOGIC;
      spw_so_3 : OUT STD_LOGIC;
      spw_di_4 : IN STD_LOGIC;
      spw_si_4 : IN STD_LOGIC;
      spw_do_4 : OUT STD_LOGIC;
      spw_so_4 : OUT STD_LOGIC;
      clka : IN STD_LOGIC;
      addra : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ena : IN STD_LOGIC;
      rsta : IN STD_LOGIC;
      wea : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  END COMPONENT router_implementation;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF main_design_router_implementation_0_0_arch: ARCHITECTURE IS "router_implementation,Vivado 2022.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF main_design_router_implementation_0_0_arch : ARCHITECTURE IS "main_design_router_implementation_0_0,router_implementation,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF main_design_router_implementation_0_0_arch: ARCHITECTURE IS "main_design_router_implementation_0_0,router_implementation,{x_ipProduct=Vivado 2022.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=router_implementation,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF main_design_router_implementation_0_0_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN main_design_clk_wiz_0_0_clk_200, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF rst: SIGNAL IS "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF rst: SIGNAL IS "xilinx.com:signal:reset:1.0 rst RST";
BEGIN
  U0 : router_implementation
    PORT MAP (
      clk => clk,
      rxclk => rxclk,
      txclk => txclk,
      rst => rst,
      rx => rx,
      tx => tx,
      spw_di_0 => spw_di_0,
      spw_si_0 => spw_si_0,
      spw_do_0 => spw_do_0,
      spw_so_0 => spw_so_0,
      spw_di_1 => spw_di_1,
      spw_si_1 => spw_si_1,
      spw_do_1 => spw_do_1,
      spw_so_1 => spw_so_1,
      spw_di_2 => spw_di_2,
      spw_si_2 => spw_si_2,
      spw_do_2 => spw_do_2,
      spw_so_2 => spw_so_2,
      spw_di_3 => spw_di_3,
      spw_si_3 => spw_si_3,
      spw_do_3 => spw_do_3,
      spw_so_3 => spw_so_3,
      spw_di_4 => spw_di_4,
      spw_si_4 => spw_si_4,
      spw_do_4 => spw_do_4,
      spw_so_4 => spw_so_4,
      clka => clka,
      addra => addra,
      dina => dina,
      douta => douta,
      ena => ena,
      rsta => rsta,
      wea => wea
    );
END main_design_router_implementation_0_0_arch;
