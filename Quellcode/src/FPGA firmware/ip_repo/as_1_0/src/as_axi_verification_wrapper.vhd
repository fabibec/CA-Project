--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
--Date        : Thu Jun  5 15:52:10 2025
--Host        : xuser-pc running 64-bit Ubuntu 22.04.3 LTS
--Command     : generate_target as_axi_verification_wrapper.bd
--Design      : as_axi_verification_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity as_axi_verification_wrapper is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    i_rx : in STD_LOGIC;
    o_interrupt_0 : out STD_LOGIC;
    o_tx : out STD_LOGIC
  );
end as_axi_verification_wrapper;

architecture STRUCTURE of as_axi_verification_wrapper is
  component as_axi_verification is
  port (
    ARESETN : in STD_LOGIC;
    ACLK : in STD_LOGIC;
    o_interrupt_0 : out STD_LOGIC;
    o_tx : out STD_LOGIC;
    i_rx : in STD_LOGIC
  );
  end component as_axi_verification;
begin
as_axi_verification_i: component as_axi_verification
     port map (
      ACLK => ACLK,
      ARESETN => ARESETN,
      i_rx => i_rx,
      o_interrupt_0 => o_interrupt_0,
      o_tx => o_tx
    );
end STRUCTURE;
