create_clock -period 5.0 -name H9 [get_ports SYSCLK_P]

# Clock
set_property PACKAGE_PIN H9 [get_ports SYSCLK_P]
set_property IOSTANDARD LVDS [get_ports SYSCLK_P]
set_property PACKAGE_PIN G9 [get_ports SYSCLK_N]
set_property IOSTANDARD LVDS [get_ports SYSCLK_N]

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
set_property PACKAGE_PIN AK21 [get_ports rx]
set_property IOSTANDARD LVCMOS25 [get_ports rx]
set_property PACKAGE_PIN AB21 [get_ports tx]
set_property IOSTANDARD LVCMOS25 [get_ports tx]
