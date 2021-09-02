## Constraints for spwstreamtest_top

## Clock signal (10 MHz)
set_property PACKAGE_PIN W5 [get_ports clk50]
	set_property IOSTANDARD LVCMOS33 [get_ports clk50]
	create_clock -add -name sys_clk_pin -period 100 -waveform {0 50} [get_ports clk50]


##Pmod Header JB
##Sch name = JB1
set_property PACKAGE_PIN A14 [get_ports {spw_do}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {spw_do}]
##Sch name = JB2
set_property PACKAGE_PIN A16 [get_ports {spw_so}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {spw_so}]
##Sch name = JB3
#set_property PACKAGE_PIN B15 [get_ports {JB[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[2]}]
##Sch name = JB4
#set_property PACKAGE_PIN B16 [get_ports {JB[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[3]}]
##Sch name = JB7
#set_property PACKAGE_PIN A15 [get_ports {JB[4]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[4]}]
##Sch name = JB8
#set_property PACKAGE_PIN A17 [get_ports {JB[5]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[5]}]
##Sch name = JB9
#set_property PACKAGE_PIN C15 [get_ports {JB[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[6]}]
##Sch name = JB10 
#set_property PACKAGE_PIN C16 [get_ports {JB[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[7]}]


##Pmod Header JC
##Sch name = JC1
set_property PACKAGE_PIN K17 [get_ports {spw_di}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {spw_di}]
##Sch name = JC2
set_property PACKAGE_PIN M18 [get_ports {spw_si}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {spw_si}]
##Sch name = JC3
#set_property PACKAGE_PIN N17 [get_ports {JC[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[2]}]
##Sch name = JC4
#set_property PACKAGE_PIN P18 [get_ports {JC[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[3]}]
##Sch name = JC7
#set_property PACKAGE_PIN L17 [get_ports {JC[4]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[4]}]
##Sch name = JC8
#set_property PACKAGE_PIN M19 [get_ports {JC[5]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[5]}]
##Sch name = JC9
#set_property PACKAGE_PIN P17 [get_ports {JC[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[6]}]
##Sch name = JC10
#set_property PACKAGE_PIN R18 [get_ports {JC[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[7]}]



## Switches
set_property PACKAGE_PIN V17 [get_ports {switch[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {switch[0]}]
set_property PACKAGE_PIN V16 [get_ports {switch[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {switch[1]}]
set_property PACKAGE_PIN W16 [get_ports {switch[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {switch[2]}]
set_property PACKAGE_PIN W17 [get_ports {switch[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {switch[3]}]
set_property PACKAGE_PIN W15 [get_ports {switch[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {switch[4]}]
set_property PACKAGE_PIN V15 [get_ports {switch[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {switch[5]}]
set_property PACKAGE_PIN W14 [get_ports {switch[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {switch[6]}]
set_property PACKAGE_PIN W13 [get_ports {switch[7]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {switch[7]}]

## LEDs
set_property PACKAGE_PIN U16 [get_ports {led[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property PACKAGE_PIN E19 [get_ports {led[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property PACKAGE_PIN U19 [get_ports {led[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property PACKAGE_PIN V19 [get_ports {led[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property PACKAGE_PIN W18 [get_ports {led[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
set_property PACKAGE_PIN U15 [get_ports {led[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
set_property PACKAGE_PIN U14 [get_ports {led[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
set_property PACKAGE_PIN V14 [get_ports {led[7]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
#set_property PACKAGE_PIN V13 [get_ports {led[8]}]
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]

##Buttons
set_property PACKAGE_PIN U18 [get_ports button[0]]
	set_property IOSTANDARD LVCMOS33 [get_ports button[0]]
set_property PACKAGE_PIN T18 [get_ports button[1]]
	set_property IOSTANDARD LVCMOS33 [get_ports button[1]]
set_property PACKAGE_PIN W19 [get_ports button[2]]
	set_property IOSTANDARD LVCMOS33 [get_ports button[2]]
set_property PACKAGE_PIN T17 [get_ports button[3]]
	set_property IOSTANDARD LVCMOS33 [get_ports button[3]]



## Configuration options, can be used for all designs
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]