----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2025 10:00:06 AM
-- Design Name: 
-- Module Name: TB_lcd_controller - Behavioral
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

entity tb_lcd_controller is
--  Port ( );
end tb_lcd_controller;

architecture TESTBENCH of tb_lcd_controller is

  component lcd_controller is
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
  end component;
  
  signal TB_i_clk                        : std_logic;
  signal TB_i_reset                      : std_logic;
  
  
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
    WAIT_PULSE,
    DISABLE_ENABLE,
    DISABLE_ENABLE_DELAY,
    WAIT_HOLD,
    EXEC_DELAY
  );
  
  -- register input
  signal TB_i_ap_start                : std_logic;                         -- GCSR   - ap_start            (0)
  signal TB_i_lcd_reset               : std_logic;                         -- SCSR0  - lcd_reset           (2)
  signal TB_i_symbol_to_write         : std_logic_vector(7 downto 0);      -- CDR    - symbol_to_write     (7:0)
  signal TB_i_ddram_pos_to_read       : std_logic_vector(7 downto 0);      -- CCR    - ddram_pos_to_read   (15:8)
  signal TB_i_write_char              : std_logic;                         -- CCR    - write_char          (24)
  signal TB_i_read_char               : std_logic;                         -- CCR    - read_char           (25)
  signal TB_i_clear_display           : std_logic;                         -- DCR    - clear_display       (0)
  signal TB_i_return_home             : std_logic;                         -- DCR    - return_home         (1)
  signal TB_i_cursor_on               : std_logic;                         -- DCR    - cursor_on           (2)
  signal TB_i_cursor_blink            : std_logic;                         -- DCR    - cursor_blink        (3)
  signal TB_i_display_shift           : std_logic;                         -- DCR    - display_shift       (4)
  signal TB_i_shift_direction         : std_logic;                         -- DCR    - shift_direction     (5)
  signal TB_i_display_line            : std_logic;                         -- DCR    - display_line        (6)
  signal TB_i_write_format            : std_logic;                         -- DCR    - write_format        (7)
  
  -- TB Expected Signals
  signal ex_TB_i_symbol_to_write                                  : std_logic_vector(7 downto 0);     
  signal ex_TB_s_timer_delay_time                                 : std_logic_vector(21 downto 0) := (others => '0');
  signal ex_TB_s_timer_start, ex_TB_s_timer_done                  : std_logic := '0';
  signal ex_TB_s_next_ddram_pos                                   : std_logic_vector(7 downto 0) := (others => '0');
  signal ex_TB_s_ns_next_ddram_pos                                : std_logic_vector(7 downto 0) := (others => '0');
  signal ex_TB_s_upper_nibble, ex_TB_s_lower_nibble               : std_logic_vector(3 downto 0);
  signal ex_TB_s_send_lower, ex_TB_ns_send_lower                  : std_logic := '0';
  signal ex_TB_s_function_set_twice, ex_TB_ns_function_set_twice  : std_logic := '0';
  signal ex_TB_s_ddram_written                                    : std_logic := '0';
  signal ex_TB_ns_ddram_written                                   : std_logic := '0';
  signal ex_TB_register_select                                    : std_logic := '0';
  signal ex_TB_s_data, ex_TB_ns_data                              : std_logic_vector(7 downto 0) := (others => '0');
  signal ex_TB_state, ex_TB_nstate                                : state_type := INIT_WAIT_30MS;
  signal ex_TB_o_db4_7                                            : std_logic_vector(3 downto 0) := (others => '0');
  signal ex_TB_s_read_write_enable                                : std_logic;
  signal ex_TB_s_read_write                                       : std_logic;
  signal ex_TB_s_lcd_initialized                                  : std_logic := '0';
  signal ex_TB_s_ap_done                                          : std_logic;
  signal ex_TB_s_register_select                                  : std_logic;
  signal ex_TB_ns_ddram_pos_last_written                          : std_logic_vector(7 downto 0) := (others => '0');
  signal ex_TB_s_ddram_pos_last_written                           : std_logic_vector(7 downto 0) := (others => '0');
  signal ex_TB_ns_writing_data                                    : std_logic := '0';
  signal ex_TB_s_writing_data                                     : std_logic := '0';
  signal ex_TB_i_ap_start                                         : std_logic := '0';
  signal ex_TB_i_write_char                                       : std_logic := '0';
  
  
  
  -- outputs to LCD
  signal TB_o_db4_7                      : std_logic_vector(3 downto 0);
  signal TB_o_register_select            : std_logic;
  signal TB_o_read_write                 : std_logic;
  signal TB_o_read_write_enable          : std_logic;
  
  -- register output
  signal TB_o_ap_done                 : std_logic;                          -- GCSR   - ap_done             (1)
  signal TB_o_ap_idle                 : std_logic;                          -- GCSR   - ap_idle             (2)
  signal TB_o_ddram_pos_last_written  : std_logic_vector(7 downto 0);      -- CCR    - ddram_pos_last_written      (7:0)
  signal TB_o_symbol_read             : std_logic_vector(7 downto 0);      -- CDR    - symbol_read         (15:8)
  signal TB_o_lcd_initialized         : std_logic;                         -- SCSR0  - lcd_initialized     (0)
  signal TB_o_lcd_busy                : std_logic;                         -- SCSR0  - lcd_busy            (1)
  signal TB_o_lcd_state               : std_logic_vector(7 downto 0);      -- SCSR0  - lcd_state           (10:3)
  signal TB_o_display_busy            : std_logic;                         -- SCSR0  - display_busy        (11)
  signal TB_o_lcd_error_flag          : std_logic;                         -- SCSR0  - lcd_error_flag      (12)
  signal TB_o_lcd_error_code          : std_logic;                          -- SCSR0  - lcd_error_code      (20:13)
  
  -- Debug Signals
  signal TB_s_cmd_cnt                     :std_logic_vector(3 downto 0) := (others=>'0'); -- For easy debugging and traversal of Wave form
  
