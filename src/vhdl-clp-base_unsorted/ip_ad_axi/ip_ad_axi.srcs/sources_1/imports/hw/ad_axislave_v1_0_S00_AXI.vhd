library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ad_S00_AXI is
  generic (
    -- Users to add parameters here

    -- User parameters ends
    -- Do not modify the parameters beyond this line

    -- Width of S_AXI data bus
    C_S_AXI_DATA_WIDTH  : integer := 32;
    -- Width of S_AXI address bus
    C_S_AXI_ADDR_WIDTH  : integer := 6
  );
  port (
    -- Users to add ports here

    -- User ports ends
    -- Do not modify the ports beyond this line

    -- Global Clock Signal
    S_AXI_ACLK  : in std_logic;
    -- Global Reset Signal. This Signal is Active LOW
    S_AXI_ARESETN : in std_logic;
    -- Write address (issued by master, acceped by Slave)
    S_AXI_AWADDR  : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    -- Write channel Protection type. This signal indicates the
        -- privilege and security level of the transaction, and whether
        -- the transaction is a data access or an instruction access.
    S_AXI_AWPROT  : in std_logic_vector(2 downto 0);
    -- Write address valid. This signal indicates that the master signaling
        -- valid write address and control information.
    S_AXI_AWVALID : in std_logic;
    -- Write address ready. This signal indicates that the slave is ready
        -- to accept an address and associated control signals.
    S_AXI_AWREADY : out std_logic;
    -- Write data (issued by master, acceped by Slave) 
    S_AXI_WDATA : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    -- Write strobes. This signal indicates which byte lanes hold
        -- valid data. There is one write strobe bit for each eight
        -- bits of the write data bus.    
    S_AXI_WSTRB : in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
    -- Write valid. This signal indicates that valid write
        -- data and strobes are available.
    S_AXI_WVALID  : in std_logic;
    -- Write ready. This signal indicates that the slave
        -- can accept the write data.
    S_AXI_WREADY  : out std_logic;
    -- Write response. This signal indicates the status
        -- of the write transaction.
    S_AXI_BRESP : out std_logic_vector(1 downto 0);
    -- Write response valid. This signal indicates that the channel
        -- is signaling a valid write response.
    S_AXI_BVALID  : out std_logic;
    -- Response ready. This signal indicates that the master
        -- can accept a write response.
    S_AXI_BREADY  : in std_logic;
    -- Read address (issued by master, acceped by Slave)
    S_AXI_ARADDR  : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    -- Protection type. This signal indicates the privilege
        -- and security level of the transaction, and whether the
        -- transaction is a data access or an instruction access.
    S_AXI_ARPROT  : in std_logic_vector(2 downto 0);
    -- Read address valid. This signal indicates that the channel
        -- is signaling valid read address and control information.
    S_AXI_ARVALID : in std_logic;
    -- Read address ready. This signal indicates that the slave is
        -- ready to accept an address and associated control signals.
    S_AXI_ARREADY : out std_logic;
    -- Read data (issued by slave)
    S_AXI_RDATA : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    -- Read response. This signal indicates the status of the
        -- read transfer.
    S_AXI_RRESP : out std_logic_vector(1 downto 0);
    -- Read valid. This signal indicates that the channel is
        -- signaling the required read data.
    S_AXI_RVALID  : out std_logic;
    -- Read ready. This signal indicates that the master can
        -- accept the read data and response information.
    S_AXI_RREADY  : in std_logic;
    --
    --dm begin
    -- GCSR
    o_ap_start                   : out std_logic;
    i_ap_done                    : in std_logic;
    -- Outputs to LCD
    i_db4_7                      : in std_logic_vector(3 downto 0);
    i_register_select            : in std_logic;
    i_read_write                 : in std_logic;
    i_read_write_enable          : in std_logic;
    -- SCSR0
    i_lcd_initialized            : in std_logic;
    i_lcd_busy                   : in std_logic;
    -- CDR
    o_symbol_to_write            : out std_logic_vector(7 downto 0);
    -- CCR
    i_ddram_pos_last_written     : in std_logic_vector(7 downto 0);
    o_write_char                 : out std_logic;
    -- Interrupts
    interrupt: out std_logic
   --dm end    
  );
