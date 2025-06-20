----------------------------------------------------------------------------------
-- Engineer: Jendrik Jürgens (3361128), Michael Specht (3362589)
-- Further Information: -
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_lcd_controller is
--  Port ( );
end tb_lcd_controller;

architecture TESTBENCH of tb_lcd_controller is


  component lcd_controller is
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
        i_cursor_apply            : in std_logic
        -- i_ri_display_line            : in std_logic;                     -- (5) optional
      );
    end component;
    
  -- State types for exptected signals
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
    DISPLAY_CONTROL,
    DONTCARE
  );
  
  -- SYS_CLK -- 100 MHz Clock
  constant SYS_CLK                  : time := 10 ns;

  -- CLK and Reset signals   
  signal TB_i_clk                        : std_logic;
  signal TB_i_reset                      : std_logic;
  
  
  -- outputs to LCD
  signal TB_o_db4_7                      : std_logic_vector(3 downto 0);
  signal TB_o_register_select            : std_logic;
  signal TB_o_read_write                 : std_logic;
  signal TB_o_read_write_enable          : std_logic;
  
  -- register output
  
  -- GCSR
  signal TB_i_ap_start                : std_logic;                          -- ap_start (0)
  signal TB_o_ap_done                 : std_logic;                          -- ap_done  (1)        
  signal TB_o_ap_idle                 : std_logic;                          -- ap_idle  (2)
  -- signal i_auto_restart            : in std_logic;                       -- ap_auto_restart (7) optional
  
  -- SCSR0
  signal TB_o_lcd_initialized         : std_logic;                          -- (0)
  signal TB_o_lcd_state               : std_logic_vector(7 downto 0);       -- (8:1) 
  signal TB_o_lcd_error_flag          : std_logic;                          -- (9)  
  
  -- CCR
  signal TB_o_ddram_pos_last_written  : std_logic_vector(7 downto 0);       -- (7:0)
  -- signal TB_i_ddram_pos_to_read       : std_logic_vector(7 downto 0);    -- (15:8) optional
  signal TB_i_write_char              : std_logic;                          -- (16)
  -- signal TB_i_read_char               : std_logic;                       -- (17) optional
  
  -- CDR
  signal TB_i_symbol_to_write         : std_logic_vector(7 downto 0);        -- (7:0)
  -- signal TB_o_symbol_read             : std_logic_vector(7 downto 0);       -- (15:8) optional

  -- DCR
  signal TB_i_clear_display           : std_logic;                          -- (0)
  signal TB_i_return_home             : std_logic;                          -- (1)
  signal TB_i_cursor_on               : std_logic;                          -- (2)
  signal TB_i_cursor_blink            : std_logic;                          -- (3)
  signal TB_i_cursor_apply            : std_logic;                          -- (4)
  -- signal TB_i_ri_display_line            : std_logic;                     -- (5) optional

  -- lcd commands
  constant CMD_INIT_CLEAR_DISPLAY : std_logic_vector(7 downto 0) := "00000001"; -- 0x01
  constant CMD_INIT_ENTRY_MODE    : std_logic_vector(7 downto 0) := "00000110"; -- Increment mode 0x06
  constant CMD_INIT_FUNCTION_SET  : std_logic_vector(7 downto 0) := "00101000"; -- 4-bit, 2-line, 5x8 font 0x28
  constant CMD_INIT_DISPLAY_CTRL  : std_logic_vector(7 downto 0) := "00001111"; -- Display ON, Cursor OFF 0x0C
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
  
  -- LCD states for debugging -> Not utilized in this TB, keeping for sake of completion
  constant STATE_POWERUP              : std_logic_vector(7 downto 0) := "00000000"; -- 0x00
  constant STATE_INIT                 : std_logic_vector(7 downto 0) := "00000001"; -- 0x01
  constant STATE_READY                : std_logic_vector(7 downto 0) := "00000010"; -- 0x02
  constant STATE_WRITE                : std_logic_vector(7 downto 0) := "00000100"; -- 0x04
  constant STATE_READ                 : std_logic_vector(7 downto 0) := "00001000"; -- 0x08
  constant STATE_CLEAR_DISPLAY        : std_logic_vector(7 downto 0) := "00010000"; -- 0x10
  constant STATE_RETURN_HOME          : std_logic_vector(7 downto 0) := "00100000"; -- 0x14
  constant STATE_DISPLAY_CONTROL      : std_logic_vector(7 downto 0) := "01000000"; -- 0x18
  constant STATE_DISPLAY_LINE_SWITCH  : std_logic_vector(7 downto 0) := "10000000"; -- 0x1C

  -- Timing Constants
  constant G_TB_T_POWER_ON                 : integer := 300; -- 30 ms 3000000
  constant G_TB_T_SU                       : integer := 6; -- t_SU = 60 ns 6
  constant G_TB_T_W                        : integer := 10; -- t_W = 450 ns 45
  constant G_TB_T_H                        : integer := 3; -- t_H = 30 ns from E Rise/Fall Time 3
  constant G_TB_T_16_4MS                   : integer := 164; -- 1.64ms 164000
  constant G_TB_T_40_US                    : integer := 40;   -- 40us 4000
  constant G_TB_T_LOWER_UPPER_WAIT         : integer := 30;   -- t_Cycle - t_H - t_SU = 430 43 150

  -- Debug Signals
  signal TB_s_cmd_cnt                     :std_logic_vector(3 downto 0) := (others=>'0'); -- For easy debugging and traversal of Wave form

  -- TB Expected Signals
  signal ex_TB_i_symbol_to_write                                             : std_logic_vector(7 downto 0);     
  signal ex_TB_s_timer_delay_time                                            : std_logic_vector(21 downto 0) := (others => '0');
  signal ex_TB_s_timer_start, ex_TB_s_timer_done                             : std_logic := '0';
  signal ex_TB_s_next_ddram_pos,ex_TB_ns_next_ddram_pos                      : std_logic_vector(7 downto 0) := (others => '0');
  signal ex_TB_s_upper_nibble, ex_TB_s_lower_nibble                          : std_logic_vector(3 downto 0) := (others => '0');
  signal ex_TB_s_send_lower, ex_TB_ns_send_lower                             : std_logic := '0';
  signal ex_TB_s_function_set_twice, ex_TB_ns_function_set_twice             : std_logic := '0';
  signal ex_TB_s_ddram_written, ex_TB_ns_ddram_written                       : std_logic := '0';
  signal ex_TB_s_data, ex_TB_ns_data                                         : std_logic_vector(7 downto 0) := (others => '0');
  signal ex_TB_state                                                         : state_type := INIT_WAIT_30MS; -- Current state
  signal ex_TB_nstate                                                        : state_type := INIT_WAIT_30MS_DELAY; -- Next state 
  signal ex_TB_o_db4_7                                                       : std_logic_vector(3 downto 0) := (others => '0');
  signal ex_TB_s_read_write_enable                                           : std_logic;
  signal ex_TB_s_read_write                                                  : std_logic;
  signal ex_TB_s_lcd_initialized                                             : std_logic := '0';
  signal ex_TB_s_ap_done                                                     : std_logic;
  signal ex_TB_s_register_select                                             : std_logic;
  signal ex_TB_ns_ddram_pos_last_written, ex_TB_s_ddram_pos_last_written     : std_logic_vector(7 downto 0) := (others => '0');
  signal ex_TB_ns_writing_data, ex_TB_s_writing_data                         : std_logic := '0';
  signal ex_TB_i_ap_start                                                    : std_logic := '0';
  signal ex_TB_i_write_char                                                  : std_logic := '0';
  signal ex_TB_i_ap_idle                                                     : std_logic := '0';
  signal ex_TB_s_lcd_error_flag                                              : std_logic := '0';
  signal ex_TB_i_cursor_apply                                                : std_logic := '0';
  signal ex_TB_i_clear_display                                               : std_logic := '0';
  signal ex_TB_ns_executing_command, ex_TB_s_executing_command               : std_logic := '0';

