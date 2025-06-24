----------------------------------------------------------------------------------
-- Engineer: Jendrik Jürgens (3361128), Michael Specht (3362589)
-- Further Information: Template from ELO.
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ad is
  generic (
    -- Parameters of Axi Slave Bus Interface S00_AXI
    C_S00_AXI_DATA_WIDTH  : integer := 32;
    C_S00_AXI_ADDR_WIDTH  : integer := 6;

    G_AXI_AD_T_POWER_ON : integer := 3000000;
    G_AXI_AD_T_SU       : integer := 6;
    G_AXI_AD_T_W        : integer := 45;
    G_AXI_AD_T_H        : integer := 3;
    G_AXI_AD_T_16_4MS   : integer := 164000;
    G_AXI_AD_T_40_US    : integer := 4000;
    G_AXI_AD_T_LOWER_UPPER_WAIT : integer := 150
  );
  port (
    o_db4_7: out std_logic_vector(3 downto 0);
    o_register_select: out std_logic;
    o_read_write: out std_logic;
    o_read_write_enable: out std_logic;
    o_interrupt: out std_logic;
    
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
    
    -- GCSR
    o_ap_start : out std_logic;
    i_ap_done : in std_logic;
    i_ap_idle : in std_logic;

    -- SCSR0
    i_lcd_initialized : in std_logic;
    i_lcd_state : in std_logic_vector(7 downto 0);
    i_lcd_error_flag : in std_logic;

    -- CCR
    i_ddram_pos_last_written : in std_logic_vector(7 downto 0);
    o_write_char : out std_logic;

    -- CDR
    o_symbol_to_write : out std_logic_vector(7 downto 0);

    -- DCR
    o_clear_display : out std_logic;
    o_return_home : out std_logic;
    o_cursor_on : out std_logic;
    o_cursor_blink : out std_logic;
    o_cursor_apply : out std_logic;

    --
    interrupt : out std_logic
    );
  end component ad_S00_AXI;
  
  component ad_core is
    generic (
      G_AD_T_POWER_ON : integer := 3000000;
      G_AD_T_SU       : integer := 6;
      G_AD_T_W        : integer := 45;
      G_AD_T_H        : integer := 3;
      G_AD_T_16_4MS   : integer := 164000;
      G_AD_T_40_US    : integer := 4000;
      G_AD_T_LOWER_UPPER_WAIT : integer := 150
      );
    Port (
      i_clk : in std_logic;
      i_reset : in std_logic;
      
      -- outputs to LCD
      o_db4_7 : out std_logic_vector(3 downto 0);
      o_register_select : out std_logic;
      o_read_write : out std_logic;
      o_read_write_enable : out std_logic;
      
      -- GCSR
      i_ap_start : in std_logic;
      o_ap_done : out std_logic;
      o_ap_idle : out std_logic;
      
      -- SCSR0
      o_lcd_initialized : out std_logic;
      o_lcd_state : out std_logic_vector(7 downto 0);
      o_lcd_error_flag : out std_logic;
      
      -- CCR
      o_ddram_pos_last_written : out std_logic_vector(7 downto 0);
      i_write_char : in std_logic;
      
      -- CDR
      i_symbol_to_write : in std_logic_vector(7 downto 0);
      
      -- DCR
      i_clear_display : in std_logic;
      i_return_home : in std_logic;
      i_cursor_on : in std_logic;
      i_cursor_blink : in std_logic;
      i_cursor_apply : in std_logic
    );
  end component;

  signal w_reset : std_logic;
  
  -- Outputs to LCD
  signal w_db4_7 : std_logic_vector(3 downto 0);
  signal w_register_select : std_logic;
  signal w_read_write : std_logic;
  signal w_read_write_enable : std_logic;

  -- GCSR
  signal w_ap_start : std_logic;
  signal w_ap_done : std_logic;
  signal w_ap_idle : std_logic;

  -- SCSR0
  signal w_lcd_initialized : std_logic;
  signal w_lcd_state : std_logic_vector(7 downto 0);
  signal w_lcd_error_flag : std_logic;

  -- CCR
  signal w_ddram_pos_last_written : std_logic_vector(7 downto 0);
  signal w_write_char : std_logic;

  -- CDR
  signal w_symbol_to_write : std_logic_vector(7 downto 0);

  -- DCR
  signal w_clear_display : std_logic;
  signal w_return_home : std_logic;
  signal w_cursor_on : std_logic;
  signal w_cursor_blink : std_logic;
  signal w_cursor_apply : std_logic;
  
  --
  signal w_interrupt : std_logic;
 
begin
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
  
      -- GCSR
      o_ap_start => w_ap_start,
      i_ap_done => w_ap_done,
      i_ap_idle => w_ap_idle,
  
      -- SCSR0
      i_lcd_initialized => w_lcd_initialized,
      i_lcd_state => w_lcd_state,
      i_lcd_error_flag => w_lcd_error_flag,
  
      -- CCR
      i_ddram_pos_last_written => w_ddram_pos_last_written,
      o_write_char => w_write_char,
  
      -- CDR
      o_symbol_to_write => w_symbol_to_write,
  
      -- DCR
      o_clear_display => w_clear_display,
      o_return_home => w_return_home,
      o_cursor_on => w_cursor_on,
      o_cursor_blink => w_cursor_blink,
      o_cursor_apply => w_cursor_apply,
  
      --
      interrupt => w_interrupt
    );

  w_reset <= not s00_axi_aresetn;

  ad_core_inst: ad_core
    generic map (
      G_AD_T_POWER_ON => G_AXI_AD_T_POWER_ON,
      G_AD_T_SU => G_AXI_AD_T_SU,
      G_AD_T_W => G_AXI_AD_T_W,
      G_AD_T_H => G_AXI_AD_T_H,
      G_AD_T_16_4MS => G_AXI_AD_T_16_4MS,
      G_AD_T_40_US => G_AXI_AD_T_40_US,
      G_AD_T_LOWER_UPPER_WAIT => G_AXI_AD_T_LOWER_UPPER_WAIT
    )
    port map(
      i_clk => s00_axi_aclk,
      i_reset => w_reset,
      
      -- outputs to LCD
      o_db4_7 => w_db4_7,
      o_register_select => w_register_select,
      o_read_write => w_read_write,
      o_read_write_enable => w_read_write_enable,
      
      -- GCSR
      i_ap_start => w_ap_start,
      o_ap_done => w_ap_done,
      o_ap_idle => w_ap_idle,
      
      -- SCSR0
      o_lcd_initialized => w_lcd_initialized,
      o_lcd_state => w_lcd_state,
      o_lcd_error_flag => w_lcd_error_flag,
      
      -- CCR
      o_ddram_pos_last_written => w_ddram_pos_last_written,
      i_write_char => w_write_char,
      
      -- CDR
      i_symbol_to_write => w_symbol_to_write,
      
      -- DCR
      i_clear_display => w_clear_display,
      i_return_home => w_return_home,
      i_cursor_on => w_cursor_on,
      i_cursor_blink => w_cursor_blink,
      i_cursor_apply => w_cursor_apply
    );

  o_db4_7 <= w_db4_7;
  o_register_select <= w_register_select;
  o_read_write <= w_read_write;
  o_read_write_enable <= w_read_write_enable;

  o_interrupt <= w_interrupt;
end arch_imp;