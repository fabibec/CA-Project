// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Tue Jun 17 08:51:51 2025
// Host        : xuser-pc running 64-bit Ubuntu 24.04.2 LTS
// Command     : write_verilog -force -mode funcsim
//               /1work/fpgaproc/combo/combo_hw/combo_hw.gen/sources_1/bd/mbblockdesign/ip/mbblockdesign_ad_0_0/mbblockdesign_ad_0_0_sim_netlist.v
// Design      : mbblockdesign_ad_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mbblockdesign_ad_0_0,ad,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "package_project" *) 
(* x_core_info = "ad,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module mbblockdesign_ad_0_0
   (o_db4_7,
    o_register_select,
    o_read_write,
    o_read_write_enable,
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
  output [3:0]o_db4_7;
  output o_register_select;
  output o_read_write;
  output o_read_write_enable;
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
  wire [3:0]o_db4_7;
  wire o_read_write_enable;
  wire o_register_select;
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
  wire [31:0]\^s00_axi_rdata ;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire NLW_U0_o_interrupt_UNCONNECTED;
  wire NLW_U0_o_read_write_UNCONNECTED;
  wire [1:0]NLW_U0_s00_axi_bresp_UNCONNECTED;
  wire [30:11]NLW_U0_s00_axi_rdata_UNCONNECTED;
  wire [1:0]NLW_U0_s00_axi_rresp_UNCONNECTED;

  assign o_interrupt = \<const0> ;
  assign o_read_write = \<const0> ;
  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rdata[31] = \^s00_axi_rdata [31];
  assign s00_axi_rdata[30] = \<const0> ;
  assign s00_axi_rdata[29] = \<const0> ;
  assign s00_axi_rdata[28] = \<const0> ;
  assign s00_axi_rdata[27] = \<const0> ;
  assign s00_axi_rdata[26] = \<const0> ;
  assign s00_axi_rdata[25] = \<const0> ;
  assign s00_axi_rdata[24] = \<const0> ;
  assign s00_axi_rdata[23] = \<const0> ;
  assign s00_axi_rdata[22] = \<const0> ;
  assign s00_axi_rdata[21] = \<const0> ;
  assign s00_axi_rdata[20] = \<const0> ;
  assign s00_axi_rdata[19] = \<const0> ;
  assign s00_axi_rdata[18] = \<const0> ;
  assign s00_axi_rdata[17] = \<const0> ;
  assign s00_axi_rdata[16] = \^s00_axi_rdata [16];
  assign s00_axi_rdata[15] = \<const0> ;
  assign s00_axi_rdata[14] = \<const0> ;
  assign s00_axi_rdata[13] = \<const0> ;
  assign s00_axi_rdata[12] = \^s00_axi_rdata [12];
  assign s00_axi_rdata[11] = \<const0> ;
  assign s00_axi_rdata[10:0] = \^s00_axi_rdata [10:0];
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_S00_AXI_ADDR_WIDTH = "6" *) 
  (* C_S00_AXI_DATA_WIDTH = "32" *) 
  (* G_AXI_AD_T_16_4MS = "164000" *) 
  (* G_AXI_AD_T_40_US = "4000" *) 
  (* G_AXI_AD_T_H = "3" *) 
  (* G_AXI_AD_T_LOWER_UPPER_WAIT = "150" *) 
  (* G_AXI_AD_T_POWER_ON = "3000000" *) 
  (* G_AXI_AD_T_SU = "6" *) 
  (* G_AXI_AD_T_W = "45" *) 
  mbblockdesign_ad_0_0_ad U0
       (.o_db4_7(o_db4_7),
        .o_interrupt(NLW_U0_o_interrupt_UNCONNECTED),
        .o_read_write(NLW_U0_o_read_write_UNCONNECTED),
        .o_read_write_enable(o_read_write_enable),
        .o_register_select(o_register_select),
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
        .s00_axi_rdata(\^s00_axi_rdata ),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rresp(NLW_U0_s00_axi_rresp_UNCONNECTED[1:0]),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s00_axi_wdata[16],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s00_axi_wdata[7:0]}),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wstrb({1'b0,s00_axi_wstrb[2],1'b0,s00_axi_wstrb[0]}),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