--  -- Timing Constants
--  constant SYS_CLK : time := 10 ns; -- 100 MHz
--  constant T_POWER_ON                 : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(3300000, 22)); -- 30 ms 3000000
--  constant T_SU                       : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(8, 22)); -- t_SU = 60 ns 6
--  constant T_W                        : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(600, 22)); -- t_W = 450 ns 45
--  constant T_H                        : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(6, 22)); -- t_H = 30 ns from E Rise/Fall Time 3
--  constant T_16_4MS                   : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(194000, 22)); -- 1.64ms 164000
--  constant T_40_US                    : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(7000, 22));   -- 40us 4000
--  constant T_LOWER_UPPER_WAIT         : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(190, 22));   -- t_Cycle - t_H - t_SU = 430 43 150
  
  
   --Timing Constants -- FOR SIMULATION
  constant SYS_CLK : time := 10 ns; -- 100 MHz
  constant T_POWER_ON                 : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(3, 22));
  constant T_SU                       : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(1, 22));
  constant T_W                        : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(7, 22));
  constant T_H                        : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(2, 22));
  constant T_16_4MS                   : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(1, 22));
  constant T_40_US                    : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(4, 22));
  constant T_LOWER_UPPER_WAIT         : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(10, 22));
  
  
  
  
   -- LCD Commands (8-bit), werden in 2x 4-bit gesendet
  constant CMD_INIT_CLEAR_DISPLAY : std_logic_vector(7 downto 0) := "00000001";
  constant CMD_INIT_ENTRY_MODE    : std_logic_vector(7 downto 0) := "00000110"; -- Increment mode
  constant CMD_INIT_FUNCTION_SET  : std_logic_vector(7 downto 0) := "00101000"; -- 4-bit, 2-line, 5x8 font 
  constant CMD_INIT_DISPLAY_CTRL  : std_logic_vector(7 downto 0) := "00001100"; -- Display ON, Cursor OFF
 
  
  
  
