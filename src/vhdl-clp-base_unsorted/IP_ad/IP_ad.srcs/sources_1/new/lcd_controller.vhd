----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2025 07:32:38 AM
-- Design Name: 
-- Module Name: lcd_controller - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lcd_controller is
  Port (
    i_clk                        : in std_logic;
    i_reset                      : in std_logic;
    
    -- register input
    i_ap_start                : in std_logic;                         -- GCSR   - ap_start            (0)
    -- i_ri_lcd_reset               : in std_logic;                         -- SCSR0  - lcd_reset           (2)
    i_symbol_to_write         : in std_logic_vector(7 downto 0);      -- CDR    - symbol_to_write     (7:0)
    -- i_ri_ddram_pos_to_read       : in std_logic_vector(7 downto 0);      -- CCR    - ddram_pos_to_read   (15:8)
    i_write_char              : in std_logic;                         -- CCR    - write_char          (24)
    -- i_ri_read_char               : in std_logic;                         -- CCR    - read_char           (25)
    -- i_ri_clear_display           : in std_logic;                         -- DCR    - clear_display       (0)
    -- i_ri_return_home             : in std_logic;                         -- DCR    - return_home         (1)
    -- i_ri_cursor_on               : in std_logic;                         -- DCR    - cursor_on           (2)
    -- i_ri_cursor_blink            : in std_logic;                         -- DCR    - cursor_blink        (3)
    -- i_ri_display_shift           : in std_logic;                         -- DCR    - display_shift       (4)
    -- i_ri_shift_direction         : in std_logic;                         -- DCR    - shift_direction     (5)
    -- i_ri_display_line            : in std_logic;                         -- DCR    - display_line        (6)
    -- i_ri_write_format            : in std_logic;                         -- DCR    - write_format        (7)
    
    -- outputs to LCD
    o_db4_7                      : out std_logic_vector(3 downto 0);
    o_register_select            : out std_logic;
    o_read_write                 : out std_logic;
    o_read_write_enable          : out std_logic;
    
    -- register output
    o_ap_done                 : out std_logic;                          -- GCSR   - ap_done             (1)
    -- o_ro_ap_idle                 : out std_logic;                          -- GCSR   - ap_idle             (2)
    o_ddram_pos_last_written  : out std_logic_vector(7 downto 0);      -- CCR    - ddram_pos_last_written      (7:0)
    -- o_ro_symbol_read             : out std_logic_vector(7 downto 0);      -- CDR    - symbol_read         (15:8)
    o_lcd_initialized         : out std_logic;                         -- SCSR0  - lcd_initialized     (0)
    o_lcd_busy                : out std_logic                         -- SCSR0  - lcd_busy            (1)
    -- o_ro_lcd_state               : out std_logic_vector(7 downto 0);      -- SCSR0  - lcd_state           (10:3)
    -- o_ro_display_busy            : out std_logic;                         -- SCSR0  - display_busy        (11)
    -- o_ro_lcd_error_flag          : out std_logic;                         -- SCSR0  - lcd_error_flag      (12)
    -- o_ro_lcd_error_code          : out std_logic                          -- SCSR0  - lcd_error_code      (20:13)
  
  );
end lcd_controller;

