----------------------------------------------------------------------------------
-- Engineer: Jendrik Jürgens (3361128), Michael Specht (3362589)
-- Further Information: 16_4MS should be 1_64MS (early design error).
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity lcd_controller is
  generic (
    G_T_POWER_ON : integer := 3000000; -- 30 ms
    G_T_SU       : integer := 6;        -- t_SU = 60 ns
    G_T_W        : integer := 45;       -- t_W = 450 ns
    G_T_H        : integer := 3;        -- t_H = 30 ns from E Rise/Fall Time
    G_T_16_4MS   : integer := 164000;   -- 1.64 ms
    G_T_40_US    : integer := 4000;     -- 40 us
    G_T_LOWER_UPPER_WAIT : integer := 150 -- t_Cycle - t_H - t_SU
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
    i_ap_start                : in std_logic;                           -- (0)
    o_ap_done                 : out std_logic;                          -- (1)
    o_ap_idle                 : out std_logic;                          -- (2)
    -- i_auto_restart            : in std_logic;                           -- (7) optional
    
    -- SCSR0
    o_lcd_initialized         : out std_logic;                          -- (0)
    o_lcd_state               : out std_logic_vector(7 downto 0);       -- (8:1)
    o_lcd_error_flag          : out std_logic;                          -- (9)
    
    -- CCR
    o_ddram_pos_last_written  : out std_logic_vector(7 downto 0);       -- (7:0)
    -- i_ddram_pos_to_read       : in std_logic_vector(7 downto 0);        -- (15:8) optional
    i_write_char              : in std_logic;                           -- (16)
    -- i_read_char               : in std_logic;                           -- (17) optional
    
    -- CDR
    i_symbol_to_write         : in std_logic_vector(7 downto 0);        -- (7:0)
    -- o_symbol_read             : out std_logic_vector(7 downto 0);       -- (15:8) optional
    
    -- DCR
    i_clear_display           : in std_logic;                           -- (0)
    i_return_home             : in std_logic;                           -- (1)
    i_cursor_on               : in std_logic;                           -- (2)
    i_cursor_blink            : in std_logic;                           -- (3)
    i_cursor_apply            : in std_logic                            -- (4)
    -- i_display_line            : in std_logic;                     -- (5) optional
  );
end lcd_controller;

