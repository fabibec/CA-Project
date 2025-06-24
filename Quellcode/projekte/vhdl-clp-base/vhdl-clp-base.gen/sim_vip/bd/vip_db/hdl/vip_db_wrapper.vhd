--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
--Date        : Fri Jun 13 14:43:11 2025
--Host        : xuser-pc running 64-bit Ubuntu 22.04.3 LTS
--Command     : generate_target vip_db_wrapper.bd
--Design      : vip_db_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity vip_db_wrapper is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    o_db4_7 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_interrupt_0 : out STD_LOGIC;
    o_read_write : out STD_LOGIC;
    o_read_write_enable : out STD_LOGIC;
    o_register_select : out STD_LOGIC
  );
end vip_db_wrapper;

architecture STRUCTURE of vip_db_wrapper is
  component vip_db is
  port (
    o_interrupt_0 : out STD_LOGIC;
    o_db4_7 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_register_select : out STD_LOGIC;
    o_read_write : out STD_LOGIC;
    o_read_write_enable : out STD_LOGIC;
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC
  );
  end component vip_db;
begin
vip_db_i: component vip_db
     port map (
      ACLK => ACLK,
      ARESETN => ARESETN,
      o_db4_7(3 downto 0) => o_db4_7(3 downto 0),
      o_interrupt_0 => o_interrupt_0,
      o_read_write => o_read_write,
      o_read_write_enable => o_read_write_enable,
      o_register_select => o_register_select
    );
end STRUCTURE;
