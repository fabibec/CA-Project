----------------------------------------------------------------------------------
-- Engineers: Fabian Becker, Nicolas Koch
-- 
-- Create Date: 05/27/2025 08:54:58 PM
-- Module Name: tb_as_core - sim
-- Project Name: AS - an Axi Sonar IP
-- Target Devices: Arty A7-100
-- Description: 
-- Testbench for the as core
-- 
-- Version 1.0 - File Created
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_as_core is
end tb_as_core;

architecture sim of tb_as_core is

    component as_core is
    generic (
        UART_BAUDRATE_DIVISOR: integer;
        UART_NUM_DATA_BITS: integer;
        CONTROL_MS_DIVISOR: integer;
        CONTROL_POWER_UP_TIME : integer;
        CONTROL_FIRST_READING_TIME : integer;
        CONTROL_CALIBRATION_TIME : integer;
        CONTROL_RANGE_READING_TIME : integer
    );
    port ( 
        -- AXI 
        i_clk: in std_logic;
        i_reset: in std_logic;
        
        -- GCSR
        i_ap_start: in std_logic;
        o_ap_idle: out std_logic; -- async, register when ad_done -> 1, on i_ap_start or reset or restart = 0 
        o_ap_done: out std_logic; -- ad_done    
        i_auto_restart: in std_logic; 
        
        -- SCSR0
        o_powerup_done: out std_logic;
        o_calib_done: out std_logic;
        o_read_valid: out std_logic; -- no ad_error, uart can be ignored, updated/set on done
        i_reset_ip: in std_logic; 
        i_freeze_ip: in std_logic;
 
        -- DIST0
        o_dist_in: out std_logic_vector(7 downto 0); -- ad_data, updated/set on done
        o_dist_char_1: out std_logic_vector(7 downto 0); -- ad_char 1
        o_dist_char_2: out std_logic_vector(7 downto 0); -- ad_char 2 
        o_dist_char_3: out std_logic_vector(7 downto 0);
 
       -- UCSR Signals
       o_ur_error: out std_logic; -- ur_error, updated async, 1 if at least on error occured during current measurement reading, cleared on start 
       o_ur_data: out std_logic_vector(7 downto 0); -- ur_data, updated async, cleared on start
 
       -- ADSR Signals
       o_ad_error: out std_logic; -- ad_error, updated/set on done
       o_ad_err_pos: out std_logic_vector(5 downto 0); -- ad_err_pos, updated/set on done
       o_ad_err_char: out std_logic_vector(7 downto 0); -- ad_err_char, updated/set on done
       
       -- I/Os
       i_rx: in std_logic;
       o_tx: out std_logic
    );
    end component;
    
    signal tb_clk: std_logic := '1';
    signal tb_reset: std_logic := '1';
    
    signal tb_ap_start: std_logic := '0';
    signal tb_ap_idle, tb_ap_idle_expected: std_logic; -- async, register when ad_done -> 1, on i_ap_start or reset or restart = 0 
    signal tb_ap_done, tb_ap_done_expected: std_logic; -- ad_done    
    signal tb_auto_restart: std_logic := '0'; 
    
    signal tb_powerup_done, tb_powerup_done_expected: std_logic;
    signal tb_calib_done, tb_calib_done_expected: std_logic;
    signal tb_read_valid, tb_read_valid_expected: std_logic; -- no ad_error, uart can be ignored, updated/set on done, just displays if registers are stable
    signal tb_reset_ip: std_logic := '0'; 
    signal tb_freeze_ip: std_logic := '0';

    signal tb_dist_in, tb_dist_in_expected: std_logic_vector(7 downto 0); -- ad_data, updated/set on done
    signal tb_dist_char_1, tb_dist_char_1_expected: std_logic_vector(7 downto 0); -- ad_char 1
    signal tb_dist_char_2, tb_dist_char_2_expected: std_logic_vector(7 downto 0); -- ad_char 2 
    signal tb_dist_char_3, tb_dist_char_3_expected: std_logic_vector(7 downto 0);

    -- UCSR Signals
    signal tb_ur_error, tb_ur_error_expected: std_logic; -- ur_error, updated async, 1 if at least on error occured during current measurement reading, cleared on start 
    signal tb_ur_data, tb_ur_data_expected: std_logic_vector(7 downto 0); -- ur_data, updated async, cleared on start

    -- ADSR Signals
    signal tb_ad_error, tb_ad_error_expected: std_logic; -- ad_error, updated/set on done
    signal tb_ad_err_pos, tb_ad_err_pos_expected: std_logic_vector(5 downto 0); -- ad_err_pos, updated/set on done
    signal tb_ad_err_char, tb_ad_err_char_expected: std_logic_vector(7 downto 0); -- ad_err_char, updated/set on done
   
    -- I/Os
    signal tb_rx: std_logic := '1';
    signal tb_tx, tb_tx_expected: std_logic;
    
    constant SYS_CLK: time := 10 ns;
    constant UART_TICK_PERIOD: time := 30 ns;
    constant UART_FULL_SAMPLE_TIME: time := (UART_TICK_PERIOD + SYS_CLK) * 16;
    constant UART_HALF_SAMPLE_TIME: time := (UART_TICK_PERIOD + SYS_CLK) * 8;
    
    type testcase_type is (
        two_vld_init_man, 
        two_vld_init_auto, 
        two_vld_auto_first_timeout, 
        vld_ad_err_auto_second_timeout,
        vld_ad_err_auto,
        ad_err_vld_auto,
        ur_err_auto,
        vld_freeze,
        init_vld_reset_init_vld
    );
    signal tb_testcase: testcase_type;
    
    procedure uart_send_byte(
      signal rx: out std_logic; 
      signal ur_data_expected: inout std_logic_vector(7 downto 0);
      byte: in std_logic_vector(7 downto 0)
    ) is
    begin
        rx <= '0'; -- start bit
        wait for SYS_CLK;
        ur_data_expected <= (others => '0');
        wait for UART_FULL_SAMPLE_TIME - SYS_CLK;

        for i in 0 to 7 loop
            rx <= byte(i);
            wait for UART_HALF_SAMPLE_TIME + SYS_CLK;    
            ur_data_expected <= byte(i) & ur_data_expected(7 downto 1);       
            wait for UART_HALF_SAMPLE_TIME - SYS_CLK;
        end loop;

        rx <= '1'; -- stop bit
        wait for UART_HALF_SAMPLE_TIME;
    end procedure;

