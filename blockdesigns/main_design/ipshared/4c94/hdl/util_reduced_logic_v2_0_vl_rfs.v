/*
-------------------------------------------------------------------------------
-- $Id: util_vector_logic.v 2.0 2017/01/01 
-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------
-- $Id: util_reduced_logic.v,v 1.1 2017/01/20 04:45:40 abq_ip Exp $
-------------------------------------------------------------------------------
-- util_reduced_logic.v - Entity and architecture
--
--  ***************************************************************************
--  **  Copyright(C) 2017 by Xilinx, Inc. All rights reserved.               **
--  **                                                                       **
--  **  This text contains proprietary, confidential                         **
--  **  information of Xilinx, Inc. , is distributed by                      **
--  **  under license from Xilinx, Inc., and may be used,                    **
--  **  copied and/or disclosed only pursuant to the terms                   **
--  **  of a valid license agreement with Xilinx, Inc.                       **
--  **                                                                       **
--  **  Unmodified source code is guaranteed to place and route,             **
--  **  function and run at speed according to the datasheet                 **
--  **  specification. Source code is provided "as-is", with no              **
--  **  obligation on the part of Xilinx to provide support.                 **
--  **                                                                       **
--  **  Xilinx Hotline support of source code IP shall only include          **
--  **  standard level Xilinx Hotline support, and will only address         **
--  **  issues and questions related to the standard released Netlist        **
--  **  version of the core (and thus indirectly, the original core source). **
--  **                                                                       **
--  **  The Xilinx Support Hotline does not have access to source            **
--  **  code and therefore cannot answer specific questions related          **
--  **  to source HDL. The Xilinx Support Hotline will only be able          **
--  **  to confirm the problem in the Netlist version of the core.           **
--  **                                                                       **
--  **  This copyright and support notice must be retained as part           **
--  **  of this text at all times.                                           **
--  ***************************************************************************
--
-------------------------------------------------------------------------------
-- Filename:        util_reduced_logic.v
-- Description:     
-------------------------------------------------------------------------------
-- Structure:   
--              util_reduced_logic.v
--
-------------------------------------------------------------------------------
-- Author:          legba
-- Revision:        $Revision: 2.0 $
-- Date:            $Date: 2017/01/20 04:45:40 $
--
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x" 
--      reset signals:                          "rst", "rst_n" 
--      generics:                               "C_*" 
--      user defined types:                     "*_TYPE" 
--      state machine next state:               "*_ns" 
--      state machine current state:            "*_cs" 
--      combinatorial signals:                  "*_com" 
--      pipelined or register delay signals:    "*_d#" 
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce" 
--      internal version of output port         "*_i"
--      device pins:                            "*_pin" 
--      ports:                                  - Names begin with Uppercase 
--      processes:                              "*_PROCESS" 
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------
*/

`timescale 1ps/1ps
module util_reduced_logic_v2_0_4_util_reduced_logic (Op1,Res);
 
parameter 	  C_OPERATION = "and";
parameter integer C_SIZE = 8;
input   [(C_SIZE - 1):0] Op1; 
output  reg              Res; 

always @(Op1) begin
  if (C_OPERATION ==  "or") Res=|Op1;  
  if (C_OPERATION == "xor") Res=^Op1;  
  if (C_OPERATION == "and") Res=&Op1;  
end
endmodule // module util_reduced_logic


