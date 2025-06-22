//////////////////////////////////////////////////////////////////////////////////
// Engineers: Fabian Becker, Nicolas Koch
// 
// Create Date: 05/30/2025 05:25:06 PM
// Module Name: as_tb
// Project Name: AS - an Axi Sonar IP
// Target Devices: Arty A7-100
// Tool Versions: 
// Description: 
// Testbench for AXI Verification
// 
// Version 1.0 - File Created
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
 
import axi_vip_pkg::*;
import as_axi_verification_axi_vip_0_0_pkg::*;


module as_tb();

  //TESTCASE DEFINITIONS
  typedef enum logic [2:0] {
    TWO_VALID = 3'b000,
    TWO_VALID_AUTO = 3'b001,
    FIRST_TIMEOUT_SECOND_VALID_AUTO = 3'b010,
    FIRST_VALID_SECOND_INVALID_TIMEOUT_AUTO = 3'b011,
    FIRST_INVALID_SECOND_VALID_AUTO = 3'b100,
    VALID_FREEZE = 3'b101,
    VALID_RESET_VALID = 3'b110,
    AXI_REGISTERS = 3'b111
  } testcase_t;
  
  testcase_t testcase;

  //CONTANT DEFINITIONS
  parameter integer C_S_AXI_CONTROL_ADDR_WIDTH = 12;
  parameter integer C_S_AXI_CONTROL_DATA_WIDTH = 32;
    
  //REGISTER DEFINITIONS
  //GCSR General/Global Control and Status Register slv_reg00 0x00 
  parameter GCSR_ADDR     = 6'h000;       
  parameter GCSR_START_MASK        = 32'h00000001;    
  parameter GCSR_DONE_MASK         = 32'h00000002;
  parameter GCSR_IDLE_MASK         = 32'h00000004;
  //parameter GCSR_READY_MASK        = 32'h00000008;
  //parameter GCSR_CONTINUE_MASK     = 32'h00000010; 
  parameter GCSR_AUTO_RESTART_MASK = 32'h00000080;
   
  //GIER slv_reg01 0x04  
  parameter GIER_ADDR     = 6'h004;
  //parameter GIER_GIE_MASK        = 32'h00000001;    
  
  //IPIER slv_reg02 0x08  
  parameter IPIER_ADDR     = 6'h008;
  //parameter IPIER_IPIE_MASK        = 32'h00000001;  
  
  //IPISR slv_reg03 0x0C  
  parameter IPISR_ADDR     = 6'h00C;
  //parameter IPISR_IPIS_MASK        = 32'h00000001;  
  
  //IDR ID Register slv_reg04 0x10
  parameter IDR_ADDR = 6'h010;
  parameter IDR_EXPECTED_VALUE = 32'h534F4E52; // "SONR"
  
  //VERR Version Register slv_reg05 0x14
  parameter VERR_ADDR = 6'h014;
  parameter VERR_EXPECTED_VALUE = 32'h80001000; // VERSION
  
  //SCSR0 Special Control and Status Register slv_reg06 0x18 
  parameter SCSR_ADDR = 6'h018;
  parameter SCSR_POWERUP_DONE_MASK = 32'h00000001;
  parameter SCSR_CALIB_DONE_MASK = 32'h00000002;
  parameter SCSR_READ_VALID_MASK = 32'h00000004; 
  parameter SCSR_RESETIP_MASK      = 32'h00000040;   
  parameter SCSR_FREEZEIP_MASK     = 32'h00000080;
  parameter SCSR_WRITABLE_MASK     = 32'h000000C0; // Only bits 7:6 writable
  
  //DIST0 Distance Value Register slv_reg07 0x1C 
  parameter DIST0_ADDR = 6'h01C;
  parameter DIST0_DIST_IN_MASK = 32'h000000FF;
  parameter DIST0_DIST_CHAR_0_MASK = 32'h0000FF00;
  parameter DIST0_DIST_CHAR_1_MASK = 32'h00FF0000;
  parameter DIST0_DIST_CHAR_2_MASK = 32'hFF000000;
  
  //UCSR UART Control and Status Register slv_reg08 0x20 
  parameter UCSR_ADDR = 6'h020;
  parameter UCSR_UR_ERROR_MASK = 32'h00000001;
  parameter UCSR_DATA_MASK = 32'h0000FF00;
  
  //ADSR ASCII Decoder Status Register slv_reg09 0x24
  parameter ADSR_ADDR = 6'h024;
  parameter ADSR_AD_ERROR_MASK = 32'h00000001;
  parameter ADSR_ERR_POS_R_MASK  = 32'h00000002;
  parameter ADSR_ERR_POS_DIGIT_1_MASK  = 32'h00000004;
  parameter ADSR_ERR_POS_DIGIT_2_MASK  = 32'h00000008;
  parameter ADSR_ERR_POS_DIGIT_3_MASK  = 32'h00000010;
  parameter ADSR_ERR_POS_CR_MASK  = 32'h00000020;
  parameter ADSR_ERR_POS_TIMEOUT_MASK  = 32'h00000040;
  parameter ADSR_ERR_CHAR_MASK = 32'h0000FF00;
  
  //BUFFER DEFINTIONS (not used so far)

  //FURTHER DEFINITIONS
  as_axi_verification_axi_vip_0_0_mst_t  mst_ctrl_agent; // check instance name in block design (<blockdesign-name>_<vip-inst-name>_0_mst_t)
  
  //clock frequency definition
  parameter real CLK_PERIOD = 10; // 10ns clock
  bit error_found = 0;
  
  // UART timing parameters for 9600 baud 
  // 40ns ticks, 16 oversampling
  parameter real TICK_PERIOD = 30; 
  parameter real UART_BIT_PERIOD = (TICK_PERIOD + CLK_PERIOD) * 16;
  parameter real UART_HALF_BIT = (TICK_PERIOD + CLK_PERIOD) * 8;
  
  //--------------------------------------------------------------------------------------
  //SYSTEM DEFINTION (system instances and signals)
  //CLK
  logic ap_clk = 0;
  initial begin: AP_CLK
    forever begin
      ap_clk = #(CLK_PERIOD/2) ~ap_clk;
    end
  end

  //RESET
  logic ap_rst_n = 0;
  initial begin: AP_RST
    ap_rst_n_sequence(16);
  end

  //SYSTEM DESIGN WRAPPER instance
  logic i_rx = 1'b1;
  logic o_tx;
  logic o_interrupt;
  //check instance name in block design -> <blockdeisgn_name>_wrapper 
  as_axi_verification_wrapper DUT( 
   .aclk(ap_clk),
   .aresetn(ap_rst_n),
   .i_rx(i_rx),
   .o_tx(o_tx),
   .o_interrupt_0(o_interrupt)
  );
 
 
  //-------------------------------------------------------------------------------------
  //FUNCTIONS AND TASKS
  /////////////////////////////////////////////////////////////
  // Reusing and adapting AXI VIP functions out of Xilinx Tutorial
  //
  //https://github.com/Xilinx/Vitis-Tutorials/blob/2023.2/Hardware_Acceleration/Feature_Tutorials/01-rtl_kernel_workflow/reference-files/src/testbench/Vadd_A_B_tb.sv   
  //
  ////////////////////////////////////////////////////////////  
  
  //`include "at_tb.vh"
  
  //FUNCTIONS AND TASKS
  task automatic ap_rst_n_sequence(input integer unsigned width = 20);
    @(posedge ap_clk);
    #1ns;
    ap_rst_n = 0;
    repeat (width) @(posedge ap_clk);
    #1ns;
    ap_rst_n = 1;
  endtask

  task automatic start_vips();
    $display("//////////////////////////////////////////////////////////////");
    $display("Start Axi Control Master");    
    mst_ctrl_agent = new("master_ctrl_agent", DUT.as_axi_verification_i.axi_vip_0.inst.IF); // check instance name in block design DUT.<blockdesign-name>_<vip-inst-name>.inst.IF      
    mst_ctrl_agent.start_master();
  endtask

  /////////////////////////////////////////////////////////////////////////////////////////////////
  // Control interface blocking write
  // The task will return when the BRESP has been returned from the kernel.
  task automatic blocking_write_register (input bit [31:0] addr_in, input bit [31:0] data);
    axi_transaction   wr_xfer;
    axi_transaction   wr_rsp;
    wr_xfer = mst_ctrl_agent.wr_driver.create_transaction("wr_xfer");
    wr_xfer.set_driver_return_item_policy(XIL_AXI_PAYLOAD_RETURN);
    assert(wr_xfer.randomize() with {addr == addr_in;});
    wr_xfer.set_data_beat(0, data);
    mst_ctrl_agent.wr_driver.send(wr_xfer);
    mst_ctrl_agent.wr_driver.wait_rsp(wr_rsp);
  endtask

  /////////////////////////////////////////////////////////////////////////////////////////////////
  // Control interface blocking read
  // The task will return when the BRESP has been returned from the kernel.
  task automatic read_register (input bit [31:0] addr, output bit [31:0] rddata);
    axi_transaction   rd_xfer;
    axi_transaction   rd_rsp;
    bit [31:0] rd_value;
    rd_xfer = mst_ctrl_agent.rd_driver.create_transaction("rd_xfer");
    rd_xfer.set_addr(addr);
    rd_xfer.set_driver_return_item_policy(XIL_AXI_PAYLOAD_RETURN);
    mst_ctrl_agent.rd_driver.send(rd_xfer);
    mst_ctrl_agent.rd_driver.wait_rsp(rd_rsp);
    rd_value = rd_rsp.get_data_beat(0);
    rddata = rd_value;
  endtask

  /////////////////////////////////////////////////////////////////////////////////////////////////
  // Poll the Control interface status register.
  // This will poll until the DONE flag in the status register is asserted.
  task automatic poll_done_register ();
    bit [31:0] rd_value;
    do begin
      read_register(GCSR_ADDR, rd_value);
    end while ((rd_value & GCSR_DONE_MASK) == 0);
  endtask
 
  task automatic poll_idle_register ();
    bit [31:0] rd_value;
    do begin
      read_register(GCSR_ADDR, rd_value);
    end while ((rd_value & GCSR_IDLE_MASK) == 0);
  endtask

  /////////////////////////////////////////////////////////////////////////////////////////////////
  //check if only the implemented bit can be written and read back 
  //(unimplemented reserved bits should ignore writes and return zeros if read)
  task automatic check_32bitregister_value_with_gaps(input bit [31:0] addr_in, input bit [31:0] expectedreadregvalwriteff, input bit [31:0] expectedreadregvalwrite00, output bit error_found);
    bit [31:0] rddata;
    error_found = 0;

    blocking_write_register(addr_in, 32'hffffffff);
    read_register(addr_in, rddata);
    if (rddata != expectedreadregvalwriteff) begin
      $error("Value mismatch expectedreadregvalwriteff: A:0x%0x : Expected 0x%x -> Got 0x%x", addr_in, expectedreadregvalwriteff, rddata);
      error_found = 1;
    end
    blocking_write_register(addr_in, 32'h00000000);
    read_register(addr_in, rddata);
    if (rddata != expectedreadregvalwrite00 ) begin
      $error("Value mismatch expectedreadregvalwrite00: A:0x%0x : Expected 0x%x -> Got 0x%x", addr_in, expectedreadregvalwrite00, rddata);
      error_found = 1;
    end    
  endtask

  task automatic check_32bitregister_state(input bit [31:0] is, input bit [31:0] expected, string check_name);
    if(is == expected) begin 
        $display("%s CHECK SUCCEED!!", check_name);
    end else begin
        $display("%s CHECK FAILED!!", check_name);
        $display("  -- MISMATCH at  exp = %x, act = %x", expected, is);
    end 
  endtask


  //====================================================================================
  // UART STIMULUS TASKS
  //====================================================================================
  task automatic uart_send_byte(input logic [7:0] data);
    begin
      
      // Start bit (low)
      i_rx = 1'b0;
      #UART_BIT_PERIOD;
      
      // Data bits (LSB first)
      for (int i = 0; i < 8; i++) begin
        i_rx = data[i];
        #UART_BIT_PERIOD;
      end
      
      // Stop bit (high)
      i_rx = 1'b1;
      #UART_BIT_PERIOD;
      
    end
  endtask
  
  // UART string transmission task
  task automatic uart_send_string(input string str);
    begin
      for (int i = 0; i < str.len(); i++) begin
        uart_send_byte(str.getc(i));
      end
    end
  endtask
  
  /////////////////////////////////////////////////////////////////////////////////////////////////
  // For each of the scalar registers, check:
  //  correct number bits set on a write 
  task automatic check_scalar_registers(output bit error_found);
    bit [31:0] expectedval = 32'h00000000;
    bit tmp_error_found = 0;
    
    error_found = 0;    
    $display("%t : Checking scalar registers", $time);
    
    check_32bitregister_value_with_gaps (GIER_ADDR, 32'h00000000, 32'h00000000, tmp_error_found);
    error_found |= tmp_error_found;

    check_32bitregister_value_with_gaps (IPIER_ADDR, 32'h00000000, 32'h00000000, tmp_error_found);
    error_found |= tmp_error_found;
    
    check_32bitregister_value_with_gaps (IPISR_ADDR, 32'h00000000, 32'h00000000, tmp_error_found);
    error_found |= tmp_error_found;
    
    check_32bitregister_value_with_gaps (IDR_ADDR, 32'h534F4E52, 32'h534F4E52, tmp_error_found);
    error_found |= tmp_error_found;
    
    check_32bitregister_value_with_gaps (VERR_ADDR, 32'h80001000, 32'h80001000, tmp_error_found);
    error_found |= tmp_error_found;
    
    check_32bitregister_value_with_gaps (DIST0_ADDR, 32'h00000000, 32'h00000000, tmp_error_found);
    error_found |= tmp_error_found;
    
    check_32bitregister_value_with_gaps (UCSR_ADDR, 32'h00000000, 32'h00000000, tmp_error_found);
    error_found |= tmp_error_found;
    
    check_32bitregister_value_with_gaps (ADSR_ADDR, 32'h00000000, 32'h00000000, tmp_error_found);
    error_found |= tmp_error_found;

    expectedval=0;  
    expectedval=SCSR_RESETIP_MASK | SCSR_FREEZEIP_MASK; //only implemented writable bits
    check_32bitregister_value_with_gaps (SCSR_ADDR, expectedval, 32'h00000000, tmp_error_found);
    error_found |= tmp_error_found; 
    
    expectedval=0;   
    expectedval=GCSR_START_MASK | GCSR_AUTO_RESTART_MASK; //only implemented writable bits
    check_32bitregister_value_with_gaps (GCSR_ADDR, expectedval, 32'h00000001, tmp_error_found); //!!! bit0 ap_start cannot reset by software!
    error_found |= tmp_error_found; 
  endtask
  
  //---------------------------------------------------------------------------------- 
  //TEST TASKS 
  
  task automatic CHECK_REGISTERS;  
    testcase = AXI_REGISTERS;
    $display("---------------------------------------------------------------");
    $display("START TEST Check Registers");
    $display("---------------------------------------------------------------"); 
    check_scalar_registers(error_found);
    if(error_found == 1) begin
      $display( "Test Failed at Check Registers!");
      $finish();
    end else begin
      $display( "Test Check Registers ... OK");      
    end 
  endtask
  
  task automatic TEST_2_VALID;  
    byte distance_send = 123; // because distance from 0-255
    bit [31:0] SCSR_is, SCSR_expected = 0;
    bit [31:0] DIST0_is, DIST0_expected = 0;
    bit [31:0] UCSR_is, UCSR_expected = 0;
    bit [31:0] ADSR_is, ADSR_expected = 0;
    testcase = TWO_VALID;
  
    $display("---------------------------------------------------------------");
    $display(" START TEST 2 VALID READS");
    $display("---------------------------------------------------------------");
  
    // Reset the IP
    blocking_write_register(SCSR_ADDR, SCSR_RESETIP_MASK);
    #10
    blocking_write_register(SCSR_ADDR, 32'h00000000);
    #10
    
    // Start IP
    $display("-- FIRST READ --");
    blocking_write_register(GCSR_ADDR, GCSR_START_MASK);
    
    // 3 us check for powerup done (3010 ns)
    #3010;
    SCSR_expected |= SCSR_POWERUP_DONE_MASK;
    read_register(SCSR_ADDR, SCSR_is);
    check_32bitregister_state(SCSR_is, SCSR_expected, "POWERUP DONE");

    // 2 us check for calib done (2000 ns)
    #2010;
    SCSR_expected |= SCSR_CALIB_DONE_MASK;
    read_register(SCSR_ADDR, SCSR_is);
    check_32bitregister_state(SCSR_is, SCSR_expected, "CALIBRATION DONE");

    // wait 2 us
    #2000;
    
    // send R123\r
    uart_send_string(string'({"R123", 8'd13})); // 13 = 0x0D = '\r'
    
    poll_done_register();

    // Check the Distance register
    DIST0_expected |= distance_send; // dist_in
    DIST0_expected |= (distance_send / 100 + 48) << 8; // dist_char_1
    DIST0_expected |= (distance_send % 100 / 10 + 48) << 16; // dist_char_2
    DIST0_expected |= (distance_send % 10 + 48) << 24; // dist_char_3
    read_register(DIST0_ADDR, DIST0_is);
    check_32bitregister_state(DIST0_is, DIST0_expected, "RESULT DATA");

    // Check UART Control and Status Register
    UCSR_expected |= 8'h0D << 8; // 0D = Carriage return; last byte in uart rx register
    read_register(UCSR_ADDR, UCSR_is);
    check_32bitregister_state(UCSR_is, UCSR_expected, "UART RECEIVER STATUS");

    // Check ASCII Decoder Status Register
    ADSR_expected = 0;
    read_register(ADSR_ADDR, ADSR_is);
    check_32bitregister_state(ADSR_is, ADSR_expected, "ASCII DECODER STATUS");

    //reset ap_done (superflous since already accomplished in poll_done_register(), 
    #10;    
    
    // Start IP
    $display("-- SECOND READ --");
    blocking_write_register(GCSR_ADDR, GCSR_START_MASK);

    // wait 2 us
    #1000;
    
    // send R255\r
    uart_send_string(string'({"R255", 8'd13})); // 13 = 0x0D = '\r'
    
    poll_done_register();

    // Artifical delay to simulate cpu read
    #100

    // Check the Distance register
    distance_send = 255;
    DIST0_expected = 0;
    DIST0_expected |= distance_send; // dist_in
    DIST0_expected |= (distance_send / 100 + 48) << 8; // dist_char_1
    DIST0_expected |= (distance_send % 100 / 10 + 48) << 16; // dist_char_2
    DIST0_expected |= (distance_send % 10 + 48) << 24; // dist_char_3
    read_register(DIST0_ADDR, DIST0_is);
    check_32bitregister_state(DIST0_is, DIST0_expected, "RESULT DATA");

    // Check UART Control and Status Register
    UCSR_expected |= 8'h0D << 8; // 0D = Carriage return; last byte in uart rx register
    read_register(UCSR_ADDR, UCSR_is);
    check_32bitregister_state(UCSR_is, UCSR_expected, "UART RECEIVER STATUS");

    // Check ASCII Decoder Status Register
    ADSR_expected = 0;
    read_register(ADSR_ADDR, ADSR_is);
    check_32bitregister_state(ADSR_is, ADSR_expected, "ASCII DECODER STATUS");

    //reset ap_done (superflous since already accomplished in poll_done_register(), 
    #10;
  endtask

  task automatic TEST_2_VALID_AUTO;  
    byte distance_send = 1; // because distance from 0-255
    bit [31:0] SCSR_is, SCSR_expected = 0;
    bit [31:0] DIST0_is, DIST0_expected = 0;
    bit [31:0] UCSR_is, UCSR_expected = 0;
    bit [31:0] ADSR_is, ADSR_expected = 0;
    testcase = TWO_VALID_AUTO;
  
    $display("---------------------------------------------------------------");
    $display(" START TEST 2 VALID READS | AUTO RESTART");
    $display("---------------------------------------------------------------");
  
    // Reset the IP
    blocking_write_register(SCSR_ADDR, SCSR_RESETIP_MASK);
    #10
    blocking_write_register(SCSR_ADDR, 32'h00000000);
    #10
    
    // Start IP
    $display("-- FIRST READ --");
    blocking_write_register(GCSR_ADDR, GCSR_START_MASK | GCSR_AUTO_RESTART_MASK);
    
    // 3 us check for powerup done (3010 ns)
    #3010;
    SCSR_expected |= SCSR_POWERUP_DONE_MASK;
    read_register(SCSR_ADDR, SCSR_is);
    check_32bitregister_state(SCSR_is, SCSR_expected, "POWERUP DONE");

    // 2 us check for calib done (2000 ns)
    #2010;
    SCSR_expected |= SCSR_CALIB_DONE_MASK;
    read_register(SCSR_ADDR, SCSR_is);
    check_32bitregister_state(SCSR_is, SCSR_expected, "CALIBRATION DONE");

    // wait 2 us
    #2000;
    
    // send R001\r
    uart_send_string(string'({"R001", 8'd13})); // 13 = 0x0D = '\r'
    
    poll_done_register();

    // Artifical delay to simulate cpu read
    #100

    // Check the Distance register
    DIST0_expected |= distance_send; // dist_in
    DIST0_expected |= (distance_send / 100 + 48) << 8; // dist_char_1
    DIST0_expected |= (distance_send % 100 / 10 + 48) << 16; // dist_char_2
    DIST0_expected |= (distance_send % 10 + 48) << 24; // dist_char_3
    read_register(DIST0_ADDR, DIST0_is);
    check_32bitregister_state(DIST0_is, DIST0_expected, "RESULT DATA");

    // Check UART Control and Status Register
    UCSR_expected |= 8'h0D << 8; // 0D = Carriage return; last byte in uart rx register
    read_register(UCSR_ADDR, UCSR_is);
    check_32bitregister_state(UCSR_is, UCSR_expected, "UART RECEIVER STATUS");

    // Check ASCII Decoder Status Register
    ADSR_expected = 0;
    read_register(ADSR_ADDR, ADSR_is);
    check_32bitregister_state(ADSR_is, ADSR_expected, "ASCII DECODER STATUS");

    //reset ap_done (superflous since already accomplished in poll_done_register(), 
    #10;    
    
    $display("-- SECOND READ --");

    // send R200\r
    uart_send_string(string'({"R200", 8'd13})); // 13 = 0x0D = '\r'
    
    poll_done_register();

    // Artifical delay to simulate cpu read
    #100

    // Check the Distance register
    distance_send = 200;
    DIST0_expected = 0;
    DIST0_expected |= distance_send; // dist_in
    DIST0_expected |= (distance_send / 100 + 48) << 8; // dist_char_1
    DIST0_expected |= (distance_send % 100 / 10 + 48) << 16; // dist_char_2
    DIST0_expected |= (distance_send % 10 + 48) << 24; // dist_char_3
    read_register(DIST0_ADDR, DIST0_is);
    check_32bitregister_state(DIST0_is, DIST0_expected, "RESULT DATA");

    // Check UART Control and Status Register
    UCSR_expected |= 8'h0D << 8; // 0D = Carriage return; last byte in uart rx register
    read_register(UCSR_ADDR, UCSR_is);
    check_32bitregister_state(UCSR_is, UCSR_expected, "UART RECEIVER STATUS");

    // Check ASCII Decoder Status Register
    ADSR_expected = 0;
    read_register(ADSR_ADDR, ADSR_is);
    check_32bitregister_state(ADSR_is, ADSR_expected, "ASCII DECODER STATUS");

    //reset ap_done (superflous since already accomplished in poll_done_register(), 
    #10;
  endtask

   task automatic TEST_1_TIMEOUT_2_VALID_AUTO;     
    byte distance_send = 120; // because distance from 0-255
    bit [31:0] SCSR_is, SCSR_expected = 0;
    bit [31:0] DIST0_is, DIST0_expected = 0;
    bit [31:0] UCSR_is, UCSR_expected = 0;
    bit [31:0] ADSR_is, ADSR_expected = 0;
    testcase = FIRST_TIMEOUT_SECOND_VALID_AUTO; 
  
    $display("---------------------------------------------------------------");
    $display(" START TEST 1 TIMEOUT 2 VALID | AUTO RESTART");
    $display("---------------------------------------------------------------");
  
    // Reset the IP
    blocking_write_register(SCSR_ADDR, SCSR_RESETIP_MASK);
    #10
    blocking_write_register(SCSR_ADDR, 32'h00000000);
    #10
    
    // Start IP
    $display("-- FIRST READ --");
    blocking_write_register(GCSR_ADDR, GCSR_START_MASK | GCSR_AUTO_RESTART_MASK);
    
    // 3 us check for powerup done (3010 ns)
    #3010;
    SCSR_expected |= SCSR_POWERUP_DONE_MASK;
    read_register(SCSR_ADDR, SCSR_is);
    check_32bitregister_state(SCSR_is, SCSR_expected, "POWERUP DONE");

    // 2 us check for calib done (2000 ns)
    #2010;
    SCSR_expected |= SCSR_CALIB_DONE_MASK;
    read_register(SCSR_ADDR, SCSR_is);
    check_32bitregister_state(SCSR_is, SCSR_expected, "CALIBRATION DONE");

    // wait 2 us
    #2000;
    
    // send R12 then timeout
    uart_send_string("R12");
    
    poll_done_register();

    // Artifical delay to simulate cpu read
    #100

    // Check the Distance register
    DIST0_expected |= distance_send; // dist_in (since only first two digits arrived)
    DIST0_expected |= (distance_send / 100 + 48) << 8; // dist_char_1
    DIST0_expected |= (distance_send % 100 / 10 + 48) << 16; // dist_char_2
    read_register(DIST0_ADDR, DIST0_is);
    check_32bitregister_state(DIST0_is, DIST0_expected, "RESULT DATA");

    // Check UART Control and Status Register
    UCSR_expected |= 8'h32 << 8; // 32 = ASCII 2; last byte in uart rx register
    read_register(UCSR_ADDR, UCSR_is);
    check_32bitregister_state(UCSR_is, UCSR_expected, "UART RECEIVER STATUS");

    // Check ASCII Decoder Status Register
    ADSR_expected |= (ADSR_AD_ERROR_MASK | ADSR_ERR_POS_TIMEOUT_MASK);
    read_register(ADSR_ADDR, ADSR_is);
    check_32bitregister_state(ADSR_is, ADSR_expected, "ASCII DECODER STATUS");

    //reset ap_done (superflous since already accomplished in poll_done_register(), 
    #10;    
    
    $display("-- SECOND READ --");

    // wait for 1 us
    #1000;

    // send R250\r 
    uart_send_string(string'({"R250", 8'd13}));
    
    poll_done_register();

    // Artifical delay to simulate cpu read
    #100

    // Check the Distance register
    distance_send = 250;
    DIST0_expected = 0;
    DIST0_expected |= distance_send;
    DIST0_expected |= (distance_send / 100 + 48) << 8; // dist_char_1
    DIST0_expected |= (distance_send % 100 / 10 + 48) << 16; // dist_char_2
    DIST0_expected |= (distance_send % 10 + 48) << 24; // dist_char_3
    read_register(DIST0_ADDR, DIST0_is);
    check_32bitregister_state(DIST0_is, DIST0_expected, "RESULT DATA");

    // Check UART Control and Status Register
    UCSR_expected = 8'h0D << 8; // 0D = Carriage Return; last byte in uart rx register
    read_register(UCSR_ADDR, UCSR_is);
    check_32bitregister_state(UCSR_is, UCSR_expected, "UART RECEIVER STATUS");

    // Check ASCII Decoder Status Register
    ADSR_expected = 0;
    read_register(ADSR_ADDR, ADSR_is);
    check_32bitregister_state(ADSR_is, ADSR_expected, "ASCII DECODER STATUS");

    //reset ap_done (superflous since already accomplished in poll_done_register(), 
    #10;
  endtask

  task automatic TEST_1_VALID_2_INVALID_TIMEOUT_AUTO;  
    byte distance_send = 128; // because distance from 0-255
    bit [31:0] SCSR_is, SCSR_expected = 0;
    bit [31:0] DIST0_is, DIST0_expected = 0;
    bit [31:0] UCSR_is, UCSR_expected = 0;
    bit [31:0] ADSR_is, ADSR_expected = 0;
    testcase = FIRST_VALID_SECOND_INVALID_TIMEOUT_AUTO;
  
    $display("---------------------------------------------------------------");
    $display(" START TEST 1 VALID 2 TIMEOUT & INVALID | AUTO RESTART");
    $display("---------------------------------------------------------------");
  
    // Reset the IP
    blocking_write_register(SCSR_ADDR, SCSR_RESETIP_MASK);
    #10
    blocking_write_register(SCSR_ADDR, 32'h00000000);
    #10
    
    // Start IP
    $display("-- FIRST READ --");
    blocking_write_register(GCSR_ADDR, GCSR_START_MASK | GCSR_AUTO_RESTART_MASK);
    
    // 3 us check for powerup done (3010 ns)
    #3010;
    SCSR_expected |= SCSR_POWERUP_DONE_MASK;
    read_register(SCSR_ADDR, SCSR_is);
    check_32bitregister_state(SCSR_is, SCSR_expected, "POWERUP DONE");

    // 2 us check for calib done (2000 ns)
    #2010;
    SCSR_expected |= SCSR_CALIB_DONE_MASK;
    read_register(SCSR_ADDR, SCSR_is);
    check_32bitregister_state(SCSR_is, SCSR_expected, "CALIBRATION DONE");

    // wait 2 us
    #2000;
    
    // send R128\r
    uart_send_string(string'({"R128", 8'd13})); // 13 = 0x0D = '\r'
    
    poll_done_register();

    // Artifical delay to simulate cpu read
    #100

    // Check the Distance register
    DIST0_expected |= distance_send; // dist_in
    DIST0_expected |= (distance_send / 100 + 48) << 8; // dist_char_1
    DIST0_expected |= (distance_send % 100 / 10 + 48) << 16; // dist_char_2
    DIST0_expected |= (distance_send % 10 + 48) << 24; // dist_char_3
    read_register(DIST0_ADDR, DIST0_is);
    check_32bitregister_state(DIST0_is, DIST0_expected, "RESULT DATA");

    // Check UART Control and Status Register
    UCSR_expected |= 8'h0D << 8; // 0D = Carriage return; last byte in uart rx register
    read_register(UCSR_ADDR, UCSR_is);
    check_32bitregister_state(UCSR_is, UCSR_expected, "UART RECEIVER STATUS");

    // Check ASCII Decoder Status Register
    ADSR_expected = 0;
    read_register(ADSR_ADDR, ADSR_is);
    check_32bitregister_state(ADSR_is, ADSR_expected, "ASCII DECODER STATUS");

    //reset ap_done (superflous since already accomplished in poll_done_register(), 
    #10;    
    
    $display("-- SECOND READ --");

    // send R3 (3 is invalid) then timeout
    uart_send_string("R3");
    
    poll_done_register();

    // Artifical delay to simulate cpu read
    #100

    // Check the Distance register
    DIST0_expected = 0; // no distance value since the first digit is already invalid
    DIST0_expected |= 8'h33 << 8; // dist_char_1, ASCII 3
    read_register(DIST0_ADDR, DIST0_is);
    check_32bitregister_state(DIST0_is, DIST0_expected, "RESULT DATA");

    // Check UART Control and Status Register
    UCSR_expected = 0;
    UCSR_expected = 8'h33 << 8; // 33 = ASCII 3; last byte in uart rx register
    read_register(UCSR_ADDR, UCSR_is);
    check_32bitregister_state(UCSR_is, UCSR_expected, "UART RECEIVER STATUS");

    // Check ASCII Decoder Status Register
    ADSR_expected = (ADSR_AD_ERROR_MASK | ADSR_ERR_POS_TIMEOUT_MASK | ADSR_ERR_POS_DIGIT_1_MASK);
    ADSR_expected |= 8'h33 << 8; // ad_err_char
    read_register(ADSR_ADDR, ADSR_is);
    check_32bitregister_state(ADSR_is, ADSR_expected, "ASCII DECODER STATUS");

    //reset ap_done (superflous since already accomplished in poll_done_register(), 
    #10;
  endtask

  task automatic TEST_1_INVALID_2_VALID_AUTO;     
    byte distance_send = 255; // because distance from 0-255
    bit [31:0] SCSR_is, SCSR_expected = 0;
    bit [31:0] DIST0_is, DIST0_expected = 0;
    bit [31:0] UCSR_is, UCSR_expected = 0;
    bit [31:0] ADSR_is, ADSR_expected = 0;
    testcase = FIRST_INVALID_SECOND_VALID_AUTO; 
  
    $display("---------------------------------------------------------------");
    $display(" START TEST 1 INVALID 2 VALID | AUTO RESTART");
    $display("---------------------------------------------------------------");
  
    // Reset the IP
    blocking_write_register(SCSR_ADDR, SCSR_RESETIP_MASK);
    #10
    blocking_write_register(SCSR_ADDR, 32'h00000000);
    #10
    
    // Start IP
    $display("-- FIRST READ --");
    blocking_write_register(GCSR_ADDR, GCSR_START_MASK | GCSR_AUTO_RESTART_MASK);
    
    // 3 us check for powerup done (3010 ns)
    #3010;
    SCSR_expected |= SCSR_POWERUP_DONE_MASK;
    read_register(SCSR_ADDR, SCSR_is);
    check_32bitregister_state(SCSR_is, SCSR_expected, "POWERUP DONE");

    // 2 us check for calib done (2000 ns)
    #2010;
    SCSR_expected |= SCSR_CALIB_DONE_MASK;
    read_register(SCSR_ADDR, SCSR_is);
    check_32bitregister_state(SCSR_is, SCSR_expected, "CALIBRATION DONE");

    // wait 2 us
    #2000;
    
    // send R255r -> instead of \r
    uart_send_string("R255r");
    
    poll_done_register();

    // Artifical delay to simulate cpu read
    #100

    // Check the Distance register
    DIST0_expected |= distance_send; // dist_in (since only first two digits arrived)
    DIST0_expected |= (distance_send / 100 + 48) << 8; // dist_char_1
    DIST0_expected |= (distance_send % 100 / 10 + 48) << 16; // dist_char_2
    DIST0_expected |= (distance_send % 10 + 48) << 24; // dist_char_3
    read_register(DIST0_ADDR, DIST0_is);
    check_32bitregister_state(DIST0_is, DIST0_expected, "RESULT DATA");

    // Check UART Control and Status Register
    UCSR_expected = 8'h72 << 8; // 72 = ASCII r; last byte in uart rx register
    read_register(UCSR_ADDR, UCSR_is);
    check_32bitregister_state(UCSR_is, UCSR_expected, "UART RECEIVER STATUS");

    // Check ASCII Decoder Status Register
    ADSR_expected = (ADSR_AD_ERROR_MASK | ADSR_ERR_POS_CR_MASK);
    ADSR_expected |= 8'h72 << 8; // ad_err_char; 72 = ASCII r
    read_register(ADSR_ADDR, ADSR_is);
    check_32bitregister_state(ADSR_is, ADSR_expected, "ASCII DECODER STATUS");

    //reset ap_done (superflous since already accomplished in poll_done_register(), 
    #10;    
    
    $display("-- SECOND READ --");

    // send R243r
    uart_send_string(string'({"R243", 8'd13})); // 13 = 0x0D = '\r'
    
    poll_done_register();

    // Artifical delay to simulate cpu read
    #100

    // Check the Distance register
    distance_send = 243;
    DIST0_expected = 0;
    DIST0_expected |= distance_send; // dist_in
    DIST0_expected |= (distance_send / 100 + 48) << 8; // dist_char_1
    DIST0_expected |= (distance_send % 100 / 10 + 48) << 16; // dist_char_2
    DIST0_expected |= (distance_send % 10 + 48) << 24; // dist_char_2
    read_register(DIST0_ADDR, DIST0_is);
    check_32bitregister_state(DIST0_is, DIST0_expected, "RESULT DATA");

    // Check UART Control and Status Register
    UCSR_expected = 8'h0D << 8; // 0D = Carriage return; last byte in uart rx register
    read_register(UCSR_ADDR, UCSR_is);
    check_32bitregister_state(UCSR_is, UCSR_expected, "UART RECEIVER STATUS");

    // Check ASCII Decoder Status Register
    ADSR_expected = 0;
    read_register(ADSR_ADDR, ADSR_is);
    check_32bitregister_state(ADSR_is, ADSR_expected, "ASCII DECODER STATUS");

    //reset ap_done (superflous since already accomplished in poll_done_register(), 
    #10;
  endtask

  task automatic TEST_VALID_FREEZE;
    byte distance_send = 255; // because distance from 0-255
    bit [31:0] SCSR_is, SCSR_expected = 0;
    bit [31:0] DIST0_is, DIST0_expected = 0;
    bit [31:0] UCSR_is, UCSR_expected = 0;
    bit [31:0] ADSR_is, ADSR_expected = 0;
    testcase = VALID_FREEZE;
  
    $display("---------------------------------------------------------------");
    $display(" START TEST VALID FREEZE");
    $display("---------------------------------------------------------------");
  
    // Reset the IP
    blocking_write_register(SCSR_ADDR, SCSR_RESETIP_MASK);
    #10
    blocking_write_register(SCSR_ADDR, 32'h00000000);
    #10
    
    // Start IP
    blocking_write_register(GCSR_ADDR, GCSR_START_MASK);
    
    // 3 us check for powerup done (3010 ns)
    #3010;
    SCSR_expected |= SCSR_POWERUP_DONE_MASK;
    read_register(SCSR_ADDR, SCSR_is);
    check_32bitregister_state(SCSR_is, SCSR_expected, "POWERUP DONE");

    // 2 us check for calib done (2000 ns)
    #2010;
    SCSR_expected |= SCSR_CALIB_DONE_MASK;
    read_register(SCSR_ADDR, SCSR_is);
    check_32bitregister_state(SCSR_is, SCSR_expected, "CALIBRATION DONE");

    // wait 2 us
    #2000;
    
    // send R25
    uart_send_string("R25");

    // Freeze IP
    blocking_write_register(SCSR_ADDR, SCSR_FREEZEIP_MASK);

    // wait 10 us -> if freeze not working this will cause a timeout
    #10000
    
    // Unfreeze
    blocking_write_register(SCSR_ADDR, 32'h00000000);

    // send 5\r (the other part)
    uart_send_string(string'({"5", 8'd13}));

    poll_done_register();

    // Artifical delay to simulate cpu read
    #100

    // Check the Distance register
    DIST0_expected |= distance_send; // dist_in (since only first two digits arrived)
    DIST0_expected |= (distance_send / 100 + 48) << 8; // dist_char_1
    DIST0_expected |= (distance_send % 100 / 10 + 48) << 16; // dist_char_2
    DIST0_expected |= (distance_send % 10 + 48) << 24; // dist_char_3
    read_register(DIST0_ADDR, DIST0_is);
    check_32bitregister_state(DIST0_is, DIST0_expected, "RESULT DATA");

    // Check UART Control and Status Register
    UCSR_expected = 8'h0D << 8; // 0D = Carriage Return; last byte in uart rx register
    read_register(UCSR_ADDR, UCSR_is);
    check_32bitregister_state(UCSR_is, UCSR_expected, "UART RECEIVER STATUS");

    // Check ASCII Decoder Status Register
    ADSR_expected = 0;
    read_register(ADSR_ADDR, ADSR_is);
    check_32bitregister_state(ADSR_is, ADSR_expected, "ASCII DECODER STATUS");

    //reset ap_done (superflous since already accomplished in poll_done_register(), 
    #10;   
  endtask

  task automatic TEST_VALID_RESET_VALID;
    byte distance_send = 240; // because distance from 0-255
    bit [31:0] SCSR_is, SCSR_expected = 0;
    bit [31:0] DIST0_is, DIST0_expected = 0;
    bit [31:0] UCSR_is, UCSR_expected = 0;
    bit [31:0] ADSR_is, ADSR_expected = 0;
    testcase = VALID_RESET_VALID;
  
    $display("---------------------------------------------------------------");
    $display(" START TEST VALID RESET VALID");
    $display("---------------------------------------------------------------");
  
    // Reset the IP
    blocking_write_register(SCSR_ADDR, SCSR_RESETIP_MASK);
    #10
    blocking_write_register(SCSR_ADDR, 32'h00000000);
    #10
    
    // Start IP
    blocking_write_register(GCSR_ADDR, GCSR_START_MASK);
    
    // 3 us check for powerup done (3010 ns)
    #3010;
    SCSR_expected |= SCSR_POWERUP_DONE_MASK;
    read_register(SCSR_ADDR, SCSR_is);
    check_32bitregister_state(SCSR_is, SCSR_expected, "POWERUP DONE");

    // 2 us check for calib done (2000 ns)
    #2010;
    SCSR_expected |= SCSR_CALIB_DONE_MASK;
    read_register(SCSR_ADDR, SCSR_is);
    check_32bitregister_state(SCSR_is, SCSR_expected, "CALIBRATION DONE");

    // wait 2 us
    #2000;
    
    // send R240\r
    uart_send_string(string'({"R240", 8'd13})); // 13 = 0x0D = '\r'

    poll_done_register();

    // Artifical delay to simulate cpu read
    #100

    // Check the Distance register
    DIST0_expected |= distance_send; // dist_in (since only first two digits arrived)
    DIST0_expected |= (distance_send / 100 + 48) << 8; // dist_char_1
    DIST0_expected |= (distance_send % 100 / 10 + 48) << 16; // dist_char_2
    DIST0_expected |= (distance_send % 10 + 48) << 24; // dist_char_3
    read_register(DIST0_ADDR, DIST0_is);
    check_32bitregister_state(DIST0_is, DIST0_expected, "RESULT DATA");

    // Check UART Control and Status Register
    UCSR_expected = 8'h0D << 8; // 0D = Carriage Return; last byte in uart rx register
    read_register(UCSR_ADDR, UCSR_is);
    check_32bitregister_state(UCSR_is, UCSR_expected, "UART RECEIVER STATUS");

    // Check ASCII Decoder Status Register
    ADSR_expected = 0;
    read_register(ADSR_ADDR, ADSR_is);
    check_32bitregister_state(ADSR_is, ADSR_expected, "ASCII DECODER STATUS");

    //reset ap_done (superflous since already accomplished in poll_done_register(), 
    #10;  

    // Reset the IP
    blocking_write_register(SCSR_ADDR, SCSR_RESETIP_MASK);
    #10
    blocking_write_register(SCSR_ADDR, 32'h00000000);
    #10
    
    // Start IP
    blocking_write_register(GCSR_ADDR, GCSR_START_MASK);
    
    // 3 us check for powerup done (3010 ns)
    #3010;
    SCSR_expected = 0;
    SCSR_expected |= SCSR_POWERUP_DONE_MASK;
    read_register(SCSR_ADDR, SCSR_is);
    check_32bitregister_state(SCSR_is, SCSR_expected, "POWERUP DONE");

    // 2 us check for calib done (2000 ns)
    #2010;
    SCSR_expected |= SCSR_CALIB_DONE_MASK;
    read_register(SCSR_ADDR, SCSR_is);
    check_32bitregister_state(SCSR_is, SCSR_expected, "CALIBRATION DONE");

    // wait 2 us
    #2000;
    
    // send R100\r
    uart_send_string(string'({"R100", 8'd13})); // 13 = 0x0D = '\r'

    poll_done_register();

    // Artifical delay to simulate cpu read
    #100

    // Check the Distance register
    distance_send = 100;
    DIST0_expected = 0;
    DIST0_expected |= distance_send; // dist_in (since only first two digits arrived)
    DIST0_expected |= (distance_send / 100 + 48) << 8; // dist_char_1
    DIST0_expected |= (distance_send % 100 / 10 + 48) << 16; // dist_char_2
    DIST0_expected |= (distance_send % 10 + 48) << 24; // dist_char_3
    read_register(DIST0_ADDR, DIST0_is);
    check_32bitregister_state(DIST0_is, DIST0_expected, "RESULT DATA");

    // Check UART Control and Status Register
    UCSR_expected = 8'h0D << 8; // 0D = Carriage Return; last byte in uart rx register
    read_register(UCSR_ADDR, UCSR_is);
    check_32bitregister_state(UCSR_is, UCSR_expected, "UART RECEIVER STATUS");

    // Check ASCII Decoder Status Register
    ADSR_expected = 0;
    read_register(ADSR_ADDR, ADSR_is);
    check_32bitregister_state(ADSR_is, ADSR_expected, "ASCII DECODER STATUS");

    //reset ap_done (superflous since already accomplished in poll_done_register(), 
    #10;  
  endtask
  
  //------------------------------------------------------------------------------------------------------
  //ACTUCAL TEST MAIN  
  initial begin : test_routine 
    #10
    start_vips();
    #10
 
    CHECK_REGISTERS();
    
    TEST_2_VALID();
    TEST_2_VALID_AUTO();
    TEST_1_TIMEOUT_2_VALID_AUTO();
    TEST_1_VALID_2_INVALID_TIMEOUT_AUTO();
    TEST_1_INVALID_2_VALID_AUTO();
    TEST_VALID_FREEZE();
    TEST_VALID_RESET_VALID();
 
    $finish(); // Total length ~510us
            
  end 
  
endmodule
