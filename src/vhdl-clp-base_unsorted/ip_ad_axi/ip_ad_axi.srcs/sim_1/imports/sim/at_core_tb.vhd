----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2024 10:59:35 AM
-- Design Name: 
-- Module Name: at_core_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity at_core_tb is
--  Port ( );
end at_core_tb;

architecture Behavioral of at_core_tb is
  constant c_tbase: time:=10 ns;
  constant c_tcheck: time:=1 ns;
  
  type testcase_type is (up, loaddown, upautorestart, loaddownautorestart, twait);
  signal t_testcase: testcase_type;
  
  component at_core is  
    port ( 
      i_clk : in std_logic;
      i_reset : in std_logic;
      --
      i_ap_start : in std_logic;
      o_ap_idle : out std_logic;
      o_ap_done : out std_logic;
      i_auto_restart : in std_logic;
      --
      i_ent0_out : in std_logic;
      i_load0 : in std_logic;
      i_ud0 : in std_logic;
      i_reset_ip: in std_logic;
      i_freeze_ip: in std_logic;
      --
      i_LR: in std_logic_vector(31 downto 0);
      --
      o_CR: out std_logic_vector(31 downto 0);
      --
      o_t0_out: out std_logic;   
      dummylast : in std_logic  
    );
  end component;
  
  signal TB_CLK: std_logic;
  signal TB_RESET: std_logic;
  --
  signal TB_ap_start : std_logic;
  signal TB_ap_idle : std_logic;
  signal TB_ap_done : std_logic;
  signal TB_auto_restart : std_logic;
  --
  signal TB_ent0_out : std_logic;
  signal TB_load0 : std_logic;
  signal TB_ud0 : std_logic;
  signal TB_reset_ip: std_logic;
  signal TB_freeze_ip: std_logic;
  --
  signal TB_LR: std_logic_vector(31 downto 0);
  --
  signal TB_CR: std_logic_vector(31 downto 0);
  --
  signal TB_t0_out: std_logic;   
  signal dummylast : std_logic;  
  
begin

  CLOCK: process 
    begin 
     TB_CLK <='1';
     wait for c_tbase/2;
     TB_CLK <='0';
     wait for c_tbase/2;
  end process CLOCK;

  DUT: at_core port map(
      i_clk => TB_CLK,
      i_reset => TB_RESET,
      --
      i_ap_start => TB_ap_start,  
      o_ap_idle => TB_ap_idle,
      o_ap_done => TB_ap_done,
      i_auto_restart => TB_auto_restart,
      --
      i_ent0_out => TB_ent0_out,
      i_load0 => TB_load0,
      i_ud0 => TB_ud0,
      i_reset_ip => TB_reset_ip,
      i_freeze_ip => TB_freeze_ip,
      --
      i_LR => TB_LR,
      --
      o_CR => TB_CR,
      --
      o_t0_out => TB_t0_out,
      --   
      dummylast => '0'
      );  

     TB_reset_ip <='0';
     TB_freeze_ip <='0';

  STIMULI: process 
  begin
  
    t_testcase <= up; --up, loaddown, upautorestart, loaddownautorestart
    TB_ap_start <='0';
    TB_RESET<='1';
    wait for 1*c_tbase;
    TB_RESET<='0';
    wait for 1*c_tbase;
    -- 
    TB_auto_restart<='0';
    TB_load0 <='0';
    TB_ud0 <='1';
    TB_LR <= x"00000004";
    TB_ent0_out <='1';
    --
    wait for 1*c_tbase;
    TB_ap_start <='1';
    --     
    wait for 7*c_tbase;
    
    t_testcase <= twait;
    wait for 10*c_tbase;
      
    
    t_testcase <= loaddown; --up, loaddown, upautorestart, loaddownautorestart
    TB_ap_start <='0';
    TB_RESET<='1';
    wait for 1*c_tbase;
    TB_RESET<='0';
    wait for 1*c_tbase;
    -- 
    TB_auto_restart<='0';
    TB_load0 <='1';
    TB_ud0 <='0';
    TB_LR <= x"00000004";
    TB_ent0_out <='1';
    wait for 1*c_tbase;
    TB_load0 <='0';
    --     
    wait for 1*c_tbase;
    TB_ap_start <='1';
    --     
    wait for 6*c_tbase;

    t_testcase <= twait;
    wait for 10*c_tbase;


    t_testcase <= upautorestart; --up, loaddown, upautorestart, loaddownautorestart
    TB_ap_start <='0';
    TB_RESET<='1';
    wait for 1*c_tbase;
    TB_RESET<='0';
    wait for 1*c_tbase;
    -- 
    TB_ap_start <='1';
    TB_auto_restart<='1';
    TB_load0 <='0';
    TB_ud0 <='1';
    TB_LR <= x"00000004";
    TB_ent0_out <='1';
    --
    wait for 1*c_tbase;
    TB_ap_start <='1';
    --     
    wait for 17*c_tbase;
    
    t_testcase <= twait;
    wait for 10*c_tbase;
    
    
    t_testcase <= loaddownautorestart; --up, loaddown, upautorestart, loaddownautorestart
    TB_ap_start <='0';
    TB_RESET<='1';
    wait for 1*c_tbase;
    TB_RESET<='0';
    wait for 1*c_tbase;
    -- 
    TB_ap_start <='1';
    TB_auto_restart<='1';
    TB_load0 <='1';
    TB_ud0 <='0';
    TB_LR <= x"00000004";
    TB_ent0_out <='1';
    wait for 1*c_tbase;
    TB_load0 <='0';
    --       
    wait for 1*c_tbase;
    TB_ap_start <='1';
    --     
    wait for 16*c_tbase;
    
    t_testcase <= twait;
    wait for 10*c_tbase;
         
    wait; -- end simulation
  end process STIMULI;  
end Behavioral;