end ad_S00_AXI;

architecture arch_imp of ad_S00_AXI is

  -- AXI4LITE signals
  signal axi_awaddr : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
  signal axi_awready  : std_logic;
  signal axi_wready : std_logic;
  signal axi_bresp  : std_logic_vector(1 downto 0);
  signal axi_bvalid : std_logic;
  signal axi_araddr : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
  signal axi_arready  : std_logic;
  signal axi_rdata  : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
  signal axi_rresp  : std_logic_vector(1 downto 0);
  signal axi_rvalid : std_logic;

  -- Example-specific design signals
  -- local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
  -- ADDR_LSB is used for addressing 32/64 bit registers/memories
  -- ADDR_LSB = 2 for 32 bits (n downto 2)
  -- ADDR_LSB = 3 for 64 bits (n downto 3)
  constant ADDR_LSB  : integer := (C_S_AXI_DATA_WIDTH/32)+ 1;
  constant OPT_MEM_ADDR_BITS : integer := 3;
  ------------------------------------------------
  ---- Signals for user logic register space example
  --------------------------------------------------
  ---- Number of Slave Registers 10
  --dm begin adapted
  signal GCSR_reg : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); --slv_reg00
  -- signal GIER_reg : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); --slv_reg01 --implemented in v07
  -- signal IPIER_reg : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); --slv_reg02 --implemented in v07
  -- signal IPISR_reg : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); --slv_reg03 --implemented in v07
  signal IDR_reg : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); --slv_reg04
  signal VERR_reg : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); --slv_reg05
  signal SCSR0_reg : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); --slv_reg06
  signal CCR_reg : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); --slv_reg07
  signal CDR_reg : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); --slv_reg08
  signal DCR_reg : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); --slv_reg09
  
  signal slv_reg_rden : std_logic;
  signal slv_reg_wren : std_logic;
  signal reg_data_out :std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
  signal byte_index : integer;
  signal aw_en  : std_logic;
  
  --Register Adresses    
  constant GCSR_ADDR : std_logic_vector(OPT_MEM_ADDR_BITS downto 0) := x"0"; --offset x"00"
  -- constant GIER_ADDR : std_logic_vector(OPT_MEM_ADDR_BITS downto 0) := x"1"; --offset x"04" 
  -- constant IPIER_ADDR : std_logic_vector(OPT_MEM_ADDR_BITS downto 0) := x"2"; --offset x"08" 
  -- constant IPISR_ADDR : std_logic_vector(OPT_MEM_ADDR_BITS downto 0) := x"3"; --offset x"0C"
  constant IDR_ADDR : std_logic_vector(OPT_MEM_ADDR_BITS downto 0) := x"4"; --offset x"10"
  constant VERR_ADDR : std_logic_vector(OPT_MEM_ADDR_BITS downto 0) := x"5"; --offset x"14"
  constant SCSR0_ADDR : std_logic_vector(OPT_MEM_ADDR_BITS downto 0) := x"6"; --offset x"18"
  constant CCR_ADDR : std_logic_vector(OPT_MEM_ADDR_BITS downto 0) := x"7"; --offset x"1C"
  constant CDR_ADDR : std_logic_vector(OPT_MEM_ADDR_BITS downto 0) := x"8"; --offset x"20"
  constant DCR_ADDR : std_logic_vector(OPT_MEM_ADDR_BITS downto 0) := x"9"; --offset x"24"
  --dm end
    
