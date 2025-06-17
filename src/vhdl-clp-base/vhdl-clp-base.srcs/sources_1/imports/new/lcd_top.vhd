----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2025
-- Design Name: 
-- Module Name: lcd_top - Behavioral
-- Project Name: LCD Controller Test
-- Target Devices: 
-- Tool Versions: 
-- Description: Top module for testing LCD controller with predefined characters
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

entity lcd_top is
    Port (
        i_clk           : in  std_logic;        -- System clock (100MHz)
        i_reset         : in  std_logic;        -- Reset button (active high)
        
        -- LCD connections
        o_lcd_db4_7     : out std_logic_vector(3 downto 0);  -- LCD data lines
        o_lcd_rs        : out std_logic;        -- LCD register select
        o_lcd_rw        : out std_logic;        -- LCD read/write
        o_lcd_e         : out std_logic;        -- LCD enable
        
        -- Status LEDs
        o_led_init     : out std_logic;        -- LED indicates LCD is ready
        o_led_busy      : out std_logic;        -- LED indicates LCD is busy
        o_led_done      : out std_logic         -- LED indicates operation complete
    );
end lcd_top;

architecture Behavioral of lcd_top is

    -- LCD Controller component - updated to match simplified interface
    component lcd_controller is
        generic (
          G_T_POWER_ON : integer := 3000000; -- 30 ms
          G_T_SU       : integer := 6;        -- t_SU = 60 ns
          G_T_W        : integer := 45;       -- t_W = 450 ns
          G_T_H        : integer := 3;        -- t_H = 30 ns from E Rise/Fall Time
          G_T_16_4MS   : integer := 164000;   -- 1.64 ms
          G_T_40_US    : integer := 4000;     -- 40 us
          G_T_LOWER_UPPER_WAIT : integer := 150 -- t_Cycle - t_H - t_SU = 430 - 43 = 150
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

    -- State machine for character writing
    type write_state_type is (
        WAIT_INIT,
        WAIT_START,
        WRITE_CHAR,
        WAIT_DONE,
        NEXT_CHAR,
        FINISHED,
        WAIT1,
        WAIT2
    );
    
    signal write_state, ns_write_state : write_state_type := WAIT_INIT;
   
    
    -- LCD control signals
    signal lcd_ap_start : std_logic := '0';
    signal lcd_write_char : std_logic := '0';
    signal lcd_symbol : std_logic_vector(7 downto 0) := x"48";
    signal lcd_ap_done : std_logic;
    signal lcd_ap_idle : std_logic;
    signal lcd_initialized : std_logic := '0';
    signal lcd_busy : std_logic;
    signal lcd_ddram_pos_last_written : std_logic_vector(7 downto 0) := (others => '0');
    signal lcd_state: std_logic_vector(7 downto 0);
    signal lcd_error_flag : std_logic;
    signal lcd_clear_display : std_logic := '0';
    signal lcd_return_home : std_logic := '0';
    signal lcd_cursor_on : std_logic := '1';
    signal lcd_cursor_blink : std_logic := '1';
    signal lcd_cursor_apply : std_logic := '0';
    
    -- Next-state signals
    signal ns_lcd_ap_start     : std_logic := '0';
    signal ns_lcd_write_char   : std_logic := '0';
    signal ns_lcd_symbol       : std_logic_vector(7 downto 0) := x"48";
    signal ns_char_index       : integer range 0 to 40 := 0;
    signal ns_operation_complete : std_logic := '0';

    -- Character sequence to write: "BMW ist 2x besser als AUDI!"
    type char_array is array (0 to 26) of std_logic_vector(7 downto 0);
    constant MESSAGE : char_array := (
        x"42",  -- 'B'
        x"4D",  -- 'M'
        x"57",  -- 'W'
        x"20",  -- ' '
        x"69",  -- 'i'
        x"73",  -- 's'
        x"74",  -- 't'
        x"20",  -- ' '
        x"32",  -- '2'
        x"78",  -- 'x'
        x"20",  -- ' '
        x"62",  -- 'b'
        x"65",  -- 'e'
        x"73",  -- 's'
        x"73",  -- 's'
        x"65",  -- 'e'
        x"72",  -- 'r'
        x"20",  -- ' '
        x"61",  -- 'a'
        x"6C",  -- 'l'
        x"73",  -- 's'
        x"20",  -- ' '
        x"41",  -- 'A'
        x"55",  -- 'U'
        x"44",  -- 'D'
        x"49",  -- 'I'
        x"21"   -- '!'
    );

    
    signal char_index : integer range 0 to 40 := 0;
    signal operation_complete : std_logic := '0';

begin
    -- Instantiate LCD controller - updated port map to match your interface
    lcd_controller_inst : lcd_controller
        generic map (
            G_T_POWER_ON => 30,  -- 30 ms
            G_T_SU => 6,               -- t_SU = 60 ns
            G_T_W => 45,               -- t_W = 450 ns
            G_T_H => 3,                -- t_H = 30 ns from E Rise/Fall Time
            G_T_16_4MS => 16,      -- 1.64 ms
            G_T_40_US => 4,         -- 40 us
            G_T_LOWER_UPPER_WAIT => 15 -- t_Cycle - t_H - t_SU = 430 - 43 = 150
        )
        port map (
            i_clk                        => i_clk,
            i_reset                      => i_reset,
            
            -- outputs to LCD
            o_db4_7                      => o_lcd_db4_7,
            o_register_select            => o_lcd_rs,
            o_read_write                 => o_lcd_rw,
            o_read_write_enable          => o_lcd_e,
            
            -- GCSR
            i_ap_start                   => lcd_ap_start,
            o_ap_done                    => lcd_ap_done,
            o_ap_idle                    => lcd_ap_idle,               
            -- i_auto_restart            : in std_logic;                           -- (7) optional
            
            -- SCSR0
            o_lcd_initialized            => lcd_initialized,
            o_lcd_state                  => lcd_state,
            o_lcd_error_flag             => lcd_error_flag,
            
            -- CCR
            o_ddram_pos_last_written     => lcd_ddram_pos_last_written,
            -- i_ddram_pos_to_read       : in std_logic_vector(7 downto 0);        -- (15:8) optional
            i_write_char                 => lcd_write_char,
            -- i_read_char               : in std_logic;                           -- (17) optional
            
            -- CDR
            i_symbol_to_write            => lcd_symbol,
            -- o_symbol_read             : out std_logic_vector(7 downto 0);       -- (15:8) optional
            
            -- DCR
            i_clear_display              => lcd_clear_display,
            i_return_home                => lcd_return_home,
            i_cursor_on                  => lcd_cursor_on,
            i_cursor_blink               => lcd_cursor_blink,
            i_cursor_apply               => lcd_cursor_apply
            -- i_display_line            : in std_logic;                     -- (5) optional
        );

    -- Main character writing state machine
    
 -- MEM process to update signals
    mem_proc: process(i_clk)
    begin
        if i_clk='1' and i_clk'event then
            if i_reset = '1' then
                lcd_ap_start <= '0';
                lcd_write_char <= '0';
                lcd_symbol <= x"48";
                char_index <= 0;
                operation_complete <= '0';
            else
                lcd_ap_start <= ns_lcd_ap_start;
                lcd_write_char <= ns_lcd_write_char;
                lcd_symbol <= ns_lcd_symbol;
                char_index <= ns_char_index;
                operation_complete <= ns_operation_complete;
                write_state <= ns_write_state;
            end if;
        end if;
    end process;
    
    fsm_logic: process(write_state, lcd_initialized, lcd_ap_done, char_index, lcd_symbol, operation_complete, lcd_ap_start, lcd_write_char)
    begin
        -- Default assignments
        ns_write_state <= write_state;
        ns_lcd_ap_start <= lcd_ap_start;
        ns_lcd_write_char <= lcd_write_char;
        ns_lcd_symbol <= lcd_symbol;
        ns_char_index <= char_index;
        ns_operation_complete <= operation_complete;
        lcd_clear_display <= '0';
        lcd_return_home <= '0';
        lcd_cursor_on <= '1';
        lcd_cursor_blink <= '1';
        lcd_cursor_apply <= '0';

        case write_state is
            when WAIT_INIT =>
                if lcd_initialized = '1' then
                    ns_write_state <= WAIT_START;
                end if;

            when WAIT_START =>
                ns_char_index <= 0;
                ns_operation_complete <= '0';
                ns_write_state <= WRITE_CHAR;

            when WRITE_CHAR =>
                if char_index < MESSAGE'length then
                    ns_lcd_symbol <= MESSAGE(char_index);
                    ns_lcd_write_char <= '1';
                    ns_lcd_ap_start <= '1';
                    ns_write_state <= WAIT2;
                else
                    ns_write_state <= FINISHED;
                end if;
                
            when WAIT1 =>
                ns_write_state <= WAIT2;
                
            when WAIT2 =>
                ns_lcd_ap_start <= '0';
                ns_write_state <= WAIT_DONE; 

            when WAIT_DONE =>
                if lcd_ap_done = '1' then
                    ns_lcd_write_char <= '0';
                    ns_write_state <= NEXT_CHAR;
                end if;

            when NEXT_CHAR =>
                ns_char_index <= char_index + 1;
                ns_write_state <= WRITE_CHAR;

            when FINISHED =>
                ns_operation_complete <= '1';

            when others =>
                ns_write_state <= WAIT_INIT;
        end case;
    end process;

    -- Status LED assignments
    o_led_init <= not lcd_initialized;
    o_led_busy <= lcd_ap_idle;
    o_led_done <= not operation_complete;

end Behavioral;

------------------------------------------------------------------------------------
---- Company: 
---- Engineer: 
---- 
---- Create Date: 05/27/2025
---- Design Name: 
---- Module Name: lcd_top - Behavioral
---- Project Name: LCD Controller Test with Display Control Commands
---- Target Devices: 
---- Tool Versions: 
---- Description: Enhanced top module demonstrating LCD controller with 
----              clear display, return home, and display control features
---- 
---- Dependencies: lcd_controller, timing_controller
---- 
---- Revision:
---- Revision 0.01 - File Created
---- Additional Comments: Demonstrates display control, clear, and home commands
---- 
------------------------------------------------------------------------------------

--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

--entity lcd_top is
--    Port (
--        i_clk           : in  std_logic;        -- System clock (100MHz)
--        i_reset         : in  std_logic;        -- Reset button (active high)
        
--        -- LCD connections
--        o_lcd_db4_7     : out std_logic_vector(3 downto 0);  -- LCD data lines
--        o_lcd_rs        : out std_logic;        -- LCD register select
--        o_lcd_rw        : out std_logic;        -- LCD read/write
--        o_lcd_e         : out std_logic;        -- LCD enable
        
--        -- Status LEDs
--        o_led_init      : out std_logic;        -- LED indicates LCD is ready
--        o_led_busy      : out std_logic;        -- LED indicates LCD is busy
--        o_led_done      : out std_logic;        -- LED indicates operation complete
--        o_led_phase     : out std_logic_vector(2 downto 0)  -- Shows current demo phase
--    );
--end lcd_top;

--architecture Behavioral of lcd_top is

--    -- LCD Controller component
--    component lcd_controller is
--      Port (
--        i_clk                     : in std_logic;
--        i_reset                   : in std_logic;
        
--        -- outputs to LCD
--        o_db4_7                   : out std_logic_vector(3 downto 0);
--        o_register_select         : out std_logic;
--        o_read_write              : out std_logic;
--        o_read_write_enable       : out std_logic;
        
--        -- GCSR
--        i_ap_start                : in std_logic;
--        o_ap_done                 : out std_logic;
--        o_ap_idle                 : out std_logic;
        
--        -- SCSR0
--        o_lcd_initialized         : out std_logic;
--        o_lcd_state               : out std_logic_vector(7 downto 0);
--        o_lcd_error_flag          : out std_logic;
        
--        -- CCR
--        o_ddram_pos_last_written  : out std_logic_vector(7 downto 0);
--        i_write_char              : in std_logic;
        
--        -- CDR
--        i_symbol_to_write         : in std_logic_vector(7 downto 0);
        
--        -- DCR
--        i_clear_display           : in std_logic;
--        i_return_home             : in std_logic;
--        i_cursor_on               : in std_logic;
--        i_cursor_blink            : in std_logic
--      );
--    end component;

--    -- Enhanced state machine for demonstration
--    type demo_state_type is (
--        WAIT_INIT,
--        WRITE_MESSAGE1,
--        WRITE_CHAR1,
--        WAIT_DONE1,
--        NEXT_CHAR1,
--        WAIT_DELAY1,
--        CURSOR_DEMO_ON,
--        WAIT_CURSOR_ON,
--        WAIT_DELAY2,
--        CURSOR_DEMO_BLINK,
--        WAIT_CURSOR_BLINK,
--        WAIT_DELAY3,
--        CURSOR_DEMO_OFF,
--        WAIT_CURSOR_OFF,
--        WAIT_DELAY4,
--        CURSOR_DEMO_FINAL_ON,
--        WAIT_CURSOR_FINAL_ON,
--        WAIT_DELAY2_FINAL,
--        CLEAR_DEMO,
--        WAIT_CLEAR,
--        WAIT_DELAY5,
--        WRITE_MESSAGE2,
--        WRITE_CHAR2,
--        WAIT_DONE2,
--        NEXT_CHAR2,
--        WAIT_DELAY6,
--        HOME_DEMO,
--        WAIT_HOME,
--        WAIT_DELAY7,
--        WRITE_MESSAGE3,
--        WRITE_CHAR3,
--        WAIT_DONE3,
--        NEXT_CHAR3,
--        DEMO_COMPLETE,
--        RESTART_DEMO
--    );
            
--    signal demo_state, ns_demo_state : demo_state_type := WAIT_INIT;
    
--    -- LCD control signals
--    signal lcd_ap_start : std_logic := '0';
--    signal lcd_write_char : std_logic := '0';
--    signal lcd_symbol : std_logic_vector(7 downto 0) := x"48";
--    signal lcd_ap_done : std_logic;
--    signal lcd_ap_idle : std_logic;
--    signal lcd_initialized : std_logic := '0';
--    signal lcd_ddram_pos_last_written : std_logic_vector(7 downto 0) := (others => '0');
--    signal lcd_state: std_logic_vector(7 downto 0);
--    signal lcd_error_flag : std_logic;
--    signal lcd_clear_display : std_logic := '0';
--    signal lcd_return_home : std_logic := '0';
--    signal lcd_cursor_on : std_logic := '0';
--    signal lcd_cursor_blink : std_logic := '0';
    
--    -- Next-state signals
--    signal ns_lcd_ap_start     : std_logic := '0';
--    signal ns_lcd_write_char   : std_logic := '0';
--    signal ns_lcd_symbol       : std_logic_vector(7 downto 0) := x"48";
--    signal ns_lcd_clear_display : std_logic := '0';
--    signal ns_lcd_return_home   : std_logic := '0';
--    signal ns_lcd_cursor_on     : std_logic := '0';
--    signal ns_lcd_cursor_blink  : std_logic := '0';
--    signal ns_char_index        : integer range 0 to 31 := 0;
--    signal ns_delay_counter     : integer range 0 to 500000000 := 0; --500000000
--    signal ns_current_phase     : std_logic_vector(2 downto 0) := "000";

--    -- Multiple messages for demonstration
--    type char_array1 is array (0 to 11) of std_logic_vector(7 downto 0);
--    constant MESSAGE1 : char_array1 := (
--        x"48",  -- 'H'
--        x"65",  -- 'e'
--        x"6C",  -- 'l'
--        x"6C",  -- 'l'
--        x"6F",  -- 'o'
--        x"20",  -- ' '
--        x"57",  -- 'W'
--        x"6F",  -- 'o'
--        x"72",  -- 'r'
--        x"6C",  -- 'l'
--        x"64",  -- 'd'
--        x"21"   -- '!'
--    );
    
--    type char_array2 is array (0 to 14) of std_logic_vector(7 downto 0);
--    constant MESSAGE2 : char_array2 := (
--        x"44",  -- 'D'
--        x"69",  -- 'i'
--        x"73",  -- 's'
--        x"70",  -- 'p'
--        x"6C",  -- 'l'
--        x"61",  -- 'a'
--        x"79",  -- 'y'
--        x"20",  -- ' '
--        x"43",  -- 'C'
--        x"6C",  -- 'l'
--        x"65",  -- 'e'
--        x"61",  -- 'a'
--        x"72",  -- 'r'
--        x"65",  -- 'e'
--        x"64"  -- 'd'
--    );
    
--    type char_array3 is array (0 to 10) of std_logic_vector(7 downto 0);
--    constant MESSAGE3 : char_array3 := (
--        x"41",  -- 'A'
--        x"74",  -- 't'
--        x"20",  -- ' '
--        x"48",  -- 'H'
--        x"6F",  -- 'o'
--        x"6D",  -- 'm'
--        x"65",  -- 'e'
--        x"20",  -- ' '
--        x"4E",  -- 'N'
--        x"6F",  -- 'o'
--        x"77"   -- 'w'
--    );
    
--    signal char_index : integer range 0 to 31 := 0;
--    signal delay_counter : integer range 0 to 500000000 := 0; --500000000
--    signal current_phase : std_logic_vector(2 downto 0) := "000";
    
--    -- Timing constants (for 100MHz clock)
--    constant DELAY_2_SEC : integer := 200000000;  -- 2 seconds 200000000
--    constant DELAY_3_SEC : integer := 300000000;  -- 3 seconds 300000000
--    constant DELAY_1_SEC : integer := 100000000;  -- 1 second 100000000

--begin
--    -- Instantiate LCD controller
--    lcd_controller_inst : lcd_controller
--        port map (
--            i_clk                        => i_clk,
--            i_reset                      => i_reset,
            
--            -- outputs to LCD
--            o_db4_7                      => o_lcd_db4_7,
--            o_register_select            => o_lcd_rs,
--            o_read_write                 => o_lcd_rw,
--            o_read_write_enable          => o_lcd_e,
            
--            -- GCSR
--            i_ap_start                   => lcd_ap_start,
--            o_ap_done                    => lcd_ap_done,
--            o_ap_idle                    => lcd_ap_idle,
            
--            -- SCSR0
--            o_lcd_initialized            => lcd_initialized,
--            o_lcd_state                  => lcd_state,
--            o_lcd_error_flag             => lcd_error_flag,
            
--            -- CCR
--            o_ddram_pos_last_written     => lcd_ddram_pos_last_written,
--            i_write_char                 => lcd_write_char,
            
--            -- CDR
--            i_symbol_to_write            => lcd_symbol,
            
--            -- DCR
--            i_clear_display              => lcd_clear_display,
--            i_return_home                => lcd_return_home,
--            i_cursor_on                  => lcd_cursor_on,
--            i_cursor_blink               => lcd_cursor_blink
--        );

--    -- Memory process to update signals
--    mem_proc: process(i_clk)
--    begin
--        if i_clk='1' and i_clk'event then
--            if i_reset = '1' then
--                lcd_ap_start <= '0';
--                lcd_write_char <= '0';
--                lcd_symbol <= x"48";
--                lcd_clear_display <= '0';
--                lcd_return_home <= '0';
--                lcd_cursor_on <= '0';
--                lcd_cursor_blink <= '0';
--                char_index <= 0;
--                delay_counter <= 0;
--                current_phase <= "111";
--                demo_state <= WAIT_INIT;
--            else
--                lcd_ap_start <= ns_lcd_ap_start;
--                lcd_write_char <= ns_lcd_write_char;
--                lcd_symbol <= ns_lcd_symbol;
--                lcd_clear_display <= ns_lcd_clear_display;
--                lcd_return_home <= ns_lcd_return_home;
--                lcd_cursor_on <= ns_lcd_cursor_on;
--                lcd_cursor_blink <= ns_lcd_cursor_blink;
--                char_index <= ns_char_index;
--                delay_counter <= ns_delay_counter;
--                current_phase <= ns_current_phase;
--                demo_state <= ns_demo_state;
--            end if;
--        end if;
--    end process;
    
--    -- Enhanced FSM logic with display control demonstrations
--    fsm_logic: process(demo_state, lcd_initialized, lcd_ap_done, char_index, delay_counter, current_phase, lcd_symbol, lcd_cursor_on, lcd_cursor_blink)
--    begin
--        -- Default assignments
--        ns_demo_state <= demo_state;
--        ns_lcd_ap_start <= '0';
--        ns_lcd_write_char <= '0';
--        ns_lcd_symbol <= lcd_symbol;
--        ns_lcd_clear_display <= '0';
--        ns_lcd_return_home <= '0';
--        ns_lcd_cursor_on <= lcd_cursor_on;
--        ns_lcd_cursor_blink <= lcd_cursor_blink;
--        ns_char_index <= char_index;
--        ns_delay_counter <= delay_counter;
--        ns_current_phase <= current_phase;

--        case demo_state is
--            when WAIT_INIT =>
--                ns_current_phase <= "111";
--                if lcd_initialized = '1' then
--                    ns_demo_state <= WRITE_MESSAGE1;
--                    ns_char_index <= 0;
--                    ns_current_phase <= "110";
--                end if;

--            -- Phase 1: Write first message
--            when WRITE_MESSAGE1 =>
--                ns_demo_state <= WRITE_CHAR1;

--            when WRITE_CHAR1 =>
--                if char_index < MESSAGE1'length then
--                    ns_lcd_symbol <= MESSAGE1(char_index);
--                    ns_lcd_write_char <= '1';
--                    ns_lcd_ap_start <= '1';
--                    ns_demo_state <= WAIT_DONE1;
--                else
--                    ns_demo_state <= WAIT_DELAY1;
--                    ns_delay_counter <= 0;
--                end if;

--            when WAIT_DONE1 =>
--                if lcd_ap_done = '1' then
--                    ns_lcd_ap_start <= '0';
--                    ns_lcd_write_char <= '0';
--                    ns_demo_state <= NEXT_CHAR1;
--                end if;

--            when NEXT_CHAR1 =>
--                ns_char_index <= char_index + 1;
--                ns_demo_state <= WRITE_CHAR1;

--            when WAIT_DELAY1 =>
--                if delay_counter < DELAY_2_SEC then
--                    ns_delay_counter <= delay_counter + 1;
--                else
--                    ns_demo_state <= CURSOR_DEMO_ON;
--                    ns_current_phase <= "101";
--                end if;

--            -- Phase 2: Cursor demonstrations
--            when CURSOR_DEMO_ON =>
--                ns_lcd_cursor_on <= '1';
--                ns_lcd_cursor_blink <= '0';
--                ns_lcd_ap_start <= '1';
--                ns_demo_state <= WAIT_CURSOR_ON;

--            when WAIT_CURSOR_ON =>
--                if lcd_ap_done = '1' then
--                    ns_lcd_ap_start <= '0';
--                    ns_demo_state <= WAIT_DELAY2;
--                    ns_delay_counter <= 0;
--                end if;

--            when WAIT_DELAY2 =>
--                if delay_counter < DELAY_2_SEC then
--                    ns_delay_counter <= delay_counter + 1;
--                else
--                    ns_demo_state <= CURSOR_DEMO_BLINK;
--                end if;

--            when CURSOR_DEMO_BLINK =>
--                ns_lcd_cursor_on <= '1';
--                ns_lcd_cursor_blink <= '1';
--                ns_lcd_ap_start <= '1';
--                ns_demo_state <= WAIT_CURSOR_BLINK;

--            when WAIT_CURSOR_BLINK =>
--                if lcd_ap_done = '1' then
--                    ns_lcd_ap_start <= '0';
--                    ns_demo_state <= WAIT_DELAY3;
--                    ns_delay_counter <= 0;
--                end if;

--            when WAIT_DELAY3 =>
--                if delay_counter < DELAY_2_SEC then
--                    ns_delay_counter <= delay_counter + 1;
--                else
--                    ns_demo_state <= CURSOR_DEMO_OFF;
--                end if;

--            when CURSOR_DEMO_OFF =>
--                ns_lcd_cursor_on <= '0';
--                ns_lcd_cursor_blink <= '0';
--                ns_lcd_ap_start <= '1';
--                ns_demo_state <= WAIT_CURSOR_OFF;

--            when WAIT_CURSOR_OFF =>
--                if lcd_ap_done = '1' then
--                    ns_lcd_ap_start <= '0';
--                    ns_demo_state <= WAIT_DELAY4;
--                    ns_delay_counter <= 0;
--                end if;

--            when WAIT_DELAY4 =>
--                if delay_counter < DELAY_1_SEC then
--                    ns_delay_counter <= delay_counter + 1;
--                else
--                    ns_demo_state <= CURSOR_DEMO_FINAL_ON;
--                    ns_current_phase <= "100";
--                end if;
                
--            when CURSOR_DEMO_FINAL_ON =>
--                ns_lcd_cursor_on <= '1';
--                ns_lcd_cursor_blink <= '1';
--                ns_lcd_ap_start <= '1';
--                ns_demo_state <= WAIT_CURSOR_FINAL_ON;

--            when WAIT_CURSOR_FINAL_ON =>
--                if lcd_ap_done = '1' then
--                    ns_lcd_ap_start <= '0';
--                    ns_demo_state <= WAIT_DELAY2_FINAL;
--                    ns_delay_counter <= 0;
--                end if;
                
--            when WAIT_DELAY2_FINAL =>
--                if delay_counter < DELAY_2_SEC then
--                    ns_delay_counter <= delay_counter + 1;
--                else
--                    ns_demo_state <= CLEAR_DEMO;
--                end if;

--            -- Phase 3: Clear display demonstration
--            when CLEAR_DEMO =>
--                ns_lcd_clear_display <= '1';
--                ns_lcd_ap_start <= '1';
--                ns_demo_state <= WAIT_CLEAR;

--            when WAIT_CLEAR =>
--                if lcd_ap_done = '1' then
--                    ns_lcd_ap_start <= '0';
--                    ns_demo_state <= WAIT_DELAY5;
--                    ns_delay_counter <= 0;
--                end if;

--            when WAIT_DELAY5 =>
--                if delay_counter < DELAY_1_SEC then
--                    ns_delay_counter <= delay_counter + 1;
--                else
--                    ns_demo_state <= WRITE_MESSAGE2;
--                    ns_char_index <= 0;
--                    ns_current_phase <= "011";
--                end if;

--            -- Phase 4: Write second message
--            when WRITE_MESSAGE2 =>
--                ns_demo_state <= WRITE_CHAR2;

--            when WRITE_CHAR2 =>
--                if char_index < MESSAGE2'length then
--                    ns_lcd_symbol <= MESSAGE2(char_index);
--                    ns_lcd_write_char <= '1';
--                    ns_lcd_ap_start <= '1';
--                    ns_demo_state <= WAIT_DONE2;
--                else
--                    ns_demo_state <= WAIT_DELAY6;
--                    ns_delay_counter <= 0;
--                end if;

--            when WAIT_DONE2 =>
--                if lcd_ap_done = '1' then
--                    ns_lcd_ap_start <= '0';
--                    ns_lcd_write_char <= '0';
--                    ns_demo_state <= NEXT_CHAR2;
--                end if;

--            when NEXT_CHAR2 =>
--                ns_char_index <= char_index + 1;
--                ns_demo_state <= WRITE_CHAR2;

--            when WAIT_DELAY6 =>
--                if delay_counter < DELAY_2_SEC then
--                    ns_delay_counter <= delay_counter + 1;
--                else
--                    ns_demo_state <= HOME_DEMO;
--                    ns_current_phase <= "010";
--                end if;

--            -- Phase 5: Return home demonstration
--            when HOME_DEMO =>
--                ns_lcd_return_home <= '1';
--                ns_lcd_ap_start <= '1';
--                ns_demo_state <= WAIT_HOME;

--            when WAIT_HOME =>
--                if lcd_ap_done = '1' then
--                    ns_lcd_ap_start <= '0';
--                    ns_demo_state <= WAIT_DELAY7;
--                    ns_delay_counter <= 0;
--                end if;

--            when WAIT_DELAY7 =>
--                if delay_counter < DELAY_1_SEC then
--                    ns_delay_counter <= delay_counter + 1;
--                else
--                    ns_demo_state <= WRITE_MESSAGE3;
--                    ns_char_index <= 0;
--                    ns_current_phase <= "001";
--                end if;

--            -- Phase 6: Write third message (overwrites from home position)
--            when WRITE_MESSAGE3 =>
--                ns_demo_state <= WRITE_CHAR3;

--            when WRITE_CHAR3 =>
--                if char_index < MESSAGE3'length then
--                    ns_lcd_symbol <= MESSAGE3(char_index);
--                    ns_lcd_write_char <= '1';
--                    ns_lcd_ap_start <= '1';
--                    ns_demo_state <= WAIT_DONE3;
--                else
--                    ns_demo_state <= DEMO_COMPLETE;
--                    ns_delay_counter <= 0;
--                end if;

--            when WAIT_DONE3 =>
--                if lcd_ap_done = '1' then
--                    ns_lcd_ap_start <= '0';
--                    ns_lcd_write_char <= '0';
--                    ns_demo_state <= NEXT_CHAR3;
--                end if;

--            when NEXT_CHAR3 =>
--                ns_char_index <= char_index + 1;
--                ns_demo_state <= WRITE_CHAR3;

--            when DEMO_COMPLETE =>
--                ns_current_phase <= "000";
--                if delay_counter < DELAY_3_SEC then
--                    ns_delay_counter <= delay_counter + 1;
--                else
--                    ns_demo_state <= RESTART_DEMO;
--                end if;

--            when RESTART_DEMO =>
----                ns_demo_state <= CLEAR_DEMO;
----                ns_char_index <= 0;
----                ns_delay_counter <= 0;
----                ns_current_phase <= "111";

--            when others =>
--                ns_demo_state <= WAIT_INIT;
--        end case;
--    end process;

--    -- Status LED assignments
--    o_led_init <= not lcd_initialized;  -- ON when initialized
--    o_led_busy <= lcd_ap_idle;  -- ON when busy
--    o_led_done <= '0' when (demo_state = DEMO_COMPLETE or demo_state = RESTART_DEMO) else '1';  -- ON when demo complete
--    o_led_phase <= current_phase;   -- Shows current phase (3-bit)

--end Behavioral;