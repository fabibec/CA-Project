----------------------------------------------------------------------------------
-- Engineers: Fabian Becker, Nicolas Koch
-- 
-- Create Date: 05/13/2025 08:34:31 AM
-- Module Name: tb_uart_receiver - arch
-- Project Name: AS - an Axi Sonar IP
-- Target Devices: Arty A7-100
-- Description: 
-- Testbench for the uart receiver
--
-- Version 1.0 - File Created
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_uart_receiver is
end tb_uart_receiver;

architecture sim of tb_uart_receiver is

    component baud_rate_generator is
        generic (
            DIVISOR : integer 
        );
        port (
            i_enable: in std_logic;
            i_clk: in std_logic;  
            i_reset: in std_logic;
            -- will be high for one clock cycle at the supplied frequency
            o_tick: out std_logic
        );
    end component;
    
    component uart_receiver
        generic (
            OVERSAMPLING_TICK_START : integer := 7;
            OVERSAMPLING_TICK_DATA  : integer := 15;
            N_DATA_BITS             : integer := 8
        );
        port(
            i_enable: in std_logic; 
            i_tick: in std_logic;
            i_rx: in std_logic;
            i_clk: in std_logic;
            i_reset: in std_logic;
            o_baud_enable: out std_logic;
            o_done: out std_logic;
            o_data: out unsigned(7 downto 0);
            o_error: out std_logic;
            o_sample: out std_logic
        );
    end component;
    
    -- Inputs
    signal tb_enable: std_logic := '1';
    signal tb_rx: std_logic := '1';
    signal tb_clk: std_logic := '1';
    signal tb_reset: std_logic := '1';
    
    -- Outputs
    signal tb_done, tb_done_expected: std_logic;
    signal tb_data, tb_data_expected: unsigned(7 downto 0);
    signal tb_error, tb_error_expected: std_logic;
    signal tb_sample: std_logic;
    
    -- Inputs / Outputs
    signal tb_baud_enable: std_logic;
    signal tb_tick: std_logic;
    
    constant SYS_CLK: time := 10 ns;
    constant TICK_PERIOD: time := 90 ns;
    constant FULL_SAMPLE_TIME: time := (TICK_PERIOD + SYS_CLK) * 16;
    constant HALF_SAMPLE_TIME: time := (TICK_PERIOD + SYS_CLK) * 8;
    
    type testcase_type is (two_vld, frame_err, all1, all0, enable);
    signal tb_testcase: testcase_type;
    
    procedure uart_send_byte(
      signal rx: out std_logic; 
      signal data_expected: inout std_logic_vector(7 downto 0);
      byte: in std_logic_vector(7 downto 0)
    ) is
    begin
        data_expected <= (others => '0');
        rx <= '0'; -- start bit
        wait for FULL_SAMPLE_TIME;

        for i in 0 to 7 loop
            rx <= byte(i);
            wait for HALF_SAMPLE_TIME + SYS_CLK;    
            data_expected <= byte(i) & data_expected(7 downto 1);       
            wait for HALF_SAMPLE_TIME - SYS_CLK;
        end loop;

        rx <= '1'; -- stop bit
        wait for HALF_SAMPLE_TIME;
    end procedure;

