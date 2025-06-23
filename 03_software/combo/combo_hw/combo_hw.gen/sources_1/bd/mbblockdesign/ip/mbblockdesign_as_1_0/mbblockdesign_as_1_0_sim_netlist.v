// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Mon Jun 23 15:55:22 2025
// Host        : xuser-pc running 64-bit Ubuntu 22.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /1work/pmod-maxsonar-pmod-clp/03_software/combo/combo_hw/combo_hw.gen/sources_1/bd/mbblockdesign/ip/mbblockdesign_as_1_0/mbblockdesign_as_1_0_sim_netlist.v
// Design      : mbblockdesign_as_1_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mbblockdesign_as_1_0,as,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "package_project" *) 
(* x_core_info = "as,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module mbblockdesign_as_1_0
   (i_rx,
    o_tx,
    o_interrupt,
    s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready);
  input i_rx;
  output o_tx;
  (* x_interface_info = "xilinx.com:signal:interrupt:1.0 o_interrupt INTERRUPT" *) (* x_interface_parameter = "XIL_INTERFACENAME o_interrupt, SENSITIVITY LEVEL_HIGH, PORTWIDTH 1" *) output o_interrupt;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 s00_axi_aclk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME s00_axi_aclk, ASSOCIATED_BUSIF s00_axi, ASSOCIATED_RESET s00_axi_aresetn, FREQ_TOLERANCE_HZ -1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input s00_axi_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 s00_axi_aresetn RST" *) (* x_interface_parameter = "XIL_INTERFACENAME s00_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s00_axi AWADDR" *) (* x_interface_parameter = "XIL_INTERFACENAME s00_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 6, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [5:0]s00_axi_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s00_axi AWPROT" *) input [2:0]s00_axi_awprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s00_axi AWVALID" *) input s00_axi_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s00_axi AWREADY" *) output s00_axi_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s00_axi WDATA" *) input [31:0]s00_axi_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s00_axi WSTRB" *) input [3:0]s00_axi_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s00_axi WVALID" *) input s00_axi_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s00_axi WREADY" *) output s00_axi_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s00_axi BRESP" *) output [1:0]s00_axi_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s00_axi BVALID" *) output s00_axi_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s00_axi BREADY" *) input s00_axi_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s00_axi ARADDR" *) input [5:0]s00_axi_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s00_axi ARPROT" *) input [2:0]s00_axi_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s00_axi ARVALID" *) input s00_axi_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s00_axi ARREADY" *) output s00_axi_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s00_axi RDATA" *) output [31:0]s00_axi_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s00_axi RRESP" *) output [1:0]s00_axi_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s00_axi RVALID" *) output s00_axi_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s00_axi RREADY" *) input s00_axi_rready;

  wire \<const0> ;
  wire i_rx;
  wire o_tx;
  wire s00_axi_aclk;
  wire [5:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [5:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire NLW_U0_o_interrupt_UNCONNECTED;
  wire [1:0]NLW_U0_s00_axi_bresp_UNCONNECTED;
  wire [1:0]NLW_U0_s00_axi_rresp_UNCONNECTED;

  assign o_interrupt = \<const0> ;
  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_AS_CONTROL_CALIBRATION_TIME = "49" *) 
  (* C_AS_CONTROL_FIRST_READING_TIME = "100" *) 
  (* C_AS_CONTROL_MS_DIVISOR = "100000" *) 
  (* C_AS_CONTROL_POWER_UP_TIME = "250" *) 
  (* C_AS_CONTROL_RANGE_READING_TIME = "99" *) 
  (* C_AS_UART_BAUDRATE_DIVISOR = "651" *) 
  (* C_AS_UART_NUM_DATA_BITS = "8" *) 
  (* C_S00_AXI_ADDR_WIDTH = "6" *) 
  (* C_S00_AXI_DATA_WIDTH = "32" *) 
  mbblockdesign_as_1_0_as U0
       (.i_rx(i_rx),
        .o_interrupt(NLW_U0_o_interrupt_UNCONNECTED),
        .o_tx(o_tx),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr({s00_axi_araddr[5:2],1'b0,1'b0}),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arprot({1'b0,1'b0,1'b0}),
        .s00_axi_arready(s00_axi_arready),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr({s00_axi_awaddr[5:2],1'b0,1'b0}),
        .s00_axi_awprot({1'b0,1'b0,1'b0}),
        .s00_axi_awready(s00_axi_awready),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bresp(NLW_U0_s00_axi_bresp_UNCONNECTED[1:0]),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rresp(NLW_U0_s00_axi_rresp_UNCONNECTED[1:0]),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s00_axi_wdata[7:6],1'b0,1'b0,1'b0,1'b0,1'b0,s00_axi_wdata[0]}),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wstrb({1'b0,1'b0,1'b0,s00_axi_wstrb[0]}),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

(* C_AS_CONTROL_CALIBRATION_TIME = "49" *) (* C_AS_CONTROL_FIRST_READING_TIME = "100" *) (* C_AS_CONTROL_MS_DIVISOR = "100000" *) 
(* C_AS_CONTROL_POWER_UP_TIME = "250" *) (* C_AS_CONTROL_RANGE_READING_TIME = "99" *) (* C_AS_UART_BAUDRATE_DIVISOR = "651" *) 
(* C_AS_UART_NUM_DATA_BITS = "8" *) (* C_S00_AXI_ADDR_WIDTH = "6" *) (* C_S00_AXI_DATA_WIDTH = "32" *) 
(* ORIG_REF_NAME = "as" *) 
module mbblockdesign_as_1_0_as
   (i_rx,
    o_tx,
    o_interrupt,
    s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready);
  input i_rx;
  output o_tx;
  output o_interrupt;
  input s00_axi_aclk;
  input s00_axi_aresetn;
  input [5:0]s00_axi_awaddr;
  input [2:0]s00_axi_awprot;
  input s00_axi_awvalid;
  output s00_axi_awready;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_wstrb;
  input s00_axi_wvalid;
  output s00_axi_wready;
  output [1:0]s00_axi_bresp;
  output s00_axi_bvalid;
  input s00_axi_bready;
  input [5:0]s00_axi_araddr;
  input [2:0]s00_axi_arprot;
  input s00_axi_arvalid;
  output s00_axi_arready;
  output [31:0]s00_axi_rdata;
  output [1:0]s00_axi_rresp;
  output s00_axi_rvalid;
  input s00_axi_rready;

  wire \<const0> ;
  wire AS_CORE_INST_n_27;
  wire AS_S00_AXI_INST_n_12;
  wire AS_S00_AXI_INST_n_6;
  wire AS_S00_AXI_INST_n_7;
  wire [7:0]ad_dist_char_1_reg;
  wire [7:0]ad_dist_char_2_reg;
  wire [7:0]ad_dist_char_3_reg;
  wire [7:0]ad_dist_in_reg;
  wire ad_start;
  wire ap_start_prev;
  wire ap_start_stage1;
  wire global_reset;
  wire i_rx;
  wire i_rx_sync_0;
  wire i_rx_sync_1;
  wire i_rx_sync_reg_n_0;
  wire o_tx;
  wire s00_axi_aclk;
  wire [5:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [5:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire [7:0]w_ad_err_char;
  wire [5:0]w_ad_err_pos;
  wire w_ad_error;
  wire w_ap_done;
  wire w_ap_start;
  wire w_auto_restart;
  wire w_calib_done;
  wire w_freeze_ip;
  wire w_powerup_done;
  wire w_read_valid;
  wire w_reset_ip;
  wire [7:0]w_ur_data;
  wire w_ur_error;

  assign o_interrupt = \<const0> ;
  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  mbblockdesign_as_1_0_as_core AS_CORE_INST
       (.D({w_ad_err_char,w_ad_err_pos,w_ad_error}),
        .Q(w_ur_data),
        .\ad_dist_char_3_reg_reg[7]_0 ({ad_dist_char_3_reg,ad_dist_char_2_reg,ad_dist_char_1_reg,ad_dist_in_reg}),
        .ad_start(ad_start),
        .ap_start_prev(ap_start_prev),
        .ap_start_stage1(ap_start_stage1),
        .ap_start_stage1_reg_0(AS_S00_AXI_INST_n_12),
        .\clk_counter_reg[0] (AS_S00_AXI_INST_n_7),
        .\data_reg_reg[7] (i_rx_sync_reg_n_0),
        .global_reset(global_reset),
        .o_error_reg(w_ur_error),
        .o_tx(o_tx),
        .read_valid_reg_reg_0({w_read_valid,w_powerup_done}),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .tx_reg_reg_0(AS_CORE_INST_n_27),
        .tx_reg_reg_1(AS_S00_AXI_INST_n_6),
        .w_ap_done(w_ap_done),
        .w_ap_start(w_ap_start),
        .w_auto_restart(w_auto_restart),
        .w_calib_done(w_calib_done),
        .w_freeze_ip(w_freeze_ip),
        .w_reset_ip(w_reset_ip));
  mbblockdesign_as_1_0_as_S00_AXI AS_S00_AXI_INST
       (.\ADSR_reg_reg[15]_0 ({w_ad_err_char,w_ad_err_pos,w_ad_error}),
        .D({w_ur_data,w_ur_error}),
        .\DIST0_reg_reg[31]_0 ({ad_dist_char_3_reg,ad_dist_char_2_reg,ad_dist_char_1_reg,ad_dist_in_reg}),
        .\GCSR_reg_reg[0]_0 (AS_S00_AXI_INST_n_12),
        .\SCSR0_reg_reg[2]_0 ({w_read_valid,w_calib_done,w_powerup_done}),
        .\SCSR0_reg_reg[7]_0 (AS_S00_AXI_INST_n_6),
        .ad_start(ad_start),
        .ap_start_prev(ap_start_prev),
        .ap_start_stage1(ap_start_stage1),
        .axi_arready_reg_0(s00_axi_arready),
        .axi_awready_reg_0(s00_axi_awready),
        .axi_wready_reg_0(s00_axi_wready),
        .global_reset(global_reset),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[5:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_aresetn_0(AS_S00_AXI_INST_n_7),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[5:2]),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata({s00_axi_wdata[7:6],s00_axi_wdata[0]}),
        .s00_axi_wstrb(s00_axi_wstrb[0]),
        .s00_axi_wvalid(s00_axi_wvalid),
        .tx_reg_reg(AS_CORE_INST_n_27),
        .w_ap_done(w_ap_done),
        .w_ap_start(w_ap_start),
        .w_auto_restart(w_auto_restart),
        .w_freeze_ip(w_freeze_ip),
        .w_reset_ip(w_reset_ip));
  GND GND
       (.G(\<const0> ));
  FDRE #(
    .INIT(1'b1)) 
    i_rx_sync_0_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(i_rx),
        .Q(i_rx_sync_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    i_rx_sync_1_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(i_rx_sync_0),
        .Q(i_rx_sync_1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    i_rx_sync_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(i_rx_sync_1),
        .Q(i_rx_sync_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "as_S00_AXI" *) 
module mbblockdesign_as_1_0_as_S00_AXI
   (axi_wready_reg_0,
    axi_awready_reg_0,
    axi_arready_reg_0,
    w_auto_restart,
    s00_axi_bvalid,
    s00_axi_rvalid,
    \SCSR0_reg_reg[7]_0 ,
    s00_axi_aresetn_0,
    w_freeze_ip,
    w_ap_start,
    global_reset,
    w_reset_ip,
    \GCSR_reg_reg[0]_0 ,
    s00_axi_rdata,
    s00_axi_aclk,
    s00_axi_arvalid,
    ad_start,
    ap_start_prev,
    tx_reg_reg,
    s00_axi_aresetn,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_bready,
    s00_axi_rready,
    s00_axi_wdata,
    ap_start_stage1,
    w_ap_done,
    D,
    \ADSR_reg_reg[15]_0 ,
    \SCSR0_reg_reg[2]_0 ,
    s00_axi_araddr,
    \DIST0_reg_reg[31]_0 ,
    s00_axi_awaddr,
    s00_axi_wstrb);
  output axi_wready_reg_0;
  output axi_awready_reg_0;
  output axi_arready_reg_0;
  output w_auto_restart;
  output s00_axi_bvalid;
  output s00_axi_rvalid;
  output \SCSR0_reg_reg[7]_0 ;
  output s00_axi_aresetn_0;
  output w_freeze_ip;
  output w_ap_start;
  output global_reset;
  output w_reset_ip;
  output \GCSR_reg_reg[0]_0 ;
  output [31:0]s00_axi_rdata;
  input s00_axi_aclk;
  input s00_axi_arvalid;
  input ad_start;
  input ap_start_prev;
  input tx_reg_reg;
  input s00_axi_aresetn;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input s00_axi_bready;
  input s00_axi_rready;
  input [2:0]s00_axi_wdata;
  input ap_start_stage1;
  input w_ap_done;
  input [8:0]D;
  input [14:0]\ADSR_reg_reg[15]_0 ;
  input [2:0]\SCSR0_reg_reg[2]_0 ;
  input [3:0]s00_axi_araddr;
  input [31:0]\DIST0_reg_reg[31]_0 ;
  input [3:0]s00_axi_awaddr;
  input [0:0]s00_axi_wstrb;

  wire [14:0]\ADSR_reg_reg[15]_0 ;
  wire \ADSR_reg_reg_n_0_[0] ;
  wire \ADSR_reg_reg_n_0_[10] ;
  wire \ADSR_reg_reg_n_0_[11] ;
  wire \ADSR_reg_reg_n_0_[12] ;
  wire \ADSR_reg_reg_n_0_[13] ;
  wire \ADSR_reg_reg_n_0_[14] ;
  wire \ADSR_reg_reg_n_0_[15] ;
  wire \ADSR_reg_reg_n_0_[1] ;
  wire \ADSR_reg_reg_n_0_[2] ;
  wire \ADSR_reg_reg_n_0_[3] ;
  wire \ADSR_reg_reg_n_0_[4] ;
  wire \ADSR_reg_reg_n_0_[5] ;
  wire \ADSR_reg_reg_n_0_[6] ;
  wire \ADSR_reg_reg_n_0_[8] ;
  wire \ADSR_reg_reg_n_0_[9] ;
  wire [8:0]D;
  wire [31:0]DIST0_reg;
  wire [31:0]\DIST0_reg_reg[31]_0 ;
  wire [2:1]GCSR_reg;
  wire \GCSR_reg[0]_i_1_n_0 ;
  wire \GCSR_reg[0]_i_2_n_0 ;
  wire \GCSR_reg[0]_i_3_n_0 ;
  wire \GCSR_reg[1]_i_1_n_0 ;
  wire \GCSR_reg[1]_i_2_n_0 ;
  wire \GCSR_reg[7]_i_1_n_0 ;
  wire \GCSR_reg[7]_i_2_n_0 ;
  wire \GCSR_reg[7]_i_3_n_0 ;
  wire \GCSR_reg_reg[0]_0 ;
  wire [2:0]SCSR0_reg;
  wire \SCSR0_reg[6]_i_1_n_0 ;
  wire \SCSR0_reg[7]_i_1_n_0 ;
  wire \SCSR0_reg[7]_i_2_n_0 ;
  wire [2:0]\SCSR0_reg_reg[2]_0 ;
  wire \SCSR0_reg_reg[7]_0 ;
  wire \UCSR_reg_reg_n_0_[0] ;
  wire \UCSR_reg_reg_n_0_[10] ;
  wire \UCSR_reg_reg_n_0_[11] ;
  wire \UCSR_reg_reg_n_0_[12] ;
  wire \UCSR_reg_reg_n_0_[13] ;
  wire \UCSR_reg_reg_n_0_[14] ;
  wire \UCSR_reg_reg_n_0_[15] ;
  wire \UCSR_reg_reg_n_0_[8] ;
  wire \UCSR_reg_reg_n_0_[9] ;
  wire ad_start;
  wire ap_start_prev;
  wire ap_start_stage1;
  wire aw_en_i_1_n_0;
  wire aw_en_reg_n_0;
  wire [5:2]axi_araddr;
  wire axi_arready0;
  wire axi_arready_reg_0;
  wire [5:2]axi_awaddr;
  wire axi_awready_i_2_n_0;
  wire axi_awready_reg_0;
  wire axi_bvalid_i_1_n_0;
  wire \axi_rdata[0]_i_2_n_0 ;
  wire \axi_rdata[0]_i_3_n_0 ;
  wire \axi_rdata[10]_i_2_n_0 ;
  wire \axi_rdata[11]_i_2_n_0 ;
  wire \axi_rdata[12]_i_2_n_0 ;
  wire \axi_rdata[14]_i_2_n_0 ;
  wire \axi_rdata[15]_i_2_n_0 ;
  wire \axi_rdata[15]_i_3_n_0 ;
  wire \axi_rdata[15]_i_4_n_0 ;
  wire \axi_rdata[1]_i_2_n_0 ;
  wire \axi_rdata[1]_i_3_n_0 ;
  wire \axi_rdata[2]_i_2_n_0 ;
  wire \axi_rdata[6]_i_2_n_0 ;
  wire \axi_rdata[7]_i_1_n_0 ;
  wire \axi_rdata[7]_i_2_n_0 ;
  wire \axi_rdata[9]_i_2_n_0 ;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0;
  wire axi_wready_reg_0;
  wire global_reset;
  wire i_reset;
  wire [31:0]reg_data_out;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_aresetn_0;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [2:0]s00_axi_wdata;
  wire [0:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire slv_reg_rden;
  wire slv_reg_wren__0;
  wire tx_reg_reg;
  wire w_ap_done;
  wire w_ap_idle;
  wire w_ap_start;
  wire w_auto_restart;
  wire w_freeze_ip;
  wire w_reset_ip;

  FDRE \ADSR_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ADSR_reg_reg[15]_0 [0]),
        .Q(\ADSR_reg_reg_n_0_[0] ),
        .R(i_reset));
  FDRE \ADSR_reg_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ADSR_reg_reg[15]_0 [9]),
        .Q(\ADSR_reg_reg_n_0_[10] ),
        .R(i_reset));
  FDRE \ADSR_reg_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ADSR_reg_reg[15]_0 [10]),
        .Q(\ADSR_reg_reg_n_0_[11] ),
        .R(i_reset));
  FDRE \ADSR_reg_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ADSR_reg_reg[15]_0 [11]),
        .Q(\ADSR_reg_reg_n_0_[12] ),
        .R(i_reset));
  FDRE \ADSR_reg_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ADSR_reg_reg[15]_0 [12]),
        .Q(\ADSR_reg_reg_n_0_[13] ),
        .R(i_reset));
  FDRE \ADSR_reg_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ADSR_reg_reg[15]_0 [13]),
        .Q(\ADSR_reg_reg_n_0_[14] ),
        .R(i_reset));
  FDRE \ADSR_reg_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ADSR_reg_reg[15]_0 [14]),
        .Q(\ADSR_reg_reg_n_0_[15] ),
        .R(i_reset));
  FDRE \ADSR_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ADSR_reg_reg[15]_0 [1]),
        .Q(\ADSR_reg_reg_n_0_[1] ),
        .R(i_reset));
  FDRE \ADSR_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ADSR_reg_reg[15]_0 [2]),
        .Q(\ADSR_reg_reg_n_0_[2] ),
        .R(i_reset));
  FDRE \ADSR_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ADSR_reg_reg[15]_0 [3]),
        .Q(\ADSR_reg_reg_n_0_[3] ),
        .R(i_reset));
  FDRE \ADSR_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ADSR_reg_reg[15]_0 [4]),
        .Q(\ADSR_reg_reg_n_0_[4] ),
        .R(i_reset));
  FDRE \ADSR_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ADSR_reg_reg[15]_0 [5]),
        .Q(\ADSR_reg_reg_n_0_[5] ),
        .R(i_reset));
  FDRE \ADSR_reg_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ADSR_reg_reg[15]_0 [6]),
        .Q(\ADSR_reg_reg_n_0_[6] ),
        .R(i_reset));
  FDRE \ADSR_reg_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ADSR_reg_reg[15]_0 [7]),
        .Q(\ADSR_reg_reg_n_0_[8] ),
        .R(i_reset));
  FDRE \ADSR_reg_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ADSR_reg_reg[15]_0 [8]),
        .Q(\ADSR_reg_reg_n_0_[9] ),
        .R(i_reset));
  FDRE \DIST0_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [0]),
        .Q(DIST0_reg[0]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [10]),
        .Q(DIST0_reg[10]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [11]),
        .Q(DIST0_reg[11]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [12]),
        .Q(DIST0_reg[12]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [13]),
        .Q(DIST0_reg[13]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [14]),
        .Q(DIST0_reg[14]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [15]),
        .Q(DIST0_reg[15]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [16]),
        .Q(DIST0_reg[16]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [17]),
        .Q(DIST0_reg[17]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[18] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [18]),
        .Q(DIST0_reg[18]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[19] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [19]),
        .Q(DIST0_reg[19]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [1]),
        .Q(DIST0_reg[1]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[20] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [20]),
        .Q(DIST0_reg[20]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[21] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [21]),
        .Q(DIST0_reg[21]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[22] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [22]),
        .Q(DIST0_reg[22]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[23] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [23]),
        .Q(DIST0_reg[23]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[24] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [24]),
        .Q(DIST0_reg[24]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[25] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [25]),
        .Q(DIST0_reg[25]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[26] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [26]),
        .Q(DIST0_reg[26]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[27] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [27]),
        .Q(DIST0_reg[27]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[28] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [28]),
        .Q(DIST0_reg[28]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[29] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [29]),
        .Q(DIST0_reg[29]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [2]),
        .Q(DIST0_reg[2]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[30] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [30]),
        .Q(DIST0_reg[30]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[31] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [31]),
        .Q(DIST0_reg[31]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [3]),
        .Q(DIST0_reg[3]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [4]),
        .Q(DIST0_reg[4]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [5]),
        .Q(DIST0_reg[5]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [6]),
        .Q(DIST0_reg[6]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [7]),
        .Q(DIST0_reg[7]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [8]),
        .Q(DIST0_reg[8]),
        .R(i_reset));
  FDRE \DIST0_reg_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DIST0_reg_reg[31]_0 [9]),
        .Q(DIST0_reg[9]),
        .R(i_reset));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(w_reset_ip),
        .I1(s00_axi_aresetn),
        .O(global_reset));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'hFBF8)) 
    \GCSR_reg[0]_i_1 
       (.I0(w_auto_restart),
        .I1(w_ap_done),
        .I2(\GCSR_reg[0]_i_2_n_0 ),
        .I3(w_ap_start),
        .O(\GCSR_reg[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0100000000000000)) 
    \GCSR_reg[0]_i_2 
       (.I0(axi_awaddr[5]),
        .I1(axi_awaddr[4]),
        .I2(\GCSR_reg[0]_i_3_n_0 ),
        .I3(s00_axi_wstrb),
        .I4(axi_wready_reg_0),
        .I5(s00_axi_wdata[0]),
        .O(\GCSR_reg[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \GCSR_reg[0]_i_3 
       (.I0(axi_awaddr[3]),
        .I1(axi_awaddr[2]),
        .O(\GCSR_reg[0]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hE2)) 
    \GCSR_reg[1]_i_1 
       (.I0(w_ap_done),
        .I1(\GCSR_reg[1]_i_2_n_0 ),
        .I2(GCSR_reg[1]),
        .O(\GCSR_reg[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5555555555555551)) 
    \GCSR_reg[1]_i_2 
       (.I0(w_ap_done),
        .I1(axi_arready_reg_0),
        .I2(axi_araddr[4]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[5]),
        .O(\GCSR_reg[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \GCSR_reg[2]_i_1 
       (.I0(w_ap_start),
        .O(w_ap_idle));
  LUT6 #(
    .INIT(64'hBFFFFFFF80000000)) 
    \GCSR_reg[7]_i_1 
       (.I0(s00_axi_wdata[2]),
        .I1(\GCSR_reg[7]_i_2_n_0 ),
        .I2(axi_awready_reg_0),
        .I3(axi_wready_reg_0),
        .I4(\GCSR_reg[7]_i_3_n_0 ),
        .I5(w_auto_restart),
        .O(\GCSR_reg[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \GCSR_reg[7]_i_2 
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .O(\GCSR_reg[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT5 #(
    .INIT(32'h00000100)) 
    \GCSR_reg[7]_i_3 
       (.I0(axi_awaddr[3]),
        .I1(axi_awaddr[2]),
        .I2(axi_awaddr[4]),
        .I3(s00_axi_wstrb),
        .I4(axi_awaddr[5]),
        .O(\GCSR_reg[7]_i_3_n_0 ));
  FDRE \GCSR_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\GCSR_reg[0]_i_1_n_0 ),
        .Q(w_ap_start),
        .R(i_reset));
  FDRE \GCSR_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\GCSR_reg[1]_i_1_n_0 ),
        .Q(GCSR_reg[1]),
        .R(i_reset));
  FDRE \GCSR_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(w_ap_idle),
        .Q(GCSR_reg[2]),
        .R(i_reset));
  FDRE \GCSR_reg_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\GCSR_reg[7]_i_1_n_0 ),
        .Q(w_auto_restart),
        .R(i_reset));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SCSR0_reg[6]_i_1 
       (.I0(s00_axi_wdata[1]),
        .I1(\SCSR0_reg[7]_i_2_n_0 ),
        .I2(w_reset_ip),
        .O(\SCSR0_reg[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SCSR0_reg[7]_i_1 
       (.I0(s00_axi_wdata[2]),
        .I1(\SCSR0_reg[7]_i_2_n_0 ),
        .I2(w_freeze_ip),
        .O(\SCSR0_reg[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000020000000)) 
    \SCSR0_reg[7]_i_2 
       (.I0(slv_reg_wren__0),
        .I1(axi_awaddr[5]),
        .I2(axi_awaddr[4]),
        .I3(s00_axi_wstrb),
        .I4(axi_awaddr[3]),
        .I5(axi_awaddr[2]),
        .O(\SCSR0_reg[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \SCSR0_reg[7]_i_3 
       (.I0(axi_wready_reg_0),
        .I1(axi_awready_reg_0),
        .I2(s00_axi_wvalid),
        .I3(s00_axi_awvalid),
        .O(slv_reg_wren__0));
  FDRE \SCSR0_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\SCSR0_reg_reg[2]_0 [0]),
        .Q(SCSR0_reg[0]),
        .R(i_reset));
  FDRE \SCSR0_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\SCSR0_reg_reg[2]_0 [1]),
        .Q(SCSR0_reg[1]),
        .R(i_reset));
  FDRE \SCSR0_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\SCSR0_reg_reg[2]_0 [2]),
        .Q(SCSR0_reg[2]),
        .R(i_reset));
  FDRE \SCSR0_reg_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\SCSR0_reg[6]_i_1_n_0 ),
        .Q(w_reset_ip),
        .R(i_reset));
  FDRE \SCSR0_reg_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\SCSR0_reg[7]_i_1_n_0 ),
        .Q(w_freeze_ip),
        .R(i_reset));
  FDRE \UCSR_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[0]),
        .Q(\UCSR_reg_reg_n_0_[0] ),
        .R(i_reset));
  FDRE \UCSR_reg_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[3]),
        .Q(\UCSR_reg_reg_n_0_[10] ),
        .R(i_reset));
  FDRE \UCSR_reg_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[4]),
        .Q(\UCSR_reg_reg_n_0_[11] ),
        .R(i_reset));
  FDRE \UCSR_reg_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[5]),
        .Q(\UCSR_reg_reg_n_0_[12] ),
        .R(i_reset));
  FDRE \UCSR_reg_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[6]),
        .Q(\UCSR_reg_reg_n_0_[13] ),
        .R(i_reset));
  FDRE \UCSR_reg_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[7]),
        .Q(\UCSR_reg_reg_n_0_[14] ),
        .R(i_reset));
  FDRE \UCSR_reg_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[8]),
        .Q(\UCSR_reg_reg_n_0_[15] ),
        .R(i_reset));
  FDRE \UCSR_reg_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[1]),
        .Q(\UCSR_reg_reg_n_0_[8] ),
        .R(i_reset));
  FDRE \UCSR_reg_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[2]),
        .Q(\UCSR_reg_reg_n_0_[9] ),
        .R(i_reset));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    ap_start_stage1_i_1
       (.I0(w_ap_start),
        .I1(w_freeze_ip),
        .I2(ap_start_stage1),
        .O(\GCSR_reg_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hBFFF8CCC8CCC8CCC)) 
    aw_en_i_1
       (.I0(axi_awready_reg_0),
        .I1(aw_en_reg_n_0),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(aw_en_i_1_n_0));
  FDSE aw_en_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(aw_en_i_1_n_0),
        .Q(aw_en_reg_n_0),
        .S(i_reset));
  FDSE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(axi_arready0),
        .D(s00_axi_araddr[0]),
        .Q(axi_araddr[2]),
        .S(i_reset));
  FDSE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(axi_arready0),
        .D(s00_axi_araddr[1]),
        .Q(axi_araddr[3]),
        .S(i_reset));
  FDSE \axi_araddr_reg[4] 
       (.C(s00_axi_aclk),
        .CE(axi_arready0),
        .D(s00_axi_araddr[2]),
        .Q(axi_araddr[4]),
        .S(i_reset));
  FDSE \axi_araddr_reg[5] 
       (.C(s00_axi_aclk),
        .CE(axi_arready0),
        .D(s00_axi_araddr[3]),
        .Q(axi_araddr[5]),
        .S(i_reset));
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(axi_arready_reg_0),
        .O(axi_arready0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(axi_arready_reg_0),
        .R(i_reset));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(axi_awready_i_2_n_0),
        .D(s00_axi_awaddr[0]),
        .Q(axi_awaddr[2]),
        .R(i_reset));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(axi_awready_i_2_n_0),
        .D(s00_axi_awaddr[1]),
        .Q(axi_awaddr[3]),
        .R(i_reset));
  FDRE \axi_awaddr_reg[4] 
       (.C(s00_axi_aclk),
        .CE(axi_awready_i_2_n_0),
        .D(s00_axi_awaddr[2]),
        .Q(axi_awaddr[4]),
        .R(i_reset));
  FDRE \axi_awaddr_reg[5] 
       (.C(s00_axi_aclk),
        .CE(axi_awready_i_2_n_0),
        .D(s00_axi_awaddr[3]),
        .Q(axi_awaddr[5]),
        .R(i_reset));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s00_axi_aresetn),
        .O(i_reset));
  LUT4 #(
    .INIT(16'h0080)) 
    axi_awready_i_2
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_awvalid),
        .I2(aw_en_reg_n_0),
        .I3(axi_awready_reg_0),
        .O(axi_awready_i_2_n_0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready_i_2_n_0),
        .Q(axi_awready_reg_0),
        .R(i_reset));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_awvalid),
        .I2(axi_awready_reg_0),
        .I3(axi_wready_reg_0),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(i_reset));
  LUT6 #(
    .INIT(64'hC0C0C2020000C202)) 
    \axi_rdata[0]_i_2 
       (.I0(w_ap_start),
        .I1(axi_araddr[4]),
        .I2(axi_araddr[3]),
        .I3(SCSR0_reg[0]),
        .I4(axi_araddr[2]),
        .I5(DIST0_reg[0]),
        .O(\axi_rdata[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h000B0008)) 
    \axi_rdata[0]_i_3 
       (.I0(\ADSR_reg_reg_n_0_[0] ),
        .I1(axi_araddr[2]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[4]),
        .I4(\UCSR_reg_reg_n_0_[0] ),
        .O(\axi_rdata[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAEAAAAAAAAAAAFA)) 
    \axi_rdata[10]_i_1 
       (.I0(\axi_rdata[10]_i_2_n_0 ),
        .I1(DIST0_reg[10]),
        .I2(axi_araddr[4]),
        .I3(axi_araddr[5]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(reg_data_out[10]));
  LUT6 #(
    .INIT(64'h000000CA00000000)) 
    \axi_rdata[10]_i_2 
       (.I0(\UCSR_reg_reg_n_0_[10] ),
        .I1(\ADSR_reg_reg_n_0_[10] ),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[4]),
        .I5(axi_araddr[5]),
        .O(\axi_rdata[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAEAAAAAAAAAAAFA)) 
    \axi_rdata[11]_i_1 
       (.I0(\axi_rdata[11]_i_2_n_0 ),
        .I1(DIST0_reg[11]),
        .I2(axi_araddr[4]),
        .I3(axi_araddr[5]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(reg_data_out[11]));
  LUT6 #(
    .INIT(64'h000000CA00000000)) 
    \axi_rdata[11]_i_2 
       (.I0(\UCSR_reg_reg_n_0_[11] ),
        .I1(\ADSR_reg_reg_n_0_[11] ),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[4]),
        .I5(axi_araddr[5]),
        .O(\axi_rdata[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0D000000)) 
    \axi_rdata[12]_i_1 
       (.I0(axi_araddr[3]),
        .I1(DIST0_reg[12]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[4]),
        .I4(axi_araddr[2]),
        .I5(\axi_rdata[12]_i_2_n_0 ),
        .O(reg_data_out[12]));
  LUT6 #(
    .INIT(64'h000000CA00000000)) 
    \axi_rdata[12]_i_2 
       (.I0(\UCSR_reg_reg_n_0_[12] ),
        .I1(\ADSR_reg_reg_n_0_[12] ),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[4]),
        .I5(axi_araddr[5]),
        .O(\axi_rdata[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4F4F4F44444F4444)) 
    \axi_rdata[13]_i_1 
       (.I0(\axi_rdata[15]_i_2_n_0 ),
        .I1(DIST0_reg[13]),
        .I2(\axi_rdata[15]_i_3_n_0 ),
        .I3(\axi_rdata[15]_i_4_n_0 ),
        .I4(\ADSR_reg_reg_n_0_[13] ),
        .I5(\UCSR_reg_reg_n_0_[13] ),
        .O(reg_data_out[13]));
  LUT6 #(
    .INIT(64'hAAEAAAAAAAAAAAFA)) 
    \axi_rdata[14]_i_1 
       (.I0(\axi_rdata[14]_i_2_n_0 ),
        .I1(DIST0_reg[14]),
        .I2(axi_araddr[4]),
        .I3(axi_araddr[5]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(reg_data_out[14]));
  LUT6 #(
    .INIT(64'h000000CA00000000)) 
    \axi_rdata[14]_i_2 
       (.I0(\UCSR_reg_reg_n_0_[14] ),
        .I1(\ADSR_reg_reg_n_0_[14] ),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[4]),
        .I5(axi_araddr[5]),
        .O(\axi_rdata[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4F4F4F44444F4444)) 
    \axi_rdata[15]_i_1 
       (.I0(\axi_rdata[15]_i_2_n_0 ),
        .I1(DIST0_reg[15]),
        .I2(\axi_rdata[15]_i_3_n_0 ),
        .I3(\axi_rdata[15]_i_4_n_0 ),
        .I4(\ADSR_reg_reg_n_0_[15] ),
        .I5(\UCSR_reg_reg_n_0_[15] ),
        .O(reg_data_out[15]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'hF7FF)) 
    \axi_rdata[15]_i_2 
       (.I0(axi_araddr[3]),
        .I1(axi_araddr[2]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[4]),
        .O(\axi_rdata[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hFD)) 
    \axi_rdata[15]_i_3 
       (.I0(axi_araddr[5]),
        .I1(axi_araddr[4]),
        .I2(axi_araddr[3]),
        .O(\axi_rdata[15]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h45)) 
    \axi_rdata[15]_i_4 
       (.I0(axi_araddr[4]),
        .I1(axi_araddr[3]),
        .I2(axi_araddr[2]),
        .O(\axi_rdata[15]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT5 #(
    .INIT(32'h09000100)) 
    \axi_rdata[16]_i_1 
       (.I0(axi_araddr[3]),
        .I1(axi_araddr[2]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[4]),
        .I4(DIST0_reg[16]),
        .O(reg_data_out[16]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT5 #(
    .INIT(32'h09000100)) 
    \axi_rdata[17]_i_1 
       (.I0(axi_araddr[3]),
        .I1(axi_araddr[2]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[4]),
        .I4(DIST0_reg[17]),
        .O(reg_data_out[17]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT5 #(
    .INIT(32'h09000100)) 
    \axi_rdata[18]_i_1 
       (.I0(axi_araddr[3]),
        .I1(axi_araddr[2]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[4]),
        .I4(DIST0_reg[18]),
        .O(reg_data_out[18]));
  LUT5 #(
    .INIT(32'h09000100)) 
    \axi_rdata[19]_i_1 
       (.I0(axi_araddr[3]),
        .I1(axi_araddr[2]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[4]),
        .I4(DIST0_reg[19]),
        .O(reg_data_out[19]));
  LUT6 #(
    .INIT(64'hFFFFFFFF88F30000)) 
    \axi_rdata[1]_i_1 
       (.I0(DIST0_reg[1]),
        .I1(axi_araddr[3]),
        .I2(SCSR0_reg[1]),
        .I3(axi_araddr[2]),
        .I4(\axi_rdata[1]_i_2_n_0 ),
        .I5(\axi_rdata[1]_i_3_n_0 ),
        .O(reg_data_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \axi_rdata[1]_i_2 
       (.I0(axi_araddr[4]),
        .I1(axi_araddr[5]),
        .O(\axi_rdata[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0008000800030000)) 
    \axi_rdata[1]_i_3 
       (.I0(\ADSR_reg_reg_n_0_[1] ),
        .I1(axi_araddr[2]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[4]),
        .I4(GCSR_reg[1]),
        .I5(axi_araddr[5]),
        .O(\axi_rdata[1]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h08000000)) 
    \axi_rdata[20]_i_1 
       (.I0(DIST0_reg[20]),
        .I1(axi_araddr[4]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[3]),
        .O(reg_data_out[20]));
  LUT5 #(
    .INIT(32'h08000000)) 
    \axi_rdata[21]_i_1 
       (.I0(DIST0_reg[21]),
        .I1(axi_araddr[4]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[3]),
        .O(reg_data_out[21]));
  LUT5 #(
    .INIT(32'h09000100)) 
    \axi_rdata[22]_i_1 
       (.I0(axi_araddr[3]),
        .I1(axi_araddr[2]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[4]),
        .I4(DIST0_reg[22]),
        .O(reg_data_out[22]));
  LUT5 #(
    .INIT(32'h08000000)) 
    \axi_rdata[23]_i_1 
       (.I0(DIST0_reg[23]),
        .I1(axi_araddr[4]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[3]),
        .O(reg_data_out[23]));
  LUT5 #(
    .INIT(32'h09000100)) 
    \axi_rdata[24]_i_1 
       (.I0(axi_araddr[3]),
        .I1(axi_araddr[2]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[4]),
        .I4(DIST0_reg[24]),
        .O(reg_data_out[24]));
  LUT5 #(
    .INIT(32'h09000100)) 
    \axi_rdata[25]_i_1 
       (.I0(axi_araddr[3]),
        .I1(axi_araddr[2]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[4]),
        .I4(DIST0_reg[25]),
        .O(reg_data_out[25]));
  LUT5 #(
    .INIT(32'h08000000)) 
    \axi_rdata[26]_i_1 
       (.I0(DIST0_reg[26]),
        .I1(axi_araddr[4]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[3]),
        .O(reg_data_out[26]));
  LUT5 #(
    .INIT(32'h08000000)) 
    \axi_rdata[27]_i_1 
       (.I0(DIST0_reg[27]),
        .I1(axi_araddr[4]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[3]),
        .O(reg_data_out[27]));
  LUT5 #(
    .INIT(32'h09000100)) 
    \axi_rdata[28]_i_1 
       (.I0(axi_araddr[3]),
        .I1(axi_araddr[2]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[4]),
        .I4(DIST0_reg[28]),
        .O(reg_data_out[28]));
  LUT5 #(
    .INIT(32'h08000000)) 
    \axi_rdata[29]_i_1 
       (.I0(DIST0_reg[29]),
        .I1(axi_araddr[4]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[3]),
        .O(reg_data_out[29]));
  LUT6 #(
    .INIT(64'h0200FFFF02000000)) 
    \axi_rdata[2]_i_1 
       (.I0(axi_araddr[2]),
        .I1(axi_araddr[3]),
        .I2(axi_araddr[4]),
        .I3(\ADSR_reg_reg_n_0_[2] ),
        .I4(axi_araddr[5]),
        .I5(\axi_rdata[2]_i_2_n_0 ),
        .O(reg_data_out[2]));
  LUT6 #(
    .INIT(64'hC0C0C2020000C202)) 
    \axi_rdata[2]_i_2 
       (.I0(GCSR_reg[2]),
        .I1(axi_araddr[4]),
        .I2(axi_araddr[3]),
        .I3(SCSR0_reg[2]),
        .I4(axi_araddr[2]),
        .I5(DIST0_reg[2]),
        .O(\axi_rdata[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h09000100)) 
    \axi_rdata[30]_i_1 
       (.I0(axi_araddr[3]),
        .I1(axi_araddr[2]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[4]),
        .I4(DIST0_reg[30]),
        .O(reg_data_out[30]));
  LUT3 #(
    .INIT(8'h08)) 
    \axi_rdata[31]_i_1 
       (.I0(s00_axi_arvalid),
        .I1(axi_arready_reg_0),
        .I2(s00_axi_rvalid),
        .O(slv_reg_rden));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'h08000808)) 
    \axi_rdata[31]_i_2 
       (.I0(axi_araddr[2]),
        .I1(axi_araddr[4]),
        .I2(axi_araddr[5]),
        .I3(DIST0_reg[31]),
        .I4(axi_araddr[3]),
        .O(reg_data_out[31]));
  LUT6 #(
    .INIT(64'h000C800000008000)) 
    \axi_rdata[3]_i_1 
       (.I0(DIST0_reg[3]),
        .I1(axi_araddr[2]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[4]),
        .I4(axi_araddr[5]),
        .I5(\ADSR_reg_reg_n_0_[3] ),
        .O(reg_data_out[3]));
  LUT6 #(
    .INIT(64'h00C000000A0000F0)) 
    \axi_rdata[4]_i_1 
       (.I0(\ADSR_reg_reg_n_0_[4] ),
        .I1(DIST0_reg[4]),
        .I2(axi_araddr[4]),
        .I3(axi_araddr[5]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(reg_data_out[4]));
  LUT6 #(
    .INIT(64'h000C800000008000)) 
    \axi_rdata[5]_i_1 
       (.I0(DIST0_reg[5]),
        .I1(axi_araddr[2]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[4]),
        .I4(axi_araddr[5]),
        .I5(\ADSR_reg_reg_n_0_[5] ),
        .O(reg_data_out[5]));
  LUT6 #(
    .INIT(64'hFFFFFFFF02000000)) 
    \axi_rdata[6]_i_1 
       (.I0(axi_araddr[2]),
        .I1(axi_araddr[3]),
        .I2(axi_araddr[4]),
        .I3(axi_araddr[5]),
        .I4(\ADSR_reg_reg_n_0_[6] ),
        .I5(\axi_rdata[6]_i_2_n_0 ),
        .O(reg_data_out[6]));
  LUT6 #(
    .INIT(64'h2020300000003030)) 
    \axi_rdata[6]_i_2 
       (.I0(DIST0_reg[6]),
        .I1(axi_araddr[5]),
        .I2(axi_araddr[4]),
        .I3(w_reset_ip),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(\axi_rdata[6]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \axi_rdata[7]_i_1 
       (.I0(axi_araddr[5]),
        .I1(\axi_rdata[7]_i_2_n_0 ),
        .O(\axi_rdata[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3F3D3FFDFF3DFFFD)) 
    \axi_rdata[7]_i_2 
       (.I0(w_auto_restart),
        .I1(axi_araddr[4]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(w_freeze_ip),
        .I5(DIST0_reg[7]),
        .O(\axi_rdata[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4F4F4F44444F4444)) 
    \axi_rdata[8]_i_1 
       (.I0(\axi_rdata[15]_i_2_n_0 ),
        .I1(DIST0_reg[8]),
        .I2(\axi_rdata[15]_i_3_n_0 ),
        .I3(\axi_rdata[15]_i_4_n_0 ),
        .I4(\ADSR_reg_reg_n_0_[8] ),
        .I5(\UCSR_reg_reg_n_0_[8] ),
        .O(reg_data_out[8]));
  LUT6 #(
    .INIT(64'hAAEAAAAAAAAAAAFA)) 
    \axi_rdata[9]_i_1 
       (.I0(\axi_rdata[9]_i_2_n_0 ),
        .I1(DIST0_reg[9]),
        .I2(axi_araddr[4]),
        .I3(axi_araddr[5]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(reg_data_out[9]));
  LUT6 #(
    .INIT(64'h000000CA00000000)) 
    \axi_rdata[9]_i_2 
       (.I0(\UCSR_reg_reg_n_0_[9] ),
        .I1(\ADSR_reg_reg_n_0_[9] ),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[4]),
        .I5(axi_araddr[5]),
        .O(\axi_rdata[9]_i_2_n_0 ));
  FDRE \axi_rdata_reg[0] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[0]),
        .Q(s00_axi_rdata[0]),
        .R(i_reset));
  MUXF7 \axi_rdata_reg[0]_i_1 
       (.I0(\axi_rdata[0]_i_2_n_0 ),
        .I1(\axi_rdata[0]_i_3_n_0 ),
        .O(reg_data_out[0]),
        .S(axi_araddr[5]));
  FDRE \axi_rdata_reg[10] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[10]),
        .Q(s00_axi_rdata[10]),
        .R(i_reset));
  FDRE \axi_rdata_reg[11] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[11]),
        .Q(s00_axi_rdata[11]),
        .R(i_reset));
  FDRE \axi_rdata_reg[12] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[12]),
        .Q(s00_axi_rdata[12]),
        .R(i_reset));
  FDRE \axi_rdata_reg[13] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[13]),
        .Q(s00_axi_rdata[13]),
        .R(i_reset));
  FDRE \axi_rdata_reg[14] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[14]),
        .Q(s00_axi_rdata[14]),
        .R(i_reset));
  FDRE \axi_rdata_reg[15] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[15]),
        .Q(s00_axi_rdata[15]),
        .R(i_reset));
  FDRE \axi_rdata_reg[16] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[16]),
        .Q(s00_axi_rdata[16]),
        .R(i_reset));
  FDRE \axi_rdata_reg[17] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[17]),
        .Q(s00_axi_rdata[17]),
        .R(i_reset));
  FDRE \axi_rdata_reg[18] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[18]),
        .Q(s00_axi_rdata[18]),
        .R(i_reset));
  FDRE \axi_rdata_reg[19] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[19]),
        .Q(s00_axi_rdata[19]),
        .R(i_reset));
  FDRE \axi_rdata_reg[1] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[1]),
        .Q(s00_axi_rdata[1]),
        .R(i_reset));
  FDRE \axi_rdata_reg[20] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[20]),
        .Q(s00_axi_rdata[20]),
        .R(i_reset));
  FDRE \axi_rdata_reg[21] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[21]),
        .Q(s00_axi_rdata[21]),
        .R(i_reset));
  FDRE \axi_rdata_reg[22] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[22]),
        .Q(s00_axi_rdata[22]),
        .R(i_reset));
  FDRE \axi_rdata_reg[23] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[23]),
        .Q(s00_axi_rdata[23]),
        .R(i_reset));
  FDRE \axi_rdata_reg[24] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[24]),
        .Q(s00_axi_rdata[24]),
        .R(i_reset));
  FDRE \axi_rdata_reg[25] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[25]),
        .Q(s00_axi_rdata[25]),
        .R(i_reset));
  FDRE \axi_rdata_reg[26] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[26]),
        .Q(s00_axi_rdata[26]),
        .R(i_reset));
  FDRE \axi_rdata_reg[27] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[27]),
        .Q(s00_axi_rdata[27]),
        .R(i_reset));
  FDRE \axi_rdata_reg[28] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[28]),
        .Q(s00_axi_rdata[28]),
        .R(i_reset));
  FDRE \axi_rdata_reg[29] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[29]),
        .Q(s00_axi_rdata[29]),
        .R(i_reset));
  FDRE \axi_rdata_reg[2] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[2]),
        .Q(s00_axi_rdata[2]),
        .R(i_reset));
  FDRE \axi_rdata_reg[30] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[30]),
        .Q(s00_axi_rdata[30]),
        .R(i_reset));
  FDRE \axi_rdata_reg[31] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[31]),
        .Q(s00_axi_rdata[31]),
        .R(i_reset));
  FDRE \axi_rdata_reg[3] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[3]),
        .Q(s00_axi_rdata[3]),
        .R(i_reset));
  FDRE \axi_rdata_reg[4] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[4]),
        .Q(s00_axi_rdata[4]),
        .R(i_reset));
  FDRE \axi_rdata_reg[5] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[5]),
        .Q(s00_axi_rdata[5]),
        .R(i_reset));
  FDRE \axi_rdata_reg[6] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[6]),
        .Q(s00_axi_rdata[6]),
        .R(i_reset));
  FDRE \axi_rdata_reg[7] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(\axi_rdata[7]_i_1_n_0 ),
        .Q(s00_axi_rdata[7]),
        .R(i_reset));
  FDRE \axi_rdata_reg[8] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[8]),
        .Q(s00_axi_rdata[8]),
        .R(i_reset));
  FDRE \axi_rdata_reg[9] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[9]),
        .Q(s00_axi_rdata[9]),
        .R(i_reset));
  LUT4 #(
    .INIT(16'h7444)) 
    axi_rvalid_i_1
       (.I0(s00_axi_rready),
        .I1(s00_axi_rvalid),
        .I2(axi_arready_reg_0),
        .I3(s00_axi_arvalid),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(s00_axi_rvalid),
        .R(i_reset));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    axi_wready_i_1
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_awvalid),
        .I2(axi_wready_reg_0),
        .I3(aw_en_reg_n_0),
        .O(axi_wready0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready0),
        .Q(axi_wready_reg_0),
        .R(i_reset));
  LUT2 #(
    .INIT(4'h2)) 
    \data_reg[7]_i_4 
       (.I0(s00_axi_aresetn),
        .I1(w_reset_ip),
        .O(s00_axi_aresetn_0));
  LUT6 #(
    .INIT(64'h8A8A8A8A00020000)) 
    tx_reg_i_1
       (.I0(s00_axi_aresetn_0),
        .I1(w_freeze_ip),
        .I2(ad_start),
        .I3(ap_start_prev),
        .I4(w_ap_start),
        .I5(tx_reg_reg),
        .O(\SCSR0_reg_reg[7]_0 ));
endmodule

(* ORIG_REF_NAME = "as_core" *) 
module mbblockdesign_as_1_0_as_core
   (ap_start_prev,
    Q,
    D,
    w_ap_done,
    o_error_reg,
    ad_start,
    tx_reg_reg_0,
    ap_start_stage1,
    w_calib_done,
    o_tx,
    read_valid_reg_reg_0,
    \ad_dist_char_3_reg_reg[7]_0 ,
    global_reset,
    s00_axi_aclk,
    w_ap_start,
    tx_reg_reg_1,
    ap_start_stage1_reg_0,
    \clk_counter_reg[0] ,
    s00_axi_aresetn,
    w_reset_ip,
    w_freeze_ip,
    \data_reg_reg[7] ,
    w_auto_restart);
  output ap_start_prev;
  output [7:0]Q;
  output [14:0]D;
  output w_ap_done;
  output [0:0]o_error_reg;
  output ad_start;
  output tx_reg_reg_0;
  output ap_start_stage1;
  output w_calib_done;
  output o_tx;
  output [1:0]read_valid_reg_reg_0;
  output [31:0]\ad_dist_char_3_reg_reg[7]_0 ;
  input global_reset;
  input s00_axi_aclk;
  input w_ap_start;
  input tx_reg_reg_1;
  input ap_start_stage1_reg_0;
  input \clk_counter_reg[0] ;
  input s00_axi_aresetn;
  input w_reset_ip;
  input w_freeze_ip;
  input \data_reg_reg[7] ;
  input w_auto_restart;

  wire ASCII_DECODER_INST_n_12;
  wire ASCII_DECODER_INST_n_13;
  wire ASCII_DECODER_INST_n_14;
  wire ASCII_DECODER_INST_n_15;
  wire ASCII_DECODER_INST_n_27;
  wire ASCII_DECODER_INST_n_28;
  wire ASCII_DECODER_INST_n_9;
  wire CONTROL_TIMER_INST_n_1;
  wire CONTROL_TIMER_INST_n_10;
  wire CONTROL_TIMER_INST_n_8;
  wire CONTROL_TIMER_INST_n_9;
  wire [14:0]D;
  wire [7:0]Q;
  wire UART_RECEIVER_INST_n_16;
  wire UART_RECEIVER_INST_n_17;
  wire UART_RECEIVER_INST_n_18;
  wire UART_RECEIVER_INST_n_19;
  wire UART_RECEIVER_INST_n_20;
  wire UART_RECEIVER_INST_n_21;
  wire UART_RECEIVER_INST_n_3;
  wire UART_RECEIVER_INST_n_31;
  wire UART_RECEIVER_INST_n_32;
  wire UART_RECEIVER_INST_n_33;
  wire UART_RECEIVER_INST_n_34;
  wire UART_RECEIVER_INST_n_35;
  wire UART_RECEIVER_INST_n_36;
  wire UART_RECEIVER_INST_n_37;
  wire UART_RECEIVER_INST_n_38;
  wire UART_RECEIVER_INST_n_39;
  wire UART_RECEIVER_INST_n_4;
  wire UART_RECEIVER_INST_n_40;
  wire UART_RECEIVER_INST_n_41;
  wire UART_RECEIVER_INST_n_42;
  wire UART_RECEIVER_INST_n_43;
  wire UART_RECEIVER_INST_n_5;
  wire \ad_digit_index[0]_i_1_n_0 ;
  wire \ad_digit_index[1]_i_1_n_0 ;
  wire \ad_digit_index_reg_n_0_[0] ;
  wire \ad_digit_index_reg_n_0_[1] ;
  wire ad_digit_ready;
  wire ad_dist_char_1_reg;
  wire ad_dist_char_2_reg;
  wire ad_dist_char_3_reg;
  wire [31:0]\ad_dist_char_3_reg_reg[7]_0 ;
  wire ad_dist_in_reg;
  wire [4:0]ad_err_pos;
  wire ad_start;
  wire ap_start_prev;
  wire ap_start_stage1;
  wire ap_start_stage1_reg_0;
  wire ap_start_stage2;
  wire ap_start_stage2_i_1_n_0;
  wire bd_gen_tick;
  wire clk_counter;
  wire \clk_counter_reg[0] ;
  wire ctl_done;
  wire [7:0]data_reg;
  wire data_reg_0;
  wire \data_reg_reg[7] ;
  wire [7:0]digit_next;
  wire [7:0]digit_reg;
  wire [7:0]error_char_reg;
  wire error_char_reg_2;
  wire [5:5]error_pos_reg;
  wire error_pos_reg_1;
  wire error_reg;
  wire global_reset;
  wire i_enable;
  wire i_enable4_out;
  wire [0:0]next_state;
  wire o_baud_enable;
  wire [0:0]o_error_reg;
  wire o_tx;
  wire read_valid_reg0;
  wire read_valid_reg_i_1_n_0;
  wire [1:0]read_valid_reg_reg_0;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire tx_reg_reg_0;
  wire tx_reg_reg_1;
  wire update_window;
  wire ur_done;
  wire w_ap_done;
  wire w_ap_start;
  wire w_auto_restart;
  wire w_calib_done;
  wire w_freeze_ip;
  wire w_reset_ip;

  mbblockdesign_as_1_0_ascii_decoder ASCII_DECODER_INST
       (.D(digit_next),
        .DI(UART_RECEIVER_INST_n_34),
        .E(ad_dist_char_3_reg),
        .Q(data_reg),
        .S({UART_RECEIVER_INST_n_35,UART_RECEIVER_INST_n_36,UART_RECEIVER_INST_n_37}),
        .\ad_digit_index_reg[1] (ad_dist_char_1_reg),
        .ad_digit_ready(ad_digit_ready),
        .\ad_dist_char_3_reg_reg[0] (\ad_digit_index_reg_n_0_[1] ),
        .\ad_dist_char_3_reg_reg[0]_0 (\ad_digit_index_reg_n_0_[0] ),
        .ap_start_stage2(ap_start_stage2),
        .\chars_reg_reg[0]_0 (UART_RECEIVER_INST_n_21),
        .\chars_reg_reg[1]_0 (ASCII_DECODER_INST_n_15),
        .clk_counter(clk_counter),
        .ctl_done(ctl_done),
        .\data_reg_reg[7]_0 (UART_RECEIVER_INST_n_33),
        .\data_reg_reg[7]_1 ({UART_RECEIVER_INST_n_3,UART_RECEIVER_INST_n_4,UART_RECEIVER_INST_n_5}),
        .\data_reg_reg[7]_2 (w_calib_done),
        .\data_reg_reg[7]_3 (ap_start_stage1),
        .\data_reg_reg[7]_4 (\clk_counter_reg[0] ),
        .\data_reg_reg[7]_5 (data_reg_0),
        .digit_ready_reg_reg_0(UART_RECEIVER_INST_n_31),
        .\digit_reg_reg[0]_0 (CONTROL_TIMER_INST_n_8),
        .\digit_reg_reg[7]_0 (digit_reg),
        .done_reg_reg_0(w_ap_done),
        .\error_char_reg_reg[7]_0 (error_char_reg),
        .\error_char_reg_reg[7]_1 (Q),
        .\error_char_reg_reg[7]_2 (error_char_reg_2),
        .\error_pos_reg_reg[5]_0 ({error_pos_reg,ad_err_pos}),
        .\error_pos_reg_reg[5]_1 (error_pos_reg_1),
        .error_reg(error_reg),
        .error_reg_reg_0(CONTROL_TIMER_INST_n_9),
        .error_reg_reg_1(UART_RECEIVER_INST_n_16),
        .error_reg_reg_2(UART_RECEIVER_INST_n_43),
        .first_number_is_2_reg_reg_0(ASCII_DECODER_INST_n_9),
        .first_number_is_2_reg_reg_1(UART_RECEIVER_INST_n_18),
        .first_number_is_2_reg_reg_2(UART_RECEIVER_INST_n_19),
        .global_reset(global_reset),
        .i__carry__0_i_2_0({UART_RECEIVER_INST_n_38,UART_RECEIVER_INST_n_39}),
        .i__carry_i_3_0(UART_RECEIVER_INST_n_32),
        .i__carry_i_3_1({UART_RECEIVER_INST_n_40,UART_RECEIVER_INST_n_41,UART_RECEIVER_INST_n_42}),
        .i_enable4_out(i_enable4_out),
        .next_state(next_state),
        .read_valid_reg0(read_valid_reg0),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_aresetn_0(ASCII_DECODER_INST_n_27),
        .start_reg_reg_0(ad_start),
        .start_reg_reg_1(CONTROL_TIMER_INST_n_10),
        .\state[2]_i_2_0 (CONTROL_TIMER_INST_n_1),
        .\state_reg[0]_0 (ASCII_DECODER_INST_n_13),
        .\state_reg[1]_0 (ASCII_DECODER_INST_n_12),
        .\state_reg[1]_1 (UART_RECEIVER_INST_n_17),
        .\state_reg[2]_0 (ASCII_DECODER_INST_n_14),
        .\state_reg[2]_1 (ASCII_DECODER_INST_n_28),
        .\state_reg[2]_2 (UART_RECEIVER_INST_n_20),
        .update_window(update_window),
        .update_window_reg(ad_dist_char_2_reg),
        .ur_done(ur_done),
        .w_freeze_ip(w_freeze_ip),
        .w_reset_ip(w_reset_ip));
  mbblockdesign_as_1_0_baud_rate_generator BAUD_GEN_INST
       (.E(i_enable),
        .bd_gen_tick(bd_gen_tick),
        .global_reset(global_reset),
        .i_enable4_out(i_enable4_out),
        .o_baud_enable(o_baud_enable),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .w_reset_ip(w_reset_ip));
  mbblockdesign_as_1_0_control_timer CONTROL_TIMER_INST
       (.\SCSR0_reg_reg[7] (CONTROL_TIMER_INST_n_1),
        .\SCSR0_reg_reg[7]_0 (CONTROL_TIMER_INST_n_9),
        .ap_start_stage2(ap_start_stage2),
        .clk_counter(clk_counter),
        .\clk_counter_reg[0]_0 (\clk_counter_reg[0] ),
        .\clk_counter_reg[0]_1 (ap_start_stage1),
        .config_done_reg_reg_0(w_calib_done),
        .ctl_done(ctl_done),
        .\data_reg_reg[7] (ASCII_DECODER_INST_n_28),
        .done_reg_reg(CONTROL_TIMER_INST_n_8),
        .done_reg_reg_0(CONTROL_TIMER_INST_n_10),
        .\error_pos_reg_reg[5] (UART_RECEIVER_INST_n_16),
        .global_reset(global_reset),
        .i_enable4_out(i_enable4_out),
        .\ms_counter_reg[0]_0 (w_ap_done),
        .o_done_reg_0(error_pos_reg_1),
        .o_done_reg_1(data_reg_0),
        .o_tx(o_tx),
        .o_tx_0(tx_reg_reg_0),
        .powerup_done_reg_reg_0(read_valid_reg_reg_0[0]),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .ur_done(ur_done),
        .w_auto_restart(w_auto_restart),
        .w_freeze_ip(w_freeze_ip),
        .w_reset_ip(w_reset_ip));
  mbblockdesign_as_1_0_uart_receiver UART_RECEIVER_INST
       (.D(digit_next),
        .DI(UART_RECEIVER_INST_n_34),
        .E(i_enable),
        .Q(Q),
        .S({UART_RECEIVER_INST_n_35,UART_RECEIVER_INST_n_36,UART_RECEIVER_INST_n_37}),
        .ap_start_stage2(ap_start_stage2),
        .bd_gen_tick(bd_gen_tick),
        .ctl_done(ctl_done),
        .data_next0_carry__0(data_reg[6:4]),
        .\data_reg_reg[1]_0 ({UART_RECEIVER_INST_n_3,UART_RECEIVER_INST_n_4,UART_RECEIVER_INST_n_5}),
        .\data_reg_reg[3]_0 (UART_RECEIVER_INST_n_17),
        .\data_reg_reg[3]_1 (UART_RECEIVER_INST_n_19),
        .\data_reg_reg[3]_2 (UART_RECEIVER_INST_n_33),
        .\data_reg_reg[4]_0 (UART_RECEIVER_INST_n_32),
        .\data_reg_reg[4]_1 ({UART_RECEIVER_INST_n_40,UART_RECEIVER_INST_n_41,UART_RECEIVER_INST_n_42}),
        .\data_reg_reg[5]_0 (UART_RECEIVER_INST_n_18),
        .\data_reg_reg[5]_1 (UART_RECEIVER_INST_n_21),
        .\data_reg_reg[5]_2 ({UART_RECEIVER_INST_n_38,UART_RECEIVER_INST_n_39}),
        .\data_reg_reg[7]_0 (\data_reg_reg[7] ),
        .\digit_reg_reg[7] (ASCII_DECODER_INST_n_14),
        .\error_char_reg_reg[7] (ASCII_DECODER_INST_n_12),
        .first_number_is_2_reg_reg(ASCII_DECODER_INST_n_15),
        .global_reset(global_reset),
        .i_enable4_out(i_enable4_out),
        .next_state(next_state),
        .o_baud_enable(o_baud_enable),
        .o_done_reg_0(error_char_reg_2),
        .o_error_reg_0(o_error_reg),
        .prev_enable_reg(ap_start_stage1),
        .prev_enable_reg_0(w_calib_done),
        .s00_axi_aclk(s00_axi_aclk),
        .\state[1]_i_2__0 (ASCII_DECODER_INST_n_9),
        .\state_reg[0] (UART_RECEIVER_INST_n_43),
        .\state_reg[1] (UART_RECEIVER_INST_n_16),
        .\state_reg[1]_0 (UART_RECEIVER_INST_n_20),
        .\state_reg[2] (UART_RECEIVER_INST_n_31),
        .\state_reg[2]_0 (ASCII_DECODER_INST_n_13),
        .ur_done(ur_done),
        .w_freeze_ip(w_freeze_ip));
  LUT6 #(
    .INIT(64'h00000000AAAAA6AA)) 
    \ad_digit_index[0]_i_1 
       (.I0(\ad_digit_index_reg_n_0_[0] ),
        .I1(update_window),
        .I2(w_freeze_ip),
        .I3(ad_digit_ready),
        .I4(\ad_digit_index_reg_n_0_[1] ),
        .I5(read_valid_reg0),
        .O(\ad_digit_index[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AEAAAAAA)) 
    \ad_digit_index[1]_i_1 
       (.I0(\ad_digit_index_reg_n_0_[1] ),
        .I1(ad_digit_ready),
        .I2(w_freeze_ip),
        .I3(update_window),
        .I4(\ad_digit_index_reg_n_0_[0] ),
        .I5(read_valid_reg0),
        .O(\ad_digit_index[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ad_digit_index_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ad_digit_index[0]_i_1_n_0 ),
        .Q(\ad_digit_index_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_digit_index_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ad_digit_index[1]_i_1_n_0 ),
        .Q(\ad_digit_index_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_1_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_1_reg),
        .D(digit_reg[0]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [8]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_1_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_1_reg),
        .D(digit_reg[1]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [9]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_1_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_1_reg),
        .D(digit_reg[2]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [10]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_1_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_1_reg),
        .D(digit_reg[3]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [11]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_1_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_1_reg),
        .D(digit_reg[4]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [12]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_1_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_1_reg),
        .D(digit_reg[5]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [13]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_1_reg_reg[6] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_1_reg),
        .D(digit_reg[6]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [14]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_1_reg_reg[7] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_1_reg),
        .D(digit_reg[7]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [15]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_2_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_2_reg),
        .D(digit_reg[0]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [16]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_2_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_2_reg),
        .D(digit_reg[1]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [17]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_2_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_2_reg),
        .D(digit_reg[2]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [18]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_2_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_2_reg),
        .D(digit_reg[3]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [19]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_2_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_2_reg),
        .D(digit_reg[4]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [20]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_2_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_2_reg),
        .D(digit_reg[5]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [21]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_2_reg_reg[6] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_2_reg),
        .D(digit_reg[6]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [22]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_2_reg_reg[7] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_2_reg),
        .D(digit_reg[7]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [23]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_3_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_3_reg),
        .D(digit_reg[0]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [24]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_3_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_3_reg),
        .D(digit_reg[1]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [25]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_3_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_3_reg),
        .D(digit_reg[2]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [26]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_3_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_3_reg),
        .D(digit_reg[3]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [27]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_3_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_3_reg),
        .D(digit_reg[4]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [28]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_3_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_3_reg),
        .D(digit_reg[5]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [29]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_3_reg_reg[6] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_3_reg),
        .D(digit_reg[6]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [30]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_char_3_reg_reg[7] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_char_3_reg),
        .D(digit_reg[7]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [31]),
        .R(read_valid_reg0));
  LUT2 #(
    .INIT(4'h2)) 
    \ad_dist_in_reg[7]_i_2 
       (.I0(update_window),
        .I1(w_freeze_ip),
        .O(ad_dist_in_reg));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_in_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(data_reg[0]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [0]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_in_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(data_reg[1]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [1]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_in_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(data_reg[2]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [2]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_in_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(data_reg[3]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [3]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_in_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(data_reg[4]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [4]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_in_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(data_reg[5]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [5]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_in_reg_reg[6] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(data_reg[6]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [6]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \ad_dist_in_reg_reg[7] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(data_reg[7]),
        .Q(\ad_dist_char_3_reg_reg[7]_0 [7]),
        .R(read_valid_reg0));
  FDRE \ad_err_char_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(error_char_reg[0]),
        .Q(D[7]),
        .R(read_valid_reg0));
  FDRE \ad_err_char_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(error_char_reg[1]),
        .Q(D[8]),
        .R(read_valid_reg0));
  FDRE \ad_err_char_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(error_char_reg[2]),
        .Q(D[9]),
        .R(read_valid_reg0));
  FDRE \ad_err_char_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(error_char_reg[3]),
        .Q(D[10]),
        .R(read_valid_reg0));
  FDRE \ad_err_char_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(error_char_reg[4]),
        .Q(D[11]),
        .R(read_valid_reg0));
  FDRE \ad_err_char_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(error_char_reg[5]),
        .Q(D[12]),
        .R(read_valid_reg0));
  FDRE \ad_err_char_reg_reg[6] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(error_char_reg[6]),
        .Q(D[13]),
        .R(read_valid_reg0));
  FDRE \ad_err_char_reg_reg[7] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(error_char_reg[7]),
        .Q(D[14]),
        .R(read_valid_reg0));
  FDRE \ad_err_pos_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(ad_err_pos[0]),
        .Q(D[1]),
        .R(read_valid_reg0));
  FDRE \ad_err_pos_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(ad_err_pos[1]),
        .Q(D[2]),
        .R(read_valid_reg0));
  FDRE \ad_err_pos_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(ad_err_pos[2]),
        .Q(D[3]),
        .R(read_valid_reg0));
  FDRE \ad_err_pos_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(ad_err_pos[3]),
        .Q(D[4]),
        .R(read_valid_reg0));
  FDRE \ad_err_pos_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(ad_err_pos[4]),
        .Q(D[5]),
        .R(read_valid_reg0));
  FDRE \ad_err_pos_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(error_pos_reg),
        .Q(D[6]),
        .R(read_valid_reg0));
  FDRE ad_error_reg_reg
       (.C(s00_axi_aclk),
        .CE(ad_dist_in_reg),
        .D(error_reg),
        .Q(D[0]),
        .R(read_valid_reg0));
  FDRE #(
    .INIT(1'b0)) 
    ap_start_prev_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(w_ap_start),
        .Q(ap_start_prev),
        .R(global_reset));
  FDRE #(
    .INIT(1'b0)) 
    ap_start_stage1_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(ap_start_stage1_reg_0),
        .Q(ap_start_stage1),
        .R(global_reset));
  LUT3 #(
    .INIT(8'hE2)) 
    ap_start_stage2_i_1
       (.I0(ap_start_stage1),
        .I1(w_freeze_ip),
        .I2(ap_start_stage2),
        .O(ap_start_stage2_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ap_start_stage2_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(ap_start_stage2_i_1_n_0),
        .Q(ap_start_stage2),
        .R(global_reset));
  LUT5 #(
    .INIT(32'h0000BAAA)) 
    read_valid_reg_i_1
       (.I0(read_valid_reg_reg_0[1]),
        .I1(w_freeze_ip),
        .I2(update_window),
        .I3(w_ap_done),
        .I4(read_valid_reg0),
        .O(read_valid_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    read_valid_reg_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(read_valid_reg_i_1_n_0),
        .Q(read_valid_reg_reg_0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    tx_reg_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(tx_reg_reg_1),
        .Q(tx_reg_reg_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    update_window_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(ASCII_DECODER_INST_n_27),
        .Q(update_window),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "ascii_decoder" *) 
module mbblockdesign_as_1_0_ascii_decoder
   (Q,
    done_reg_reg_0,
    first_number_is_2_reg_reg_0,
    start_reg_reg_0,
    ad_digit_ready,
    \state_reg[1]_0 ,
    \state_reg[0]_0 ,
    \state_reg[2]_0 ,
    \chars_reg_reg[1]_0 ,
    clk_counter,
    read_valid_reg0,
    E,
    update_window_reg,
    \ad_digit_index_reg[1] ,
    \error_pos_reg_reg[5]_0 ,
    s00_axi_aresetn_0,
    \state_reg[2]_1 ,
    \digit_reg_reg[7]_0 ,
    error_reg,
    \error_char_reg_reg[7]_0 ,
    \error_char_reg_reg[7]_1 ,
    DI,
    S,
    i__carry_i_3_0,
    i__carry_i_3_1,
    i__carry__0_i_2_0,
    \data_reg_reg[7]_0 ,
    \data_reg_reg[7]_1 ,
    global_reset,
    s00_axi_aclk,
    ctl_done,
    ur_done,
    i_enable4_out,
    \data_reg_reg[7]_2 ,
    \chars_reg_reg[0]_0 ,
    \state[2]_i_2_0 ,
    w_freeze_ip,
    \data_reg_reg[7]_3 ,
    ap_start_stage2,
    w_reset_ip,
    s00_axi_aresetn,
    update_window,
    \ad_dist_char_3_reg_reg[0] ,
    \ad_dist_char_3_reg_reg[0]_0 ,
    first_number_is_2_reg_reg_1,
    first_number_is_2_reg_reg_2,
    \data_reg_reg[7]_4 ,
    digit_ready_reg_reg_0,
    start_reg_reg_1,
    \state_reg[1]_1 ,
    \state_reg[2]_2 ,
    \digit_reg_reg[0]_0 ,
    next_state,
    \data_reg_reg[7]_5 ,
    D,
    \error_pos_reg_reg[5]_1 ,
    error_reg_reg_0,
    error_reg_reg_1,
    error_reg_reg_2,
    \error_char_reg_reg[7]_2 );
  output [7:0]Q;
  output done_reg_reg_0;
  output first_number_is_2_reg_reg_0;
  output start_reg_reg_0;
  output ad_digit_ready;
  output \state_reg[1]_0 ;
  output \state_reg[0]_0 ;
  output \state_reg[2]_0 ;
  output \chars_reg_reg[1]_0 ;
  output clk_counter;
  output read_valid_reg0;
  output [0:0]E;
  output [0:0]update_window_reg;
  output [0:0]\ad_digit_index_reg[1] ;
  output [5:0]\error_pos_reg_reg[5]_0 ;
  output s00_axi_aresetn_0;
  output \state_reg[2]_1 ;
  output [7:0]\digit_reg_reg[7]_0 ;
  output error_reg;
  output [7:0]\error_char_reg_reg[7]_0 ;
  input [7:0]\error_char_reg_reg[7]_1 ;
  input [0:0]DI;
  input [2:0]S;
  input [0:0]i__carry_i_3_0;
  input [2:0]i__carry_i_3_1;
  input [1:0]i__carry__0_i_2_0;
  input [0:0]\data_reg_reg[7]_0 ;
  input [2:0]\data_reg_reg[7]_1 ;
  input global_reset;
  input s00_axi_aclk;
  input ctl_done;
  input ur_done;
  input i_enable4_out;
  input \data_reg_reg[7]_2 ;
  input \chars_reg_reg[0]_0 ;
  input \state[2]_i_2_0 ;
  input w_freeze_ip;
  input \data_reg_reg[7]_3 ;
  input ap_start_stage2;
  input w_reset_ip;
  input s00_axi_aresetn;
  input update_window;
  input \ad_dist_char_3_reg_reg[0] ;
  input \ad_dist_char_3_reg_reg[0]_0 ;
  input first_number_is_2_reg_reg_1;
  input first_number_is_2_reg_reg_2;
  input \data_reg_reg[7]_4 ;
  input digit_ready_reg_reg_0;
  input start_reg_reg_1;
  input \state_reg[1]_1 ;
  input \state_reg[2]_2 ;
  input \digit_reg_reg[0]_0 ;
  input [0:0]next_state;
  input [0:0]\data_reg_reg[7]_5 ;
  input [7:0]D;
  input [0:0]\error_pos_reg_reg[5]_1 ;
  input error_reg_reg_0;
  input error_reg_reg_1;
  input error_reg_reg_2;
  input [0:0]\error_char_reg_reg[7]_2 ;

  wire [7:0]D;
  wire [0:0]DI;
  wire [0:0]E;
  wire [7:0]Q;
  wire [2:0]S;
  wire [0:0]\ad_digit_index_reg[1] ;
  wire ad_digit_ready;
  wire \ad_dist_char_3_reg_reg[0] ;
  wire \ad_dist_char_3_reg_reg[0]_0 ;
  wire ap_start_stage2;
  wire [3:0]chars_next;
  wire \chars_reg[3]_i_1_n_0 ;
  wire \chars_reg[3]_i_3_n_0 ;
  wire \chars_reg[3]_i_4_n_0 ;
  wire \chars_reg[3]_i_5_n_0 ;
  wire \chars_reg_reg[0]_0 ;
  wire \chars_reg_reg[1]_0 ;
  wire \chars_reg_reg_n_0_[0] ;
  wire \chars_reg_reg_n_0_[1] ;
  wire \chars_reg_reg_n_0_[2] ;
  wire \chars_reg_reg_n_0_[3] ;
  wire clk_counter;
  wire ctl_done;
  wire [7:1]data_next0;
  wire data_next0_carry__0_i_1_n_0;
  wire data_next0_carry__0_i_3_n_0;
  wire data_next0_carry__0_n_1;
  wire data_next0_carry__0_n_2;
  wire data_next0_carry__0_n_3;
  wire data_next0_carry__0_n_4;
  wire data_next0_carry__0_n_5;
  wire data_next0_carry__0_n_6;
  wire data_next0_carry__0_n_7;
  wire data_next0_carry_i_1_n_0;
  wire data_next0_carry_i_2_n_0;
  wire data_next0_carry_i_3_n_0;
  wire data_next0_carry_i_4_n_0;
  wire data_next0_carry_n_0;
  wire data_next0_carry_n_1;
  wire data_next0_carry_n_2;
  wire data_next0_carry_n_3;
  wire data_next0_carry_n_4;
  wire data_next0_carry_n_5;
  wire data_next0_carry_n_6;
  wire data_next0_carry_n_7;
  wire \data_next0_inferred__0/i__carry__0_n_2 ;
  wire \data_next0_inferred__0/i__carry__0_n_3 ;
  wire \data_next0_inferred__0/i__carry_n_0 ;
  wire \data_next0_inferred__0/i__carry_n_1 ;
  wire \data_next0_inferred__0/i__carry_n_2 ;
  wire \data_next0_inferred__0/i__carry_n_3 ;
  wire \data_reg[0]_i_1__0_n_0 ;
  wire \data_reg[1]_i_1__0_n_0 ;
  wire \data_reg[2]_i_1__0_n_0 ;
  wire \data_reg[3]_i_1__0_n_0 ;
  wire \data_reg[4]_i_1__0_n_0 ;
  wire \data_reg[5]_i_1__0_n_0 ;
  wire \data_reg[6]_i_1__0_n_0 ;
  wire \data_reg[7]_i_1__0_n_0 ;
  wire \data_reg[7]_i_3__0_n_0 ;
  wire [0:0]\data_reg_reg[7]_0 ;
  wire [2:0]\data_reg_reg[7]_1 ;
  wire \data_reg_reg[7]_2 ;
  wire \data_reg_reg[7]_3 ;
  wire \data_reg_reg[7]_4 ;
  wire [0:0]\data_reg_reg[7]_5 ;
  wire digit_ready_reg_i_1_n_0;
  wire digit_ready_reg_i_2_n_0;
  wire digit_ready_reg_reg_0;
  wire \digit_reg[7]_i_2_n_0 ;
  wire \digit_reg[7]_i_4_n_0 ;
  wire \digit_reg_reg[0]_0 ;
  wire [7:0]\digit_reg_reg[7]_0 ;
  wire done_reg_i_1_n_0;
  wire done_reg_i_2_n_0;
  wire done_reg_reg_0;
  wire [7:0]error_char_next;
  wire [7:0]\error_char_reg_reg[7]_0 ;
  wire [7:0]\error_char_reg_reg[7]_1 ;
  wire [0:0]\error_char_reg_reg[7]_2 ;
  wire \error_pos_reg[0]_i_1_n_0 ;
  wire \error_pos_reg[1]_i_1_n_0 ;
  wire \error_pos_reg[2]_i_1_n_0 ;
  wire \error_pos_reg[3]_i_1_n_0 ;
  wire \error_pos_reg[4]_i_1_n_0 ;
  wire [5:0]\error_pos_reg_reg[5]_0 ;
  wire [0:0]\error_pos_reg_reg[5]_1 ;
  wire error_reg;
  wire error_reg_i_1_n_0;
  wire error_reg_reg_0;
  wire error_reg_reg_1;
  wire error_reg_reg_2;
  wire first_number_is_2_reg_i_1_n_0;
  wire first_number_is_2_reg_i_2_n_0;
  wire first_number_is_2_reg_reg_0;
  wire first_number_is_2_reg_reg_1;
  wire first_number_is_2_reg_reg_2;
  wire global_reset;
  wire i__carry__0_i_1_n_0;
  wire [1:0]i__carry__0_i_2_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry__0_i_3_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2_n_0;
  wire [0:0]i__carry_i_3_0;
  wire [2:0]i__carry_i_3_1;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4_n_0;
  wire i_enable4_out;
  wire [7:5]multOp;
  wire multOp_carry__0_n_3;
  wire multOp_carry__0_n_6;
  wire multOp_carry__0_n_7;
  wire multOp_carry_n_0;
  wire multOp_carry_n_1;
  wire multOp_carry_n_2;
  wire multOp_carry_n_3;
  wire multOp_carry_n_4;
  wire multOp_carry_n_5;
  wire multOp_carry_n_6;
  wire multOp_carry_n_7;
  wire \multOp_inferred__0/i___0_carry_n_2 ;
  wire \multOp_inferred__0/i___0_carry_n_3 ;
  wire [0:0]next_state;
  wire read_valid_reg0;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire s00_axi_aresetn_0;
  wire start_reg_i_1_n_0;
  wire start_reg_reg_0;
  wire start_reg_reg_1;
  wire state;
  wire \state[0]_i_1_n_0 ;
  wire \state[1]_i_1_n_0 ;
  wire \state[2]_i_1_n_0 ;
  wire \state[2]_i_2_0 ;
  wire \state[2]_i_5_n_0 ;
  wire \state_reg[0]_0 ;
  wire \state_reg[1]_0 ;
  wire \state_reg[1]_1 ;
  wire \state_reg[2]_0 ;
  wire \state_reg[2]_1 ;
  wire \state_reg[2]_2 ;
  wire update_window;
  wire [0:0]update_window_reg;
  wire ur_done;
  wire w_freeze_ip;
  wire w_reset_ip;
  wire [3:3]NLW_data_next0_carry__0_CO_UNCONNECTED;
  wire [3:2]\NLW_data_next0_inferred__0/i__carry__0_CO_UNCONNECTED ;
  wire [3:3]\NLW_data_next0_inferred__0/i__carry__0_O_UNCONNECTED ;
  wire [3:1]NLW_multOp_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_multOp_carry__0_O_UNCONNECTED;
  wire [3:2]\NLW_multOp_inferred__0/i___0_carry_CO_UNCONNECTED ;
  wire [3:3]\NLW_multOp_inferred__0/i___0_carry_O_UNCONNECTED ;

  LUT5 #(
    .INIT(32'h00000400)) 
    \ad_dist_char_1_reg[7]_i_1 
       (.I0(\ad_dist_char_3_reg_reg[0] ),
        .I1(ad_digit_ready),
        .I2(w_freeze_ip),
        .I3(update_window),
        .I4(\ad_dist_char_3_reg_reg[0]_0 ),
        .O(\ad_digit_index_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00002000)) 
    \ad_dist_char_2_reg[7]_i_1 
       (.I0(update_window),
        .I1(w_freeze_ip),
        .I2(ad_digit_ready),
        .I3(\ad_dist_char_3_reg_reg[0]_0 ),
        .I4(\ad_dist_char_3_reg_reg[0] ),
        .O(update_window_reg));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00002000)) 
    \ad_dist_char_3_reg[7]_i_1 
       (.I0(update_window),
        .I1(w_freeze_ip),
        .I2(ad_digit_ready),
        .I3(\ad_dist_char_3_reg_reg[0] ),
        .I4(\ad_dist_char_3_reg_reg[0]_0 ),
        .O(E));
  LUT3 #(
    .INIT(8'hEF)) 
    \ad_dist_in_reg[7]_i_1 
       (.I0(start_reg_reg_0),
        .I1(w_reset_ip),
        .I2(s00_axi_aresetn),
        .O(read_valid_reg0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h4101FFFF)) 
    \chars_reg[0]_i_1 
       (.I0(\state_reg[1]_0 ),
        .I1(\state_reg[0]_0 ),
        .I2(\state_reg[2]_0 ),
        .I3(\chars_reg_reg[0]_0 ),
        .I4(\chars_reg_reg_n_0_[0] ),
        .O(chars_next[0]));
  LUT6 #(
    .INIT(64'h6066666066666660)) 
    \chars_reg[1]_i_1 
       (.I0(\chars_reg_reg_n_0_[1] ),
        .I1(\chars_reg_reg_n_0_[0] ),
        .I2(\state_reg[1]_0 ),
        .I3(\state_reg[0]_0 ),
        .I4(\state_reg[2]_0 ),
        .I5(\chars_reg_reg[0]_0 ),
        .O(chars_next[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0078)) 
    \chars_reg[2]_i_1 
       (.I0(\chars_reg_reg_n_0_[0] ),
        .I1(\chars_reg_reg_n_0_[1] ),
        .I2(\chars_reg_reg_n_0_[2] ),
        .I3(\chars_reg[3]_i_5_n_0 ),
        .O(chars_next[2]));
  LUT6 #(
    .INIT(64'h0000007F00000000)) 
    \chars_reg[3]_i_1 
       (.I0(\state_reg[0]_0 ),
        .I1(\state_reg[2]_0 ),
        .I2(\chars_reg[3]_i_3_n_0 ),
        .I3(ctl_done),
        .I4(\chars_reg[3]_i_4_n_0 ),
        .I5(i_enable4_out),
        .O(\chars_reg[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00007F80)) 
    \chars_reg[3]_i_2 
       (.I0(\chars_reg_reg_n_0_[1] ),
        .I1(\chars_reg_reg_n_0_[0] ),
        .I2(\chars_reg_reg_n_0_[2] ),
        .I3(\chars_reg_reg_n_0_[3] ),
        .I4(\chars_reg[3]_i_5_n_0 ),
        .O(chars_next[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    \chars_reg[3]_i_3 
       (.I0(\chars_reg_reg[0]_0 ),
        .I1(\chars_reg_reg_n_0_[3] ),
        .I2(\chars_reg_reg_n_0_[2] ),
        .I3(\chars_reg_reg_n_0_[0] ),
        .I4(\chars_reg_reg_n_0_[1] ),
        .O(\chars_reg[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h8F)) 
    \chars_reg[3]_i_4 
       (.I0(\state_reg[1]_0 ),
        .I1(\state_reg[2]_0 ),
        .I2(ur_done),
        .O(\chars_reg[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0083)) 
    \chars_reg[3]_i_5 
       (.I0(\chars_reg_reg[0]_0 ),
        .I1(\state_reg[2]_0 ),
        .I2(\state_reg[0]_0 ),
        .I3(\state_reg[1]_0 ),
        .O(\chars_reg[3]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chars_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\chars_reg[3]_i_1_n_0 ),
        .D(chars_next[0]),
        .Q(\chars_reg_reg_n_0_[0] ),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chars_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\chars_reg[3]_i_1_n_0 ),
        .D(chars_next[1]),
        .Q(\chars_reg_reg_n_0_[1] ),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chars_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\chars_reg[3]_i_1_n_0 ),
        .D(chars_next[2]),
        .Q(\chars_reg_reg_n_0_[2] ),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chars_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\chars_reg[3]_i_1_n_0 ),
        .D(chars_next[3]),
        .Q(\chars_reg_reg_n_0_[3] ),
        .R(\data_reg[7]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0054)) 
    \clk_counter[0]_i_2 
       (.I0(w_freeze_ip),
        .I1(\data_reg_reg[7]_3 ),
        .I2(ap_start_stage2),
        .I3(done_reg_reg_0),
        .O(clk_counter));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 data_next0_carry
       (.CI(1'b0),
        .CO({data_next0_carry_n_0,data_next0_carry_n_1,data_next0_carry_n_2,data_next0_carry_n_3}),
        .CYINIT(1'b0),
        .DI(Q[3:0]),
        .O({data_next0_carry_n_4,data_next0_carry_n_5,data_next0_carry_n_6,data_next0_carry_n_7}),
        .S({data_next0_carry_i_1_n_0,data_next0_carry_i_2_n_0,data_next0_carry_i_3_n_0,data_next0_carry_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 data_next0_carry__0
       (.CI(data_next0_carry_n_0),
        .CO({NLW_data_next0_carry__0_CO_UNCONNECTED[3],data_next0_carry__0_n_1,data_next0_carry__0_n_2,data_next0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,data_next0_carry__0_i_1_n_0,\error_char_reg_reg[7]_1 [4],DI}),
        .O({data_next0_carry__0_n_4,data_next0_carry__0_n_5,data_next0_carry__0_n_6,data_next0_carry__0_n_7}),
        .S({data_next0_carry__0_i_3_n_0,S}));
  LUT2 #(
    .INIT(4'h9)) 
    data_next0_carry__0_i_1
       (.I0(Q[6]),
        .I1(\error_char_reg_reg[7]_1 [6]),
        .O(data_next0_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h1EE1)) 
    data_next0_carry__0_i_3
       (.I0(Q[6]),
        .I1(\error_char_reg_reg[7]_1 [6]),
        .I2(Q[7]),
        .I3(\error_char_reg_reg[7]_1 [7]),
        .O(data_next0_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    data_next0_carry_i_1
       (.I0(Q[3]),
        .I1(\error_char_reg_reg[7]_1 [3]),
        .O(data_next0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    data_next0_carry_i_2
       (.I0(Q[2]),
        .I1(\error_char_reg_reg[7]_1 [2]),
        .O(data_next0_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    data_next0_carry_i_3
       (.I0(Q[1]),
        .I1(\error_char_reg_reg[7]_1 [1]),
        .O(data_next0_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    data_next0_carry_i_4
       (.I0(Q[0]),
        .I1(\error_char_reg_reg[7]_1 [0]),
        .O(data_next0_carry_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \data_next0_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\data_next0_inferred__0/i__carry_n_0 ,\data_next0_inferred__0/i__carry_n_1 ,\data_next0_inferred__0/i__carry_n_2 ,\data_next0_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI(Q[4:1]),
        .O(data_next0[4:1]),
        .S({i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \data_next0_inferred__0/i__carry__0 
       (.CI(\data_next0_inferred__0/i__carry_n_0 ),
        .CO({\NLW_data_next0_inferred__0/i__carry__0_CO_UNCONNECTED [3:2],\data_next0_inferred__0/i__carry__0_n_2 ,\data_next0_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,Q[6:5]}),
        .O({\NLW_data_next0_inferred__0/i__carry__0_O_UNCONNECTED [3],data_next0[7:5]}),
        .S({1'b0,i__carry__0_i_1_n_0,i__carry__0_i_2_n_0,i__carry__0_i_3_n_0}));
  LUT4 #(
    .INIT(16'hE200)) 
    \data_reg[0]_i_1__0 
       (.I0(Q[0]),
        .I1(\state_reg[0]_0 ),
        .I2(data_next0_carry_n_7),
        .I3(\state_reg[1]_0 ),
        .O(\data_reg[0]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hE200)) 
    \data_reg[1]_i_1__0 
       (.I0(data_next0[1]),
        .I1(\state_reg[0]_0 ),
        .I2(data_next0_carry_n_6),
        .I3(\state_reg[1]_0 ),
        .O(\data_reg[1]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \data_reg[2]_i_1__0 
       (.I0(data_next0_carry_n_5),
        .I1(\state_reg[0]_0 ),
        .I2(data_next0[2]),
        .I3(\state_reg[1]_0 ),
        .I4(\error_char_reg_reg[7]_1 [0]),
        .O(\data_reg[2]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \data_reg[3]_i_1__0 
       (.I0(data_next0_carry_n_4),
        .I1(\state_reg[0]_0 ),
        .I2(data_next0[3]),
        .I3(\state_reg[1]_0 ),
        .I4(\error_char_reg_reg[7]_1 [1]),
        .O(\data_reg[3]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \data_reg[4]_i_1__0 
       (.I0(data_next0_carry__0_n_7),
        .I1(\state_reg[0]_0 ),
        .I2(data_next0[4]),
        .I3(\state_reg[1]_0 ),
        .I4(\error_char_reg_reg[7]_1 [2]),
        .O(\data_reg[4]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \data_reg[5]_i_1__0 
       (.I0(data_next0_carry__0_n_6),
        .I1(\state_reg[0]_0 ),
        .I2(data_next0[5]),
        .I3(\state_reg[1]_0 ),
        .I4(multOp[5]),
        .O(\data_reg[5]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \data_reg[6]_i_1__0 
       (.I0(data_next0_carry__0_n_5),
        .I1(\state_reg[0]_0 ),
        .I2(data_next0[6]),
        .I3(\state_reg[1]_0 ),
        .I4(multOp[6]),
        .O(\data_reg[6]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h00A80000FFFFFFFF)) 
    \data_reg[7]_i_1__0 
       (.I0(done_reg_reg_0),
        .I1(ap_start_stage2),
        .I2(\data_reg_reg[7]_3 ),
        .I3(w_freeze_ip),
        .I4(\data_reg_reg[7]_2 ),
        .I5(\data_reg_reg[7]_4 ),
        .O(\data_reg[7]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \data_reg[7]_i_3__0 
       (.I0(data_next0_carry__0_n_4),
        .I1(\state_reg[0]_0 ),
        .I2(data_next0[7]),
        .I3(\state_reg[1]_0 ),
        .I4(multOp[7]),
        .O(\data_reg[7]_i_3__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\data_reg_reg[7]_5 ),
        .D(\data_reg[0]_i_1__0_n_0 ),
        .Q(Q[0]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\data_reg_reg[7]_5 ),
        .D(\data_reg[1]_i_1__0_n_0 ),
        .Q(Q[1]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\data_reg_reg[7]_5 ),
        .D(\data_reg[2]_i_1__0_n_0 ),
        .Q(Q[2]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\data_reg_reg[7]_5 ),
        .D(\data_reg[3]_i_1__0_n_0 ),
        .Q(Q[3]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\data_reg_reg[7]_5 ),
        .D(\data_reg[4]_i_1__0_n_0 ),
        .Q(Q[4]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\data_reg_reg[7]_5 ),
        .D(\data_reg[5]_i_1__0_n_0 ),
        .Q(Q[5]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\data_reg_reg[7]_5 ),
        .D(\data_reg[6]_i_1__0_n_0 ),
        .Q(Q[6]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\data_reg_reg[7]_5 ),
        .D(\data_reg[7]_i_3__0_n_0 ),
        .Q(Q[7]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0808080808880808)) 
    digit_ready_reg_i_1
       (.I0(digit_ready_reg_i_2_n_0),
        .I1(\data_reg_reg[7]_4 ),
        .I2(i_enable4_out),
        .I3(ctl_done),
        .I4(ur_done),
        .I5(done_reg_reg_0),
        .O(digit_ready_reg_i_1_n_0));
  LUT6 #(
    .INIT(64'h0074FFFF00740000)) 
    digit_ready_reg_i_2
       (.I0(\state_reg[2]_0 ),
        .I1(\state_reg[1]_0 ),
        .I2(\state_reg[0]_0 ),
        .I3(digit_ready_reg_reg_0),
        .I4(i_enable4_out),
        .I5(ad_digit_ready),
        .O(digit_ready_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    digit_ready_reg_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(digit_ready_reg_i_1_n_0),
        .Q(ad_digit_ready),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h000000000CC80000)) 
    \digit_reg[7]_i_2 
       (.I0(\state_reg[0]_0 ),
        .I1(ur_done),
        .I2(\state_reg[2]_0 ),
        .I3(\state_reg[1]_0 ),
        .I4(\data_reg_reg[7]_2 ),
        .I5(\digit_reg[7]_i_4_n_0 ),
        .O(\digit_reg[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFFAB)) 
    \digit_reg[7]_i_4 
       (.I0(done_reg_reg_0),
        .I1(ap_start_stage2),
        .I2(\data_reg_reg[7]_3 ),
        .I3(w_freeze_ip),
        .O(\digit_reg[7]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \digit_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\digit_reg[7]_i_2_n_0 ),
        .D(D[0]),
        .Q(\digit_reg_reg[7]_0 [0]),
        .R(\digit_reg_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \digit_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\digit_reg[7]_i_2_n_0 ),
        .D(D[1]),
        .Q(\digit_reg_reg[7]_0 [1]),
        .R(\digit_reg_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \digit_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\digit_reg[7]_i_2_n_0 ),
        .D(D[2]),
        .Q(\digit_reg_reg[7]_0 [2]),
        .R(\digit_reg_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \digit_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\digit_reg[7]_i_2_n_0 ),
        .D(D[3]),
        .Q(\digit_reg_reg[7]_0 [3]),
        .R(\digit_reg_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \digit_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\digit_reg[7]_i_2_n_0 ),
        .D(D[4]),
        .Q(\digit_reg_reg[7]_0 [4]),
        .R(\digit_reg_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \digit_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\digit_reg[7]_i_2_n_0 ),
        .D(D[5]),
        .Q(\digit_reg_reg[7]_0 [5]),
        .R(\digit_reg_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \digit_reg_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\digit_reg[7]_i_2_n_0 ),
        .D(D[6]),
        .Q(\digit_reg_reg[7]_0 [6]),
        .R(\digit_reg_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \digit_reg_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\digit_reg[7]_i_2_n_0 ),
        .D(D[7]),
        .Q(\digit_reg_reg[7]_0 [7]),
        .R(\digit_reg_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h0000FFFFFF0D0000)) 
    done_reg_i_1
       (.I0(\state_reg[0]_0 ),
        .I1(\chars_reg[3]_i_3_n_0 ),
        .I2(done_reg_i_2_n_0),
        .I3(ctl_done),
        .I4(i_enable4_out),
        .I5(done_reg_reg_0),
        .O(done_reg_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    done_reg_i_2
       (.I0(\state_reg[2]_0 ),
        .I1(\state_reg[1]_0 ),
        .I2(ur_done),
        .O(done_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    done_reg_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(done_reg_i_1_n_0),
        .Q(done_reg_reg_0),
        .R(global_reset));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \error_char_reg[0]_i_1 
       (.I0(\error_char_reg_reg[7]_1 [0]),
        .I1(\state_reg[2]_0 ),
        .I2(\state_reg[0]_0 ),
        .O(error_char_next[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \error_char_reg[1]_i_1 
       (.I0(\error_char_reg_reg[7]_1 [1]),
        .I1(\state_reg[2]_0 ),
        .I2(\state_reg[0]_0 ),
        .O(error_char_next[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \error_char_reg[2]_i_1 
       (.I0(\error_char_reg_reg[7]_1 [2]),
        .I1(\state_reg[2]_0 ),
        .I2(\state_reg[0]_0 ),
        .O(error_char_next[2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \error_char_reg[3]_i_1 
       (.I0(\error_char_reg_reg[7]_1 [3]),
        .I1(\state_reg[2]_0 ),
        .I2(\state_reg[0]_0 ),
        .O(error_char_next[3]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \error_char_reg[4]_i_1 
       (.I0(\error_char_reg_reg[7]_1 [4]),
        .I1(\state_reg[2]_0 ),
        .I2(\state_reg[0]_0 ),
        .O(error_char_next[4]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \error_char_reg[5]_i_1 
       (.I0(\error_char_reg_reg[7]_1 [5]),
        .I1(\state_reg[2]_0 ),
        .I2(\state_reg[0]_0 ),
        .O(error_char_next[5]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \error_char_reg[6]_i_1 
       (.I0(\error_char_reg_reg[7]_1 [6]),
        .I1(\state_reg[2]_0 ),
        .I2(\state_reg[0]_0 ),
        .O(error_char_next[6]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \error_char_reg[7]_i_2 
       (.I0(\error_char_reg_reg[7]_1 [7]),
        .I1(\state_reg[2]_0 ),
        .I2(\state_reg[0]_0 ),
        .O(error_char_next[7]));
  FDRE #(
    .INIT(1'b0)) 
    \error_char_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\error_char_reg_reg[7]_2 ),
        .D(error_char_next[0]),
        .Q(\error_char_reg_reg[7]_0 [0]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \error_char_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\error_char_reg_reg[7]_2 ),
        .D(error_char_next[1]),
        .Q(\error_char_reg_reg[7]_0 [1]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \error_char_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\error_char_reg_reg[7]_2 ),
        .D(error_char_next[2]),
        .Q(\error_char_reg_reg[7]_0 [2]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \error_char_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\error_char_reg_reg[7]_2 ),
        .D(error_char_next[3]),
        .Q(\error_char_reg_reg[7]_0 [3]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \error_char_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\error_char_reg_reg[7]_2 ),
        .D(error_char_next[4]),
        .Q(\error_char_reg_reg[7]_0 [4]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \error_char_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\error_char_reg_reg[7]_2 ),
        .D(error_char_next[5]),
        .Q(\error_char_reg_reg[7]_0 [5]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \error_char_reg_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\error_char_reg_reg[7]_2 ),
        .D(error_char_next[6]),
        .Q(\error_char_reg_reg[7]_0 [6]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \error_char_reg_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\error_char_reg_reg[7]_2 ),
        .D(error_char_next[7]),
        .Q(\error_char_reg_reg[7]_0 [7]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h8888888B)) 
    \error_pos_reg[0]_i_1 
       (.I0(\error_pos_reg_reg[5]_0 [0]),
        .I1(ctl_done),
        .I2(\state_reg[1]_0 ),
        .I3(\state_reg[0]_0 ),
        .I4(\state_reg[2]_0 ),
        .O(\error_pos_reg[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h88888B88)) 
    \error_pos_reg[1]_i_1 
       (.I0(\error_pos_reg_reg[5]_0 [1]),
        .I1(ctl_done),
        .I2(\state_reg[2]_0 ),
        .I3(\state_reg[0]_0 ),
        .I4(\state_reg[1]_0 ),
        .O(\error_pos_reg[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h88B8)) 
    \error_pos_reg[2]_i_1 
       (.I0(\error_pos_reg_reg[5]_0 [2]),
        .I1(ctl_done),
        .I2(\state_reg[1]_0 ),
        .I3(\state_reg[0]_0 ),
        .O(\error_pos_reg[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \error_pos_reg[3]_i_1 
       (.I0(\error_pos_reg_reg[5]_0 [3]),
        .I1(ctl_done),
        .I2(\state_reg[0]_0 ),
        .I3(\state_reg[1]_0 ),
        .O(\error_pos_reg[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h88B8)) 
    \error_pos_reg[4]_i_1 
       (.I0(\error_pos_reg_reg[5]_0 [4]),
        .I1(ctl_done),
        .I2(\state_reg[2]_0 ),
        .I3(\state_reg[0]_0 ),
        .O(\error_pos_reg[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \error_pos_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\error_pos_reg_reg[5]_1 ),
        .D(\error_pos_reg[0]_i_1_n_0 ),
        .Q(\error_pos_reg_reg[5]_0 [0]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \error_pos_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\error_pos_reg_reg[5]_1 ),
        .D(\error_pos_reg[1]_i_1_n_0 ),
        .Q(\error_pos_reg_reg[5]_0 [1]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \error_pos_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\error_pos_reg_reg[5]_1 ),
        .D(\error_pos_reg[2]_i_1_n_0 ),
        .Q(\error_pos_reg_reg[5]_0 [2]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \error_pos_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\error_pos_reg_reg[5]_1 ),
        .D(\error_pos_reg[3]_i_1_n_0 ),
        .Q(\error_pos_reg_reg[5]_0 [3]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \error_pos_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\error_pos_reg_reg[5]_1 ),
        .D(\error_pos_reg[4]_i_1_n_0 ),
        .Q(\error_pos_reg_reg[5]_0 [4]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \error_pos_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\error_pos_reg_reg[5]_1 ),
        .D(ctl_done),
        .Q(\error_pos_reg_reg[5]_0 [5]),
        .R(\data_reg[7]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FECEFEFE)) 
    error_reg_i_1
       (.I0(error_reg),
        .I1(error_reg_reg_0),
        .I2(error_reg_reg_1),
        .I3(error_reg_reg_2),
        .I4(\state_reg[2]_0 ),
        .I5(\data_reg[7]_i_1__0_n_0 ),
        .O(error_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    error_reg_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(error_reg_i_1_n_0),
        .Q(error_reg),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h000000008ABA8A8A)) 
    first_number_is_2_reg_i_1
       (.I0(first_number_is_2_reg_reg_0),
        .I1(first_number_is_2_reg_i_2_n_0),
        .I2(first_number_is_2_reg_reg_1),
        .I3(\state_reg[2]_0 ),
        .I4(first_number_is_2_reg_reg_2),
        .I5(\data_reg[7]_i_1__0_n_0 ),
        .O(first_number_is_2_reg_i_1_n_0));
  LUT5 #(
    .INIT(32'hFBFFFFFF)) 
    first_number_is_2_reg_i_2
       (.I0(\state_reg[1]_0 ),
        .I1(\state_reg[0]_0 ),
        .I2(ctl_done),
        .I3(ur_done),
        .I4(i_enable4_out),
        .O(first_number_is_2_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    first_number_is_2_reg_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(first_number_is_2_reg_i_1_n_0),
        .Q(first_number_is_2_reg_reg_0),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_1
       (.I0(Q[7]),
        .I1(multOp_carry__0_n_6),
        .O(i__carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_2
       (.I0(Q[6]),
        .I1(multOp_carry__0_n_7),
        .O(i__carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_3
       (.I0(Q[5]),
        .I1(multOp_carry_n_4),
        .O(i__carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_1
       (.I0(Q[4]),
        .I1(multOp_carry_n_5),
        .O(i__carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_2
       (.I0(Q[3]),
        .I1(multOp_carry_n_6),
        .O(i__carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_3
       (.I0(Q[2]),
        .I1(multOp_carry_n_7),
        .O(i__carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_4
       (.I0(Q[1]),
        .I1(\error_char_reg_reg[7]_1 [0]),
        .O(i__carry_i_4_n_0));
  CARRY4 multOp_carry
       (.CI(1'b0),
        .CO({multOp_carry_n_0,multOp_carry_n_1,multOp_carry_n_2,multOp_carry_n_3}),
        .CYINIT(1'b0),
        .DI({i__carry_i_3_0,\error_char_reg_reg[7]_1 [3:2],1'b0}),
        .O({multOp_carry_n_4,multOp_carry_n_5,multOp_carry_n_6,multOp_carry_n_7}),
        .S({i__carry_i_3_1,\error_char_reg_reg[7]_1 [1]}));
  CARRY4 multOp_carry__0
       (.CI(multOp_carry_n_0),
        .CO({NLW_multOp_carry__0_CO_UNCONNECTED[3:1],multOp_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\error_char_reg_reg[7]_1 [3]}),
        .O({NLW_multOp_carry__0_O_UNCONNECTED[3:2],multOp_carry__0_n_6,multOp_carry__0_n_7}),
        .S({1'b0,1'b0,i__carry__0_i_2_0}));
  CARRY4 \multOp_inferred__0/i___0_carry 
       (.CI(1'b0),
        .CO({\NLW_multOp_inferred__0/i___0_carry_CO_UNCONNECTED [3:2],\multOp_inferred__0/i___0_carry_n_2 ,\multOp_inferred__0/i___0_carry_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\data_reg_reg[7]_0 ,1'b0}),
        .O({\NLW_multOp_inferred__0/i___0_carry_O_UNCONNECTED [3],multOp}),
        .S({1'b0,\data_reg_reg[7]_1 }));
  LUT6 #(
    .INIT(64'h000000002222222E)) 
    start_reg_i_1
       (.I0(start_reg_reg_0),
        .I1(i_enable4_out),
        .I2(\state_reg[2]_0 ),
        .I3(\state_reg[0]_0 ),
        .I4(\state_reg[1]_0 ),
        .I5(start_reg_reg_1),
        .O(start_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    start_reg_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(start_reg_i_1_n_0),
        .Q(start_reg_reg_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h00E2)) 
    \state[0]_i_1 
       (.I0(\state_reg[0]_0 ),
        .I1(state),
        .I2(next_state),
        .I3(\digit_reg_reg[0]_0 ),
        .O(\state[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000226E)) 
    \state[1]_i_1 
       (.I0(\state_reg[1]_0 ),
        .I1(state),
        .I2(\state_reg[0]_0 ),
        .I3(\state_reg[2]_1 ),
        .I4(\digit_reg_reg[0]_0 ),
        .O(\state[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAABFFFBF)) 
    \state[1]_i_2__0 
       (.I0(\state_reg[2]_0 ),
        .I1(\state_reg[0]_0 ),
        .I2(first_number_is_2_reg_reg_2),
        .I3(\state_reg[1]_0 ),
        .I4(\state_reg[1]_1 ),
        .O(\state_reg[2]_1 ));
  LUT6 #(
    .INIT(64'h0000000066262626)) 
    \state[2]_i_1 
       (.I0(\state_reg[2]_0 ),
        .I1(state),
        .I2(\state_reg[2]_2 ),
        .I3(\state_reg[1]_0 ),
        .I4(\state_reg[0]_0 ),
        .I5(\digit_reg_reg[0]_0 ),
        .O(\state[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000F7FF)) 
    \state[2]_i_2 
       (.I0(\state_reg[0]_0 ),
        .I1(\state_reg[2]_0 ),
        .I2(\chars_reg_reg[0]_0 ),
        .I3(\chars_reg_reg[1]_0 ),
        .I4(\state[2]_i_5_n_0 ),
        .O(state));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    \state[2]_i_4 
       (.I0(\chars_reg_reg_n_0_[1] ),
        .I1(\chars_reg_reg_n_0_[0] ),
        .I2(\chars_reg_reg_n_0_[2] ),
        .I3(\chars_reg_reg_n_0_[3] ),
        .O(\chars_reg_reg[1]_0 ));
  LUT6 #(
    .INIT(64'hFFEFEFEFFFFFFFFF)) 
    \state[2]_i_5 
       (.I0(\state[2]_i_2_0 ),
        .I1(done_reg_reg_0),
        .I2(\data_reg_reg[7]_2 ),
        .I3(\state_reg[1]_0 ),
        .I4(\state_reg[2]_0 ),
        .I5(ur_done),
        .O(\state[2]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\state[0]_i_1_n_0 ),
        .Q(\state_reg[0]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\state[1]_i_1_n_0 ),
        .Q(\state_reg[1]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\state[2]_i_1_n_0 ),
        .Q(\state_reg[2]_0 ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF2F2F0F0F0F2F0F0)) 
    update_window_i_1
       (.I0(s00_axi_aresetn),
        .I1(w_reset_ip),
        .I2(start_reg_reg_0),
        .I3(done_reg_reg_0),
        .I4(update_window),
        .I5(w_freeze_ip),
        .O(s00_axi_aresetn_0));
endmodule

(* ORIG_REF_NAME = "baud_rate_generator" *) 
module mbblockdesign_as_1_0_baud_rate_generator
   (bd_gen_tick,
    global_reset,
    E,
    s00_axi_aclk,
    s00_axi_aresetn,
    w_reset_ip,
    o_baud_enable,
    i_enable4_out);
  output bd_gen_tick;
  input global_reset;
  input [0:0]E;
  input s00_axi_aclk;
  input s00_axi_aresetn;
  input w_reset_ip;
  input o_baud_enable;
  input i_enable4_out;

  wire [0:0]E;
  wire bd_gen_tick;
  wire global_reset;
  wire i_enable4_out;
  wire o_baud_enable;
  wire overflow;
  wire overflow_i_1_n_0;
  wire overflow_i_3_n_0;
  wire prev_enable;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire [9:0]value;
  wire \value[0]_i_2_n_0 ;
  wire \value[1]_i_1_n_0 ;
  wire \value[2]_i_2_n_0 ;
  wire \value[2]_i_3_n_0 ;
  wire \value[5]_i_2_n_0 ;
  wire \value[9]_i_1_n_0 ;
  wire \value[9]_i_3_n_0 ;
  wire \value[9]_i_4_n_0 ;
  wire \value_reg_n_0_[0] ;
  wire \value_reg_n_0_[1] ;
  wire \value_reg_n_0_[2] ;
  wire \value_reg_n_0_[3] ;
  wire \value_reg_n_0_[4] ;
  wire \value_reg_n_0_[5] ;
  wire \value_reg_n_0_[6] ;
  wire \value_reg_n_0_[7] ;
  wire \value_reg_n_0_[8] ;
  wire \value_reg_n_0_[9] ;
  wire w_reset_ip;

  LUT6 #(
    .INIT(64'h00C000A0000000A0)) 
    overflow_i_1
       (.I0(bd_gen_tick),
        .I1(overflow),
        .I2(s00_axi_aresetn),
        .I3(w_reset_ip),
        .I4(E),
        .I5(prev_enable),
        .O(overflow_i_1_n_0));
  LUT5 #(
    .INIT(32'h00200000)) 
    overflow_i_2
       (.I0(\value_reg_n_0_[7] ),
        .I1(\value_reg_n_0_[8] ),
        .I2(overflow_i_3_n_0),
        .I3(\value_reg_n_0_[6] ),
        .I4(\value_reg_n_0_[9] ),
        .O(overflow));
  LUT6 #(
    .INIT(64'h0000000000040000)) 
    overflow_i_3
       (.I0(\value_reg_n_0_[4] ),
        .I1(\value_reg_n_0_[1] ),
        .I2(\value_reg_n_0_[0] ),
        .I3(\value_reg_n_0_[2] ),
        .I4(\value_reg_n_0_[3] ),
        .I5(\value_reg_n_0_[5] ),
        .O(overflow_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    overflow_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(overflow_i_1_n_0),
        .Q(bd_gen_tick),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    prev_enable_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(E),
        .Q(prev_enable),
        .R(global_reset));
  LUT6 #(
    .INIT(64'h10000000FEFFFFFF)) 
    \value[0]_i_1 
       (.I0(\value_reg_n_0_[6] ),
        .I1(\value_reg_n_0_[8] ),
        .I2(\value[0]_i_2_n_0 ),
        .I3(\value_reg_n_0_[7] ),
        .I4(\value_reg_n_0_[9] ),
        .I5(\value_reg_n_0_[0] ),
        .O(value[0]));
  LUT6 #(
    .INIT(64'h00000000FEFFFFFF)) 
    \value[0]_i_2 
       (.I0(\value_reg_n_0_[5] ),
        .I1(\value_reg_n_0_[4] ),
        .I2(\value_reg_n_0_[2] ),
        .I3(\value_reg_n_0_[1] ),
        .I4(\value_reg_n_0_[3] ),
        .I5(\value_reg_n_0_[0] ),
        .O(\value[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h51FFFFFFA2FF0000)) 
    \value[1]_i_1 
       (.I0(\value_reg_n_0_[0] ),
        .I1(\value_reg_n_0_[9] ),
        .I2(\value[2]_i_2_n_0 ),
        .I3(prev_enable),
        .I4(E),
        .I5(\value_reg_n_0_[1] ),
        .O(\value[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h0BBBB000)) 
    \value[2]_i_1 
       (.I0(\value[2]_i_2_n_0 ),
        .I1(\value_reg_n_0_[9] ),
        .I2(\value_reg_n_0_[1] ),
        .I3(\value_reg_n_0_[0] ),
        .I4(\value_reg_n_0_[2] ),
        .O(value[2]));
  LUT4 #(
    .INIT(16'hFEFF)) 
    \value[2]_i_2 
       (.I0(\value_reg_n_0_[6] ),
        .I1(\value[2]_i_3_n_0 ),
        .I2(\value_reg_n_0_[8] ),
        .I3(\value_reg_n_0_[7] ),
        .O(\value[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFBFFFF)) 
    \value[2]_i_3 
       (.I0(\value_reg_n_0_[4] ),
        .I1(\value_reg_n_0_[1] ),
        .I2(\value_reg_n_0_[2] ),
        .I3(\value_reg_n_0_[0] ),
        .I4(\value_reg_n_0_[3] ),
        .I5(\value_reg_n_0_[5] ),
        .O(\value[2]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h28888888)) 
    \value[3]_i_1 
       (.I0(\value[9]_i_3_n_0 ),
        .I1(\value_reg_n_0_[3] ),
        .I2(\value_reg_n_0_[2] ),
        .I3(\value_reg_n_0_[0] ),
        .I4(\value_reg_n_0_[1] ),
        .O(value[3]));
  LUT6 #(
    .INIT(64'h2888888888888888)) 
    \value[4]_i_1 
       (.I0(\value[9]_i_3_n_0 ),
        .I1(\value_reg_n_0_[4] ),
        .I2(\value_reg_n_0_[1] ),
        .I3(\value_reg_n_0_[0] ),
        .I4(\value_reg_n_0_[2] ),
        .I5(\value_reg_n_0_[3] ),
        .O(value[4]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \value[5]_i_1 
       (.I0(\value[9]_i_3_n_0 ),
        .I1(\value_reg_n_0_[5] ),
        .I2(\value[5]_i_2_n_0 ),
        .O(value[5]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \value[5]_i_2 
       (.I0(\value_reg_n_0_[3] ),
        .I1(\value_reg_n_0_[2] ),
        .I2(\value_reg_n_0_[0] ),
        .I3(\value_reg_n_0_[1] ),
        .I4(\value_reg_n_0_[4] ),
        .O(\value[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \value[6]_i_1 
       (.I0(\value[9]_i_3_n_0 ),
        .I1(\value_reg_n_0_[6] ),
        .I2(\value[9]_i_4_n_0 ),
        .O(value[6]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \value[7]_i_1 
       (.I0(\value[9]_i_3_n_0 ),
        .I1(\value_reg_n_0_[7] ),
        .I2(\value[9]_i_4_n_0 ),
        .I3(\value_reg_n_0_[6] ),
        .O(value[7]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h28888888)) 
    \value[8]_i_1 
       (.I0(\value[9]_i_3_n_0 ),
        .I1(\value_reg_n_0_[8] ),
        .I2(\value_reg_n_0_[6] ),
        .I3(\value[9]_i_4_n_0 ),
        .I4(\value_reg_n_0_[7] ),
        .O(value[8]));
  LUT5 #(
    .INIT(32'hFF40FFFF)) 
    \value[9]_i_1 
       (.I0(prev_enable),
        .I1(o_baud_enable),
        .I2(i_enable4_out),
        .I3(w_reset_ip),
        .I4(s00_axi_aresetn),
        .O(\value[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2888888888888888)) 
    \value[9]_i_2 
       (.I0(\value[9]_i_3_n_0 ),
        .I1(\value_reg_n_0_[9] ),
        .I2(\value_reg_n_0_[6] ),
        .I3(\value[9]_i_4_n_0 ),
        .I4(\value_reg_n_0_[8] ),
        .I5(\value_reg_n_0_[7] ),
        .O(value[9]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \value[9]_i_3 
       (.I0(\value[2]_i_2_n_0 ),
        .I1(\value_reg_n_0_[9] ),
        .O(\value[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \value[9]_i_4 
       (.I0(\value_reg_n_0_[4] ),
        .I1(\value_reg_n_0_[1] ),
        .I2(\value_reg_n_0_[0] ),
        .I3(\value_reg_n_0_[2] ),
        .I4(\value_reg_n_0_[3] ),
        .I5(\value_reg_n_0_[5] ),
        .O(\value[9]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \value_reg[0] 
       (.C(s00_axi_aclk),
        .CE(E),
        .D(value[0]),
        .Q(\value_reg_n_0_[0] ),
        .R(\value[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \value_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\value[1]_i_1_n_0 ),
        .Q(\value_reg_n_0_[1] ),
        .R(global_reset));
  FDRE #(
    .INIT(1'b0)) 
    \value_reg[2] 
       (.C(s00_axi_aclk),
        .CE(E),
        .D(value[2]),
        .Q(\value_reg_n_0_[2] ),
        .R(\value[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \value_reg[3] 
       (.C(s00_axi_aclk),
        .CE(E),
        .D(value[3]),
        .Q(\value_reg_n_0_[3] ),
        .R(\value[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \value_reg[4] 
       (.C(s00_axi_aclk),
        .CE(E),
        .D(value[4]),
        .Q(\value_reg_n_0_[4] ),
        .R(\value[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \value_reg[5] 
       (.C(s00_axi_aclk),
        .CE(E),
        .D(value[5]),
        .Q(\value_reg_n_0_[5] ),
        .R(\value[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \value_reg[6] 
       (.C(s00_axi_aclk),
        .CE(E),
        .D(value[6]),
        .Q(\value_reg_n_0_[6] ),
        .R(\value[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \value_reg[7] 
       (.C(s00_axi_aclk),
        .CE(E),
        .D(value[7]),
        .Q(\value_reg_n_0_[7] ),
        .R(\value[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \value_reg[8] 
       (.C(s00_axi_aclk),
        .CE(E),
        .D(value[8]),
        .Q(\value_reg_n_0_[8] ),
        .R(\value[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \value_reg[9] 
       (.C(s00_axi_aclk),
        .CE(E),
        .D(value[9]),
        .Q(\value_reg_n_0_[9] ),
        .R(\value[9]_i_1_n_0 ));
endmodule

(* ORIG_REF_NAME = "control_timer" *) 
module mbblockdesign_as_1_0_control_timer
   (ctl_done,
    \SCSR0_reg_reg[7] ,
    o_done_reg_0,
    config_done_reg_reg_0,
    o_done_reg_1,
    i_enable4_out,
    o_tx,
    powerup_done_reg_reg_0,
    done_reg_reg,
    \SCSR0_reg_reg[7]_0 ,
    done_reg_reg_0,
    clk_counter,
    s00_axi_aclk,
    \clk_counter_reg[0]_0 ,
    ap_start_stage2,
    \clk_counter_reg[0]_1 ,
    w_freeze_ip,
    \error_pos_reg_reg[5] ,
    ur_done,
    \data_reg_reg[7] ,
    \ms_counter_reg[0]_0 ,
    s00_axi_aresetn,
    w_reset_ip,
    o_tx_0,
    w_auto_restart,
    global_reset);
  output ctl_done;
  output \SCSR0_reg_reg[7] ;
  output [0:0]o_done_reg_0;
  output config_done_reg_reg_0;
  output [0:0]o_done_reg_1;
  output i_enable4_out;
  output o_tx;
  output [0:0]powerup_done_reg_reg_0;
  output done_reg_reg;
  output \SCSR0_reg_reg[7]_0 ;
  output done_reg_reg_0;
  input clk_counter;
  input s00_axi_aclk;
  input \clk_counter_reg[0]_0 ;
  input ap_start_stage2;
  input \clk_counter_reg[0]_1 ;
  input w_freeze_ip;
  input \error_pos_reg_reg[5] ;
  input ur_done;
  input \data_reg_reg[7] ;
  input \ms_counter_reg[0]_0 ;
  input s00_axi_aresetn;
  input w_reset_ip;
  input o_tx_0;
  input w_auto_restart;
  input global_reset;

  wire \SCSR0_reg_reg[7] ;
  wire \SCSR0_reg_reg[7]_0 ;
  wire ap_start_stage2;
  wire clk_counter;
  wire \clk_counter[0]_i_1_n_0 ;
  wire \clk_counter[0]_i_4_n_0 ;
  wire [16:0]clk_counter_reg;
  wire \clk_counter_reg[0]_0 ;
  wire \clk_counter_reg[0]_1 ;
  wire \clk_counter_reg[0]_i_3_n_0 ;
  wire \clk_counter_reg[0]_i_3_n_1 ;
  wire \clk_counter_reg[0]_i_3_n_2 ;
  wire \clk_counter_reg[0]_i_3_n_3 ;
  wire \clk_counter_reg[0]_i_3_n_4 ;
  wire \clk_counter_reg[0]_i_3_n_5 ;
  wire \clk_counter_reg[0]_i_3_n_6 ;
  wire \clk_counter_reg[0]_i_3_n_7 ;
  wire \clk_counter_reg[12]_i_1_n_0 ;
  wire \clk_counter_reg[12]_i_1_n_1 ;
  wire \clk_counter_reg[12]_i_1_n_2 ;
  wire \clk_counter_reg[12]_i_1_n_3 ;
  wire \clk_counter_reg[12]_i_1_n_4 ;
  wire \clk_counter_reg[12]_i_1_n_5 ;
  wire \clk_counter_reg[12]_i_1_n_6 ;
  wire \clk_counter_reg[12]_i_1_n_7 ;
  wire \clk_counter_reg[16]_i_1_n_7 ;
  wire \clk_counter_reg[4]_i_1_n_0 ;
  wire \clk_counter_reg[4]_i_1_n_1 ;
  wire \clk_counter_reg[4]_i_1_n_2 ;
  wire \clk_counter_reg[4]_i_1_n_3 ;
  wire \clk_counter_reg[4]_i_1_n_4 ;
  wire \clk_counter_reg[4]_i_1_n_5 ;
  wire \clk_counter_reg[4]_i_1_n_6 ;
  wire \clk_counter_reg[4]_i_1_n_7 ;
  wire \clk_counter_reg[8]_i_1_n_0 ;
  wire \clk_counter_reg[8]_i_1_n_1 ;
  wire \clk_counter_reg[8]_i_1_n_2 ;
  wire \clk_counter_reg[8]_i_1_n_3 ;
  wire \clk_counter_reg[8]_i_1_n_4 ;
  wire \clk_counter_reg[8]_i_1_n_5 ;
  wire \clk_counter_reg[8]_i_1_n_6 ;
  wire \clk_counter_reg[8]_i_1_n_7 ;
  wire config_done_reg_i_1_n_0;
  wire config_done_reg_reg_0;
  wire ctl_done;
  wire \data_reg_reg[7] ;
  wire done_next;
  wire done_reg_reg;
  wire done_reg_reg_0;
  wire \error_pos_reg_reg[5] ;
  wire global_reset;
  wire i_enable4_out;
  wire ms_counter;
  wire \ms_counter[0]_i_1_n_0 ;
  wire \ms_counter[0]_i_4_n_0 ;
  wire \ms_counter[0]_i_5_n_0 ;
  wire \ms_counter[0]_i_6_n_0 ;
  wire \ms_counter[0]_i_7_n_0 ;
  wire \ms_counter[0]_i_8_n_0 ;
  wire ms_counter_next1_carry__0_i_1_n_0;
  wire ms_counter_next1_carry__0_i_2_n_0;
  wire ms_counter_next1_carry__0_i_3_n_0;
  wire ms_counter_next1_carry__0_i_4_n_0;
  wire ms_counter_next1_carry__0_n_0;
  wire ms_counter_next1_carry__0_n_1;
  wire ms_counter_next1_carry__0_n_2;
  wire ms_counter_next1_carry__0_n_3;
  wire ms_counter_next1_carry__1_i_1_n_0;
  wire ms_counter_next1_carry__1_i_2_n_0;
  wire ms_counter_next1_carry__1_i_3_n_0;
  wire ms_counter_next1_carry__1_i_4_n_0;
  wire ms_counter_next1_carry__1_n_0;
  wire ms_counter_next1_carry__1_n_1;
  wire ms_counter_next1_carry__1_n_2;
  wire ms_counter_next1_carry__1_n_3;
  wire ms_counter_next1_carry__2_i_1_n_0;
  wire ms_counter_next1_carry__2_i_2_n_0;
  wire ms_counter_next1_carry__2_i_3_n_0;
  wire ms_counter_next1_carry__2_i_4_n_0;
  wire ms_counter_next1_carry__2_n_0;
  wire ms_counter_next1_carry__2_n_1;
  wire ms_counter_next1_carry__2_n_2;
  wire ms_counter_next1_carry__2_n_3;
  wire ms_counter_next1_carry_i_1_n_0;
  wire ms_counter_next1_carry_i_2_n_0;
  wire ms_counter_next1_carry_i_3_n_0;
  wire ms_counter_next1_carry_i_4_n_0;
  wire ms_counter_next1_carry_i_5_n_0;
  wire ms_counter_next1_carry_i_6_n_0;
  wire ms_counter_next1_carry_i_7_n_0;
  wire ms_counter_next1_carry_i_8_n_0;
  wire ms_counter_next1_carry_n_0;
  wire ms_counter_next1_carry_n_1;
  wire ms_counter_next1_carry_n_2;
  wire ms_counter_next1_carry_n_3;
  wire [5:1]ms_counter_next2;
  wire ms_counter_next2_carry_i_1_n_0;
  wire ms_counter_next2_carry_i_2_n_0;
  wire ms_counter_next2_carry_i_3_n_0;
  wire ms_counter_next2_carry_i_4_n_0;
  wire ms_counter_next2_carry_n_0;
  wire ms_counter_next2_carry_n_1;
  wire ms_counter_next2_carry_n_2;
  wire ms_counter_next2_carry_n_3;
  wire [31:0]ms_counter_reg;
  wire \ms_counter_reg[0]_0 ;
  wire \ms_counter_reg[0]_i_3_n_0 ;
  wire \ms_counter_reg[0]_i_3_n_1 ;
  wire \ms_counter_reg[0]_i_3_n_2 ;
  wire \ms_counter_reg[0]_i_3_n_3 ;
  wire \ms_counter_reg[0]_i_3_n_4 ;
  wire \ms_counter_reg[0]_i_3_n_5 ;
  wire \ms_counter_reg[0]_i_3_n_6 ;
  wire \ms_counter_reg[0]_i_3_n_7 ;
  wire \ms_counter_reg[12]_i_1_n_0 ;
  wire \ms_counter_reg[12]_i_1_n_1 ;
  wire \ms_counter_reg[12]_i_1_n_2 ;
  wire \ms_counter_reg[12]_i_1_n_3 ;
  wire \ms_counter_reg[12]_i_1_n_4 ;
  wire \ms_counter_reg[12]_i_1_n_5 ;
  wire \ms_counter_reg[12]_i_1_n_6 ;
  wire \ms_counter_reg[12]_i_1_n_7 ;
  wire \ms_counter_reg[16]_i_1_n_0 ;
  wire \ms_counter_reg[16]_i_1_n_1 ;
  wire \ms_counter_reg[16]_i_1_n_2 ;
  wire \ms_counter_reg[16]_i_1_n_3 ;
  wire \ms_counter_reg[16]_i_1_n_4 ;
  wire \ms_counter_reg[16]_i_1_n_5 ;
  wire \ms_counter_reg[16]_i_1_n_6 ;
  wire \ms_counter_reg[16]_i_1_n_7 ;
  wire \ms_counter_reg[20]_i_1_n_0 ;
  wire \ms_counter_reg[20]_i_1_n_1 ;
  wire \ms_counter_reg[20]_i_1_n_2 ;
  wire \ms_counter_reg[20]_i_1_n_3 ;
  wire \ms_counter_reg[20]_i_1_n_4 ;
  wire \ms_counter_reg[20]_i_1_n_5 ;
  wire \ms_counter_reg[20]_i_1_n_6 ;
  wire \ms_counter_reg[20]_i_1_n_7 ;
  wire \ms_counter_reg[24]_i_1_n_0 ;
  wire \ms_counter_reg[24]_i_1_n_1 ;
  wire \ms_counter_reg[24]_i_1_n_2 ;
  wire \ms_counter_reg[24]_i_1_n_3 ;
  wire \ms_counter_reg[24]_i_1_n_4 ;
  wire \ms_counter_reg[24]_i_1_n_5 ;
  wire \ms_counter_reg[24]_i_1_n_6 ;
  wire \ms_counter_reg[24]_i_1_n_7 ;
  wire \ms_counter_reg[28]_i_1_n_1 ;
  wire \ms_counter_reg[28]_i_1_n_2 ;
  wire \ms_counter_reg[28]_i_1_n_3 ;
  wire \ms_counter_reg[28]_i_1_n_4 ;
  wire \ms_counter_reg[28]_i_1_n_5 ;
  wire \ms_counter_reg[28]_i_1_n_6 ;
  wire \ms_counter_reg[28]_i_1_n_7 ;
  wire \ms_counter_reg[4]_i_1_n_0 ;
  wire \ms_counter_reg[4]_i_1_n_1 ;
  wire \ms_counter_reg[4]_i_1_n_2 ;
  wire \ms_counter_reg[4]_i_1_n_3 ;
  wire \ms_counter_reg[4]_i_1_n_4 ;
  wire \ms_counter_reg[4]_i_1_n_5 ;
  wire \ms_counter_reg[4]_i_1_n_6 ;
  wire \ms_counter_reg[4]_i_1_n_7 ;
  wire \ms_counter_reg[8]_i_1_n_0 ;
  wire \ms_counter_reg[8]_i_1_n_1 ;
  wire \ms_counter_reg[8]_i_1_n_2 ;
  wire \ms_counter_reg[8]_i_1_n_3 ;
  wire \ms_counter_reg[8]_i_1_n_4 ;
  wire \ms_counter_reg[8]_i_1_n_5 ;
  wire \ms_counter_reg[8]_i_1_n_6 ;
  wire \ms_counter_reg[8]_i_1_n_7 ;
  wire [7:7]ms_target;
  wire \ms_target[0]_i_1_n_0 ;
  wire \ms_target[1]_i_1_n_0 ;
  wire \ms_target[2]_i_1_n_0 ;
  wire \ms_target[4]_i_1_n_0 ;
  wire \ms_target[6]_i_1_n_0 ;
  wire \ms_target[6]_i_2_n_0 ;
  wire \ms_target[7]_i_1_n_0 ;
  wire \ms_target_reg_n_0_[0] ;
  wire \ms_target_reg_n_0_[1] ;
  wire \ms_target_reg_n_0_[2] ;
  wire \ms_target_reg_n_0_[4] ;
  wire \ms_target_reg_n_0_[6] ;
  wire \ms_target_reg_n_0_[7] ;
  wire o_done_i_1_n_0;
  wire [0:0]o_done_reg_0;
  wire [0:0]o_done_reg_1;
  wire o_tx;
  wire o_tx_0;
  wire powerup_done_reg_i_1_n_0;
  wire [0:0]powerup_done_reg_reg_0;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire \state[0]_i_1_n_0 ;
  wire \state[1]_i_1_n_0 ;
  wire \state_reg_n_0_[0] ;
  wire ur_done;
  wire w_auto_restart;
  wire w_freeze_ip;
  wire w_reset_ip;
  wire [3:0]\NLW_clk_counter_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_clk_counter_reg[16]_i_1_O_UNCONNECTED ;
  wire [3:0]NLW_ms_counter_next1_carry_O_UNCONNECTED;
  wire [3:0]NLW_ms_counter_next1_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_ms_counter_next1_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_ms_counter_next1_carry__2_O_UNCONNECTED;
  wire [3:1]NLW_ms_counter_next1_carry_i_9_CO_UNCONNECTED;
  wire [3:0]NLW_ms_counter_next1_carry_i_9_O_UNCONNECTED;
  wire [3:3]\NLW_ms_counter_reg[28]_i_1_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hBBBBBBBBFBFBFBBB)) 
    \clk_counter[0]_i_1 
       (.I0(ms_counter),
        .I1(\clk_counter_reg[0]_0 ),
        .I2(\ms_counter_reg[0]_0 ),
        .I3(ap_start_stage2),
        .I4(\clk_counter_reg[0]_1 ),
        .I5(w_freeze_ip),
        .O(\clk_counter[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \clk_counter[0]_i_4 
       (.I0(clk_counter_reg[0]),
        .O(\clk_counter[0]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[0] 
       (.C(s00_axi_aclk),
        .CE(clk_counter),
        .D(\clk_counter_reg[0]_i_3_n_7 ),
        .Q(clk_counter_reg[0]),
        .R(\clk_counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_counter_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\clk_counter_reg[0]_i_3_n_0 ,\clk_counter_reg[0]_i_3_n_1 ,\clk_counter_reg[0]_i_3_n_2 ,\clk_counter_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\clk_counter_reg[0]_i_3_n_4 ,\clk_counter_reg[0]_i_3_n_5 ,\clk_counter_reg[0]_i_3_n_6 ,\clk_counter_reg[0]_i_3_n_7 }),
        .S({clk_counter_reg[3:1],\clk_counter[0]_i_4_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[10] 
       (.C(s00_axi_aclk),
        .CE(clk_counter),
        .D(\clk_counter_reg[8]_i_1_n_5 ),
        .Q(clk_counter_reg[10]),
        .R(\clk_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[11] 
       (.C(s00_axi_aclk),
        .CE(clk_counter),
        .D(\clk_counter_reg[8]_i_1_n_4 ),
        .Q(clk_counter_reg[11]),
        .R(\clk_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[12] 
       (.C(s00_axi_aclk),
        .CE(clk_counter),
        .D(\clk_counter_reg[12]_i_1_n_7 ),
        .Q(clk_counter_reg[12]),
        .R(\clk_counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_counter_reg[12]_i_1 
       (.CI(\clk_counter_reg[8]_i_1_n_0 ),
        .CO({\clk_counter_reg[12]_i_1_n_0 ,\clk_counter_reg[12]_i_1_n_1 ,\clk_counter_reg[12]_i_1_n_2 ,\clk_counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_counter_reg[12]_i_1_n_4 ,\clk_counter_reg[12]_i_1_n_5 ,\clk_counter_reg[12]_i_1_n_6 ,\clk_counter_reg[12]_i_1_n_7 }),
        .S(clk_counter_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[13] 
       (.C(s00_axi_aclk),
        .CE(clk_counter),
        .D(\clk_counter_reg[12]_i_1_n_6 ),
        .Q(clk_counter_reg[13]),
        .R(\clk_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[14] 
       (.C(s00_axi_aclk),
        .CE(clk_counter),
        .D(\clk_counter_reg[12]_i_1_n_5 ),
        .Q(clk_counter_reg[14]),
        .R(\clk_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[15] 
       (.C(s00_axi_aclk),
        .CE(clk_counter),
        .D(\clk_counter_reg[12]_i_1_n_4 ),
        .Q(clk_counter_reg[15]),
        .R(\clk_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[16] 
       (.C(s00_axi_aclk),
        .CE(clk_counter),
        .D(\clk_counter_reg[16]_i_1_n_7 ),
        .Q(clk_counter_reg[16]),
        .R(\clk_counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_counter_reg[16]_i_1 
       (.CI(\clk_counter_reg[12]_i_1_n_0 ),
        .CO(\NLW_clk_counter_reg[16]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_clk_counter_reg[16]_i_1_O_UNCONNECTED [3:1],\clk_counter_reg[16]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,clk_counter_reg[16]}));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[1] 
       (.C(s00_axi_aclk),
        .CE(clk_counter),
        .D(\clk_counter_reg[0]_i_3_n_6 ),
        .Q(clk_counter_reg[1]),
        .R(\clk_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[2] 
       (.C(s00_axi_aclk),
        .CE(clk_counter),
        .D(\clk_counter_reg[0]_i_3_n_5 ),
        .Q(clk_counter_reg[2]),
        .R(\clk_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[3] 
       (.C(s00_axi_aclk),
        .CE(clk_counter),
        .D(\clk_counter_reg[0]_i_3_n_4 ),
        .Q(clk_counter_reg[3]),
        .R(\clk_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[4] 
       (.C(s00_axi_aclk),
        .CE(clk_counter),
        .D(\clk_counter_reg[4]_i_1_n_7 ),
        .Q(clk_counter_reg[4]),
        .R(\clk_counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_counter_reg[4]_i_1 
       (.CI(\clk_counter_reg[0]_i_3_n_0 ),
        .CO({\clk_counter_reg[4]_i_1_n_0 ,\clk_counter_reg[4]_i_1_n_1 ,\clk_counter_reg[4]_i_1_n_2 ,\clk_counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_counter_reg[4]_i_1_n_4 ,\clk_counter_reg[4]_i_1_n_5 ,\clk_counter_reg[4]_i_1_n_6 ,\clk_counter_reg[4]_i_1_n_7 }),
        .S(clk_counter_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[5] 
       (.C(s00_axi_aclk),
        .CE(clk_counter),
        .D(\clk_counter_reg[4]_i_1_n_6 ),
        .Q(clk_counter_reg[5]),
        .R(\clk_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[6] 
       (.C(s00_axi_aclk),
        .CE(clk_counter),
        .D(\clk_counter_reg[4]_i_1_n_5 ),
        .Q(clk_counter_reg[6]),
        .R(\clk_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[7] 
       (.C(s00_axi_aclk),
        .CE(clk_counter),
        .D(\clk_counter_reg[4]_i_1_n_4 ),
        .Q(clk_counter_reg[7]),
        .R(\clk_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[8] 
       (.C(s00_axi_aclk),
        .CE(clk_counter),
        .D(\clk_counter_reg[8]_i_1_n_7 ),
        .Q(clk_counter_reg[8]),
        .R(\clk_counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_counter_reg[8]_i_1 
       (.CI(\clk_counter_reg[4]_i_1_n_0 ),
        .CO({\clk_counter_reg[8]_i_1_n_0 ,\clk_counter_reg[8]_i_1_n_1 ,\clk_counter_reg[8]_i_1_n_2 ,\clk_counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_counter_reg[8]_i_1_n_4 ,\clk_counter_reg[8]_i_1_n_5 ,\clk_counter_reg[8]_i_1_n_6 ,\clk_counter_reg[8]_i_1_n_7 }),
        .S(clk_counter_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[9] 
       (.C(s00_axi_aclk),
        .CE(clk_counter),
        .D(\clk_counter_reg[8]_i_1_n_6 ),
        .Q(clk_counter_reg[9]),
        .R(\clk_counter[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0020)) 
    config_done_reg_i_1
       (.I0(\state_reg_n_0_[0] ),
        .I1(ms_counter_next1_carry__2_n_0),
        .I2(ms_counter),
        .I3(done_next),
        .I4(config_done_reg_reg_0),
        .O(config_done_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    config_done_reg_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(config_done_reg_i_1_n_0),
        .Q(config_done_reg_reg_0),
        .R(global_reset));
  LUT4 #(
    .INIT(16'h0040)) 
    \data_reg[7]_i_2 
       (.I0(ctl_done),
        .I1(ur_done),
        .I2(i_enable4_out),
        .I3(\data_reg_reg[7] ),
        .O(o_done_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h00A8)) 
    \data_reg[7]_i_3 
       (.I0(config_done_reg_reg_0),
        .I1(ap_start_stage2),
        .I2(\clk_counter_reg[0]_1 ),
        .I3(w_freeze_ip),
        .O(i_enable4_out));
  LUT5 #(
    .INIT(32'hFF40FFFF)) 
    \digit_reg[7]_i_1 
       (.I0(\ms_counter_reg[0]_0 ),
        .I1(i_enable4_out),
        .I2(ctl_done),
        .I3(w_reset_ip),
        .I4(s00_axi_aresetn),
        .O(done_reg_reg));
  LUT6 #(
    .INIT(64'hFFFFFFFF00008880)) 
    \error_pos_reg[5]_i_1 
       (.I0(ctl_done),
        .I1(config_done_reg_reg_0),
        .I2(ap_start_stage2),
        .I3(\clk_counter_reg[0]_1 ),
        .I4(w_freeze_ip),
        .I5(\error_pos_reg_reg[5] ),
        .O(o_done_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h54000000)) 
    error_reg_i_2
       (.I0(w_freeze_ip),
        .I1(\clk_counter_reg[0]_1 ),
        .I2(ap_start_stage2),
        .I3(config_done_reg_reg_0),
        .I4(ctl_done),
        .O(\SCSR0_reg_reg[7]_0 ));
  LUT6 #(
    .INIT(64'hDDFDFFFFDDFDDDFD)) 
    \ms_counter[0]_i_1 
       (.I0(s00_axi_aresetn),
        .I1(w_reset_ip),
        .I2(\ms_counter_reg[0]_0 ),
        .I3(\SCSR0_reg_reg[7] ),
        .I4(ms_counter_next1_carry__2_n_0),
        .I5(ms_counter),
        .O(\ms_counter[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000EAAA)) 
    \ms_counter[0]_i_2 
       (.I0(\ms_counter[0]_i_4_n_0 ),
        .I1(\ms_counter[0]_i_5_n_0 ),
        .I2(clk_counter_reg[9]),
        .I3(clk_counter_reg[10]),
        .I4(\ms_counter[0]_i_6_n_0 ),
        .O(ms_counter));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \ms_counter[0]_i_4 
       (.I0(clk_counter_reg[11]),
        .I1(clk_counter_reg[14]),
        .I2(clk_counter_reg[12]),
        .I3(clk_counter_reg[13]),
        .O(\ms_counter[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFBAAAA)) 
    \ms_counter[0]_i_5 
       (.I0(clk_counter_reg[8]),
        .I1(\ms_counter[0]_i_8_n_0 ),
        .I2(clk_counter_reg[5]),
        .I3(clk_counter_reg[6]),
        .I4(clk_counter_reg[7]),
        .O(\ms_counter[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFABFFFFFFFFFFFF)) 
    \ms_counter[0]_i_6 
       (.I0(w_freeze_ip),
        .I1(\clk_counter_reg[0]_1 ),
        .I2(ap_start_stage2),
        .I3(\ms_counter_reg[0]_0 ),
        .I4(clk_counter_reg[15]),
        .I5(clk_counter_reg[16]),
        .O(\ms_counter[0]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \ms_counter[0]_i_7 
       (.I0(ms_counter_reg[0]),
        .O(\ms_counter[0]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \ms_counter[0]_i_8 
       (.I0(clk_counter_reg[3]),
        .I1(clk_counter_reg[4]),
        .I2(clk_counter_reg[0]),
        .I3(clk_counter_reg[2]),
        .I4(clk_counter_reg[1]),
        .O(\ms_counter[0]_i_8_n_0 ));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 ms_counter_next1_carry
       (.CI(1'b0),
        .CO({ms_counter_next1_carry_n_0,ms_counter_next1_carry_n_1,ms_counter_next1_carry_n_2,ms_counter_next1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({ms_counter_next1_carry_i_1_n_0,ms_counter_next1_carry_i_2_n_0,ms_counter_next1_carry_i_3_n_0,ms_counter_next1_carry_i_4_n_0}),
        .O(NLW_ms_counter_next1_carry_O_UNCONNECTED[3:0]),
        .S({ms_counter_next1_carry_i_5_n_0,ms_counter_next1_carry_i_6_n_0,ms_counter_next1_carry_i_7_n_0,ms_counter_next1_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 ms_counter_next1_carry__0
       (.CI(ms_counter_next1_carry_n_0),
        .CO({ms_counter_next1_carry__0_n_0,ms_counter_next1_carry__0_n_1,ms_counter_next1_carry__0_n_2,ms_counter_next1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_ms_counter_next1_carry__0_O_UNCONNECTED[3:0]),
        .S({ms_counter_next1_carry__0_i_1_n_0,ms_counter_next1_carry__0_i_2_n_0,ms_counter_next1_carry__0_i_3_n_0,ms_counter_next1_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h1)) 
    ms_counter_next1_carry__0_i_1
       (.I0(ms_counter_reg[15]),
        .I1(ms_counter_reg[14]),
        .O(ms_counter_next1_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    ms_counter_next1_carry__0_i_2
       (.I0(ms_counter_reg[13]),
        .I1(ms_counter_reg[12]),
        .O(ms_counter_next1_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    ms_counter_next1_carry__0_i_3
       (.I0(ms_counter_reg[11]),
        .I1(ms_counter_reg[10]),
        .O(ms_counter_next1_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    ms_counter_next1_carry__0_i_4
       (.I0(ms_counter_reg[9]),
        .I1(ms_counter_reg[8]),
        .O(ms_counter_next1_carry__0_i_4_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 ms_counter_next1_carry__1
       (.CI(ms_counter_next1_carry__0_n_0),
        .CO({ms_counter_next1_carry__1_n_0,ms_counter_next1_carry__1_n_1,ms_counter_next1_carry__1_n_2,ms_counter_next1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_ms_counter_next1_carry__1_O_UNCONNECTED[3:0]),
        .S({ms_counter_next1_carry__1_i_1_n_0,ms_counter_next1_carry__1_i_2_n_0,ms_counter_next1_carry__1_i_3_n_0,ms_counter_next1_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h1)) 
    ms_counter_next1_carry__1_i_1
       (.I0(ms_counter_reg[23]),
        .I1(ms_counter_reg[22]),
        .O(ms_counter_next1_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    ms_counter_next1_carry__1_i_2
       (.I0(ms_counter_reg[21]),
        .I1(ms_counter_reg[20]),
        .O(ms_counter_next1_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    ms_counter_next1_carry__1_i_3
       (.I0(ms_counter_reg[19]),
        .I1(ms_counter_reg[18]),
        .O(ms_counter_next1_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    ms_counter_next1_carry__1_i_4
       (.I0(ms_counter_reg[17]),
        .I1(ms_counter_reg[16]),
        .O(ms_counter_next1_carry__1_i_4_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 ms_counter_next1_carry__2
       (.CI(ms_counter_next1_carry__1_n_0),
        .CO({ms_counter_next1_carry__2_n_0,ms_counter_next1_carry__2_n_1,ms_counter_next1_carry__2_n_2,ms_counter_next1_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({ms_counter_reg[31],1'b0,1'b0,1'b0}),
        .O(NLW_ms_counter_next1_carry__2_O_UNCONNECTED[3:0]),
        .S({ms_counter_next1_carry__2_i_1_n_0,ms_counter_next1_carry__2_i_2_n_0,ms_counter_next1_carry__2_i_3_n_0,ms_counter_next1_carry__2_i_4_n_0}));
  LUT2 #(
    .INIT(4'h1)) 
    ms_counter_next1_carry__2_i_1
       (.I0(ms_counter_reg[31]),
        .I1(ms_counter_reg[30]),
        .O(ms_counter_next1_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    ms_counter_next1_carry__2_i_2
       (.I0(ms_counter_reg[29]),
        .I1(ms_counter_reg[28]),
        .O(ms_counter_next1_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    ms_counter_next1_carry__2_i_3
       (.I0(ms_counter_reg[27]),
        .I1(ms_counter_reg[26]),
        .O(ms_counter_next1_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    ms_counter_next1_carry__2_i_4
       (.I0(ms_counter_reg[25]),
        .I1(ms_counter_reg[24]),
        .O(ms_counter_next1_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    ms_counter_next1_carry_i_1
       (.I0(\ms_target_reg_n_0_[7] ),
        .I1(ms_counter_reg[7]),
        .I2(\ms_target_reg_n_0_[6] ),
        .I3(ms_counter_reg[6]),
        .O(ms_counter_next1_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    ms_counter_next1_carry_i_2
       (.I0(ms_counter_next2[5]),
        .I1(ms_counter_reg[5]),
        .I2(ms_counter_next2[4]),
        .I3(ms_counter_reg[4]),
        .O(ms_counter_next1_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    ms_counter_next1_carry_i_3
       (.I0(ms_counter_next2[3]),
        .I1(ms_counter_reg[3]),
        .I2(ms_counter_next2[2]),
        .I3(ms_counter_reg[2]),
        .O(ms_counter_next1_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h222B)) 
    ms_counter_next1_carry_i_4
       (.I0(ms_counter_next2[1]),
        .I1(ms_counter_reg[1]),
        .I2(\ms_target_reg_n_0_[0] ),
        .I3(ms_counter_reg[0]),
        .O(ms_counter_next1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ms_counter_next1_carry_i_5
       (.I0(ms_counter_reg[7]),
        .I1(\ms_target_reg_n_0_[7] ),
        .I2(ms_counter_reg[6]),
        .I3(\ms_target_reg_n_0_[6] ),
        .O(ms_counter_next1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ms_counter_next1_carry_i_6
       (.I0(ms_counter_reg[5]),
        .I1(ms_counter_next2[5]),
        .I2(ms_counter_reg[4]),
        .I3(ms_counter_next2[4]),
        .O(ms_counter_next1_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ms_counter_next1_carry_i_7
       (.I0(ms_counter_reg[3]),
        .I1(ms_counter_next2[3]),
        .I2(ms_counter_reg[2]),
        .I3(ms_counter_next2[2]),
        .O(ms_counter_next1_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h6006)) 
    ms_counter_next1_carry_i_8
       (.I0(ms_counter_reg[0]),
        .I1(\ms_target_reg_n_0_[0] ),
        .I2(ms_counter_reg[1]),
        .I3(ms_counter_next2[1]),
        .O(ms_counter_next1_carry_i_8_n_0));
  CARRY4 ms_counter_next1_carry_i_9
       (.CI(ms_counter_next2_carry_n_0),
        .CO({NLW_ms_counter_next1_carry_i_9_CO_UNCONNECTED[3:1],ms_counter_next2[5]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_ms_counter_next1_carry_i_9_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  CARRY4 ms_counter_next2_carry
       (.CI(1'b0),
        .CO({ms_counter_next2_carry_n_0,ms_counter_next2_carry_n_1,ms_counter_next2_carry_n_2,ms_counter_next2_carry_n_3}),
        .CYINIT(\ms_target_reg_n_0_[0] ),
        .DI({\ms_target_reg_n_0_[4] ,\ms_target_reg_n_0_[7] ,\ms_target_reg_n_0_[2] ,\ms_target_reg_n_0_[1] }),
        .O(ms_counter_next2[4:1]),
        .S({ms_counter_next2_carry_i_1_n_0,ms_counter_next2_carry_i_2_n_0,ms_counter_next2_carry_i_3_n_0,ms_counter_next2_carry_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    ms_counter_next2_carry_i_1
       (.I0(\ms_target_reg_n_0_[4] ),
        .O(ms_counter_next2_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ms_counter_next2_carry_i_2
       (.I0(\ms_target_reg_n_0_[7] ),
        .O(ms_counter_next2_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ms_counter_next2_carry_i_3
       (.I0(\ms_target_reg_n_0_[2] ),
        .O(ms_counter_next2_carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ms_counter_next2_carry_i_4
       (.I0(\ms_target_reg_n_0_[1] ),
        .O(ms_counter_next2_carry_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[0] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[0]_i_3_n_7 ),
        .Q(ms_counter_reg[0]),
        .R(\ms_counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \ms_counter_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\ms_counter_reg[0]_i_3_n_0 ,\ms_counter_reg[0]_i_3_n_1 ,\ms_counter_reg[0]_i_3_n_2 ,\ms_counter_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\ms_counter_reg[0]_i_3_n_4 ,\ms_counter_reg[0]_i_3_n_5 ,\ms_counter_reg[0]_i_3_n_6 ,\ms_counter_reg[0]_i_3_n_7 }),
        .S({ms_counter_reg[3:1],\ms_counter[0]_i_7_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[10] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[8]_i_1_n_5 ),
        .Q(ms_counter_reg[10]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[11] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[8]_i_1_n_4 ),
        .Q(ms_counter_reg[11]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[12] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[12]_i_1_n_7 ),
        .Q(ms_counter_reg[12]),
        .R(\ms_counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \ms_counter_reg[12]_i_1 
       (.CI(\ms_counter_reg[8]_i_1_n_0 ),
        .CO({\ms_counter_reg[12]_i_1_n_0 ,\ms_counter_reg[12]_i_1_n_1 ,\ms_counter_reg[12]_i_1_n_2 ,\ms_counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\ms_counter_reg[12]_i_1_n_4 ,\ms_counter_reg[12]_i_1_n_5 ,\ms_counter_reg[12]_i_1_n_6 ,\ms_counter_reg[12]_i_1_n_7 }),
        .S(ms_counter_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[13] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[12]_i_1_n_6 ),
        .Q(ms_counter_reg[13]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[14] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[12]_i_1_n_5 ),
        .Q(ms_counter_reg[14]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[15] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[12]_i_1_n_4 ),
        .Q(ms_counter_reg[15]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[16] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[16]_i_1_n_7 ),
        .Q(ms_counter_reg[16]),
        .R(\ms_counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \ms_counter_reg[16]_i_1 
       (.CI(\ms_counter_reg[12]_i_1_n_0 ),
        .CO({\ms_counter_reg[16]_i_1_n_0 ,\ms_counter_reg[16]_i_1_n_1 ,\ms_counter_reg[16]_i_1_n_2 ,\ms_counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\ms_counter_reg[16]_i_1_n_4 ,\ms_counter_reg[16]_i_1_n_5 ,\ms_counter_reg[16]_i_1_n_6 ,\ms_counter_reg[16]_i_1_n_7 }),
        .S(ms_counter_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[17] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[16]_i_1_n_6 ),
        .Q(ms_counter_reg[17]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[18] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[16]_i_1_n_5 ),
        .Q(ms_counter_reg[18]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[19] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[16]_i_1_n_4 ),
        .Q(ms_counter_reg[19]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[1] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[0]_i_3_n_6 ),
        .Q(ms_counter_reg[1]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[20] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[20]_i_1_n_7 ),
        .Q(ms_counter_reg[20]),
        .R(\ms_counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \ms_counter_reg[20]_i_1 
       (.CI(\ms_counter_reg[16]_i_1_n_0 ),
        .CO({\ms_counter_reg[20]_i_1_n_0 ,\ms_counter_reg[20]_i_1_n_1 ,\ms_counter_reg[20]_i_1_n_2 ,\ms_counter_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\ms_counter_reg[20]_i_1_n_4 ,\ms_counter_reg[20]_i_1_n_5 ,\ms_counter_reg[20]_i_1_n_6 ,\ms_counter_reg[20]_i_1_n_7 }),
        .S(ms_counter_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[21] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[20]_i_1_n_6 ),
        .Q(ms_counter_reg[21]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[22] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[20]_i_1_n_5 ),
        .Q(ms_counter_reg[22]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[23] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[20]_i_1_n_4 ),
        .Q(ms_counter_reg[23]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[24] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[24]_i_1_n_7 ),
        .Q(ms_counter_reg[24]),
        .R(\ms_counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \ms_counter_reg[24]_i_1 
       (.CI(\ms_counter_reg[20]_i_1_n_0 ),
        .CO({\ms_counter_reg[24]_i_1_n_0 ,\ms_counter_reg[24]_i_1_n_1 ,\ms_counter_reg[24]_i_1_n_2 ,\ms_counter_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\ms_counter_reg[24]_i_1_n_4 ,\ms_counter_reg[24]_i_1_n_5 ,\ms_counter_reg[24]_i_1_n_6 ,\ms_counter_reg[24]_i_1_n_7 }),
        .S(ms_counter_reg[27:24]));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[25] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[24]_i_1_n_6 ),
        .Q(ms_counter_reg[25]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[26] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[24]_i_1_n_5 ),
        .Q(ms_counter_reg[26]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[27] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[24]_i_1_n_4 ),
        .Q(ms_counter_reg[27]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[28] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[28]_i_1_n_7 ),
        .Q(ms_counter_reg[28]),
        .R(\ms_counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \ms_counter_reg[28]_i_1 
       (.CI(\ms_counter_reg[24]_i_1_n_0 ),
        .CO({\NLW_ms_counter_reg[28]_i_1_CO_UNCONNECTED [3],\ms_counter_reg[28]_i_1_n_1 ,\ms_counter_reg[28]_i_1_n_2 ,\ms_counter_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\ms_counter_reg[28]_i_1_n_4 ,\ms_counter_reg[28]_i_1_n_5 ,\ms_counter_reg[28]_i_1_n_6 ,\ms_counter_reg[28]_i_1_n_7 }),
        .S(ms_counter_reg[31:28]));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[29] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[28]_i_1_n_6 ),
        .Q(ms_counter_reg[29]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[2] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[0]_i_3_n_5 ),
        .Q(ms_counter_reg[2]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[30] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[28]_i_1_n_5 ),
        .Q(ms_counter_reg[30]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[31] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[28]_i_1_n_4 ),
        .Q(ms_counter_reg[31]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[3] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[0]_i_3_n_4 ),
        .Q(ms_counter_reg[3]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[4] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[4]_i_1_n_7 ),
        .Q(ms_counter_reg[4]),
        .R(\ms_counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \ms_counter_reg[4]_i_1 
       (.CI(\ms_counter_reg[0]_i_3_n_0 ),
        .CO({\ms_counter_reg[4]_i_1_n_0 ,\ms_counter_reg[4]_i_1_n_1 ,\ms_counter_reg[4]_i_1_n_2 ,\ms_counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\ms_counter_reg[4]_i_1_n_4 ,\ms_counter_reg[4]_i_1_n_5 ,\ms_counter_reg[4]_i_1_n_6 ,\ms_counter_reg[4]_i_1_n_7 }),
        .S(ms_counter_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[5] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[4]_i_1_n_6 ),
        .Q(ms_counter_reg[5]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[6] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[4]_i_1_n_5 ),
        .Q(ms_counter_reg[6]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[7] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[4]_i_1_n_4 ),
        .Q(ms_counter_reg[7]),
        .R(\ms_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[8] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[8]_i_1_n_7 ),
        .Q(ms_counter_reg[8]),
        .R(\ms_counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \ms_counter_reg[8]_i_1 
       (.CI(\ms_counter_reg[4]_i_1_n_0 ),
        .CO({\ms_counter_reg[8]_i_1_n_0 ,\ms_counter_reg[8]_i_1_n_1 ,\ms_counter_reg[8]_i_1_n_2 ,\ms_counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\ms_counter_reg[8]_i_1_n_4 ,\ms_counter_reg[8]_i_1_n_5 ,\ms_counter_reg[8]_i_1_n_6 ,\ms_counter_reg[8]_i_1_n_7 }),
        .S(ms_counter_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \ms_counter_reg[9] 
       (.C(s00_axi_aclk),
        .CE(ms_counter),
        .D(\ms_counter_reg[8]_i_1_n_6 ),
        .Q(ms_counter_reg[9]),
        .R(\ms_counter[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFBFFFFF0030)) 
    \ms_target[0]_i_1 
       (.I0(done_next),
        .I1(\state_reg_n_0_[0] ),
        .I2(ms_counter),
        .I3(ms_counter_next1_carry__2_n_0),
        .I4(ms_target),
        .I5(\ms_target_reg_n_0_[0] ),
        .O(\ms_target[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAAA8CAA)) 
    \ms_target[1]_i_1 
       (.I0(\ms_target_reg_n_0_[1] ),
        .I1(done_next),
        .I2(\state_reg_n_0_[0] ),
        .I3(ms_counter),
        .I4(ms_counter_next1_carry__2_n_0),
        .I5(\ms_target[6]_i_2_n_0 ),
        .O(\ms_target[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AAAAB0AA)) 
    \ms_target[2]_i_1 
       (.I0(\ms_target_reg_n_0_[2] ),
        .I1(done_next),
        .I2(\state_reg_n_0_[0] ),
        .I3(ms_counter),
        .I4(ms_counter_next1_carry__2_n_0),
        .I5(\ms_target[6]_i_2_n_0 ),
        .O(\ms_target[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000FF9F00000010)) 
    \ms_target[4]_i_1 
       (.I0(done_next),
        .I1(\state_reg_n_0_[0] ),
        .I2(ms_counter),
        .I3(ms_counter_next1_carry__2_n_0),
        .I4(ms_target),
        .I5(\ms_target_reg_n_0_[4] ),
        .O(\ms_target[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAAABCAA)) 
    \ms_target[6]_i_1 
       (.I0(\ms_target_reg_n_0_[6] ),
        .I1(done_next),
        .I2(\state_reg_n_0_[0] ),
        .I3(ms_counter),
        .I4(ms_counter_next1_carry__2_n_0),
        .I5(\ms_target[6]_i_2_n_0 ),
        .O(\ms_target[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0020FFFFFFFF)) 
    \ms_target[6]_i_2 
       (.I0(done_next),
        .I1(\state_reg_n_0_[0] ),
        .I2(\ms_counter_reg[0]_0 ),
        .I3(\SCSR0_reg_reg[7] ),
        .I4(w_reset_ip),
        .I5(s00_axi_aresetn),
        .O(\ms_target[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000FF8F00000000)) 
    \ms_target[7]_i_1 
       (.I0(done_next),
        .I1(\state_reg_n_0_[0] ),
        .I2(ms_counter),
        .I3(ms_counter_next1_carry__2_n_0),
        .I4(ms_target),
        .I5(\ms_target_reg_n_0_[7] ),
        .O(\ms_target[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000540000000000)) 
    \ms_target[7]_i_2 
       (.I0(w_freeze_ip),
        .I1(\clk_counter_reg[0]_1 ),
        .I2(ap_start_stage2),
        .I3(\ms_counter_reg[0]_0 ),
        .I4(\state_reg_n_0_[0] ),
        .I5(done_next),
        .O(ms_target));
  FDRE #(
    .INIT(1'b0)) 
    \ms_target_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ms_target[0]_i_1_n_0 ),
        .Q(\ms_target_reg_n_0_[0] ),
        .R(global_reset));
  FDRE #(
    .INIT(1'b1)) 
    \ms_target_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ms_target[1]_i_1_n_0 ),
        .Q(\ms_target_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ms_target_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ms_target[2]_i_1_n_0 ),
        .Q(\ms_target_reg_n_0_[2] ),
        .R(1'b0));
  FDSE #(
    .INIT(1'b1)) 
    \ms_target_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ms_target[4]_i_1_n_0 ),
        .Q(\ms_target_reg_n_0_[4] ),
        .S(global_reset));
  FDRE #(
    .INIT(1'b1)) 
    \ms_target_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ms_target[6]_i_1_n_0 ),
        .Q(\ms_target_reg_n_0_[6] ),
        .R(1'b0));
  FDSE #(
    .INIT(1'b1)) 
    \ms_target_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\ms_target[7]_i_1_n_0 ),
        .Q(\ms_target_reg_n_0_[7] ),
        .S(global_reset));
  LUT6 #(
    .INIT(64'hF0002020F0000000)) 
    o_done_i_1
       (.I0(ms_counter),
        .I1(ms_counter_next1_carry__2_n_0),
        .I2(\clk_counter_reg[0]_0 ),
        .I3(ctl_done),
        .I4(\SCSR0_reg_reg[7] ),
        .I5(done_next),
        .O(o_done_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    o_done_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(o_done_i_1_n_0),
        .Q(ctl_done),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hA8)) 
    o_tx_INST_0
       (.I0(powerup_done_reg_reg_0),
        .I1(o_tx_0),
        .I2(w_auto_restart),
        .O(o_tx));
  LUT5 #(
    .INIT(32'hFFFF0010)) 
    powerup_done_reg_i_1
       (.I0(done_next),
        .I1(\state_reg_n_0_[0] ),
        .I2(ms_counter),
        .I3(ms_counter_next1_carry__2_n_0),
        .I4(powerup_done_reg_reg_0),
        .O(powerup_done_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    powerup_done_reg_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(powerup_done_reg_i_1_n_0),
        .Q(powerup_done_reg_reg_0),
        .R(global_reset));
  LUT6 #(
    .INIT(64'hFFFFFB00FFFFFFFF)) 
    start_reg_i_2
       (.I0(\ms_counter_reg[0]_0 ),
        .I1(ur_done),
        .I2(ctl_done),
        .I3(i_enable4_out),
        .I4(w_reset_ip),
        .I5(s00_axi_aresetn),
        .O(done_reg_reg_0));
  LUT6 #(
    .INIT(64'hFFFF0F00FFFD0202)) 
    \state[0]_i_1 
       (.I0(ms_counter),
        .I1(ms_counter_next1_carry__2_n_0),
        .I2(\SCSR0_reg_reg[7] ),
        .I3(done_next),
        .I4(\state_reg_n_0_[0] ),
        .I5(\ms_counter_reg[0]_0 ),
        .O(\state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF00FF00FF02FF00)) 
    \state[1]_i_1 
       (.I0(ms_counter),
        .I1(ms_counter_next1_carry__2_n_0),
        .I2(\SCSR0_reg_reg[7] ),
        .I3(done_next),
        .I4(\state_reg_n_0_[0] ),
        .I5(\ms_counter_reg[0]_0 ),
        .O(\state[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAB)) 
    \state[1]_i_2 
       (.I0(w_freeze_ip),
        .I1(\clk_counter_reg[0]_1 ),
        .I2(ap_start_stage2),
        .O(\SCSR0_reg_reg[7] ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\state[0]_i_1_n_0 ),
        .Q(\state_reg_n_0_[0] ),
        .R(global_reset));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\state[1]_i_1_n_0 ),
        .Q(done_next),
        .R(global_reset));
endmodule

(* ORIG_REF_NAME = "uart_receiver" *) 
module mbblockdesign_as_1_0_uart_receiver
   (o_baud_enable,
    ur_done,
    o_error_reg_0,
    \data_reg_reg[1]_0 ,
    Q,
    E,
    o_done_reg_0,
    \state_reg[1] ,
    \data_reg_reg[3]_0 ,
    \data_reg_reg[5]_0 ,
    \data_reg_reg[3]_1 ,
    \state_reg[1]_0 ,
    \data_reg_reg[5]_1 ,
    next_state,
    D,
    \state_reg[2] ,
    \data_reg_reg[4]_0 ,
    \data_reg_reg[3]_2 ,
    DI,
    S,
    \data_reg_reg[5]_2 ,
    \data_reg_reg[4]_1 ,
    \state_reg[0] ,
    global_reset,
    s00_axi_aclk,
    \data_reg_reg[7]_0 ,
    i_enable4_out,
    w_freeze_ip,
    prev_enable_reg,
    ap_start_stage2,
    prev_enable_reg_0,
    bd_gen_tick,
    ctl_done,
    \error_char_reg_reg[7] ,
    \digit_reg_reg[7] ,
    first_number_is_2_reg_reg,
    \state_reg[2]_0 ,
    \state[1]_i_2__0 ,
    data_next0_carry__0);
  output o_baud_enable;
  output ur_done;
  output [0:0]o_error_reg_0;
  output [2:0]\data_reg_reg[1]_0 ;
  output [7:0]Q;
  output [0:0]E;
  output [0:0]o_done_reg_0;
  output \state_reg[1] ;
  output \data_reg_reg[3]_0 ;
  output \data_reg_reg[5]_0 ;
  output \data_reg_reg[3]_1 ;
  output \state_reg[1]_0 ;
  output \data_reg_reg[5]_1 ;
  output [0:0]next_state;
  output [7:0]D;
  output \state_reg[2] ;
  output [0:0]\data_reg_reg[4]_0 ;
  output [0:0]\data_reg_reg[3]_2 ;
  output [0:0]DI;
  output [2:0]S;
  output [1:0]\data_reg_reg[5]_2 ;
  output [2:0]\data_reg_reg[4]_1 ;
  output \state_reg[0] ;
  input global_reset;
  input s00_axi_aclk;
  input \data_reg_reg[7]_0 ;
  input i_enable4_out;
  input w_freeze_ip;
  input prev_enable_reg;
  input ap_start_stage2;
  input prev_enable_reg_0;
  input bd_gen_tick;
  input ctl_done;
  input \error_char_reg_reg[7] ;
  input \digit_reg_reg[7] ;
  input first_number_is_2_reg_reg;
  input \state_reg[2]_0 ;
  input \state[1]_i_2__0 ;
  input [2:0]data_next0_carry__0;

  wire [7:0]D;
  wire [0:0]DI;
  wire [0:0]E;
  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_2_n_0 ;
  wire \FSM_sequential_state[1]_i_4_n_0 ;
  wire [7:0]Q;
  wire [2:0]S;
  wire ap_start_stage2;
  wire baud_enable_reg_i_1_n_0;
  wire bd_gen_tick;
  wire [2:0]bits_next;
  wire bits_reg;
  wire \bits_reg[1]_i_1_n_0 ;
  wire \bits_reg[3]_i_2_n_0 ;
  wire \bits_reg[3]_i_3_n_0 ;
  wire \bits_reg[3]_i_4_n_0 ;
  wire \bits_reg_reg_n_0_[0] ;
  wire \bits_reg_reg_n_0_[1] ;
  wire \bits_reg_reg_n_0_[2] ;
  wire \bits_reg_reg_n_0_[3] ;
  wire \chars_reg[1]_i_3_n_0 ;
  wire ctl_done;
  wire [6:0]data_next;
  wire [2:0]data_next0_carry__0;
  wire data_reg;
  wire \data_reg[7]_i_2__0_n_0 ;
  wire [2:0]\data_reg_reg[1]_0 ;
  wire \data_reg_reg[3]_0 ;
  wire \data_reg_reg[3]_1 ;
  wire [0:0]\data_reg_reg[3]_2 ;
  wire [0:0]\data_reg_reg[4]_0 ;
  wire [2:0]\data_reg_reg[4]_1 ;
  wire \data_reg_reg[5]_0 ;
  wire \data_reg_reg[5]_1 ;
  wire [1:0]\data_reg_reg[5]_2 ;
  wire \data_reg_reg[7]_0 ;
  wire \digit_reg[5]_i_2_n_0 ;
  wire \digit_reg[5]_i_3_n_0 ;
  wire \digit_reg_reg[7] ;
  wire done_next;
  wire \error_char_reg_reg[7] ;
  wire \error_pos_reg[5]_i_3_n_0 ;
  wire \error_pos_reg[5]_i_4_n_0 ;
  wire \error_pos_reg[5]_i_5_n_0 ;
  wire \error_pos_reg[5]_i_6_n_0 ;
  wire \error_pos_reg[5]_i_7_n_0 ;
  wire \error_pos_reg[5]_i_8_n_0 ;
  wire error_reg_i_4_n_0;
  wire first_number_is_2_reg_reg;
  wire global_reset;
  wire i_enable4_out;
  wire [0:0]next_state;
  wire o_baud_enable;
  wire o_done_i_1__0_n_0;
  wire [0:0]o_done_reg_0;
  wire o_error_i_1_n_0;
  wire [0:0]o_error_reg_0;
  wire prev_enable_reg;
  wire prev_enable_reg_0;
  wire s00_axi_aclk;
  wire state;
  wire \state[1]_i_2__0 ;
  wire [1:0]state__0;
  wire \state_reg[0] ;
  wire \state_reg[1] ;
  wire \state_reg[1]_0 ;
  wire \state_reg[2] ;
  wire \state_reg[2]_0 ;
  wire ticks_reg;
  wire \ticks_reg[0]_i_1_n_0 ;
  wire \ticks_reg[1]_i_1_n_0 ;
  wire \ticks_reg[2]_i_1_n_0 ;
  wire \ticks_reg[3]_i_2_n_0 ;
  wire \ticks_reg[3]_i_3_n_0 ;
  wire \ticks_reg[3]_i_4_n_0 ;
  wire \ticks_reg_reg_n_0_[0] ;
  wire \ticks_reg_reg_n_0_[1] ;
  wire \ticks_reg_reg_n_0_[2] ;
  wire \ticks_reg_reg_n_0_[3] ;
  wire ur_done;
  wire w_freeze_ip;

  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h0FB0)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(bd_gen_tick),
        .I1(state__0[1]),
        .I2(state),
        .I3(state__0[0]),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h4FA0)) 
    \FSM_sequential_state[1]_i_2 
       (.I0(state__0[0]),
        .I1(bd_gen_tick),
        .I2(state),
        .I3(state__0[1]),
        .O(\FSM_sequential_state[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA8A8A8AA)) 
    \FSM_sequential_state[1]_i_3 
       (.I0(i_enable4_out),
        .I1(\FSM_sequential_state[1]_i_4_n_0 ),
        .I2(\bits_reg[3]_i_3_n_0 ),
        .I3(\data_reg[7]_i_2__0_n_0 ),
        .I4(\bits_reg[3]_i_4_n_0 ),
        .O(state));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \FSM_sequential_state[1]_i_4 
       (.I0(state__0[0]),
        .I1(state__0[1]),
        .I2(\data_reg_reg[7]_0 ),
        .O(\FSM_sequential_state[1]_i_4_n_0 ));
  (* FSM_ENCODED_STATES = "start:01,data:10,idle:00,stop:11" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state__0[0]),
        .R(global_reset));
  (* FSM_ENCODED_STATES = "start:01,data:10,idle:00,stop:11" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state[1]_i_2_n_0 ),
        .Q(state__0[1]),
        .R(global_reset));
  LUT6 #(
    .INIT(64'h77FF77FF0088008A)) 
    baud_enable_reg_i_1
       (.I0(i_enable4_out),
        .I1(done_next),
        .I2(state__0[0]),
        .I3(state__0[1]),
        .I4(\data_reg_reg[7]_0 ),
        .I5(o_baud_enable),
        .O(baud_enable_reg_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h00800000)) 
    baud_enable_reg_i_2
       (.I0(state__0[0]),
        .I1(state__0[1]),
        .I2(bd_gen_tick),
        .I3(\ticks_reg[3]_i_4_n_0 ),
        .I4(\ticks_reg_reg_n_0_[3] ),
        .O(done_next));
  FDRE #(
    .INIT(1'b0)) 
    baud_enable_reg_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(baud_enable_reg_i_1_n_0),
        .Q(o_baud_enable),
        .R(global_reset));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \bits_reg[0]_i_1 
       (.I0(state__0[1]),
        .I1(\bits_reg_reg_n_0_[0] ),
        .O(bits_next[0]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \bits_reg[1]_i_1 
       (.I0(\bits_reg_reg_n_0_[1] ),
        .I1(\bits_reg_reg_n_0_[0] ),
        .I2(state__0[1]),
        .O(\bits_reg[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \bits_reg[2]_i_1 
       (.I0(state__0[1]),
        .I1(\bits_reg_reg_n_0_[0] ),
        .I2(\bits_reg_reg_n_0_[1] ),
        .I3(\bits_reg_reg_n_0_[2] ),
        .O(bits_next[2]));
  LUT4 #(
    .INIT(16'h8A88)) 
    \bits_reg[3]_i_1 
       (.I0(i_enable4_out),
        .I1(\bits_reg[3]_i_3_n_0 ),
        .I2(\data_reg[7]_i_2__0_n_0 ),
        .I3(\bits_reg[3]_i_4_n_0 ),
        .O(bits_reg));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h7F800000)) 
    \bits_reg[3]_i_2 
       (.I0(\bits_reg_reg_n_0_[1] ),
        .I1(\bits_reg_reg_n_0_[0] ),
        .I2(\bits_reg_reg_n_0_[2] ),
        .I3(\bits_reg_reg_n_0_[3] ),
        .I4(state__0[1]),
        .O(\bits_reg[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h00000008)) 
    \bits_reg[3]_i_3 
       (.I0(bd_gen_tick),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\ticks_reg[3]_i_4_n_0 ),
        .I4(\ticks_reg_reg_n_0_[3] ),
        .O(\bits_reg[3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h45555555)) 
    \bits_reg[3]_i_4 
       (.I0(state__0[0]),
        .I1(\bits_reg_reg_n_0_[3] ),
        .I2(\bits_reg_reg_n_0_[1] ),
        .I3(\bits_reg_reg_n_0_[0] ),
        .I4(\bits_reg_reg_n_0_[2] ),
        .O(\bits_reg[3]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bits_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(bits_reg),
        .D(bits_next[0]),
        .Q(\bits_reg_reg_n_0_[0] ),
        .R(global_reset));
  FDRE #(
    .INIT(1'b0)) 
    \bits_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(bits_reg),
        .D(\bits_reg[1]_i_1_n_0 ),
        .Q(\bits_reg_reg_n_0_[1] ),
        .R(global_reset));
  FDRE #(
    .INIT(1'b0)) 
    \bits_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(bits_reg),
        .D(bits_next[2]),
        .Q(\bits_reg_reg_n_0_[2] ),
        .R(global_reset));
  FDRE #(
    .INIT(1'b0)) 
    \bits_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(bits_reg),
        .D(\bits_reg[3]_i_2_n_0 ),
        .Q(\bits_reg_reg_n_0_[3] ),
        .R(global_reset));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \chars_reg[1]_i_2 
       (.I0(Q[5]),
        .I1(Q[6]),
        .I2(\chars_reg[1]_i_3_n_0 ),
        .O(\data_reg_reg[5]_1 ));
  LUT6 #(
    .INIT(64'hFFFEFFFFFFFFFFFF)) 
    \chars_reg[1]_i_3 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[7]),
        .I3(Q[3]),
        .I4(Q[4]),
        .I5(Q[1]),
        .O(\chars_reg[1]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    data_next0_carry__0_i_2
       (.I0(Q[4]),
        .O(DI));
  LUT4 #(
    .INIT(16'h6999)) 
    data_next0_carry__0_i_4
       (.I0(Q[6]),
        .I1(data_next0_carry__0[2]),
        .I2(data_next0_carry__0[1]),
        .I3(Q[5]),
        .O(S[2]));
  LUT3 #(
    .INIT(8'h96)) 
    data_next0_carry__0_i_5
       (.I0(Q[4]),
        .I1(data_next0_carry__0[1]),
        .I2(Q[5]),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h9)) 
    data_next0_carry__0_i_6
       (.I0(Q[4]),
        .I1(data_next0_carry__0[0]),
        .O(S[0]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \data_reg[0]_i_1 
       (.I0(Q[1]),
        .I1(state__0[1]),
        .I2(\data_reg_reg[7]_0 ),
        .O(data_next[0]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \data_reg[1]_i_1 
       (.I0(Q[2]),
        .I1(state__0[1]),
        .I2(\data_reg_reg[7]_0 ),
        .O(data_next[1]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \data_reg[2]_i_1 
       (.I0(Q[3]),
        .I1(state__0[1]),
        .I2(\data_reg_reg[7]_0 ),
        .O(data_next[2]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \data_reg[3]_i_1 
       (.I0(Q[4]),
        .I1(state__0[1]),
        .I2(\data_reg_reg[7]_0 ),
        .O(data_next[3]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \data_reg[4]_i_1 
       (.I0(Q[5]),
        .I1(state__0[1]),
        .I2(\data_reg_reg[7]_0 ),
        .O(data_next[4]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \data_reg[5]_i_1 
       (.I0(Q[6]),
        .I1(state__0[1]),
        .I2(\data_reg_reg[7]_0 ),
        .O(data_next[5]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \data_reg[6]_i_1 
       (.I0(Q[7]),
        .I1(state__0[1]),
        .I2(\data_reg_reg[7]_0 ),
        .O(data_next[6]));
  LUT5 #(
    .INIT(32'h00005700)) 
    \data_reg[7]_i_1 
       (.I0(\data_reg[7]_i_2__0_n_0 ),
        .I1(\data_reg_reg[7]_0 ),
        .I2(state__0[1]),
        .I3(i_enable4_out),
        .I4(state__0[0]),
        .O(data_reg));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \data_reg[7]_i_2__0 
       (.I0(\ticks_reg_reg_n_0_[3] ),
        .I1(\ticks_reg_reg_n_0_[1] ),
        .I2(\ticks_reg_reg_n_0_[0] ),
        .I3(\ticks_reg_reg_n_0_[2] ),
        .I4(state__0[1]),
        .I5(bd_gen_tick),
        .O(\data_reg[7]_i_2__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(data_reg),
        .D(data_next[0]),
        .Q(Q[0]),
        .R(global_reset));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(data_reg),
        .D(data_next[1]),
        .Q(Q[1]),
        .R(global_reset));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(data_reg),
        .D(data_next[2]),
        .Q(Q[2]),
        .R(global_reset));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(data_reg),
        .D(data_next[3]),
        .Q(Q[3]),
        .R(global_reset));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(data_reg),
        .D(data_next[4]),
        .Q(Q[4]),
        .R(global_reset));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(data_reg),
        .D(data_next[5]),
        .Q(Q[5]),
        .R(global_reset));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[6] 
       (.C(s00_axi_aclk),
        .CE(data_reg),
        .D(data_next[6]),
        .Q(Q[6]),
        .R(global_reset));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[7] 
       (.C(s00_axi_aclk),
        .CE(data_reg),
        .D(\data_reg_reg[7]_0 ),
        .Q(Q[7]),
        .R(global_reset));
  LUT5 #(
    .INIT(32'hAAAA8880)) 
    digit_ready_reg_i_3
       (.I0(\digit_reg_reg[7] ),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(\digit_reg[5]_i_3_n_0 ),
        .O(\state_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \digit_reg[0]_i_1 
       (.I0(Q[0]),
        .I1(\digit_reg[5]_i_2_n_0 ),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \digit_reg[1]_i_1 
       (.I0(Q[1]),
        .I1(\digit_reg[5]_i_2_n_0 ),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \digit_reg[2]_i_1 
       (.I0(Q[2]),
        .I1(\digit_reg[5]_i_2_n_0 ),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \digit_reg[3]_i_1 
       (.I0(Q[3]),
        .I1(\digit_reg[5]_i_2_n_0 ),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \digit_reg[4]_i_1 
       (.I0(Q[4]),
        .I1(\digit_reg[5]_i_2_n_0 ),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \digit_reg[5]_i_1 
       (.I0(Q[5]),
        .I1(\digit_reg[5]_i_2_n_0 ),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hFFFDDDDD00000000)) 
    \digit_reg[5]_i_2 
       (.I0(\state_reg[2]_0 ),
        .I1(\digit_reg[5]_i_3_n_0 ),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[3]),
        .I5(\digit_reg_reg[7] ),
        .O(\digit_reg[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hFFDF)) 
    \digit_reg[5]_i_3 
       (.I0(Q[5]),
        .I1(Q[6]),
        .I2(Q[4]),
        .I3(Q[7]),
        .O(\digit_reg[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \digit_reg[6]_i_1 
       (.I0(Q[6]),
        .I1(\digit_reg_reg[7] ),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \digit_reg[7]_i_3 
       (.I0(Q[7]),
        .I1(\digit_reg_reg[7] ),
        .O(D[7]));
  LUT2 #(
    .INIT(4'h2)) 
    \error_char_reg[7]_i_1 
       (.I0(\state_reg[1] ),
        .I1(ctl_done),
        .O(o_done_reg_0));
  LUT6 #(
    .INIT(64'h00000000001D331D)) 
    \error_pos_reg[5]_i_2 
       (.I0(\error_pos_reg[5]_i_3_n_0 ),
        .I1(\error_char_reg_reg[7] ),
        .I2(\data_reg_reg[3]_0 ),
        .I3(\digit_reg_reg[7] ),
        .I4(\error_pos_reg[5]_i_4_n_0 ),
        .I5(\error_pos_reg[5]_i_5_n_0 ),
        .O(\state_reg[1] ));
  LUT6 #(
    .INIT(64'h20202020202F2020)) 
    \error_pos_reg[5]_i_3 
       (.I0(\error_pos_reg[5]_i_6_n_0 ),
        .I1(\error_pos_reg[5]_i_7_n_0 ),
        .I2(\state_reg[2]_0 ),
        .I3(Q[5]),
        .I4(Q[6]),
        .I5(\chars_reg[1]_i_3_n_0 ),
        .O(\error_pos_reg[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF2F2F2F2F202F2F2)) 
    \error_pos_reg[5]_i_4 
       (.I0(\error_pos_reg[5]_i_8_n_0 ),
        .I1(error_reg_i_4_n_0),
        .I2(\state_reg[2]_0 ),
        .I3(Q[5]),
        .I4(Q[6]),
        .I5(\chars_reg[1]_i_3_n_0 ),
        .O(\error_pos_reg[5]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hDDDFFFFF)) 
    \error_pos_reg[5]_i_5 
       (.I0(ur_done),
        .I1(w_freeze_ip),
        .I2(prev_enable_reg),
        .I3(ap_start_stage2),
        .I4(prev_enable_reg_0),
        .O(\error_pos_reg[5]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h00100000)) 
    \error_pos_reg[5]_i_6 
       (.I0(Q[3]),
        .I1(Q[7]),
        .I2(Q[4]),
        .I3(Q[6]),
        .I4(Q[5]),
        .O(\error_pos_reg[5]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hEC)) 
    \error_pos_reg[5]_i_7 
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(Q[1]),
        .O(\error_pos_reg[5]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \error_pos_reg[5]_i_8 
       (.I0(Q[7]),
        .I1(Q[6]),
        .I2(Q[4]),
        .I3(Q[5]),
        .O(\error_pos_reg[5]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h5555555555555554)) 
    error_reg_i_3
       (.I0(\state_reg[2]_0 ),
        .I1(error_reg_i_4_n_0),
        .I2(Q[7]),
        .I3(Q[6]),
        .I4(Q[4]),
        .I5(Q[5]),
        .O(\state_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hFF7F)) 
    error_reg_i_4
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(Q[1]),
        .O(error_reg_i_4_n_0));
  LUT6 #(
    .INIT(64'h5755575500300000)) 
    first_number_is_2_reg_i_3
       (.I0(first_number_is_2_reg_reg),
        .I1(\chars_reg[1]_i_3_n_0 ),
        .I2(Q[5]),
        .I3(Q[6]),
        .I4(\data_reg_reg[3]_1 ),
        .I5(\digit_reg_reg[7] ),
        .O(\data_reg_reg[5]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h00010011)) 
    first_number_is_2_reg_i_4
       (.I0(\digit_reg[5]_i_3_n_0 ),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[0]),
        .O(\data_reg_reg[3]_1 ));
  LUT2 #(
    .INIT(4'hB)) 
    i___0_carry_i_1
       (.I0(Q[3]),
        .I1(Q[0]),
        .O(\data_reg_reg[3]_2 ));
  LUT5 #(
    .INIT(32'hC3693C96)) 
    i___0_carry_i_2
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[4]),
        .I4(Q[5]),
        .O(\data_reg_reg[1]_0 [2]));
  LUT4 #(
    .INIT(16'hD22D)) 
    i___0_carry_i_3
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[4]),
        .O(\data_reg_reg[1]_0 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    i___0_carry_i_4
       (.I0(Q[3]),
        .I1(Q[0]),
        .O(\data_reg_reg[1]_0 [0]));
  LUT3 #(
    .INIT(8'hB4)) 
    multOp_carry__0_i_1
       (.I0(Q[5]),
        .I1(Q[4]),
        .I2(Q[6]),
        .O(\data_reg_reg[5]_2 [1]));
  LUT3 #(
    .INIT(8'h96)) 
    multOp_carry__0_i_2
       (.I0(Q[5]),
        .I1(Q[4]),
        .I2(Q[3]),
        .O(\data_reg_reg[5]_2 [0]));
  LUT1 #(
    .INIT(2'h1)) 
    multOp_carry_i_1
       (.I0(Q[4]),
        .O(\data_reg_reg[4]_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    multOp_carry_i_2
       (.I0(Q[4]),
        .I1(Q[2]),
        .O(\data_reg_reg[4]_1 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    multOp_carry_i_3
       (.I0(Q[3]),
        .I1(Q[1]),
        .O(\data_reg_reg[4]_1 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    multOp_carry_i_4
       (.I0(Q[2]),
        .I1(Q[0]),
        .O(\data_reg_reg[4]_1 [0]));
  LUT6 #(
    .INIT(64'h0080FFFF00800000)) 
    o_done_i_1__0
       (.I0(state__0[0]),
        .I1(state__0[1]),
        .I2(bd_gen_tick),
        .I3(\ticks_reg[3]_i_3_n_0 ),
        .I4(i_enable4_out),
        .I5(ur_done),
        .O(o_done_i_1__0_n_0));
  FDRE o_done_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(o_done_i_1__0_n_0),
        .Q(ur_done),
        .R(global_reset));
  LUT4 #(
    .INIT(16'h2F20)) 
    o_error_i_1
       (.I0(done_next),
        .I1(\data_reg_reg[7]_0 ),
        .I2(i_enable4_out),
        .I3(o_error_reg_0),
        .O(o_error_i_1_n_0));
  FDRE o_error_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(o_error_i_1_n_0),
        .Q(o_error_reg_0),
        .R(global_reset));
  LUT5 #(
    .INIT(32'h22200000)) 
    prev_enable_i_1
       (.I0(o_baud_enable),
        .I1(w_freeze_ip),
        .I2(prev_enable_reg),
        .I3(ap_start_stage2),
        .I4(prev_enable_reg_0),
        .O(E));
  LUT6 #(
    .INIT(64'h838383B3B3B383B3)) 
    \state[0]_i_2 
       (.I0(\data_reg_reg[5]_1 ),
        .I1(\digit_reg_reg[7] ),
        .I2(\state_reg[2]_0 ),
        .I3(\data_reg_reg[3]_1 ),
        .I4(\error_char_reg_reg[7] ),
        .I5(\data_reg_reg[3]_0 ),
        .O(next_state));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \state[2]_i_3 
       (.I0(\data_reg_reg[3]_0 ),
        .I1(\error_char_reg_reg[7] ),
        .I2(\data_reg_reg[3]_1 ),
        .I3(\state_reg[2]_0 ),
        .I4(\data_reg_reg[5]_1 ),
        .O(\state_reg[1]_0 ));
  LUT5 #(
    .INIT(32'h01111115)) 
    \state[2]_i_6 
       (.I0(\digit_reg[5]_i_3_n_0 ),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(\state[1]_i_2__0 ),
        .O(\data_reg_reg[3]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h02FE)) 
    \ticks_reg[0]_i_1 
       (.I0(\data_reg_reg[7]_0 ),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(\ticks_reg_reg_n_0_[0] ),
        .O(\ticks_reg[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h02FEFE02)) 
    \ticks_reg[1]_i_1 
       (.I0(\data_reg_reg[7]_0 ),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(\ticks_reg_reg_n_0_[0] ),
        .I4(\ticks_reg_reg_n_0_[1] ),
        .O(\ticks_reg[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02FEFE02FE02FE02)) 
    \ticks_reg[2]_i_1 
       (.I0(\data_reg_reg[7]_0 ),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(\ticks_reg_reg_n_0_[2] ),
        .I4(\ticks_reg_reg_n_0_[0] ),
        .I5(\ticks_reg_reg_n_0_[1] ),
        .O(\ticks_reg[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA800AA0228002A02)) 
    \ticks_reg[3]_i_1 
       (.I0(i_enable4_out),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(bd_gen_tick),
        .I4(\data_reg_reg[7]_0 ),
        .I5(\ticks_reg[3]_i_3_n_0 ),
        .O(ticks_reg));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h998F9980)) 
    \ticks_reg[3]_i_2 
       (.I0(\ticks_reg[3]_i_4_n_0 ),
        .I1(\ticks_reg_reg_n_0_[3] ),
        .I2(state__0[0]),
        .I3(state__0[1]),
        .I4(\data_reg_reg[7]_0 ),
        .O(\ticks_reg[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \ticks_reg[3]_i_3 
       (.I0(\ticks_reg_reg_n_0_[2] ),
        .I1(\ticks_reg_reg_n_0_[0] ),
        .I2(\ticks_reg_reg_n_0_[1] ),
        .I3(\ticks_reg_reg_n_0_[3] ),
        .O(\ticks_reg[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \ticks_reg[3]_i_4 
       (.I0(\ticks_reg_reg_n_0_[1] ),
        .I1(\ticks_reg_reg_n_0_[0] ),
        .I2(\ticks_reg_reg_n_0_[2] ),
        .O(\ticks_reg[3]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ticks_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(ticks_reg),
        .D(\ticks_reg[0]_i_1_n_0 ),
        .Q(\ticks_reg_reg_n_0_[0] ),
        .R(global_reset));
  FDRE #(
    .INIT(1'b0)) 
    \ticks_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(ticks_reg),
        .D(\ticks_reg[1]_i_1_n_0 ),
        .Q(\ticks_reg_reg_n_0_[1] ),
        .R(global_reset));
  FDRE #(
    .INIT(1'b0)) 
    \ticks_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(ticks_reg),
        .D(\ticks_reg[2]_i_1_n_0 ),
        .Q(\ticks_reg_reg_n_0_[2] ),
        .R(global_reset));
  FDRE #(
    .INIT(1'b0)) 
    \ticks_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(ticks_reg),
        .D(\ticks_reg[3]_i_2_n_0 ),
        .Q(\ticks_reg_reg_n_0_[3] ),
        .R(global_reset));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
