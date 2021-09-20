set_property PACKAGE_PIN H2 [get_ports spw_di]
set_property PACKAGE_PIN G3 [get_ports spw_si]
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
#set_property PACKAGE_PIN U19 [get_ports {rrunning[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rrunning[2]}]
set_property PACKAGE_PIN V19 [get_ports pstarted]
set_property IOSTANDARD LVCMOS33 [get_ports pstarted]
set_property PACKAGE_PIN W18 [get_ports pconnecting]
set_property IOSTANDARD LVCMOS33 [get_ports pconnecting]
set_property PACKAGE_PIN U15 [get_ports prunning]
set_property IOSTANDARD LVCMOS33 [get_ports prunning]
set_property PACKAGE_PIN U14 [get_ports rxhalff]
set_property IOSTANDARD LVCMOS33 [get_ports rxhalff]
set_property PACKAGE_PIN V14 [get_ports perror]
set_property IOSTANDARD LVCMOS33 [get_ports perror]
#set_property PACKAGE_PIN V13 [get_ports {rxhalff[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rxhalff[2]}]
set_property PACKAGE_PIN V3 [get_ports {rerror[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rerror[0]}]
set_property PACKAGE_PIN W3 [get_ports {rerror[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rerror[1]}]
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

##Pmod Header JA
##Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports spw_do]
set_property IOSTANDARD LVCMOS33 [get_ports spw_do]
##Sch name = JA2
set_property PACKAGE_PIN L2 [get_ports spw_so]
set_property IOSTANDARD LVCMOS33 [get_ports spw_so]
##Sch name = JA3
#set_property PACKAGE_PIN J2 [get_ports {JA[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JA[2]}]
##Sch name = JA4
#set_property PACKAGE_PIN G2 [get_ports {JA[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JA[3]}]
##Sch name = JA7
#set_property PACKAGE_PIN H1 [get_ports {JA[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JA[4]}]
##Sch name = JA8
#set_property PACKAGE_PIN K2 [get_ports {JA[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JA[5]}]
##Sch name = JA9
set_property IOSTANDARD LVCMOS33 [get_ports spw_di]
##Sch name = JA10
set_property IOSTANDARD LVCMOS33 [get_ports spw_si]


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

set_input_delay -clock [get_clocks sys_clk_pin] -clock_fall -min -add_delay 0.000 [get_ports spw_di]
set_input_delay -clock [get_clocks sys_clk_pin] -clock_fall -max -add_delay 200.000 [get_ports spw_di]
set_input_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.000 [get_ports spw_di]
set_input_delay -clock [get_clocks sys_clk_pin] -max -add_delay 200.000 [get_ports spw_di]
set_input_delay -clock [get_clocks sys_clk_pin] -clock_fall -min -add_delay 0.000 [get_ports spw_si]
set_input_delay -clock [get_clocks sys_clk_pin] -clock_fall -max -add_delay 200.000 [get_ports spw_si]
set_input_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.000 [get_ports spw_si]
set_input_delay -clock [get_clocks sys_clk_pin] -max -add_delay 200.000 [get_ports spw_si]