(* C_S00_AXI_ADDR_WIDTH = "6" *) (* C_S00_AXI_DATA_WIDTH = "32" *) (* G_AXI_AD_T_16_4MS = "164000" *) 
(* G_AXI_AD_T_40_US = "4000" *) (* G_AXI_AD_T_H = "3" *) (* G_AXI_AD_T_LOWER_UPPER_WAIT = "150" *) 
(* G_AXI_AD_T_POWER_ON = "3000000" *) (* G_AXI_AD_T_SU = "6" *) (* G_AXI_AD_T_W = "45" *) 
(* ORIG_REF_NAME = "ad" *) 
module mbblockdesign_ad_0_0_ad
   (o_db4_7,
    o_register_select,
    o_read_write,
    o_read_write_enable,
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
  output [3:0]o_db4_7;
  output o_register_select;
  output o_read_write;
  output o_read_write_enable;
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
  wire [4:4]DCR_reg;
  wire [1:1]GCSR_reg;
  wire [0:0]GCSR_reg__0;
  wire ad_S00_AXI_inst_n_0;
  wire ad_S00_AXI_inst_n_11;
  wire ad_S00_AXI_inst_n_12;
  wire ad_S00_AXI_inst_n_13;
  wire ad_S00_AXI_inst_n_16;
  wire ad_S00_AXI_inst_n_25;
  wire ad_S00_AXI_inst_n_26;
  wire ad_S00_AXI_inst_n_27;
  wire ad_S00_AXI_inst_n_28;
  wire ad_S00_AXI_inst_n_29;
  wire ad_core_inst_n_15;
  wire ad_core_inst_n_21;
  wire ad_core_inst_n_22;
  wire ad_core_inst_n_7;
  wire ad_core_inst_n_8;
  wire i_reset;
  wire [1:0]in24;
  wire \lcd_controller_inst/ns_executing_command ;
  wire \lcd_controller_inst/s_executing_command ;
  wire [4:0]\lcd_controller_inst/state ;
  wire [4:4]ns_ddram_pos_last_written0_in;
  wire [3:0]o_db4_7;
  wire o_read_write_enable;
  wire o_register_select;
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
  wire [31:0]\^s00_axi_rdata ;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire w_ap_idle;
  wire w_ap_start;
  wire w_clear_display;
  wire w_cursor_apply;
  wire [7:0]w_ddram_pos_last_written;
  wire w_lcd_initialized;
  wire [4:0]w_lcd_state;
  wire [7:0]w_symbol_to_write;

  assign o_interrupt = \<const0> ;
  assign o_read_write = \<const0> ;
  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rdata[31] = \^s00_axi_rdata [31];
  assign s00_axi_rdata[30] = \<const0> ;
  assign s00_axi_rdata[29] = \<const0> ;
  assign s00_axi_rdata[28] = \<const0> ;
  assign s00_axi_rdata[27] = \<const0> ;
  assign s00_axi_rdata[26] = \<const0> ;
  assign s00_axi_rdata[25] = \<const0> ;
  assign s00_axi_rdata[24] = \<const0> ;
  assign s00_axi_rdata[23] = \<const0> ;
  assign s00_axi_rdata[22] = \<const0> ;
  assign s00_axi_rdata[21] = \<const0> ;
  assign s00_axi_rdata[20] = \<const0> ;
  assign s00_axi_rdata[19] = \<const0> ;
  assign s00_axi_rdata[18] = \<const0> ;
  assign s00_axi_rdata[17] = \<const0> ;
  assign s00_axi_rdata[16] = \^s00_axi_rdata [16];
  assign s00_axi_rdata[15] = \<const0> ;
  assign s00_axi_rdata[14] = \<const0> ;
  assign s00_axi_rdata[13] = \<const0> ;
  assign s00_axi_rdata[12] = \^s00_axi_rdata [12];
  assign s00_axi_rdata[11] = \<const0> ;
  assign s00_axi_rdata[10] = \^s00_axi_rdata [8];
  assign s00_axi_rdata[9:0] = \^s00_axi_rdata [9:0];
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  mbblockdesign_ad_0_0_ad_S00_AXI ad_S00_AXI_inst
       (.\CCR_reg_reg[7]_0 ({w_ddram_pos_last_written[7:6],w_ddram_pos_last_written[3:0]}),
        .\CDR_reg_reg[7]_0 (w_symbol_to_write),
        .D(ns_ddram_pos_last_written0_in),
        .DCR_reg(DCR_reg),
        .\DCR_reg_reg[0]_0 (w_clear_display),
        .\DCR_reg_reg[1]_0 (ad_S00_AXI_inst_n_16),
        .\DCR_reg_reg[1]_1 (ad_S00_AXI_inst_n_27),
        .\DCR_reg_reg[2]_0 (ad_S00_AXI_inst_n_28),
        .\DCR_reg_reg[3]_0 (ad_S00_AXI_inst_n_29),
        .\DCR_reg_reg[4]_0 (ad_core_inst_n_22),
        .E(ad_S00_AXI_inst_n_11),
        .GCSR_reg__0(GCSR_reg__0),
        .\GCSR_reg_reg[0]_0 (ad_S00_AXI_inst_n_12),
        .\GCSR_reg_reg[0]_1 (ad_S00_AXI_inst_n_13),
        .\GCSR_reg_reg[0]_2 (ad_core_inst_n_21),
        .\GCSR_reg_reg[1]_0 (GCSR_reg),
        .\GCSR_reg_reg[1]_1 (ad_core_inst_n_8),
        .Q(w_lcd_state),
        .\SCSR0_reg_reg[9]_0 (ad_S00_AXI_inst_n_0),
        .\SCSR0_reg_reg[9]_1 (ad_core_inst_n_7),
        .SR(i_reset),
        .axi_arready_reg_0(s00_axi_arready),
        .axi_arready_reg_1(ad_S00_AXI_inst_n_25),
        .axi_awready_reg_0(s00_axi_awready),
        .axi_wready_reg_0(s00_axi_wready),
        .in24(in24),
        .ns_executing_command(\lcd_controller_inst/ns_executing_command ),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[5:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_aresetn_0(ad_S00_AXI_inst_n_26),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[5:2]),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata({\^s00_axi_rdata [31],\^s00_axi_rdata [16],\^s00_axi_rdata [12],\^s00_axi_rdata [8],\^s00_axi_rdata [9],\^s00_axi_rdata [7:0]}),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata({s00_axi_wdata[16],s00_axi_wdata[7:0]}),
        .s00_axi_wstrb({s00_axi_wstrb[2],s00_axi_wstrb[0]}),
        .s00_axi_wvalid(s00_axi_wvalid),
        .s_executing_command(\lcd_controller_inst/s_executing_command ),
        .s_executing_command_reg(ad_core_inst_n_15),
        .\s_symbol_to_write_reg[0] (\lcd_controller_inst/state ),
        .w_ap_idle(w_ap_idle),
        .w_ap_start(w_ap_start),
        .w_cursor_apply(w_cursor_apply),
        .w_lcd_initialized(w_lcd_initialized));
  mbblockdesign_ad_0_0_ad_core ad_core_inst
       (.D(ns_ddram_pos_last_written0_in),
        .DCR_reg(DCR_reg),
        .E(ad_S00_AXI_inst_n_11),
        .\FSM_sequential_state_reg[0] (ad_core_inst_n_21),
        .\FSM_sequential_state_reg[0]_0 (ad_core_inst_n_22),
        .\FSM_sequential_state_reg[0]_1 (ad_S00_AXI_inst_n_13),
        .\FSM_sequential_state_reg[0]_2 (ad_S00_AXI_inst_n_27),
        .\FSM_sequential_state_reg[1] (w_clear_display),
        .\FSM_sequential_state_reg[1]_0 (ad_S00_AXI_inst_n_16),
        .\FSM_sequential_state_reg[2] (ad_core_inst_n_15),
        .GCSR_reg__0(GCSR_reg__0),
        .\GCSR_reg_reg[1] (ad_core_inst_n_8),
        .\GCSR_reg_reg[1]_0 (ad_S00_AXI_inst_n_26),
        .\GCSR_reg_reg[1]_1 (GCSR_reg),
        .Q(\lcd_controller_inst/state ),
        .\SCSR0_reg_reg[9] (ad_core_inst_n_7),
        .\SCSR0_reg_reg[9]_0 (ad_S00_AXI_inst_n_25),
        .\SCSR0_reg_reg[9]_1 (ad_S00_AXI_inst_n_0),
        .SS(i_reset),
        .in24(in24),
        .ns_executing_command(\lcd_controller_inst/ns_executing_command ),
        .o_db4_7(o_db4_7),
        .o_read_write_enable(o_read_write_enable),
        .o_register_select(o_register_select),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s_cursor_blink_reg(ad_S00_AXI_inst_n_29),
        .s_cursor_on_reg(ad_S00_AXI_inst_n_28),
        .\s_ddram_pos_last_written_reg[7] ({w_ddram_pos_last_written[7:6],w_ddram_pos_last_written[3:0]}),
        .s_executing_command(\lcd_controller_inst/s_executing_command ),
        .s_executing_command_reg(ad_S00_AXI_inst_n_12),
        .\s_lcd_state_reg[4] (w_lcd_state),
        .\s_symbol_to_write_reg[7] (w_symbol_to_write),
        .w_ap_idle(w_ap_idle),
        .w_ap_start(w_ap_start),
        .w_cursor_apply(w_cursor_apply),
        .w_lcd_initialized(w_lcd_initialized));
endmodule

(* ORIG_REF_NAME = "ad_S00_AXI" *) 
module mbblockdesign_ad_0_0_ad_S00_AXI
   (\SCSR0_reg_reg[9]_0 ,
    \GCSR_reg_reg[1]_0 ,
    axi_wready_reg_0,
    axi_awready_reg_0,
    axi_arready_reg_0,
    w_ap_start,
    w_cursor_apply,
    s00_axi_bvalid,
    s00_axi_rvalid,
    ns_executing_command,
    \DCR_reg_reg[0]_0 ,
    E,
    \GCSR_reg_reg[0]_0 ,
    \GCSR_reg_reg[0]_1 ,
    DCR_reg,
    GCSR_reg__0,
    \DCR_reg_reg[1]_0 ,
    \CDR_reg_reg[7]_0 ,
    axi_arready_reg_1,
    s00_axi_aresetn_0,
    \DCR_reg_reg[1]_1 ,
    \DCR_reg_reg[2]_0 ,
    \DCR_reg_reg[3]_0 ,
    s00_axi_rdata,
    SR,
    Q,
    s00_axi_aclk,
    w_lcd_initialized,
    \SCSR0_reg_reg[9]_1 ,
    w_ap_idle,
    \GCSR_reg_reg[1]_1 ,
    \GCSR_reg_reg[0]_2 ,
    \DCR_reg_reg[4]_0 ,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_arvalid,
    s_executing_command,
    \s_symbol_to_write_reg[0] ,
    s_executing_command_reg,
    D,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready,
    in24,
    \CCR_reg_reg[7]_0 ,
    s00_axi_araddr,
    s00_axi_awaddr);
  output \SCSR0_reg_reg[9]_0 ;
  output [0:0]\GCSR_reg_reg[1]_0 ;
  output axi_wready_reg_0;
  output axi_awready_reg_0;
  output axi_arready_reg_0;
  output w_ap_start;
  output w_cursor_apply;
  output s00_axi_bvalid;
  output s00_axi_rvalid;
  output ns_executing_command;
  output [0:0]\DCR_reg_reg[0]_0 ;
  output [0:0]E;
  output \GCSR_reg_reg[0]_0 ;
  output \GCSR_reg_reg[0]_1 ;
  output [0:0]DCR_reg;
  output [0:0]GCSR_reg__0;
  output \DCR_reg_reg[1]_0 ;
  output [7:0]\CDR_reg_reg[7]_0 ;
  output axi_arready_reg_1;
  output s00_axi_aresetn_0;
  output \DCR_reg_reg[1]_1 ;
  output \DCR_reg_reg[2]_0 ;
  output \DCR_reg_reg[3]_0 ;
  output [12:0]s00_axi_rdata;
  input [0:0]SR;
  input [4:0]Q;
  input s00_axi_aclk;
  input w_lcd_initialized;
  input \SCSR0_reg_reg[9]_1 ;
  input w_ap_idle;
  input \GCSR_reg_reg[1]_1 ;
  input \GCSR_reg_reg[0]_2 ;
  input \DCR_reg_reg[4]_0 ;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input s00_axi_arvalid;
  input s_executing_command;
  input [4:0]\s_symbol_to_write_reg[0] ;
  input s_executing_command_reg;
  input [0:0]D;
  input [8:0]s00_axi_wdata;
  input [1:0]s00_axi_wstrb;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;
  input [1:0]in24;
  input [5:0]\CCR_reg_reg[7]_0 ;
  input [3:0]s00_axi_araddr;
  input [3:0]s00_axi_awaddr;

  wire [7:0]CCR_reg;
  wire \CCR_reg[16]_i_1_n_0 ;
  wire \CCR_reg[16]_i_2_n_0 ;
  wire [5:0]\CCR_reg_reg[7]_0 ;
  wire \CDR_reg[7]_i_1_n_0 ;
  wire \CDR_reg[7]_i_2_n_0 ;
  wire [7:0]\CDR_reg_reg[7]_0 ;
  wire [0:0]D;
  wire [0:0]DCR_reg;
  wire \DCR_reg[3]_i_1_n_0 ;
  wire [0:0]\DCR_reg_reg[0]_0 ;
  wire \DCR_reg_reg[1]_0 ;
  wire \DCR_reg_reg[1]_1 ;
  wire \DCR_reg_reg[2]_0 ;
  wire \DCR_reg_reg[3]_0 ;
  wire \DCR_reg_reg[4]_0 ;
  wire [0:0]E;
  wire [2:2]GCSR_reg;
  wire \GCSR_reg[0]_i_5_n_0 ;
  wire [0:0]GCSR_reg__0;
  wire \GCSR_reg_reg[0]_0 ;
  wire \GCSR_reg_reg[0]_1 ;
  wire \GCSR_reg_reg[0]_2 ;
  wire [0:0]\GCSR_reg_reg[1]_0 ;
  wire \GCSR_reg_reg[1]_1 ;
  wire [4:0]Q;
  wire \SCSR0_reg_reg[9]_0 ;
  wire \SCSR0_reg_reg[9]_1 ;
  wire \SCSR0_reg_reg_n_0_[0] ;
  wire \SCSR0_reg_reg_n_0_[1] ;
  wire \SCSR0_reg_reg_n_0_[2] ;
  wire \SCSR0_reg_reg_n_0_[3] ;
  wire \SCSR0_reg_reg_n_0_[4] ;
  wire \SCSR0_reg_reg_n_0_[5] ;
  wire [0:0]SR;
  wire aw_en_i_1_n_0;
  wire aw_en_reg_n_0;
  wire [5:2]axi_araddr;
  wire axi_arready0;
  wire axi_arready_reg_0;
  wire axi_arready_reg_1;
  wire [5:2]axi_awaddr;
  wire axi_awready0;
  wire axi_awready_reg_0;
  wire axi_bvalid_i_1_n_0;
  wire \axi_rdata[0]_i_2_n_0 ;
  wire \axi_rdata[1]_i_2_n_0 ;
  wire \axi_rdata[1]_i_3_n_0 ;
  wire \axi_rdata[1]_i_4_n_0 ;
  wire \axi_rdata[2]_i_2_n_0 ;
  wire \axi_rdata[2]_i_3_n_0 ;
  wire \axi_rdata[3]_i_2_n_0 ;
  wire \axi_rdata[4]_i_2_n_0 ;
  wire \axi_rdata[5]_i_2_n_0 ;
  wire \axi_rdata[5]_i_3_n_0 ;
  wire \axi_rdata[5]_i_4_n_0 ;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0;
  wire axi_wready_reg_0;
  wire [1:0]in24;
  wire ns_executing_command;
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
  wire [12:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [8:0]s00_axi_wdata;
  wire [1:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire s_cursor_blink_i_2_n_0;
  wire s_executing_command;
  wire s_executing_command_reg;
  wire \s_symbol_to_write[7]_i_2_n_0 ;
  wire [4:0]\s_symbol_to_write_reg[0] ;
  wire slv_reg_rden;
  wire w_ap_idle;
  wire w_ap_start;
  wire w_cursor_apply;
  wire w_cursor_blink;
  wire w_cursor_on;
  wire w_lcd_initialized;
  wire w_return_home;
  wire w_write_char;

  LUT6 #(
    .INIT(64'hBFFFFFFF80000000)) 
    \CCR_reg[16]_i_1 
       (.I0(s00_axi_wdata[8]),
        .I1(\CCR_reg[16]_i_2_n_0 ),
        .I2(s00_axi_wvalid),
        .I3(s00_axi_awvalid),
        .I4(axi_awready_reg_0),
        .I5(w_write_char),
        .O(\CCR_reg[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2000000000000000)) 
    \CCR_reg[16]_i_2 
       (.I0(axi_awaddr[4]),
        .I1(axi_awaddr[5]),
        .I2(axi_awaddr[2]),
        .I3(axi_awaddr[3]),
        .I4(axi_wready_reg_0),
        .I5(s00_axi_wstrb[1]),
        .O(\CCR_reg[16]_i_2_n_0 ));
  FDRE \CCR_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\CCR_reg_reg[7]_0 [0]),
        .Q(CCR_reg[0]),
        .R(SR));
  FDRE \CCR_reg_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\CCR_reg[16]_i_1_n_0 ),
        .Q(w_write_char),
        .R(SR));
  FDRE \CCR_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\CCR_reg_reg[7]_0 [1]),
        .Q(CCR_reg[1]),
        .R(SR));
  FDRE \CCR_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\CCR_reg_reg[7]_0 [2]),
        .Q(CCR_reg[2]),
        .R(SR));
  FDRE \CCR_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\CCR_reg_reg[7]_0 [3]),
        .Q(CCR_reg[3]),
        .R(SR));
  FDRE \CCR_reg_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\CCR_reg_reg[7]_0 [4]),
        .Q(CCR_reg[6]),
        .R(SR));
  FDRE \CCR_reg_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\CCR_reg_reg[7]_0 [5]),
        .Q(CCR_reg[7]),
        .R(SR));
  LUT5 #(
    .INIT(32'h40000000)) 
    \CDR_reg[7]_i_1 
       (.I0(axi_awaddr[2]),
        .I1(axi_awready_reg_0),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .I4(\CDR_reg[7]_i_2_n_0 ),
        .O(\CDR_reg[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h10000000)) 
    \CDR_reg[7]_i_2 
       (.I0(axi_awaddr[3]),
        .I1(axi_awaddr[4]),
        .I2(s00_axi_wstrb[0]),
        .I3(axi_wready_reg_0),
        .I4(axi_awaddr[5]),
        .O(\CDR_reg[7]_i_2_n_0 ));
  FDRE \CDR_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\CDR_reg[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\CDR_reg_reg[7]_0 [0]),
        .R(SR));
  FDRE \CDR_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\CDR_reg[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\CDR_reg_reg[7]_0 [1]),
        .R(SR));
  FDRE \CDR_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\CDR_reg[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\CDR_reg_reg[7]_0 [2]),
        .R(SR));
  FDRE \CDR_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\CDR_reg[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\CDR_reg_reg[7]_0 [3]),
        .R(SR));
  FDRE \CDR_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\CDR_reg[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\CDR_reg_reg[7]_0 [4]),
        .R(SR));
  FDRE \CDR_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\CDR_reg[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\CDR_reg_reg[7]_0 [5]),
        .R(SR));
  FDRE \CDR_reg_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\CDR_reg[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\CDR_reg_reg[7]_0 [6]),
        .R(SR));
  FDRE \CDR_reg_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\CDR_reg[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\CDR_reg_reg[7]_0 [7]),
        .R(SR));
  LUT5 #(
    .INIT(32'h80000000)) 
    \DCR_reg[3]_i_1 
       (.I0(axi_awaddr[2]),
        .I1(axi_awready_reg_0),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .I4(\CDR_reg[7]_i_2_n_0 ),
        .O(\DCR_reg[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \DCR_reg[4]_i_2 
       (.I0(axi_awaddr[2]),
        .I1(s00_axi_wdata[4]),
        .I2(\CDR_reg[7]_i_2_n_0 ),
        .O(DCR_reg));
  FDRE \DCR_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\DCR_reg[3]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\DCR_reg_reg[0]_0 ),
        .R(SR));
  FDRE \DCR_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\DCR_reg[3]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(w_return_home),
        .R(SR));
  FDRE \DCR_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\DCR_reg[3]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(w_cursor_on),
        .R(SR));
  FDRE \DCR_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\DCR_reg[3]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(w_cursor_blink),
        .R(SR));
  FDRE \DCR_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\DCR_reg_reg[4]_0 ),
        .Q(w_cursor_apply),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    \FSM_sequential_state[0]_i_9 
       (.I0(w_return_home),
        .I1(w_cursor_apply),
        .I2(\DCR_reg_reg[0]_0 ),
        .O(\DCR_reg_reg[1]_1 ));
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_sequential_state[1]_i_11 
       (.I0(w_return_home),
        .I1(w_cursor_apply),
        .O(\DCR_reg_reg[1]_0 ));
  LUT6 #(
    .INIT(64'h0200020002000000)) 
    \FSM_sequential_state[4]_i_4 
       (.I0(w_ap_start),
        .I1(\s_symbol_to_write_reg[0] [3]),
        .I2(\s_symbol_to_write_reg[0] [2]),
        .I3(\s_symbol_to_write_reg[0] [1]),
        .I4(w_write_char),
        .I5(\s_symbol_to_write[7]_i_2_n_0 ),
        .O(\GCSR_reg_reg[0]_1 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \GCSR_reg[0]_i_2 
       (.I0(s00_axi_wdata[0]),
        .I1(axi_awaddr[2]),
        .I2(axi_awaddr[5]),
        .I3(\GCSR_reg[0]_i_5_n_0 ),
        .O(GCSR_reg__0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \GCSR_reg[0]_i_5 
       (.I0(axi_wready_reg_0),
        .I1(s00_axi_wstrb[0]),
        .I2(axi_awaddr[4]),
        .I3(axi_awaddr[3]),
        .O(\GCSR_reg[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \GCSR_reg[1]_i_4 
       (.I0(s00_axi_aresetn),
        .I1(axi_arready_reg_0),
        .I2(axi_araddr[4]),
        .I3(axi_araddr[5]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[3]),
        .O(s00_axi_aresetn_0));
  FDRE \GCSR_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\GCSR_reg_reg[0]_2 ),
        .Q(w_ap_start),
        .R(SR));
  FDRE \GCSR_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\GCSR_reg_reg[1]_1 ),
        .Q(\GCSR_reg_reg[1]_0 ),
        .R(SR));
  FDRE \GCSR_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(w_ap_idle),
        .Q(GCSR_reg),
        .R(SR));
  LUT6 #(
    .INIT(64'h0008000000000000)) 
    \SCSR0_reg[9]_i_5 
       (.I0(axi_arready_reg_0),
        .I1(s00_axi_aresetn),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[5]),
        .I4(axi_araddr[4]),
        .I5(axi_araddr[3]),
        .O(axi_arready_reg_1));
  FDRE \SCSR0_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(w_lcd_initialized),
        .Q(\SCSR0_reg_reg_n_0_[0] ),
        .R(SR));
  FDRE \SCSR0_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(Q[0]),
        .Q(\SCSR0_reg_reg_n_0_[1] ),
        .R(SR));
  FDRE \SCSR0_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(Q[1]),
        .Q(\SCSR0_reg_reg_n_0_[2] ),
        .R(SR));
  FDRE \SCSR0_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(Q[2]),
        .Q(\SCSR0_reg_reg_n_0_[3] ),
        .R(SR));
  FDRE \SCSR0_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(Q[3]),
        .Q(\SCSR0_reg_reg_n_0_[4] ),
        .R(SR));
  FDRE \SCSR0_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(Q[4]),
        .Q(\SCSR0_reg_reg_n_0_[5] ),
        .R(SR));
  FDRE \SCSR0_reg_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\SCSR0_reg_reg[9]_1 ),
        .Q(\SCSR0_reg_reg[9]_0 ),
        .R(SR));
  LUT6 #(
    .INIT(64'hF0FFFFFF88888888)) 
    aw_en_i_1
       (.I0(s00_axi_bvalid),
        .I1(s00_axi_bready),
        .I2(axi_awready_reg_0),
        .I3(s00_axi_awvalid),
        .I4(s00_axi_wvalid),
        .I5(aw_en_reg_n_0),
        .O(aw_en_i_1_n_0));
  FDSE aw_en_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(aw_en_i_1_n_0),
        .Q(aw_en_reg_n_0),
        .S(SR));
  FDSE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(axi_arready0),
        .D(s00_axi_araddr[0]),
        .Q(axi_araddr[2]),
        .S(SR));
  FDSE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(axi_arready0),
        .D(s00_axi_araddr[1]),
        .Q(axi_araddr[3]),
        .S(SR));
  FDSE \axi_araddr_reg[4] 
       (.C(s00_axi_aclk),
        .CE(axi_arready0),
        .D(s00_axi_araddr[2]),
        .Q(axi_araddr[4]),
        .S(SR));
  FDSE \axi_araddr_reg[5] 
       (.C(s00_axi_aclk),
        .CE(axi_arready0),
        .D(s00_axi_araddr[3]),
        .Q(axi_araddr[5]),
        .S(SR));
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
        .R(SR));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(axi_awready0),
        .D(s00_axi_awaddr[0]),
        .Q(axi_awaddr[2]),
        .R(SR));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(axi_awready0),
        .D(s00_axi_awaddr[1]),
        .Q(axi_awaddr[3]),
        .R(SR));
  FDRE \axi_awaddr_reg[4] 
       (.C(s00_axi_aclk),
        .CE(axi_awready0),
        .D(s00_axi_awaddr[2]),
        .Q(axi_awaddr[4]),
        .R(SR));
  FDRE \axi_awaddr_reg[5] 
       (.C(s00_axi_aclk),
        .CE(axi_awready0),
        .D(s00_axi_awaddr[3]),
        .Q(axi_awaddr[5]),
        .R(SR));
  LUT4 #(
    .INIT(16'h4000)) 
    axi_awready_i_1
       (.I0(axi_awready_reg_0),
        .I1(s00_axi_awvalid),
        .I2(s00_axi_wvalid),
        .I3(aw_en_reg_n_0),
        .O(axi_awready0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready0),
        .Q(axi_awready_reg_0),
        .R(SR));
  LUT6 #(
    .INIT(64'h55555555C0000000)) 
    axi_bvalid_i_1
       (.I0(s00_axi_bready),
        .I1(axi_awready_reg_0),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .I4(axi_wready_reg_0),
        .I5(s00_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFFBAAABAAABAAA)) 
    \axi_rdata[0]_i_1 
       (.I0(\axi_rdata[0]_i_2_n_0 ),
        .I1(axi_araddr[4]),
        .I2(w_ap_start),
        .I3(\axi_rdata[1]_i_3_n_0 ),
        .I4(\axi_rdata[1]_i_4_n_0 ),
        .I5(\DCR_reg_reg[0]_0 ),
        .O(reg_data_out[0]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[0]_i_2 
       (.I0(\axi_rdata[5]_i_2_n_0 ),
        .I1(\SCSR0_reg_reg_n_0_[0] ),
        .I2(\axi_rdata[5]_i_3_n_0 ),
        .I3(CCR_reg[0]),
        .I4(\CDR_reg_reg[7]_0 [0]),
        .I5(\axi_rdata[5]_i_4_n_0 ),
        .O(\axi_rdata[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \axi_rdata[10]_i_1 
       (.I0(axi_araddr[3]),
        .I1(axi_araddr[2]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[4]),
        .O(reg_data_out[10]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \axi_rdata[12]_i_1 
       (.I0(axi_araddr[3]),
        .I1(axi_araddr[2]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[4]),
        .O(reg_data_out[12]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h0800000C)) 
    \axi_rdata[16]_i_1 
       (.I0(w_write_char),
        .I1(axi_araddr[4]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[3]),
        .O(reg_data_out[16]));
  LUT6 #(
    .INIT(64'hFFFFBAAABAAABAAA)) 
    \axi_rdata[1]_i_1 
       (.I0(\axi_rdata[1]_i_2_n_0 ),
        .I1(axi_araddr[4]),
        .I2(\GCSR_reg_reg[1]_0 ),
        .I3(\axi_rdata[1]_i_3_n_0 ),
        .I4(\axi_rdata[1]_i_4_n_0 ),
        .I5(w_return_home),
        .O(reg_data_out[1]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[1]_i_2 
       (.I0(\axi_rdata[5]_i_2_n_0 ),
        .I1(\SCSR0_reg_reg_n_0_[1] ),
        .I2(\axi_rdata[5]_i_3_n_0 ),
        .I3(CCR_reg[1]),
        .I4(\CDR_reg_reg[7]_0 [1]),
        .I5(\axi_rdata[5]_i_4_n_0 ),
        .O(\axi_rdata[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \axi_rdata[1]_i_3 
       (.I0(axi_araddr[3]),
        .I1(axi_araddr[2]),
        .I2(axi_araddr[5]),
        .O(\axi_rdata[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \axi_rdata[1]_i_4 
       (.I0(axi_araddr[3]),
        .I1(axi_araddr[2]),
        .I2(axi_araddr[4]),
        .I3(axi_araddr[5]),
        .O(\axi_rdata[1]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFF8)) 
    \axi_rdata[2]_i_1 
       (.I0(\axi_rdata[5]_i_3_n_0 ),
        .I1(CCR_reg[2]),
        .I2(\axi_rdata[2]_i_2_n_0 ),
        .I3(\axi_rdata[2]_i_3_n_0 ),
        .O(reg_data_out[2]));
  LUT6 #(
    .INIT(64'h00000022000000F0)) 
    \axi_rdata[2]_i_2 
       (.I0(\CDR_reg_reg[7]_0 [2]),
        .I1(axi_araddr[4]),
        .I2(GCSR_reg),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(axi_araddr[5]),
        .O(\axi_rdata[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000C0000AF0000)) 
    \axi_rdata[2]_i_3 
       (.I0(\SCSR0_reg_reg_n_0_[2] ),
        .I1(w_cursor_on),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[4]),
        .I5(axi_araddr[5]),
        .O(\axi_rdata[2]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \axi_rdata[31]_i_1 
       (.I0(axi_arready_reg_0),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_rvalid),
        .O(slv_reg_rden));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \axi_rdata[31]_i_2 
       (.I0(axi_araddr[5]),
        .I1(axi_araddr[4]),
        .I2(axi_araddr[3]),
        .O(reg_data_out[31]));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    \axi_rdata[3]_i_1 
       (.I0(\CDR_reg_reg[7]_0 [3]),
        .I1(\axi_rdata[5]_i_4_n_0 ),
        .I2(\axi_rdata[5]_i_3_n_0 ),
        .I3(CCR_reg[3]),
        .I4(\axi_rdata[3]_i_2_n_0 ),
        .O(reg_data_out[3]));
  LUT6 #(
    .INIT(64'h00000C0000A00000)) 
    \axi_rdata[3]_i_2 
       (.I0(\SCSR0_reg_reg_n_0_[3] ),
        .I1(w_cursor_blink),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[4]),
        .I5(axi_araddr[5]),
        .O(\axi_rdata[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    \axi_rdata[4]_i_1 
       (.I0(\CDR_reg_reg[7]_0 [4]),
        .I1(\axi_rdata[5]_i_4_n_0 ),
        .I2(\axi_rdata[5]_i_3_n_0 ),
        .I3(CCR_reg[7]),
        .I4(\axi_rdata[4]_i_2_n_0 ),
        .O(reg_data_out[4]));
  LUT6 #(
    .INIT(64'h00000C0000A00000)) 
    \axi_rdata[4]_i_2 
       (.I0(\SCSR0_reg_reg_n_0_[4] ),
        .I1(w_cursor_apply),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[4]),
        .I5(axi_araddr[5]),
        .O(\axi_rdata[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[5]_i_1 
       (.I0(\axi_rdata[5]_i_2_n_0 ),
        .I1(\SCSR0_reg_reg_n_0_[5] ),
        .I2(\axi_rdata[5]_i_3_n_0 ),
        .I3(CCR_reg[7]),
        .I4(\CDR_reg_reg[7]_0 [5]),
        .I5(\axi_rdata[5]_i_4_n_0 ),
        .O(reg_data_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \axi_rdata[5]_i_2 
       (.I0(axi_araddr[3]),
        .I1(axi_araddr[4]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[2]),
        .O(\axi_rdata[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \axi_rdata[5]_i_3 
       (.I0(axi_araddr[3]),
        .I1(axi_araddr[4]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[2]),
        .O(\axi_rdata[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \axi_rdata[5]_i_4 
       (.I0(axi_araddr[4]),
        .I1(axi_araddr[5]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .O(\axi_rdata[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000C000000A0F00)) 
    \axi_rdata[6]_i_1 
       (.I0(\CDR_reg_reg[7]_0 [6]),
        .I1(CCR_reg[6]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[4]),
        .I4(axi_araddr[5]),
        .I5(axi_araddr[2]),
        .O(reg_data_out[6]));
  LUT6 #(
    .INIT(64'h0000C000000A0000)) 
    \axi_rdata[7]_i_1 
       (.I0(\CDR_reg_reg[7]_0 [7]),
        .I1(CCR_reg[7]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[4]),
        .I4(axi_araddr[5]),
        .I5(axi_araddr[2]),
        .O(reg_data_out[7]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h0008000C)) 
    \axi_rdata[9]_i_1 
       (.I0(\SCSR0_reg_reg[9]_0 ),
        .I1(axi_araddr[4]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[3]),
        .O(reg_data_out[9]));
  FDRE \axi_rdata_reg[0] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[0]),
        .Q(s00_axi_rdata[0]),
        .R(SR));
  FDRE \axi_rdata_reg[10] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[10]),
        .Q(s00_axi_rdata[9]),
        .R(SR));
  FDRE \axi_rdata_reg[12] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[12]),
        .Q(s00_axi_rdata[10]),
        .R(SR));
  FDRE \axi_rdata_reg[16] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[16]),
        .Q(s00_axi_rdata[11]),
        .R(SR));
  FDRE \axi_rdata_reg[1] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[1]),
        .Q(s00_axi_rdata[1]),
        .R(SR));
  FDRE \axi_rdata_reg[2] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[2]),
        .Q(s00_axi_rdata[2]),
        .R(SR));
  FDRE \axi_rdata_reg[31] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[31]),
        .Q(s00_axi_rdata[12]),
        .R(SR));
  FDRE \axi_rdata_reg[3] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[3]),
        .Q(s00_axi_rdata[3]),
        .R(SR));
  FDRE \axi_rdata_reg[4] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[4]),
        .Q(s00_axi_rdata[4]),
        .R(SR));
  FDRE \axi_rdata_reg[5] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[5]),
        .Q(s00_axi_rdata[5]),
        .R(SR));
  FDRE \axi_rdata_reg[6] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[6]),
        .Q(s00_axi_rdata[6]),
        .R(SR));
  FDRE \axi_rdata_reg[7] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[7]),
        .Q(s00_axi_rdata[7]),
        .R(SR));
  FDRE \axi_rdata_reg[9] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[9]),
        .Q(s00_axi_rdata[8]),
        .R(SR));
  LUT4 #(
    .INIT(16'h7444)) 
    axi_rvalid_i_1
       (.I0(s00_axi_rready),
        .I1(s00_axi_rvalid),
        .I2(s00_axi_arvalid),
        .I3(axi_arready_reg_0),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(s00_axi_rvalid),
        .R(SR));
  LUT4 #(
    .INIT(16'h0080)) 
    axi_wready_i_1
       (.I0(aw_en_reg_n_0),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_awvalid),
        .I3(axi_wready_reg_0),
        .O(axi_wready0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready0),
        .Q(axi_wready_reg_0),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    s_cursor_blink_i_1
       (.I0(w_cursor_blink),
        .I1(s_cursor_blink_i_2_n_0),
        .I2(in24[0]),
        .O(\DCR_reg_reg[3]_0 ));
  LUT6 #(
    .INIT(64'h0100000000000000)) 
    s_cursor_blink_i_2
       (.I0(s_executing_command),
        .I1(\DCR_reg_reg[0]_0 ),
        .I2(w_return_home),
        .I3(w_cursor_apply),
        .I4(w_ap_start),
        .I5(w_ap_idle),
        .O(s_cursor_blink_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    s_cursor_on_i_1
       (.I0(w_cursor_on),
        .I1(s_cursor_blink_i_2_n_0),
        .I2(in24[1]),
        .O(\DCR_reg_reg[2]_0 ));
  LUT6 #(
    .INIT(64'h00FEFFFF00000000)) 
    s_executing_command_i_2
       (.I0(\DCR_reg_reg[0]_0 ),
        .I1(w_return_home),
        .I2(w_cursor_apply),
        .I3(s_executing_command),
        .I4(\s_symbol_to_write_reg[0] [1]),
        .I5(s_executing_command_reg),
        .O(ns_executing_command));
  LUT6 #(
    .INIT(64'h0000AAA800000000)) 
    s_executing_command_i_3
       (.I0(w_ap_start),
        .I1(\DCR_reg_reg[0]_0 ),
        .I2(w_return_home),
        .I3(w_cursor_apply),
        .I4(s_executing_command),
        .I5(w_ap_idle),
        .O(\GCSR_reg_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h0040000000000000)) 
    \s_symbol_to_write[7]_i_1 
       (.I0(\s_symbol_to_write[7]_i_2_n_0 ),
        .I1(w_write_char),
        .I2(w_ap_start),
        .I3(\s_symbol_to_write_reg[0] [0]),
        .I4(D),
        .I5(\s_symbol_to_write_reg[0] [4]),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h00FE)) 
    \s_symbol_to_write[7]_i_2 
       (.I0(\DCR_reg_reg[0]_0 ),
        .I1(w_return_home),
        .I2(w_cursor_apply),
        .I3(s_executing_command),
        .O(\s_symbol_to_write[7]_i_2_n_0 ));
endmodule

(* ORIG_REF_NAME = "ad_core" *) 
module mbblockdesign_ad_0_0_ad_core
   (SS,
    s_executing_command,
    in24,
    w_lcd_initialized,
    o_register_select,
    o_read_write_enable,
    \SCSR0_reg_reg[9] ,
    \GCSR_reg_reg[1] ,
    Q,
    w_ap_idle,
    \FSM_sequential_state_reg[2] ,
    D,
    o_db4_7,
    \FSM_sequential_state_reg[0] ,
    \FSM_sequential_state_reg[0]_0 ,
    \s_lcd_state_reg[4] ,
    \s_ddram_pos_last_written_reg[7] ,
    s00_axi_aclk,
    s_cursor_blink_reg,
    s_cursor_on_reg,
    \SCSR0_reg_reg[9]_0 ,
    \SCSR0_reg_reg[9]_1 ,
    \GCSR_reg_reg[1]_0 ,
    \GCSR_reg_reg[1]_1 ,
    \FSM_sequential_state_reg[0]_1 ,
    s00_axi_aresetn,
    \FSM_sequential_state_reg[1] ,
    \FSM_sequential_state_reg[1]_0 ,
    \FSM_sequential_state_reg[0]_2 ,
    ns_executing_command,
    s_executing_command_reg,
    GCSR_reg__0,
    w_ap_start,
    DCR_reg,
    w_cursor_apply,
    E,
    \s_symbol_to_write_reg[7] );
  output [0:0]SS;
  output s_executing_command;
  output [1:0]in24;
  output w_lcd_initialized;
  output o_register_select;
  output o_read_write_enable;
  output \SCSR0_reg_reg[9] ;
  output \GCSR_reg_reg[1] ;
  output [4:0]Q;
  output w_ap_idle;
  output \FSM_sequential_state_reg[2] ;
  output [0:0]D;
  output [3:0]o_db4_7;
  output \FSM_sequential_state_reg[0] ;
  output \FSM_sequential_state_reg[0]_0 ;
  output [4:0]\s_lcd_state_reg[4] ;
  output [5:0]\s_ddram_pos_last_written_reg[7] ;
  input s00_axi_aclk;
  input s_cursor_blink_reg;
  input s_cursor_on_reg;
  input \SCSR0_reg_reg[9]_0 ;
  input \SCSR0_reg_reg[9]_1 ;
  input \GCSR_reg_reg[1]_0 ;
  input [0:0]\GCSR_reg_reg[1]_1 ;
  input \FSM_sequential_state_reg[0]_1 ;
  input s00_axi_aresetn;
  input [0:0]\FSM_sequential_state_reg[1] ;
  input \FSM_sequential_state_reg[1]_0 ;
  input \FSM_sequential_state_reg[0]_2 ;
  input ns_executing_command;
  input s_executing_command_reg;
  input [0:0]GCSR_reg__0;
  input w_ap_start;
  input [0:0]DCR_reg;
  input w_cursor_apply;
  input [0:0]E;
  input [7:0]\s_symbol_to_write_reg[7] ;

  wire [0:0]D;
  wire [0:0]DCR_reg;
  wire [0:0]E;
  wire \FSM_sequential_state_reg[0] ;
  wire \FSM_sequential_state_reg[0]_0 ;
  wire \FSM_sequential_state_reg[0]_1 ;
  wire \FSM_sequential_state_reg[0]_2 ;
  wire [0:0]\FSM_sequential_state_reg[1] ;
  wire \FSM_sequential_state_reg[1]_0 ;
  wire \FSM_sequential_state_reg[2] ;
  wire [0:0]GCSR_reg__0;
  wire \GCSR_reg_reg[1] ;
  wire \GCSR_reg_reg[1]_0 ;
  wire [0:0]\GCSR_reg_reg[1]_1 ;
  wire [4:0]Q;
  wire \SCSR0_reg_reg[9] ;
  wire \SCSR0_reg_reg[9]_0 ;
  wire \SCSR0_reg_reg[9]_1 ;
  wire [0:0]SS;
  wire [1:0]in24;
  wire ns_executing_command;
  wire [3:0]o_db4_7;
  wire o_read_write_enable;
  wire o_register_select;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire s_cursor_blink_reg;
  wire s_cursor_on_reg;
  wire [5:0]\s_ddram_pos_last_written_reg[7] ;
  wire s_executing_command;
  wire s_executing_command_reg;
  wire [4:0]\s_lcd_state_reg[4] ;
  wire [7:0]\s_symbol_to_write_reg[7] ;
  wire w_ap_idle;
  wire w_ap_start;
  wire w_cursor_apply;
  wire w_lcd_initialized;

  mbblockdesign_ad_0_0_lcd_controller lcd_controller_inst
       (.D(D),
        .DCR_reg(DCR_reg),
        .E(E),
        .\FSM_sequential_state_reg[0]_0 (\FSM_sequential_state_reg[0] ),
        .\FSM_sequential_state_reg[0]_1 (\FSM_sequential_state_reg[0]_0 ),
        .\FSM_sequential_state_reg[0]_2 (\FSM_sequential_state_reg[0]_1 ),
        .\FSM_sequential_state_reg[0]_3 (\FSM_sequential_state_reg[0]_2 ),
        .\FSM_sequential_state_reg[1]_0 (\FSM_sequential_state_reg[1] ),
        .\FSM_sequential_state_reg[1]_1 (\FSM_sequential_state_reg[1]_0 ),
        .\FSM_sequential_state_reg[2]_0 (\FSM_sequential_state_reg[2] ),
        .GCSR_reg__0(GCSR_reg__0),
        .\GCSR_reg_reg[1] (\GCSR_reg_reg[1] ),
        .\GCSR_reg_reg[1]_0 (\GCSR_reg_reg[1]_0 ),
        .\GCSR_reg_reg[1]_1 (\GCSR_reg_reg[1]_1 ),
        .Q(Q),
        .\SCSR0_reg_reg[9] (\SCSR0_reg_reg[9] ),
        .\SCSR0_reg_reg[9]_0 (\SCSR0_reg_reg[9]_0 ),
        .\SCSR0_reg_reg[9]_1 (\SCSR0_reg_reg[9]_1 ),
        .SR(SS),
        .in24(in24),
        .ns_executing_command(ns_executing_command),
        .o_db4_7(o_db4_7),
        .o_read_write_enable(o_read_write_enable),
        .o_register_select(o_register_select),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s_cursor_blink_reg_0(s_cursor_blink_reg),
        .s_cursor_on_reg_0(s_cursor_on_reg),
        .\s_ddram_pos_last_written_reg[7]_0 (\s_ddram_pos_last_written_reg[7] ),
        .s_executing_command_reg_0(s_executing_command),
        .s_executing_command_reg_1(s_executing_command_reg),
        .\s_lcd_state_reg[4]_0 (\s_lcd_state_reg[4] ),
        .\s_symbol_to_write_reg[7]_0 (\s_symbol_to_write_reg[7] ),
        .w_ap_idle(w_ap_idle),
        .w_ap_start(w_ap_start),
        .w_cursor_apply(w_cursor_apply),
        .w_lcd_initialized(w_lcd_initialized));
endmodule

(* ORIG_REF_NAME = "lcd_controller" *) 
module mbblockdesign_ad_0_0_lcd_controller
   (SR,
    s_executing_command_reg_0,
    in24,
    w_lcd_initialized,
    o_register_select,
    o_read_write_enable,
    \SCSR0_reg_reg[9] ,
    \GCSR_reg_reg[1] ,
    Q,
    w_ap_idle,
    \FSM_sequential_state_reg[2]_0 ,
    D,
    o_db4_7,
    \FSM_sequential_state_reg[0]_0 ,
    \FSM_sequential_state_reg[0]_1 ,
    \s_lcd_state_reg[4]_0 ,
    \s_ddram_pos_last_written_reg[7]_0 ,
    s00_axi_aclk,
    s_cursor_blink_reg_0,
    s_cursor_on_reg_0,
    \SCSR0_reg_reg[9]_0 ,
    \SCSR0_reg_reg[9]_1 ,
    \GCSR_reg_reg[1]_0 ,
    \GCSR_reg_reg[1]_1 ,
    \FSM_sequential_state_reg[0]_2 ,
    s00_axi_aresetn,
    \FSM_sequential_state_reg[1]_0 ,
    \FSM_sequential_state_reg[1]_1 ,
    \FSM_sequential_state_reg[0]_3 ,
    ns_executing_command,
    s_executing_command_reg_1,
    GCSR_reg__0,
    w_ap_start,
    DCR_reg,
    w_cursor_apply,
    E,
    \s_symbol_to_write_reg[7]_0 );
  output [0:0]SR;
  output s_executing_command_reg_0;
  output [1:0]in24;
  output w_lcd_initialized;
  output o_register_select;
  output o_read_write_enable;
  output \SCSR0_reg_reg[9] ;
  output \GCSR_reg_reg[1] ;
  output [4:0]Q;
  output w_ap_idle;
  output \FSM_sequential_state_reg[2]_0 ;
  output [0:0]D;
  output [3:0]o_db4_7;
  output \FSM_sequential_state_reg[0]_0 ;
  output \FSM_sequential_state_reg[0]_1 ;
  output [4:0]\s_lcd_state_reg[4]_0 ;
  output [5:0]\s_ddram_pos_last_written_reg[7]_0 ;
  input s00_axi_aclk;
  input s_cursor_blink_reg_0;
  input s_cursor_on_reg_0;
  input \SCSR0_reg_reg[9]_0 ;
  input \SCSR0_reg_reg[9]_1 ;
  input \GCSR_reg_reg[1]_0 ;
  input [0:0]\GCSR_reg_reg[1]_1 ;
  input \FSM_sequential_state_reg[0]_2 ;
  input s00_axi_aresetn;
  input [0:0]\FSM_sequential_state_reg[1]_0 ;
  input \FSM_sequential_state_reg[1]_1 ;
  input \FSM_sequential_state_reg[0]_3 ;
  input ns_executing_command;
  input s_executing_command_reg_1;
  input [0:0]GCSR_reg__0;
  input w_ap_start;
  input [0:0]DCR_reg;
  input w_cursor_apply;
  input [0:0]E;
  input [7:0]\s_symbol_to_write_reg[7]_0 ;

  wire [0:0]D;
  wire [0:0]DCR_reg;
  wire [0:0]E;
  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[0]_i_2_n_0 ;
  wire \FSM_sequential_state[0]_i_3_n_0 ;
  wire \FSM_sequential_state[0]_i_4_n_0 ;
  wire \FSM_sequential_state[0]_i_5_n_0 ;
  wire \FSM_sequential_state[0]_i_6_n_0 ;
  wire \FSM_sequential_state[0]_i_7_n_0 ;
  wire \FSM_sequential_state[0]_i_8_n_0 ;
  wire \FSM_sequential_state[1]_i_10_n_0 ;
  wire \FSM_sequential_state[1]_i_12_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_2_n_0 ;
  wire \FSM_sequential_state[1]_i_3_n_0 ;
  wire \FSM_sequential_state[1]_i_4_n_0 ;
  wire \FSM_sequential_state[1]_i_5_n_0 ;
  wire \FSM_sequential_state[1]_i_6_n_0 ;
  wire \FSM_sequential_state[1]_i_7_n_0 ;
  wire \FSM_sequential_state[1]_i_8_n_0 ;
  wire \FSM_sequential_state[1]_i_9_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_2_n_0 ;
  wire \FSM_sequential_state[2]_i_3_n_0 ;
  wire \FSM_sequential_state[3]_i_1_n_0 ;
  wire \FSM_sequential_state[3]_i_2_n_0 ;
  wire \FSM_sequential_state[3]_i_3_n_0 ;
  wire \FSM_sequential_state[4]_i_2_n_0 ;
  wire \FSM_sequential_state[4]_i_3_n_0 ;
  wire \FSM_sequential_state[4]_i_5_n_0 ;
  wire \FSM_sequential_state[4]_i_7_n_0 ;
  wire \FSM_sequential_state_reg[0]_0 ;
  wire \FSM_sequential_state_reg[0]_1 ;
  wire \FSM_sequential_state_reg[0]_2 ;
  wire \FSM_sequential_state_reg[0]_3 ;
  wire [0:0]\FSM_sequential_state_reg[1]_0 ;
  wire \FSM_sequential_state_reg[1]_1 ;
  wire \FSM_sequential_state_reg[2]_0 ;
  wire \GCSR_reg[0]_i_4_n_0 ;
  wire \GCSR_reg[0]_i_6_n_0 ;
  wire \GCSR_reg[0]_i_7_n_0 ;
  wire \GCSR_reg[1]_i_2_n_0 ;
  wire \GCSR_reg[1]_i_5_n_0 ;
  wire [0:0]GCSR_reg__0;
  wire \GCSR_reg_reg[1] ;
  wire \GCSR_reg_reg[1]_0 ;
  wire [0:0]\GCSR_reg_reg[1]_1 ;
  wire [4:0]Q;
  wire \SCSR0_reg[9]_i_2_n_0 ;
  wire \SCSR0_reg[9]_i_3_n_0 ;
  wire \SCSR0_reg[9]_i_4_n_0 ;
  wire \SCSR0_reg_reg[9] ;
  wire \SCSR0_reg_reg[9]_0 ;
  wire \SCSR0_reg_reg[9]_1 ;
  wire [0:0]SR;
  wire \_inferred__5/s_lcd_state[0]_i_1_n_0 ;
  wire \_inferred__5/s_lcd_state[1]_i_1_n_0 ;
  wire \_inferred__5/s_lcd_state[2]_i_1_n_0 ;
  wire \_inferred__5/s_lcd_state[3]_i_1_n_0 ;
  wire \_inferred__5/s_lcd_state[4]_i_2_n_0 ;
  wire [1:0]in24;
  wire [6:0]in25;
  wire [6:0]ns_ddram_pos_last_written0_in;
  wire ns_executing_command;
  wire [6:0]ns_next_ddram_pos;
  wire ns_writing_data;
  wire [3:0]o_db4_7;
  wire o_read_write_enable;
  wire o_register_select;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire s_cursor_blink_reg_0;
  wire s_cursor_on_reg_0;
  wire [7:0]s_data;
  wire \s_data[0]_i_1_n_0 ;
  wire \s_data[0]_i_2_n_0 ;
  wire \s_data[0]_i_3_n_0 ;
  wire \s_data[1]_i_1_n_0 ;
  wire \s_data[1]_i_2_n_0 ;
  wire \s_data[2]_i_1_n_0 ;
  wire \s_data[2]_i_2_n_0 ;
  wire \s_data[3]_i_1_n_0 ;
  wire \s_data[3]_i_2_n_0 ;
  wire \s_data[4]_i_1_n_0 ;
  wire \s_data[5]_i_1_n_0 ;
  wire \s_data[6]_i_1_n_0 ;
  wire \s_data[7]_i_1_n_0 ;
  wire \s_data[7]_i_2_n_0 ;
  wire \s_ddram_pos_last_written[7]_i_1_n_0 ;
  wire [5:0]\s_ddram_pos_last_written_reg[7]_0 ;
  wire s_executing_command_i_4_n_0;
  wire s_executing_command_i_5_n_0;
  wire s_executing_command_reg_0;
  wire s_executing_command_reg_1;
  wire s_function_set_twice;
  wire s_function_set_twice_i_1_n_0;
  wire s_function_set_twice_i_2_n_0;
  wire s_lcd_initialized_i_1_n_0;
  wire [4:0]\s_lcd_state_reg[4]_0 ;
  wire [3:0]s_lower_nibble;
  wire \s_lower_nibble[3]_i_1_n_0 ;
  wire \s_next_ddram_pos[6]_i_1_n_0 ;
  wire \s_next_ddram_pos[6]_i_3_n_0 ;
  wire s_read_write_enable_i_1_n_0;
  wire s_register_select_i_4_n_0;
  wire s_register_select_i_6_n_0;
  wire s_register_select_i_7_n_0;
  wire s_send_lower;
  wire s_send_lower_i_1_n_0;
  wire s_send_lower_i_2_n_0;
  wire [7:0]s_symbol_to_write;
  wire [7:0]\s_symbol_to_write_reg[7]_0 ;
  wire [3:0]s_upper_nibble;
  wire s_writing_data;
  wire timing_controller_inst_n_2;
  wire timing_controller_inst_n_3;
  wire timing_controller_inst_n_4;
  wire timing_controller_inst_n_5;
  wire timing_controller_inst_n_6;
  wire w_ap_idle;
  wire w_ap_start;
  wire w_cursor_apply;
  wire w_lcd_initialized;

  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEEE)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(\FSM_sequential_state[0]_i_2_n_0 ),
        .I1(\FSM_sequential_state[0]_i_3_n_0 ),
        .I2(ns_writing_data),
        .I3(Q[2]),
        .I4(\FSM_sequential_state[0]_i_4_n_0 ),
        .I5(\FSM_sequential_state[0]_i_5_n_0 ),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h08080808FF080808)) 
    \FSM_sequential_state[0]_i_2 
       (.I0(\FSM_sequential_state[0]_i_6_n_0 ),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(\FSM_sequential_state[0]_i_7_n_0 ),
        .I4(\FSM_sequential_state[0]_i_8_n_0 ),
        .I5(s_register_select_i_7_n_0),
        .O(\FSM_sequential_state[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h01010001)) 
    \FSM_sequential_state[0]_i_3 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(s_executing_command_i_5_n_0),
        .I4(Q[2]),
        .O(\FSM_sequential_state[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA08000000FFFF)) 
    \FSM_sequential_state[0]_i_4 
       (.I0(\FSM_sequential_state_reg[2]_0 ),
        .I1(Q[1]),
        .I2(s_executing_command_reg_0),
        .I3(\FSM_sequential_state_reg[0]_3 ),
        .I4(Q[0]),
        .I5(Q[4]),
        .O(\FSM_sequential_state[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'h02020C00)) 
    \FSM_sequential_state[0]_i_5 
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(s_send_lower),
        .I4(Q[4]),
        .O(\FSM_sequential_state[0]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_state[0]_i_6 
       (.I0(Q[2]),
        .I1(Q[4]),
        .O(\FSM_sequential_state[0]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h8002)) 
    \FSM_sequential_state[0]_i_7 
       (.I0(s_data[0]),
        .I1(s_data[1]),
        .I2(s_data[2]),
        .I3(s_data[3]),
        .O(\FSM_sequential_state[0]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h00000040)) 
    \FSM_sequential_state[0]_i_8 
       (.I0(s_data[5]),
        .I1(Q[1]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(Q[2]),
        .O(\FSM_sequential_state[0]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFEFFFE)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(\FSM_sequential_state[1]_i_2_n_0 ),
        .I1(\FSM_sequential_state[1]_i_3_n_0 ),
        .I2(\FSM_sequential_state[1]_i_4_n_0 ),
        .I3(\FSM_sequential_state[1]_i_5_n_0 ),
        .I4(\FSM_sequential_state[1]_i_6_n_0 ),
        .I5(\FSM_sequential_state[1]_i_7_n_0 ),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h007F)) 
    \FSM_sequential_state[1]_i_10 
       (.I0(s_data[2]),
        .I1(s_data[0]),
        .I2(s_data[1]),
        .I3(s_data[5]),
        .O(\FSM_sequential_state[1]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_sequential_state[1]_i_12 
       (.I0(s_data[0]),
        .I1(s_data[1]),
        .O(\FSM_sequential_state[1]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hF0D5FFC0F0D5F0C0)) 
    \FSM_sequential_state[1]_i_2 
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(Q[1]),
        .I5(s_executing_command_i_5_n_0),
        .O(\FSM_sequential_state[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC8EAFFFFC8EAC8EA)) 
    \FSM_sequential_state[1]_i_3 
       (.I0(Q[0]),
        .I1(Q[4]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(s_data[3]),
        .I5(\FSM_sequential_state[1]_i_8_n_0 ),
        .O(\FSM_sequential_state[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0A000000FE000000)) 
    \FSM_sequential_state[1]_i_4 
       (.I0(\FSM_sequential_state[1]_i_9_n_0 ),
        .I1(\FSM_sequential_state[1]_i_10_n_0 ),
        .I2(s_register_select_i_7_n_0),
        .I3(Q[3]),
        .I4(Q[0]),
        .I5(s_writing_data),
        .O(\FSM_sequential_state[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFF4444444444444)) 
    \FSM_sequential_state[1]_i_5 
       (.I0(\FSM_sequential_state_reg[1]_1 ),
        .I1(\FSM_sequential_state[1]_i_6_n_0 ),
        .I2(\FSM_sequential_state[1]_i_12_n_0 ),
        .I3(s_data[2]),
        .I4(\FSM_sequential_state[1]_i_8_n_0 ),
        .I5(s_data[5]),
        .O(\FSM_sequential_state[1]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_state[1]_i_6 
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(\FSM_sequential_state[1]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_sequential_state[1]_i_7 
       (.I0(s_executing_command_reg_0),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\FSM_sequential_state[1]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \FSM_sequential_state[1]_i_8 
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(s_writing_data),
        .O(\FSM_sequential_state[1]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h00100100)) 
    \FSM_sequential_state[1]_i_9 
       (.I0(s_data[5]),
        .I1(s_data[3]),
        .I2(s_data[2]),
        .I3(s_data[0]),
        .I4(s_data[1]),
        .O(\FSM_sequential_state[1]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF01040404)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(\FSM_sequential_state[2]_i_2_n_0 ),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF404040FF4040)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(s_register_select_i_7_n_0),
        .I1(\FSM_sequential_state[2]_i_3_n_0 ),
        .I2(\FSM_sequential_state[3]_i_3_n_0 ),
        .I3(\FSM_sequential_state_reg[1]_0 ),
        .I4(w_ap_idle),
        .I5(s_executing_command_reg_0),
        .O(\FSM_sequential_state[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \FSM_sequential_state[2]_i_3 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[4]),
        .I3(Q[2]),
        .O(\FSM_sequential_state[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAABAAAAEAAAAAAAE)) 
    \FSM_sequential_state[3]_i_1 
       (.I0(\FSM_sequential_state[3]_i_2_n_0 ),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[4]),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(\FSM_sequential_state[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000004000000000)) 
    \FSM_sequential_state[3]_i_2 
       (.I0(s_register_select_i_7_n_0),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[4]),
        .I4(Q[2]),
        .I5(\FSM_sequential_state[3]_i_3_n_0 ),
        .O(\FSM_sequential_state[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h08010240)) 
    \FSM_sequential_state[3]_i_3 
       (.I0(s_data[2]),
        .I1(s_data[3]),
        .I2(s_data[5]),
        .I3(s_data[1]),
        .I4(s_data[0]),
        .O(\FSM_sequential_state[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFEAAAAAAAAAAAAAA)) 
    \FSM_sequential_state[4]_i_2 
       (.I0(\FSM_sequential_state[4]_i_7_n_0 ),
        .I1(s_register_select_i_6_n_0),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(\FSM_sequential_state[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_sequential_state[4]_i_3 
       (.I0(Q[0]),
        .I1(Q[3]),
        .O(\FSM_sequential_state[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h000C080B)) 
    \FSM_sequential_state[4]_i_5 
       (.I0(Q[4]),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(Q[2]),
        .I4(Q[1]),
        .O(\FSM_sequential_state[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA8880AAAA0A0A)) 
    \FSM_sequential_state[4]_i_7 
       (.I0(Q[4]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(\SCSR0_reg[9]_i_4_n_0 ),
        .I4(Q[3]),
        .I5(Q[2]),
        .O(\FSM_sequential_state[4]_i_7_n_0 ));
  (* FSM_ENCODED_STATES = "pulse_enable_delay:00110,pulse_enable:00111,wait_setup_delay:00100,write_cursor_pos:10001,check_cursor_pos:10000,init_func_set:00010,exec_delay:01011,init_wait_30ms_delay:00001,disable_enable_delay:01000,init_wait_30ms:00000,display_control:10101,wait_setup:00101,return_home:10100,setup_control_delay:01010,init_finished:01111,clear_display:10011,init_clear:01110,write:10110,setup_control:00011,ready:10010,init_entry_mode:01101,disable_enable:01001,init_disp_ctrl:01100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(s00_axi_aclk),
        .CE(timing_controller_inst_n_3),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(SR));
  (* FSM_ENCODED_STATES = "pulse_enable_delay:00110,pulse_enable:00111,wait_setup_delay:00100,write_cursor_pos:10001,check_cursor_pos:10000,init_func_set:00010,exec_delay:01011,init_wait_30ms_delay:00001,disable_enable_delay:01000,init_wait_30ms:00000,display_control:10101,wait_setup:00101,return_home:10100,setup_control_delay:01010,init_finished:01111,clear_display:10011,init_clear:01110,write:10110,setup_control:00011,ready:10010,init_entry_mode:01101,disable_enable:01001,init_disp_ctrl:01100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(s00_axi_aclk),
        .CE(timing_controller_inst_n_3),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(SR));
  (* FSM_ENCODED_STATES = "pulse_enable_delay:00110,pulse_enable:00111,wait_setup_delay:00100,write_cursor_pos:10001,check_cursor_pos:10000,init_func_set:00010,exec_delay:01011,init_wait_30ms_delay:00001,disable_enable_delay:01000,init_wait_30ms:00000,display_control:10101,wait_setup:00101,return_home:10100,setup_control_delay:01010,init_finished:01111,clear_display:10011,init_clear:01110,write:10110,setup_control:00011,ready:10010,init_entry_mode:01101,disable_enable:01001,init_disp_ctrl:01100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[2] 
       (.C(s00_axi_aclk),
        .CE(timing_controller_inst_n_3),
        .D(\FSM_sequential_state[2]_i_1_n_0 ),
        .Q(Q[2]),
        .R(SR));
  (* FSM_ENCODED_STATES = "pulse_enable_delay:00110,pulse_enable:00111,wait_setup_delay:00100,write_cursor_pos:10001,check_cursor_pos:10000,init_func_set:00010,exec_delay:01011,init_wait_30ms_delay:00001,disable_enable_delay:01000,init_wait_30ms:00000,display_control:10101,wait_setup:00101,return_home:10100,setup_control_delay:01010,init_finished:01111,clear_display:10011,init_clear:01110,write:10110,setup_control:00011,ready:10010,init_entry_mode:01101,disable_enable:01001,init_disp_ctrl:01100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[3] 
       (.C(s00_axi_aclk),
        .CE(timing_controller_inst_n_3),
        .D(\FSM_sequential_state[3]_i_1_n_0 ),
        .Q(Q[3]),
        .R(SR));
  (* FSM_ENCODED_STATES = "pulse_enable_delay:00110,pulse_enable:00111,wait_setup_delay:00100,write_cursor_pos:10001,check_cursor_pos:10000,init_func_set:00010,exec_delay:01011,init_wait_30ms_delay:00001,disable_enable_delay:01000,init_wait_30ms:00000,display_control:10101,wait_setup:00101,return_home:10100,setup_control_delay:01010,init_finished:01111,clear_display:10011,init_clear:01110,write:10110,setup_control:00011,ready:10010,init_entry_mode:01101,disable_enable:01001,init_disp_ctrl:01100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[4] 
       (.C(s00_axi_aclk),
        .CE(timing_controller_inst_n_3),
        .D(\FSM_sequential_state[4]_i_2_n_0 ),
        .Q(Q[4]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h0C00000A)) 
    \GCSR_reg[0]_i_4 
       (.I0(s_executing_command_i_5_n_0),
        .I1(\SCSR0_reg[9]_i_4_n_0 ),
        .I2(Q[3]),
        .I3(Q[2]),
        .I4(Q[1]),
        .O(\GCSR_reg[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'hAEE7)) 
    \GCSR_reg[0]_i_6 
       (.I0(s_data[5]),
        .I1(s_data[3]),
        .I2(s_data[1]),
        .I3(s_data[0]),
        .O(\GCSR_reg[0]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h4FF0)) 
    \GCSR_reg[0]_i_7 
       (.I0(s_data[3]),
        .I1(s_data[0]),
        .I2(s_data[2]),
        .I3(s_data[1]),
        .O(\GCSR_reg[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h4040444040404040)) 
    \GCSR_reg[1]_i_2 
       (.I0(Q[0]),
        .I1(Q[4]),
        .I2(\GCSR_reg[1]_i_5_n_0 ),
        .I3(\FSM_sequential_state_reg[2]_0 ),
        .I4(Q[1]),
        .I5(s_executing_command_i_5_n_0),
        .O(\GCSR_reg[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0808080800000008)) 
    \GCSR_reg[1]_i_5 
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(s_symbol_to_write[5]),
        .I4(s_symbol_to_write[6]),
        .I5(s_symbol_to_write[7]),
        .O(\GCSR_reg[1]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \GCSR_reg[1]_i_6 
       (.I0(Q[2]),
        .I1(Q[3]),
        .O(\FSM_sequential_state_reg[2]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'h00000200)) 
    \GCSR_reg[2]_i_1 
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[0]),
        .O(w_ap_idle));
  LUT5 #(
    .INIT(32'h20FF2020)) 
    \SCSR0_reg[9]_i_1 
       (.I0(\SCSR0_reg[9]_i_2_n_0 ),
        .I1(\SCSR0_reg[9]_i_3_n_0 ),
        .I2(\SCSR0_reg[9]_i_4_n_0 ),
        .I3(\SCSR0_reg_reg[9]_0 ),
        .I4(\SCSR0_reg_reg[9]_1 ),
        .O(\SCSR0_reg_reg[9] ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \SCSR0_reg[9]_i_2 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[1]),
        .O(\SCSR0_reg[9]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \SCSR0_reg[9]_i_3 
       (.I0(Q[0]),
        .I1(Q[3]),
        .O(\SCSR0_reg[9]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hAB)) 
    \SCSR0_reg[9]_i_4 
       (.I0(s_symbol_to_write[7]),
        .I1(s_symbol_to_write[6]),
        .I2(s_symbol_to_write[5]),
        .O(\SCSR0_reg[9]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'h00000100)) 
    \_inferred__5/s_lcd_state[0]_i_1 
       (.I0(Q[1]),
        .I1(Q[4]),
        .I2(Q[3]),
        .I3(Q[0]),
        .I4(Q[2]),
        .O(\_inferred__5/s_lcd_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \_inferred__5/s_lcd_state[1]_i_1 
       (.I0(Q[1]),
        .I1(Q[3]),
        .I2(Q[4]),
        .I3(Q[0]),
        .I4(Q[2]),
        .O(\_inferred__5/s_lcd_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'h00200030)) 
    \_inferred__5/s_lcd_state[2]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[4]),
        .I3(Q[3]),
        .I4(Q[1]),
        .O(\_inferred__5/s_lcd_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'h10000000)) 
    \_inferred__5/s_lcd_state[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[3]),
        .I2(Q[4]),
        .I3(Q[0]),
        .I4(Q[2]),
        .O(\_inferred__5/s_lcd_state[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'h004000A0)) 
    \_inferred__5/s_lcd_state[4]_i_2 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[4]),
        .I3(Q[3]),
        .I4(Q[1]),
        .O(\_inferred__5/s_lcd_state[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \o_db4_7[0]_INST_0 
       (.I0(s_lower_nibble[0]),
        .I1(s_send_lower),
        .I2(s_upper_nibble[0]),
        .O(o_db4_7[0]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \o_db4_7[1]_INST_0 
       (.I0(s_lower_nibble[1]),
        .I1(s_send_lower),
        .I2(s_upper_nibble[1]),
        .O(o_db4_7[1]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \o_db4_7[2]_INST_0 
       (.I0(s_lower_nibble[2]),
        .I1(s_send_lower),
        .I2(s_upper_nibble[2]),
        .O(o_db4_7[2]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \o_db4_7[3]_INST_0 
       (.I0(s_lower_nibble[3]),
        .I1(s_send_lower),
        .I2(s_upper_nibble[3]),
        .O(o_db4_7[3]));
  FDSE #(
    .INIT(1'b1)) 
    s_cursor_blink_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_cursor_blink_reg_0),
        .Q(in24[0]),
        .S(SR));
  FDSE #(
    .INIT(1'b1)) 
    s_cursor_on_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_cursor_on_reg_0),
        .Q(in24[1]),
        .S(SR));
  LUT2 #(
    .INIT(4'hE)) 
    \s_data[0]_i_1 
       (.I0(\s_data[0]_i_2_n_0 ),
        .I1(\s_data[0]_i_3_n_0 ),
        .O(\s_data[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h40400000FF000000)) 
    \s_data[0]_i_2 
       (.I0(Q[1]),
        .I1(in24[0]),
        .I2(Q[0]),
        .I3(in25[0]),
        .I4(Q[4]),
        .I5(Q[2]),
        .O(\s_data[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB0B0B0B0F0FF0000)) 
    \s_data[0]_i_3 
       (.I0(s_symbol_to_write[0]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[3]),
        .I5(Q[4]),
        .O(\s_data[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFAAAAAAAEEAAAAAA)) 
    \s_data[1]_i_1 
       (.I0(\s_data[1]_i_2_n_0 ),
        .I1(in24[1]),
        .I2(s_symbol_to_write[1]),
        .I3(Q[4]),
        .I4(Q[2]),
        .I5(Q[1]),
        .O(\s_data[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000F00AA00CC00AA)) 
    \s_data[1]_i_2 
       (.I0(Q[3]),
        .I1(in25[1]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[4]),
        .I5(Q[2]),
        .O(\s_data[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'hFFFF8000)) 
    \s_data[2]_i_1 
       (.I0(s_symbol_to_write[2]),
        .I1(Q[4]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(\s_data[2]_i_2_n_0 ),
        .O(\s_data[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \s_data[2]_i_2 
       (.I0(Q[3]),
        .I1(in25[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[4]),
        .I5(Q[2]),
        .O(\s_data[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'hEAAAAAAA)) 
    \s_data[3]_i_1 
       (.I0(\s_data[3]_i_2_n_0 ),
        .I1(s_symbol_to_write[3]),
        .I2(Q[4]),
        .I3(Q[2]),
        .I4(Q[1]),
        .O(\s_data[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h05F5053F05C5050F)) 
    \s_data[3]_i_2 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[4]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(in25[3]),
        .O(\s_data[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \s_data[4]_i_1 
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[4]),
        .I3(s_symbol_to_write[4]),
        .O(\s_data[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'hC5050505)) 
    \s_data[5]_i_1 
       (.I0(Q[3]),
        .I1(s_symbol_to_write[5]),
        .I2(Q[4]),
        .I3(Q[2]),
        .I4(Q[1]),
        .O(\s_data[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hA0000C00)) 
    \s_data[6]_i_1 
       (.I0(s_symbol_to_write[6]),
        .I1(in25[6]),
        .I2(Q[1]),
        .I3(Q[4]),
        .I4(Q[2]),
        .O(\s_data[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h030730F00F00000C)) 
    \s_data[7]_i_1 
       (.I0(\SCSR0_reg[9]_i_4_n_0 ),
        .I1(Q[1]),
        .I2(Q[3]),
        .I3(Q[0]),
        .I4(Q[4]),
        .I5(Q[2]),
        .O(\s_data[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h8030)) 
    \s_data[7]_i_2 
       (.I0(s_symbol_to_write[7]),
        .I1(Q[2]),
        .I2(Q[4]),
        .I3(Q[1]),
        .O(\s_data[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \s_data_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\s_data[7]_i_1_n_0 ),
        .D(\s_data[0]_i_1_n_0 ),
        .Q(s_data[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b1)) 
    \s_data_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\s_data[7]_i_1_n_0 ),
        .D(\s_data[1]_i_1_n_0 ),
        .Q(s_data[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b1)) 
    \s_data_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\s_data[7]_i_1_n_0 ),
        .D(\s_data[2]_i_1_n_0 ),
        .Q(s_data[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b1)) 
    \s_data_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\s_data[7]_i_1_n_0 ),
        .D(\s_data[3]_i_1_n_0 ),
        .Q(s_data[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b1)) 
    \s_data_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\s_data[7]_i_1_n_0 ),
        .D(\s_data[4]_i_1_n_0 ),
        .Q(s_data[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b1)) 
    \s_data_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\s_data[7]_i_1_n_0 ),
        .D(\s_data[5]_i_1_n_0 ),
        .Q(s_data[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b1)) 
    \s_data_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\s_data[7]_i_1_n_0 ),
        .D(\s_data[6]_i_1_n_0 ),
        .Q(s_data[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b1)) 
    \s_data_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\s_data[7]_i_1_n_0 ),
        .D(\s_data[7]_i_2_n_0 ),
        .Q(s_data[7]),
        .R(SR));
  LUT2 #(
    .INIT(4'hE)) 
    \s_ddram_pos_last_written[0]_i_1 
       (.I0(in25[0]),
        .I1(Q[1]),
        .O(ns_ddram_pos_last_written0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \s_ddram_pos_last_written[1]_i_1 
       (.I0(in25[1]),
        .I1(Q[1]),
        .O(ns_ddram_pos_last_written0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \s_ddram_pos_last_written[2]_i_1 
       (.I0(in25[2]),
        .I1(Q[1]),
        .O(ns_ddram_pos_last_written0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \s_ddram_pos_last_written[3]_i_1 
       (.I0(in25[3]),
        .I1(Q[1]),
        .O(ns_ddram_pos_last_written0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \s_ddram_pos_last_written[6]_i_1 
       (.I0(in25[6]),
        .I1(Q[1]),
        .O(ns_ddram_pos_last_written0_in[6]));
  LUT5 #(
    .INIT(32'h00090000)) 
    \s_ddram_pos_last_written[7]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(\s_ddram_pos_last_written[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \s_ddram_pos_last_written[7]_i_2 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .O(D));
  FDSE #(
    .INIT(1'b1)) 
    \s_ddram_pos_last_written_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\s_ddram_pos_last_written[7]_i_1_n_0 ),
        .D(ns_ddram_pos_last_written0_in[0]),
        .Q(\s_ddram_pos_last_written_reg[7]_0 [0]),
        .S(SR));
  FDSE #(
    .INIT(1'b1)) 
    \s_ddram_pos_last_written_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\s_ddram_pos_last_written[7]_i_1_n_0 ),
        .D(ns_ddram_pos_last_written0_in[1]),
        .Q(\s_ddram_pos_last_written_reg[7]_0 [1]),
        .S(SR));
  FDSE #(
    .INIT(1'b1)) 
    \s_ddram_pos_last_written_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\s_ddram_pos_last_written[7]_i_1_n_0 ),
        .D(ns_ddram_pos_last_written0_in[2]),
        .Q(\s_ddram_pos_last_written_reg[7]_0 [2]),
        .S(SR));
  FDSE #(
    .INIT(1'b1)) 
    \s_ddram_pos_last_written_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\s_ddram_pos_last_written[7]_i_1_n_0 ),
        .D(ns_ddram_pos_last_written0_in[3]),
        .Q(\s_ddram_pos_last_written_reg[7]_0 [3]),
        .S(SR));
  FDSE #(
    .INIT(1'b1)) 
    \s_ddram_pos_last_written_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\s_ddram_pos_last_written[7]_i_1_n_0 ),
        .D(ns_ddram_pos_last_written0_in[6]),
        .Q(\s_ddram_pos_last_written_reg[7]_0 [4]),
        .S(SR));
  FDSE #(
    .INIT(1'b1)) 
    \s_ddram_pos_last_written_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\s_ddram_pos_last_written[7]_i_1_n_0 ),
        .D(D),
        .Q(\s_ddram_pos_last_written_reg[7]_0 [5]),
        .S(SR));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    s_executing_command_i_4
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[4]),
        .O(s_executing_command_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    s_executing_command_i_5
       (.I0(in25[2]),
        .I1(in25[0]),
        .I2(in25[1]),
        .I3(in25[3]),
        .O(s_executing_command_i_5_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s_executing_command_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(timing_controller_inst_n_5),
        .Q(s_executing_command_reg_0),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000040)) 
    s_function_set_twice_i_1
       (.I0(Q[1]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(s_function_set_twice_i_2_n_0),
        .I4(s_send_lower),
        .I5(s_function_set_twice),
        .O(s_function_set_twice_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'hE)) 
    s_function_set_twice_i_2
       (.I0(Q[2]),
        .I1(Q[4]),
        .O(s_function_set_twice_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s_function_set_twice_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_function_set_twice_i_1_n_0),
        .Q(s_function_set_twice),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFFFFFF20000000)) 
    s_lcd_initialized_i_1
       (.I0(Q[2]),
        .I1(Q[4]),
        .I2(Q[3]),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(w_lcd_initialized),
        .O(s_lcd_initialized_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s_lcd_initialized_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_lcd_initialized_i_1_n_0),
        .Q(w_lcd_initialized),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_lcd_state_reg[0] 
       (.C(s00_axi_aclk),
        .CE(timing_controller_inst_n_2),
        .D(\_inferred__5/s_lcd_state[0]_i_1_n_0 ),
        .Q(\s_lcd_state_reg[4]_0 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_lcd_state_reg[1] 
       (.C(s00_axi_aclk),
        .CE(timing_controller_inst_n_2),
        .D(\_inferred__5/s_lcd_state[1]_i_1_n_0 ),
        .Q(\s_lcd_state_reg[4]_0 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_lcd_state_reg[2] 
       (.C(s00_axi_aclk),
        .CE(timing_controller_inst_n_2),
        .D(\_inferred__5/s_lcd_state[2]_i_1_n_0 ),
        .Q(\s_lcd_state_reg[4]_0 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_lcd_state_reg[3] 
       (.C(s00_axi_aclk),
        .CE(timing_controller_inst_n_2),
        .D(\_inferred__5/s_lcd_state[3]_i_1_n_0 ),
        .Q(\s_lcd_state_reg[4]_0 [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_lcd_state_reg[4] 
       (.C(s00_axi_aclk),
        .CE(timing_controller_inst_n_2),
        .D(\_inferred__5/s_lcd_state[4]_i_2_n_0 ),
        .Q(\s_lcd_state_reg[4]_0 [4]),
        .R(SR));
  LUT5 #(
    .INIT(32'h00001000)) 
    \s_lower_nibble[3]_i_1 
       (.I0(Q[2]),
        .I1(Q[4]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[3]),
        .O(\s_lower_nibble[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s_lower_nibble_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\s_lower_nibble[3]_i_1_n_0 ),
        .D(s_data[0]),
        .Q(s_lower_nibble[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_lower_nibble_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\s_lower_nibble[3]_i_1_n_0 ),
        .D(s_data[1]),
        .Q(s_lower_nibble[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_lower_nibble_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\s_lower_nibble[3]_i_1_n_0 ),
        .D(s_data[2]),
        .Q(s_lower_nibble[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_lower_nibble_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\s_lower_nibble[3]_i_1_n_0 ),
        .D(s_data[3]),
        .Q(s_lower_nibble[3]),
        .R(SR));
  LUT3 #(
    .INIT(8'h01)) 
    \s_next_ddram_pos[0]_i_1 
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(in25[0]),
        .O(ns_next_ddram_pos[0]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h0110)) 
    \s_next_ddram_pos[1]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(in25[0]),
        .I3(in25[1]),
        .O(ns_next_ddram_pos[1]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h01111000)) 
    \s_next_ddram_pos[2]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(in25[1]),
        .I3(in25[0]),
        .I4(in25[2]),
        .O(ns_next_ddram_pos[2]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \s_next_ddram_pos[3]_i_1 
       (.I0(\s_next_ddram_pos[6]_i_3_n_0 ),
        .I1(in25[2]),
        .I2(in25[0]),
        .I3(in25[1]),
        .I4(in25[3]),
        .O(ns_next_ddram_pos[3]));
  LUT5 #(
    .INIT(32'h04000300)) 
    \s_next_ddram_pos[6]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(Q[1]),
        .O(\s_next_ddram_pos[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \s_next_ddram_pos[6]_i_2 
       (.I0(in25[2]),
        .I1(in25[0]),
        .I2(in25[1]),
        .I3(in25[3]),
        .I4(\s_next_ddram_pos[6]_i_3_n_0 ),
        .I5(in25[6]),
        .O(ns_next_ddram_pos[6]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \s_next_ddram_pos[6]_i_3 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .O(\s_next_ddram_pos[6]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s_next_ddram_pos_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\s_next_ddram_pos[6]_i_1_n_0 ),
        .D(ns_next_ddram_pos[0]),
        .Q(in25[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_next_ddram_pos_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\s_next_ddram_pos[6]_i_1_n_0 ),
        .D(ns_next_ddram_pos[1]),
        .Q(in25[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_next_ddram_pos_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\s_next_ddram_pos[6]_i_1_n_0 ),
        .D(ns_next_ddram_pos[2]),
        .Q(in25[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_next_ddram_pos_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\s_next_ddram_pos[6]_i_1_n_0 ),
        .D(ns_next_ddram_pos[3]),
        .Q(in25[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_next_ddram_pos_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\s_next_ddram_pos[6]_i_1_n_0 ),
        .D(ns_next_ddram_pos[6]),
        .Q(in25[6]),
        .R(SR));
  LUT6 #(
    .INIT(64'hFDFFFFFE00000200)) 
    s_read_write_enable_i_1
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(Q[4]),
        .I3(Q[2]),
        .I4(Q[1]),
        .I5(o_read_write_enable),
        .O(s_read_write_enable_i_1_n_0));
  FDSE #(
    .INIT(1'b1)) 
    s_read_write_enable_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_read_write_enable_i_1_n_0),
        .Q(o_read_write_enable),
        .S(SR));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h00001110)) 
    s_register_select_i_3
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(s_symbol_to_write[5]),
        .I3(s_symbol_to_write[6]),
        .I4(s_symbol_to_write[7]),
        .O(ns_writing_data));
  LUT6 #(
    .INIT(64'h1400040114004401)) 
    s_register_select_i_4
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[4]),
        .I4(Q[0]),
        .I5(\SCSR0_reg[9]_i_4_n_0 ),
        .O(s_register_select_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFEFFFFBFFFFBEF)) 
    s_register_select_i_6
       (.I0(s_register_select_i_7_n_0),
        .I1(s_data[2]),
        .I2(s_data[0]),
        .I3(s_data[1]),
        .I4(s_data[3]),
        .I5(s_data[5]),
        .O(s_register_select_i_6_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    s_register_select_i_7
       (.I0(s_data[4]),
        .I1(s_data[6]),
        .I2(s_data[7]),
        .I3(w_lcd_initialized),
        .O(s_register_select_i_7_n_0));
  FDSE #(
    .INIT(1'b1)) 
    s_register_select_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(timing_controller_inst_n_6),
        .Q(o_register_select),
        .S(SR));
  LUT4 #(
    .INIT(16'h0F40)) 
    s_send_lower_i_1
       (.I0(Q[4]),
        .I1(s_function_set_twice),
        .I2(s_send_lower_i_2_n_0),
        .I3(s_send_lower),
        .O(s_send_lower_i_1_n_0));
  LUT6 #(
    .INIT(64'h000030400300C0F0)) 
    s_send_lower_i_2
       (.I0(\SCSR0_reg[9]_i_4_n_0 ),
        .I1(Q[2]),
        .I2(Q[4]),
        .I3(Q[0]),
        .I4(Q[3]),
        .I5(Q[1]),
        .O(s_send_lower_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s_send_lower_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_send_lower_i_1_n_0),
        .Q(s_send_lower),
        .R(SR));
  FDSE #(
    .INIT(1'b1)) 
    \s_symbol_to_write_reg[0] 
       (.C(s00_axi_aclk),
        .CE(E),
        .D(\s_symbol_to_write_reg[7]_0 [0]),
        .Q(s_symbol_to_write[0]),
        .S(SR));
  FDSE #(
    .INIT(1'b1)) 
    \s_symbol_to_write_reg[1] 
       (.C(s00_axi_aclk),
        .CE(E),
        .D(\s_symbol_to_write_reg[7]_0 [1]),
        .Q(s_symbol_to_write[1]),
        .S(SR));
  FDSE #(
    .INIT(1'b1)) 
    \s_symbol_to_write_reg[2] 
       (.C(s00_axi_aclk),
        .CE(E),
        .D(\s_symbol_to_write_reg[7]_0 [2]),
        .Q(s_symbol_to_write[2]),
        .S(SR));
  FDSE #(
    .INIT(1'b1)) 
    \s_symbol_to_write_reg[3] 
       (.C(s00_axi_aclk),
        .CE(E),
        .D(\s_symbol_to_write_reg[7]_0 [3]),
        .Q(s_symbol_to_write[3]),
        .S(SR));
  FDSE #(
    .INIT(1'b1)) 
    \s_symbol_to_write_reg[4] 
       (.C(s00_axi_aclk),
        .CE(E),
        .D(\s_symbol_to_write_reg[7]_0 [4]),
        .Q(s_symbol_to_write[4]),
        .S(SR));
  FDSE #(
    .INIT(1'b1)) 
    \s_symbol_to_write_reg[5] 
       (.C(s00_axi_aclk),
        .CE(E),
        .D(\s_symbol_to_write_reg[7]_0 [5]),
        .Q(s_symbol_to_write[5]),
        .S(SR));
  FDSE #(
    .INIT(1'b1)) 
    \s_symbol_to_write_reg[6] 
       (.C(s00_axi_aclk),
        .CE(E),
        .D(\s_symbol_to_write_reg[7]_0 [6]),
        .Q(s_symbol_to_write[6]),
        .S(SR));
  FDSE #(
    .INIT(1'b1)) 
    \s_symbol_to_write_reg[7] 
       (.C(s00_axi_aclk),
        .CE(E),
        .D(\s_symbol_to_write_reg[7]_0 [7]),
        .Q(s_symbol_to_write[7]),
        .S(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_upper_nibble_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\s_lower_nibble[3]_i_1_n_0 ),
        .D(s_data[4]),
        .Q(s_upper_nibble[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_upper_nibble_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\s_lower_nibble[3]_i_1_n_0 ),
        .D(s_data[5]),
        .Q(s_upper_nibble[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_upper_nibble_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\s_lower_nibble[3]_i_1_n_0 ),
        .D(s_data[6]),
        .Q(s_upper_nibble[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_upper_nibble_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\s_lower_nibble[3]_i_1_n_0 ),
        .D(s_data[7]),
        .Q(s_upper_nibble[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    s_writing_data_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(timing_controller_inst_n_4),
        .Q(s_writing_data),
        .R(SR));
  mbblockdesign_ad_0_0_timing_controller timing_controller_inst
       (.DCR_reg(DCR_reg),
        .\DCR_reg_reg[4] (\GCSR_reg[0]_i_6_n_0 ),
        .\DCR_reg_reg[4]_0 (\GCSR_reg[0]_i_7_n_0 ),
        .\DCR_reg_reg[4]_1 (s_register_select_i_7_n_0),
        .E(timing_controller_inst_n_2),
        .\FSM_sequential_state_reg[0] (\FSM_sequential_state_reg[0]_0 ),
        .\FSM_sequential_state_reg[0]_0 (\FSM_sequential_state_reg[0]_1 ),
        .\FSM_sequential_state_reg[0]_1 (\FSM_sequential_state[4]_i_3_n_0 ),
        .\FSM_sequential_state_reg[0]_2 (\FSM_sequential_state_reg[0]_2 ),
        .\FSM_sequential_state_reg[0]_3 (\FSM_sequential_state[4]_i_5_n_0 ),
        .\FSM_sequential_state_reg[1] (timing_controller_inst_n_3),
        .\FSM_sequential_state_reg[1]_0 (timing_controller_inst_n_6),
        .GCSR_reg__0(GCSR_reg__0),
        .\GCSR_reg_reg[0] (\GCSR_reg[0]_i_4_n_0 ),
        .\GCSR_reg_reg[1] (\GCSR_reg_reg[1] ),
        .\GCSR_reg_reg[1]_0 (\GCSR_reg[1]_i_2_n_0 ),
        .\GCSR_reg_reg[1]_1 (\GCSR_reg_reg[1]_0 ),
        .\GCSR_reg_reg[1]_2 (\GCSR_reg_reg[1]_1 ),
        .\GCSR_reg_reg[1]_3 (s_function_set_twice_i_2_n_0),
        .Q(Q),
        .SS(SR),
        .\delay_time_reg[17]_0 (s_data),
        .ns_executing_command(ns_executing_command),
        .ns_writing_data(ns_writing_data),
        .o_register_select(o_register_select),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s_executing_command_reg(timing_controller_inst_n_5),
        .s_executing_command_reg_0(s_executing_command_reg_0),
        .s_executing_command_reg_1(s_executing_command_reg_1),
        .s_executing_command_reg_2(s_executing_command_i_4_n_0),
        .s_executing_command_reg_3(s_executing_command_i_5_n_0),
        .\s_lcd_state_reg[0] (\SCSR0_reg[9]_i_3_n_0 ),
        .\s_lcd_state_reg[0]_0 (s_symbol_to_write[7:5]),
        .s_register_select_reg(s_register_select_i_4_n_0),
        .s_send_lower(s_send_lower),
        .s_writing_data(s_writing_data),
        .s_writing_data_reg(timing_controller_inst_n_4),
        .s_writing_data_reg_0(s_register_select_i_6_n_0),
        .s_writing_data_reg_1(\SCSR0_reg[9]_i_2_n_0 ),
        .w_ap_start(w_ap_start),
        .w_cursor_apply(w_cursor_apply));
endmodule

(* ORIG_REF_NAME = "timing_controller" *) 
module mbblockdesign_ad_0_0_timing_controller
   (SS,
    \GCSR_reg_reg[1] ,
    E,
    \FSM_sequential_state_reg[1] ,
    s_writing_data_reg,
    s_executing_command_reg,
    \FSM_sequential_state_reg[1]_0 ,
    \FSM_sequential_state_reg[0] ,
    \FSM_sequential_state_reg[0]_0 ,
    s00_axi_aclk,
    \GCSR_reg_reg[1]_0 ,
    s_writing_data_reg_0,
    \GCSR_reg_reg[1]_1 ,
    \GCSR_reg_reg[1]_2 ,
    Q,
    \s_lcd_state_reg[0] ,
    \s_lcd_state_reg[0]_0 ,
    \FSM_sequential_state_reg[0]_1 ,
    \FSM_sequential_state_reg[0]_2 ,
    \FSM_sequential_state_reg[0]_3 ,
    s00_axi_aresetn,
    \DCR_reg_reg[4] ,
    \DCR_reg_reg[4]_0 ,
    \DCR_reg_reg[4]_1 ,
    s_executing_command_reg_0,
    s_writing_data,
    \GCSR_reg_reg[1]_3 ,
    \delay_time_reg[17]_0 ,
    s_send_lower,
    s_writing_data_reg_1,
    ns_writing_data,
    ns_executing_command,
    s_executing_command_reg_1,
    s_executing_command_reg_2,
    s_executing_command_reg_3,
    s_register_select_reg,
    o_register_select,
    GCSR_reg__0,
    \GCSR_reg_reg[0] ,
    w_ap_start,
    DCR_reg,
    w_cursor_apply);
  output [0:0]SS;
  output \GCSR_reg_reg[1] ;
  output [0:0]E;
  output [0:0]\FSM_sequential_state_reg[1] ;
  output s_writing_data_reg;
  output s_executing_command_reg;
  output \FSM_sequential_state_reg[1]_0 ;
  output \FSM_sequential_state_reg[0] ;
  output \FSM_sequential_state_reg[0]_0 ;
  input s00_axi_aclk;
  input \GCSR_reg_reg[1]_0 ;
  input s_writing_data_reg_0;
  input \GCSR_reg_reg[1]_1 ;
  input [0:0]\GCSR_reg_reg[1]_2 ;
  input [4:0]Q;
  input \s_lcd_state_reg[0] ;
  input [2:0]\s_lcd_state_reg[0]_0 ;
  input \FSM_sequential_state_reg[0]_1 ;
  input \FSM_sequential_state_reg[0]_2 ;
  input \FSM_sequential_state_reg[0]_3 ;
  input s00_axi_aresetn;
  input \DCR_reg_reg[4] ;
  input \DCR_reg_reg[4]_0 ;
  input \DCR_reg_reg[4]_1 ;
  input s_executing_command_reg_0;
  input s_writing_data;
  input \GCSR_reg_reg[1]_3 ;
  input [7:0]\delay_time_reg[17]_0 ;
  input s_send_lower;
  input s_writing_data_reg_1;
  input ns_writing_data;
  input ns_executing_command;
  input s_executing_command_reg_1;
  input s_executing_command_reg_2;
  input s_executing_command_reg_3;
  input s_register_select_reg;
  input o_register_select;
  input [0:0]GCSR_reg__0;
  input \GCSR_reg_reg[0] ;
  input w_ap_start;
  input [0:0]DCR_reg;
  input w_cursor_apply;

  wire [0:0]DCR_reg;
  wire \DCR_reg_reg[4] ;
  wire \DCR_reg_reg[4]_0 ;
  wire \DCR_reg_reg[4]_1 ;
  wire [0:0]E;
  wire \FSM_sequential_state[4]_i_6_n_0 ;
  wire \FSM_sequential_state_reg[0] ;
  wire \FSM_sequential_state_reg[0]_0 ;
  wire \FSM_sequential_state_reg[0]_1 ;
  wire \FSM_sequential_state_reg[0]_2 ;
  wire \FSM_sequential_state_reg[0]_3 ;
  wire [0:0]\FSM_sequential_state_reg[1] ;
  wire \FSM_sequential_state_reg[1]_0 ;
  wire \GCSR_reg[0]_i_3_n_0 ;
  wire \GCSR_reg[1]_i_3_n_0 ;
  wire [0:0]GCSR_reg__0;
  wire \GCSR_reg_reg[0] ;
  wire \GCSR_reg_reg[1] ;
  wire \GCSR_reg_reg[1]_0 ;
  wire \GCSR_reg_reg[1]_1 ;
  wire [0:0]\GCSR_reg_reg[1]_2 ;
  wire \GCSR_reg_reg[1]_3 ;
  wire [4:0]Q;
  wire [0:0]SS;
  wire [21:0]counter;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[0]_i_2_n_0 ;
  wire \counter[21]_i_1_n_0 ;
  wire \counter_reg[12]_i_1_n_0 ;
  wire \counter_reg[12]_i_1_n_1 ;
  wire \counter_reg[12]_i_1_n_2 ;
  wire \counter_reg[12]_i_1_n_3 ;
  wire \counter_reg[16]_i_1_n_0 ;
  wire \counter_reg[16]_i_1_n_1 ;
  wire \counter_reg[16]_i_1_n_2 ;
  wire \counter_reg[16]_i_1_n_3 ;
  wire \counter_reg[20]_i_1_n_0 ;
  wire \counter_reg[20]_i_1_n_1 ;
  wire \counter_reg[20]_i_1_n_2 ;
  wire \counter_reg[20]_i_1_n_3 ;
  wire \counter_reg[4]_i_1_n_0 ;
  wire \counter_reg[4]_i_1_n_1 ;
  wire \counter_reg[4]_i_1_n_2 ;
  wire \counter_reg[4]_i_1_n_3 ;
  wire \counter_reg[8]_i_1_n_0 ;
  wire \counter_reg[8]_i_1_n_1 ;
  wire \counter_reg[8]_i_1_n_2 ;
  wire \counter_reg[8]_i_1_n_3 ;
  wire [21:0]delay_time;
  wire \delay_time[17]_i_2_n_0 ;
  wire \delay_time[17]_i_3_n_0 ;
  wire [7:0]\delay_time_reg[17]_0 ;
  wire done_i_1_n_0;
  wire ns_executing_command;
  wire ns_writing_data;
  wire nstate;
  wire nstate1_carry__0_i_1_n_0;
  wire nstate1_carry__0_i_2_n_0;
  wire nstate1_carry__0_i_3_n_0;
  wire nstate1_carry__0_i_4_n_0;
  wire nstate1_carry__0_i_5_n_0;
  wire nstate1_carry__0_i_6_n_0;
  wire nstate1_carry__0_i_7_n_0;
  wire nstate1_carry__0_n_0;
  wire nstate1_carry__0_n_1;
  wire nstate1_carry__0_n_2;
  wire nstate1_carry__0_n_3;
  wire nstate1_carry__1_i_1_n_0;
  wire nstate1_carry__1_i_2_n_0;
  wire nstate1_carry__1_i_3_n_0;
  wire nstate1_carry__1_i_4_n_0;
  wire nstate1_carry__1_i_5_n_0;
  wire nstate1_carry__1_i_6_n_0;
  wire nstate1_carry__1_n_1;
  wire nstate1_carry__1_n_2;
  wire nstate1_carry__1_n_3;
  wire nstate1_carry_i_1_n_0;
  wire nstate1_carry_i_2_n_0;
  wire nstate1_carry_i_3_n_0;
  wire nstate1_carry_i_4_n_0;
  wire nstate1_carry_i_5_n_0;
  wire nstate1_carry_i_6_n_0;
  wire nstate1_carry_i_7_n_0;
  wire nstate1_carry_i_8_n_0;
  wire nstate1_carry_n_0;
  wire nstate1_carry_n_1;
  wire nstate1_carry_n_2;
  wire nstate1_carry_n_3;
  wire o_done;
  wire o_register_select;
  wire [21:1]plusOp;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire s_executing_command_reg;
  wire s_executing_command_reg_0;
  wire s_executing_command_reg_1;
  wire s_executing_command_reg_2;
  wire s_executing_command_reg_3;
  wire \s_lcd_state[4]_i_3_n_0 ;
  wire \s_lcd_state_reg[0] ;
  wire [2:0]\s_lcd_state_reg[0]_0 ;
  wire s_register_select_i_5_n_0;
  wire s_register_select_reg;
  wire s_send_lower;
  wire [21:0]s_timer_delay_time;
  wire s_writing_data;
  wire s_writing_data_reg;
  wire s_writing_data_reg_0;
  wire s_writing_data_reg_1;
  wire state;
  wire state_i_1_n_0;
  wire w_ap_start;
  wire w_cursor_apply;
  wire [3:0]\NLW_counter_reg[21]_i_2_CO_UNCONNECTED ;
  wire [3:1]\NLW_counter_reg[21]_i_2_O_UNCONNECTED ;
  wire [3:0]NLW_nstate1_carry_O_UNCONNECTED;
  wire [3:0]NLW_nstate1_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_nstate1_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_nstate1_carry__1_O_UNCONNECTED;

  LUT6 #(
    .INIT(64'hBABBBBBBAAAAAAAA)) 
    \DCR_reg[4]_i_1 
       (.I0(DCR_reg),
        .I1(\GCSR_reg[0]_i_3_n_0 ),
        .I2(Q[0]),
        .I3(Q[4]),
        .I4(\GCSR_reg_reg[0] ),
        .I5(w_cursor_apply),
        .O(\FSM_sequential_state_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF02)) 
    \FSM_sequential_state[4]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_1 ),
        .I1(Q[1]),
        .I2(Q[4]),
        .I3(\FSM_sequential_state_reg[0]_2 ),
        .I4(\FSM_sequential_state_reg[0]_3 ),
        .I5(\FSM_sequential_state[4]_i_6_n_0 ),
        .O(\FSM_sequential_state_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h03FE00AB)) 
    \FSM_sequential_state[4]_i_6 
       (.I0(o_done),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[4]),
        .I4(Q[2]),
        .O(\FSM_sequential_state[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hBABBBBBBAAAAAAAA)) 
    \GCSR_reg[0]_i_1 
       (.I0(GCSR_reg__0),
        .I1(\GCSR_reg[0]_i_3_n_0 ),
        .I2(Q[0]),
        .I3(Q[4]),
        .I4(\GCSR_reg_reg[0] ),
        .I5(w_ap_start),
        .O(\FSM_sequential_state_reg[0] ));
  LUT6 #(
    .INIT(64'h00000000FE000000)) 
    \GCSR_reg[0]_i_3 
       (.I0(\DCR_reg_reg[4] ),
        .I1(\DCR_reg_reg[4]_0 ),
        .I2(\DCR_reg_reg[4]_1 ),
        .I3(s_register_select_i_5_n_0),
        .I4(s_executing_command_reg_0),
        .I5(s_writing_data),
        .O(\GCSR_reg[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hEAFFEAEA)) 
    \GCSR_reg[1]_i_1 
       (.I0(\GCSR_reg_reg[1]_0 ),
        .I1(\GCSR_reg[1]_i_3_n_0 ),
        .I2(s_writing_data_reg_0),
        .I3(\GCSR_reg_reg[1]_1 ),
        .I4(\GCSR_reg_reg[1]_2 ),
        .O(\GCSR_reg_reg[1] ));
  LUT6 #(
    .INIT(64'h0040000000000000)) 
    \GCSR_reg[1]_i_3 
       (.I0(s_writing_data),
        .I1(s_executing_command_reg_0),
        .I2(\FSM_sequential_state_reg[0]_1 ),
        .I3(\GCSR_reg_reg[1]_3 ),
        .I4(o_done),
        .I5(Q[1]),
        .O(\GCSR_reg[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h4400F000)) 
    \counter[0]_i_1 
       (.I0(counter[0]),
        .I1(nstate1_carry__1_n_1),
        .I2(\counter[0]_i_2_n_0 ),
        .I3(s00_axi_aresetn),
        .I4(state),
        .O(\counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h010E0001)) 
    \counter[0]_i_2 
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[4]),
        .I3(Q[3]),
        .I4(Q[0]),
        .O(\counter[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \counter[21]_i_1 
       (.I0(nstate1_carry__1_n_1),
        .I1(s00_axi_aresetn),
        .I2(state),
        .O(\counter[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\counter[0]_i_1_n_0 ),
        .Q(counter[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[10]),
        .Q(counter[10]),
        .R(\counter[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[11]),
        .Q(counter[11]),
        .R(\counter[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[12]),
        .Q(counter[12]),
        .R(\counter[21]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[12]_i_1 
       (.CI(\counter_reg[8]_i_1_n_0 ),
        .CO({\counter_reg[12]_i_1_n_0 ,\counter_reg[12]_i_1_n_1 ,\counter_reg[12]_i_1_n_2 ,\counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[12:9]),
        .S(counter[12:9]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[13]),
        .Q(counter[13]),
        .R(\counter[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[14]),
        .Q(counter[14]),
        .R(\counter[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[15]),
        .Q(counter[15]),
        .R(\counter[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[16]),
        .Q(counter[16]),
        .R(\counter[21]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[16]_i_1 
       (.CI(\counter_reg[12]_i_1_n_0 ),
        .CO({\counter_reg[16]_i_1_n_0 ,\counter_reg[16]_i_1_n_1 ,\counter_reg[16]_i_1_n_2 ,\counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[16:13]),
        .S(counter[16:13]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[17]),
        .Q(counter[17]),
        .R(\counter[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[18] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[18]),
        .Q(counter[18]),
        .R(\counter[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[19] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[19]),
        .Q(counter[19]),
        .R(\counter[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[1]),
        .Q(counter[1]),
        .R(\counter[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[20] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[20]),
        .Q(counter[20]),
        .R(\counter[21]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[20]_i_1 
       (.CI(\counter_reg[16]_i_1_n_0 ),
        .CO({\counter_reg[20]_i_1_n_0 ,\counter_reg[20]_i_1_n_1 ,\counter_reg[20]_i_1_n_2 ,\counter_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[20:17]),
        .S(counter[20:17]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[21] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[21]),
        .Q(counter[21]),
        .R(\counter[21]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[21]_i_2 
       (.CI(\counter_reg[20]_i_1_n_0 ),
        .CO(\NLW_counter_reg[21]_i_2_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_counter_reg[21]_i_2_O_UNCONNECTED [3:1],plusOp[21]}),
        .S({1'b0,1'b0,1'b0,counter[21]}));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[2]),
        .Q(counter[2]),
        .R(\counter[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[3]),
        .Q(counter[3]),
        .R(\counter[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[4]),
        .Q(counter[4]),
        .R(\counter[21]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[4]_i_1 
       (.CI(1'b0),
        .CO({\counter_reg[4]_i_1_n_0 ,\counter_reg[4]_i_1_n_1 ,\counter_reg[4]_i_1_n_2 ,\counter_reg[4]_i_1_n_3 }),
        .CYINIT(counter[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[4:1]),
        .S(counter[4:1]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[5]),
        .Q(counter[5]),
        .R(\counter[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[6]),
        .Q(counter[6]),
        .R(\counter[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[7]),
        .Q(counter[7]),
        .R(\counter[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[8]),
        .Q(counter[8]),
        .R(\counter[21]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[8]_i_1 
       (.CI(\counter_reg[4]_i_1_n_0 ),
        .CO({\counter_reg[8]_i_1_n_0 ,\counter_reg[8]_i_1_n_1 ,\counter_reg[8]_i_1_n_2 ,\counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[8:5]),
        .S(counter[8:5]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(plusOp[9]),
        .Q(counter[9]),
        .R(\counter[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \delay_time[0]_i_1 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[0]),
        .O(s_timer_delay_time[0]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hAAAAAAAB)) 
    \delay_time[10]_i_1 
       (.I0(s_timer_delay_time[11]),
        .I1(Q[1]),
        .I2(Q[3]),
        .I3(Q[0]),
        .I4(Q[2]),
        .O(s_timer_delay_time[10]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hEB000000)) 
    \delay_time[11]_i_1 
       (.I0(\delay_time[17]_i_2_n_0 ),
        .I1(\delay_time_reg[17]_0 [1]),
        .I2(\delay_time_reg[17]_0 [0]),
        .I3(s_send_lower),
        .I4(\delay_time[17]_i_3_n_0 ),
        .O(s_timer_delay_time[11]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hAAAAAAAB)) 
    \delay_time[15]_i_1 
       (.I0(s_timer_delay_time[17]),
        .I1(Q[1]),
        .I2(Q[3]),
        .I3(Q[0]),
        .I4(Q[2]),
        .O(s_timer_delay_time[15]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h14000000)) 
    \delay_time[17]_i_1 
       (.I0(\delay_time[17]_i_2_n_0 ),
        .I1(\delay_time_reg[17]_0 [0]),
        .I2(\delay_time_reg[17]_0 [1]),
        .I3(s_send_lower),
        .I4(\delay_time[17]_i_3_n_0 ),
        .O(s_timer_delay_time[17]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \delay_time[17]_i_2 
       (.I0(\delay_time_reg[17]_0 [2]),
        .I1(\delay_time_reg[17]_0 [3]),
        .I2(\delay_time_reg[17]_0 [5]),
        .I3(\delay_time_reg[17]_0 [4]),
        .I4(\delay_time_reg[17]_0 [6]),
        .I5(\delay_time_reg[17]_0 [7]),
        .O(\delay_time[17]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h00001000)) 
    \delay_time[17]_i_3 
       (.I0(Q[2]),
        .I1(Q[4]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[1]),
        .O(\delay_time[17]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h00F01000)) 
    \delay_time[1]_i_1 
       (.I0(s_send_lower),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[1]),
        .O(s_timer_delay_time[1]));
  LUT6 #(
    .INIT(64'h0000000002020209)) 
    \delay_time[21]_i_1 
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(Q[4]),
        .I3(Q[2]),
        .I4(Q[1]),
        .I5(state),
        .O(nstate));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \delay_time[21]_i_2 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(Q[1]),
        .O(s_timer_delay_time[21]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h001030C0)) 
    \delay_time[2]_i_1 
       (.I0(s_send_lower),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[3]),
        .O(s_timer_delay_time[2]));
  LUT4 #(
    .INIT(16'h0040)) 
    \delay_time[3]_i_1 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(s_timer_delay_time[3]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h00000040)) 
    \delay_time[4]_i_1 
       (.I0(Q[1]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(s_send_lower),
        .O(s_timer_delay_time[4]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h000020C0)) 
    \delay_time[5]_i_1 
       (.I0(s_send_lower),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[1]),
        .O(s_timer_delay_time[5]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h0041)) 
    \delay_time[7]_i_1 
       (.I0(Q[1]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[2]),
        .O(s_timer_delay_time[7]));
  FDRE \delay_time_reg[0] 
       (.C(s00_axi_aclk),
        .CE(nstate),
        .D(s_timer_delay_time[0]),
        .Q(delay_time[0]),
        .R(SS));
  FDRE \delay_time_reg[10] 
       (.C(s00_axi_aclk),
        .CE(nstate),
        .D(s_timer_delay_time[10]),
        .Q(delay_time[10]),
        .R(SS));
  FDRE \delay_time_reg[11] 
       (.C(s00_axi_aclk),
        .CE(nstate),
        .D(s_timer_delay_time[11]),
        .Q(delay_time[11]),
        .R(SS));
  FDRE \delay_time_reg[15] 
       (.C(s00_axi_aclk),
        .CE(nstate),
        .D(s_timer_delay_time[15]),
        .Q(delay_time[15]),
        .R(SS));
  FDRE \delay_time_reg[17] 
       (.C(s00_axi_aclk),
        .CE(nstate),
        .D(s_timer_delay_time[17]),
        .Q(delay_time[17]),
        .R(SS));
  FDRE \delay_time_reg[1] 
       (.C(s00_axi_aclk),
        .CE(nstate),
        .D(s_timer_delay_time[1]),
        .Q(delay_time[1]),
        .R(SS));
  FDRE \delay_time_reg[21] 
       (.C(s00_axi_aclk),
        .CE(nstate),
        .D(s_timer_delay_time[21]),
        .Q(delay_time[21]),
        .R(SS));
  FDRE \delay_time_reg[2] 
       (.C(s00_axi_aclk),
        .CE(nstate),
        .D(s_timer_delay_time[2]),
        .Q(delay_time[2]),
        .R(SS));
  FDRE \delay_time_reg[3] 
       (.C(s00_axi_aclk),
        .CE(nstate),
        .D(s_timer_delay_time[3]),
        .Q(delay_time[3]),
        .R(SS));
  FDRE \delay_time_reg[4] 
       (.C(s00_axi_aclk),
        .CE(nstate),
        .D(s_timer_delay_time[4]),
        .Q(delay_time[4]),
        .R(SS));
  FDRE \delay_time_reg[5] 
       (.C(s00_axi_aclk),
        .CE(nstate),
        .D(s_timer_delay_time[5]),
        .Q(delay_time[5]),
        .R(SS));
  FDRE \delay_time_reg[7] 
       (.C(s00_axi_aclk),
        .CE(nstate),
        .D(s_timer_delay_time[7]),
        .Q(delay_time[7]),
        .R(SS));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h08)) 
    done_i_1
       (.I0(state),
        .I1(s00_axi_aresetn),
        .I2(nstate1_carry__1_n_1),
        .O(done_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    done_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(done_i_1_n_0),
        .Q(o_done),
        .R(1'b0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 nstate1_carry
       (.CI(1'b0),
        .CO({nstate1_carry_n_0,nstate1_carry_n_1,nstate1_carry_n_2,nstate1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({nstate1_carry_i_1_n_0,nstate1_carry_i_2_n_0,nstate1_carry_i_3_n_0,nstate1_carry_i_4_n_0}),
        .O(NLW_nstate1_carry_O_UNCONNECTED[3:0]),
        .S({nstate1_carry_i_5_n_0,nstate1_carry_i_6_n_0,nstate1_carry_i_7_n_0,nstate1_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 nstate1_carry__0
       (.CI(nstate1_carry_n_0),
        .CO({nstate1_carry__0_n_0,nstate1_carry__0_n_1,nstate1_carry__0_n_2,nstate1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({nstate1_carry__0_i_1_n_0,1'b0,nstate1_carry__0_i_2_n_0,nstate1_carry__0_i_3_n_0}),
        .O(NLW_nstate1_carry__0_O_UNCONNECTED[3:0]),
        .S({nstate1_carry__0_i_4_n_0,nstate1_carry__0_i_5_n_0,nstate1_carry__0_i_6_n_0,nstate1_carry__0_i_7_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    nstate1_carry__0_i_1
       (.I0(delay_time[15]),
        .I1(counter[15]),
        .I2(delay_time[21]),
        .I3(counter[14]),
        .O(nstate1_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    nstate1_carry__0_i_2
       (.I0(delay_time[11]),
        .I1(counter[11]),
        .I2(delay_time[10]),
        .I3(counter[10]),
        .O(nstate1_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    nstate1_carry__0_i_3
       (.I0(delay_time[10]),
        .I1(counter[9]),
        .I2(delay_time[11]),
        .I3(counter[8]),
        .O(nstate1_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    nstate1_carry__0_i_4
       (.I0(counter[14]),
        .I1(delay_time[21]),
        .I2(counter[15]),
        .I3(delay_time[15]),
        .O(nstate1_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    nstate1_carry__0_i_5
       (.I0(counter[12]),
        .I1(counter[13]),
        .O(nstate1_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    nstate1_carry__0_i_6
       (.I0(counter[11]),
        .I1(delay_time[11]),
        .I2(counter[10]),
        .I3(delay_time[10]),
        .O(nstate1_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    nstate1_carry__0_i_7
       (.I0(counter[8]),
        .I1(delay_time[11]),
        .I2(counter[9]),
        .I3(delay_time[10]),
        .O(nstate1_carry__0_i_7_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 nstate1_carry__1
       (.CI(nstate1_carry__0_n_0),
        .CO({NLW_nstate1_carry__1_CO_UNCONNECTED[3],nstate1_carry__1_n_1,nstate1_carry__1_n_2,nstate1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,nstate1_carry__1_i_1_n_0,nstate1_carry__1_i_2_n_0,nstate1_carry__1_i_3_n_0}),
        .O(NLW_nstate1_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,nstate1_carry__1_i_4_n_0,nstate1_carry__1_i_5_n_0,nstate1_carry__1_i_6_n_0}));
  LUT2 #(
    .INIT(4'h2)) 
    nstate1_carry__1_i_1
       (.I0(delay_time[21]),
        .I1(counter[21]),
        .O(nstate1_carry__1_i_1_n_0));
  LUT3 #(
    .INIT(8'h70)) 
    nstate1_carry__1_i_2
       (.I0(counter[19]),
        .I1(counter[18]),
        .I2(delay_time[21]),
        .O(nstate1_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    nstate1_carry__1_i_3
       (.I0(delay_time[17]),
        .I1(counter[17]),
        .I2(delay_time[21]),
        .I3(counter[16]),
        .O(nstate1_carry__1_i_3_n_0));
  LUT3 #(
    .INIT(8'h41)) 
    nstate1_carry__1_i_4
       (.I0(counter[20]),
        .I1(counter[21]),
        .I2(delay_time[21]),
        .O(nstate1_carry__1_i_4_n_0));
  LUT3 #(
    .INIT(8'h81)) 
    nstate1_carry__1_i_5
       (.I0(delay_time[21]),
        .I1(counter[18]),
        .I2(counter[19]),
        .O(nstate1_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    nstate1_carry__1_i_6
       (.I0(counter[16]),
        .I1(delay_time[21]),
        .I2(counter[17]),
        .I3(delay_time[17]),
        .O(nstate1_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    nstate1_carry_i_1
       (.I0(delay_time[7]),
        .I1(counter[7]),
        .I2(delay_time[21]),
        .I3(counter[6]),
        .O(nstate1_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    nstate1_carry_i_2
       (.I0(delay_time[5]),
        .I1(counter[5]),
        .I2(delay_time[4]),
        .I3(counter[4]),
        .O(nstate1_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    nstate1_carry_i_3
       (.I0(delay_time[3]),
        .I1(counter[3]),
        .I2(delay_time[2]),
        .I3(counter[2]),
        .O(nstate1_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    nstate1_carry_i_4
       (.I0(delay_time[1]),
        .I1(counter[1]),
        .I2(delay_time[0]),
        .I3(counter[0]),
        .O(nstate1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    nstate1_carry_i_5
       (.I0(counter[6]),
        .I1(delay_time[21]),
        .I2(counter[7]),
        .I3(delay_time[7]),
        .O(nstate1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    nstate1_carry_i_6
       (.I0(counter[5]),
        .I1(delay_time[5]),
        .I2(counter[4]),
        .I3(delay_time[4]),
        .O(nstate1_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    nstate1_carry_i_7
       (.I0(counter[3]),
        .I1(delay_time[3]),
        .I2(counter[2]),
        .I3(delay_time[2]),
        .O(nstate1_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    nstate1_carry_i_8
       (.I0(counter[1]),
        .I1(delay_time[1]),
        .I2(counter[0]),
        .I3(delay_time[0]),
        .O(nstate1_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'hAAAABBABAAAA88A8)) 
    s_executing_command_i_1
       (.I0(ns_executing_command),
        .I1(s_executing_command_reg_1),
        .I2(s_executing_command_reg_2),
        .I3(s_executing_command_reg_3),
        .I4(\GCSR_reg[0]_i_3_n_0 ),
        .I5(s_executing_command_reg_0),
        .O(s_executing_command_reg));
  LUT6 #(
    .INIT(64'hAAAAAAAAAEAEAEAA)) 
    \s_lcd_state[4]_i_1 
       (.I0(\s_lcd_state[4]_i_3_n_0 ),
        .I1(Q[4]),
        .I2(\s_lcd_state_reg[0] ),
        .I3(\s_lcd_state_reg[0]_0 [0]),
        .I4(\s_lcd_state_reg[0]_0 [1]),
        .I5(\s_lcd_state_reg[0]_0 [2]),
        .O(E));
  LUT6 #(
    .INIT(64'h0049004C0048004C)) 
    \s_lcd_state[4]_i_3 
       (.I0(Q[2]),
        .I1(Q[4]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[0]),
        .I5(o_done),
        .O(\s_lcd_state[4]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    s_register_select_i_1
       (.I0(s00_axi_aresetn),
        .O(SS));
  LUT6 #(
    .INIT(64'h888F8F8F88808080)) 
    s_register_select_i_2
       (.I0(ns_writing_data),
        .I1(Q[1]),
        .I2(s_register_select_reg),
        .I3(s_register_select_i_5_n_0),
        .I4(s_writing_data_reg_0),
        .I5(o_register_select),
        .O(\FSM_sequential_state_reg[1]_0 ));
  LUT6 #(
    .INIT(64'h0008000000000000)) 
    s_register_select_i_5
       (.I0(Q[1]),
        .I1(o_done),
        .I2(Q[2]),
        .I3(Q[4]),
        .I4(Q[0]),
        .I5(Q[3]),
        .O(s_register_select_i_5_n_0));
  LUT5 #(
    .INIT(32'hCFFF8888)) 
    s_writing_data_i_1
       (.I0(s_writing_data_reg_1),
        .I1(ns_writing_data),
        .I2(s_writing_data_reg_0),
        .I3(s_register_select_i_5_n_0),
        .I4(s_writing_data),
        .O(s_writing_data_reg));
  LUT3 #(
    .INIT(8'hB8)) 
    state_i_1
       (.I0(nstate1_carry__1_n_1),
        .I1(state),
        .I2(\counter[0]_i_2_n_0 ),
        .O(state_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    state_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(state_i_1_n_0),
        .Q(state),
        .R(SS));
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