begin
  -- I/O Connections assignments
  S_AXI_AWREADY <= axi_awready;
  S_AXI_WREADY  <= axi_wready;
  S_AXI_BRESP <= axi_bresp;
  S_AXI_BVALID  <= axi_bvalid;
  S_AXI_ARREADY <= axi_arready;
  S_AXI_RDATA <= axi_rdata;
  S_AXI_RRESP <= axi_rresp;
  S_AXI_RVALID  <= axi_rvalid;

  -- Implement axi_awready generation
  -- axi_awready is asserted for one S_AXI_ACLK clock cycle when both
  -- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
  -- de-asserted when reset is low.
  process (S_AXI_ACLK)
  begin
    if rising_edge(S_AXI_ACLK) then 
      if S_AXI_ARESETN = '0' then
        axi_awready <= '0';
        aw_en <= '1';
      else
        if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1' and aw_en = '1') then
          -- slave is ready to accept write address when
          -- there is a valid write address and write data
          -- on the write address and data bus. This design 
          -- expects no outstanding transactions. 
             axi_awready <= '1';
             aw_en <= '0';
        elsif (S_AXI_BREADY = '1' and axi_bvalid = '1') then
             aw_en <= '1';
             axi_awready <= '0';
        else
          axi_awready <= '0';
        end if;
      end if;
    end if;
  end process;

  -- Implement axi_awaddr latching
  -- This process is used to latch the address when both 
  -- S_AXI_AWVALID and S_AXI_WVALID are valid. 
  process (S_AXI_ACLK)
  begin
    if rising_edge(S_AXI_ACLK) then 
      if S_AXI_ARESETN = '0' then
        axi_awaddr <= (others => '0');
      else
        if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1' and aw_en = '1') then
          -- Write Address latching
          axi_awaddr <= S_AXI_AWADDR;
        end if;
      end if;
    end if;                   
  end process; 

  -- Implement axi_wready generation
  -- axi_wready is asserted for one S_AXI_ACLK clock cycle when both
  -- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
  -- de-asserted when reset is low. 
  process (S_AXI_ACLK)
  begin
    if rising_edge(S_AXI_ACLK) then 
      if S_AXI_ARESETN = '0' then
        axi_wready <= '0';
      else
        if (axi_wready = '0' and S_AXI_WVALID = '1' and S_AXI_AWVALID = '1' and aw_en = '1') then
          -- slave is ready to accept write data when 
          -- there is a valid write address and write data
          -- on the write address and data bus. This design 
          -- expects no outstanding transactions.           
            axi_wready <= '1';
        else
          axi_wready <= '0';
        end if;
      end if;
    end if;
  end process; 

  -- Implement write response logic generation
  -- The write response and response valid signals are asserted by the slave 
  -- when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
  -- This marks the acceptance of address and indicates the status of 
  -- write transaction.
  process (S_AXI_ACLK)
  begin
    if rising_edge(S_AXI_ACLK) then 
      if S_AXI_ARESETN = '0' then
        axi_bvalid  <= '0';
        axi_bresp   <= "00"; --need to work more on the responses
      else
        if (axi_awready = '1' and S_AXI_AWVALID = '1' and axi_wready = '1' and S_AXI_WVALID = '1' and axi_bvalid = '0'  ) then
          axi_bvalid <= '1';
          axi_bresp  <= "00"; 
        elsif (S_AXI_BREADY = '1' and axi_bvalid = '1') then   --check if bready is asserted while bvalid is high)
          axi_bvalid <= '0';                                 -- (there is a possibility that bready is always asserted high)
        end if;
      end if;
    end if;                   
  end process; 

  -- Implement axi_arready generation
  -- axi_arready is asserted for one S_AXI_ACLK clock cycle when
  -- S_AXI_ARVALID is asserted. axi_awready is 
  -- de-asserted when reset (active low) is asserted. 
  -- The read address is also latched when S_AXI_ARVALID is 
  -- asserted. axi_araddr is reset to zero on reset assertion.
  process (S_AXI_ACLK)
  begin
    if rising_edge(S_AXI_ACLK) then 
      if S_AXI_ARESETN = '0' then
        axi_arready <= '0';
        axi_araddr  <= (others => '1');
      else
        if (axi_arready = '0' and S_AXI_ARVALID = '1') then
          -- indicates that the slave has acceped the valid read address
          axi_arready <= '1';
          -- Read Address latching 
          axi_araddr  <= S_AXI_ARADDR;           
        else
          axi_arready <= '0';
        end if;
      end if;
    end if;                   
  end process; 

  -- Implement axi_arvalid generation
  -- axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
  -- S_AXI_ARVALID and axi_arready are asserted. The slave registers 
  -- data are available on the axi_rdata bus at this instance. The 
  -- assertion of axi_rvalid marks the validity of read data on the 
  -- bus and axi_rresp indicates the status of read transaction.axi_rvalid 
  -- is deasserted on reset (active low). axi_rresp and axi_rdata are 
  -- cleared to zero on reset (active low).  
  process (S_AXI_ACLK)
  begin
    if rising_edge(S_AXI_ACLK) then
      if S_AXI_ARESETN = '0' then
        axi_rvalid <= '0';
        axi_rresp  <= "00";
      else
        if (axi_arready = '1' and S_AXI_ARVALID = '1' and axi_rvalid = '0') then
          -- Valid read data is available at the read data bus
          axi_rvalid <= '1';
          axi_rresp  <= "00"; -- 'OKAY' response
        elsif (axi_rvalid = '1' and S_AXI_RREADY = '1') then
          -- Read data is accepted by the master
          axi_rvalid <= '0';
        end if;            
      end if;
    end if;
  end process;
  
  --dm begin
  --dm part 1 register overview (centrcal documentation)
    --GCSR General/Global Control and Status Register slv_reg00 0x00
      o_ap_start <= GCSR_reg(0); --axi rw ip r part2
      GCSR_reg(1)<= i_ap_done; --axi r ip rw part3
      --GCSR_reg(2)<= i_ap_idle; --axi r ip rw part3
      --GCSR_reg(3)<= i_ap_ready; --reserved --axi r ip rw part3
      GCSR_reg(3)<= '0'; --reserved 
      -- o_ap_continue<=GCSR_reg(4) --reserved --axi rw ip r part2
      GCSR_reg(4)<= '0'; --reserved
      GCSR_reg(5)<= '0'; --reserved
      GCSR_reg(6)<= '0'; --reserved
      -- o_auto_restart<= GCSR_reg(7); --axi rw ip r part2
      GCSR_reg(31 downto 8) <= (others =>'0'); --reserved
    --GIER Global Interrupt Enable Register slv_reg01 0x04
      -- GIER_reg(31 downto 0) <= (others =>'0'); --reserved      
    --IPIER IP Interrupt Enable Register slv_reg02 0x08 
      -- IPIER_reg(31 downto 0) <= (others =>'0'); --reserved      
    --IPISR IP Interrupt Status Register slv_reg03 0x0C 
      -- IPISR_reg(31 downto 0) <= (others =>'0'); --reserved
    --IDR ID Register slv_reg04 0x10 
      IDR_reg(31 downto 0) <= x"80010744"; --const axi r ip rw part3
    --VERR Version Register slv_reg05 0x14 
      VERR_reg(31 downto 0) <= x"80001000"; --const axi r ip rw part3    
    --SCSR Special Control and Status Register slv_reg06 0x18
      SCSR0_reg(0)<= i_lcd_initialized; --axi r ip rw part3
      SCSR0_reg(1)<= i_lcd_busy; --axi r ip rw part3
      SCSR0_reg(2)<= '0'; --reserved
      SCSR0_reg(10 downto 3)<= (others=>'0'); --reserved
      SCSR0_reg(11)<= '0'; --reserved
      SCSR0_reg(12)<= '0'; --reserved
      SCSR0_reg(20 downto 13)<= (others=>'0'); --reserved
      SCSR0_reg(31 downto 21)<= (others=>'0'); --reserved       
    --CCR Character Control Register slv_reg07 0x1C
      CCR_reg(7 downto 0)<= i_ddram_pos_last_written; --axi r ip rw part3
      CCR_reg(15 downto 8)<= (others=>'0'); --reserved
      o_write_char<=CCR_reg(16); --axi rw ip r part2
      CCR_reg(17)<= '0'; --reserved
      CCR_reg(31 downto 18)<= (others=>'0'); --reserved
    --CDR Character Data Register slv_reg08 0x20 
      o_symbol_to_write <= CDR_reg(7 downto 0); --axi rw ip r part2
      CDR_reg(15 downto 8) <= (others =>'0'); --reserved
      CDR_reg(31 downto 16) <= (others =>'0'); --reserved
    --DCR Display Control Register slv_reg09 0x24
      DCR_reg(0)<= '0'; --reserved
      DCR_reg(1)<= '0'; --reserved
      DCR_reg(2)<= '0'; --reserved
      DCR_reg(3)<= '0'; --reserved
      DCR_reg(4)<= '0'; --reserved
      DCR_reg(5)<= '0'; --reserved
      DCR_reg(6)<= '0'; --reserved
      DCR_reg(31 downto 7)<= (others=>'0'); --reserved      
  --dm end

  --dm begin adpted
  --dm part2 write register/register parts by axi only [axi rw ip r]
    
  -- Implement memory mapped register select and write logic generation
  -- The write data is accepted and written to memory mapped registers when
  -- axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
  -- select byte enables of slave registers while writing.
  -- These registers are cleared when reset (active low) is applied.
  -- Slave register write enable is asserted when valid address and data are available
  -- and the slave is ready to accept the write address and write data.
  slv_reg_wren <= axi_wready and S_AXI_WVALID and axi_awready and S_AXI_AWVALID ;

  process (S_AXI_ACLK)
  variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0); 
  begin
    if rising_edge(S_AXI_ACLK) then 
      if S_AXI_ARESETN = '0' then
        GCSR_reg(0) <= '0'; --o_ap_start
        CCR_reg(16) <= '0'; --o_write_char
        CDR_reg(7 downto 0) <= (others => '0'); --o_symbol_to_write
      else
        loc_addr := axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
        if (slv_reg_wren = '1') then
          case loc_addr is
            when GCSR_ADDR =>
              if ( S_AXI_WSTRB(0) = '1' ) then --(7 downto 0)
                  GCSR_reg(0) <= S_AXI_WDATA(0);
              end if;
              
            when CCR_ADDR =>
              if ( S_AXI_WSTRB(2) = '1' ) then --(23 downto 16)
                CCR_reg(16) <= S_AXI_WDATA(16);
              end if;

            when CDR_ADDR =>
              if ( S_AXI_WSTRB(0) = '1' ) then --(7 downto 0)
                  CDR_reg(7 downto 0) <= S_AXI_WDATA(7 downto 0);
              end if;
              
            when others =>
          end case;
        end if;
      end if;
    end if;                   
  end process; 
  --dm end adpted

      
  --dm begin
  --dm part3 write register/register parts by ip only [axi r ip rw] 
  process (S_AXI_ACLK)
  variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0);
  begin
    if rising_edge(S_AXI_ACLK) then
      if S_AXI_ARESETN = '0' then
        GCSR_reg(1) <= '0'; -- i_ap_done     
        SCSR0_reg(0) <= '0'; -- i_lcd_initialized
        SCSR0_reg(1) <= '0'; -- i_lcd_busy
        CCR_reg(7 downto 0) <= (others => '0'); -- i_ddram_pos_last_written
      else
        loc_addr := axi_araddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);

        SCSR0_reg(0) <= i_lcd_initialized;
        SCSR0_reg(1) <= i_lcd_busy;
        CCR_reg(7 downto 0) <= i_ddram_pos_last_written;
        
        -- TODO
        if(i_ap_done = '1') then --set when core indicated done
          GCSR_reg(1) <= '1';              
        elsif(axi_arready = '1' and loc_addr = GCSR_ADDR ) then --reset when host reads control register
          GCSR_reg(1) <= '0';
        end if;
      end if;
    end if;
  end process;     
  --dm end
    
  --dm begin
  --dm part4 write register/register parts by axi AND ip [axi rw ip rw] 
  process (S_AXI_ACLK)
  variable loc_addr : std_logic_vector(OPT_MEM_ADDR_BITS downto 0); 
  begin
    if rising_edge(S_AXI_ACLK) then
      if S_AXI_ARESETN = '0' then    
      else
        loc_addr := axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
          -- if ... and S_AXI_WDATA(0)='1' -> allow software only to trigger start but not to trigger aboart 
          if(axi_wready = '1' and loc_addr = GCSR_ADDR  
                    and S_AXI_WSTRB(0) = '1' and S_AXI_WDATA(0)='1') then
              GCSR_reg(0) <= '1';
          -- TODO           
          -- elsif(i_ap_done = '1') then 
          --    --Version01: clears when ap_done asserted
          --      --GCSR_reg(0) <='0'; 
          --    --Version02: cleares when ap_done is asserted (and o_auto_restart is false) and 
          --    --retriggers ap_start in case o_auto_restart is true                
          --      GCSR_reg(0) <=GCSR_reg(7); --o_auto_restart<= GCSR_reg(7); --axi rw ip r part2
          end if;
      end if;
    end if;  
  end process;
  --dm end


  --dm begin adapted
  --dm part5 read register    
      
  -- Implement memory mapped register select and read logic generation
  -- Slave register read enable is asserted when valid address is available
  -- and the slave is ready to accept the read address.
  slv_reg_rden <= axi_arready and S_AXI_ARVALID and (not axi_rvalid);
 
  --all registers have to be in sensitivity list
  process (GCSR_reg, IDR_reg, VERR_reg, SCSR0_reg, CCR_reg, CDR_reg, DCR_reg, axi_araddr, S_AXI_ARESETN, slv_reg_rden)
  
  variable loc_addr : std_logic_vector(OPT_MEM_ADDR_BITS downto 0);
  begin
      -- Address decoding for reading registers
      loc_addr := axi_araddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
      case loc_addr is
        when GCSR_ADDR =>
          reg_data_out <= GCSR_reg;
          
        --##INSERT YOUR CODE HERE   

        --##INSERT YOUR CODE HERE END  
          
        when IDR_ADDR =>
          reg_data_out <= IDR_reg;
        when VERR_ADDR =>
          reg_data_out <= VERR_reg;
        when SCSR0_ADDR =>
          reg_data_out <= SCSR0_reg;
        when CCR_ADDR =>
          reg_data_out <= CCR_reg;
        when CDR_ADDR =>
          reg_data_out <= CDR_reg;
        when DCR_ADDR =>
          reg_data_out <= DCR_reg;
        when others =>
          reg_data_out  <= (others => '0');
      end case;
  end process; 
  --dm end adapted

  -- Output register or memory read data
  process( S_AXI_ACLK ) is
  begin
    if (rising_edge (S_AXI_ACLK)) then
      if ( S_AXI_ARESETN = '0' ) then
        axi_rdata  <= (others => '0');
      else
        if (slv_reg_rden = '1') then
          -- When there is a valid read address (S_AXI_ARVALID) with 
          -- acceptance of read address by the slave (axi_arready), 
          -- output the read dada 
          -- Read address mux
            axi_rdata <= reg_data_out;     -- register read data
        end if;   
      end if;
    end if;
  end process;


  -- Add user logic here
  --dm begin adapted
  interrupt <='0'; --if no interrupts are implemented set signal to zero
  --dm end 
  -- User logic ends

end arch_imp;
