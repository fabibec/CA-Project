----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/30/2025 
-- Design Name: 
-- Module Name: ad_core - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: AXI wrapper for LCD Controller
-- 
-- Dependencies: lcd_controller, timing_controller
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ad_core is
  Port (
    i_clk                        : in std_logic;
    i_reset                      : in std_logic;
    
    -- register input
    i_ap_start                   : in std_logic;                         -- GCSR   - ap_start            (0)
    i_symbol_to_write            : in std_logic_vector(7 downto 0);      -- CDR    - symbol_to_write     (7:0)
    i_write_char                 : in std_logic;                         -- CCR    - write_char          (24)
    
    -- outputs to LCD
    o_db4_7                      : out std_logic_vector(3 downto 0);
    o_register_select            : out std_logic;
    o_read_write                 : out std_logic;
    o_read_write_enable          : out std_logic;
    
    -- register output
    o_ap_done                    : out std_logic;                        -- GCSR   - ap_done             (1)
    o_ddram_pos_last_written     : out std_logic_vector(7 downto 0);     -- CCR    - ddram_pos_last_written      (7:0)
    o_lcd_initialized            : out std_logic;                        -- SCSR0  - lcd_initialized     (0)
    o_lcd_busy                   : out std_logic                         -- SCSR0  - lcd_busy            (1)
  );
end ad_core;

architecture Behavioral of ad_core is

  -- Component declaration for lcd_controller
  component lcd_controller is
    Port (
      i_clk                        : in std_logic;
      i_reset                      : in std_logic;
      
      -- register input
      i_ap_start                   : in std_logic;                         -- GCSR   - ap_start            (0)
      i_symbol_to_write            : in std_logic_vector(7 downto 0);      -- CDR    - symbol_to_write     (7:0)
      i_write_char                 : in std_logic;                         -- CCR    - write_char          (24)
      
      -- outputs to LCD
      o_db4_7                      : out std_logic_vector(3 downto 0);
      o_register_select            : out std_logic;
      o_read_write                 : out std_logic;
      o_read_write_enable          : out std_logic;
      
      -- register output
      o_ap_done                    : out std_logic;                        -- GCSR   - ap_done             (1)
      o_ddram_pos_last_written     : out std_logic_vector(7 downto 0);     -- CCR    - ddram_pos_last_written      (7:0)
      o_lcd_initialized            : out std_logic;                        -- SCSR0  - lcd_initialized     (0)
      o_lcd_busy                   : out std_logic                         -- SCSR0  - lcd_busy            (1)
    );
  end component;

begin

  -- Instantiate the LCD controller
  lcd_controller_inst : lcd_controller
    port map (
      i_clk                        => i_clk,
      i_reset                      => i_reset,
      
      -- register input
      i_ap_start                   => i_ap_start,
      i_symbol_to_write            => i_symbol_to_write,
      i_write_char                 => i_write_char,
      
      -- outputs to LCD
      o_db4_7                      => o_db4_7,
      o_register_select            => o_register_select,
      o_read_write                 => o_read_write,
      o_read_write_enable          => o_read_write_enable,
      
      -- register output
      o_ap_done                    => o_ap_done,
      o_ddram_pos_last_written     => o_ddram_pos_last_written,
      o_lcd_initialized            => o_lcd_initialized,
      o_lcd_busy                   => o_lcd_busy
    );

end Behavioral;