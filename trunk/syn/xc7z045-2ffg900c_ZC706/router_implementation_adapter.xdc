# Clock
#set_property DIFF_TERM TRUE [get_ports SYSCLK_P]
#set_property DIFF_TERM TRUE [get_ports SYSCLK_N]
#set_property PACKAGE_PIN H9 [get_ports SYSCLK_P]
#set_property PACKAGE_PIN G9 [get_ports SYSCLK_N]
#set_property IOSTANDARD LVDS [get_ports SYSCLK_P]
#set_property IOSTANDARD LVDS [get_ports SYSCLK_N]
#create_clock -name SYS_CLK_IN -period 5.000 -waveform {0 2.500} [get_ports SYS_CLK_IN]


# Push Button (middle)
set_property PACKAGE_PIN K15 [get_ports rst_logic]
set_property IOSTANDARD LVCMOS15 [get_ports rst_logic]


# UART (Pmod Pins, front side: 2nc row, VDD right)
set_property PACKAGE_PIN AA20 [get_ports tx]
set_property IOSTANDARD LVCMOS25 [get_ports tx]
set_property PACKAGE_PIN AC18 [get_ports rx]
set_property IOSTANDARD LVCMOS25 [get_ports rx]



# SpaceWire Port 1
# LPC
set_property PACKAGE_PIN AB30 [get_ports spw_di_1]
set_property IOSTANDARD LVCMOS25 [get_ports spw_di_1]
set_property PACKAGE_PIN AB29 [get_ports spw_si_1]
set_property IOSTANDARD LVCMOS25 [get_ports spw_si_1]

set_property PACKAGE_PIN Y27 [get_ports spw_do_1]
set_property IOSTANDARD LVCMOS25 [get_ports spw_do_1]
set_property PACKAGE_PIN Y26 [get_ports spw_so_1]
set_property IOSTANDARD LVCMOS25 [get_ports spw_so_1]

# HPC
#set_property PACKAGE_PIN P24 [get_ports spw_di_1]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_di_1]
#set_property PACKAGE_PIN P23 [get_ports spw_si_1]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_si_1]

#set_property PACKAGE_PIN R21 [get_ports spw_do_1]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_do_1]
#set_property PACKAGE_PIN P21 [get_ports spw_so_1]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_so_1]


# SpaceWire Port 2
# LPC
#set_property PACKAGE_PIN AE26 [get_ports spw_di_2]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_di_2]
#set_property PACKAGE_PIN AD25 [get_ports spw_si_2]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_si_2]

#set_property PACKAGE_PIN AG29 [get_ports spw_do_2]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_do_2]
#set_property PACKAGE_PIN AF29 [get_ports spw_so_2]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_so_2]

# HPC
set_property PACKAGE_PIN R30 [get_ports spw_di_2]
set_property IOSTANDARD LVCMOS25 [get_ports spw_di_2]
set_property PACKAGE_PIN P30 [get_ports spw_si_2]
set_property IOSTANDARD LVCMOS25 [get_ports spw_si_2]

set_property PACKAGE_PIN U29 [get_ports spw_do_2]
set_property IOSTANDARD LVCMOS25 [get_ports spw_do_2]
set_property PACKAGE_PIN T29 [get_ports spw_so_2]
set_property IOSTANDARD LVCMOS25 [get_ports spw_so_2]


# SpaceWire Port 3
# LPC
set_property PACKAGE_PIN AK30 [get_ports spw_di_3]
set_property IOSTANDARD LVCMOS25 [get_ports spw_di_3]
set_property PACKAGE_PIN AJ30 [get_ports spw_si_3]
set_property IOSTANDARD LVCMOS25 [get_ports spw_si_3]

set_property PACKAGE_PIN AG30 [get_ports spw_do_3]
set_property IOSTANDARD LVCMOS25 [get_ports spw_do_3]
set_property PACKAGE_PIN AF30 [get_ports spw_so_3]
set_property IOSTANDARD LVCMOS25 [get_ports spw_so_3]

# HPC
#set_property PACKAGE_PIN T28 [get_ports spw_di_3]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_di_3]
#set_property PACKAGE_PIN R28 [get_ports spw_si_3]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_si_3]

#set_property PACKAGE_PIN U30 [get_ports spw_do_3]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_do_3]
#set_property PACKAGE_PIN T30 [get_ports spw_so_3]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_so_3]


# SpaceWire Port 4
# LPC
set_property PACKAGE_PIN AK28 [get_ports spw_di_4]
set_property IOSTANDARD LVCMOS25 [get_ports spw_di_4]
set_property PACKAGE_PIN AK27 [get_ports spw_si_4]
set_property IOSTANDARD LVCMOS25 [get_ports spw_si_4]

set_property PACKAGE_PIN AH29 [get_ports spw_do_4]
set_property IOSTANDARD LVCMOS25 [get_ports spw_do_4]
set_property PACKAGE_PIN AH28 [get_ports spw_so_4]
set_property IOSTANDARD LVCMOS25 [get_ports spw_so_4]

# HPC
#set_property PACKAGE_PIN V26 [get_ports spw_di_4]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_di_4]
#set_property PACKAGE_PIN V27 [get_ports spw_si_4]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_si_4]

#set_property PACKAGE_PIN W30 [get_ports spw_do_4]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_do_4]
#set_property PACKAGE_PIN W29 [get_ports spw_so_4]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_so_4]