----------------------------------------------------------------------------------
-- Engineer: Nicolas Koch
-- 
-- Create Date: 05/24/2025 08:21:10 PM
-- Module Name: tb_setup_timer - Behavioral
-- Project Name: AS - an Axi Sonar IP
-- Target Devices: Arty A7-100
-- Description: 
-- Testbench for the control timer
-- 
-- Version 1.0 - File Created
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_control_timer is
end tb_control_timer;

architecture sim of tb_control_timer is
    constant SYS_CLK: time := 10 ns; -- 100MHz
    
    -- Input signals
    signal tb_clk : std_logic := '0';
    signal tb_reset : std_logic := '1';
    signal tb_enable: std_logic := '1';
    signal tb_reset_timer: std_logic;
    
    -- Output signals
    signal tb_done, tb_done_expected : std_logic := '0';
    signal tb_powerup_done, tb_powerup_done_expected : std_logic := '0';
    signal tb_config_done, tb_config_done_expected : std_logic := '0';
    signal tb_init_done, tb_init_done_expected : std_logic := '0';
    -- Component declaration
    component control_timer is
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
            o_done : out std_logic;
            o_powerup_done : out std_logic;
            o_config_done : out std_logic;
            o_init_done : out std_logic
        
        );
    end component;
    
    -- Test constants (reduced for simulation)
    constant tb_divisor : integer := 100;
    constant tb_power_up_time : integer := 25;
    constant tb_calibration_time : integer := 10;
    constant tb_first_reading_time : integer := 5;
    constant tb_range_reading_time : integer := 5;
    constant TICK_1MS : time := tb_divisor * SYS_CLK;
    constant FIRST_READING_TIME_TOTAL : time := (tb_power_up_time + tb_calibration_time + tb_first_reading_time) * TICK_1MS; -- first reading takes powerup + calibration + first reading time
    constant NORMAL_CLOCK_CYCLE_WAIT : time := (tb_range_reading_time * TICK_1MS - SYS_CLK); -- normal reading cycle - 1 SYS_CLK
    
    type testcase_type is (reset_test, powerup_test, config_test, first_done_test, normal_cycles, disable_test, reset_timer_test);
    signal tb_testcase: testcase_type;
    
begin
    DUT: control_timer
        generic map (
            MS_DIVISOR => tb_divisor,
            POWER_UP_TIME => tb_power_up_time,
            FIRST_READING_TIME => tb_first_reading_time,
            CALIBRATION_TIME => tb_calibration_time,
            RANGE_READING_TIME => tb_range_reading_time
        )
        port map (
            i_clk => tb_clk,
            i_reset => tb_reset,
            i_enable => tb_enable,
            i_reset_timer => tb_reset_timer,
            o_done => tb_done,
            o_powerup_done => tb_powerup_done,
            o_config_done => tb_config_done,
            o_init_done => tb_init_done
            
        );
    
    process
    begin
        tb_clk <= '1';
        wait for SYS_CLK/2;
        tb_clk <= '0';
        wait for SYS_CLK/2;
    end process;
    
    process
    begin
        -----------------------------------------------------------------------
        -- 1. Reset test - no done pulses during reset
        -----------------------------------------------------------------------
        tb_testcase <= reset_test;
        tb_reset <= '1', '0' after 10 ns;
        tb_done_expected <= '0';
        wait for SYS_CLK;
        
        -----------------------------------------------------------------------
        -- 2. First done pulse test - should come after full sequence
        -- Power-up + Calibration + First_reading 
        -----------------------------------------------------------------------
        tb_testcase <= first_done_test;
        tb_reset <= '1';
        wait for SYS_CLK;
        tb_reset <= '0';
        wait for FIRST_READING_TIME_TOTAL;
        tb_done_expected <= '1';
        wait for SYS_CLK;
        tb_done_expected <= '0';
        
        -----------------------------------------------------------------------
        -- 3. Normal cycles 
        -----------------------------------------------------------------------
        tb_testcase <= normal_cycles;
        wait for NORMAL_CLOCK_CYCLE_WAIT;
        tb_done_expected <= '1';
        wait for SYS_CLK;
        tb_done_expected <= '0';
        wait for NORMAL_CLOCK_CYCLE_WAIT;
        tb_done_expected <= '1';
        wait for SYS_CLK;
        tb_done_expected <= '0';
        wait for NORMAL_CLOCK_CYCLE_WAIT;
        tb_done_expected <= '1';
        wait for SYS_CLK;
        tb_done_expected <= '0';
        
        wait for 200 ns; -- buffer to next test case
        
        
        -----------------------------------------------------------------------
        -- 4. Disable test - Freezing states
        -----------------------------------------------------------------------
        tb_testcase <= disable_test;
        tb_enable <= '0';
        tb_done_expected <= '0';
        wait for NORMAL_CLOCK_CYCLE_WAIT;
        
        wait; -- Total length with current simulation settings ~ 65 us (last 10 us nothing should happen because of disable test)
              -- Total length with actual real world settings ~ 600 ms (last 49 ms nothing should happen because of disable test)
    end process;
    
end sim;