architecture Behavioral of lcd_controller is
  component timing_controller is
    Port (
      i_clk         : in  std_logic;
      i_reset       : in  std_logic;
      i_start       : in  std_logic;
      i_delay_time  : in  std_logic_vector(21 downto 0);
      o_done        : out std_logic
    );
  end component;
      
  -- lcd commands
  constant CMD_INIT_CLEAR_DISPLAY : std_logic_vector(7 downto 0) := "00000001"; -- 0x01
  constant CMD_INIT_ENTRY_MODE    : std_logic_vector(7 downto 0) := "00000110"; -- Increment mode 0x06
  constant CMD_INIT_FUNCTION_SET  : std_logic_vector(7 downto 0) := "00101000"; -- 4-bit, 2-line, 5x8 font 0x28
  constant CMD_INIT_DISPLAY_CTRL  : std_logic_vector(7 downto 0) := "00001111"; -- Display ON, Cursor ON 0x0F
  constant CMD_CLEAR_DISPLAY      : std_logic_vector(7 downto 0) := "00000001"; -- 0x01
  constant CMD_RETURN_HOME        : std_logic_vector(7 downto 0) := "00000010"; -- 0x02
  
  -- lcd display boundaries
  constant LCD_TOP_LEFT: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(0, 8)); --x"00";
  constant LCD_TOP_RIGHT: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(15, 8)); --x"0F"
  constant LCD_TOP_RIGHT_HIDDEN: std_logic_vector(7 downto 0)  := std_logic_vector(to_unsigned(39, 8)); --x"27";
  constant LCD_BOTTOM_LEFT: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(64, 8)); --x"40";
  constant LCD_BOTTOM_RIGHT: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(79, 8)); --x"4F";
  constant LCD_BOTTOM_RIGHT_HIDDEN: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(103, 8)); --x"67";
  
  -- lcd character boundaries
  constant CHAR_MIN: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(32, 8)); --x"20";
  constant CHAR_MAX: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(127, 8)); --x"7F"
  
  -- states
  constant STATE_POWERUP              : std_logic_vector(7 downto 0) := "00000000"; -- 0x00
  constant STATE_INIT                 : std_logic_vector(7 downto 0) := "00000001"; -- 0x01
  constant STATE_READY                : std_logic_vector(7 downto 0) := "00000010"; -- 0x02
  constant STATE_WRITE                : std_logic_vector(7 downto 0) := "00000100"; -- 0x04
  constant STATE_READ                 : std_logic_vector(7 downto 0) := "00001000"; -- 0x08
  constant STATE_CLEAR_DISPLAY        : std_logic_vector(7 downto 0) := "00010000"; -- 0x10
  constant STATE_RETURN_HOME          : std_logic_vector(7 downto 0) := "00010100"; -- 0x14
  constant STATE_DISPLAY_CONTROL      : std_logic_vector(7 downto 0) := "00011000"; -- 0x18
  constant STATE_DISPLAY_LINE_SWITCH  : std_logic_vector(7 downto 0) := "00011100"; -- 0x1C

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
    DISABLE_ENABLE,
    DISABLE_ENABLE_DELAY,
    EXEC_DELAY,
    CHECK_CURSOR_POS,
    WRITE_CURSOR_POS,
    WRITE,
    CLEAR_DISPLAY,
    RETURN_HOME,
    DISPLAY_CONTROL
  );

  -- fsm
  signal state, nstate   : state_type := INIT_WAIT_30MS;
  
  -- lcd
  signal s_register_select, ns_register_select : std_logic := '1';
  signal s_read_write : std_logic := '1';
  signal s_data, ns_data: std_logic_vector(7 downto 0) := (others => '1');
  signal s_read_write_enable, ns_read_write_enable : std_logic := '1';
  
  -- GCSR
  signal s_ap_done : std_logic := '0';
  signal s_ap_idle : std_logic := '0';
  
  -- SCSR0
  signal s_lcd_initialized, ns_lcd_initialized : std_logic := '0';
  signal s_lcd_state, ns_lcd_state : std_logic_vector(7 downto 0) := STATE_POWERUP;
  signal s_lcd_error_flag  : std_logic := '0';
  
  -- CCR
  signal s_ddram_pos_last_written, ns_ddram_pos_last_written : std_logic_vector(7 downto 0) := (others => '1');
  
  -- CDR
  signal s_symbol_to_write, ns_symbol_to_write : std_logic_vector(7 downto 0) := (others => '1');
  
  -- DCR
  signal s_cursor_blink, ns_cursor_blink : std_logic := '1';
  signal s_cursor_on, ns_cursor_on : std_logic := '1';
  
  -- timing_controller
  signal s_timer_start, s_timer_done : std_logic := '0';
  signal s_timer_delay_time : std_logic_vector(21 downto 0) := (others => '0');

  -- internal
  signal s_next_ddram_pos, ns_next_ddram_pos : std_logic_vector(7 downto 0) := (others => '0');
  signal s_upper_nibble, s_lower_nibble, ns_upper_nibble, ns_lower_nibble : std_logic_vector(3 downto 0) := (others => '0');
  signal s_send_lower, ns_send_lower : std_logic := '0';
  signal s_function_set_twice, ns_function_set_twice : std_logic := '0';
  signal s_writing_data, ns_writing_data: std_logic := '0';
  signal s_executing_command, ns_executing_command : std_logic := '0';
  