begin
  uut: lcd_controller
    generic map (
      G_T_POWER_ON => G_TB_T_POWER_ON,
      G_T_SU => G_TB_T_SU,
      G_T_W => G_TB_T_W,
      G_T_H => G_TB_T_H,
      G_T_16_4MS => G_TB_T_16_4MS,
      G_T_40_US => G_TB_T_40_US,
      G_T_LOWER_UPPER_WAIT => G_TB_T_LOWER_UPPER_WAIT
    )
    port map (
        i_clk                        => TB_i_clk,
        i_reset                      => TB_i_reset,


      -- outputs to LCD
        o_db4_7                      => TB_o_db4_7,
        o_register_select            => TB_o_register_select,
        o_read_write                 => TB_o_read_write,
        o_read_write_enable          => TB_o_read_write_enable,
      
      -- GCSR 
        i_ap_start                 => TB_i_ap_start,                 -- GCSR     (0)
        o_ap_done                  => TB_o_ap_done,                  -- GCSR     (1)
        o_ap_idle                  => TB_o_ap_idle,                  -- GCSR     (2)

      -- SCSR0
        o_lcd_initialized          => TB_o_lcd_initialized,          -- SCSR0    (0)
        o_lcd_state                => TB_o_lcd_state,                -- SCSR0    (8:1)
        o_lcd_error_flag           => TB_o_lcd_error_flag,           -- SCSR0    (9)

      -- CCR
        o_ddram_pos_last_written   => TB_o_ddram_pos_last_written,   -- CCR      (7:0)
        -- i_ddram_pos_to_read       => TB_i_ddram_pos_to_read,      -- CCR      (15:8) optional
        i_write_char               => TB_i_write_char,               -- CCR      (16)
        -- i_read_char                => TB_i_read_char,             -- CCR      (17)   optional

      -- CDR
        i_symbol_to_write          => TB_i_symbol_to_write,          -- CDR      (7:0)
        -- o_symbol_read              => TB_o_symbol_read,           -- CDR      (15:8) optional

      -- DCR
        i_clear_display            => TB_i_clear_display,            -- DCR      (0)
        i_return_home              => TB_i_return_home,              -- DCR      (1)
        i_cursor_on                => TB_i_cursor_on,                -- DCR      (2)
        i_cursor_blink             => TB_i_cursor_blink,             -- DCR      (3)
        i_cursor_apply             => TB_i_cursor_apply              -- DCR      (4)
        -- i_ri_display_line          => TB_i_ri_display_line         -- DCR      (5) optional
    );
    
  process
    begin
        TB_i_clk <= '1';
        wait for SYS_CLK/2;
        TB_i_clk <= '0';
        wait for SYS_CLK/2;
    end process;

  STIM_PROC: process
  variable char_count : integer;
  
  begin
    TB_i_reset <= '1';
    ex_TB_s_timer_start <= '1';
    wait for SYS_CLK;
    TB_i_reset <= '0';
    report "---------------INITIALIZING LCD CONTROLLER---------------" severity note;
    report "current time = " & time'image(now);
    
    report "---------------STATE: INIT_WAIT_30MS---------------" severity note;
    ex_TB_state <= INIT_WAIT_30MS;
    ex_TB_nstate<=INIT_WAIT_30MS_DELAY;
    
    ex_TB_S_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_POWER_ON, 22));
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD) => No values in this step, use default valuse in lcd_controller.vhd?
    ex_TB_o_db4_7 <= x"0";
    ex_TB_s_register_select <= '0';
    ex_TB_s_read_write <= '0';
    ex_TB_s_read_write_enable <= '0';
    ex_TB_s_ap_done <= '0';
    ex_TB_s_ddram_pos_last_written <= x"FF";

  
    
    report "---------------STATE: INIT_WAIT_30MS_DELAY---------------" severity note;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_POWER_ON, 22));
    ex_TB_state <= INIT_WAIT_30MS_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_POWER_ON*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= INIT_FUNC_SET;

    ex_TB_s_upper_nibble <= "0000";
    ex_TB_s_lower_nibble <= "0000";
    
    wait for SYS_CLK;
    
    report "---------------STATE: INIT_FUNC_SET---------------" severity note;
    TB_s_cmd_cnt <= x"1";
    ex_TB_s_timer_done <= '0';
    ex_TB_state <= INIT_FUNC_SET;
    ex_TB_nstate <= SETUP_CONTROL;
    ex_TB_ns_send_lower <= '0';
    WAIT for SYS_CLK;    
    
    report "---------------STATE: SETUP_CONTROL---------------" severity note;
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    ex_TB_s_data <= CMD_INIT_FUNCTION_SET; -- Expecting an instruction
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_start <= '1';
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_SU, 22));
    ex_TB_s_send_lower <= '0';
    wait for SYS_CLK;

    report "---------------STATE: WAIT_SETUP_DELAY---------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_start <= '0';
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD) => No values in this step, use default valuse in lcd_controller.vhd?
    ex_TB_o_db4_7 <= x"2";
    ex_TB_s_upper_nibble <= "0010";
    ex_TB_s_lower_nibble <= "1000";
    wait for G_TB_T_SU*SYS_CLK;
    ex_TB_nstate <= WAIT_SETUP;
    ex_TB_s_timer_done <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP---------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_W, 22));
    ex_TB_s_timer_start <= '1';
    
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY---------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '1';
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_W*SYS_CLK;
    ex_TB_nstate <= PULSE_ENABLE;
    ex_TB_s_timer_done <= '1';
    
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE---------------" severity note;
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_done <= '0';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_H, 22));
    ex_TB_s_timer_start <= '1';
    wait for SYS_CLK;

    report "---------------STATE: DISABLE_ENABLE_DELAY---------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';
    ex_TB_s_read_write_enable <= '0';
    wait for G_TB_T_H*SYS_CLK;
    ex_TB_nstate <= DISABLE_ENABLE;
    ex_TB_s_timer_done <= '1';
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_o_db4_7 <= CMD_INIT_FUNCTION_SET(7 downto 4);
    ex_TB_s_register_select <= '0';
    ex_TB_s_read_write <= '0';
    
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE---------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_nstate <= SETUP_CONTROL_DELAY;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_send_lower <= '0';
    ex_TB_s_function_set_twice <= '0';
    ex_TB_ns_function_set_twice <= '1';
    ex_TB_ns_send_lower <= '0'; -- Function set upper nibbles must be sent twice according to datasheet 
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_LOWER_UPPER_WAIT, 22));
    ex_TB_s_timer_start <= '1';
    wait for SYS_CLK;

    
    report "---------------STATE: SETUP_CONTROL_DELAY---------------" severity note;
    ex_TB_state <= SETUP_CONTROL_DELAY;
    ex_TB_s_function_set_twice <= '1';
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_LOWER_UPPER_WAIT*SYS_CLK;
    ex_TB_nstate <= SETUP_CONTROL;
    ex_TB_s_timer_done <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
 
    ex_TB_s_timer_done <= '0';
    ex_TB_s_upper_nibble <= "0010";
    ex_TB_s_lower_nibble <= "1000";
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_SU, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    wait for SYS_CLK; 
       
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_SU*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_W, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;

    wait for SYS_CLK;
 
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';
    ex_TB_s_read_write_enable <= '1';
    wait for G_TB_T_W*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_s_timer_done <= '0';
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_H, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY; 
    wait for SYS_CLK;
 
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';
    ex_TB_s_read_write_enable <= '0';

    wait for G_TB_T_H*SYS_CLK;
    ex_TB_nstate <= DISABLE_ENABLE;
    ex_TB_s_timer_done <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_send_lower <= '0';
    ex_TB_s_function_set_twice <= '1';
    ex_TB_ns_send_lower <= '1';
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_LOWER_UPPER_WAIT, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= SETUP_CONTROL_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL_DELAY--------------" severity note;
    ex_TB_state <= SETUP_CONTROL_DELAY;
    ex_TB_s_timer_start <= '0';  
    ex_TB_o_db4_7 <= x"8";
    ex_TB_s_send_lower <= '1'; -- Send lower nibble
    wait for G_TB_T_LOWER_UPPER_WAIT*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= SETUP_CONTROL;
    
    
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
    ex_TB_s_timer_done <= '0';
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_s_ap_done <= '0';
    ex_TB_s_upper_nibble <= x"2";
    ex_TB_s_lower_nibble <= x"8";
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_SU, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_SU*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;

    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_W, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';
    
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '1';

    ex_TB_s_timer_start <= '0';

    wait for G_TB_T_W*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_H, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    
    wait for SYS_CLK;
       
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '0';
    ex_TB_s_timer_start <= '0';

    wait for G_TB_T_H*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= DISABLE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_timer_done <= '0';
    ex_TB_ns_send_lower <= '0';
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_40_US, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= EXEC_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: EXEC_DELAY--------------" severity note;
    ex_TB_state <= EXEC_DELAY;
    ex_TB_s_timer_start <= '0';
    ex_TB_o_db4_7 <= x"2"; -- Actually not necessary, but for sake of completion
    ex_TB_s_send_lower <= '0'; -- reset for next command

    wait for G_TB_T_40_US*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_s_data <= CMD_INIT_FUNCTION_SET;
    ex_TB_nstate <= INIT_DISP_CTRL;
    wait for SYS_CLK;
    
    report "************FUNCTION SET DONE************" severity note;

    report "---------------STATE: INIT_DISP_CTRL--------------" severity note;
    TB_s_cmd_cnt <= x"2";
    ex_TB_state <= INIT_DISP_CTRL;
    ex_TB_s_timer_done <= '0';
    ex_TB_ns_send_lower <= '0';
    ex_TB_nstate <= SETUP_CONTROL;
    
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_register_select <= '0';
    wait for SYS_CLK;
        
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
    ex_TB_s_timer_done <= '0';
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_s_ap_done <= '0';
    ex_TB_s_data <= CMD_INIT_DISPLAY_CTRL;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_SU, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_start <= '0';
    ex_TB_s_upper_nibble <= x"0";
    ex_TB_s_lower_nibble <= x"f";
    ex_TB_o_db4_7 <= x"0";
    wait for G_TB_T_SU*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_W, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '1';
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_W*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_H, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';
    
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '0';
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_H*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= DISABLE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_timer_done <= '0';
    ex_TB_ns_send_lower <= '1';
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_LOWER_UPPER_WAIT, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= SETUP_CONTROL_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL_DELAY--------------" severity note;
    ex_TB_state <= SETUP_CONTROL_DELAY;
    ex_TB_s_send_lower <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_o_db4_7 <= x"f";
    wait for G_TB_T_LOWER_UPPER_WAIT*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= SETUP_CONTROL;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
    ex_TB_s_timer_done <= '0';
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_SU, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_ap_done <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_SU*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_W, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_s_timer_done <= '0';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';
    ex_TB_s_read_write_enable <= '1';

    wait for G_TB_T_W*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_H, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';
    
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '0';
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_H*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= DISABLE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_send_lower <= '1';
    ex_TB_ns_send_lower <= '0';
    ex_TB_s_data <= CMD_INIT_DISPLAY_CTRL;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_40_US, 22));
    ex_TB_nstate <= EXEC_DELAY;
    ex_TB_s_timer_start <= '1';
    ex_TB_s_timer_done <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: EXEC_DELAY--------------" severity note;
    ex_TB_state <= EXEC_DELAY;
    ex_TB_s_timer_start <= '0';
    ex_TB_o_db4_7 <= x"0";
    ex_TB_s_send_lower <= '0'; -- reset for next command

    wait for G_TB_T_40_US*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_s_data <= CMD_INIT_DISPLAY_CTRL;
    ex_TB_nstate <= INIT_ENTRY_MODE;
    wait for SYS_CLK;
    
    
    report "************INIT DISPLAY CTRL DONE************" severity note;    
    
    report "---------------STATE: INIT_ENTRY_MODE--------------" severity note;
    TB_s_cmd_cnt <= x"3";
    ex_TB_s_send_lower <= '0'; 
    ex_TB_state <= INIT_ENTRY_MODE;
    ex_TB_s_timer_done <= '0';
    ex_TB_ns_send_lower <= '0';
    ex_TB_nstate <= SETUP_CONTROL;
    
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_register_select <= '0';
    wait for SYS_CLK;
        
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
    ex_TB_s_timer_done <= '0';
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_s_data <= CMD_INIT_ENTRY_MODE;
    ex_TB_s_ap_done <= '0';
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_SU, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_start <= '0';
    ex_TB_s_lower_nibble <= x"6";
    ex_TB_s_upper_nibble <= x"0";
    wait for G_TB_T_SU*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_W, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '1';
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_W*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_H, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '0';
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_H*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= DISABLE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_timer_done <= '0';
    ex_TB_ns_send_lower <= '1';
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_LOWER_UPPER_WAIT, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= SETUP_CONTROL_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL_DELAY--------------" severity note;
    ex_TB_state <= SETUP_CONTROL_DELAY;
    ex_TB_s_send_lower <= '1';
    ex_TB_o_db4_7 <= x"6";
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_LOWER_UPPER_WAIT*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= SETUP_CONTROL;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_s_upper_nibble <= x"0";
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_SU, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_done <= '0';
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_ap_done <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_lower_nibble <= x"6";
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_SU*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_W, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_s_timer_done <= '0';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '1';
    ex_TB_s_read_write_enable <= '1';
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_W*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_H, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';

    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '0';
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_H*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= DISABLE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_send_lower <= '1';
    ex_TB_ns_send_lower <= '0';
    ex_TB_s_timer_done <= '0';
    ex_TB_s_data <= CMD_INIT_DISPLAY_CTRL;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_40_US, 22));
    ex_TB_nstate <= EXEC_DELAY;
    ex_TB_s_timer_start <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: EXEC_DELAY--------------" severity note;
    ex_TB_state <= EXEC_DELAY;
    ex_TB_o_db4_7 <= x"0";
    ex_TB_s_timer_start <= '0';
    ex_TB_s_send_lower <= '0'; -- reset for next command
    wait for G_TB_T_40_US*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_s_data <= CMD_INIT_ENTRY_MODE;
    ex_TB_nstate <= INIT_CLEAR;
    wait for SYS_CLK;
    
    report "************INIT ENTRY MODE DONE************" severity note;    
    
    
    report "---------------STATE: INIT_CLEAR--------------" severity note;
    TB_s_cmd_cnt <= x"4";
    ex_TB_state <= INIT_CLEAR;
    ex_TB_ns_send_lower <= '0';
    ex_TB_nstate <= SETUP_CONTROL;
    ex_TB_s_timer_done <= '0';
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_register_select <= '0';
    wait for SYS_CLK;
    
    
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
    ex_TB_s_send_lower <= '0';
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_s_data <= CMD_INIT_CLEAR_DISPLAY;
    ex_TB_s_ap_done <= '0';
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_SU, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_start <= '0';
    ex_TB_s_upper_nibble <= x"0";
    ex_TB_s_lower_nibble <= x"1";
    wait for G_TB_T_SU*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_W, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '1';
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_W*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_H, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '0';
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_H*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= DISABLE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_timer_done <= '0';
    ex_TB_ns_send_lower <= '1';
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_LOWER_UPPER_WAIT, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= SETUP_CONTROL_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL_DELAY--------------" severity note;
    ex_TB_state <= SETUP_CONTROL_DELAY;
    ex_TB_s_send_lower <= '1';
    ex_TB_o_db4_7 <= x"1";
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_LOWER_UPPER_WAIT*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= SETUP_CONTROL;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
    ex_TB_state <= SETUP_CONTROL;
    
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_SU, 22));
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_ap_done <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_SU*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_W, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_s_timer_done <= '0';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '1';
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_W*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_H, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '0';
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_H*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= DISABLE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_send_lower <= '1';
    ex_TB_ns_send_lower <= '0';
    ex_TB_s_timer_done <= '0';
    ex_TB_s_data <= CMD_INIT_DISPLAY_CTRL;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_16_4MS, 22));
    ex_TB_nstate <= EXEC_DELAY;
    ex_TB_s_timer_start <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: EXEC_DELAY--------------" severity note;
    ex_TB_state <= EXEC_DELAY;
    ex_TB_o_db4_7 <= x"0";
    ex_TB_s_timer_start <= '0';
    ex_TB_s_send_lower <= '0'; -- reset for next command
    wait for G_TB_T_16_4MS*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= INIT_FINISHED;
    wait for SYS_CLK;    
    
    report "************INIT CLEAR DISPLAY DONE************" severity note;    
    
    report "---------------STATE: INIT_FINISHED--------------" severity note;
    ex_TB_state <= INIT_FINISHED;
    ex_TB_s_timer_done <= '0';
    ex_TB_nstate <= READY;
    wait for SYS_CLK;
    
    report "************DISPLAY INITIALIZITION DONE************" severity note;    
    
    
    report "---------------STATE: READY--------------" severity note;
    ex_TB_state <= READY;
    ex_TB_s_lcd_initialized <= '1';
    ex_TB_i_ap_idle <= '1';
    wait for SYS_CLK; -- Remain one Cycle in READY-State
    
    report "************WRITING CHARACTER TO LCD DISPLAY************" severity note;
    report "************REGULAR WRITING - NO VIOLATION OF LCD LIMITS************" severity note;


    report "---------------STATE: READY--------------" severity note;
    ex_TB_state <= READY;
    TB_s_cmd_cnt <= x"5";
    TB_i_ap_start <= '1';
    TB_i_write_char <= '1';
    ex_TB_i_ap_start <= '1';
    ex_TB_i_write_char <= '1';
    ex_TB_nstate <= WRITE;
    TB_i_symbol_to_write <= x"41"; -- Write 'A' to LCD
    wait for SYS_CLK;
    
    report "---------------STATE: WRITE--------------" severity note;
    ex_TB_state <= WRITE;
    ex_TB_ns_data <= TB_i_symbol_to_write;
    ex_TB_ns_send_lower <= '0';
    ex_TB_ns_writing_data <= '1';
    ex_TB_nstate <= SETUP_CONTROL;
    ex_TB_i_ap_idle <= '0';
    wait for SYS_CLK;


    report "---------------STATE: SETUP_CONTROL--------------" severity note;
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_s_data <= x"41";
    ex_TB_s_send_lower <= '0';
    ex_TB_s_writing_data <= '1';
    ex_TB_s_register_select <= '1';

    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_SU, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_start <= '0';
    ex_TB_s_upper_nibble <= x"4";
    ex_TB_s_lower_nibble <= x"1";
    ex_TB_o_db4_7 <= x"4";
    wait for G_TB_T_SU*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_W, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '1';
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_W*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_H, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '0';
    ex_TB_s_timer_start <= '0';
    
    wait for G_TB_T_H*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= DISABLE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_timer_done <= '0';
    ex_TB_ns_send_lower <= '1';
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_LOWER_UPPER_WAIT, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= SETUP_CONTROL_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL_DELAY--------------" severity note;
    ex_TB_state <= SETUP_CONTROL_DELAY;
    ex_TB_s_send_lower <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_o_db4_7 <= x"1";
    
    wait for G_TB_T_LOWER_UPPER_WAIT*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= SETUP_CONTROL;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
    ex_TB_state <= SETUP_CONTROL;
    
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_SU, 22));
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_start <= '0';
    ex_TB_s_upper_nibble <= x"4";
    ex_TB_s_lower_nibble <= x"1";
    wait for G_TB_T_SU*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_W, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_s_timer_done <= '0';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;

    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '1';
    ex_TB_s_timer_start <= '0';
    wait for G_TB_T_W*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_H, 22));
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';

    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '0';
    ex_TB_s_timer_start <= '0';  
    wait for G_TB_T_H*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= DISABLE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_send_lower <= '1';
    ex_TB_ns_send_lower <= '0';
    ex_TB_s_data <= x"41";
    ex_TB_s_timer_delay_time <= std_logic_vector(to_unsigned(G_TB_T_40_US, 22));
    ex_TB_nstate <= EXEC_DELAY;
    ex_TB_s_timer_start <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: EXEC_DELAY--------------" severity note;
    ex_TB_state <= EXEC_DELAY;
    ex_TB_s_timer_start <= '0';
    ex_TB_s_writing_data <= '1';
    ex_TB_o_db4_7 <= x"4";
    ex_TB_s_send_lower <= '0'; -- reset for next command
    
    wait for G_TB_T_40_US*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_ns_writing_data <= '0'; -- Reset the flag so we do not write data again without updating ddram pos
    ex_TB_s_writing_data <= '1';
    ex_TB_nstate <= CHECK_CURSOR_POS;

    TB_i_ap_start <= '0';
    wait for SYS_CLK;
    

    report "---------------STATE: CHECK_CURSOR_POS--------------" severity note;
    ex_TB_state <= CHECK_CURSOR_POS;
    ex_TB_s_timer_done <= '0';
    ex_TB_ns_next_ddram_pos <= x"01";
    ex_TB_s_next_ddram_pos <= x"00";
    ex_TB_ns_send_lower <= '0';
    ex_TB_s_ap_done <= '1';
    ex_TB_nstate <= READY;  
    ex_TB_s_register_select <= '0';
    ex_TB_s_writing_data <= '0';

    wait for SYS_CLK;
    
    
    report "************TEST CASE FINISHED************" severity note;
    report "************CHARACTER WRITTEN*************" severity note;
    