architecture Behavioral of lcd_controller is

  -- import timing_controller
  component timing_controller is
    Port (
      i_clk         : in  std_logic;
      i_reset       : in  std_logic;
      i_start       : in  std_logic;
      i_delay_time  : in  std_logic_vector(21 downto 0); -- needs to be calculated into clock based time
      o_done        : out std_logic
    );
  end component;

  -- type enum
  type state_type is (
    IDLE,
    INIT_WAIT_30MS,
    INIT_WAIT_30MS_DELAY,
    INIT_FUNC_SET,
    INIT_DISP_CTRL,
    INIT_ENTRY_MODE,
    INIT_CLEAR,
    INIT_FINISHED,
    READY,
    SETUP_CONTROL,
    SETUP_CONTROL_DELAY,
    WAIT_SETUP,
    WAIT_SETUP_DELAY,
    PULSE_ENABLE,
    PULSE_ENABLE_DELAY,
    WAIT_PULSE,
    DISABLE_ENABLE,
    DISABLE_ENABLE_DELAY,
    WAIT_HOLD,
    EXEC_DELAY
  );

  -- signals fsm
  signal state, nstate   : state_type := INIT_WAIT_30MS;
  
  -- signals lcd
  signal s_register_select, ns_register_select : std_logic := '0';
  signal s_read_write : std_logic := '0';
  signal s_data, ns_data: std_logic_vector(7 downto 0) := (others => '0');
  signal s_read_write_enable, ns_read_write_enable : std_logic := '0';
  
  -- signals register output
  signal s_ap_done : std_logic := '0';
  -- signal s_ro_ap_idle : std_logic := '0';
  signal s_ddram_pos_last_written, ns_ddram_pos_last_written : std_logic_vector(7 downto 0) := (others => '1');
  -- signal s_ro_symbol_read : std_logic_vector(7 downto 0) := x"3F";
  signal s_lcd_initialized : std_logic := '0';
  signal s_lcd_busy        : std_logic := '0';
  -- signal s_ro_lcd_state       : std_logic_vector(7 downto 0);
  -- signal s_ro_display_busy    : std_logic := '0';
  -- signal s_ro_lcd_error_flag  : std_logic := '0';
  -- signal s_ro_lcd_error_code  : std_logic := '0';
  
  -- signals timing_controller
  signal s_timer_start, s_timer_done : std_logic := '0';
  signal s_timer_delay_time : std_logic_vector(21 downto 0) := (others => '0');

  -- internal signals
  signal s_next_ddram_pos, ns_next_ddram_pos : std_logic_vector(7 downto 0) := (others => '0');
  signal s_upper_nibble, s_lower_nibble, ns_upper_nibble, ns_lower_nibble : std_logic_vector(3 downto 0) := (others => '0');
  signal s_send_lower, ns_send_lower : std_logic := '0';
  signal s_function_set_twice, ns_function_set_twice : std_logic := '0';
  signal s_ddram_written, ns_ddram_written: std_logic := '0';
  signal s_writing_data, ns_writing_data: std_logic := '0';  -- NEW: Track if we're writing character data
  
  -- 100 MHz → 10 ns / Takt --
  constant T_POWER_ON                 : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(3000000, 22)); -- 30 ms 3000000
  constant T_SU                       : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(6, 22)); -- t_SU = 60 ns 6
  constant T_W                        : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(45, 22)); -- t_W = 450 ns 45
  constant T_H                        : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(3, 22)); -- t_H = 30 ns from E Rise/Fall Time 3
  constant T_16_4MS                   : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(164000, 22)); -- 1.64ms 164000
  constant T_40_US                    : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(4000, 22));   -- 40us 4000
  constant T_LOWER_UPPER_WAIT         : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(150, 22));   -- t_Cycle - t_H - t_SU = 430 43 150
   
  -- Timing Constants -- FOR SIMULATION
--   constant T_POWER_ON                 : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(3, 22));
--   constant T_SU                       : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(1, 22));
--   constant T_W                        : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(7, 22));
--   constant T_H                        : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(2, 22));
--   constant T_16_4MS                   : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(1, 22));
--   constant T_40_US                    : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(4, 22));
--   constant T_LOWER_UPPER_WAIT         : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(10, 22));
   
   
   
  -- LCD Commands (8-bit), werden in 2x 4-bit gesendet
  constant CMD_INIT_CLEAR_DISPLAY : std_logic_vector(7 downto 0) := "00000001"; -- 0x01
  constant CMD_INIT_ENTRY_MODE    : std_logic_vector(7 downto 0) := "00000110"; -- Increment mode 0x06
  constant CMD_INIT_FUNCTION_SET  : std_logic_vector(7 downto 0) := "00101000"; -- 4-bit, 2-line, 5x8 font 0x28
  constant CMD_INIT_DISPLAY_CTRL  : std_logic_vector(7 downto 0) := "00001111"; -- Display ON, Cursor OFF 0x0C
  
  -- LCD boundaries
  constant LCD_TOP_LEFT: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(0, 8)); --x"00";
  constant LCD_TOP_RIGHT: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(15, 8)); --x"0F"
  constant LCD_TOP_RIGHT_HIDDEN: std_logic_vector(7 downto 0)  := std_logic_vector(to_unsigned(39, 8)); --x"27";
  constant LCD_BOTTOM_LEFT: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(64, 8)); --x"40";
  constant LCD_BOTTOM_RIGHT: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(79, 8)); --x"4F";
  constant LCD_BOTTOM_RIGHT_HIDDEN: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(103, 8)); --x"67";
  
