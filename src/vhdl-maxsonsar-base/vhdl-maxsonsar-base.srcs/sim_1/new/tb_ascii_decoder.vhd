----------------------------------------------------------------------------------
-- Engineer: Fabian Becker
-- 
-- Create Date: 05/21/2025 20:38:14 PM: 
-- Module Name: tb_ascii_decoder - sim
-- Project Name: AS - an Axi Sonar IP
-- Target Devices: Arty A7-100
-- Description: 
-- Testbench for the ascii decoder
--
-- Version 1.0 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_ascii_decoder is 
end tb_ascii_decoder;

architecture sim of tb_ascii_decoder is

    -- used as a watchdog timer for the timeout testcases
    component baud_rate_generator is
        generic (
            DIVISOR : integer
        );
        port (
            i_enable: in std_logic;
            i_clk: in std_logic;  
            i_reset: in std_logic;
            o_tick: out std_logic
        );
    end component;

    component ascii_decoder is
        port(
        
            i_enable: in std_logic;
            i_uart_char: in unsigned(7 downto 0);
            i_uart_char_ready: in std_logic;
            i_sensor_cycle_done: in std_logic;
            i_clk: in std_logic;
            i_reset: in std_logic;            
            
            o_start: out std_logic;
            o_done: out std_logic;
            o_data: out unsigned(7 downto 0);
            
            o_error: out std_logic;
            o_error_pos: out std_logic_vector(5 downto 0);
            o_error_char: out std_logic_vector(7 downto 0);
            
            -- Debug
            o_digit: out std_logic_vector(7 downto 0);
            o_digit_ready: out std_logic;
            o_chars: out std_logic_vector(3 downto 0)
        );
    end component;

    type testcase_type is (rst_en, vld, invld_R , invld_d1, invld_d2, invld_d3, invld_cr, timeout_vld, timeout_err);
    signal tb_testcase: testcase_type;

    -- Inputs
    signal tb_enable, tb_watchdog_enable: std_logic := '0';
    signal tb_clk: std_logic := '1';
    signal tb_reset, tb_watchdog_reset: std_logic := '0';
    signal tb_uart_char: unsigned(7 downto 0) := (others => '0');
    signal tb_uart_char_ready: std_logic := '0';
    
    -- Outputs
    signal tb_start: std_logic;
    signal tb_digit, tb_digit_expected: std_logic_vector(7 downto 0);
    signal tb_digit_ready, tb_digit_ready_expected: std_logic;
    signal tb_done_expected, tb_done: std_logic;
    signal tb_data_expected, tb_data: unsigned(7 downto 0);
    signal tb_error_expected, tb_error: std_logic;
    signal tb_error_pos_expected, tb_error_pos: std_logic_vector(5 downto 0);
    signal tb_error_char_expected, tb_error_char: std_logic_vector(7 downto 0);
    signal tb_chars: std_logic_vector(3 downto 0);
    
    -- Input / Outputs
    signal tb_watchdog_done: std_logic;

    constant SYS_CLK: time := 10 ns;

