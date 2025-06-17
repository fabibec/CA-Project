library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ad is
  generic (
    -- Users to add parameters here

    -- User parameters ends
    -- Do not modify the parameters beyond this line


    -- Parameters of Axi Slave Bus Interface S00_AXI
    C_S00_AXI_DATA_WIDTH  : integer := 32;
    C_S00_AXI_ADDR_WIDTH  : integer := 6
  );
  port (
    -- Users to add ports here
    --dm begin
    o_db4_7: out std_logic_vector(3 downto 0);
    o_register_select: out std_logic;
    o_read_write: out std_logic;
    o_read_write_enable: out std_logic;
    --
    interrupt: out std_logic;
    --dm end
    
    -- User ports ends
    -- Do not modify the ports beyond this line

    -- Ports of Axi Slave Bus Interface S00_AXI
    s00_axi_aclk  : in std_logic;
    s00_axi_aresetn : in std_logic;
    s00_axi_awaddr  : in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
    s00_axi_awprot  : in std_logic_vector(2 downto 0);
    s00_axi_awvalid : in std_logic;
    s00_axi_awready : out std_logic;
    s00_axi_wdata : in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
    s00_axi_wstrb : in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
    s00_axi_wvalid  : in std_logic;
    s00_axi_wready  : out std_logic;
    s00_axi_bresp : out std_logic_vector(1 downto 0);
    s00_axi_bvalid  : out std_logic;
    s00_axi_bready  : in std_logic;
    s00_axi_araddr  : in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
    s00_axi_arprot  : in std_logic_vector(2 downto 0);
    s00_axi_arvalid : in std_logic;
    s00_axi_arready : out std_logic;
    s00_axi_rdata : out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
    s00_axi_rresp : out std_logic_vector(1 downto 0);
    s00_axi_rvalid  : out std_logic;
    s00_axi_rready  : in std_logic    
  );
end ad;

