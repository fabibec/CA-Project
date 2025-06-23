--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
--Date        : Tue Jun 17 08:49:44 2025
--Host        : xuser-pc running 64-bit Ubuntu 24.04.2 LTS
--Command     : generate_target mbblockdesign_wrapper.bd
--Design      : mbblockdesign_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mbblockdesign_wrapper is
  port (
    i_rx_0 : in STD_LOGIC;
    o_db4_7_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_read_write_0 : out STD_LOGIC;
    o_read_write_enable_0 : out STD_LOGIC;
    o_register_select_0 : out STD_LOGIC;
    o_tx_0 : out STD_LOGIC;
    pwm0_0 : out STD_LOGIC;
    reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC
  );
end mbblockdesign_wrapper;

architecture STRUCTURE of mbblockdesign_wrapper is
  component mbblockdesign is
  port (
    sys_clock : in STD_LOGIC;
    reset : in STD_LOGIC;
    pwm0_0 : out STD_LOGIC;
    o_tx_0 : out STD_LOGIC;
    o_db4_7_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_register_select_0 : out STD_LOGIC;
    i_rx_0 : in STD_LOGIC;
    o_read_write_0 : out STD_LOGIC;
    o_read_write_enable_0 : out STD_LOGIC
  );
  end component mbblockdesign;
begin
mbblockdesign_i: component mbblockdesign
     port map (
      i_rx_0 => i_rx_0,
      o_db4_7_0(3 downto 0) => o_db4_7_0(3 downto 0),
      o_read_write_0 => o_read_write_0,
      o_read_write_enable_0 => o_read_write_enable_0,
      o_register_select_0 => o_register_select_0,
      o_tx_0 => o_tx_0,
      pwm0_0 => pwm0_0,
      reset => reset,
      sys_clock => sys_clock
    );
end STRUCTURE;
