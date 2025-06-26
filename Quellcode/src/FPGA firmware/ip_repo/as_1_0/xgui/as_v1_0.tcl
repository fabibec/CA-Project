# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "C_AS_CONTROL_CALIBRATION_TIME" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_AS_CONTROL_FIRST_READING_TIME" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_AS_CONTROL_MS_DIVISOR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_AS_CONTROL_POWER_UP_TIME" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_AS_CONTROL_RANGE_READING_TIME" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_AS_UART_BAUDRATE_DIVISOR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_AS_UART_NUM_DATA_BITS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_DATA_WIDTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.C_AS_CONTROL_CALIBRATION_TIME { PARAM_VALUE.C_AS_CONTROL_CALIBRATION_TIME } {
	# Procedure called to update C_AS_CONTROL_CALIBRATION_TIME when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AS_CONTROL_CALIBRATION_TIME { PARAM_VALUE.C_AS_CONTROL_CALIBRATION_TIME } {
	# Procedure called to validate C_AS_CONTROL_CALIBRATION_TIME
	return true
}

proc update_PARAM_VALUE.C_AS_CONTROL_FIRST_READING_TIME { PARAM_VALUE.C_AS_CONTROL_FIRST_READING_TIME } {
	# Procedure called to update C_AS_CONTROL_FIRST_READING_TIME when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AS_CONTROL_FIRST_READING_TIME { PARAM_VALUE.C_AS_CONTROL_FIRST_READING_TIME } {
	# Procedure called to validate C_AS_CONTROL_FIRST_READING_TIME
	return true
}

proc update_PARAM_VALUE.C_AS_CONTROL_MS_DIVISOR { PARAM_VALUE.C_AS_CONTROL_MS_DIVISOR } {
	# Procedure called to update C_AS_CONTROL_MS_DIVISOR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AS_CONTROL_MS_DIVISOR { PARAM_VALUE.C_AS_CONTROL_MS_DIVISOR } {
	# Procedure called to validate C_AS_CONTROL_MS_DIVISOR
	return true
}

proc update_PARAM_VALUE.C_AS_CONTROL_POWER_UP_TIME { PARAM_VALUE.C_AS_CONTROL_POWER_UP_TIME } {
	# Procedure called to update C_AS_CONTROL_POWER_UP_TIME when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AS_CONTROL_POWER_UP_TIME { PARAM_VALUE.C_AS_CONTROL_POWER_UP_TIME } {
	# Procedure called to validate C_AS_CONTROL_POWER_UP_TIME
	return true
}

proc update_PARAM_VALUE.C_AS_CONTROL_RANGE_READING_TIME { PARAM_VALUE.C_AS_CONTROL_RANGE_READING_TIME } {
	# Procedure called to update C_AS_CONTROL_RANGE_READING_TIME when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AS_CONTROL_RANGE_READING_TIME { PARAM_VALUE.C_AS_CONTROL_RANGE_READING_TIME } {
	# Procedure called to validate C_AS_CONTROL_RANGE_READING_TIME
	return true
}

proc update_PARAM_VALUE.C_AS_UART_BAUDRATE_DIVISOR { PARAM_VALUE.C_AS_UART_BAUDRATE_DIVISOR } {
	# Procedure called to update C_AS_UART_BAUDRATE_DIVISOR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AS_UART_BAUDRATE_DIVISOR { PARAM_VALUE.C_AS_UART_BAUDRATE_DIVISOR } {
	# Procedure called to validate C_AS_UART_BAUDRATE_DIVISOR
	return true
}

proc update_PARAM_VALUE.C_AS_UART_NUM_DATA_BITS { PARAM_VALUE.C_AS_UART_NUM_DATA_BITS } {
	# Procedure called to update C_AS_UART_NUM_DATA_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AS_UART_NUM_DATA_BITS { PARAM_VALUE.C_AS_UART_NUM_DATA_BITS } {
	# Procedure called to validate C_AS_UART_NUM_DATA_BITS
	return true
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


proc update_MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_AS_UART_BAUDRATE_DIVISOR { MODELPARAM_VALUE.C_AS_UART_BAUDRATE_DIVISOR PARAM_VALUE.C_AS_UART_BAUDRATE_DIVISOR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AS_UART_BAUDRATE_DIVISOR}] ${MODELPARAM_VALUE.C_AS_UART_BAUDRATE_DIVISOR}
}

proc update_MODELPARAM_VALUE.C_AS_UART_NUM_DATA_BITS { MODELPARAM_VALUE.C_AS_UART_NUM_DATA_BITS PARAM_VALUE.C_AS_UART_NUM_DATA_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AS_UART_NUM_DATA_BITS}] ${MODELPARAM_VALUE.C_AS_UART_NUM_DATA_BITS}
}

proc update_MODELPARAM_VALUE.C_AS_CONTROL_MS_DIVISOR { MODELPARAM_VALUE.C_AS_CONTROL_MS_DIVISOR PARAM_VALUE.C_AS_CONTROL_MS_DIVISOR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AS_CONTROL_MS_DIVISOR}] ${MODELPARAM_VALUE.C_AS_CONTROL_MS_DIVISOR}
}

proc update_MODELPARAM_VALUE.C_AS_CONTROL_POWER_UP_TIME { MODELPARAM_VALUE.C_AS_CONTROL_POWER_UP_TIME PARAM_VALUE.C_AS_CONTROL_POWER_UP_TIME } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AS_CONTROL_POWER_UP_TIME}] ${MODELPARAM_VALUE.C_AS_CONTROL_POWER_UP_TIME}
}

proc update_MODELPARAM_VALUE.C_AS_CONTROL_CALIBRATION_TIME { MODELPARAM_VALUE.C_AS_CONTROL_CALIBRATION_TIME PARAM_VALUE.C_AS_CONTROL_CALIBRATION_TIME } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AS_CONTROL_CALIBRATION_TIME}] ${MODELPARAM_VALUE.C_AS_CONTROL_CALIBRATION_TIME}
}

proc update_MODELPARAM_VALUE.C_AS_CONTROL_FIRST_READING_TIME { MODELPARAM_VALUE.C_AS_CONTROL_FIRST_READING_TIME PARAM_VALUE.C_AS_CONTROL_FIRST_READING_TIME } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AS_CONTROL_FIRST_READING_TIME}] ${MODELPARAM_VALUE.C_AS_CONTROL_FIRST_READING_TIME}
}

proc update_MODELPARAM_VALUE.C_AS_CONTROL_RANGE_READING_TIME { MODELPARAM_VALUE.C_AS_CONTROL_RANGE_READING_TIME PARAM_VALUE.C_AS_CONTROL_RANGE_READING_TIME } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AS_CONTROL_RANGE_READING_TIME}] ${MODELPARAM_VALUE.C_AS_CONTROL_RANGE_READING_TIME}
}

