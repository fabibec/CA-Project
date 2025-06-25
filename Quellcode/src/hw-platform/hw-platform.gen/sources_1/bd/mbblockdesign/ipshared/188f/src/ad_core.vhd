----------------------------------------------------------------------------------
-- Engineer: Jendrik Jürgens (3361128), Michael Specht (3362589)
-- Further Information: Simple wrapper for lcd_controller to have a 'core'.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ad_core is
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
    i_clk                     : in std_logic;
    i_reset                   : in std_logic;
    
    -- outputs to LCD
    o_db4_7                   : out std_logic_vector(3 downto 0);
    o_register_select         : out std_logic;
    o_read_write              : out std_logic;
    o_read_write_enable       : out std_logic;
    
    -- GCSR
    i_ap_start                : in std_logic;
    o_ap_done                 : out std_logic;
    o_ap_idle                 : out std_logic;
    
    -- SCSR0
    o_lcd_initialized         : out std_logic;
    o_lcd_state               : out std_logic_vector(7 downto 0);
    o_lcd_error_flag          : out std_logic;
    
    -- CCR
    o_ddram_pos_last_written  : out std_logic_vector(7 downto 0);
    i_write_char              : in std_logic;
    
    -- CDR
    i_symbol_to_write         : in std_logic_vector(7 downto 0);
    
    -- DCR
    i_clear_display           : in std_logic;
    i_return_home             : in std_logic;
    i_cursor_on               : in std_logic;
    i_cursor_blink            : in std_logic;
    i_cursor_apply            : in std_logic
  );
end ad_core;

architecture Behavioral of ad_core is
  component lcd_controller is
    generic (
      G_T_POWER_ON : integer := 3000000;
      G_T_SU       : integer := 6;
      G_T_W        : integer := 45;
      G_T_H        : integer := 3;
      G_T_16_4MS   : integer := 164000;
      G_T_40_US    : integer := 4000;
      G_T_LOWER_UPPER_WAIT : integer := 150
      );
    Port (
      i_clk                     : in std_logic;
      i_reset                   : in std_logic;
      
      -- outputs to LCD
      o_db4_7                   : out std_logic_vector(3 downto 0);
      o_register_select         : out std_logic;
      o_read_write              : out std_logic;
      o_read_write_enable       : out std_logic;
      
      -- GCSR
      i_ap_start                : in std_logic;
      o_ap_done                 : out std_logic;
      o_ap_idle                 : out std_logic;
      
      -- SCSR0
      o_lcd_initialized         : out std_logic;
      o_lcd_state               : out std_logic_vector(7 downto 0);
      o_lcd_error_flag          : out std_logic;
      
      -- CCR
      o_ddram_pos_last_written  : out std_logic_vector(7 downto 0);
      i_write_char              : in std_logic;
      
      -- CDR
      i_symbol_to_write         : in std_logic_vector(7 downto 0);
      
      -- DCR
      i_clear_display           : in std_logic;
      i_return_home             : in std_logic;
      i_cursor_on               : in std_logic;
      i_cursor_blink            : in std_logic;
      i_cursor_apply            : in std_logic
    );
  end component;

begin
  lcd_controller_inst : lcd_controller
  generic map (
    G_T_POWER_ON => G_AD_T_POWER_ON,
    G_T_SU => G_AD_T_SU,
    G_T_W => G_AD_T_W,
    G_T_H => G_AD_T_H,
    G_T_16_4MS => G_AD_T_16_4MS,
    G_T_40_US => G_AD_T_40_US,
    G_T_LOWER_UPPER_WAIT => G_AD_T_LOWER_UPPER_WAIT
  )
  port map (
      i_clk                        => i_clk,
      i_reset                      => i_reset,
      
      -- outputs to LCD
      o_db4_7                      => o_db4_7,
      o_register_select            => o_register_select,
      o_read_write                 => o_read_write,
      o_read_write_enable          => o_read_write_enable,
      
      -- GCSR
      i_ap_start                   => i_ap_start,
      o_ap_done                    => o_ap_done,
      o_ap_idle                    => o_ap_idle,
      
      -- SCSR0
      o_lcd_initialized            => o_lcd_initialized,
      o_lcd_state                  => o_lcd_state,
      o_lcd_error_flag             => o_lcd_error_flag,
      
      -- CCR
      o_ddram_pos_last_written     => o_ddram_pos_last_written,
      i_write_char                 => i_write_char,
      
      -- CDR
      i_symbol_to_write            => i_symbol_to_write,
      
      -- DCR
      i_clear_display              => i_clear_display,
      i_return_home                => i_return_home,
      i_cursor_on                  => i_cursor_on,
      i_cursor_blink               => i_cursor_blink,
      i_cursor_apply               => i_cursor_apply
);

end Behavioral;