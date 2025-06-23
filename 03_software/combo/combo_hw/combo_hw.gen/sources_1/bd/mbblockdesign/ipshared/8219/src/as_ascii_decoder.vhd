----------------------------------------------------------------------------------
-- Engineer: Fabian Becker
-- 
-- Create Date: 05/12/2025 10:30:18 AM
-- Design Name: 
-- Module Name: ascii_decoder - arch
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

entity ascii_decoder is
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
        
        o_digit: out std_logic_vector(7 downto 0);
        o_digit_ready: out std_logic;
        
        -- Debug
        o_chars: out std_logic_vector(3 downto 0)
    );
end ascii_decoder;

architecture arch of ascii_decoder is
    type state_type is (idle, start, data1, data2, stop, error); 
    signal state, next_state: state_type;
    signal first_number_is_2_reg, first_number_is_2_next: std_logic := '0';
    
    signal error_reg, error_next: std_logic := '0';
    signal error_pos_reg, error_pos_next: std_logic_vector(5 downto 0) := (others => '0');
    signal error_char_reg, error_char_next: std_logic_vector(7 downto 0) := (others => '0');
    
    signal digit_reg, digit_next: std_logic_vector(7 downto 0) := (others => '0');
    signal digit_ready_reg, digit_ready_next: std_logic := '0';
    
    signal start_reg, start_next: std_logic := '0';
    signal done_reg, done_next: std_logic := '0';
    signal data_reg, data_next: unsigned(7 downto 0) := (others => '0');
    
    -- Counts number of chars processed (0 - 6)
    signal chars_reg, chars_next: unsigned(3 downto 0) := (others => '0'); 
    
    constant ASCII_R: unsigned(7 downto 0) := x"52";
    constant ASCII_0: unsigned(7 downto 0) := x"30";
    constant ASCII_2: unsigned(7 downto 0) := x"32";
    constant ASCII_5: unsigned(7 downto 0) := x"35";
    constant ASCII_9: unsigned(7 downto 0) := x"39";
    constant ASCII_CARRIAGE_RETURN: unsigned(7 downto 0) := x"0D";
    constant NUM_CHARS: unsigned(3 downto 0) := x"5";

