

## Clock Signal
set_property PACKAGE_PIN W5 [get_ports clk50]
set_property IOSTANDARD LVCMOS33 [get_ports clk50]
create_clock -period 18.000 -name clk50 -waveform {0.000 9.000} [get_ports clk50]

# Output Ports
set_property PACKAGE_PIN P18 [get_ports spw_do_p]
set_property PACKAGE_PIN N17 [get_ports spw_so_p]

## Pmod Header JA
##Sch name = JA1
set_property IOSTANDARD LVDS_25 [get_ports spw_di_p]
##Sch name = JA2
set_property IOSTANDARD LVDS_25 [get_ports spw_di_n]
set_property PACKAGE_PIN L2 [get_ports spw_di_n]
##Sch name = JA3
set_property IOSTANDARD LVDS_25 [get_ports spw_si_p]
##Sch name = JA4
set_property IOSTANDARD LVDS_25 [get_ports spw_si_n]
set_property PACKAGE_PIN G2 [get_ports spw_si_n]


## LEDs
set_property PACKAGE_PIN V14 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {led[7]}]
#
set_property PACKAGE_PIN U14 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {led[6]}]
#
set_property PACKAGE_PIN U15 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {led[5]}]
#
set_property PACKAGE_PIN W18 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {led[4]}]
#
set_property PACKAGE_PIN V19 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {led[3]}]
#
set_property PACKAGE_PIN U19 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {led[2]}]
#
set_property PACKAGE_PIN E19 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {led[1]}]
#
set_property PACKAGE_PIN U16 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {led[0]}]


## Switches
set_property PACKAGE_PIN V17 [get_ports {switch[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {switch[0]}]
#
set_property PACKAGE_PIN V16 [get_ports {switch[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {switch[1]}]
#
set_property PACKAGE_PIN W16 [get_ports {switch[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {switch[2]}]
#
set_property PACKAGE_PIN W17 [get_ports {switch[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {switch[3]}]
#
set_property PACKAGE_PIN W15 [get_ports {switch[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {switch[4]}]
#
set_property PACKAGE_PIN V15 [get_ports {switch[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {switch[5]}]
#
set_property PACKAGE_PIN W14 [get_ports {switch[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {switch[6]}]
#
set_property PACKAGE_PIN W13 [get_ports {switch[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {switch[7]}]


## Buttons
set_property PACKAGE_PIN U17 [get_ports {button[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {button[0]}]
#
set_property PACKAGE_PIN T17 [get_ports {button[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {button[1]}]
#
set_property PACKAGE_PIN T18 [get_ports {button[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {button[2]}]
#
set_property PACKAGE_PIN W19 [get_ports {button[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {button[3]}]



