# Constraints for implementing router and external ports with spacewire-uart converter on single basys 3 board

## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 100.00 -waveform {0 50} [get_ports clk]
 
## Switches
set_property PACKAGE_PIN V17 [get_ports {selectport[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {selectport[0]}]
set_property PACKAGE_PIN V16 [get_ports {selectport[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {selectport[1]}]
#set_property PACKAGE_PIN W16 [get_ports {sw[2]}] # unused					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
#set_property PACKAGE_PIN W17 [get_ports {sw[3]}] # unused					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
 

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
#set_property PACKAGE_PIN U14 [get_ports {led[6]}] # unused					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
set_property PACKAGE_PIN V14 [get_ports {rxhalff[1]}] # Only 1st and 2nd port; port0 is designed only for configuration purposes					
	set_property IOSTANDARD LVCMOS33 [get_ports {rxhalff[1]}]
set_property PACKAGE_PIN V13 [get_ports {rxhalff[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rxhalff[2]}]
#set_property PACKAGE_PIN V3 [get_ports {led[9]}] # unused					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}]
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
set_property PACKAGE_PIN A18 [get_ports txstream]						
	set_property IOSTANDARD LVCMOS33 [get_ports txstream]


## Configuration options, can be used for all designs
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]