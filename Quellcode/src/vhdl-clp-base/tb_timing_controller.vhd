----------------------------------------------------------------------------------
-- Engineer: Jendrik Juergens (3361128), Michael Specht (3362589)
-- Further Information: -
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_timing_controller is
--  Port ( );
end tb_timing_controller;

-- Clock-Rate = 100mHz => 1 Tick == 10 ns

architecture TESTBENCH of tb_timing_controller is
  component timing_controller 
    port (
    i_clk             : in  std_logic;
    i_reset           : in  std_logic;
    i_start           : in  std_logic;
    i_delay_time      : in  std_logic_vector(21 downto 0); -- needs to be calculated into clock based time
    o_done            : out std_logic
  );
  end component;
  
  -- Testbench Signals
  signal TB_i_clk           : std_logic := '0';
  signal TB_i_reset         : std_logic := '0';
  signal TB_i_start         : std_logic := '0';
  signal TB_i_delay_time    : std_logic_vector(21 downto 0) := (others => '0');
  signal TB_o_done          : std_logic;
  
  -- Expected Signals
  signal ex_TB_i_reset      : std_logic := '0';
  signal ex_TB_o_done       : std_logic := '0';
  signal ex_TB_i_start      : std_logic := '0';
  signal ex_TB_i_delay_time : std_logic_vector(21 downto 0) := (others => '0');
  
  -- Timing Constants according to lcd_controller.vhd
  constant SYS_CLK                  : time := 10 ns;
  constant T_POWER_ON               : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(2, 22)); -- 30 ms 3000000
  constant T_SU                     : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(5, 22)); -- t_SU = 50 ns 5
  constant T_W                      : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(23, 22)); -- t_W = 230 ns 23
  constant T_H                      : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(2, 22)); -- t_H = 20 ns from E Rise/Fall Time 2
  constant T_16_4MS                 : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(164000, 22)); -- 1.64ms 164000
  constant T_40_US                  : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(4000, 22));   -- 40us 4000
  constant T_LOWER_UPPER_WAIT       : std_logic_vector(21 downto 0) := std_logic_vector(to_unsigned(43, 22));   -- t_Cycle - t_H - t_SU = 430 43
   

begin
  DUT : timing_controller port map(
    i_clk => TB_i_clk,
    i_reset => TB_i_reset,
    i_start => TB_i_start,
    i_delay_time => TB_i_delay_time,
    o_done => TB_o_done
    );


