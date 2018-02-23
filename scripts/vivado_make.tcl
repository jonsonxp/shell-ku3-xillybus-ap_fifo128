open_project ./xillydemo.xpr
synth_design
opt_design
place_design
phys_opt_design
route_design
phys_opt_design
report_utilization -hierarchical -file ../../utilization.rpt
report_timing -file ../../timing.rpt
write_bitstream bitstream.bit -force
