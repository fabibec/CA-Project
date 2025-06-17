/////////////////////////////////////////////////////////////
// Reusing and adapting AXI VIP functions out of Xilinx Tutorial
//
//https://github.com/Xilinx/Vitis-Tutorials/blob/2023.2/Hardware_Acceleration/Feature_Tutorials/01-rtl_kernel_workflow/reference-files/src/testbench/Vadd_A_B_tb.sv   
//
////////////////////////////////////////////////////////////  
   
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
    
    expectedval=0;
    expectedval=GIER_GIE_MASK;
    check_32bitregister_value_with_gaps (GIER_ADDR, expectedval, 32'h00000000, tmp_error_found);
    error_found |= tmp_error_found;
    expectedval=0;
    expectedval=IPIER_IPIE_MASK;
    check_32bitregister_value_with_gaps (IPIER_ADDR, expectedval, 32'h00000000, tmp_error_found);
    error_found |= tmp_error_found;
    expectedval=0;
    expectedval=IPISR_IPIS_MASK;
    check_32bitregister_value_with_gaps (IPISR_ADDR, expectedval, expectedval, tmp_error_found); //write 1 to toggle!
    check_32bitregister_value_with_gaps (IPISR_ADDR, 32'h00000000, 32'h00000000, tmp_error_found); //write 1 to toggle!
    error_found |= tmp_error_found;
    check_32bitregister_value_with_gaps (IDR_ADDR, 32'h8001DEEF, 32'h8001DEEF, tmp_error_found);
    error_found |= tmp_error_found;
    check_32bitregister_value_with_gaps (VERR_ADDR, 32'h80001000, 32'h80001000, tmp_error_found);
    error_found |= tmp_error_found;
    check_32bitregister_value_with_gaps (CR0_ADDR, 32'h00000000, 32'h00000000, tmp_error_found);
    error_found |= tmp_error_found;
    check_32bitregister_value_with_gaps (LR0_ADDR, 32'hffffffff, 32'h00000000, tmp_error_found);
    error_found |= tmp_error_found;
    //check_32bitregister_value_with_gaps (REG09_ADDR, 32'h00000000, tmp_error_found);
    //error_found |= tmp_error_found;
    expectedval=0;
    //expectedval=SCSR_ENT0_OUT_MASK | SCSR_LOAD0_MASK | SCSR_UD0_MASK; //only implemented writable bits
    expectedval=SCSR_ENT0_OUT_MASK | SCSR_LOAD0_MASK | SCSR_UD0_MASK | SCSR_RESETIP_MASK | SCSR_FREEZEIP_MASK; //only implemented writable bits
    check_32bitregister_value_with_gaps (SCSR_ADDR, expectedval, 32'h00000000, tmp_error_found);
    error_found |= tmp_error_found; 
    expectedval=0;   
    expectedval=GCSR_START_MASK | GCSR_AUTO_RESTART_MASK; //only implemented writable bits
    check_32bitregister_value_with_gaps (GCSR_ADDR, expectedval, 32'h00000000, tmp_error_found);
    //done (2) and idle (3) will show error since done and idle can already be asserted
    error_found |= tmp_error_found;    
  endtask
 

  task automatic wait_for_interrupt;
    //bit [31:0] rd_value;
    //do begin
    //  read_register(IPISR_ADDR, rd_value);
    //end while ((rd_value & IPISR_IPIS_MASK) == 0);

    //@interrupt //error does not work
    //@(posedge interrupt); //works
    wait(interrupt==1'b1); //works        
  endtask