begin

    BR_GEN: baud_rate_generator
    generic map(
        -- 1 tick every 90 ns 
        DIVISOR => 10
    )
    port map(
        i_enable => tb_baud_enable,
        i_clk => tb_clk,
        i_reset => tb_reset,
        o_tick => tb_tick 
    );

    DUT: uart_receiver
    port map (
        i_enable => tb_enable,
        i_tick => tb_tick,
        i_rx => tb_rx,
        i_clk => tb_clk,
        i_reset => tb_reset,
        o_baud_enable => tb_baud_enable,
        o_done => tb_done,
        o_data => tb_data,
        o_error => tb_error,
        o_sample => tb_sample
    );
    
    -- Clock generation
    CLK_PROC: process
    begin
      loop
        tb_clk <= '1';
        wait for SYS_CLK/2;
        tb_clk <= '0';
        wait for SYS_CLK/2;
      end loop;     
    end process;

    -- Stimulus process
    stim_proc : process
        variable test_byte : std_logic_vector(7 downto 0);
        
    begin
        -----------------------------------------------------------------------
        -- 1. Two valid bytes 0x55 and 0xF0
        -----------------------------------------------------------------------
        tb_testcase <= two_vld;
        tb_error_expected <= '0';
        tb_done_expected <= '0';
        tb_data_expected <= (others => '0');
        wait for SYS_CLK;
        tb_reset <= '0';
        
        -- Load test byte to send (e.g. 0x55 = "01010101")
        test_byte := "01010101";

        -- Start bit
        wait for 90 ns;
        tb_rx <= '0';      
        wait for FULL_SAMPLE_TIME;

        -- Send each bit, LSB first
        tb_rx <= test_byte(0);
        -- outputs have a delay of one clock cycle
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "10000000";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        tb_rx <= test_byte(1);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "01000000";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        tb_rx <= test_byte(2);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "10100000";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        tb_rx <= test_byte(3);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "01010000";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        tb_rx <= test_byte(4);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "10101000";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        tb_rx <= test_byte(5);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "01010100";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        tb_rx <= test_byte(6);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "10101010";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        tb_rx <= test_byte(7);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "01010101";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        -- Stop bit
        tb_rx <= '1';
        wait for HALF_SAMPLE_TIME + SYS_CLK; 
        tb_done_expected <= '1';
        wait for SYS_CLK;
        tb_done_expected <= '0';

        wait for HALF_SAMPLE_TIME - 2 * SYS_CLK;
        
        -- Load test byte to send (e.g. 0xF0 = "11110000")
        test_byte := "11110000";
        
        -- Start bit
        tb_rx <= '0';
        wait for SYS_CLK; 
        tb_data_expected <= (others => '0');
        wait for FULL_SAMPLE_TIME - SYS_CLK;
        
        -- Send each bit, LSB first
        tb_rx <= test_byte(0);
        wait for FULL_SAMPLE_TIME;

        tb_rx <= test_byte(1);
        wait for FULL_SAMPLE_TIME;
        
        tb_rx <= test_byte(2);
        wait for FULL_SAMPLE_TIME;
        
        tb_rx <= test_byte(3);
        wait for FULL_SAMPLE_TIME;
        
        tb_rx <= test_byte(4);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "10000000";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        tb_rx <= test_byte(5);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "11000000";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        tb_rx <= test_byte(6);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "11100000";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        tb_rx <= test_byte(7);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "11110000";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        -- Stop bit
        tb_rx <= '1';
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_done_expected <= '1';
        wait for SYS_CLK;
        tb_done_expected <= '0';
        
        wait for HALF_SAMPLE_TIME - 2 * SYS_CLK;
        
        -----------------------------------------------------------------------
        -- 2. Stop bit not received -> frame error, send "11110000" and then another 0
        -----------------------------------------------------------------------
        tb_testcase <= frame_err;
        
        -- Start bit
        tb_rx <= '0';
        wait for SYS_CLK; 
        tb_data_expected <= (others => '0');
        wait for FULL_SAMPLE_TIME - SYS_CLK;
        
        -- Send each bit, LSB first
        tb_rx <= test_byte(0);
        wait for FULL_SAMPLE_TIME;

        tb_rx <= test_byte(1);
        wait for FULL_SAMPLE_TIME;
        
        tb_rx <= test_byte(2);
        wait for FULL_SAMPLE_TIME;
        
        tb_rx <= test_byte(3);
        wait for FULL_SAMPLE_TIME;
        
        tb_rx <= test_byte(4);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "10000000";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        tb_rx <= test_byte(5);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "11000000";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        tb_rx <= test_byte(6);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "11100000";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        tb_rx <= test_byte(7);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "11110000";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        -- Stop bit <- do not send properly
        tb_rx <= '0';
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_rx <= '1';
        tb_error_expected <= '1';
        tb_done_expected <= '1';
        wait for SYS_CLK;
        tb_error_expected <= '0';
        tb_done_expected <= '0';
        
        wait for HALF_SAMPLE_TIME - 2 * SYS_CLK;
        -- End simulation
        
        -----------------------------------------------------------------------
        -- 3. Send 0x00
        -----------------------------------------------------------------------
        tb_testcase <= all0;
        -- Load test byte to send (e.g. 0x00 = "00000000")
        test_byte := (others => '0');
        
        -- Start bit
        tb_rx <= '0';
        wait for SYS_CLK; 
        tb_data_expected <= (others => '0');
        wait for FULL_SAMPLE_TIME - SYS_CLK;
        
        -- Send each bit, LSB first
        tb_rx <= test_byte(0);
        wait for FULL_SAMPLE_TIME;

        tb_rx <= test_byte(1);
        wait for FULL_SAMPLE_TIME;
        
        tb_rx <= test_byte(2);
        wait for FULL_SAMPLE_TIME;
        
        tb_rx <= test_byte(3);
        wait for FULL_SAMPLE_TIME;
        
        tb_rx <= test_byte(4);
        wait for FULL_SAMPLE_TIME;
        
        tb_rx <= test_byte(5);
        wait for FULL_SAMPLE_TIME;
        
        tb_rx <= test_byte(6);
        wait for FULL_SAMPLE_TIME;
        
        tb_rx <= test_byte(7);
        wait for FULL_SAMPLE_TIME;
        
        -- Stop bit
        tb_rx <= '1';
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_done_expected <= '1';
        wait for SYS_CLK;
        tb_done_expected <= '0';
        
        wait for HALF_SAMPLE_TIME - 2 * SYS_CLK;
        
        -----------------------------------------------------------------------
        -- 4. Send 0x11
        -----------------------------------------------------------------------
        tb_testcase <= all1;
        -- Load test byte to send (e.g. 0xFF = "11111111")
        test_byte := (others => '1');
        
        -- Start bit
        tb_rx <= '0';
        wait for SYS_CLK; 
        tb_data_expected <= (others => '0');
        wait for FULL_SAMPLE_TIME - SYS_CLK;
        
        -- Send each bit, LSB first
        tb_rx <= test_byte(0);
        -- outputs have a delay of one clock cycle
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "10000000";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        tb_rx <= test_byte(1);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "11000000";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        tb_rx <= test_byte(2);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "11100000";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        tb_rx <= test_byte(3);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "11110000";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        tb_rx <= test_byte(4);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "11111000";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        tb_rx <= test_byte(5);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "11111100";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        tb_rx <= test_byte(6);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "11111110";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        tb_rx <= test_byte(7);
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_data_expected <= "11111111";
        wait for HALF_SAMPLE_TIME - SYS_CLK;
        
        -- Stop bit
        tb_rx <= '1';
        wait for HALF_SAMPLE_TIME + SYS_CLK;
        tb_done_expected <= '1';
        wait for SYS_CLK;
        tb_done_expected <= '0';
        
        wait for HALF_SAMPLE_TIME - 2 * SYS_CLK;
        
        wait; -- Total length: ~ 80 us
    end process;

end sim;

