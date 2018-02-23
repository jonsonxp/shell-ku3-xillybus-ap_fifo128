create_clock -name sys_clk -period 10 [get_ports PCIE_REFCLK_P]

set_false_path -from [get_clocks txoutclk_out*] -to [get_clocks clk_out?_clk_wiz_0*]
set_false_path -from [get_clocks clk_out?_clk_wiz_0*] -to [get_clocks txoutclk_out*]

set_clock_groups -name async1 -asynchronous \ 
  -group [get_clocks -include_generated_clocks -of_objects [get_ports PCIE_REFCLK_P]] \
  -group [get_clocks -include_generated_clocks -of_objects [get_pins [all_fanin -flat -startpoints_only [get_pins -hier -filter {name=~*/gt_top_i/phy_clk_i/CLK_USERCLK_IN}]]]]

set_false_path -from [get_ports PCIE_PERST_B_LS]

set_property LOC [get_package_pins -filter {PIN_FUNC == IO_T3U_N12_PERSTN0_65}] [get_ports PCIE_PERST_B_LS]

set_property LOC AB6 [get_cells -hier -filter {name=~*/pcieclk_ibuf} ]

set_property -dict "IOSTANDARD LVCMOS18 PULLUP true" [get_ports PCIE_PERST_B_LS]

set_property -dict "PACKAGE_PIN AP8 IOSTANDARD LVCMOS18" [get_ports "GPIO_LED[0]"]
set_property -dict "PACKAGE_PIN H23 IOSTANDARD LVCMOS18" [get_ports "GPIO_LED[1]"]
set_property -dict "PACKAGE_PIN P20 IOSTANDARD LVCMOS18" [get_ports "GPIO_LED[2]"]
set_property -dict "PACKAGE_PIN P21 IOSTANDARD LVCMOS18" [get_ports "GPIO_LED[3]"]
