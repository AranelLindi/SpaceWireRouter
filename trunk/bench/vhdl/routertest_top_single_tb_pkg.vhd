library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.spwpkg.all;

package routertest_top_single_tb_pkg is
    TYPE incstates IS (S_Idle, S_Cargo, S_TransmitAddress, S_Write1, S_Wait1, S_TransmitCargo, S_Write2, S_Wait2, S_TransmitEOP, S_Write3, S_Fin);
    TYPE outstates IS (S_Idle, S_Wait1, S_Wait2, S_Data, S_Wait3, S_Wait4, S_Wait5, S_Wait6);
end package;