begin
  timing_controller_inst : timing_controller
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
        s_send_lower<= '0';
        s_function_set_twice <= '0';
        s_next_ddram_pos <= LCD_TOP_LEFT;
        s_writing_data <= '0';
        s_ddram_pos_last_written <= x"FF";
        s_data <= x"00";
        s_upper_nibble <= x"0";
        s_lower_nibble <= x"0";
        s_read_write_enable <= '1';
        s_register_select <= '1';
        s_symbol_to_write <= x"FF";
        s_lcd_state <= STATE_POWERUP;        
        s_executing_command <= '0';
        s_lcd_initialized <= '0';
        s_cursor_on <= '1';
        s_cursor_blink <= '1';
      else
        state<=nstate;
        s_send_lower<= ns_send_lower;
        s_function_set_twice <= ns_function_set_twice;
        s_next_ddram_pos <= ns_next_ddram_pos;
        s_writing_data <= ns_writing_data;
        s_ddram_pos_last_written <= ns_ddram_pos_last_written;
        s_data <= ns_data;
        s_upper_nibble <= ns_upper_nibble;
        s_lower_nibble <= ns_lower_nibble;
        s_read_write_enable <= ns_read_write_enable;
        s_register_select <= ns_register_select;
        s_symbol_to_write <= ns_symbol_to_write;
        s_lcd_state <= ns_lcd_state;        
        s_executing_command <= ns_executing_command;
        s_lcd_initialized <= ns_lcd_initialized;
        s_cursor_on <= ns_cursor_on;
        s_cursor_blink <= ns_cursor_blink;
      end if;
    end if;
  end process;
  
  state_fsm: process(state, i_write_char, s_timer_done, s_data, s_send_lower, i_symbol_to_write, s_next_ddram_pos, i_ap_start, s_function_set_twice, s_writing_data, s_ddram_pos_last_written, s_upper_nibble, s_lower_nibble, s_register_select, s_read_write_enable, s_symbol_to_write, s_lcd_state, i_cursor_on, i_cursor_blink, i_clear_display, i_return_home, s_executing_command, s_lcd_initialized, s_ap_idle, s_lcd_error_flag, s_ddram_pos_last_written, i_cursor_apply, s_cursor_on, s_cursor_blink)
  begin
    nstate <= state;
    ns_send_lower <= s_send_lower;
    ns_function_set_twice <= s_function_set_twice;
    ns_next_ddram_pos <= s_next_ddram_pos;
    ns_writing_data <= s_writing_data;
    ns_ddram_pos_last_written <= s_ddram_pos_last_written;
    ns_data <= s_data;
    ns_upper_nibble <= s_upper_nibble;
    ns_lower_nibble <= s_lower_nibble;
    ns_read_write_enable <= s_read_write_enable;
    ns_register_select <= s_register_select;
    ns_symbol_to_write <= s_symbol_to_write;
    ns_lcd_state <= s_lcd_state;
    ns_executing_command <= s_executing_command;
    ns_lcd_initialized <= s_lcd_initialized;
    ns_cursor_on <= s_cursor_on;
    ns_cursor_blink <= s_cursor_blink;

    s_read_write <= '0';
    s_ap_done <= '0';
    s_timer_start <= '0';
    s_timer_delay_time <= (others => '0');
    s_ap_idle <= '0';
    s_lcd_error_flag <= '0';

    case state is
      when INIT_WAIT_30MS =>
        ns_read_write_enable <= '0';
        ns_register_select <= '0';
        s_timer_delay_time <= std_logic_vector(to_unsigned(G_T_POWER_ON, 22));
        s_timer_start <= '1';
        nstate <= INIT_WAIT_30MS_DELAY;

      when INIT_WAIT_30MS_DELAY =>
        if s_timer_done = '1' then
          nstate <= INIT_FUNC_SET;
          ns_lcd_state <= STATE_INIT;
        end if;

      when INIT_FUNC_SET =>
        ns_data <= CMD_INIT_FUNCTION_SET;
        nstate <= SETUP_CONTROL;

      when INIT_DISP_CTRL =>
        ns_data <= CMD_INIT_DISPLAY_CTRL;
        nstate <= SETUP_CONTROL;

      when INIT_ENTRY_MODE =>
        ns_data <= CMD_INIT_ENTRY_MODE;
        nstate <= SETUP_CONTROL;

      when INIT_CLEAR =>
        ns_data <= CMD_INIT_CLEAR_DISPLAY;
        nstate <= SETUP_CONTROL;

      when INIT_FINISHED =>
        ns_lcd_initialized <= '1';
        nstate <= READY;
        
      when READY =>
        ns_lcd_state <= STATE_READY;
        if i_ap_start = '1' then
          if i_clear_display = '1' and s_executing_command = '0' then
            ns_executing_command <= '1';
            nstate <= CLEAR_DISPLAY;
          elsif i_return_home = '1' and s_executing_command = '0' then
            ns_executing_command <= '1';
            nstate <= RETURN_HOME;
          elsif i_cursor_apply = '1' and s_executing_command = '0' then
            ns_cursor_on <= i_cursor_on;
            ns_cursor_blink <= i_cursor_blink;
            ns_executing_command <= '1';
            nstate <= DISPLAY_CONTROL;
          elsif i_write_char = '1' then
            ns_symbol_to_write <= i_symbol_to_write;
            nstate <= WRITE;
          end if;
          s_ap_idle <= '1';
        else
          s_ap_idle <= '1';
        end if;

      when CLEAR_DISPLAY =>
        ns_lcd_state <= STATE_CLEAR_DISPLAY;
        ns_data <= CMD_CLEAR_DISPLAY;
        ns_register_select <= '0';
        ns_send_lower <= '0';
        ns_next_ddram_pos <= LCD_TOP_LEFT;
        ns_ddram_pos_last_written <= x"FF";
        nstate <= SETUP_CONTROL;
        
      when RETURN_HOME =>
        ns_lcd_state <= STATE_RETURN_HOME;
        ns_data <= CMD_RETURN_HOME;
        ns_register_select <= '0';
        ns_send_lower <= '0';
        ns_next_ddram_pos <= LCD_TOP_LEFT;
        nstate <= SETUP_CONTROL;
        
      when DISPLAY_CONTROL =>
        ns_lcd_state <= STATE_DISPLAY_CONTROL;
        -- Build display control command: 0x08 + D(display on) + C(cursor) + B(blink)
        ns_data <= (CMD_INIT_DISPLAY_CTRL and "00001000") or "00000100" or ("000000" & s_cursor_on & s_cursor_blink);
        ns_register_select <= '0';
        ns_send_lower <= '0';
        nstate <= SETUP_CONTROL;
        
      when CHECK_CURSOR_POS =>
        ns_lcd_state <= STATE_WRITE;
        ns_send_lower <= '0';
        ns_ddram_pos_last_written <= s_next_ddram_pos;

        if s_next_ddram_pos = LCD_TOP_RIGHT then
          ns_next_ddram_pos <= LCD_BOTTOM_LEFT;
          ns_executing_command <= '1';
          nstate <= WRITE_CURSOR_POS;
        elsif s_next_ddram_pos = LCD_BOTTOM_RIGHT then
          ns_next_ddram_pos <= LCD_TOP_LEFT;
          ns_executing_command <= '1';
          nstate <= WRITE_CURSOR_POS;
        elsif s_next_ddram_pos >= LCD_TOP_LEFT and s_next_ddram_pos < LCD_TOP_RIGHT then
          ns_next_ddram_pos <= std_logic_vector(unsigned(s_next_ddram_pos) + 1);
          s_ap_done <= '1';
          nstate <= READY;
        elsif s_next_ddram_pos >= LCD_BOTTOM_LEFT and s_next_ddram_pos < LCD_BOTTOM_RIGHT then
          ns_next_ddram_pos <= std_logic_vector(unsigned(s_next_ddram_pos) + 1);
          s_ap_done <= '1';
          nstate <= READY;
        end if;
        
      when WRITE_CURSOR_POS =>
        ns_data <= (s_next_ddram_pos or x"80"); -- left bit must be 1
        nstate <= SETUP_CONTROL;
        
      when WRITE =>
        if (s_symbol_to_write >= CHAR_MIN and s_symbol_to_write <= CHAR_MAX) then
          ns_lcd_state <= STATE_WRITE;
          ns_data <= s_symbol_to_write;
          ns_register_select <= '1';
          ns_send_lower <= '0';
          ns_writing_data <= '1';
          nstate <= SETUP_CONTROL;
        else
          s_lcd_error_flag <= '1';
          s_ap_done <= '1';
          nstate <= READY;
        end if;
        
      when SETUP_CONTROL_DELAY =>
        if s_timer_done = '1' then
          nstate <= SETUP_CONTROL;
        end if;

      when SETUP_CONTROL =>
        ns_upper_nibble <= s_data(7 downto 4);
        ns_lower_nibble <= s_data(3 downto 0);
        s_timer_delay_time <= std_logic_vector(to_unsigned(G_T_SU, 22));
        s_timer_start <= '1';
        nstate <= WAIT_SETUP_DELAY;
      
      when WAIT_SETUP_DELAY =>
        if s_timer_done = '1' then
          nstate <= WAIT_SETUP;
        end if;

      when WAIT_SETUP =>
        ns_read_write_enable <= '1';
        s_timer_delay_time <= std_logic_vector(to_unsigned(G_T_W, 22));
        s_timer_start <= '1';
        nstate <= PULSE_ENABLE_DELAY;

      when PULSE_ENABLE_DELAY =>
        if s_timer_done = '1' then
          nstate <= PULSE_ENABLE;
        end if;

      when PULSE_ENABLE =>
        ns_read_write_enable <= '0';
        s_timer_delay_time <= std_logic_vector(to_unsigned(G_T_H, 22));
        s_timer_start <= '1';
        nstate <= DISABLE_ENABLE_DELAY;

      when DISABLE_ENABLE_DELAY =>
        if s_timer_done = '1' then
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
          s_timer_delay_time <= std_logic_vector(to_unsigned(G_T_LOWER_UPPER_WAIT, 22));
          s_timer_start <= '1';
          nstate <= SETUP_CONTROL_DELAY;
        else
          ns_send_lower <= '0';
          
          -- Determine delay
          if s_data = CMD_INIT_CLEAR_DISPLAY or s_data = CMD_CLEAR_DISPLAY or s_data = CMD_RETURN_HOME then
            s_timer_delay_time <= std_logic_vector(to_unsigned(G_T_16_4MS, 22));
          else
            s_timer_delay_time <= std_logic_vector(to_unsigned(G_T_40_US, 22));
          end if;
          
          s_timer_start <= '1';
          nstate <= EXEC_DELAY;
        end if;

      when EXEC_DELAY =>
        if s_timer_done = '1' then
        
          if s_data = CMD_INIT_FUNCTION_SET and s_lcd_initialized = '0' then
            nstate <= INIT_DISP_CTRL; 
          elsif s_data = CMD_INIT_DISPLAY_CTRL and s_lcd_initialized = '0' then
            nstate <= INIT_ENTRY_MODE;
          elsif s_data = CMD_INIT_ENTRY_MODE and s_lcd_initialized = '0' then
            nstate <= INIT_CLEAR;
          elsif s_data = CMD_INIT_CLEAR_DISPLAY and s_lcd_initialized = '0' then
            nstate <= INIT_FINISHED;
          else
            if s_writing_data = '1' then
              ns_writing_data <= '0';
              nstate <= CHECK_CURSOR_POS;
            elsif s_executing_command = '1' then
              s_ap_done <= '1';
              ns_executing_command <= '0';
              nstate <= READY;
            else
              nstate <= READY;
            end if;
            ns_register_select <= '0';
          end if;
        end if;

      when others =>
        nstate <= READY;
    end case;
  end process;

  -- lcd
  o_db4_7                  <= s_upper_nibble when s_send_lower = '0' else s_lower_nibble;
  o_register_select        <= s_register_select;
  o_read_write             <= s_read_write;
  o_read_write_enable      <= s_read_write_enable;
  
  -- GCSR
  o_ap_idle                <= s_ap_idle;
  o_ap_done                <= s_ap_done;
  
  -- SCSR0
  o_lcd_initialized        <= s_lcd_initialized;
  o_lcd_error_flag         <= s_lcd_error_flag;
  o_lcd_state              <= s_lcd_state;
  
  -- CCR
  o_ddram_pos_last_written <= s_ddram_pos_last_written;
end Behavioral;
