# Define the board clock



# Define the 200 MHz clock generated by the Clocking Wizard

# Define the 100 MHz clock generated by the Clocking Wizard (get_pins clk_100_main_design_clk_wiz_0_1)

# Set the clock groups
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins main_design_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0]] -group [get_clocks clk_fpga_0]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins main_design_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT1]] -group [get_clocks clk_fpga_0]

# Set false paths between clock domains
set_false_path -from [get_clocks -of_objects [get_pins main_design_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0]] -to [get_clocks clk_fpga_0]
set_false_path -from [get_clocks -of_objects [get_pins main_design_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks clk_fpga_0]



set_input_delay -clock [get_clocks CLK_IN1_D_0_clk_p] -max 10.000 [get_ports {spw_di_1 spw_di_2 spw_di_3 spw_di_4 spw_si_1 spw_si_2 spw_si_3 spw_si_4}]
set_input_delay -clock [get_clocks CLK_IN1_D_0_clk_p] -min -add_delay 0.000 [get_ports {spw_di_1 spw_di_2 spw_di_3 spw_di_4 spw_si_1 spw_si_2 spw_si_3 spw_si_4}]





# Board Clock (equal to rxclk and txclk)
#create_clock -name boardclk -period 5.000 -waveform {0 2.500} [get_ports CLK_IN1_D_0]

# Define 100 MHz clock
#create_clock -name workclk -source [get_ports boardclk] -divide_bye 2 [get_pins H9]


#set_false_path -from [get_clocks clk_fpga_0] -to [get_clocks boardclk]
#set_false_path -from [get_clocks boardclk] -to [get_clocks clk_fpga_0]

#set_false_path -from [get_clocks clk_fpga_0] -to [get_clocks workclk]
#set_false_path -from [get_clocks workclk] -to [get_clocks clk_fpga_0]

#set_false_path -from [get_clocks -of_objects [get_pins main_design_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0]] -to [get_clocks clk_fpga_0]
#set_false_path -from [get_clocks clk_fpga_0] -to [et_clocks -of_objects [get_pins main_design_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0]]

##set_false_path -from [get_clocks clk_200_main_design_clk_wiz_0_1] -to [get_clocks clk_fpga_0]
##set_false_path -from [get_clocks clk_fpga_0] -to [get_clocks clk_200_main_design_clk_wiz_0_1]

#set_false_path -from [get_clocks -of_objects [get_pins main_design_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks clk_fpga_0]
#set_false_path -from [get_clocks clk_fpga_0] -to [et_clocks -of_objects [get_pins main_design_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT1]]

# Push Button (middle)
set_property PACKAGE_PIN K15 [get_ports rst_logic]
set_property IOSTANDARD LVCMOS15 [get_ports rst_logic]

set_false_path -from [get_ports rst_logic]


# UART (Pmod Pins, front side: 2nc row, VDD right)
set_property PACKAGE_PIN AA20 [get_ports tx]
set_property IOSTANDARD LVCMOS25 [get_ports tx]
set_property PACKAGE_PIN AC18 [get_ports rx]
set_property IOSTANDARD LVCMOS25 [get_ports rx]



# SpaceWire Port 1
# time unit is ns (nano seconds)

# LPC
set_property PACKAGE_PIN AB29 [get_ports spw_di_1]
set_property IOSTANDARD LVCMOS25 [get_ports spw_di_1]
set_property PACKAGE_PIN AB30 [get_ports spw_si_1]
set_property IOSTANDARD LVCMOS25 [get_ports spw_si_1]

set_property PACKAGE_PIN AD25 [get_ports spw_do_1]
set_property IOSTANDARD LVCMOS25 [get_ports spw_do_1]
set_property PACKAGE_PIN AE26 [get_ports spw_so_1]
set_property IOSTANDARD LVCMOS25 [get_ports spw_so_1]

# HPC
#set_property PACKAGE_PIN P23 [get_ports spw_di_1]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_di_1]
#set_property PACKAGE_PIN P24 [get_ports spw_si_1]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_si_1]

#set_input_delay -clock [get_clocks -of_objects [get_pins SYS_CLK_IN]] -min -add_delay 5 [get_pins spw_di_1]
#set_input_delay -clock [get_clocks -of_objects [get_pins SYS_CLK_IN]] -max -add_delay 5 [get_pins spw_di_1]

#set_property PACKAGE_PIN P30 [get_ports spw_do_1]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_do_1]
#set_property PACKAGE_PIN R30 [get_ports spw_so_1]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_so_1]


# SpaceWire Port 2

# LPC
set_property PACKAGE_PIN AF29 [get_ports spw_di_2]
set_property IOSTANDARD LVCMOS25 [get_ports spw_di_2]
set_property PACKAGE_PIN AG29 [get_ports spw_si_2]
set_property IOSTANDARD LVCMOS25 [get_ports spw_si_2]

set_property PACKAGE_PIN Y26 [get_ports spw_do_2]
set_property IOSTANDARD LVCMOS25 [get_ports spw_do_2]
set_property PACKAGE_PIN Y27 [get_ports spw_so_2]
set_property IOSTANDARD LVCMOS25 [get_ports spw_so_2]

# HPC
#set_property PACKAGE_PIN T29 [get_ports spw_di_2]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_di_2]
#set_property PACKAGE_PIN U29 [get_ports spw_si_2]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_si_2]

#set_property PACKAGE_PIN P21 [get_ports spw_do_2]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_do_2]
#set_property PACKAGE_PIN R21 [get_ports spw_so_2]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_so_2]


# SpaceWire Port 3

# LPC
set_property PACKAGE_PIN AJ30 [get_ports spw_di_3]
set_property IOSTANDARD LVCMOS25 [get_ports spw_di_3]
set_property PACKAGE_PIN AK30 [get_ports spw_si_3]
set_property IOSTANDARD LVCMOS25 [get_ports spw_si_3]

set_property PACKAGE_PIN AH28 [get_ports spw_do_3]
set_property IOSTANDARD LVCMOS25 [get_ports spw_do_3]
set_property PACKAGE_PIN AH29 [get_ports spw_so_3]
set_property IOSTANDARD LVCMOS25 [get_ports spw_so_3]

# HPC
#set_property PACKAGE_PIN R28 [get_ports spw_di_3]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_di_3]
#set_property PACKAGE_PIN T28 [get_ports spw_si_3]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_si_3]

#set_property PACKAGE_PIN W29 [get_ports spw_do_3]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_do_3]
#set_property PACKAGE_PIN W30 [get_ports spw_so_3]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_so_3]


# SpaceWire Port 4

# LPC
set_property PACKAGE_PIN AK27 [get_ports spw_di_4]
set_property IOSTANDARD LVCMOS25 [get_ports spw_di_4]
set_property PACKAGE_PIN AK28 [get_ports spw_si_4]
set_property IOSTANDARD LVCMOS25 [get_ports spw_si_4]

set_property PACKAGE_PIN AF30 [get_ports spw_do_4]
set_property IOSTANDARD LVCMOS25 [get_ports spw_do_4]
set_property PACKAGE_PIN AG30 [get_ports spw_so_4]
set_property IOSTANDARD LVCMOS25 [get_ports spw_so_4]

# HPC
#set_property PACKAGE_PIN V27 [get_ports spw_di_4]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_di_4]
#set_property PACKAGE_PIN V26 [get_ports spw_si_4]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_si_4]

#set_property PACKAGE_PIN T30 [get_ports spw_do_4]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_do_4]
#set_property PACKAGE_PIN U30 [get_ports spw_so_4]
#set_property IOSTANDARD LVCMOS25 [get_ports spw_so_4]



# GPIO Pins on FMC-SpaceWire board
# UART_0
set_property PACKAGE_PIN T25 [get_ports UART_0_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports UART_0_rxd]
set_property PACKAGE_PIN P26 [get_ports UART_0_txd]
set_property IOSTANDARD LVCMOS33 [get_ports UART_0_txd]
set_property SLEW SLOW [get_ports UART_0_txd]

# I2C_0
set_property PACKAGE_PIN Y23 [get_ports IIC_0_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports IIC_0_scl_io]
set_property PACKAGE_PIN AA23 [get_ports IIC_0_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports IIC_0_sda_io]
set_property PULLUP true [get_ports IIC_0_scl_io]
set_property PULLUP true [get_ports IIC_0_sda_io]

# CAN_0
set_property PACKAGE_PIN AB24 [get_ports CAN_0_rx]
set_property IOSTANDARD LVCMOS33 [get_ports CAN_0_rx]
set_property PACKAGE_PIN AE23 [get_ports CAN_0_tx]
set_property IOSTANDARD LVCMOS33 [get_ports CAN_0_tx]

# SPI_0
set_property PACKAGE_PIN AJ24 [get_ports SPI_0_io0_io]
set_property IOSTANDARD LVCMOS33 [get_ports SPI_0_io0_io]
set_property PACKAGE_PIN AF24 [get_ports SPI_0_io1_io]
set_property IOSTANDARD LVCMOS33 [get_ports SPI_0_io1_io]
set_property PACKAGE_PIN AD24 [get_ports SPI_0_sck_io]
set_property IOSTANDARD LVCMOS33 [get_ports SPI_0_sck_io]
set_property PACKAGE_PIN AK20 [get_ports SPI_0_ss1_o]
set_property IOSTANDARD LVCMOS33 [get_ports SPI_0_ss1_o]
set_property PACKAGE_PIN AE21 [get_ports SPI_0_ss2_o]
set_property IOSTANDARD LVCMOS33 [get_ports SPI_0_ss2_o]
set_property PACKAGE_PIN AG19 [get_ports SPI_0_ss_io]
set_property IOSTANDARD LVCMOS33 [get_ports SPI_0_ss_io]