begin

  -- create port mapping
  uut: lcd_controller
    port map (
      i_clk                        => TB_i_clk,
      i_reset                      => TB_i_reset,
      
      -- register input
      i_ap_start                => TB_i_ap_start,                -- GCSR   - ap_start            (0)
--      i_ri_lcd_reset               => TB_i_ri_lcd_reset,               -- SCSR0  - lcd_reset           (2)
        i_symbol_to_write         => TB_i_symbol_to_write,         -- CDR    - symbol_to_write     (7:0)
--      i_ri_ddram_pos_to_read       => TB_i_ri_ddram_pos_to_read,       -- CCR    - ddram_pos_to_read   (15:8)
        i_write_char              => TB_i_write_char,              -- CCR    - write_char          (24)
--      i_ri_read_char               => TB_i_ri_read_char,               -- CCR    - read_char           (25)
--      i_ri_clear_display           => TB_i_ri_clear_display,           -- DCR    - clear_display       (0)
--      i_ri_return_home             => TB_i_ri_return_home,             -- DCR    - return_home         (1)
--      i_ri_cursor_on               => TB_i_ri_cursor_on,               -- DCR    - cursor_on           (2)
--      i_ri_cursor_blink            => TB_i_ri_cursor_blink,            -- DCR    - cursor_blink        (3)
--      i_ri_display_shift           => TB_i_ri_display_shift,           -- DCR    - display_shift       (4)
--      i_ri_shift_direction         => TB_i_ri_shift_direction,         -- DCR    - shift_direction     (5)
--      i_ri_display_line            => TB_i_ri_display_line,            -- DCR    - display_line        (6)
--      i_ri_write_format            => TB_i_ri_write_format,            -- DCR    - write_format        (7)
      
      -- outputs to LCD
      o_db4_7                      => TB_o_db4_7,
      o_register_select            => TB_o_register_select,
      o_read_write                 => TB_o_read_write,
      o_read_write_enable          => TB_o_read_write_enable,
      
      -- register output
      o_ap_done                 => TB_o_ap_done,                 -- GCSR   - ap_done             (1)
--      o_ro_ap_idle                 => TB_o_ro_ap_idle,                 -- GCSR   - ap_idle             (2)
      o_ddram_pos_last_written  => TB_o_ddram_pos_last_written,  -- CCR    - ddram_pos_last_written      (7:0)
--      o_ro_symbol_read             => TB_o_ro_symbol_read,             -- CDR    - symbol_read         (15:8)
      o_lcd_initialized         => TB_o_lcd_initialized,         -- SCSR0  - lcd_initialized     (0)
      o_lcd_busy                => TB_o_lcd_busy                -- SCSR0  - lcd_busy            (1)
--      o_ro_lcd_state               => TB_o_ro_lcd_state,               -- SCSR0  - lcd_state           (10:3)
--      o_ro_display_busy            => TB_o_ro_display_busy,            -- SCSR0  - display_busy        (11)
--      o_ro_lcd_error_flag          => TB_o_ro_lcd_error_flag,          -- SCSR0  - lcd_error_flag      (12)
--      o_ro_lcd_error_code          => TB_o_ro_lcd_error_code           -- SCSR0  - lcd_error_code      (20:13)
    );

