library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.spwpkg.all;

package routertest_top_single_tb_pkg is
    TYPE incstates IS (S_Idle, S_Cargo, S_TransmitAddress, S_Write1, S_Wait1, S_TransmitCargo, S_Write2, S_Wait2, S_TransmitEOP, S_Write3, S_Fin); -- 11
    TYPE outstates IS (S_Idle, S_PortNo, S_Write1, S_Write2, S_Iter, S_Data, S_Case, S_SendData, S_Write3, S_Write4, S_EndPacket, S_Write5, S_Write6, S_Wait); -- 13
end package;