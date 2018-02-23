{
  "name": "shell-ku3-xillybus-ap_fifo128",
  "type": "shell",
  "version": "0.2.0",
  "summary": "A hCODE shell for ADM-PCIE-KU3 board based on xillybus-eval-kintexultrascale-2.0c PCIe module.",
  "description": "Developed in Computer Arch. Lab@Kumamoto University, Japan.",
  "homepage": "http://arch.cs.kumamoto-u.ac.jp/hcode",
  "license": "MIT",
  "authors": {
    "Qian ZHAO": "cho@arch.cs.kumamoto-u.ac.jp"
  },
  "source": {
    "git": "https://github.com/jonsonxp/shell-ku3-xillybus-ap_fifo128.git",
    "tag": "0.2.0"
  },
  "hardware": {
    "board": "adm-pcie-ku3",
    "device": "xcku060-ffva1156-2-e"
  },
  "interface": {
    "host": {
       "bandwidth": 1800,
       "ports":{
         "ap_fifo": {
           "type": "ap_fifo",
           "data_width": 128,
           "device_file_read": "/dev/xillybus_read_128",
           "device_file_write": "/dev/xillybus_write_128"
         },
         "mem": {
          "data_width": 256
         } 
       }
    }
  },
  "resource": {
    "1": {
        "LUT": 327655,
        "LUTRAM": 146221,
        "FF": 658696,
        "BRAM": 1060,
        "DSP": 2760
    }
  }
}