begin
  timer_inst : timing_controller
    port map (
      i_clk         => i_clk,
      i_reset       => i_reset,
      i_start       => s_timer_start,
      i_delay_time  => s_timer_delay_time,
      o_done        => s_timer_done
  );

  clock_fsm: process (i_clk) is
  begin
    if(i_clk='1' and i_clk'event) then
      if i_reset ='1' then
        state<=INIT_WAIT_30MS;
      else
        state<=nstate;
        s_send_lower<= ns_send_lower;
        s_function_set_twice <= ns_function_set_twice;
        s_next_ddram_pos <= ns_next_ddram_pos;
        s_ddram_written <= ns_ddram_written;
        s_writing_data <= ns_writing_data;
        s_ddram_pos_last_written <= ns_ddram_pos_last_written;
        s_data <= ns_data;
        s_upper_nibble <= ns_upper_nibble;
        s_lower_nibble <= ns_lower_nibble;
        s_read_write_enable <= ns_read_write_enable;
        s_register_select <= ns_register_select;
      end if;
    end if;
  end process;
  
  state_fsm: process(state, i_write_char, s_timer_done, s_data, s_send_lower, i_symbol_to_write, s_ddram_written, s_next_ddram_pos, i_ap_start, s_function_set_twice, s_writing_data, s_ddram_pos_last_written, s_upper_nibble, s_lower_nibble, s_register_select, s_read_write_enable)
  begin
    nstate <= state;
    ns_send_lower <= s_send_lower;
    ns_function_set_twice <= s_function_set_twice;
    ns_next_ddram_pos <= s_next_ddram_pos;
    ns_ddram_written <= s_ddram_written;
    ns_writing_data <= s_writing_data;
    ns_ddram_pos_last_written <= s_ddram_pos_last_written;
    ns_data <= s_data;
    ns_upper_nibble <= s_upper_nibble;
    ns_lower_nibble <= s_lower_nibble;
    ns_read_write_enable <= s_read_write_enable;
    ns_register_select <= s_register_select;

    s_read_write <= '0';
    s_ap_done <= '0';
    s_lcd_initialized <= '0';
    s_lcd_busy <= '1';
    s_timer_start <= '0';
    s_timer_delay_time <= (others => '0');

    case state is
      when INIT_WAIT_30MS =>
        ns_read_write_enable <= '0';
        ns_register_select <= '0';
        s_timer_delay_time <= T_POWER_ON; -- 30ms
        s_timer_start <= '1';
        nstate <= INIT_WAIT_30MS_DELAY;

      when INIT_WAIT_30MS_DELAY =>
        if s_timer_done = '1' then
          s_timer_start <= '0';
          nstate <= INIT_FUNC_SET;
        end if;

      when INIT_FUNC_SET =>
        ns_data <= CMD_INIT_FUNCTION_SET;  -- Function Set
        nstate <= SETUP_CONTROL;

      when INIT_DISP_CTRL =>
        ns_data <= CMD_INIT_DISPLAY_CTRL;  -- Display ON, cursor OFF
        nstate <= SETUP_CONTROL;

      when INIT_ENTRY_MODE =>
        ns_data <= CMD_INIT_ENTRY_MODE;  -- Entry Mode Set
        nstate <= SETUP_CONTROL;

      when INIT_CLEAR =>
        ns_data <= CMD_INIT_CLEAR_DISPLAY;  -- Clear Display
        nstate <= SETUP_CONTROL;

      when INIT_FINISHED =>
        s_lcd_initialized <= '1';
        nstate <= READY;
        
      when READY =>
        if i_ap_start = '1' then
          if (
            (
              (unsigned(i_symbol_to_write) >= x"20" and unsigned(i_symbol_to_write) <= x"7F") or 
              (i_symbol_to_write = x"FF")
            ) and
            i_write_char = '1' and s_ddram_written = '0'
          ) then
            ns_data <= (s_next_ddram_pos or x"80"); -- left bit must be 1  
            ns_ddram_pos_last_written <= s_next_ddram_pos;
  
            if s_next_ddram_pos = LCD_TOP_RIGHT then
              -- End of top line -> start of bottom line
              ns_next_ddram_pos <= LCD_BOTTOM_LEFT;
            elsif s_next_ddram_pos = LCD_BOTTOM_RIGHT then
              -- End of bottom line -> start of top line
              ns_next_ddram_pos <= LCD_TOP_LEFT;
            elsif s_next_ddram_pos >= LCD_TOP_LEFT and s_next_ddram_pos < LCD_TOP_RIGHT then
              -- Increment within top line
              ns_next_ddram_pos <= std_logic_vector(unsigned(s_next_ddram_pos) + 1);
            elsif s_next_ddram_pos >= LCD_BOTTOM_LEFT and s_next_ddram_pos < LCD_BOTTOM_RIGHT then
              -- Increment within bottom line
              ns_next_ddram_pos <= std_logic_vector(unsigned(s_next_ddram_pos) + 1);
            else
              -- Invalid address, default to start of top line
              ns_next_ddram_pos <= x"00";
            end if;
      
            -- calculate next position
--            if s_next_ddram_pos = x"FF" or s_next_ddram_pos = x"67" then
--              ns_next_ddram_pos <= x"00";
--            elsif s_next_ddram_pos = x"27" then
--              ns_next_ddram_pos <= x"40";
--            else
--              ns_next_ddram_pos <= std_logic_vector(unsigned(s_next_ddram_pos) + 1);
--            end if;
            
            ns_send_lower <= '0';
            ns_ddram_written <= '1';
            ns_writing_data <= '0';    -- We're not writing data yet
            nstate <= SETUP_CONTROL;
          end if;
        else
            s_lcd_busy <= '0'; -- Not busy when not writing
        end if;
        
        if (s_ddram_written = '1') then
          ns_data <= i_symbol_to_write;
          ns_register_select <= '1'; -- Data register
          ns_send_lower <= '0';
          ns_ddram_written <= '0';
          ns_writing_data <= '1';   -- NOW we're writing character data
          nstate <= SETUP_CONTROL;
        else
          s_lcd_busy <= '0';
        end if;
        
      when SETUP_CONTROL_DELAY =>
        if s_timer_done = '1' then
          s_timer_start <= '0';
          nstate <= SETUP_CONTROL;
        end if;

      when SETUP_CONTROL =>
        ns_upper_nibble <= s_data(7 downto 4);
        ns_lower_nibble <= s_data(3 downto 0);
        s_timer_delay_time <= T_SU;
        s_timer_start <= '1';
        nstate <= WAIT_SETUP_DELAY;
      
      when WAIT_SETUP_DELAY =>
        if s_timer_done = '1' then
          s_timer_start <= '0';
          nstate <= WAIT_SETUP;
        end if;

      when WAIT_SETUP =>
        ns_read_write_enable <= '1';
        s_timer_delay_time <= T_W;
        s_timer_start <= '1';
        nstate <= PULSE_ENABLE_DELAY;

      when PULSE_ENABLE_DELAY =>
        if s_timer_done = '1' then
          s_timer_start <= '0';
          nstate <= PULSE_ENABLE;
        end if;

      when PULSE_ENABLE =>
        ns_read_write_enable <= '0';
        s_timer_delay_time <= T_H;
        s_timer_start <= '1';
        nstate <= DISABLE_ENABLE_DELAY;

      when DISABLE_ENABLE_DELAY =>
        if s_timer_done = '1' then
          s_timer_start <= '0';
          nstate <= DISABLE_ENABLE;
        end if;

      when DISABLE_ENABLE =>
        if s_send_lower = '0' then
          if s_function_set_twice = '0' then
            ns_function_set_twice <= '1';
            ns_send_lower <= '0'; -- must be sent twice according to datasheet
          else
            ns_send_lower <= '1';
          end if;
          s_timer_delay_time <= T_LOWER_UPPER_WAIT;
          s_timer_start <= '1';
          nstate <= SETUP_CONTROL_DELAY;
        else
          ns_send_lower <= '0';
          -- Determine delay
          if s_data = CMD_INIT_CLEAR_DISPLAY then
            s_timer_delay_time <= T_16_4MS;
          else
            s_timer_delay_time <= T_40_US;
          end if;
          
          s_timer_start <= '1';
          nstate <= EXEC_DELAY;
        end if;

      when EXEC_DELAY =>
        if s_timer_done = '1' then
        
          if s_data = CMD_INIT_FUNCTION_SET then
            nstate <= INIT_DISP_CTRL; 
          elsif s_data = CMD_INIT_DISPLAY_CTRL then
            nstate <= INIT_ENTRY_MODE;
          elsif s_data = CMD_INIT_ENTRY_MODE then
            nstate <= INIT_CLEAR;
          elsif s_data = CMD_INIT_CLEAR_DISPLAY then
            nstate <= INIT_FINISHED;
          else
            if s_writing_data = '1' then
              s_ap_done <= '1';
              ns_writing_data <= '0';  -- Reset the flag
            end if;
            ns_register_select <= '0';
            nstate <= READY;
          end if;
        end if;

      when others =>
        nstate <= READY;
    end case;
  end process;

  o_db4_7               <= s_upper_nibble when s_send_lower = '0' else s_lower_nibble;
  o_register_select     <= s_register_select;
  o_read_write          <= s_read_write;
  o_read_write_enable   <= s_read_write_enable;
  o_ap_done          <= s_ap_done;
  o_lcd_initialized  <= s_lcd_initialized;
  o_lcd_busy         <= s_lcd_busy;
  o_ddram_pos_last_written <= s_ddram_pos_last_written;
end Behavioral;
