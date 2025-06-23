----------------------------------------------------------------------------------
-- Engineers: Fabian Becker, Nicolas Koch
-- 
-- Create Date: 05/09/2025 12:38:13 PM: 
-- Module Name: baud_rate_generator - arch
-- Project Name: AS - an Axi Sonar IP
-- Target Devices: Arty A7-100
-- Description: 
--  The baudrate generator generates tick according to the configured values that will be used by the uart receiver.
--  Since the baud enable output of the UART Receiver is synchronous, the enable input will arrive with a delay of one clock cycle.
--  In order to accout for this delay, we will detect the rising edge of enable and then start the timer at 2
--
-- Verison 1.0 - File Created
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity baud_rate_generator is
    generic (
        DIVISOR : integer := 651 -- Default: 100 MHz / (9600 * 16) ≈ 651.0417
    );
    port (
        i_enable: in std_logic;
        i_clk: in std_logic;  
        i_reset: in std_logic;
        -- will be high for one clock cycle at the supplied frequency -> DIVISOR 4: [0, 0, 0, 1]
        o_tick: out std_logic
    );
end baud_rate_generator;

architecture arch of baud_rate_generator is
    -- signals that the o_tick signal should be set
    signal overflow: std_logic := '0';
    -- current value of counter -> integer in order to be configurable by generic
    signal value: integer range 0 to DIVISOR := 0;
    -- tracks the previous enable state for rising edge detection
    signal prev_enable: std_logic := '0';
begin
    CNTPROC: process (i_clk)
    begin
        if (i_clk'event and i_clk = '1') then
            if i_reset = '1' then
                overflow <= '0';
                value <= 0;
                prev_enable <= '0';
            else
                -- store previous enable state
                prev_enable <= i_enable;
                
                if i_enable = '1' then
                    overflow <= '0';
                    -- start counting from 2 on enable rising edge
                    if prev_enable = '0' then
                        value <= 2; 
                    else
                        if value = DIVISOR - 1 then
                           overflow <= '1';
                           value <= 0;
                        else 
                            value <= value + 1;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process;
    o_tick <= overflow;
end arch;              
