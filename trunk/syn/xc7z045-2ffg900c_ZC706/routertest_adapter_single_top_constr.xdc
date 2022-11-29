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

# LEDs
set_property PACKAGE_PIN W21 [get_ports router_running[0]]
set_property IOSTANDARD LVCMOS25 [get_ports router_running[0]]
set_property PACKAGE_PIN Y21 [get_ports adapt_running[0]]
set_property IOSTANDARD LVCMOS25 [get_ports adapt_running[0]]
set_property PACKAGE_PIN G2 [get_ports adapt_error[0]]
set_property IOSTANDARD LVCMOS15 [get_ports adapt_error[0]]
set_property PACKAGE_PIN A17 [get_ports router_error[0]]
set_property IOSTANDARD LVCMOS15 [get_ports router_error[0]]

# Push-Buttons
set_property PACKAGE_PIN R27 [get_ports clear]
set_property IOSTANDARD LVCMOS25 [get_ports clear]
set_property PACKAGE_PIN K15 [get_ports rst]
set_property IOSTANDARD LVCMOS15 [get_ports rst]

# UART vorher: AA20 -> rx; AC18 -> tx
set_property PACKAGE_PIN AA20 [get_ports tx]
set_property IOSTANDARD LVCMOS25 [get_ports tx]
set_property PACKAGE_PIN AC18 [get_ports rx]
set_property IOSTANDARD LVCMOS25 [get_ports rx]