architecture arch_imp of ad is

  -- component declaration
  component ad_S00_AXI is
    generic (
    C_S_AXI_DATA_WIDTH  : integer := 32;
    C_S_AXI_ADDR_WIDTH  : integer := 6
    );
    port (
    S_AXI_ACLK  : in std_logic;
    S_AXI_ARESETN : in std_logic;
    S_AXI_AWADDR  : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_AWPROT  : in std_logic_vector(2 downto 0);
    S_AXI_AWVALID : in std_logic;
    S_AXI_AWREADY : out std_logic;
    S_AXI_WDATA : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_WSTRB : in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
    S_AXI_WVALID  : in std_logic;
    S_AXI_WREADY  : out std_logic;
    S_AXI_BRESP : out std_logic_vector(1 downto 0);
    S_AXI_BVALID  : out std_logic;
    S_AXI_BREADY  : in std_logic;
    S_AXI_ARADDR  : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_ARPROT  : in std_logic_vector(2 downto 0);
    S_AXI_ARVALID : in std_logic;
    S_AXI_ARREADY : out std_logic;
    S_AXI_RDATA : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_RRESP : out std_logic_vector(1 downto 0);
    S_AXI_RVALID  : out std_logic;
    S_AXI_RREADY  : in std_logic;
    
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
  end component ad_S00_AXI;

  --dm begin
  component ad_core is
    port ( 
      i_clk                        : in std_logic;
      i_reset                      : in std_logic;
      -- GCSR
      i_ap_start                   : in std_logic;
      o_ap_done                    : out std_logic;
      -- Outputs to LCD
      o_db4_7                      : out std_logic_vector(3 downto 0);
      o_register_select            : out std_logic;
      o_read_write                 : out std_logic;
      o_read_write_enable          : out std_logic;
      -- SCSR0
      o_lcd_initialized            : out std_logic;
      o_lcd_busy                   : out std_logic;
      -- CDR
      i_symbol_to_write            : in std_logic_vector(7 downto 0);
      -- CCR
      o_ddram_pos_last_written     : out std_logic_vector(7 downto 0);
      i_write_char                 : in std_logic
    );
  end component;

  signal w_reset : std_logic;
  
  -- GCSR
  signal w_ap_start : std_logic;
  signal w_ap_done : std_logic;
  -- Outputs to LCD
  signal w_db4_7 : std_logic_vector(3 downto 0);
  signal w_register_select : std_logic;
  signal w_read_write : std_logic;
  signal w_read_write_enable : std_logic;
  -- SCSR0
  signal w_lcd_initialized : std_logic;
  signal w_lcd_busy : std_logic;
  -- CDR
  signal w_symbol_to_write : std_logic_vector(7 downto 0);
  -- CCR
  signal w_ddram_pos_last_written : std_logic_vector(7 downto 0);
  signal w_write_char : std_logic;
  -- Interrupts
  signal w_interrupt: std_logic;
  --dm end
 
begin

-- Instantiation of Axi Bus Interface S00_AXI
ad_S00_AXI_inst : ad_S00_AXI
  generic map (
    C_S_AXI_DATA_WIDTH  => C_S00_AXI_DATA_WIDTH,
    C_S_AXI_ADDR_WIDTH  => C_S00_AXI_ADDR_WIDTH
  )
  port map (
    S_AXI_ACLK  => s00_axi_aclk,
    S_AXI_ARESETN => s00_axi_aresetn,
    S_AXI_AWADDR  => s00_axi_awaddr,
    S_AXI_AWPROT  => s00_axi_awprot,
    S_AXI_AWVALID => s00_axi_awvalid,
    S_AXI_AWREADY => s00_axi_awready,
    S_AXI_WDATA => s00_axi_wdata,
    S_AXI_WSTRB => s00_axi_wstrb,
    S_AXI_WVALID  => s00_axi_wvalid,
    S_AXI_WREADY  => s00_axi_wready,
    S_AXI_BRESP => s00_axi_bresp,
    S_AXI_BVALID  => s00_axi_bvalid,
    S_AXI_BREADY  => s00_axi_bready,
    S_AXI_ARADDR  => s00_axi_araddr,
    S_AXI_ARPROT  => s00_axi_arprot,
    S_AXI_ARVALID => s00_axi_arvalid,
    S_AXI_ARREADY => s00_axi_arready,
    S_AXI_RDATA => s00_axi_rdata,
    S_AXI_RRESP => s00_axi_rresp,
    S_AXI_RVALID  => s00_axi_rvalid,
    S_AXI_RREADY  => s00_axi_rready,
    --dm begin
    -- GCSR
    o_ap_start => w_ap_start,
    i_ap_done => w_ap_done,
    -- Outputs to LCD
    i_db4_7 => w_db4_7,
    i_register_select => w_register_select,
    i_read_write => w_read_write,
    i_read_write_enable => w_read_write_enable,
    -- SCSR0
    i_lcd_initialized => w_lcd_initialized,
    i_lcd_busy => w_lcd_busy,
    -- CDR
    o_symbol_to_write => w_symbol_to_write,
    -- CCR
    i_ddram_pos_last_written => w_ddram_pos_last_written,
    o_write_char => w_write_char,
    -- Interrupts
    interrupt => w_interrupt
    --dm end
  );

  -- Add user logic here
  --dm begin
  w_reset <= not s00_axi_aresetn;

  ad_core_inst: ad_core
    port map(
      i_clk => s00_axi_aclk,
      i_reset => w_reset,
      -- GCSR
      i_ap_start => w_ap_start,
      o_ap_done => w_ap_done,
      -- Outputs to LCD
      o_db4_7 => w_db4_7,
      o_register_select => w_register_select,
      o_read_write => w_read_write,
      o_read_write_enable => w_read_write_enable,
      -- SCSR0
      o_lcd_initialized => w_lcd_initialized,
      o_lcd_busy => w_lcd_busy,
      -- CDR
      i_symbol_to_write => w_symbol_to_write,
      -- CCR
      o_ddram_pos_last_written => w_ddram_pos_last_written,
      i_write_char => w_write_char
    );

  o_db4_7 <= w_db4_7;
  o_register_select <= w_register_select;
  o_read_write <= w_read_write;
  o_read_write_enable <= w_read_write_enable;

  interrupt <= w_interrupt;

  --dm end
  -- User logic ends

end arch_imp;
