set_property SRC_FILE_INFO {cfile:/1work/fpgaproc/test_mb_pmod_maxsonar/test_mb_pmod_maxsonar.srcs/constrs_1/imports/pf_base_mb_bm_min_given/Arty-A7-100-Master.xdc rfile:../../../test_mb_pmod_maxsonar.srcs/constrs_1/imports/pf_base_mb_bm_min_given/Arty-A7-100-Master.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { sys_clock }]; #IO_L12P_T1_MRCC_35 Sch=gclk[100]
set_property src_info {type:XDC file:1 line:20 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G6    IOSTANDARD LVCMOS33 } [get_ports { pwm0_0 }]; #IO_L19P_T3_35 Sch=led0_r
set_property src_info {type:XDC file:1 line:197 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { gpio_rtl_tri_o[0]  }]; #IO_L18P_T2_A12_D28_14 Sch=ck_io[1] #pmodmaxsonar rx
set_property src_info {type:XDC file:1 line:198 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { uart_rtl_rxd  }]; #IO_L16P_T2_CSI_B_14 Sch=ck_io[0] #pmodmaxsonar tx
set_property src_info {type:XDC file:1 line:201 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports { uart_rtl_txd }]; #IO_L8P_T1_D11_14 Sch=ck_io[36] #txd here not necessary but implementation requires to tie it to a certain pin
