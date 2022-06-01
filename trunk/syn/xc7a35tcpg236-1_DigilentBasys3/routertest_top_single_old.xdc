# Constraints for implementing router and external ports with spacewire-uart converter on single basys 3 board

## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]
#set_property CLOCK_DELAY_GROUP ClockDiv [get_nets {clk slowclk}]

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
set_property PACKAGE_PIN V3 [get_ports {uartfifofull}]
set_property IOSTANDARD LVCMOS33 [get_ports {uartfifofull}]
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


#set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets -of_objects [get_cells rxhalff_OBUF[0]_inst_i_1 rxhalff_OBUF[1]_inst_i_1 rxhalff_OBUF[2]_inst_i_1]]
#set_property SEVERITY {Warning}  [get_drc_checks LUTLP-1]
#set_property SEVERITY {Warning} [get_drc_checks NSTD-1]