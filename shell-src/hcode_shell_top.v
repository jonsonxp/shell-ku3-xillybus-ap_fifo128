module hcode_shell_top
  (
   //FOR PCIE
   input 	 PCIE_PERST_B_LS,
   input 	 PCIE_REFCLK_N,
   input 	 PCIE_REFCLK_P,
   input [7:0] 	 PCIE_RX_N,
   input [7:0] 	 PCIE_RX_P,
   output [3:0]  GPIO_LED,
   output [7:0]  PCIE_TX_N,
   output [7:0]  PCIE_TX_P
   );

   //----------START: xillybus_interface signals----------
   wire [127:0] 	 in_r_dout_1;
   wire 	 in_r_read_1;
   wire 	 in_r_empty_n_1;
   wire [127:0] 	 out_r_din_1;
   wire 	 out_r_full_1;
   wire 	 out_r_write_1;
   wire [8*32-1:0] memarray; //8bit*32 memory array, use the memory port to access.
   wire 	 pcie_clk;
   //----------END: xillybus_interface signals----------
   
   //----------START: ip clocks----------
   wire 	 ip_clk_1;
   wire 	 ip_rst_n_1;
   wire 	 user_clk_100;
   wire 	 user_clk_150;
   wire 	 user_clk_200;
   wire 	 user_clk_250;
   //----------END: ip clocks----------


   assign ip_clk_1 = user_clk_250;//progma_ip_clk_1
   clk_wiz_0 clk_wiz
     (
      .clk_in1(pcie_clk),
      .clk_out1(user_clk_100),
      .clk_out2(user_clk_150),
      .clk_out3(user_clk_200),
      .clk_out4(user_clk_250)
      );

   xillybus_interface xillybus_interface_0
     (
      .PCIE_TX_P(PCIE_TX_P),
      .PCIE_TX_N(PCIE_TX_N),
      .PCIE_RX_P(PCIE_RX_P),
      .PCIE_RX_N(PCIE_RX_N),
      .PCIE_REFCLK_P(PCIE_REFCLK_P),
      .PCIE_REFCLK_N(PCIE_REFCLK_N),
      .PCIE_PERST_B_LS(PCIE_PERST_B_LS),
      .GPIO_LED(GPIO_LED),
      .bus_clk(pcie_clk),
      .ip_clk(ip_clk_1),
      .ip_rst_n(ip_rst_n_1),
      .in_r_dout(in_r_dout_1),
      .in_r_read(in_r_read_1),
      .in_r_empty_n(in_r_empty_n_1),
      .out_r_din(out_r_din_1),
      .out_r_full(out_r_full_1),
      .out_r_write(out_r_write_1),
      .memarray_out(memarray)
      );

    ip_loopback ip_loopback_0 (.ap_clk(ip_clk_1), .ap_rst(~ip_rst_n_1), .in_V_V_dout(in_r_dout_1), .in_V_V_empty_n(in_r_empty_n_1), .in_V_V_read(in_r_read_1), .out_V_V_din(out_r_din_1), .out_V_V_full_n(!out_r_full_1), .out_V_V_write(out_r_write_1)); //progma_ip_wrapper_1
endmodule