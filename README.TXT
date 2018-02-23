Please refer to the documentation on http://xillybus.com. This text is just
a starter.

Software environment
====================

The core was developed with Vivado 2016.4, but later versions apply as well.

To get started, invoke Vivado, select Tools > Run Tcl Script... and pick
xillydemo-vivado.tcl under the verilog/ or vhdl/ directory, depending on
your preferred language.

This will result in the creation of the xillydemo project, which can be
implemented right away (with "Generate Bitstream"). The script should be
run once.

To get started, invoke Vivado, select Tools > Run Tcl Script... and pick
xillydemo-vivado.tcl under the verilog/, vhdl/ or blockdesign/ directory,
depending on your preferred flow.

This will result in the creation of the xillydemo project, which can be
implemented right away (with "Generate Bitstream"). The script should be
run once.

File outline
============

The bundle consists of six directories:

* blockdesign -- Project directory for Vivado block design flow. This is a
  limited feature flow, which is recommended only for integration with HLS
  or other block design components.
* core -- The binary of the Xillybus core is stored here
* instantiation templates -- Contains the instantiation template for the core
  in Verilog and VHDL
* verilog -- Contains the project file for the demo and the sources in Verilog
  (in the 'src' subdirectory)
* vhdl -- Contains the project file for the demo and the sources in VHDL (in
  the 'src' subdirectory)
* vivado-essentials -- Deﬁnition ﬁles and build directories for the PCIe
  Integrated Block and general-purpose logic for use by Vivado.

Note that vivado-essentials/xillydemo.xdc represents the pinout of the KCU105
evaluation kit. This file must be edited if another board is targeted.

Also note that the vhdl directory contains Verilog files, but none of which
should need editing by user.

In the Verilog / VHDL flow, the interface with Xillybus takes place in the
xillydemo.v or xillydemo.vhd files in the respective 'src' subdirectories.
This is the file to edit in order to try Xillybus with your own data sources
and sinks.

For block design flow, access the streams in the project's block design.

--------------------------------------------------

For further information about how to get started, run tests and hack the
code, please refer to the documentation in the site: http://xillybus.com
