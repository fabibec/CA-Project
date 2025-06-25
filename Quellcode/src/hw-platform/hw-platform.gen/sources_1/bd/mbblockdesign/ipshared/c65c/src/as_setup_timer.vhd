----------------------------------------------------------------------------------
-- Engineer: Nicolas Koch
-- 
-- Create Date: 05/22/2025 03:08:36 PM
-- Module Name: as_setup_timer - arch
-- Project Name: AS - an Axi Sonar IP
-- Target Device: Arty A7-100
-- 
-- Description: 
-- The control timer generates timed control signals for the sonar sequence.
-- It steps through power-up, calibration, first reading, and normal reading states.
-- Each stage has a predefined duration in milliseconds.

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity control_timer is
    generic (
        MS_DIVISOR : integer := 100_000; -- 1 ms @ 100 MHz
        POWER_UP_TIME : integer := 250; -- 250 ms power-up delay
        FIRST_READING_TIME : integer := 100; -- 100 ms first reading delay
        CALIBRATION_TIME : integer := 49; -- 49 ms calibration cycle
        RANGE_READING_TIME : integer := 49 -- 49 ms range reading time
    );
    port (
        i_clk : in std_logic;
        i_reset : in std_logic;
        i_enable: in std_logic; 
        i_reset_timer: in std_logic;
        o_done : out std_logic := '0';
        o_powerup_done : out std_logic := '0';
        o_config_done : out std_logic := '0';
        o_init_done : out std_logic := '0'
        
    );
end control_timer;

architecture arch of control_timer is
    type state_type is (POWER_UP, CALIBRATION, FIRST_READING, NORMAL_READING);
    signal state : state_type := POWER_UP;
    signal next_state : state_type;
    
    signal clk_counter : integer range 0 to MS_DIVISOR-1 := 0;
    signal ms_counter : integer := 0;
    signal ms_target : integer := POWER_UP_TIME;
    
    signal clk_counter_next : integer range 0 to MS_DIVISOR-1 := 0;
    signal ms_counter_next : integer := 0;
    signal ms_target_next : integer := POWER_UP_TIME;
    signal done_next : std_logic := '0';
    
    signal powerup_done_reg   : std_logic := '0';
    signal config_done_reg    : std_logic := '0';
    signal init_done_reg      : std_logic := '0';
    
begin
    NSTATEPROC: process(state, i_enable, i_reset, i_reset_timer, clk_counter, ms_counter, ms_target)
    begin
        -- Defaults
        next_state <= state;
        clk_counter_next <= clk_counter;
        ms_counter_next <= ms_counter;
        ms_target_next <= ms_target;
        done_next <= '0';
            
        if (i_enable = '1' and i_reset_timer = '0') then
            -- Counting system clock cycles (1 ms resolution)
            if clk_counter < MS_DIVISOR - 1 then
                clk_counter_next <= clk_counter + 1;
            -- 1 ms - clock_cycle passed 
            else
                clk_counter_next <= 0;

                if ms_counter < ms_target - 1 then
                    ms_counter_next <= ms_counter + 1;
                -- current timer target reached
                else
                    ms_counter_next <= 0;
                
                    -- State machine for sonar timing sequence
                    case state is
                        when POWER_UP =>
                            -- After 250ms power-up, start calibration
                            next_state <= CALIBRATION;
                            ms_target_next <= CALIBRATION_TIME;
                            
                        when CALIBRATION =>
                            -- After 49ms calibration, start first reading extra delay
                            next_state <= FIRST_READING;
                            ms_target_next <= FIRST_READING_TIME;
                            
                        when FIRST_READING =>
                            -- After additional 100ms, first reading is ready
                            next_state <= NORMAL_READING;
                            ms_target_next <= RANGE_READING_TIME;
                            done_next <= '1'; -- First reading ready
                            
                        when NORMAL_READING =>
                            -- Every 49ms after first reading
                            done_next <= '1'; -- Subsequent readings ready
                            -- Stay in this state, keep repeating 49ms cycles
                    end case;
                end if;
            end if;
        end if;
    end process;
    
    STATEPROC: process(i_clk)
    begin
        if (i_clk'event and i_clk = '1') then
            if i_reset = '1' then
                clk_counter <= 0;
                ms_counter <= 0;
                o_done <= '0';
                state <= POWER_UP;
                ms_target <= POWER_UP_TIME;
                powerup_done_reg <= '0';
                config_done_reg <= '0';
                init_done_reg <= '0';
            elsif i_enable = '1' then
                -- ASCII Decoder done before timer runs out -> good
                if i_reset_timer = '1' then
                    clk_counter <= 0;
                    ms_counter <= 0;
                    o_done <= '0'; 
                    
                    -- force move into the next reading state
                    if state = FIRST_READING then
                        state <= NORMAL_READING;
                        ms_target <= RANGE_READING_TIME;
                        init_done_reg <= '1';
                    end if;
                else
                    state <= next_state;
                    clk_counter <= clk_counter_next;
                    ms_counter <= ms_counter_next;
                    ms_target <= ms_target_next;
                    o_done <= done_next;
                    
                    -- Latch flags once they're set
                    if next_state = CALIBRATION and state = POWER_UP then
                        powerup_done_reg <= '1';
                    end if;
        
                    if next_state = FIRST_READING and state = CALIBRATION then
                        config_done_reg <= '1';
                    end if;
        
                    if next_state = NORMAL_READING and state = FIRST_READING then
                        init_done_reg <= '1';
                    end if;
                end if;
            end if;
        end if;
    end process;
    
    o_powerup_done <= powerup_done_reg;
    o_config_done  <= config_done_reg;
    o_init_done    <= init_done_reg;
end arch;