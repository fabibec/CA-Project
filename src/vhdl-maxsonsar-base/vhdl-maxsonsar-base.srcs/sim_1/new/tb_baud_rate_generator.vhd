----------------------------------------------------------------------------------
-- Engineers: Fabian Becker, Nicolas Koch
-- 
-- Create Date: 05/09/2025 12:38:13 PM: 
-- Module Name: tb_baud_rate_generator - sim
-- Project Name: AS - an Axi Sonar IP
-- Target Devices: Arty A7-100
-- Description: 
-- Testbench for the baud rate generator
--
-- Version 1.0 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_baud_rate_generator is
end tb_baud_rate_generator;

architecture sim of tb_baud_rate_generator is
    constant SYS_CLK: time := 10 ns ; --100MHz
    
    -- Input
    signal tb_enable: std_logic := '0';
    signal tb_reset: std_logic := '0';
    signal tb_clk: std_logic := '0';
    
    --Output
    signal tb_tick, tb_tick_expected: std_logic := '0';
  
    component baud_rate_generator is
        generic (
            DIVISOR : integer := 4
        );
        port (
            i_enable: in std_logic;
            i_clk: in std_logic;  
            i_reset: in std_logic;
            o_tick: out std_logic
        );
        end component;
    
    type testcase_type is (rst_en, div4, start_at_2);
    signal tb_testcase: testcase_type;
 
begin
    DUT: baud_rate_generator
        port map(
            i_enable => tb_enable,
            i_clk => tb_clk,
            i_reset => tb_reset,
            o_tick => tb_tick
        );
    
    -- 100 MHz Clock
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
        -- 1. Reset without enable doesn't result in ticks
        -----------------------------------------------------------------------
        tb_testcase <= rst_en;
        tb_reset <= '1', '0' after 10 ns;
        tb_enable <= '0';
        tb_tick_expected <= '0';
        wait for 100 ns;
        
        -----------------------------------------------------------------------
        -- 2. Baud tick generated every 4th clock
        -----------------------------------------------------------------------
        tb_testcase <= div4;
        tb_enable <= '1';
        
        wait for 2 * SYS_CLK;
        tb_tick_expected <= '1';
        wait for SYS_CLK;
        tb_tick_expected <= '0';
        
        wait for 3 * SYS_CLK;
        tb_tick_expected <= '1';
        wait for SYS_CLK;
        tb_tick_expected <= '0';
        
        wait for 3 * SYS_CLK;
        tb_tick_expected <= '1';
        wait for SYS_CLK;
        tb_tick_expected <= '0';
        
        wait for 3 * SYS_CLK;
        tb_tick_expected <= '1';
        wait for SYS_CLK;
        tb_tick_expected <= '0';
        tb_enable <= '0';
        
        -----------------------------------------------------------------------
        -- 3. On the first cycle the counter should start at 2
        -----------------------------------------------------------------------
        tb_testcase <= start_at_2;
        tb_reset <= '1';
        wait for SYS_CLK;
        
        -- Let counter run and stop between ticks
        tb_reset <= '0';
        tb_enable <= '1';
        wait for 2 * SYS_CLK;
        tb_enable <= '0';
        
        wait for 4 * SYS_CLK;
        tb_enable <= '1';  
        
        wait for 2 * SYS_CLK;
        tb_tick_expected <= '1';
        wait for SYS_CLK;
        tb_tick_expected <= '0';
        
        wait for 3 * SYS_CLK;
        tb_tick_expected <= '1';
        wait for SYS_CLK;
        tb_tick_expected <= '0';
        
        wait for SYS_CLK;
        tb_enable <= '0';  
      
        wait; -- Total length: 400 ns
    end process;
end sim;