--  ******************************************************************

    report "************WRITING CHARACTER - CHARACTER VIOLATION************" severity note;


    report "---------------STATE: READY--------------" severity note;
    ex_TB_state <= READY;
    TB_s_cmd_cnt <= x"6";
    ex_TB_s_ddram_pos_last_written <= x"00";
    ex_TB_s_next_ddram_pos <= ex_TB_ns_next_ddram_pos; -- next state logic 
    ex_TB_s_ap_done <= '0';
    TB_i_ap_start <= '1';
    ex_TB_i_ap_start <= '1';
    TB_i_write_char <= '1';
    ex_TB_i_write_char <= '1';
    ex_TB_i_ap_idle <= '1';
    ex_TB_nstate <= WRITE;
    TB_i_symbol_to_write <= x"19"; -- Write invalid character to LCD
    ex_TB_i_symbol_to_write <= x"19"; 
    wait for SYS_CLK;

    report "---------------STATE: WRITE--------------" severity note;
    TB_i_ap_start <= '0';
    ex_TB_i_ap_idle <= '0';
    TB_i_write_char <= '0';
    ex_TB_state <= WRITE;
    ex_TB_s_lcd_error_flag <= '1';
    ex_TB_nstate <= READY;
    wait for SYS_CLK;

    report "---------------STATE: READY--------------" severity note;
    ex_TB_state <= READY;
    ex_TB_i_ap_idle <= '1';
    ex_TB_s_lcd_error_flag <= '0';
    wait for SYS_CLK;

    report "************TEST CASE FINISHED - CHARACTER VIOLATION*************" severity note;