begin

    --Instantiation of Sonar IP Core
    DUT: as_core
    generic map (
        UART_BAUDRATE_DIVISOR => 4, -- 40ns/tick * 16 oversampling * 10 bits (8 data + start + end) * 5 -> 32 us
        UART_NUM_DATA_BITS => 8,
        CONTROL_MS_DIVISOR => 100, -- @ 100 MHz -> 1 us 
        CONTROL_POWER_UP_TIME => 3, -- 3 us power-up delay
        CONTROL_CALIBRATION_TIME => 2, -- 2 us calibration time
        CONTROL_FIRST_READING_TIME => 35, -- 2 us idle, 32 us reading, 1 us timing buffer
        CONTROL_RANGE_READING_TIME => 34 -- 1 us idle, 32 us reading, 1 us timing buffer
    )
    port map ( 
        -- AXI 
        i_clk => tb_clk,
        i_reset => tb_reset,
        
        -- GCSR
        i_ap_start => tb_ap_start,
        o_ap_idle => tb_ap_idle, -- async, register when ad_done -> 1, on i_ap_start or reset or restart = 0 
        o_ap_done => tb_ap_done, -- ad_done    
        i_auto_restart => tb_auto_restart,
        
        -- SCSR0
        o_powerup_done => tb_powerup_done,
        o_calib_done => tb_calib_done,
        o_read_valid => tb_read_valid, -- no ad_error, uart can be ignored, updated/set on done
        i_reset_ip => tb_reset_ip,
        i_freeze_ip => tb_freeze_ip,
 
        -- DIST0
        o_dist_in => tb_dist_in, -- ad_data, updated/set on done
        o_dist_char_1 => tb_dist_char_1, -- ad_char 1
        o_dist_char_2 => tb_dist_char_2, -- ad_char 2 
        o_dist_char_3 => tb_dist_char_3,
 
       -- UCSR Signals
       o_ur_error => tb_ur_error, -- ur_error, updated async, 1 if at least on error occured during current measurement reading, cleared on start 
       o_ur_data => tb_ur_data, -- ur_data, updated async, cleared on start
 
       -- ADSR Signals
       o_ad_error => tb_ad_error, -- ad_error, updated/set on done
       o_ad_err_pos => tb_ad_err_pos, -- ad_err_pos, updated/set on done
       o_ad_err_char => tb_ad_err_char, -- ad_err_char, updated/set on done
       
       -- I/Os
       i_rx => tb_rx,
       o_tx => tb_tx
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
    
    stim_proc : process
      variable uart_byte: std_logic_vector(7 downto 0);
    begin
        -- Inits
        tb_ap_idle_expected <= '0';
        tb_ap_done_expected <= '0';
        
        tb_powerup_done_expected <= '0';
        tb_calib_done_expected <= '0';
        
        tb_read_valid_expected <= '0';
        tb_dist_in_expected <= (others => '0');
        tb_dist_char_1_expected <= (others => '0');
        tb_dist_char_2_expected <= (others => '0');
        tb_dist_char_3_expected <= (others => '0');
        
        tb_ur_error_expected <= '0';
        tb_ur_data_expected <= (others => '0');
        
        tb_ad_error_expected <= '0';
        tb_ad_err_pos_expected <= (others => '0');
        tb_ad_err_char_expected <= (others => '0');
        
        tb_tx_expected <= '0';
        -----------------------------------------------------------------------
        -- 1. Two valid reads, with manual restart, first one with init delays
        -----------------------------------------------------------------------
        -- Reset
        tb_testcase <= two_vld_init_man;
        tb_reset <= '1';
        wait for SYS_CLK;
        tb_tx_expected <= '1';
        tb_reset <= '0';
        
        -- Start the IP
        tb_ap_start <= '1';   
        
        -- Wait for powerup
        wait for 3 us + SYS_CLK;
        tb_powerup_done_expected <= '1';
        
        -- Wait for calibration
        wait for 2 us + SYS_CLK;
        tb_calib_done_expected <= '1';
        
        -- Now we have FIRST_READING
        wait for 2 us;
        
        -- Send 'R123\r' on UART
        uart_byte := x"52"; -- R
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for UART_HALF_SAMPLE_TIME;
        
        uart_byte := x"31"; -- 1
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"64";
        wait for SYS_CLK;
        tb_dist_char_1_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);

        uart_byte := x"32"; -- 2 
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"78";
        wait for SYS_CLK;
        tb_dist_char_2_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        uart_byte := x"33"; -- 3
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"7B";
        wait for SYS_CLK;
        tb_dist_char_3_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        uart_byte := x"0D"; -- \r
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_ap_done_expected <= '1';
        wait for SYS_CLK;
        tb_read_valid_expected <= '1';
        
        -- Resets
        -- axi interface will clear ap_start automaticly when ap_done is asserted
        -- here we need to do it manually 
        tb_tx_expected <= '0';
        tb_ap_idle_expected <= '1';
        tb_ap_start <= '0';
        tb_ap_done_expected <= '0';

        
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);

        
        -- Send second read
        
        -- Start the IP
        tb_ap_start <= '1';   
        tb_tx_expected <= '1';
        tb_ap_idle_expected <= '0';
        
        -- Now we have RANGE_READING
        wait for 1 us;
        
        -- RESETS ONLY IF UPDATE_WINDOW == 1 --
        tb_read_valid_expected <= '0' after 6.11 us; 
        tb_dist_in_expected <= (others => '0') after 6.11 us;
        tb_dist_char_1_expected <= (others => '0') after 6.11 us;
        tb_dist_char_2_expected <= (others => '0') after 6.11 us;
        tb_dist_char_3_expected <= (others => '0') after 6.11 us;
        -- Send 'R255\r' on UART
        
        uart_byte := x"52"; -- R
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);

        wait for UART_HALF_SAMPLE_TIME;

        
        
        uart_byte := x"32"; -- 2
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 *SYS_CLK;
        tb_dist_in_expected <= x"C8";
        wait for SYS_CLK;
        tb_dist_char_1_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);

        uart_byte := x"35"; -- 5 
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"FA";
        wait for SYS_CLK;
        tb_dist_char_2_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        uart_byte := x"35"; -- 5
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"FF";
        wait for SYS_CLK;
        tb_dist_char_3_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK); 
        
        uart_byte := x"0D"; -- \r
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_ap_done_expected <= '1';
        wait for SYS_CLK;
        tb_read_valid_expected <= '1';
        -- Resets
        -- axi interface will clear ap_start automaticly when ap_done is asserted
        -- here we need to do it manually 
        tb_tx_expected <= '0';
        tb_ap_idle_expected <= '1';
        tb_ap_done_expected <= '0';
        tb_ap_start <= '0';
        
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        -----------------------------------------------------------------------
        -- 2. Two valid reads, with auto restart, first one with init delays
        -----------------------------------------------------------------------
        tb_testcase <= two_vld_init_auto;

        -- Reset
        tb_reset <= '1';
        wait for SYS_CLK;
        
        tb_read_valid_expected <= '0'; 
        tb_dist_in_expected <= (others => '0');
        tb_dist_char_1_expected <= (others => '0');
        tb_dist_char_2_expected <= (others => '0');
        tb_dist_char_3_expected <= (others => '0');
        
        tb_tx_expected <= '1';
        tb_powerup_done_expected <= '0';
        tb_calib_done_expected <= '0';
        tb_ur_data_expected <= (others => '0');
        tb_reset <= '0';
        
        -- Start the IP
        tb_ap_start <= '1';
        tb_auto_restart <= '1';   
        tb_ap_idle_expected <= '0';
        
        -- Wait for powerup
        wait for 3 us + SYS_CLK;
        tb_powerup_done_expected <= '1';
        
        -- Wait for calibration
        wait for 2 us + SYS_CLK;
        tb_calib_done_expected <= '1';
        
        -- Now we have FIRST_READING
        wait for 2 us;
        
        -- Send 'R000\r' on UART
        uart_byte := x"52"; -- R
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for UART_HALF_SAMPLE_TIME;
        
        uart_byte := x"30"; -- 0
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"00";
        wait for SYS_CLK;
        tb_dist_char_1_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);

        uart_byte := x"30"; -- 0
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"00";
        wait for SYS_CLK;
        tb_dist_char_2_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        uart_byte := x"30"; -- 0
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"00";
        wait for SYS_CLK;
        tb_dist_char_3_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        uart_byte := x"0D"; -- \r
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        
        tb_ap_done_expected <= '1';
        wait for SYS_CLK;
        -- Resets
        -- axi interface will clear ap_start automaticly when ap_done is asserted
        -- here we need to do it manually 
        tb_ap_done_expected <= '0';
        
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        tb_read_valid_expected <= '1';
        -- Send second read
        
        -- Now we have RANGE_READING
        wait for 1 us;
        
        -- RESETS ONLY IF UPDATE_WINDOW == 1 --
        tb_read_valid_expected <= '0' after 6.11 us; 
        tb_dist_in_expected <= (others => '0') after 6.11 us;
        tb_dist_char_1_expected <= (others => '0') after 6.11 us;
        tb_dist_char_2_expected <= (others => '0') after 6.11 us;
        tb_dist_char_3_expected <= (others => '0') after 6.11 us;
        
        -- Send 'R255\r' on UART
        
        uart_byte := x"52"; -- R
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for UART_HALF_SAMPLE_TIME;
        
        uart_byte := x"32"; -- 2
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 *SYS_CLK;
        tb_dist_in_expected <= x"C8";
        wait for SYS_CLK;
        tb_dist_char_1_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);

        uart_byte := x"35"; -- 5 
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"FA";
        wait for SYS_CLK;
        tb_dist_char_2_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        uart_byte := x"35"; -- 5
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"FF";
        wait for SYS_CLK;
        tb_dist_char_3_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK); 
        
        uart_byte := x"0D"; -- \r
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        
        tb_auto_restart <= '0';
        tb_ap_done_expected <= '1';
        
        wait for SYS_CLK;
        tb_read_valid_expected <= '1';
        -- Resets
        -- axi interface will clear ap_start automaticly when ap_done is asserted
        -- here we need to do it manually 
        tb_ap_start <= '0';
        tb_tx_expected <= '0';
        tb_ap_idle_expected <= '1';   
        tb_ap_done_expected <= '0';

        
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);

        -----------------------------------------------------------------------
        -- 3. Two valid reads, with auto restart, first one with init delays, first one will timeout
        -----------------------------------------------------------------------
        tb_testcase <= two_vld_auto_first_timeout;

        -- Reset
        tb_reset <= '1';
        wait for SYS_CLK;
        tb_read_valid_expected <= '0';
        tb_dist_in_expected <= (others => '0');
        tb_dist_char_1_expected <= (others => '0');
        tb_dist_char_2_expected <= (others => '0');
        tb_dist_char_3_expected <= (others => '0');
        
        tb_powerup_done_expected <= '0';
        tb_calib_done_expected <= '0';
        tb_ur_data_expected <= (others => '0');
        tb_tx_expected <= '1';
        tb_reset <= '0';
        
        -- Start the IP
        tb_ap_start <= '1';
        tb_auto_restart <= '1';   
        tb_ap_idle_expected <= '0';
        
        -- Wait for powerup
        wait for 3 us + SYS_CLK;
        tb_powerup_done_expected <= '1';
        
        -- Wait for calibration
        wait for 2 us + SYS_CLK;
        tb_calib_done_expected <= '1';
        
        -- Now we have FIRST_READING
        wait for 2 us;
        
        -- Send 'R01' on UART, then timeout
        
        uart_byte := x"52"; -- R
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for UART_HALF_SAMPLE_TIME;
        
        uart_byte := x"30"; -- 0
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"00";
        wait for SYS_CLK;
        tb_dist_char_1_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);

        uart_byte := x"31"; -- 1
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"0A";
        wait for SYS_CLK;
        tb_dist_char_2_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
              
        -- wait for timeout
        -- -> 35 us - 2us idle - 6.4us per UART byte * 3 -> 13.8 us
        -- 2 clock cycles for update
        wait for 13800 ns;
        tb_ap_done_expected <= '1';
        tb_ad_error_expected <= '1';
        tb_ad_err_pos_expected <= "100000";
        wait for SYS_CLK;
        tb_read_valid_expected <= '1'; 
        -- Resets
        tb_ap_done_expected <= '0';
        tb_ad_error_expected <= '0';
        tb_ad_err_pos_expected <= (others => '0');
        tb_ap_done_expected <= '0';

        
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        -- Send second read
        
        -- Now we have RANGE_READING
        wait for 1 us;
        
        -- RESETS ONLY IF UPDATE_WINDOW == 1 --
        tb_read_valid_expected <= '0' after 6.11 us; 
        tb_dist_in_expected <= (others => '0') after 6.11 us;
        tb_dist_char_1_expected <= (others => '0') after 6.11 us;
        tb_dist_char_2_expected <= (others => '0') after 6.11 us;
        tb_dist_char_3_expected <= (others => '0') after 6.11 us;
        
        -- Send 'R255\r' on UART
        
        uart_byte := x"52"; -- R
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for UART_HALF_SAMPLE_TIME;
        
        uart_byte := x"32"; -- 2
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 *SYS_CLK;
        tb_dist_in_expected <= x"C8";
        wait for SYS_CLK;
        tb_dist_char_1_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);

        uart_byte := x"35"; -- 5 
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"FA";
        wait for SYS_CLK;
        tb_dist_char_2_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        uart_byte := x"35"; -- 5
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"FF";
        wait for SYS_CLK;
        tb_dist_char_3_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK); 
        
        uart_byte := x"0D"; -- \r
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_auto_restart <= '0';
        tb_ap_done_expected <= '1';
        tb_ap_idle_expected <= '1';
        tb_tx_expected <= '0';
        wait for SYS_CLK;
        tb_read_valid_expected <= '1';
        -- Resets
        tb_ap_start <= '0';
        
        tb_ap_done_expected <= '0';

        
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        -----------------------------------------------------------------------
        -- 4. One valid read, one invalid read (forbidden character send), with auto restart, second one will timeout
        -----------------------------------------------------------------------
        tb_testcase <= vld_ad_err_auto_second_timeout;

        -- No reset just restart 
        tb_ap_idle_expected <= '0';
        tb_tx_expected <= '1';
        tb_ap_start <= '1';
        tb_auto_restart <= '1';
        
        -- Now we have RANGE_READING
        wait for 1 us;
        
        -- RESETS ONLY IF UPDATE_WINDOW == 1 --
        tb_read_valid_expected <= '0' after 6.11 us; 
        tb_dist_in_expected <= (others => '0') after 6.11 us;
        tb_dist_char_1_expected <= (others => '0') after 6.11 us;
        tb_dist_char_2_expected <= (others => '0') after 6.11 us;
        tb_dist_char_3_expected <= (others => '0') after 6.11 us;
        
        -- Send 'R004\r' on UART
        
        uart_byte := x"52"; -- R
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for UART_HALF_SAMPLE_TIME;
        
        uart_byte := x"30"; -- 0
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 *SYS_CLK;
        tb_dist_in_expected <= x"00";
        wait for SYS_CLK;
        tb_dist_char_1_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);

        uart_byte := x"30"; -- 0
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"00";
        wait for SYS_CLK;
        tb_dist_char_2_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        uart_byte := x"34"; -- 4
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"04";
        wait for SYS_CLK;
        tb_dist_char_3_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK); 
        
        uart_byte := x"0D"; -- \r
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_ap_done_expected <= '1';
        wait for SYS_CLK;
        tb_read_valid_expected <= '1';
        
        -- Resets
        tb_ap_done_expected <= '0';
        
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        -- Send second read

        -- Send 'R25' on UART, then timeout

        -- Now we have RANGE_READING
        wait for 1 us;
        
        -- RESETS ONLY IF UPDATE_WINDOW == 1 --
        tb_read_valid_expected <= '0' after 6.11 us; 
        tb_dist_in_expected <= (others => '0') after 6.11 us;
        tb_dist_char_1_expected <= (others => '0') after 6.11 us;
        tb_dist_char_2_expected <= (others => '0') after 6.11 us;
        tb_dist_char_3_expected <= (others => '0') after 6.11 us;
        
        uart_byte := x"52"; -- R
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for UART_HALF_SAMPLE_TIME;
        
        uart_byte := x"32"; -- 2
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"C8";
        wait for SYS_CLK;
        tb_dist_char_1_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);

        uart_byte := x"36"; -- 6
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK; 
        tb_ad_error_expected <= '1';
        tb_ad_err_pos_expected <= "000100";
        tb_ad_err_char_expected <= uart_byte;
        wait for SYS_CLK;
        tb_dist_char_2_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        -- wait for timeout
        -- -> 34 us - 1us idle - 6.4 us per UART byte * 3 -> 13.8 us
        -- -> counter restarted when ap_done was deassertet: UART_HALF_SAMPLE_TIME - (2 * SYS_CLK) -> 13.50 us 
        -- 2 clock cycles for update
        wait for 13500 ns + 2 * SYS_CLK;

        -- axi interface will clear ap_start automatically when ap_done is asserted
        -- here we need to do it manually 
        tb_ap_done_expected <= '1';
        tb_ad_error_expected <= '1';
        tb_ad_err_pos_expected <= "100100";
        wait for SYS_CLK;
        tb_read_valid_expected <= '1';
        -- Resets
        tb_ap_done_expected <= '0';
        tb_ad_error_expected <= '0';
        tb_ad_err_char_expected <= (others => '0');
        tb_ad_err_pos_expected <= (others => '0');
        tb_ap_done_expected <= '0';

        
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        -----------------------------------------------------------------------
        -- 5. One valid read, one invalid read (forbidden character send), with auto restart,
        -----------------------------------------------------------------------
        tb_testcase <= vld_ad_err_auto;
        tb_ap_start <= '1';
        tb_auto_restart <= '1';
        
        -- Now we have RANGE_READING
        wait for 1 us;
        
        -- RESETS ONLY IF UPDATE_WINDOW == 1 --
        tb_read_valid_expected <= '0' after 6.11 us; 
        tb_dist_in_expected <= (others => '0') after 6.11 us;
        tb_dist_char_1_expected <= (others => '0') after 6.11 us;
        tb_dist_char_2_expected <= (others => '0') after 6.11 us;
        tb_dist_char_3_expected <= (others => '0') after 6.11 us;
        
        -- Send 'R123\r' on UART
        
        uart_byte := x"52"; -- R
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for UART_HALF_SAMPLE_TIME;
        
        uart_byte := x"31"; -- 1
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 *SYS_CLK;
        tb_dist_in_expected <= x"64";
        wait for SYS_CLK;
        tb_dist_char_1_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);

        uart_byte := x"32"; -- 2
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"78";
        wait for SYS_CLK;
        tb_dist_char_2_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        uart_byte := x"33"; -- 3
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"7B";
        wait for SYS_CLK;
        tb_dist_char_3_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK); 
        
        uart_byte := x"0D"; -- \r
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        
        
        tb_ap_done_expected <= '1';
        wait for SYS_CLK;
        tb_read_valid_expected <= '1';
        -- Resets
        tb_ap_done_expected <= '0';

        
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        -- Send second read

        -- Send invalid Character R255\n instead of R255\r on UART
        
        -- Now we have RANGE_READING
        wait for 1 us;
        
        -- RESETS ONLY IF UPDATE_WINDOW == 1 --
        tb_read_valid_expected <= '0' after 6.11 us; 
        tb_dist_in_expected <= (others => '0') after 6.11 us;
        tb_dist_char_1_expected <= (others => '0') after 6.11 us;
        tb_dist_char_2_expected <= (others => '0') after 6.11 us;
        tb_dist_char_3_expected <= (others => '0') after 6.11 us;
        
        uart_byte := x"52"; -- R
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for UART_HALF_SAMPLE_TIME;
        
        uart_byte := x"32"; -- 2
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 *SYS_CLK;
        tb_dist_in_expected <= x"C8";
        wait for SYS_CLK;
        tb_dist_char_1_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);

        uart_byte := x"35"; -- 5
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"FA";
        wait for SYS_CLK;
        tb_dist_char_2_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        uart_byte := x"35"; -- 5
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"FF";
        wait for SYS_CLK;
        tb_dist_char_3_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK); 
        
        uart_byte := x"0A"; -- \n
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        
        tb_ad_error_expected <= '1';
        tb_ad_err_pos_expected <= "010000";
        tb_ad_err_char_expected <= uart_byte;
        tb_ap_done_expected <= '1';
        wait for SYS_CLK;
        tb_read_valid_expected <= '1';
        -- Resets
        tb_ap_done_expected <= '0';
        tb_ad_error_expected <= '0';
        tb_ad_err_pos_expected <= (others => '0');
        tb_ad_err_char_expected <= (others => '0');
        tb_ap_done_expected <= '0';

        
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        -----------------------------------------------------------------------
        -- 6. One invalid read (forbidden character send), one valid read, with auto restart,
        -----------------------------------------------------------------------
        tb_testcase <= ad_err_vld_auto;
        tb_ap_start <= '1';
        tb_auto_restart <= '1';
        
        -- Send invalid Character S123\r instead of R123\r on UART
        
        -- Now we have RANGE_READING
        wait for 1 us;
        -- RESETS ONLY IF UPDATE_WINDOW == 1 --
        tb_read_valid_expected <= '0' after 6.11 us; 
        tb_dist_in_expected <= (others => '0') after 6.11 us;
        tb_dist_char_1_expected <= (others => '0') after 6.11 us;
        tb_dist_char_2_expected <= (others => '0') after 6.11 us;
        tb_dist_char_3_expected <= (others => '0') after 6.11 us;        
        
        uart_byte := x"53"; -- S
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK; -- correct ? 
        tb_ad_error_expected <= '1';
        tb_ad_err_pos_expected <= "000001";
        tb_ad_err_char_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME;

        uart_byte := x"31"; -- 1
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 *SYS_CLK;
        tb_dist_in_expected <= x"00";
        wait for SYS_CLK;
        tb_dist_char_1_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);

        uart_byte := x"32"; -- 2
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"00";
        wait for SYS_CLK;
        tb_dist_char_2_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        uart_byte := x"33"; -- 3
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"00";
        wait for SYS_CLK;
        tb_dist_char_3_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK); 
        
        uart_byte := x"0D"; -- \r
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        
        wait for SYS_CLK;
        tb_read_valid_expected <= '1';
        -- Resets
        tb_ap_done_expected <= '0';
        tb_ad_error_expected <= '0';
        tb_ad_err_char_expected <= (others => '0');
        tb_ad_err_pos_expected <= (others => '0');

        
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        -- Now we have RANGE_READING
        
        wait for 1 us;
        -- RESETS ONLY IF UPDATE_WINDOW == 1 --
        tb_read_valid_expected <= '0' after 6.11 us; 
        tb_dist_in_expected <= (others => '0') after 6.11 us;
        tb_dist_char_1_expected <= (others => '0') after 6.11 us;
        tb_dist_char_2_expected <= (others => '0') after 6.11 us;
        tb_dist_char_3_expected <= (others => '0') after 6.11 us; 
        -- Send 'R123\r' on UART
        
        uart_byte := x"52"; -- R
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for UART_HALF_SAMPLE_TIME;
        
        uart_byte := x"31"; -- 1
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 *SYS_CLK;
        tb_dist_in_expected <= x"64";
        wait for SYS_CLK;
        tb_dist_char_1_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);

        uart_byte := x"32"; -- 2
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"78";
        wait for SYS_CLK;
        tb_dist_char_2_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        uart_byte := x"33"; -- 3
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"7B";
        wait for SYS_CLK;
        tb_dist_char_3_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK); 
        
        uart_byte := x"0D"; -- \r
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        
        
        tb_ap_done_expected <= '1';
        wait for SYS_CLK;
        tb_read_valid_expected <= '1';
        -- Resets
        tb_ap_done_expected <= '0';
        tb_ad_err_pos_expected <= (others => '0');
        
        tb_ap_done_expected <= '0';

        
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        -- RESETS ONLY IF UPDATE_WINDOW == 1 --
        tb_read_valid_expected <= '0' after 6.11 us; 
        tb_dist_in_expected <= (others => '0') after 6.11 us;
        tb_dist_char_1_expected <= (others => '0') after 6.11 us;
        tb_dist_char_2_expected <= (others => '0') after 6.11 us;
        tb_dist_char_3_expected <= (others => '0') after 6.11 us; 
        -----------------------------------------------------------------------
        -- 7. One invalid read (UART Framing error, should be ignored), with auto restart,
        -----------------------------------------------------------------------
        tb_testcase <= ur_err_auto;
        tb_ap_start <= '1';
        tb_auto_restart <= '1';
        
        
        
        -- Send R166\r but send the R without a proper stop bit
        
        -- R
        uart_byte := x"52"; -- R
        tb_ur_data_expected <= (others => '0');
        tb_rx <= '0'; -- start bit
        wait for UART_FULL_SAMPLE_TIME;

        for i in 0 to 7 loop
            tb_rx <= uart_byte(i);
            wait for UART_HALF_SAMPLE_TIME + SYS_CLK;    
            tb_ur_data_expected <= uart_byte(i) & tb_ur_data_expected(7 downto 1);       
            wait for UART_HALF_SAMPLE_TIME - SYS_CLK;
        end loop;

        tb_rx <= '0'; -- no stop bit
        wait for UART_HALF_SAMPLE_TIME;
        
        wait for SYS_CLK;
        tb_ur_error_expected <= '1';
        wait for SYS_CLK;
        tb_ur_error_expected <= '0';
        tb_rx <= '1';
        wait for UART_HALF_SAMPLE_TIME - 2 * SYS_CLK;
        
        uart_byte := x"31"; -- 1
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 *SYS_CLK;
        tb_dist_in_expected <= x"64";
        wait for SYS_CLK;
        tb_dist_char_1_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);

        uart_byte := x"36"; -- 6
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"A0";
        wait for SYS_CLK;
        tb_dist_char_2_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        uart_byte := x"36"; -- 6
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"A6";
        wait for SYS_CLK;
        tb_dist_char_3_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK); 
        
        uart_byte := x"0D"; -- \r
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        
        
        tb_ap_done_expected <= '1';
        wait for SYS_CLK;
        tb_read_valid_expected <= '1'; 
        -- Resets
        tb_ap_start <= '0';
        tb_auto_restart <= '0';
        tb_ap_done_expected <= '0';

        
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);   
        -----------------------------------------------------------------------
        -- 8. One valid read, test freeze_ip in the middle of the read
        -----------------------------------------------------------------------
        tb_testcase <= vld_freeze;
        tb_ap_start <= '1';
        tb_auto_restart <= '1';
        
        -- Send valid R123\r 
        
        -- Now we have RANGE_READING
        wait for 1 us;
        
        -- RESETS ONLY IF UPDATE_WINDOW == 1 --
        tb_read_valid_expected <= '0' after 6.11 us; 
        tb_dist_in_expected <= (others => '0') after 6.11 us;
        tb_dist_char_1_expected <= (others => '0') after 6.11 us;
        tb_dist_char_2_expected <= (others => '0') after 6.11 us;
        tb_dist_char_3_expected <= (others => '0') after 6.11 us; 
        
        uart_byte := x"52"; -- R
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for UART_HALF_SAMPLE_TIME;

        uart_byte := x"31"; -- 1
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 *SYS_CLK;
        tb_dist_in_expected <= x"64";
        wait for SYS_CLK;
        tb_dist_char_1_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);

        uart_byte := x"32"; -- 2
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"78";
        wait for SYS_CLK;
        tb_dist_char_2_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        tb_freeze_ip <= '1';
        wait for 50 us;
        tb_freeze_ip <= '0';
        wait for SYS_CLK;
        
        uart_byte := x"33"; -- 3
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"7B";
        wait for SYS_CLK;
        tb_dist_char_3_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK); 
        
        uart_byte := x"0D"; -- \r
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        
        tb_ap_done_expected <= '1';
        wait for SYS_CLK;
        tb_read_valid_expected <= '1';
        
        -- Resets
        tb_ap_start <= '0';
        tb_auto_restart <= '0';
        tb_ap_done_expected <= '0';
        tb_ad_error_expected <= '0';
        tb_ad_err_char_expected <= (others => '0');
        tb_ad_err_pos_expected <= (others => '0');

        
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);

        -----------------------------------------------------------------------
        -- 9. One valid read, with init timing  test reset_ip, then valid read, with init timing
        -----------------------------------------------------------------------
        tb_testcase <= init_vld_reset_init_vld;
        tb_ap_start <= '1';
        tb_auto_restart <= '1';
        
        -- Now we have RANGE_READING
        wait for 1 us;
        -- RESETS ONLY IF UPDATE_WINDOW == 1 --
        tb_read_valid_expected <= '0' after 6.11 us; 
        tb_dist_in_expected <= (others => '0') after 6.11 us;
        tb_dist_char_1_expected <= (others => '0') after 6.11 us;
        tb_dist_char_2_expected <= (others => '0') after 6.11 us;
        tb_dist_char_3_expected <= (others => '0') after 6.11 us; 
        uart_byte := x"52"; -- R
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for UART_HALF_SAMPLE_TIME;
        
        uart_byte := x"31"; -- 1
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 *SYS_CLK;
        tb_dist_in_expected <= x"64";
        wait for SYS_CLK;
        tb_dist_char_1_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);

        uart_byte := x"36"; -- 6
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"A0";
        wait for SYS_CLK;
        tb_dist_char_2_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        uart_byte := x"36"; -- 6
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"A6";
        wait for SYS_CLK;
        tb_dist_char_3_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK); 
        
        uart_byte := x"0D"; -- \r
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_ap_done_expected <= '1';
        wait for SYS_CLK;
        tb_read_valid_expected <= '1';
        -- Resets
        tb_ap_done_expected <= '0';
        
        
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);         
        tb_dist_in_expected <= (others => '0');
        tb_dist_char_1_expected <= (others => '0');
        tb_dist_char_2_expected <= (others => '0');
        tb_dist_char_3_expected <= (others => '0');
        tb_read_valid_expected <= '0';
        
        -- reset ip
        tb_reset_ip <= '1';
        wait for SYS_CLK;
        tb_reset_ip <= '0';
        tb_ur_data_expected <= (others => '0');
        tb_powerup_done_expected <=  '0';
        tb_calib_done_expected <= '0';
        
        -- Wait for powerup
        wait for 3 us + SYS_CLK;
        tb_powerup_done_expected <= '1';
        
        -- Wait for calibration
        wait for 2 us + SYS_CLK;
        tb_calib_done_expected <= '1';
        
        -- Now we have FIRST_READING
        wait for 2 us;
        
        uart_byte := x"52"; -- R
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for UART_HALF_SAMPLE_TIME;
        
        uart_byte := x"31"; -- 1
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 *SYS_CLK;
        tb_dist_in_expected <= x"64";
        wait for SYS_CLK;
        tb_dist_char_1_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);

        uart_byte := x"36"; -- 6
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"A0";
        wait for SYS_CLK;
        tb_dist_char_2_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);
        
        uart_byte := x"36"; -- 6
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;
        tb_dist_in_expected <= x"A6";
        wait for SYS_CLK;
        tb_dist_char_3_expected <= uart_byte;
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK); 
        
        uart_byte := x"0D"; -- \r
        uart_send_byte(tb_rx, tb_ur_data_expected, uart_byte);
        wait for 2 * SYS_CLK;  
        tb_ap_done_expected <= '1';
        wait for SYS_CLK;
        tb_read_valid_expected <= '1';
        -- Resets
        tb_ap_start <= '0';
        tb_auto_restart <= '0';
        tb_ap_done_expected <= '0';        
        tb_ap_done_expected <= '0';

        
        wait for UART_HALF_SAMPLE_TIME - (3 * SYS_CLK);   
        tb_read_valid_expected <= '0';
        tb_dist_in_expected <= (others => '0');
        tb_dist_char_1_expected <= (others => '0');
        tb_dist_char_2_expected <= (others => '0');
        tb_dist_char_3_expected <= (others => '0');
        wait;
    end process; -- Total length ~ 610 us
end sim;
