# Constraints for implementing router and external ports with spacewire-uart converter on single basys 3 board

## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 100.000 -name sys_clk_pin -waveform {0.000 50.000} -add [get_ports clk]

## Switches
#set_property PACKAGE_PIN V17 [get_ports {selectport[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {selectport[0]}]
#set_property PACKAGE_PIN V16 [get_ports {selectport[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {selectport[1]}]

#set_property PACKAGE_PIN T1 [get_ports {selectdestport[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {selectdestport[0]}]
#set_property PACKAGE_PIN R2 [get_ports {selectdestport[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {selectdestport[1]}]


## LEDs
set_property PACKAGE_PIN U16 [get_ports {started}]
set_property IOSTANDARD LVCMOS33 [get_ports {started}]
set_property PACKAGE_PIN E19 [get_ports {connecting}]
set_property IOSTANDARD LVCMOS33 [get_ports {connecting}]
set_property PACKAGE_PIN U19 [get_ports {running}]
set_property IOSTANDARD LVCMOS33 [get_ports {running}]
set_property PACKAGE_PIN V19 [get_ports {rxvalid}]
set_property IOSTANDARD LVCMOS33 [get_ports {rxvalid}]
set_property PACKAGE_PIN W18 [get_ports {error}]
set_property IOSTANDARD LVCMOS33 [get_ports {error}]
#set_property PACKAGE_PIN U15 [get_ports {prunning[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {prunning[2]}]
#set_property PACKAGE_PIN U14 [get_ports {rxhalff[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rxhalff[0]}]
#set_property PACKAGE_PIN V14 [get_ports {rxhalff[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rxhalff[1]}]
#set_property PACKAGE_PIN V13 [get_ports {rxhalff[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rxhalff[2]}]
#set_property PACKAGE_PIN V3 [get_ports {uartfifofull}]
#set_property IOSTANDARD LVCMOS33 [get_ports {uartfifofull}]
#set_property PACKAGE_PIN W3 [get_ports {rerror[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rerror[0]}]
#set_property PACKAGE_PIN U3 [get_ports {rerror[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rerror[1]}]
#set_property PACKAGE_PIN P3 [get_ports {rerror[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rerror[2]}]
#set_property PACKAGE_PIN N3 [get_ports {perror[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {perror[0]}]
#set_property PACKAGE_PIN P1 [get_ports {perror[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {perror[1]}]
#set_property PACKAGE_PIN L1 [get_ports {perror[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {perror[2]}]

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
set_property PACKAGE_PIN P17 [get_ports {spw_do}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {spw_do}]
##Sch name = JC10
set_property PACKAGE_PIN R18 [get_ports {spw_so}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {spw_so}]

##Buttons
# Reset
set_property PACKAGE_PIN U18 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

# Button Up (clear)
set_property PACKAGE_PIN T18 [get_ports clear]
set_property IOSTANDARD LVCMOS33 [get_ports clear]

# Button Down (eop)
set_property PACKAGE_PIN U17 [get_ports eop] 						
	set_property IOSTANDARD LVCMOS33 [get_ports eop]

##USB-RS232 Interface
set_property PACKAGE_PIN B18 [get_ports rxstream]
set_property IOSTANDARD LVCMOS33 [get_ports rxstream]
set_false_path -from [get_ports rxstream] -to *

set_property PACKAGE_PIN A18 [get_ports txstream]
set_property IOSTANDARD LVCMOS33 [get_ports txstream]
#set_false_path -from * -to [get_ports txstream]