begin
    NSTATEPROC: process(
        state, i_enable, i_uart_char, i_uart_char_ready, i_sensor_cycle_done, 
        chars_reg, data_reg, done_reg, error_pos_reg, first_number_is_2_reg,
        digit_reg, error_char_reg
    )
    begin
        -- Defaults
        next_state <= state;
        first_number_is_2_next <= first_number_is_2_reg;
        
        error_next <= error_reg;
        error_char_next <= error_char_reg;
        error_pos_next <= error_pos_reg;
        
        digit_ready_next <= '0';
        digit_next <= digit_reg;
        
        start_next <= '0';
        done_next <= '0';
        data_next <= data_reg;
        
        chars_next <= chars_reg;

        if i_enable = '1' then
        
            if done_reg = '1' then
                first_number_is_2_next <= '0';
                
                error_next <= '0';
                error_pos_next <= (others => '0');
                error_char_next <= (others => '0');
                
                data_next <= (others => '0');
                chars_next <= (others => '0');
                
            elsif i_sensor_cycle_done = '1' then 
                done_next <= '1';
                
                error_next <= '1';
                error_pos_next <= error_pos_reg or "100000";
                next_state <= idle;
            elsif i_uart_char_ready = '1' then
    
                case state is                   
                    when idle =>
                        if i_uart_char = ASCII_R then
                            next_state <= start;                   
                        else
                            next_state <= error;
                            error_next <= '1';
                            error_pos_next <= "000001";
                            error_char_next <= std_logic_vector(i_uart_char);
                        end if;
                        chars_next <= x"1";
                        start_next <= '1';
                    when start =>               
                        if (i_uart_char >= ASCII_0 and i_uart_char <= ASCII_2) then
                            if i_uart_char = ASCII_2 then
                                first_number_is_2_next <= '1';
                            end if;
                            
                            data_next <= resize((i_uart_char - ASCII_0) * 100, 8);
                            next_state <= data1;
                        else
                            next_state <= error;
                            error_next <= '1';
                            error_pos_next <= "000010";
                            error_char_next <= std_logic_vector(i_uart_char);
                        end if;   
                        chars_next <= chars_reg + 1;
                        digit_ready_next <= '1';
                        digit_next <= std_logic_vector(i_uart_char);
    
                    when data1 =>
                        if (
                            (first_number_is_2_reg = '0' and i_uart_char >= ASCII_0 and i_uart_char <= ASCII_9)
                            or
                            (first_number_is_2_reg = '1' and i_uart_char >= ASCII_0 and i_uart_char <= ASCII_5)
                        ) 
                        then
                            data_next <= data_reg + resize((i_uart_char - ASCII_0) * 10, 8);
                            next_state <= data2;
                        else
                            next_state <= error;
                            error_next <= '1';
                            error_pos_next <= "000100";
                            error_char_next <= std_logic_vector(i_uart_char);
                        end if;
                        chars_next <= chars_reg + 1;
                        digit_ready_next <= '1';
                        digit_next <= std_logic_vector(i_uart_char);
            
                    when data2 =>
                        if (
                            (first_number_is_2_reg = '0' and i_uart_char >= ASCII_0 and i_uart_char <= ASCII_9)
                                or
                            (first_number_is_2_reg = '1' and i_uart_char >= ASCII_0 and i_uart_char <= ASCII_5)
                        ) 
                        then
                            data_next <= data_reg + (i_uart_char - ASCII_0);
                            next_state <= stop;
                        else
                            next_state <= error;
                            error_next <= '1';
                            error_pos_next <= "001000";
                            error_char_next <= std_logic_vector(i_uart_char);
                        end if;
                        chars_next <= chars_reg + 1;
                        digit_ready_next <= '1';
                        digit_next <= std_logic_vector(i_uart_char);
    
                    when stop =>
                        if i_uart_char /= ASCII_CARRIAGE_RETURN then
                            next_state <= error;
                            error_next <= '1';
                            error_pos_next <= "010000";
                            error_char_next <= std_logic_vector(i_uart_char);
                        end if;
                        chars_next <= chars_reg + 1;
                        digit_next <= (others => '0');
                        
                        done_next <= '1';
                        next_state <= idle;
                      
                        
                    when error => 
                        if (chars_reg = (NUM_CHARS - 1)) then
                            done_next <= '1';
                            next_state <= idle;
                            first_number_is_2_next <= '0';               
                        else 
                            chars_next <= chars_reg + 1;
                        end if;
                        
                        if (chars_reg > x"0" and chars_reg <= (NUM_CHARS - 1)) then 
                            digit_ready_next <= '1';
                            digit_next <= std_logic_vector(i_uart_char);
                        else
                            digit_next <= (others => '0');
                        end if;
    
                    when others =>
                        null;    
                end case; 
            end if;
        end if;
    end process;
  
    STATEPROC: process(i_clk)
    begin
        if(i_clk'event and i_clk =  '1') then 
            if (i_reset = '1') then
                state <= idle;   
                first_number_is_2_reg <= '0'; 
                         
                error_reg <= '0';
                error_pos_reg <= (others => '0');
                error_char_reg <= (others => '0');
                
                digit_ready_reg <= '0';
                digit_reg <= (others => '0');
                
                start_reg <= '0';
                done_reg <= '0';
                data_reg <= (others => '0');
                
                chars_reg <= (others => '0');
            else 
                if i_enable = '1' then
                    state <= next_state;
                    first_number_is_2_reg <= first_number_is_2_next;
                    
                    error_reg <= error_next;
                    error_pos_reg <= error_pos_next;
                    error_char_reg <= error_char_next;
                    
                    digit_ready_reg <= digit_ready_next;
                    digit_reg <= digit_next;
                    
                    start_reg <= start_next;
                    done_reg <= done_next;
                    data_reg <= data_next;

                    chars_reg <= chars_next;
                end if;
            end if;
        end if;
    end process;

    -- Output assignments
    o_error <= error_reg;
    o_error_char <= error_char_reg;
    o_error_pos <= error_pos_reg;
    
    o_digit <= digit_reg;
    
    o_start <= start_reg;
    o_done <= done_reg;
    o_data <= data_reg;
    
    o_digit_ready <= digit_ready_reg;
    o_chars <= std_logic_vector(chars_reg);
    
end arch;
