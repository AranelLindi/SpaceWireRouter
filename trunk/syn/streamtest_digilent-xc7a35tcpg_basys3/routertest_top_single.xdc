# Constraints for implementing router and external ports with spacewire-uart converter on single basys 3 board

## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 100.000 -name sys_clk_pin -waveform {0.000 50.000} -add [get_ports clk]

## Switches
set_property PACKAGE_PIN V17 [get_ports {selectport[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {selectport[0]}]
set_property PACKAGE_PIN V16 [get_ports {selectport[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {selectport[1]}]

set_property PACKAGE_PIN T1 [get_ports {selectdestport[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {selectdestport[0]}]
set_property PACKAGE_PIN R2 [get_ports {selectdestport[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {selectdestport[1]}]


## LEDs
set_property PACKAGE_PIN U16 [get_ports {rrunning[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rrunning[0]}]
set_property PACKAGE_PIN E19 [get_ports {rrunning[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rrunning[1]}]
set_property PACKAGE_PIN U19 [get_ports {rrunning[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rrunning[2]}]
set_property PACKAGE_PIN V19 [get_ports {prunning[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {prunning[0]}]
set_property PACKAGE_PIN W18 [get_ports {prunning[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {prunning[1]}]
set_property PACKAGE_PIN U15 [get_ports {prunning[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {prunning[2]}]
set_property PACKAGE_PIN U14 [get_ports {rxhalff[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rxhalff[0]}]
set_property PACKAGE_PIN V14 [get_ports {rxhalff[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rxhalff[1]}]
set_property PACKAGE_PIN V13 [get_ports {rxhalff[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rxhalff[2]}]
#set_property PACKAGE_PIN V3 [get_ports {received}]
#set_property IOSTANDARD LVCMOS33 [get_ports {received}]
set_property PACKAGE_PIN W3 [get_ports {rerror[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rerror[0]}]
set_property PACKAGE_PIN U3 [get_ports {rerror[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rerror[1]}]
set_property PACKAGE_PIN P3 [get_ports {rerror[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rerror[2]}]
set_property PACKAGE_PIN N3 [get_ports {perror[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {perror[0]}]
set_property PACKAGE_PIN P1 [get_ports {perror[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {perror[1]}]
set_property PACKAGE_PIN L1 [get_ports {perror[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {perror[2]}]


##Buttons
# Reset
set_property PACKAGE_PIN U18 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]


##USB-RS232 Interface
set_property PACKAGE_PIN B18 [get_ports rxstream]
set_property IOSTANDARD LVCMOS33 [get_ports rxstream]
set_false_path -from [get_ports rxstream]

set_property PACKAGE_PIN A18 [get_ports txstream]
set_property IOSTANDARD LVCMOS33 [get_ports txstream]
set_false_path -to [get_ports txstream]

#set_input_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.000 [get_ports {selectdestport[*]}]
#set_input_delay -clock [get_clocks sys_clk_pin] -max -add_delay 0.000 [get_ports {selectdestport[*]}]
#set_input_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.000 [get_ports {selectport[*]}]
#set_input_delay -clock [get_clocks sys_clk_pin] -max -add_delay 0.000 [get_ports {selectport[*]}]
#set_input_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.000 [get_ports rst]
#set_input_delay -clock [get_clocks sys_clk_pin] -max -add_delay 0.000 [get_ports rst]
