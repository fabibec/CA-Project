/*----------------------------------------------------------------------------------
-- Engineer: Jendrik Jürgens (3361128), Michael Specht (3362589)
-- Further Information: Template from ELO.
   Test strategy was developed on our own and the file was adapted accordingly as
   explained in lecture lessions.
   The test implementation was done in cooperation with claude.ai (Anthropic).
----------------------------------------------------------------------------------*/

`timescale 1ns / 1ps
 
import axi_vip_pkg::*;
import vip_db_axi_vip_0_0_pkg::*;


module ad_tb();

  //CONTANT DEFINITIONS
  parameter integer C_S_AXI_CONTROL_ADDR_WIDTH = 12;
  parameter integer C_S_AXI_CONTROL_DATA_WIDTH = 32;
    
  //REGISTER DEFINITIONS
  //GCSR General/Global Control and Status Register slv_reg00 0x00 
  parameter GCSR_ADDR     = 6'h000;       
  parameter GCSR_START_MASK        = 32'h00000001;
  parameter GCSR_DONE_MASK         = 32'h00000002;
  parameter GCSR_IDLE_MASK         = 32'h00000004;
   
  //GIER slv_reg01 0x04  
  parameter GIER_ADDR     = 6'h004;
  parameter GIER_GIE_MASK        = 32'h00000001;
      
  //IPIER slv_reg02 0x08  
  parameter IPIER_ADDR     = 6'h008;
  parameter IPIER_IPIE_MASK        = 32'h00000001;
  
  //IPISR slv_reg03 0x0C  
  parameter IPISR_ADDR     = 6'h00C;
  parameter IPISR_IPIS_MASK        = 32'h00000001;
  
  //IDR ID Register slv_reg04 0x10  --const axi r ip rw (part3)
  parameter IDR_ADDR = 6'h010;
  
  //VERR Version Register slv_reg05 0x14 --const axi r ip rw (part3)
  parameter VERR_ADDR = 6'h014;
  
  //SCSR Special Control and Status Register slv_reg06 0x18
  parameter SCSR_ADDR = 6'h018;
  parameter SCSR_LCD_INITIALIZED_MASK = 32'h00000001;        // Bit 0
  parameter SCSR_LCD_STATE_MASK = 32'h000001FE;              // Bits 8:1 
  parameter SCSR_LCD_ERROR_FLAG_MASK = 32'h00000200;         // Bit 9

  //CCR Character Control Register slv_reg07 0x1C
  parameter CCR_ADDR = 6'h01C;
  parameter CCR_DDRAM_POS_LAST_WRITTEN_MASK = 32'h000000FF; // Bits 7:0
  parameter CCR_WRITE_CHAR_MASK = 32'h00010000;             // Bit 16

  //CDR Character Data Register slv_reg08 0x20
  parameter CDR_ADDR = 6'h020;
  parameter CDR_SYMBOL_TO_WRITE_MASK = 32'h000000FF;        // Bits 7:0

  //DCR Display Control Register slv_reg09 0x24
  parameter DCR_ADDR = 6'h024;  // Fixed: was 0x020, should be 0x024
  parameter DCR_CLEAR_DISPLAY_MASK = 32'h00000001;          // Bit 0
  parameter DCR_RETURN_HOME_MASK = 32'h00000002;            // Bit 1
  parameter DCR_CURSOR_ON_MASK = 32'h00000004;              // Bit 2
  parameter DCR_CURSOR_BLINK_MASK = 32'h00000008;           // Bit 3
  parameter DCR_CURSOR_APPLY_MASK = 32'h00000010;           // Bit 4
  parameter DCR_RESET_AFTER_COMMAND = 32'h00000000;

  //BUFFER DEFINTIONS (not used so far)

  //FURTHER DEFINITIONS
  vip_db_axi_vip_0_0_mst_t  mst_ctrl_agent;
  //clock frequency definition
  parameter real CLK_PERIOD = 1; // for ease of use in the waveform diagram the clock period is selected as 1ns
  bit error_found = 0;


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
  logic [3:0] o_db4_7;
  logic o_register_select;
  logic o_read_write;
  logic o_read_write_enable;
  logic o_interrupt_0;
  vip_db_wrapper DUT( 
   .aclk(ap_clk),
   .aresetn(ap_rst_n),
   .o_db4_7(o_db4_7),
   .o_register_select(o_register_select),
   .o_read_write(o_read_write),
   .o_read_write_enable(o_read_write_enable),
   .o_interrupt_0(o_interrupt_0)
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
    mst_ctrl_agent = new("master_ctrl_agent", DUT.vip_db_i.axi_vip_0.inst.IF); // check instance name in block design DUT.<blockdesign-name>_<vip-inst-name>.inst.IF      
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
  
  task automatic poll_error_flag_register ();
    bit [31:0] rd_value;
    do begin
      read_register(SCSR_ADDR, rd_value);
    end while ((rd_value & SCSR_LCD_ERROR_FLAG_MASK) == 0);
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
  
  /////////////////////////////////////////////////////////////////////////////////////////////////
  // For each of the scalar registers, check:
  //  correct number bits set on a write 
  task automatic check_scalar_registers(output bit error_found);
    bit [31:0] expectedval = 32'h00000000;
    bit tmp_error_found = 0;
    
    error_found = 0;    
    $display("%t : Checking scalar registers", $time);

    // GIER
    check_32bitregister_value_with_gaps (GIER_ADDR, 32'h00000000, 32'h00000000, tmp_error_found);
    error_found |= tmp_error_found;
    
    // IPIER
    check_32bitregister_value_with_gaps (IPIER_ADDR, 32'h00000000, 32'h00000000, tmp_error_found);
    error_found |= tmp_error_found;
    
    // IPISR
    check_32bitregister_value_with_gaps (IPISR_ADDR, 32'h00000000, 32'h00000000, tmp_error_found);
    error_found |= tmp_error_found;
    
    // IDR
    check_32bitregister_value_with_gaps(IDR_ADDR, 32'h80010744, 32'h80010744, tmp_error_found);
    error_found |= tmp_error_found;
    
    // VERR
    check_32bitregister_value_with_gaps(VERR_ADDR, 32'h80001000, 32'h80001000, tmp_error_found);
    error_found |= tmp_error_found;
    
    // SCSR 
    check_32bitregister_value_with_gaps(SCSR_ADDR, 32'h00000000, 32'h00000000, tmp_error_found);
    error_found |= tmp_error_found;
    
    // CCR
    expectedval = 0;
    expectedval = CCR_WRITE_CHAR_MASK | 32'h000000ff;
    check_32bitregister_value_with_gaps(CCR_ADDR, expectedval, 32'h000000ff, tmp_error_found);
    error_found |= tmp_error_found;
    
    // CDR
    expectedval = 0;
    expectedval = CDR_SYMBOL_TO_WRITE_MASK;
    check_32bitregister_value_with_gaps(CDR_ADDR, expectedval, 32'h00000000, tmp_error_found);
    error_found |= tmp_error_found;
    
    // DCR
    expectedval = 0;
    expectedval = DCR_CLEAR_DISPLAY_MASK | DCR_RETURN_HOME_MASK | DCR_CURSOR_ON_MASK | 
                  DCR_CURSOR_BLINK_MASK | DCR_CURSOR_APPLY_MASK;
    check_32bitregister_value_with_gaps(DCR_ADDR, expectedval, 32'h00000010, tmp_error_found);  //!!! bit4 cursor_apply cannot be reset by software!
    error_found |= tmp_error_found;
    
    // GCSR
    expectedval = 0;
    expectedval = GCSR_START_MASK;
    check_32bitregister_value_with_gaps(GCSR_ADDR, expectedval, 32'h00000001, tmp_error_found);  //!!! bit0 ap_start cannot be reset by software!
    error_found |= tmp_error_found;
    
  endtask
 
  task automatic wait_for_interrupt;
    wait(o_interrupt_0==1'b1);    
  endtask
  
  
  //---------------------------------------------------------------------------------- 
  //TEST TASKS 
  
  task automatic CHECK_REGISTERS;  
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
  
  task automatic TEST_UP;  
    bit [31:0] SCSR_is = 0;

    $display("---------------------------------------------------------------");
    $display(" START TEST_UP - LCD Controller Initialization Test");
    $display("---------------------------------------------------------------");
    
    $display("Waiting for LCD initialization...");
    
    #3500;
    
    read_register(SCSR_ADDR, SCSR_is);
    if ((SCSR_is & SCSR_LCD_INITIALIZED_MASK) != 0) begin
      $display("LCD Initialization completed!");
    end else begin
      $error("LCD initialization failed! SCSR=0x%08x", SCSR_is);
      $finish();
    end
    
    #100;
    
    poll_done_register();

    read_register(SCSR_ADDR, SCSR_is);
    $display("SCSR_is : 0x%08x = %032b", SCSR_is, SCSR_is);
    $display("SCSR_exp: 0x%08x = %032b", 32'h00000005, 32'h00000005);
    $display("- lcd_initialized is : 0x%08x = %032b", SCSR_is & SCSR_LCD_INITIALIZED_MASK, SCSR_is & SCSR_LCD_INITIALIZED_MASK);
    $display("- lcd_initialized exp: 0x%08x = %032b", 32'h00000001, 32'h00000001);
    $display("- lcd_state is : 0x%02x = %08b", (SCSR_is & SCSR_LCD_STATE_MASK) >> 1, (SCSR_is & SCSR_LCD_STATE_MASK) >> 1);
    $display("- lcd_state exp: 0x%02x = %08b", 8'h02, 8'h02);

    $display("---------------------------------------------------------------");
    $display("TEST_UP completed successfully!");
    $display("---------------------------------------------------------------");
    
    #100;
    
  endtask

  task automatic TEST_WRITE_SINGLE_CHAR;
    bit [31:0] GCSR_is = 0;
    bit [31:0] SCSR_is = 0;
    bit [31:0] CCR_is = 0;
    bit [31:0] CDR_is = 0;

    $display("---------------------------------------------------------------");
    $display("TEST_WRITE_SINGLE_CHAR - Writing character 'A' (0x41)");
    $display("---------------------------------------------------------------");
    
    // Set character data to 'A'
    blocking_write_register(CDR_ADDR, 32'h00000041);
    read_register(CDR_ADDR, CDR_is);
    $display("CDR_is : 0x%08x = %032b", CDR_is, CDR_is);
    $display("CDR_exp: 0x%08x = %032b", 32'h00000041, 32'h00000041);
    $display("- symbol_to_write is : 0x%02x = %08b", CDR_is & 8'hFF, CDR_is & 8'hFF);
    $display("- symbol_to_write exp: 0x%02x = %08b", 8'h41, 8'h41);
    
    // Set write_char bit
    blocking_write_register(CCR_ADDR, CCR_WRITE_CHAR_MASK);
    read_register(CCR_ADDR, CCR_is);
    $display("CCR_is : 0x%08x = %032b", CCR_is, CCR_is);
    $display("CCR_exp: 0x%08x = %032b", 32'h000100FF, 32'h000100FF);
    $display("- write_char is : 0x%08x = %032b", CCR_is & CCR_WRITE_CHAR_MASK, CCR_is & CCR_WRITE_CHAR_MASK);
    $display("- write_char exp: 0x%08x = %032b", 32'h00010000, 32'h00010000);
    
    // Start command
    blocking_write_register(GCSR_ADDR, GCSR_START_MASK);
    read_register(GCSR_ADDR, GCSR_is);
    $display("GCSR_is : 0x%08x = %032b", GCSR_is, GCSR_is);
    $display("GCSR_exp: 0x%08x = %032b", 32'h00000001, 32'h00000001);
    $display("- ap_start is : 0x%08x = %032b", GCSR_is & GCSR_START_MASK, GCSR_is & GCSR_START_MASK);
    $display("- ap_start exp: 0x%08x = %032b", 32'h00000001, 32'h00000001);
    
    // Wait 10ns and check lcd_state
    #10;
    read_register(SCSR_ADDR, SCSR_is);
    $display("SCSR after 10ns: 0x%08x = %032b", SCSR_is, SCSR_is);
    $display("- lcd_state is : 0x%02x = %08b", (SCSR_is & SCSR_LCD_STATE_MASK) >> 1, (SCSR_is & SCSR_LCD_STATE_MASK) >> 1);
    $display("- lcd_state exp: 0x%02x = %08b", 8'h04, 8'h04);
    
    #3490;
    
    poll_done_register();
    
    // Check results after write
    read_register(GCSR_ADDR, GCSR_is);
    $display("GCSR after write: 0x%08x = %032b", GCSR_is, GCSR_is);
    $display("- ap_idle is : 0x%08x = %032b", GCSR_is & GCSR_IDLE_MASK, GCSR_is & GCSR_IDLE_MASK);
    $display("- ap_idle exp: 0x%08x = %032b", 32'h00000004, 32'h00000004);
    
    read_register(CCR_ADDR, CCR_is);
    $display("CCR after write: 0x%08x = %032b", CCR_is, CCR_is);
    $display("- ddram_pos_last_written is : 0x%02x = %08b", CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK, CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK);
    $display("- ddram_pos_last_written exp: 0x%02x = %08b", 8'h00, 8'h00);
    
    read_register(SCSR_ADDR, SCSR_is);
    $display("SCSR after write: 0x%08x = %032b", SCSR_is, SCSR_is);
    $display("- lcd_state is : 0x%02x = %08b", (SCSR_is & SCSR_LCD_STATE_MASK) >> 1, (SCSR_is & SCSR_LCD_STATE_MASK) >> 1);
    $display("- lcd_state exp: 0x%02x = %08b", 8'h02, 8'h02);
    
    $display("---------------------------------------------------------------");
    $display("TEST_WRITE_SINGLE_CHAR completed successfully!");
    $display("---------------------------------------------------------------");
    
    #100;
  endtask

  task automatic TEST_WRITE_STRING;
    bit [31:0] GCSR_is = 0;
    bit [31:0] SCSR_is = 0;
    bit [31:0] CCR_is = 0;
    bit [31:0] CDR_is = 0;
    string chars[5] = {"H", "E", "L", "L", "O"};
    bit [7:0] char_codes[5] = {8'h48, 8'h45, 8'h4C, 8'h4C, 8'h4F};
    int expected_pos[5] = {1, 2, 3, 4, 5};

    $display("---------------------------------------------------------------");
    $display("TEST_WRITE_STRING - Writing string 'HELLO'");
    $display("---------------------------------------------------------------");
    
    for (int i = 0; i < 5; i++) begin
      $display("Writing '%s' (0x%02x)...", chars[i], char_codes[i]);
      
      blocking_write_register(CDR_ADDR, {24'h000000, char_codes[i]});
      read_register(CDR_ADDR, CDR_is);
      $display("CDR_is : 0x%08x = %032b", CDR_is, CDR_is);
      $display("- symbol_to_write is : 0x%02x = %08b", CDR_is & 8'hFF, CDR_is & 8'hFF);
      $display("- symbol_to_write exp: 0x%02x = %08b", char_codes[i], char_codes[i]);
      
      blocking_write_register(CCR_ADDR, CCR_WRITE_CHAR_MASK);
      blocking_write_register(GCSR_ADDR, GCSR_START_MASK);
      
      // Wait 10ns and check lcd_state
      #10;
      read_register(SCSR_ADDR, SCSR_is);
      $display("SCSR after 10ns: 0x%08x = %032b", SCSR_is, SCSR_is);
      $display("- lcd_state is : 0x%02x = %08b", (SCSR_is & SCSR_LCD_STATE_MASK) >> 1, (SCSR_is & SCSR_LCD_STATE_MASK) >> 1);
      $display("- lcd_state exp: 0x%02x = %08b", 8'h04, 8'h04);
      
      #3490;
      
      poll_done_register();
      
      read_register(CCR_ADDR, CCR_is);
      $display("CCR after '%s': 0x%08x = %032b", chars[i], CCR_is, CCR_is);
      $display("- ddram_pos_last_written is : 0x%02x = %08b", CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK, CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK);
      $display("- ddram_pos_last_written exp: 0x%02x = %08b", expected_pos[i], expected_pos[i]);
      
      #100;
    end
    
    $display("---------------------------------------------------------------");
    $display("TEST_WRITE_STRING completed successfully!");
    $display("---------------------------------------------------------------");
    
    #100;
  endtask

  task automatic TEST_CLEAR_DISPLAY;
    bit [31:0] GCSR_is = 0;
    bit [31:0] SCSR_is = 0;
    bit [31:0] CCR_is = 0;
    bit [31:0] DCR_is = 0;

    $display("---------------------------------------------------------------");
    $display("TEST_CLEAR_DISPLAY - Clear Display Test");
    $display("---------------------------------------------------------------");
    
    $display("Writing 'X' first to have something to clear...");
    blocking_write_register(CDR_ADDR, 32'h00000058);
    blocking_write_register(CCR_ADDR, CCR_WRITE_CHAR_MASK);
    blocking_write_register(GCSR_ADDR, GCSR_START_MASK);
    #3500;
    poll_done_register();
    #100;
    
    $display("Executing clear display...");
    blocking_write_register(DCR_ADDR, DCR_CLEAR_DISPLAY_MASK);
    read_register(DCR_ADDR, DCR_is);
    $display("DCR_is : 0x%08x = %032b", DCR_is, DCR_is);
    $display("DCR_exp: 0x%08x = %032b", 32'h00000001, 32'h00000001);
    $display("- clear_display is : 0x%08x = %032b", DCR_is & DCR_CLEAR_DISPLAY_MASK, DCR_is & DCR_CLEAR_DISPLAY_MASK);
    $display("- clear_display exp: 0x%08x = %032b", 32'h00000001, 32'h00000001);
    
    blocking_write_register(GCSR_ADDR, GCSR_START_MASK);
    
    // Wait 10ns and check lcd_state
    #10;
    read_register(SCSR_ADDR, SCSR_is);
    $display("SCSR after 10ns: 0x%08x = %032b", SCSR_is, SCSR_is);
    $display("- lcd_state is : 0x%02x = %08b", (SCSR_is & SCSR_LCD_STATE_MASK) >> 1, (SCSR_is & SCSR_LCD_STATE_MASK) >> 1);
    $display("- lcd_state exp: 0x%02x = %08b", 8'h10, 8'h10);
    
    #4490;
    
    poll_done_register();
    
    read_register(CCR_ADDR, CCR_is);
    $display("CCR after clear: 0x%08x = %032b", CCR_is, CCR_is);
    $display("- ddram_pos_last_written is : 0x%02x = %08b", CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK, CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK);
    $display("- ddram_pos_last_written exp: 0x%02x = %08b", 8'hFF, 8'hFF);
    
    read_register(SCSR_ADDR, SCSR_is);
    $display("SCSR after clear: 0x%08x = %032b", SCSR_is, SCSR_is);
    $display("- lcd_state is : 0x%02x = %08b", (SCSR_is & SCSR_LCD_STATE_MASK) >> 1, (SCSR_is & SCSR_LCD_STATE_MASK) >> 1);
    $display("- lcd_state exp: 0x%02x = %08b", 8'h02, 8'h02);
    
    // Reset DCR register
    blocking_write_register(DCR_ADDR, DCR_RESET_AFTER_COMMAND);
    
    $display("---------------------------------------------------------------");
    $display("TEST_CLEAR_DISPLAY completed successfully!");
    $display("---------------------------------------------------------------");
    
    #100;
  endtask

  task automatic TEST_RETURN_HOME;
    bit [31:0] GCSR_is = 0;
    bit [31:0] SCSR_is = 0;
    bit [31:0] CCR_is = 0;
    bit [31:0] DCR_is = 0;

    $display("---------------------------------------------------------------");
    $display("TEST_RETURN_HOME - Return Home Test");
    $display("---------------------------------------------------------------");
    
    $display("Writing 'A' and 'B' to move cursor...");
    blocking_write_register(CDR_ADDR, 32'h00000041);
    blocking_write_register(CCR_ADDR, CCR_WRITE_CHAR_MASK);
    blocking_write_register(GCSR_ADDR, GCSR_START_MASK);
    #3500;
    poll_done_register();
    
    read_register(CCR_ADDR, CCR_is);
    $display("CCR after 'A': 0x%08x = %032b", CCR_is, CCR_is);
    $display("- ddram_pos_last_written is : 0x%02x = %08b", CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK, CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK);
    $display("- ddram_pos_last_written exp: 0x%02x = %08b", 8'h00, 8'h00);
    #100;
    
    $display("Writing 'B' to move cursor further...");
    blocking_write_register(CDR_ADDR, 32'h00000042);
    blocking_write_register(CCR_ADDR, CCR_WRITE_CHAR_MASK);
    blocking_write_register(GCSR_ADDR, GCSR_START_MASK);
    #3500;
    poll_done_register();
    
    read_register(CCR_ADDR, CCR_is);
    $display("CCR after 'B': 0x%08x = %032b", CCR_is, CCR_is);
    $display("- ddram_pos_last_written is : 0x%02x = %08b", CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK, CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK);
    $display("- ddram_pos_last_written exp: 0x%02x = %08b", 8'h01, 8'h01);
    #100;
    
    $display("Executing return home...");
    blocking_write_register(DCR_ADDR, DCR_RETURN_HOME_MASK);
    read_register(DCR_ADDR, DCR_is);
    $display("DCR_is : 0x%08x = %032b", DCR_is, DCR_is);
    $display("DCR_exp: 0x%08x = %032b", 32'h00000002, 32'h00000002);
    $display("- return_home is : 0x%08x = %032b", DCR_is & DCR_RETURN_HOME_MASK, DCR_is & DCR_RETURN_HOME_MASK);
    $display("- return_home exp: 0x%08x = %032b", 32'h00000002, 32'h00000002);
    
    blocking_write_register(GCSR_ADDR, GCSR_START_MASK);
    
    // Wait 10ns and check lcd_state
    #10;
    read_register(SCSR_ADDR, SCSR_is);
    $display("SCSR after 10ns: 0x%08x = %032b", SCSR_is, SCSR_is);
    $display("- lcd_state is : 0x%02x = %08b", (SCSR_is & SCSR_LCD_STATE_MASK) >> 1, (SCSR_is & SCSR_LCD_STATE_MASK) >> 1);
    $display("- lcd_state exp: 0x%02x = %08b", 8'h14, 8'h14);
    
    #4490;
    
    poll_done_register();
    
    read_register(CCR_ADDR, CCR_is);
    $display("CCR after return home: 0x%08x = %032b", CCR_is, CCR_is);
    $display("- ddram_pos_last_written is : 0x%02x = %08b", CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK, CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK);
    $display("- ddram_pos_last_written exp: 0x%02x = %08b", 8'h01, 8'h01);
    
    // Reset DCR register
    blocking_write_register(DCR_ADDR, DCR_RESET_AFTER_COMMAND);
    
    $display("---------------------------------------------------------------");
    $display("TEST_RETURN_HOME completed successfully!");
    $display("---------------------------------------------------------------");
    
    #100;
  endtask

  task automatic TEST_ERROR_HANDLING;
    bit [31:0] GCSR_is = 0;
    bit [31:0] SCSR_is = 0;
    bit [31:0] CCR_is = 0;
    bit [31:0] CDR_is = 0;

    $display("---------------------------------------------------------------");
    $display("TEST_ERROR_HANDLING - Invalid Character Test");
    $display("---------------------------------------------------------------");
    
    $display("Writing invalid character 0x03...<0x20");
    blocking_write_register(CDR_ADDR, 32'h00000003);
    read_register(CDR_ADDR, CDR_is);
    $display("CDR_is : 0x%08x = %032b", CDR_is, CDR_is);
    $display("- symbol_to_write is : 0x%02x = %08b", CDR_is & 8'hFF, CDR_is & 8'hFF);
    $display("- symbol_to_write exp: 0x%02x = %08b", 8'h03, 8'h03);
    
    blocking_write_register(CCR_ADDR, CCR_WRITE_CHAR_MASK);
    blocking_write_register(GCSR_ADDR, GCSR_START_MASK);
    
    #10;
    
    poll_done_register();
    poll_error_flag_register();
    
    read_register(SCSR_ADDR, SCSR_is);
    $display("SCSR after invalid char: 0x%08x = %032b", SCSR_is, SCSR_is);
    
    $display("---------------------------------------------------------------");
    $display("TEST_ERROR_HANDLING completed successfully!");
    $display("---------------------------------------------------------------");
    
    #100;
  endtask
  
  task automatic TEST_LINE1_TO_LINE2_WRAP;
    bit [31:0] GCSR_is = 0;
    bit [31:0] SCSR_is = 0;
    bit [31:0] CCR_is = 0;
    bit [31:0] CDR_is = 0;
    string test_chars[17] = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", 
                             "K", "L", "M", "N", "O", "P", "Q"};
    bit [7:0] char_codes[17] = {8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A,
                                8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h50, 8'h51};
    // Expected DDRAM positions: Line 1: 0x00-0x0F (16 chars), Line 2: 0x40 (first char of line 2)
    bit [7:0] expected_pos[17] = {8'h00, 8'h01, 8'h02, 8'h03, 8'h04, 8'h05, 8'h06, 8'h07, 8'h08, 8'h09,
                                  8'h0A, 8'h0B, 8'h0C, 8'h0D, 8'h0E, 8'h0F, 8'h40};

    $display("---------------------------------------------------------------");
    $display("TEST_LINE1_TO_LINE2_WRAP - Writing to end of line 1 (16 chars) and first char of line 2");
    $display("---------------------------------------------------------------");
    
    $display("Clearing display first...");
    blocking_write_register(DCR_ADDR, DCR_CLEAR_DISPLAY_MASK);
    blocking_write_register(GCSR_ADDR, GCSR_START_MASK);
    #4500;
    poll_done_register();
    blocking_write_register(DCR_ADDR, DCR_RESET_AFTER_COMMAND);
    #100;
    
    // Write characters to fill line 1 (16 chars) and first char of line 2
    for (int i = 0; i < 17; i++) begin
      if (i == 16) begin
        $display("Writing '%s' (0x%02x) - First character of line 2...", test_chars[i], char_codes[i]);
      end else if (i >= 12) begin
        $display("Writing '%s' (0x%02x) - Position %0d (near end of line 1)...", test_chars[i], char_codes[i], i);
      end else if (i % 5 == 0) begin
        $display("Writing '%s' (0x%02x) - Position %0d...", test_chars[i], char_codes[i], i);
      end
      
      blocking_write_register(CDR_ADDR, {24'h000000, char_codes[i]});
      read_register(CDR_ADDR, CDR_is);
      
      blocking_write_register(CCR_ADDR, CCR_WRITE_CHAR_MASK);
      blocking_write_register(GCSR_ADDR, GCSR_START_MASK);
      
      // Wait 10ns and verify write state
      #10;
      read_register(SCSR_ADDR, SCSR_is);
      if (((SCSR_is & SCSR_LCD_STATE_MASK) >> 1) != 8'h04) begin
        $error("LCD not in write state after starting write operation at position %0d", i);
      end
      
      #3490;
      
      poll_done_register();
      
      read_register(CCR_ADDR, CCR_is);
      $display("After '%s': ddram_pos_last_written = 0x%02x (expected: 0x%02x)", 
               test_chars[i], 
               CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK, 
               expected_pos[i]);
      
      // Verify the DDRAM position
      if ((CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK) != expected_pos[i]) begin
        $error("DDRAM position mismatch at char %0d '%s': got 0x%02x, expected 0x%02x", 
               i, test_chars[i], CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK, expected_pos[i]);
      end
      
      // Special check for transition from line 1 to line 2
      if (i == 15) begin
        $display("*** END OF LINE 1 REACHED - Position 0x%02x ***", CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK);
      end
      if (i == 16) begin
        $display("*** FIRST CHARACTER OF LINE 2 - Position 0x%02x ***", CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK);
      end
      
      #100;
    end
    
    $display("---------------------------------------------------------------");
    $display("TEST_LINE1_TO_LINE2_WRAP completed successfully!");
    $display("Final position: 0x%02x (should be 0x40 - first char of line 2)", CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK);
    $display("---------------------------------------------------------------");
    
    #100;
  endtask

  task automatic TEST_LINE2_TO_LINE1_WRAP;
    bit [31:0] GCSR_is = 0;
    bit [31:0] SCSR_is = 0;
    bit [31:0] CCR_is = 0;
    bit [31:0] CDR_is = 0;
    string test_chars[17] = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0", 
                             "Q", "W", "E", "R", "T", "Y", "!"};
    bit [7:0] char_codes[17] = {8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h30,
                                8'h51, 8'h57, 8'h45, 8'h52, 8'h54, 8'h59, 8'h21};
    // Expected DDRAM positions: Line 2: 0x40-0x4F (16 chars), then Line 1: 0x00 (wrap to first char of line 1)
    bit [7:0] expected_pos[17] = {8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49,
                                  8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h00};

    $display("---------------------------------------------------------------");
    $display("TEST_LINE2_TO_LINE1_WRAP - Writing to end of line 2 (16 chars) and first char of line 1");
    $display("---------------------------------------------------------------");
    
    $display("Clearing display first...");
    blocking_write_register(DCR_ADDR, DCR_CLEAR_DISPLAY_MASK);
    blocking_write_register(GCSR_ADDR, GCSR_START_MASK);
    #4500;
    poll_done_register();
    blocking_write_register(DCR_ADDR, DCR_RESET_AFTER_COMMAND);
    #100;
    
    $display("Writing 16 dummy characters to position cursor at line 2 start...");
    for (int i = 0; i < 16; i++) begin
      blocking_write_register(CDR_ADDR, 32'h00000020); // Space
      blocking_write_register(CCR_ADDR, CCR_WRITE_CHAR_MASK);
      blocking_write_register(GCSR_ADDR, GCSR_START_MASK);
      #3500;
      poll_done_register();
      #50;
    end
    
    // Now we should be at position 0x0F (end of line 1), next write will go to 0x40
    read_register(CCR_ADDR, CCR_is);
    $display("Current position after 16 spaces: 0x%02x", CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK);
    
    // Write characters to fill line 2 (16 chars) and first char of line 1
    for (int i = 0; i < 17; i++) begin
      if (i == 16) begin
        $display("Writing '%s' (0x%02x) - First character of line 1 (wrap around)...", test_chars[i], char_codes[i]);
      end else if (i >= 12) begin
        $display("Writing '%s' (0x%02x) - Position %0d (near end of line 2)...", test_chars[i], char_codes[i], i);
      end else if (i % 5 == 0) begin
        $display("Writing '%s' (0x%02x) - Line 2 Position %0d...", test_chars[i], char_codes[i], i);
      end
      
      blocking_write_register(CDR_ADDR, {24'h000000, char_codes[i]});
      read_register(CDR_ADDR, CDR_is);
      
      blocking_write_register(CCR_ADDR, CCR_WRITE_CHAR_MASK);
      blocking_write_register(GCSR_ADDR, GCSR_START_MASK);
      
      // Wait 10ns and verify write state
      #10;
      read_register(SCSR_ADDR, SCSR_is);
      if (((SCSR_is & SCSR_LCD_STATE_MASK) >> 1) != 8'h04) begin
        $error("LCD not in write state after starting write operation at position %0d", i);
      end
      
      #3490;
      
      poll_done_register();
      
      read_register(CCR_ADDR, CCR_is);
      $display("After '%s': ddram_pos_last_written = 0x%02x (expected: 0x%02x)", 
               test_chars[i], 
               CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK, 
               expected_pos[i]);
      
      // Verify the DDRAM position
      if ((CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK) != expected_pos[i]) begin
        $error("DDRAM position mismatch at char %0d '%s': got 0x%02x, expected 0x%02x", 
               i, test_chars[i], CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK, expected_pos[i]);
      end
      
      // Special check for transition from line 2 to line 1
      if (i == 15) begin
        $display("*** END OF LINE 2 REACHED - Position 0x%02x ***", CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK);
      end
      if (i == 16) begin
        $display("*** WRAPPED TO FIRST CHARACTER OF LINE 1 - Position 0x%02x ***", CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK);
      end
      
      #100;
    end
    
    $display("---------------------------------------------------------------");
    $display("TEST_LINE2_TO_LINE1_WRAP completed successfully!");
    $display("Final position: 0x%02x (should be 0x00 - first char of line 1)", CCR_is & CCR_DDRAM_POS_LAST_WRITTEN_MASK);
    $display("---------------------------------------------------------------");
    
    #100;
  endtask
  
  task automatic TEST_CURSOR_OFF;
    bit [31:0] GCSR_is = 0;
    bit [31:0] SCSR_is = 0;
    bit [31:0] DCR_is = 0;
  
    $display("---------------------------------------------------------------");
    $display("TEST_CURSOR_OFF - Disable Cursor");
    $display("---------------------------------------------------------------");
  
    $display("Disabling cursor...");
    blocking_write_register(DCR_ADDR, 32'h00000000);
    
    // Set cursor_apply
    blocking_write_register(DCR_ADDR, 32'h00000010);
  
    read_register(DCR_ADDR, DCR_is);
    $display("DCR_is : 0x%08x = %032b", DCR_is, DCR_is);
    $display("- cursor_apply is : 0x%08x = %032b", DCR_is & 32'h10, DCR_is & 32'h10);
    $display("- cursor_blink is : 0x%08x = %032b", DCR_is & 32'h08, DCR_is & 32'h08);
  
    blocking_write_register(GCSR_ADDR, GCSR_START_MASK);
  
    #10;
    read_register(SCSR_ADDR, SCSR_is);
    $display("SCSR after 10ns: 0x%08x = %032b", SCSR_is, SCSR_is);
    $display("- lcd_state is : 0x%02x = %08b", (SCSR_is & SCSR_LCD_STATE_MASK) >> 1, (SCSR_is & SCSR_LCD_STATE_MASK) >> 1);
    $display("- lcd_state exp: 0x%02x = %08b", 8'h18, 8'h18);
  
    if (((SCSR_is & SCSR_LCD_STATE_MASK) >> 1) != 8'h18) begin
      $error("LCD did not enter display control state after disabling blink!");
    end
  
    #4490;
    poll_done_register();
  
    $display("---------------------------------------------------------------");
    $display("TEST_CURSOR_BLINK_OFF completed successfully!");
    $display("---------------------------------------------------------------");
  
    #100;
  endtask


  //------------------------------------------------------------------------------------------------------
  // ACTUAL TEST MAIN  
  initial begin : test_routine 
    #10
    start_vips();
    #10
 
    CHECK_REGISTERS();
    TEST_UP();    
    TEST_WRITE_SINGLE_CHAR();
    TEST_WRITE_STRING();
    TEST_CLEAR_DISPLAY();
    TEST_RETURN_HOME();
    TEST_ERROR_HANDLING();
    TEST_LINE1_TO_LINE2_WRAP();
    TEST_LINE2_TO_LINE1_WRAP();
    TEST_CURSOR_OFF();
 
    $display("---------------------------------------------------------------");
    $display("ALL TESTS COMPLETED SUCCESSFULLY!");
    $display("---------------------------------------------------------------");
 
    $finish(); 
            
  end
  
endmodule