-- 100 MHz Clock
  process
    begin
        TB_i_clk <= '1';
        wait for SYS_CLK/2;
        TB_i_clk <= '0';
        wait for SYS_CLK/2;
    end process;

    
  STIM_PROC: process
  begin
    -- Initial reset 
    TB_i_reset <= '1';
    TB_i_start <= '0';
    TB_i_delay_time <= (others => '0');
    ex_TB_i_start <= '0';
    ex_TB_i_reset <= '1';
    
    wait for SYS_CLK; 
    TB_i_reset <= '0';
    ex_TB_o_done <= '0';
    ex_TB_i_reset <= '0';

    wait for SYS_CLK; 
    
    -- Test case 1: T_POWER_ON == 30 ms
    TB_i_delay_time <= T_POWER_ON;
    ex_TB_i_delay_time <= T_POWER_ON;
    TB_i_start <= '1';
    ex_TB_i_start <= '1';
    wait for SYS_CLK; 
    TB_i_start <= '0';
    ex_TB_i_start <= '0';
    wait for to_integer(unsigned(T_POWER_ON))*SYS_CLK; -- Wait for T_POWER_ON 
    ex_TB_o_done <= '1';
    wait for SYS_CLK; 
    ex_TB_o_done <= '0';
    wait for 5*SYS_CLK; -- Clean Cut between Test-Cases
    
    
    -- Test case 2: T_SU == 50 ns
    TB_i_delay_time <= T_SU;
    ex_TB_i_delay_time <= T_SU;
    TB_i_start <= '1';
    ex_TB_i_start <= '1';
    wait for SYS_CLK; -- 
    TB_i_start <= '0';
    ex_TB_i_start <= '0';
    wait for to_integer(unsigned(T_SU))*SYS_CLK; -- Wait for T_SU  Clocks 
    ex_TB_o_done <= '1';
    wait for SYS_CLK; -- 
    ex_TB_o_done <= '0';
    wait for 5*SYS_CLK; -- Clean Cut between Test-Cases
    
    -- Test case 3: T_W == 230 ns
    TB_i_delay_time <= T_W;
    ex_TB_i_delay_time <= T_W;
    TB_i_start <= '1';
    ex_TB_i_start <= '1';
    wait for SYS_CLK; -- 
    TB_i_start <= '0';
    ex_TB_i_start <= '0';
    wait for to_integer(unsigned(T_W))*SYS_CLK; -- wait for T_W 
    ex_TB_o_done <= '1';
    wait for SYS_CLK;
    ex_TB_o_done <= '0'; 
    wait for 5*SYS_CLK; -- Clean Cut between Test-Cases
    
    -- Test case 4: T_H == 20ns
    TB_i_delay_time <= T_H;
    ex_TB_i_delay_time <= T_H;
    TB_i_start <= '1';
    ex_TB_i_start <= '1';
    wait  for SYS_CLK; -- 
    TB_i_start <= '0';
    ex_TB_i_start <= '0';
    wait for to_integer(unsigned(T_H))*SYS_CLK; -- wait for T_H
    ex_TB_o_done <= '1';
    wait for SYS_CLK; 
    ex_TB_o_done <= '0';
    wait for 5*SYS_CLK; -- Clean Cut between Test-Cases
    
    -- Test case 5: T_16_4ms == 1.64 ms 
    TB_i_delay_time <= T_16_4ms;
    ex_TB_i_delay_time <= T_16_4ms;
    TB_i_start <= '1';
    ex_TB_i_start <= '1';
    wait  for SYS_CLK; 
    TB_i_start <= '0';
    ex_TB_i_start <= '0';
    wait for to_integer(unsigned(T_16_4ms))*SYS_CLK; -- wait for T_16_4ms
    ex_TB_o_done <= '1';
    wait for SYS_CLK; 
    ex_TB_o_done <= '0';
    wait for 5*SYS_CLK; -- Clean Cut between Test-Cases
    
    -- Test case 6: T_40_US == 40 us 
    TB_i_delay_time <= T_40_US;
    ex_TB_i_delay_time <= T_40_US;
    TB_i_start <= '1';
    ex_TB_i_start <= '1';
    wait  for SYS_CLK; 
    TB_i_start <= '0';
    ex_TB_i_start <= '0';
    wait for to_integer(unsigned(T_40_US))*SYS_CLK; -- wait for T_40_US 
    ex_TB_o_done <= '1';
    wait for SYS_CLK;
    ex_TB_o_done <= '0';
    wait for 5*SYS_CLK; -- Clean Cut between Test-Cases
    
    -- Test case 7: T_LOWER_UPPER_WAIT == 430 ns
    TB_i_delay_time <= T_LOWER_UPPER_WAIT;
    ex_TB_i_delay_time <= T_LOWER_UPPER_WAIT;
    TB_i_start <= '1';
    ex_TB_i_start <= '1';
    wait  for SYS_CLK;
    TB_i_start <= '0';
    ex_TB_i_start <= '0';
    wait for to_integer(unsigned(T_LOWER_UPPER_WAIT))*SYS_CLK; -- wait for T_LOWER_UPPER_WAIT 
    ex_TB_o_done <= '1';
    wait for SYS_CLK;
    ex_TB_o_done <= '0';
    wait for 5*SYS_CLK; -- Clean Cut between Test-Cases
    
    wait;
  end process;

end TESTBENCH;