--  ******************************************************************

    report "************ALTER CURSOR SETTING************" severity note;

    report "---------------STATE: READY--------------" severity note;
    ex_TB_state <= READY;
    TB_s_cmd_cnt <= x"7";
    TB_i_ap_start <= '1';
    TB_i_write_char <= '0';
    ex_TB_i_ap_start <= '1';
    ex_TB_i_write_char <= '0';
    ex_TB_i_cursor_apply <= '1';
    TB_i_cursor_blink <= '0';
    TB_i_cursor_on <= '0';
    TB_i_cursor_apply <= '1';
    ex_TB_ns_executing_command <= '1';

    ex_TB_nstate <= DISPLAY_CONTROL;
    wait for SYS_CLK;

    report "---------------STATE: DISPLAY_CONTROL--------------" severity note;
    ex_TB_state <= DISPLAY_CONTROL;
    ex_TB_i_ap_idle <= '0';
    ex_TB_i_cursor_apply <= '0';
    TB_i_cursor_apply <= '0';
    ex_TB_nstate <= SETUP_CONTROL;
    ex_TB_ns_data <= (CMD_INIT_DISPLAY_CTRL and "00001000") or "00000100" or ("000000" & TB_i_cursor_on & TB_i_cursor_blink);
    ex_TB_ns_send_lower <= '0';
    ex_TB_s_executing_command <= '1';
    wait for SYS_CLK;


    ex_TB_s_register_select <= '0';
    ex_TB_s_data <= ex_TB_ns_data;
    -- Undefined State, since processing chain is working, jumping to relevant state - Only valid in Simulation
    -- Don't care values since we already know the processing chain is working => shortcut 
    ex_TB_state <= DONTCARE; 
    ex_TB_nstate <= DONTCARE;
    ex_TB_s_timer_done <= '-';
    ex_TB_s_timer_start <= '-';
    ex_TB_s_lower_nibble <= "----"; 
    ex_TB_s_upper_nibble <= "----"; 


    wait until TB_o_ap_done = '1'; -- is set in EXEC_DELAY
    ex_TB_state <= EXEC_DELAY;
    ex_TB_nstate <= READY;
    ex_TB_s_ap_done <= '1';
    ex_TB_ns_executing_command <= '0';
    wait for SYS_CLK;

    report "---------------STATE: READY--------------" severity note;
    ex_TB_state <= READY;
    ex_TB_s_ap_done <= '0';
    ex_TB_s_executing_command <= '0';
    ex_TB_i_ap_idle <= '1';
    wait for SYS_CLK;
    report "************TEST CASE FINISHED - ALTER CURSOR SETTING*************" severity note;

    --  ******************************************************************
    
    report "************CLEAR DISPLAY COMMAND************" severity note;
    
    report "---------------STATE: READY--------------" severity note;
    ex_TB_state <= READY;
    ex_TB_nstate <= CLEAR_DISPLAY;
    TB_s_cmd_cnt <= x"8";
    TB_i_ap_start <= '1';
    TB_i_write_char <= '0';
    TB_i_clear_display <= '1';
    ex_TB_i_ap_start <= '1';
    ex_TB_i_write_char <= '0';
    ex_TB_ns_executing_command <= '1';
    ex_TB_i_clear_display <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: CLEAR_DISPLAY--------------" severity note;
    ex_TB_state <= CLEAR_DISPLAY;
    ex_TB_nstate <= SETUP_CONTROL;
    ex_TB_ns_data <= CMD_CLEAR_DISPLAY;
    ex_TB_i_clear_display <= '0';
    TB_i_clear_display <= '0';
    ex_TB_ns_send_lower <= '0';
    ex_TB_s_executing_command <= '1';
    ex_TB_i_ap_idle <= '0';
    ex_TB_ns_next_ddram_pos <= LCD_TOP_LEFT;
    wait for SYS_CLK;
    
    ex_TB_s_register_select <= '0';
    ex_TB_s_data <= ex_TB_ns_data;
    -- Undefined State, since processing chain is working, jumping to relevant state - Only valid in Simulation
    -- Don't care values since we already know the processing chain is working => shortcut 
    ex_TB_state <= DONTCARE; 
    ex_TB_nstate <= DONTCARE;
    ex_TB_s_timer_done <= '-';
    ex_TB_s_timer_start <= '-';
    ex_TB_s_lower_nibble <= "----"; 
    ex_TB_s_upper_nibble <= "----"; 
    ex_TB_s_ddram_pos_last_written <= x"ff";
    ex_TB_s_next_ddram_pos <= ex_TB_ns_next_ddram_pos;
    
    wait until TB_o_ap_done = '1'; -- is set in EXEC_DELAY
    ex_TB_state <= EXEC_DELAY;
    ex_TB_nstate <= READY;
    ex_TB_s_ap_done <= '1';
    ex_TB_ns_executing_command <= '0';
    wait for SYS_CLK;
    
    
    report "---------------STATE: READY--------------" severity note;
    ex_TB_state <= READY;
    ex_TB_s_ap_done <= '0';
    ex_TB_s_executing_command <= '0';
    ex_TB_i_ap_idle <= '1';
    wait for SYS_CLK;

    
    report "************WRITING CHARACTERS TO EXCEED DISPLAY UPPER RIGHT BOUNDARY************" severity note;
    TB_s_cmd_cnt <= x"9"; 
    char_count := 0; -- is equal to next ddram position to write
                     -- since we clear the display in the command beforehand this represents the LCD_TOP_LEFT (0x00)
    
    while char_count < to_integer(unsigned(LCD_TOP_RIGHT)) loop
        -- Setup phase
        ex_TB_state <= READY;
        TB_i_ap_start <= '1';
        TB_i_write_char <= '1';
        ex_TB_i_ap_start <= '1';
        ex_TB_i_write_char <= '1';
        ex_TB_i_ap_idle <= '1';
        ex_TB_nstate <= WRITE;
        TB_i_symbol_to_write <= x"41"; -- Write 'A' to LCD
        
        wait for SYS_CLK;
        
        -- Execute phase
        ex_TB_state <= DONTCARE;
        ex_TB_nstate <= DONTCARE;
        TB_i_ap_start <= '0';
        TB_i_write_char <= '0';
        ex_TB_i_ap_idle <= '0';
        ex_TB_i_ap_start <= '0';
        ex_TB_i_write_char <= '0';
        ex_TB_s_data <= "--------"; -- Don't care values due to loop skipping through
        ex_TB_s_lower_nibble <= "----";
        ex_TB_s_upper_nibble <= "----"; -- Don't care values due to loop skipping through
        ex_TB_o_db4_7 <= "----";
        ex_TB_s_register_select <= '-'; -- Don't care values due to loop skipping through

        
        wait for SYS_CLK;
        
        -- Wait for completion
        wait until TB_o_ap_done = '1';
        
        -- Cleanup phase
        ex_TB_s_ap_done <= '1'; 
        ex_TB_state <= CHECK_CURSOR_POS;
        ex_TB_nstate <= READY;
        ex_TB_ns_ddram_pos_last_written <= ex_TB_ns_next_ddram_pos;
        ex_TB_ns_next_ddram_pos <= std_logic_vector(unsigned(ex_TB_ns_next_ddram_pos)+1); -- Why does ex_TB_ns_next_ddram_pos <= std_logic_vector(unsigned(ex_TB_s_next_ddram_pos)+1); not work?
        
        wait for SYS_CLK;
        
        -- Update position and increment 
        ex_TB_s_ddram_pos_last_written <= ex_TB_ns_ddram_pos_last_written;
        ex_TB_state <= READY;
        ex_TB_nstate <= DONTCARE;
        ex_TB_i_ap_idle <= '1';
        ex_TB_s_next_ddram_pos <= ex_TB_ns_next_ddram_pos;
        --ex_TB_s_next_ddram_pos <= std_logic_vector(unsigned(ex_TB_s_next_ddram_pos) + 1);
        ex_TB_s_ap_done <= '0';
        char_count := char_count + 1; -- Variable assignment with :=
        
        wait for SYS_CLK;
    end loop;
    
    -- At this point the next ddram pos is the x"0f" position which equals to the LCD_TOP_RIGHT and represents the edge case
    ex_TB_state <= READY;
    TB_i_ap_start <= '1';
    TB_i_write_char <= '1';
    ex_TB_i_ap_start <= '1';
    ex_TB_i_write_char <= '1';
    ex_TB_i_ap_idle <= '1';
    ex_TB_nstate <= WRITE;
    TB_i_symbol_to_write <= x"41"; -- Write 'A' to LCD
    ex_TB_ns_next_ddram_pos <= x"0f";
    ex_TB_s_next_ddram_pos <= x"0f";


    wait for SYS_CLK;
    -- Execute phase
    ex_TB_state <= DONTCARE;
    ex_TB_nstate <= DONTCARE;
    TB_i_ap_start <= '0';
    TB_i_write_char <= '0';
    ex_TB_i_ap_start <= '0';
    ex_TB_i_write_char <= '0';
    ex_TB_i_ap_idle <= '0';
    
    wait until TB_o_register_select = '0'; -- At this point the next ddram pos violates the boundaries => change ddram pos manually via command
    ex_TB_ns_next_ddram_pos <= x"40";
    wait for SYS_CLK;
    ex_TB_s_next_ddram_pos <= ex_TB_ns_next_ddram_pos;
    
    wait until TB_o_ap_done = '1'; 

    ex_TB_s_ap_done <= '1';
    ex_TB_state <= READY;
    ex_TB_s_next_ddram_pos <= LCD_BOTTOM_LEFT; -- Reset DDRAM Position to Bottom Left
    ex_TB_ns_next_ddram_pos <= LCD_BOTTOM_LEFT; -- Reset ns DDRAM position to Bottom Left. 
    wait for SYS_CLK;

    report "************TEST CASE FINISHED - EXCEED UPPER RIGHT BOUNDARY*************" severity note;

    --  ******************************************************************

    report "************WRITING CHARACTERS TO EXCEED DISPLAY LOWER RIGHT BOUNDARY************" severity note;
    ex_TB_s_ap_done <= '0';
    char_count := 64; -- Use := for variable assignment
    TB_s_cmd_cnt <= x"A";
    while char_count < to_integer(unsigned(LCD_BOTTOM_RIGHT)) loop
        -- Setup phase
        ex_TB_state <= READY;
        TB_i_ap_start <= '1';
        TB_i_write_char <= '1';
        ex_TB_i_ap_start <= '1';
        ex_TB_i_write_char <= '1';
        ex_TB_i_ap_idle <= '1';
        ex_TB_nstate <= WRITE;
        TB_i_symbol_to_write <= x"41"; -- Write 'A' to LCD
        
        wait for SYS_CLK;
        
        -- Execute phase
        ex_TB_i_ap_idle <= '0';
        ex_TB_state <= DONTCARE;
        ex_TB_nstate <= DONTCARE;
        TB_i_ap_start <= '0';
        TB_i_write_char <= '0';
        ex_TB_i_ap_start <= '0';
        ex_TB_i_write_char <= '0';
        ex_TB_s_data <= "--------"; -- Don't care values due to loop skipping through
        ex_TB_s_lower_nibble <= "----";
        ex_TB_s_upper_nibble <= "----"; -- Don't care values due to loop skipping through
        ex_TB_o_db4_7 <= "----";
        ex_TB_s_register_select <= '-'; -- Don't care values due to loop skipping through        
        wait for SYS_CLK;
        
        -- Wait for completion
        wait until TB_o_ap_done = '1';
        
        -- Cleanup phase
        ex_TB_s_ap_done <= '1'; 
        ex_TB_state <= CHECK_CURSOR_POS;
        ex_TB_nstate <= READY;
        ex_TB_ns_ddram_pos_last_written <= ex_TB_ns_next_ddram_pos;
        ex_TB_ns_next_ddram_pos <= std_logic_vector(unsigned(ex_TB_ns_next_ddram_pos)+1); 
        
        wait for SYS_CLK;
        
        -- Update position and increment 
        ex_TB_state <= READY;
        ex_TB_i_ap_idle <= '1';
        ex_TB_s_ddram_pos_last_written <= ex_TB_ns_next_ddram_pos;
        ex_TB_s_next_ddram_pos <= ex_TB_ns_next_ddram_pos;
        ex_TB_s_ap_done <= '0';
        char_count := char_count + 1; -- Variable assignment with :=
        
        wait for SYS_CLK;
    end loop;

    -- At this point the next ddram pos is x"4f" position which equals to the LCD_BOTTOM_RIGHT and presents the edge case

    ex_TB_state <= READY;
    TB_i_ap_start <= '1';
    TB_i_write_char <= '1';
    ex_TB_i_ap_start <= '1';
    ex_TB_i_write_char <= '1';
    ex_TB_i_ap_idle <= '1';
    ex_TB_nstate <= WRITE;
    TB_i_symbol_to_write <= x"41"; -- Write 'A' to LCD
    ex_TB_ns_next_ddram_pos <= x"4f";
    ex_TB_s_next_ddram_pos <= x"4f";

    wait for SYS_CLK;
    ex_TB_state <= DONTCARE;
    ex_TB_nstate <= DONTCARE;
    TB_i_ap_start <= '0';
    TB_i_write_char <= '0';
    ex_TB_i_ap_start <= '0';
    ex_TB_i_write_char <= '0';
    ex_TB_i_ap_idle <= '0';
    
    wait until TB_o_register_select = '0'; -- At this point the next ddram pos violates the boundaries => change ddram pos manually via command
    ex_TB_ns_next_ddram_pos <= LCD_TOP_LEFT;
    wait for SYS_CLK;
    ex_TB_s_next_ddram_pos <= ex_TB_ns_next_ddram_pos;
    

    wait until TB_o_ap_done <= '1'; -- Wait until the register select is set to command register, indicating the write operation is done
    
    ex_TB_i_ap_idle <= '1';
    ex_TB_state <= READY;
    ex_TB_nstate <= READY; 
    TB_i_ap_start <= '0';
    TB_i_write_char <= '0';
    wait for SYS_CLK;

    wait;
  end process;


end TESTBENCH;
