# Clock

#set_property IOSTANDARD LVDS [get_ports clk_100MHz]
set_property DIFF_TERM TRUE [get_ports SYSCLK_P]
set_property DIFF_TERM TRUE [get_ports SYSCLK_N]
set_property PACKAGE_PIN H9 [get_ports SYSCLK_P]
set_property PACKAGE_PIN G9 [get_ports SYSCLK_N]
set_property IOSTANDARD LVDS [get_ports SYSCLK_P]
set_property IOSTANDARD LVDS [get_ports SYSCLK_N]
create_clock -name SYSCLK_P -period 5.000 -waveform {0 2.500} [get_ports SYSCLK_P]


create_generated_clock -divide_by 2 -source [get_ports SYSCLK_P] [get_pins BUFGCE_inst/O]

# SpaceWire Ports

# Port 0 (CPU-Router-Interface wird hier noch ausgelassen (wird auch nicht über FMC gelegt))

# Port 1:
# Input
set_property PACKAGE_PIN AE16 [get_ports spw_di[0]]
set_property IOSTANDARD LVCMOS25 [get_ports spw_di[0]]
set_property PACKAGE_PIN AE15 [get_ports spw_si[0]]
set_property IOSTANDARD LVCMOS25 [get_ports spw_si[0]]
# Output
set_property PACKAGE_PIN AH14 [get_ports spw_do[0]]
set_property IOSTANDARD LVCMOS25 [get_ports spw_do[0]]
set_property PACKAGE_PIN AH13 [get_ports spw_so[0]]
set_property IOSTANDARD LVCMOS25 [get_ports spw_so[0]]

# Port 2:
# Input
set_property PACKAGE_PIN AB12 [get_ports spw_di[1]]
set_property IOSTANDARD LVCMOS25 [get_ports spw_di[1]]
set_property PACKAGE_PIN AC12 [get_ports spw_si[1]]
set_property IOSTANDARD LVCMOS25 [get_ports spw_si[1]]
# Output
set_property PACKAGE_PIN AC14 [get_ports spw_do[1]]
set_property IOSTANDARD LVCMOS25 [get_ports spw_do[1]]
set_property PACKAGE_PIN AC13 [get_ports spw_so[1]]
set_property IOSTANDARD LVCMOS25 [get_ports spw_so[1]]

# Port 3:
# Input
set_property PACKAGE_PIN AH17 [get_ports spw_di[2]]
set_property IOSTANDARD LVCMOS25 [get_ports spw_di[2]]
set_property PACKAGE_PIN AH16 [get_ports spw_si[2]]
set_property IOSTANDARD LVCMOS25 [get_ports spw_si[2]]
# Output
set_property PACKAGE_PIN AJ26 [get_ports spw_do[2]]
set_property IOSTANDARD LVCMOS25 [get_ports spw_do[2]]
set_property PACKAGE_PIN AK26 [get_ports spw_so[2]]
set_property IOSTANDARD LVCMOS25 [get_ports spw_so[2]]

# Port 4:
# Input
set_property PACKAGE_PIN AF18 [get_ports spw_di[3]]
set_property IOSTANDARD LVCMOS25 [get_ports spw_di[3]]
set_property PACKAGE_PIN AF17 [get_ports spw_si[3]]
set_property IOSTANDARD LVCMOS25 [get_ports spw_si[3]]
# Output
set_property PACKAGE_PIN AJ28 [get_ports spw_do[3]]
set_property IOSTANDARD LVCMOS25 [get_ports spw_do[3]]
set_property PACKAGE_PIN AJ29 [get_ports spw_so[3]]
set_property IOSTANDARD LVCMOS25 [get_ports spw_so[3]]