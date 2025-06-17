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

    -- LCD Controller component - updated to match your simplified interface
    component lcd_controller is
        Port (
            i_clk                        : in std_logic;
            i_reset                      : in std_logic;
            
            -- register input
            i_ap_start                   : in std_logic;
            i_symbol_to_write            : in std_logic_vector(7 downto 0);
            i_write_char                 : in std_logic;
            
            -- outputs to LCD
            o_db4_7                      : out std_logic_vector(3 downto 0);
            o_register_select            : out std_logic;
            o_read_write                 : out std_logic;
            o_read_write_enable          : out std_logic;
            
            -- register output
            o_ap_done                    : out std_logic;
            o_ddram_pos_last_written     : out std_logic_vector(7 downto 0);
            o_lcd_initialized            : out std_logic;
            o_lcd_busy                   : out std_logic
        );
    end component;

    -- State machine for character writing
    type write_state_type is (
        WAIT_INIT,
        WAIT_START,
        WRITE_CHAR,
        WAIT_DONE,
        NEXT_CHAR,
        FINISHED
    );
    
    signal write_state, ns_write_state : write_state_type := WAIT_INIT;
   
    
    -- LCD control signals
    signal lcd_ap_start : std_logic := '0';
    signal lcd_write_char : std_logic := '0';
    signal lcd_symbol : std_logic_vector(7 downto 0) := x"48";
    signal lcd_ap_done : std_logic;
    signal lcd_initialized : std_logic := '0';
    signal lcd_busy : std_logic;
    signal lcd_ddram_pos_last_written : std_logic_vector(7 downto 0) := (others => '0');
    
    -- Next-state signals
    signal ns_lcd_ap_start     : std_logic := '0';
    signal ns_lcd_write_char   : std_logic := '0';
    signal ns_lcd_symbol       : std_logic_vector(7 downto 0) := x"48";
    signal ns_char_index       : integer range 0 to 15 := 0;
    signal ns_operation_complete : std_logic := '0';

    -- Character sequence to write: "Hello World!"
    type char_array is array (0 to 11) of std_logic_vector(7 downto 0);
    constant MESSAGE : char_array := (
        x"61",  -- 'a'
        x"62",  -- 'b'
        x"63",  -- 'c'
        x"64",  -- 'd'
        x"65",  -- 'e'
        x"66",  -- 'f'
        x"67",  -- 'g'
        x"68",  -- 'h'
        x"69",  -- 'i'
        x"6A",  -- 'j'
        x"6B",  -- 'k'
        x"6C"  -- 'l'
--        x"6D",  -- 'm'
--        x"6E",  -- 'n'
--        x"6F",  -- 'o'
--        x"70",  -- 'p'
--        x"71",  -- 'q'
--        x"72",  -- 'r'
--        x"73",  -- 's'
--        x"74",  -- 't'
--        x"75",  -- 'u'
--        x"76",  -- 'v'
--        x"77",  -- 'w'
--        x"78"   -- 'x'
    );
    
    signal char_index : integer range 0 to 23 := 0;
    signal operation_complete : std_logic := '0';

begin
    -- Instantiate LCD controller - updated port map to match your interface
    lcd_inst : lcd_controller
        port map (
            i_clk                        => i_clk,
            i_reset                      => i_reset,
            
            -- Control signals - simplified interface
            i_ap_start                   => lcd_ap_start,
            i_symbol_to_write            => lcd_symbol,
            i_write_char                 => lcd_write_char,
            
            -- LCD interface
            o_db4_7                      => o_lcd_db4_7,
            o_register_select            => o_lcd_rs,
            o_read_write                 => o_lcd_rw,
            o_read_write_enable          => o_lcd_e,
            
            -- Status outputs
            o_ap_done                    => lcd_ap_done,
            o_ddram_pos_last_written     => lcd_ddram_pos_last_written,
            o_lcd_initialized            => lcd_initialized,
            o_lcd_busy                   => lcd_busy
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
    
    fsm_logic: process(write_state, lcd_initialized, lcd_ap_done, char_index, lcd_symbol)
    begin
        -- Default assignments
        ns_write_state <= write_state;
        ns_lcd_ap_start <= '0';
        ns_lcd_write_char <= '0';
        ns_lcd_symbol <= lcd_symbol;
        ns_char_index <= char_index;
        ns_operation_complete <= operation_complete;

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
                    ns_write_state <= WAIT_DONE;
                else
                    ns_write_state <= FINISHED;
                end if;

            when WAIT_DONE =>
                if lcd_ap_done = '1' then
                    ns_lcd_ap_start <= '0';
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
    o_led_busy <= not lcd_busy;
    o_led_done <= not operation_complete;

end Behavioral;