-- 100 MHz Clock
  process
    begin
        TB_i_clk <= '1';
        wait for SYS_CLK/2;
        TB_i_clk <= '0';
        wait for SYS_CLK/2;
    end process;

  STIM_PROC: process
  begin
    -- Initial reset 
    ex_TB_state <= INIT_WAIT_30MS;
    ex_TB_nstate<= INIT_WAIT_30MS_DELAY;
    TB_i_reset <= '1';
    report "Reset initialized" severity note;
    wait for SYS_CLK;
    TB_i_reset <= '0';
 
    
    report "---------------INITIALIZING LCD CONTROLLER---------------" severity note;
    report "current time = " & time'image(now);
    
    report "---------------STATE: INIT_WAIT_30MS---------------" severity note;
    ex_TB_state <= INIT_WAIT_30MS;
    ex_TB_nstate<=INIT_WAIT_30MS_DELAY;
    ex_TB_s_timer_start <= '1';
    ex_TB_S_timer_delay_time <= T_POWER_ON;
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD) => No values in this step, use default valuse in lcd_controller.vhd?
    ex_TB_o_db4_7 <= x"0";
    ex_TB_s_register_select <= '0';
    ex_TB_s_read_write <= '0';
    ex_TB_s_read_write_enable <= '0';
    ex_TB_s_ap_done <= '0';
   -- ex_TB_s_lcd_busy <= '1'; add this 
    ex_TB_s_ddram_pos_last_written <= x"FF";
  
    
    report "---------------STATE: INIT_WAIT_30MS_DELAY---------------" severity note;
    ex_TB_s_timer_delay_time <= T_POWER_ON;
    ex_TB_state <= INIT_WAIT_30MS_DELAY;
    ex_TB_s_timer_start <= '1';
    wait for to_integer(unsigned(T_POWER_ON))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_nstate <= INIT_FUNC_SET;
    
    wait for SYS_CLK;
    
    report "---------------STATE: INIT_FUNC_SET---------------" severity note;
    TB_s_cmd_cnt <= x"1";
    ex_TB_s_timer_done <= '0';
    ex_TB_state <= INIT_FUNC_SET;
    ex_TB_nstate <= SETUP_CONTROL;
    ex_TB_s_data <= CMD_INIT_FUNCTION_SET; -- Expecting an instruction
    ex_TB_ns_send_lower <= '0';
    WAIT for SYS_CLK;    
    
    report "---------------STATE: SETUP_CONTROL---------------" severity note;
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_start <= '1';
    ex_TB_s_upper_nibble <= "0010";
    ex_TB_s_lower_nibble <= "1000";
    ex_TB_s_timer_delay_time <= T_SU;
    ex_TB_s_send_lower <= '0';
    wait for SYS_CLK;

    report "---------------STATE: WAIT_SETUP_DELAY---------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_start <= '0';
  
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD) => No values in this step, use default valuse in lcd_controller.vhd?
    ex_TB_o_db4_7 <= x"2";


    wait for to_integer(unsigned(T_SU))*SYS_CLK;
    ex_TB_nstate <= WAIT_SETUP;
    ex_TB_s_timer_done <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP---------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_delay_time <= T_W;
    ex_TB_s_timer_start <= '1';
    
    -- Updated Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_read_write_enable <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY---------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for to_integer(unsigned(T_W))*SYS_CLK;
    ex_TB_nstate <= PULSE_ENABLE;
    ex_TB_s_timer_done <= '1';
    
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE---------------" severity note;
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_done <= '0';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_delay_time <= T_H;
    ex_TB_s_timer_start <= '1';
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_read_write_enable <= '0';
    wait for SYS_CLK;

    report "---------------STATE: DISABLE_ENABLE_DELAY---------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for to_integer(unsigned(T_H))*SYS_CLK;
    ex_TB_nstate <= DISABLE_ENABLE;
    ex_TB_s_timer_done <= '1';
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_o_db4_7 <= CMD_INIT_FUNCTION_SET(7 downto 4);
    ex_TB_s_register_select <= '0';
    ex_TB_s_read_write <= '0';
    ex_TB_s_read_write_enable <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE---------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_nstate <= SETUP_CONTROL_DELAY;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_send_lower <= '0';
    ex_TB_s_function_set_twice <= '0';
    ex_TB_ns_function_set_twice <= '1';
    ex_TB_ns_send_lower <= '0'; -- Function set upper nibbles must be sent twice according to datasheet 
    ex_TB_s_timer_delay_time <= T_LOWER_UPPER_WAIT;
    ex_TB_s_timer_start <= '1';
    wait for SYS_CLK;

    
    report "---------------STATE: SETUP_CONTROL_DELAY---------------" severity note;
    ex_TB_state <= SETUP_CONTROL_DELAY;
    ex_TB_s_function_set_twice <= '1';
    ex_TB_s_timer_start <= '0';
    wait for to_integer(unsigned(T_LOWER_UPPER_WAIT))*SYS_CLK;
    ex_TB_nstate <= SETUP_CONTROL;
    ex_TB_s_timer_done <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
 
    ex_TB_s_timer_done <= '0';
    ex_TB_s_upper_nibble <= "0010";
    ex_TB_s_lower_nibble <= "1000";
    ex_TB_s_timer_delay_time <= T_SU;
    ex_TB_s_timer_start <= '1';
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    wait for SYS_CLK; 
       
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for to_integer(unsigned(T_SU))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_delay_time <= T_W;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;

    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_read_write_enable <= '1';
    wait for SYS_CLK;
 
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for to_integer(unsigned(T_W))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_s_timer_done <= '0';
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_delay_time <= T_H;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_read_write_enable <= '0';
    wait for SYS_CLK;
 
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for to_integer(unsigned(T_H))*SYS_CLK;
    ex_TB_nstate <= DISABLE_ENABLE;
    ex_TB_s_timer_done <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_send_lower <= '0';
    ex_TB_s_function_set_twice <= '1';
    ex_TB_ns_send_lower <= '1';
    ex_TB_s_timer_delay_time <= T_LOWER_UPPER_WAIT;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= SETUP_CONTROL_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL_DELAY--------------" severity note;
    ex_TB_state <= SETUP_CONTROL_DELAY;
    ex_TB_s_timer_start <= '0';  
    ex_TB_o_db4_7 <= x"8";
    wait for to_integer(unsigned(T_LOWER_UPPER_WAIT))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= SETUP_CONTROL;
    
    
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
    ex_TB_s_timer_done <= '0';
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_s_ap_done <= '0';
    ex_TB_s_upper_nibble <= x"2";
    ex_TB_s_lower_nibble <= x"8";
    ex_TB_s_timer_delay_time <= T_SU;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for to_integer(unsigned(T_SU))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;

    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_delay_time <= T_W;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_read_write_enable <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';

    wait for to_integer(unsigned(T_W))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_delay_time <= T_H;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_read_write_enable <= '0';
    wait for SYS_CLK;
       
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';

    wait for to_integer(unsigned(T_H))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= DISABLE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_timer_done <= '0';
    ex_TB_ns_send_lower <= '0';
    ex_TB_s_timer_delay_time <= T_40_US;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= EXEC_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: EXEC_DELAY--------------" severity note;
    ex_TB_state <= EXEC_DELAY;
    ex_TB_s_timer_start <= '0';
    ex_TB_o_db4_7 <= x"2"; -- Actually not necessary, but for sake of completion

    wait for to_integer(unsigned(T_40_US))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_s_data <= CMD_INIT_FUNCTION_SET;
    ex_TB_nstate <= INIT_DISP_CTRL;
    wait for SYS_CLK;
    
    report "************FUNCTION SET DONE************" severity note;

    report "---------------STATE: INIT_DISP_CTRL--------------" severity note;
    TB_s_cmd_cnt <= x"2";
    ex_TB_state <= INIT_DISP_CTRL;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_data <= CMD_INIT_DISPLAY_CTRL;
    ex_TB_ns_send_lower <= '0';
    ex_TB_nstate <= SETUP_CONTROL;
    
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_register_select <= '0';
    wait for SYS_CLK;
        
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
    ex_TB_s_timer_done <= '0';
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_s_ap_done <= '0';
    ex_TB_s_upper_nibble <= x"0";
    ex_TB_s_lower_nibble <= x"C";
    ex_TB_s_timer_delay_time <= T_SU;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_start <= '0';
    ex_TB_o_db4_7 <= x"0";
    wait for to_integer(unsigned(T_SU))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_delay_time <= T_W;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_read_write_enable <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for to_integer(unsigned(T_W))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_delay_time <= T_H;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_read_write_enable <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for to_integer(unsigned(T_H))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= DISABLE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_timer_done <= '0';
    ex_TB_ns_send_lower <= '1';
    ex_TB_s_timer_delay_time <= T_LOWER_UPPER_WAIT;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= SETUP_CONTROL_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL_DELAY--------------" severity note;
    ex_TB_state <= SETUP_CONTROL_DELAY;
    ex_TB_s_send_lower <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_o_db4_7 <= x"c";
    wait for to_integer(unsigned(T_LOWER_UPPER_WAIT))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= SETUP_CONTROL;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
    ex_TB_s_timer_done <= '0';
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_s_upper_nibble <= x"0";
    ex_TB_s_lower_nibble <= x"c";
    ex_TB_s_timer_delay_time <= T_SU;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_ap_done <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for to_integer(unsigned(T_SU))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_delay_time <= T_W;
    ex_TB_s_timer_start <= '1';
    ex_TB_s_timer_done <= '0';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';

    wait for to_integer(unsigned(T_W))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_delay_time <= T_H;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';
    
    ex_TB_s_read_write_enable <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for to_integer(unsigned(T_H))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= DISABLE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_send_lower <= '1';
    ex_TB_ns_send_lower <= '0';
    ex_TB_s_data <= CMD_INIT_DISPLAY_CTRL;
    ex_TB_s_timer_delay_time <= T_40_US;
    ex_TB_nstate <= EXEC_DELAY;
    ex_TB_s_timer_start <= '1';
    ex_TB_s_timer_done <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: EXEC_DELAY--------------" severity note;
    ex_TB_state <= EXEC_DELAY;
    ex_TB_s_timer_start <= '0';
    ex_TB_o_db4_7 <= x"0";

    wait for to_integer(unsigned(T_40_US))*SYS_CLK;
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
    ex_TB_s_data <= CMD_INIT_ENTRY_MODE;
    ex_TB_ns_send_lower <= '0';
    ex_TB_nstate <= SETUP_CONTROL;
    
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_register_select <= '0';
    wait for SYS_CLK;
        
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
    ex_TB_s_timer_done <= '0';
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_s_ap_done <= '0';
    ex_TB_s_upper_nibble <= x"0";
    ex_TB_s_lower_nibble <= x"6";
    ex_TB_s_timer_delay_time <= T_SU;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for to_integer(unsigned(T_SU))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_delay_time <= T_W;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_read_write_enable <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    wait for to_integer(unsigned(T_W))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_delay_time <= T_H;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_read_write_enable <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    wait for to_integer(unsigned(T_H))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_nstate <= DISABLE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_timer_done <= '0';
    ex_TB_ns_send_lower <= '1';
    ex_TB_s_timer_delay_time <= T_LOWER_UPPER_WAIT;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= SETUP_CONTROL_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL_DELAY--------------" severity note;
    ex_TB_state <= SETUP_CONTROL_DELAY;
    ex_TB_s_send_lower <= '1';
    ex_TB_o_db4_7 <= x"6";
    wait for to_integer(unsigned(T_LOWER_UPPER_WAIT))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_nstate <= SETUP_CONTROL;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_s_upper_nibble <= x"0";
    ex_TB_s_lower_nibble <= x"6";
    ex_TB_s_timer_delay_time <= T_SU;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_done <= '0';
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_ap_done <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    wait for to_integer(unsigned(T_SU))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_delay_time <= T_W;
    ex_TB_s_timer_start <= '1';
    ex_TB_s_timer_done <= '0';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    wait for to_integer(unsigned(T_W))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_delay_time <= T_H;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_read_write_enable <= '0';

    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    wait for to_integer(unsigned(T_H))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_nstate <= DISABLE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_send_lower <= '1';
    ex_TB_ns_send_lower <= '0';
    ex_TB_s_timer_done <= '0';
    ex_TB_s_data <= CMD_INIT_DISPLAY_CTRL;
    ex_TB_s_timer_delay_time <= T_40_US;
    ex_TB_nstate <= EXEC_DELAY;
    ex_TB_s_timer_start <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: EXEC_DELAY--------------" severity note;
    ex_TB_state <= EXEC_DELAY;
    ex_TB_o_db4_7 <= x"0";
    wait for to_integer(unsigned(T_40_US))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_s_data <= CMD_INIT_ENTRY_MODE;
    ex_TB_nstate <= INIT_CLEAR;
    wait for SYS_CLK;
    
    report "************INIT ENTRY MODE DONE************" severity note;    
    
    
    report "---------------STATE: INIT_CLEAR--------------" severity note;
    TB_s_cmd_cnt <= x"4";
    ex_TB_state <= INIT_CLEAR;
    ex_TB_s_data <= CMD_INIT_CLEAR_DISPLAY;
    ex_TB_ns_send_lower <= '0';
    ex_TB_nstate <= SETUP_CONTROL;
    ex_TB_s_timer_done <= '0';
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_register_select <= '0';
    wait for SYS_CLK;
    
    
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
    ex_TB_s_send_lower <= '0';
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_s_ap_done <= '0';
    ex_TB_s_upper_nibble <= x"0";
    ex_TB_s_lower_nibble <= x"1";
    ex_TB_s_timer_delay_time <= T_SU;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    wait for to_integer(unsigned(T_SU))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_delay_time <= T_W;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_read_write_enable <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    wait for to_integer(unsigned(T_W))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_delay_time <= T_H;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_read_write_enable <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    wait for to_integer(unsigned(T_H))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_nstate <= DISABLE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_timer_done <= '0';
    ex_TB_ns_send_lower <= '1';
    ex_TB_s_timer_delay_time <= T_LOWER_UPPER_WAIT;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= SETUP_CONTROL_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL_DELAY--------------" severity note;
    ex_TB_state <= SETUP_CONTROL_DELAY;
    ex_TB_s_send_lower <= '1';
    ex_TB_o_db4_7 <= x"1";
    wait for to_integer(unsigned(T_LOWER_UPPER_WAIT))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_nstate <= SETUP_CONTROL;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_s_upper_nibble <= x"0";
    ex_TB_s_lower_nibble <= x"6";
    ex_TB_s_timer_delay_time <= T_SU;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_ap_done <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    wait for to_integer(unsigned(T_SU))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_read_write_enable <= '1';
    ex_TB_s_timer_delay_time <= T_W;
    ex_TB_s_timer_start <= '1';
    ex_TB_s_timer_done <= '0';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    wait for to_integer(unsigned(T_W))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_s_read_write_enable <= '0';
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_delay_time <= T_H;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    wait for to_integer(unsigned(T_H))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_nstate <= DISABLE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_send_lower <= '1';
    ex_TB_ns_send_lower <= '0';
    ex_TB_s_data <= CMD_INIT_DISPLAY_CTRL;
    ex_TB_s_timer_delay_time <= T_16_4MS;
    ex_TB_nstate <= EXEC_DELAY;
    ex_TB_s_timer_start <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: EXEC_DELAY--------------" severity note;
    ex_TB_state <= EXEC_DELAY;
    ex_TB_o_db4_7 <= x"0";
    wait for to_integer(unsigned(T_16_4MS))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_nstate <= INIT_FINISHED;
    wait for SYS_CLK;    
    
    report "************INIT CLEAR DISPLAY DONE************" severity note;    
    
    report "---------------STATE: INIT_FINISHED--------------" severity note;
    ex_TB_state <= INIT_FINISHED;
    ex_TB_s_lcd_initialized <= '1';
    ex_TB_s_timer_done <= '0';
    ex_TB_nstate <= READY;
    wait for SYS_CLK;
    
    report "************DISPLAY INITIALIZITION DONE************" severity note;    
    
    
    report "---------------STATE: READY--------------" severity note;
    ex_TB_state <= READY;
    wait for SYS_CLK; -- Remain one Cycle in READY-State
    
    report "************WRITING CHARACTER TO LCD DISPLAY************" severity note;
    report "************SET DDRAM ADDRESS FIRST************" severity note;
    
    report "---------------STATE: READY--------------" severity note;
    TB_s_cmd_cnt <= x"5";
    TB_i_symbol_to_write <= x"41"; -- Write 'A'
    TB_i_write_char <= '1';
    TB_i_ap_start <= '1';
    ex_TB_i_ap_start <= '1';
    ex_TB_i_write_char <= '1';
    
    
    ex_TB_state <= READY; 
    ex_TB_i_symbol_to_write <= x"41";
    ex_TB_ns_data <= x"80"; -- x"80" OR s_next_ddram_pos (x"00" here)
    ex_TB_ns_send_lower <= '0';
    ex_TB_ns_ddram_pos_last_written <= x"00";
    ex_TB_s_ddram_written <= '0';
    ex_TB_ns_ddram_written <= '1';
    ex_TB_nstate <= SETUP_CONTROL;
    ex_TB_ns_writing_data <= '0';
    wait for SYS_CLK;
    
    
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
    ex_TB_s_data <= x"80";
    ex_TB_s_send_lower <= '1';
    ex_TB_s_ddram_pos_last_written <= x"00";
    ex_TB_s_ddram_written <= '1';
    ex_TB_s_writing_data <= '0';
    ex_TB_s_send_lower <= '0';
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_s_upper_nibble <= x"8";
    ex_TB_s_lower_nibble <= x"0";
    ex_TB_s_timer_delay_time <= T_SU;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_start <= '0';
    ex_TB_o_db4_7 <= x"8";
    wait for to_integer(unsigned(T_SU))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_delay_time <= T_W;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_read_write_enable <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for to_integer(unsigned(T_W))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_delay_time <= T_H;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_read_write_enable <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';

    wait for to_integer(unsigned(T_H))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= DISABLE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_timer_done <= '0';
    ex_TB_ns_send_lower <= '1';
    ex_TB_s_timer_delay_time <= T_LOWER_UPPER_WAIT;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= SETUP_CONTROL_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL_DELAY--------------" severity note;
    ex_TB_state <= SETUP_CONTROL_DELAY;
    ex_TB_s_send_lower <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_o_db4_7 <= x"0";

    wait for to_integer(unsigned(T_LOWER_UPPER_WAIT))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= SETUP_CONTROL;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_s_upper_nibble <= x"8";
    ex_TB_s_lower_nibble <= x"0";
    ex_TB_s_timer_delay_time <= T_SU;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for to_integer(unsigned(T_SU))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_s_read_write_enable <= '1';
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_delay_time <= T_W;
    ex_TB_s_timer_start <= '1';
    ex_TB_s_timer_done <= '0';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for to_integer(unsigned(T_W))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_s_read_write_enable <= '0';
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_delay_time <= T_H;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';  
    wait for to_integer(unsigned(T_H))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= DISABLE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_send_lower <= '1';
    ex_TB_ns_send_lower <= '0';
    ex_TB_s_data <= x"80";
    ex_TB_s_timer_delay_time <= T_40_US;
    ex_TB_nstate <= EXEC_DELAY;
    ex_TB_s_timer_start <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: EXEC_DELAY--------------" severity note;
    ex_TB_state <= EXEC_DELAY;
    ex_TB_s_timer_start <= '0';
    ex_TB_o_db4_7 <= x"8";

    wait for to_integer(unsigned(T_40_US))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= READY;
    wait for SYS_CLK;    
    
    report "************DDRAM_ADRESS SET************" severity note;
    
    report "---------------STATE: READY--------------" severity note;
    TB_s_cmd_cnt <= "0110";
    ex_TB_state <= READY;
    ex_TB_s_timer_done <= '0';
    ex_TB_i_symbol_to_write <= x"41";
    ex_TB_i_write_char <= '1';
    ex_TB_s_ddram_written <= '1';
    ex_TB_ns_data <= x"41";
    ex_TB_s_register_select <= '1'; -- Selecting Data Register
    ex_TB_ns_send_lower <= '0';
    ex_TB_ns_ddram_written <= '0';
    ex_TB_ns_writing_data <= '1'; -- Actuall flag to start the writing logic
    ex_TB_nstate <= SETUP_CONTROL;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
    ex_TB_s_data <= x"41";
    ex_TB_s_send_lower <= '0';
    ex_TB_s_writing_data <= '1';
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_s_upper_nibble <= x"4";
    ex_TB_s_lower_nibble <= x"1";
    ex_TB_s_timer_delay_time <= T_SU;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for to_integer(unsigned(T_SU))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_delay_time <= T_W;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_read_write_enable <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for to_integer(unsigned(T_W))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_delay_time <= T_H;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';
    
    -- Outgoing expected Signals after FSM-Process (Assigning to out Ports to LCD)
    ex_TB_s_read_write_enable <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';
    
    wait for to_integer(unsigned(T_H))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= DISABLE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_timer_done <= '0';
    ex_TB_ns_send_lower <= '1';
    ex_TB_s_timer_delay_time <= T_LOWER_UPPER_WAIT;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= SETUP_CONTROL_DELAY;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL_DELAY--------------" severity note;
    ex_TB_state <= SETUP_CONTROL_DELAY;
    ex_TB_s_send_lower <= '1';
    ex_TB_s_timer_start <= '0';
    ex_TB_o_db4_7 <= x"1";
    
    wait for to_integer(unsigned(T_LOWER_UPPER_WAIT))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= SETUP_CONTROL;
    wait for SYS_CLK;
    
    report "---------------STATE: SETUP_CONTROL--------------" severity note;
    ex_TB_state <= SETUP_CONTROL;
    ex_TB_s_upper_nibble <= x"4";
    ex_TB_s_lower_nibble <= x"1";
    ex_TB_s_timer_delay_time <= T_SU;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= WAIT_SETUP_DELAY;
    
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP_DELAY--------------" severity note;
    ex_TB_state <= WAIT_SETUP_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for to_integer(unsigned(T_SU))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= WAIT_SETUP;
    wait for SYS_CLK;
    
    report "---------------STATE: WAIT_SETUP--------------" severity note;
    ex_TB_state <= WAIT_SETUP;
    ex_TB_s_timer_delay_time <= T_W;
    ex_TB_s_timer_start <= '1';
    ex_TB_s_timer_done <= '0';
    ex_TB_nstate <= PULSE_ENABLE_DELAY;
    ex_TB_s_read_write_enable <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= PULSE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';
    wait for to_integer(unsigned(T_W))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= PULSE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: PULSE_ENABLE--------------" severity note;
    ex_TB_state <= PULSE_ENABLE;
    ex_TB_s_timer_delay_time <= T_H;
    ex_TB_s_timer_start <= '1';
    ex_TB_nstate <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_done <= '0';
    ex_TB_s_read_write_enable <= '0';
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE_DELAY--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE_DELAY;
    ex_TB_s_timer_start <= '0';  
    wait for to_integer(unsigned(T_H))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_nstate <= DISABLE_ENABLE;
    wait for SYS_CLK;
    
    report "---------------STATE: DISABLE_ENABLE--------------" severity note;
    ex_TB_state <= DISABLE_ENABLE;
    ex_TB_s_send_lower <= '1';
    ex_TB_ns_send_lower <= '0';
    ex_TB_s_data <= x"41";
    ex_TB_s_timer_delay_time <= T_40_US;
    ex_TB_nstate <= EXEC_DELAY;
    ex_TB_s_timer_start <= '1';
    wait for SYS_CLK;
    
    report "---------------STATE: EXEC_DELAY--------------" severity note;
    ex_TB_state <= EXEC_DELAY;
    ex_TB_s_timer_start <= '0';
    ex_TB_s_writing_data <= '1';
    ex_TB_o_db4_7 <= x"4";
    
    wait for to_integer(unsigned(T_40_US))*SYS_CLK;
    ex_TB_s_timer_done <= '1';
    ex_TB_ns_writing_data <= '0'; -- Reset the flag so we do not write data again without updating ddram pos
    ex_TB_nstate <= READY;
    ex_TB_s_ap_done <= '1';
    ex_TB_nstate <= READY;
    TB_i_ap_start <= '0';
    wait for SYS_CLK;
    
    report "************CHARACTER WRITTEN************" severity note;
    
    report "---------------STATE: EXEC_DELAY--------------" severity note;
    ex_TB_state <= READY;

        

    
    
    
    wait;
  end process;

end TESTBENCH;