begin

    WATCHDOG: component baud_rate_generator
        generic map (
            DIVISOR => 43 -- one read cycle: 20ns before first char + 5 chars * 80 ns + 10 ns buffer -> 430 ns, high after 420 ns
        )
        port map (
            i_enable => tb_watchdog_enable,
            i_clk => tb_clk,  
            i_reset => tb_watchdog_reset,
            o_tick => tb_watchdog_done
        );
        
    DUT: component ascii_decoder 
        port map (
            i_enable => tb_enable,
            i_clk => tb_clk,
            i_reset => tb_reset,
            i_uart_char => tb_uart_char,
            i_uart_char_ready => tb_uart_char_ready,
            i_sensor_cycle_done => tb_watchdog_done,
            o_start => tb_start,
            o_done => tb_done,
            o_data => tb_data,
            o_error => tb_error,
            o_error_pos => tb_error_pos,
            o_error_char => tb_error_char,
            o_chars => tb_chars,
            o_digit => tb_digit,
            o_digit_ready => tb_digit_ready
        );

    CLK_PROC: process
    begin
        while true loop
            tb_clk <= '1';
            wait for SYS_CLK / 2;
            tb_clk <= '0';
            wait for SYS_CLK / 2;
        end loop;
    end process;

    STIM_PROC: process
      variable ch: character;
    begin      
        -----------------------------------------------------------------------
        -- 1. Test Enable
        -----------------------------------------------------------------------       
        tb_testcase <= rst_en;

        -- Inits
        tb_done_expected <= '0';
        tb_data_expected <= (others => '0');
        tb_error_expected <= '0';
        tb_error_pos_expected <= (others => '0');
        tb_error_char_expected <= (others => '0');
        tb_digit_ready_expected <= '0';
        tb_digit_expected <= (others => '0');
        
        -- Initial Reset
        tb_reset <= '1';
        tb_watchdog_reset <= '1';
        wait for SYS_CLK;
        tb_reset <= '0';
        tb_watchdog_reset <= '0';
        wait for SYS_CLK;

        -- Send correct char combination but nothing should happen
        ch := 'R'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;

        ch := '1'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_digit_ready_expected <= '1';
        tb_digit_expected <= x"31"; -- ASCII 1
        tb_uart_char_ready <= '0'; 
        wait for SYS_CLK;
        tb_digit_ready_expected <= '0';
        wait for 6 * SYS_CLK;

        ch := '2'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_digit_ready_expected <= '1';
        tb_digit_expected <= x"32"; -- ASCII 2
        tb_uart_char_ready <= '0'; 
        wait for SYS_CLK;
        tb_digit_ready_expected <= '0';
        wait for 6 * SYS_CLK;
        
        ch := '3'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_digit_ready_expected <= '1';
        tb_digit_expected <= x"33"; -- ASCII 
        tb_uart_char_ready <= '0'; 
        wait for SYS_CLK;
        tb_digit_ready_expected <= '0';
        wait for 6 * SYS_CLK;

        ch := character'val(13); -- carriage return 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;
        
        -----------------------------------------------------------------------
        -- 2. Valid input: R123\r
        -----------------------------------------------------------------------
        tb_testcase <= vld;
    
        tb_enable <= '1';
        wait for 20 ns;

        ch := 'R'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;

        ch := '1'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_data_expected <= x"64"; -- 100
        tb_digit_ready_expected <= '1';
        tb_digit_expected <= x"31"; -- ASCII 1
        tb_uart_char_ready <= '0'; 
        wait for SYS_CLK;
        tb_digit_ready_expected <= '0';
        wait for 6 * SYS_CLK;

        ch := '2'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_data_expected <= x"78"; -- 120
        tb_digit_ready_expected <= '1';
        tb_digit_expected <= x"32"; -- ASCII 2
        tb_uart_char_ready <= '0'; 
        wait for SYS_CLK;
        tb_digit_ready_expected <= '0';
        wait for 6 * SYS_CLK;
        
        ch := '3'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_data_expected <= x"7B"; -- 123
        tb_digit_ready_expected <= '1';
        tb_digit_expected <= x"33"; -- ASCII 3
        tb_uart_char_ready <= '0'; 
        wait for SYS_CLK;
        tb_digit_ready_expected <= '0';
        wait for 6 * SYS_CLK;

        ch := character'val(13); 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_done_expected <= '1';
        tb_uart_char_ready <= '0';
        tb_digit_expected <= (others => '0');
        wait for SYS_CLK;
        tb_done_expected <= '0';
        tb_data_expected <= (others => '0'); 
        wait for 6 * SYS_CLK;
        
        -----------------------------------------------------------------------
        -- 3. Invalid input: R300\r
        -----------------------------------------------------------------------
        tb_testcase <= invld_d1;
        
        ch := 'R'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;

        ch := '3'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_error_expected <= '1';
        tb_error_pos_expected <= "000010";
        tb_error_char_expected <= x"33"; -- ASCII 3
        tb_digit_ready_expected <= '1';
        tb_digit_expected <= x"33"; -- ASCII 3
        tb_uart_char_ready <= '0'; 
        wait for SYS_CLK;
        tb_digit_ready_expected <= '0';
        wait for 6 * SYS_CLK;

        ch := '0'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_uart_char_ready <= '0'; 
        wait for 8 * SYS_CLK;

        ch := '0'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;

        ch := character'val(13); 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_done_expected <= '1';
        tb_uart_char_ready <= '0';
        wait for SYS_CLK;
        tb_done_expected <= '0';
        tb_error_expected <= '0';
        tb_error_pos_expected <= (others => '0');
        tb_error_char_expected <= (others => '0');
        tb_uart_char_ready <= '0'; 
        wait for 6 * SYS_CLK;
        
        -----------------------------------------------------------------------
        -- 3. Invalid input: R260\r
        -----------------------------------------------------------------------
        tb_testcase <= invld_d2;
        
        ch := 'R'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;

        ch := '2'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1';
        wait for SYS_CLK;
        tb_data_expected <= x"C8"; -- 200
        tb_digit_ready_expected <= '1';
        tb_digit_expected <= x"32"; -- ASCII 2
        tb_uart_char_ready <= '0'; 
        wait for SYS_CLK;
        tb_digit_ready_expected <= '0';
        wait for 6 * SYS_CLK;

        ch := '6'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_error_expected <= '1';
        tb_error_pos_expected <= "000100";
        tb_error_char_expected <= x"36"; -- ASCII 6
        tb_uart_char_ready <= '0'; 
        wait for 8 * SYS_CLK;

        ch := '0'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;

        ch := character'val(13); 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_done_expected <= '1';
        tb_uart_char_ready <= '0'; 
        wait for SYS_CLK;
        tb_done_expected <= '0';
        tb_data_expected <= (others => '0');
        tb_error_expected <= '0';
        tb_error_pos_expected <= (others => '0');
        tb_error_char_expected <= (others => '0');
        wait for 6 * SYS_CLK;

        -----------------------------------------------------------------------
        -- 4. Invalid input: R256\r
        -----------------------------------------------------------------------
        tb_testcase <= invld_d3;
        
        ch := 'R'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;

        ch := '2'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_data_expected <= x"C8"; -- 200
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;

        ch := '5'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_data_expected <= x"FA"; -- 250
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;

        ch := '6'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_error_expected <= '1';
        tb_error_pos_expected <= "001000";
        tb_error_char_expected <= x"36"; -- ASCII 6
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;

        ch := character'val(13); 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_done_expected <= '1';
        tb_uart_char_ready <= '0'; 
        wait for SYS_CLK;
        tb_done_expected <= '0';
        tb_data_expected <= (others => '0');
        tb_error_expected <= '0';
        tb_error_pos_expected <= (others => '0');
        tb_error_char_expected <= (others => '0');
        wait for 6 * SYS_CLK;

        -----------------------------------------------------------------------
        -- 5. Invalid start character: X123\r
        -----------------------------------------------------------------------
        tb_testcase <= invld_R;
        
        ch := 'X'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_error_expected <= '1';
        tb_error_pos_expected <= "000001";
        tb_error_char_expected <= x"52"; -- ASCII R
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;

        ch := '1'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;

        ch := '2'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_uart_char_ready <= '0'; 
        wait for 8 * SYS_CLK;

        ch := '3'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;

        ch := character'val(13); 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_done_expected <= '1';
        tb_uart_char_ready <= '0'; 
        wait for SYS_CLK;
        tb_done_expected <= '0';
        tb_data_expected <= (others => '0');
        tb_error_expected <= '0';
        tb_error_pos_expected <= (others => '0');
        tb_error_char_expected <= (others => '0');
        wait for 6 * SYS_CLK;

        -----------------------------------------------------------------------
        -- 6. Wrong end character: R123x
        -----------------------------------------------------------------------
        tb_testcase <= invld_cr;
        
        ch := 'R'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;

        ch := '1'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_data_expected <= x"64"; -- 100
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;

        ch := '2'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_data_expected <= x"78"; -- 120
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;

        ch := '3'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_data_expected <= x"7B"; -- 123
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;

        ch := 'x'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_done_expected <= '1';
        tb_error_expected <= '1';
        tb_error_pos_expected <= "010000";
        tb_error_char_expected <= x"78"; -- ASCII x
        tb_uart_char_ready <= '0';
        wait for SYS_CLK;
        tb_done_expected <= '0';
        tb_data_expected <= (others => '0');
        tb_error_expected <= '0';
        tb_error_pos_expected <= (others => '0');
        tb_error_char_expected <= (others => '0');
        wait for 6 * SYS_CLK;
        
        -----------------------------------------------------------------------
        -- 7. Timeout while in valid state: R12 -> then stops e.g. sensor is unplugged 
        -----------------------------------------------------------------------
        tb_testcase <= timeout_vld;
        tb_watchdog_enable <= '1';
        tb_enable <= '1';
        wait for 20 ns;

        ch := 'R'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;

        ch := '1'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_data_expected <= x"64"; -- 100
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;

        ch := '2'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_data_expected <= x"78"; -- 120
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;
        
        wait for 16 * SYS_CLK; -- 2 chars left (16 cycles)
        tb_done_expected <= '1';
        tb_error_expected <= '1';
        tb_error_pos_expected <= "100000";
        tb_watchdog_reset <= '1';
        tb_watchdog_enable <= '1';
        wait for SYS_CLK;
        tb_data_expected <= (others => '0');
        tb_watchdog_reset <= '0';
        tb_watchdog_enable <= '0';
        tb_done_expected <= '0';
        tb_done_expected <= '0';
        tb_error_expected <= '0';
        tb_error_pos_expected <= (others => '0');
        wait for SYS_CLK;
        
        -----------------------------------------------------------------------
        -- 8. Timeout while in error state: R3 -> then stops e.g. sensor is unplugged 
        -----------------------------------------------------------------------
        tb_testcase <= timeout_err;
        tb_watchdog_enable <= '1';
        tb_enable <= '1';
        wait for 20 ns;

        ch := 'R'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;

        ch := '3'; 
        tb_uart_char <= to_unsigned(character'pos(ch), 8);
        tb_uart_char_ready <= '1'; 
        wait for SYS_CLK;
        tb_error_expected <= '1';
        tb_error_pos_expected <= "000010";
        tb_error_char_expected <= x"33"; -- ASCII 3
        tb_uart_char_ready <= '0'; 
        wait for 7 * SYS_CLK;
        
        wait for 24 * SYS_CLK; -- 3 chars left (24 cycles) 
        tb_done_expected <= '1';
        tb_error_expected <= '1';
        tb_error_pos_expected <= "100010";
        tb_watchdog_reset <= '1';
        tb_watchdog_enable <= '1';
        wait for SYS_CLK;
        tb_watchdog_reset <= '0';
        tb_watchdog_enable <= '0';
        tb_done_expected <= '0';
        tb_done_expected <= '0';
        tb_error_expected <= '0';
        tb_error_pos_expected <= (others => '0');
        tb_error_char_expected <= (others => '0');
        
        wait; -- Total length: ~ 3750 ns
    end process;

end sim;