# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "C_S00_AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "G_AXI_AD_T_16_4MS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "G_AXI_AD_T_40_US" -parent ${Page_0}
  ipgui::add_param $IPINST -name "G_AXI_AD_T_H" -parent ${Page_0}
  ipgui::add_param $IPINST -name "G_AXI_AD_T_LOWER_UPPER_WAIT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "G_AXI_AD_T_POWER_ON" -parent ${Page_0}
  ipgui::add_param $IPINST -name "G_AXI_AD_T_SU" -parent ${Page_0}
  ipgui::add_param $IPINST -name "G_AXI_AD_T_W" -parent ${Page_0}


}

proc update_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S00_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S00_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to update C_S00_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S00_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.G_AXI_AD_T_16_4MS { PARAM_VALUE.G_AXI_AD_T_16_4MS } {
	# Procedure called to update G_AXI_AD_T_16_4MS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.G_AXI_AD_T_16_4MS { PARAM_VALUE.G_AXI_AD_T_16_4MS } {
	# Procedure called to validate G_AXI_AD_T_16_4MS
	return true
}

proc update_PARAM_VALUE.G_AXI_AD_T_40_US { PARAM_VALUE.G_AXI_AD_T_40_US } {
	# Procedure called to update G_AXI_AD_T_40_US when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.G_AXI_AD_T_40_US { PARAM_VALUE.G_AXI_AD_T_40_US } {
	# Procedure called to validate G_AXI_AD_T_40_US
	return true
}

proc update_PARAM_VALUE.G_AXI_AD_T_H { PARAM_VALUE.G_AXI_AD_T_H } {
	# Procedure called to update G_AXI_AD_T_H when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.G_AXI_AD_T_H { PARAM_VALUE.G_AXI_AD_T_H } {
	# Procedure called to validate G_AXI_AD_T_H
	return true
}

proc update_PARAM_VALUE.G_AXI_AD_T_LOWER_UPPER_WAIT { PARAM_VALUE.G_AXI_AD_T_LOWER_UPPER_WAIT } {
	# Procedure called to update G_AXI_AD_T_LOWER_UPPER_WAIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.G_AXI_AD_T_LOWER_UPPER_WAIT { PARAM_VALUE.G_AXI_AD_T_LOWER_UPPER_WAIT } {
	# Procedure called to validate G_AXI_AD_T_LOWER_UPPER_WAIT
	return true
}

proc update_PARAM_VALUE.G_AXI_AD_T_POWER_ON { PARAM_VALUE.G_AXI_AD_T_POWER_ON } {
	# Procedure called to update G_AXI_AD_T_POWER_ON when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.G_AXI_AD_T_POWER_ON { PARAM_VALUE.G_AXI_AD_T_POWER_ON } {
	# Procedure called to validate G_AXI_AD_T_POWER_ON
	return true
}

proc update_PARAM_VALUE.G_AXI_AD_T_SU { PARAM_VALUE.G_AXI_AD_T_SU } {
	# Procedure called to update G_AXI_AD_T_SU when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.G_AXI_AD_T_SU { PARAM_VALUE.G_AXI_AD_T_SU } {
	# Procedure called to validate G_AXI_AD_T_SU
	return true
}

proc update_PARAM_VALUE.G_AXI_AD_T_W { PARAM_VALUE.G_AXI_AD_T_W } {
	# Procedure called to update G_AXI_AD_T_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.G_AXI_AD_T_W { PARAM_VALUE.G_AXI_AD_T_W } {
	# Procedure called to validate G_AXI_AD_T_W
	return true
}


proc update_MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.G_AXI_AD_T_POWER_ON { MODELPARAM_VALUE.G_AXI_AD_T_POWER_ON PARAM_VALUE.G_AXI_AD_T_POWER_ON } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_AXI_AD_T_POWER_ON}] ${MODELPARAM_VALUE.G_AXI_AD_T_POWER_ON}
}

proc update_MODELPARAM_VALUE.G_AXI_AD_T_SU { MODELPARAM_VALUE.G_AXI_AD_T_SU PARAM_VALUE.G_AXI_AD_T_SU } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_AXI_AD_T_SU}] ${MODELPARAM_VALUE.G_AXI_AD_T_SU}
}

proc update_MODELPARAM_VALUE.G_AXI_AD_T_W { MODELPARAM_VALUE.G_AXI_AD_T_W PARAM_VALUE.G_AXI_AD_T_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_AXI_AD_T_W}] ${MODELPARAM_VALUE.G_AXI_AD_T_W}
}

proc update_MODELPARAM_VALUE.G_AXI_AD_T_H { MODELPARAM_VALUE.G_AXI_AD_T_H PARAM_VALUE.G_AXI_AD_T_H } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_AXI_AD_T_H}] ${MODELPARAM_VALUE.G_AXI_AD_T_H}
}

proc update_MODELPARAM_VALUE.G_AXI_AD_T_16_4MS { MODELPARAM_VALUE.G_AXI_AD_T_16_4MS PARAM_VALUE.G_AXI_AD_T_16_4MS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_AXI_AD_T_16_4MS}] ${MODELPARAM_VALUE.G_AXI_AD_T_16_4MS}
}

proc update_MODELPARAM_VALUE.G_AXI_AD_T_40_US { MODELPARAM_VALUE.G_AXI_AD_T_40_US PARAM_VALUE.G_AXI_AD_T_40_US } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_AXI_AD_T_40_US}] ${MODELPARAM_VALUE.G_AXI_AD_T_40_US}
}

proc update_MODELPARAM_VALUE.G_AXI_AD_T_LOWER_UPPER_WAIT { MODELPARAM_VALUE.G_AXI_AD_T_LOWER_UPPER_WAIT PARAM_VALUE.G_AXI_AD_T_LOWER_UPPER_WAIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_AXI_AD_T_LOWER_UPPER_WAIT}] ${MODELPARAM_VALUE.G_AXI_AD_T_LOWER_UPPER_WAIT}
}

