# Clock
set_property DIFF_TERM TRUE [get_ports SYSCLK_P]
set_property DIFF_TERM TRUE [get_ports SYSCLK_N]
set_property PACKAGE_PIN H9 [get_ports SYSCLK_P]
set_property PACKAGE_PIN G9 [get_ports SYSCLK_N]
set_property IOSTANDARD LVDS [get_ports SYSCLK_P]
set_property IOSTANDARD LVDS [get_ports SYSCLK_N]
create_clock -name SYSCLK_P -period 5.000 -waveform {0 2.500} [get_ports SYSCLK_P]



set_property PACKAGE_PIN K15 [get_ports rst_logic]
set_property IOSTANDARD LVCMOS15 [get_ports rst_logic]


# UART (Pmod Pins)
set_property PACKAGE_PIN AA20 [get_ports tx]
set_property IOSTANDARD LVCMOS25 [get_ports tx]
set_property PACKAGE_PIN AC18 [get_ports rx]
set_property IOSTANDARD LVCMOS25 [get_ports rx]