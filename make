#!/bin/bash

PROGNAME=$(basename $0)
VERSION="0.1.1"

usage() {
  echo "usage: ./make" 1>&2
  echo "Options:" 1>&2
  echo "    -removeip    : Remove current ip in shell project." 1>&2
  echo "    -addip       : Add ip files in ip-src to shell project." 1>&2
  echo "    no argument  : Open shell project." 1>&2
  exit 1
}

for i in "$@"
do
case $i in
	    '-h'|'--help' )
            usage
            exit 1
        ;;
        '--version' )
            echo $VERSION
            exit 1
            ;;
        -removeip)
        	REMOVEIP=1
        	shift 1
        	;;
        -addip)
        	ADDIP=1
        	shift 1
        	;;        
        -*)
		shift 1
        ;;
        *)
        ;;
esac
done

if [ $REMOVEIP ]; then
    cd ./verilog/vivado/
    vivado -nolog -nojournal -mode batch -source ../../scripts/vivado_remove_ip.tcl ./xillydemo.xpr
    cd ../..
    echo "IPs in shell are removed."
    exit 1
fi

if [ $ADDIP ]; then
    cd ./verilog/vivado/
    vivado -nolog -nojournal -mode batch -source ../../scripts/vivado_add_ip.tcl ./xillydemo.xpr
    cd ../..
    echo "IPs in ip-src are appended to shell."
    exit 1
fi

cd ./verilog/vivado/
vivado -nolog -nojournal -mode batch -source ../../scripts/vivado_make.tcl
cd ../..
