-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Wed Jun 25 20:47:12 2025
-- Host        : xuser-pc running 64-bit Ubuntu 22.04.3 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/xuser/pmod-maxsonar-pmod-clp/Quellcode/src/hw-platform/hw-platform.gen/sources_1/bd/mbblockdesign/ip/mbblockdesign_as_1_0/mbblockdesign_as_1_0_sim_netlist.vhdl
-- Design      : mbblockdesign_as_1_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mbblockdesign_as_1_0_as_S00_AXI is
  port (
    axi_wready_reg_0 : out STD_LOGIC;
    axi_awready_reg_0 : out STD_LOGIC;
    axi_arready_reg_0 : out STD_LOGIC;
    w_auto_restart : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    \SCSR0_reg_reg[7]_0\ : out STD_LOGIC;
    s00_axi_aresetn_0 : out STD_LOGIC;
    w_freeze_ip : out STD_LOGIC;
    w_ap_start : out STD_LOGIC;
    global_reset : out STD_LOGIC;
    w_reset_ip : out STD_LOGIC;
    \GCSR_reg_reg[0]_0\ : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    ad_start : in STD_LOGIC;
    ap_start_prev : in STD_LOGIC;
    tx_reg_reg : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 2 downto 0 );
    ap_start_stage1 : in STD_LOGIC;
    w_ap_done : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \ADSR_reg_reg[15]_0\ : in STD_LOGIC_VECTOR ( 14 downto 0 );
    \SCSR0_reg_reg[2]_0\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \DIST0_reg_reg[31]_0\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of mbblockdesign_as_1_0_as_S00_AXI : entity is "as_S00_AXI";
end mbblockdesign_as_1_0_as_S00_AXI;

architecture STRUCTURE of mbblockdesign_as_1_0_as_S00_AXI is
  signal \ADSR_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \ADSR_reg_reg_n_0_[10]\ : STD_LOGIC;
  signal \ADSR_reg_reg_n_0_[11]\ : STD_LOGIC;
  signal \ADSR_reg_reg_n_0_[12]\ : STD_LOGIC;
  signal \ADSR_reg_reg_n_0_[13]\ : STD_LOGIC;
  signal \ADSR_reg_reg_n_0_[14]\ : STD_LOGIC;
  signal \ADSR_reg_reg_n_0_[15]\ : STD_LOGIC;
  signal \ADSR_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal \ADSR_reg_reg_n_0_[2]\ : STD_LOGIC;
  signal \ADSR_reg_reg_n_0_[3]\ : STD_LOGIC;
  signal \ADSR_reg_reg_n_0_[4]\ : STD_LOGIC;
  signal \ADSR_reg_reg_n_0_[5]\ : STD_LOGIC;
  signal \ADSR_reg_reg_n_0_[6]\ : STD_LOGIC;
  signal \ADSR_reg_reg_n_0_[8]\ : STD_LOGIC;
  signal \ADSR_reg_reg_n_0_[9]\ : STD_LOGIC;
  signal DIST0_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GCSR_reg : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal \GCSR_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \GCSR_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \GCSR_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \GCSR_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \GCSR_reg[1]_i_2_n_0\ : STD_LOGIC;
  signal \GCSR_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \GCSR_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \GCSR_reg[7]_i_3_n_0\ : STD_LOGIC;
  signal SCSR0_reg : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \SCSR0_reg[6]_i_1_n_0\ : STD_LOGIC;
  signal \SCSR0_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \SCSR0_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \UCSR_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \UCSR_reg_reg_n_0_[10]\ : STD_LOGIC;
  signal \UCSR_reg_reg_n_0_[11]\ : STD_LOGIC;
  signal \UCSR_reg_reg_n_0_[12]\ : STD_LOGIC;
  signal \UCSR_reg_reg_n_0_[13]\ : STD_LOGIC;
  signal \UCSR_reg_reg_n_0_[14]\ : STD_LOGIC;
  signal \UCSR_reg_reg_n_0_[15]\ : STD_LOGIC;
  signal \UCSR_reg_reg_n_0_[8]\ : STD_LOGIC;
  signal \UCSR_reg_reg_n_0_[9]\ : STD_LOGIC;
  signal aw_en_i_1_n_0 : STD_LOGIC;
  signal aw_en_reg_n_0 : STD_LOGIC;
  signal axi_araddr : STD_LOGIC_VECTOR ( 5 downto 2 );
  signal axi_arready0 : STD_LOGIC;
  signal \^axi_arready_reg_0\ : STD_LOGIC;
  signal axi_awaddr : STD_LOGIC_VECTOR ( 5 downto 2 );
  signal axi_awready_i_2_n_0 : STD_LOGIC;
  signal \^axi_awready_reg_0\ : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal \axi_rdata[0]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[11]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_2_n_0\ : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal axi_wready0 : STD_LOGIC;
  signal \^axi_wready_reg_0\ : STD_LOGIC;
  signal i_reset : STD_LOGIC;
  signal reg_data_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s00_axi_aresetn_0\ : STD_LOGIC;
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal slv_reg_rden : STD_LOGIC;
  signal \slv_reg_wren__0\ : STD_LOGIC;
  signal w_ap_idle : STD_LOGIC;
  signal \^w_ap_start\ : STD_LOGIC;
  signal \^w_auto_restart\ : STD_LOGIC;
  signal \^w_freeze_ip\ : STD_LOGIC;
  signal \^w_reset_ip\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \GCSR_reg[0]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \GCSR_reg[0]_i_3\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \GCSR_reg[2]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \GCSR_reg[7]_i_3\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \SCSR0_reg[6]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \SCSR0_reg[7]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \SCSR0_reg[7]_i_3\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of ap_start_stage1_i_1 : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \axi_rdata[15]_i_2\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \axi_rdata[15]_i_3\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \axi_rdata[15]_i_4\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \axi_rdata[16]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \axi_rdata[17]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \axi_rdata[18]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \axi_rdata[1]_i_2\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \axi_rdata[31]_i_2\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of axi_wready_i_1 : label is "soft_lutpair39";
begin
  axi_arready_reg_0 <= \^axi_arready_reg_0\;
  axi_awready_reg_0 <= \^axi_awready_reg_0\;
  axi_wready_reg_0 <= \^axi_wready_reg_0\;
  s00_axi_aresetn_0 <= \^s00_axi_aresetn_0\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_rvalid <= \^s00_axi_rvalid\;
  w_ap_start <= \^w_ap_start\;
  w_auto_restart <= \^w_auto_restart\;
  w_freeze_ip <= \^w_freeze_ip\;
  w_reset_ip <= \^w_reset_ip\;
\ADSR_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ADSR_reg_reg[15]_0\(0),
      Q => \ADSR_reg_reg_n_0_[0]\,
      R => i_reset
    );
\ADSR_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ADSR_reg_reg[15]_0\(9),
      Q => \ADSR_reg_reg_n_0_[10]\,
      R => i_reset
    );
\ADSR_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ADSR_reg_reg[15]_0\(10),
      Q => \ADSR_reg_reg_n_0_[11]\,
      R => i_reset
    );
\ADSR_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ADSR_reg_reg[15]_0\(11),
      Q => \ADSR_reg_reg_n_0_[12]\,
      R => i_reset
    );
\ADSR_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ADSR_reg_reg[15]_0\(12),
      Q => \ADSR_reg_reg_n_0_[13]\,
      R => i_reset
    );
\ADSR_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ADSR_reg_reg[15]_0\(13),
      Q => \ADSR_reg_reg_n_0_[14]\,
      R => i_reset
    );
\ADSR_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ADSR_reg_reg[15]_0\(14),
      Q => \ADSR_reg_reg_n_0_[15]\,
      R => i_reset
    );
\ADSR_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ADSR_reg_reg[15]_0\(1),
      Q => \ADSR_reg_reg_n_0_[1]\,
      R => i_reset
    );
\ADSR_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ADSR_reg_reg[15]_0\(2),
      Q => \ADSR_reg_reg_n_0_[2]\,
      R => i_reset
    );
\ADSR_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ADSR_reg_reg[15]_0\(3),
      Q => \ADSR_reg_reg_n_0_[3]\,
      R => i_reset
    );
\ADSR_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ADSR_reg_reg[15]_0\(4),
      Q => \ADSR_reg_reg_n_0_[4]\,
      R => i_reset
    );
\ADSR_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ADSR_reg_reg[15]_0\(5),
      Q => \ADSR_reg_reg_n_0_[5]\,
      R => i_reset
    );
\ADSR_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ADSR_reg_reg[15]_0\(6),
      Q => \ADSR_reg_reg_n_0_[6]\,
      R => i_reset
    );
\ADSR_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ADSR_reg_reg[15]_0\(7),
      Q => \ADSR_reg_reg_n_0_[8]\,
      R => i_reset
    );
\ADSR_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ADSR_reg_reg[15]_0\(8),
      Q => \ADSR_reg_reg_n_0_[9]\,
      R => i_reset
    );
\DIST0_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(0),
      Q => DIST0_reg(0),
      R => i_reset
    );
\DIST0_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(10),
      Q => DIST0_reg(10),
      R => i_reset
    );
\DIST0_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(11),
      Q => DIST0_reg(11),
      R => i_reset
    );
\DIST0_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(12),
      Q => DIST0_reg(12),
      R => i_reset
    );
\DIST0_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(13),
      Q => DIST0_reg(13),
      R => i_reset
    );
\DIST0_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(14),
      Q => DIST0_reg(14),
      R => i_reset
    );
\DIST0_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(15),
      Q => DIST0_reg(15),
      R => i_reset
    );
\DIST0_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(16),
      Q => DIST0_reg(16),
      R => i_reset
    );
\DIST0_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(17),
      Q => DIST0_reg(17),
      R => i_reset
    );
\DIST0_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(18),
      Q => DIST0_reg(18),
      R => i_reset
    );
\DIST0_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(19),
      Q => DIST0_reg(19),
      R => i_reset
    );
\DIST0_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(1),
      Q => DIST0_reg(1),
      R => i_reset
    );
\DIST0_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(20),
      Q => DIST0_reg(20),
      R => i_reset
    );
\DIST0_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(21),
      Q => DIST0_reg(21),
      R => i_reset
    );
\DIST0_reg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(22),
      Q => DIST0_reg(22),
      R => i_reset
    );
\DIST0_reg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(23),
      Q => DIST0_reg(23),
      R => i_reset
    );
\DIST0_reg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(24),
      Q => DIST0_reg(24),
      R => i_reset
    );
\DIST0_reg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(25),
      Q => DIST0_reg(25),
      R => i_reset
    );
\DIST0_reg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(26),
      Q => DIST0_reg(26),
      R => i_reset
    );
\DIST0_reg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(27),
      Q => DIST0_reg(27),
      R => i_reset
    );
\DIST0_reg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(28),
      Q => DIST0_reg(28),
      R => i_reset
    );
\DIST0_reg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(29),
      Q => DIST0_reg(29),
      R => i_reset
    );
\DIST0_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(2),
      Q => DIST0_reg(2),
      R => i_reset
    );
\DIST0_reg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(30),
      Q => DIST0_reg(30),
      R => i_reset
    );
\DIST0_reg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(31),
      Q => DIST0_reg(31),
      R => i_reset
    );
\DIST0_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(3),
      Q => DIST0_reg(3),
      R => i_reset
    );
\DIST0_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(4),
      Q => DIST0_reg(4),
      R => i_reset
    );
\DIST0_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(5),
      Q => DIST0_reg(5),
      R => i_reset
    );
\DIST0_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(6),
      Q => DIST0_reg(6),
      R => i_reset
    );
\DIST0_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(7),
      Q => DIST0_reg(7),
      R => i_reset
    );
\DIST0_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(8),
      Q => DIST0_reg(8),
      R => i_reset
    );
\DIST0_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DIST0_reg_reg[31]_0\(9),
      Q => DIST0_reg(9),
      R => i_reset
    );
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^w_reset_ip\,
      I1 => s00_axi_aresetn,
      O => global_reset
    );
\GCSR_reg[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FBF8"
    )
        port map (
      I0 => \^w_auto_restart\,
      I1 => w_ap_done,
      I2 => \GCSR_reg[0]_i_2_n_0\,
      I3 => \^w_ap_start\,
      O => \GCSR_reg[0]_i_1_n_0\
    );
\GCSR_reg[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000000000"
    )
        port map (
      I0 => axi_awaddr(5),
      I1 => axi_awaddr(4),
      I2 => \GCSR_reg[0]_i_3_n_0\,
      I3 => s00_axi_wstrb(0),
      I4 => \^axi_wready_reg_0\,
      I5 => s00_axi_wdata(0),
      O => \GCSR_reg[0]_i_2_n_0\
    );
\GCSR_reg[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => axi_awaddr(3),
      I1 => axi_awaddr(2),
      O => \GCSR_reg[0]_i_3_n_0\
    );
\GCSR_reg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => w_ap_done,
      I1 => \GCSR_reg[1]_i_2_n_0\,
      I2 => GCSR_reg(1),
      O => \GCSR_reg[1]_i_1_n_0\
    );
\GCSR_reg[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555555555551"
    )
        port map (
      I0 => w_ap_done,
      I1 => \^axi_arready_reg_0\,
      I2 => axi_araddr(4),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => axi_araddr(5),
      O => \GCSR_reg[1]_i_2_n_0\
    );
\GCSR_reg[2]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^w_ap_start\,
      O => w_ap_idle
    );
\GCSR_reg[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFF80000000"
    )
        port map (
      I0 => s00_axi_wdata(2),
      I1 => \GCSR_reg[7]_i_2_n_0\,
      I2 => \^axi_awready_reg_0\,
      I3 => \^axi_wready_reg_0\,
      I4 => \GCSR_reg[7]_i_3_n_0\,
      I5 => \^w_auto_restart\,
      O => \GCSR_reg[7]_i_1_n_0\
    );
\GCSR_reg[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      O => \GCSR_reg[7]_i_2_n_0\
    );
\GCSR_reg[7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => axi_awaddr(3),
      I1 => axi_awaddr(2),
      I2 => axi_awaddr(4),
      I3 => s00_axi_wstrb(0),
      I4 => axi_awaddr(5),
      O => \GCSR_reg[7]_i_3_n_0\
    );
\GCSR_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \GCSR_reg[0]_i_1_n_0\,
      Q => \^w_ap_start\,
      R => i_reset
    );
\GCSR_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \GCSR_reg[1]_i_1_n_0\,
      Q => GCSR_reg(1),
      R => i_reset
    );
\GCSR_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => w_ap_idle,
      Q => GCSR_reg(2),
      R => i_reset
    );
\GCSR_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \GCSR_reg[7]_i_1_n_0\,
      Q => \^w_auto_restart\,
      R => i_reset
    );
\SCSR0_reg[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s00_axi_wdata(1),
      I1 => \SCSR0_reg[7]_i_2_n_0\,
      I2 => \^w_reset_ip\,
      O => \SCSR0_reg[6]_i_1_n_0\
    );
\SCSR0_reg[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s00_axi_wdata(2),
      I1 => \SCSR0_reg[7]_i_2_n_0\,
      I2 => \^w_freeze_ip\,
      O => \SCSR0_reg[7]_i_1_n_0\
    );
\SCSR0_reg[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000020000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => axi_awaddr(5),
      I2 => axi_awaddr(4),
      I3 => s00_axi_wstrb(0),
      I4 => axi_awaddr(3),
      I5 => axi_awaddr(2),
      O => \SCSR0_reg[7]_i_2_n_0\
    );
\SCSR0_reg[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^axi_wready_reg_0\,
      I1 => \^axi_awready_reg_0\,
      I2 => s00_axi_wvalid,
      I3 => s00_axi_awvalid,
      O => \slv_reg_wren__0\
    );
\SCSR0_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \SCSR0_reg_reg[2]_0\(0),
      Q => SCSR0_reg(0),
      R => i_reset
    );
\SCSR0_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \SCSR0_reg_reg[2]_0\(1),
      Q => SCSR0_reg(1),
      R => i_reset
    );
\SCSR0_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \SCSR0_reg_reg[2]_0\(2),
      Q => SCSR0_reg(2),
      R => i_reset
    );
\SCSR0_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \SCSR0_reg[6]_i_1_n_0\,
      Q => \^w_reset_ip\,
      R => i_reset
    );
\SCSR0_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \SCSR0_reg[7]_i_1_n_0\,
      Q => \^w_freeze_ip\,
      R => i_reset
    );
\UCSR_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => D(0),
      Q => \UCSR_reg_reg_n_0_[0]\,
      R => i_reset
    );
\UCSR_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => D(3),
      Q => \UCSR_reg_reg_n_0_[10]\,
      R => i_reset
    );
\UCSR_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => D(4),
      Q => \UCSR_reg_reg_n_0_[11]\,
      R => i_reset
    );
\UCSR_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => D(5),
      Q => \UCSR_reg_reg_n_0_[12]\,
      R => i_reset
    );
\UCSR_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => D(6),
      Q => \UCSR_reg_reg_n_0_[13]\,
      R => i_reset
    );
\UCSR_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => D(7),
      Q => \UCSR_reg_reg_n_0_[14]\,
      R => i_reset
    );
\UCSR_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => D(8),
      Q => \UCSR_reg_reg_n_0_[15]\,
      R => i_reset
    );
\UCSR_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => D(1),
      Q => \UCSR_reg_reg_n_0_[8]\,
      R => i_reset
    );
\UCSR_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => D(2),
      Q => \UCSR_reg_reg_n_0_[9]\,
      R => i_reset
    );
ap_start_stage1_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \^w_ap_start\,
      I1 => \^w_freeze_ip\,
      I2 => ap_start_stage1,
      O => \GCSR_reg_reg[0]_0\
    );
aw_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFF8CCC8CCC8CCC"
    )
        port map (
      I0 => \^axi_awready_reg_0\,
      I1 => aw_en_reg_n_0,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_wvalid,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => aw_en_i_1_n_0
    );
aw_en_reg: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => aw_en_i_1_n_0,
      Q => aw_en_reg_n_0,
      S => i_reset
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(0),
      Q => axi_araddr(2),
      S => i_reset
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(1),
      Q => axi_araddr(3),
      S => i_reset
    );
\axi_araddr_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(2),
      Q => axi_araddr(4),
      S => i_reset
    );
\axi_araddr_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(3),
      Q => axi_araddr(5),
      S => i_reset
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^axi_arready_reg_0\,
      O => axi_arready0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_arready0,
      Q => \^axi_arready_reg_0\,
      R => i_reset
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready_i_2_n_0,
      D => s00_axi_awaddr(0),
      Q => axi_awaddr(2),
      R => i_reset
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready_i_2_n_0,
      D => s00_axi_awaddr(1),
      Q => axi_awaddr(3),
      R => i_reset
    );
\axi_awaddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready_i_2_n_0,
      D => s00_axi_awaddr(2),
      Q => axi_awaddr(4),
      R => i_reset
    );
\axi_awaddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready_i_2_n_0,
      D => s00_axi_awaddr(3),
      Q => axi_awaddr(5),
      R => i_reset
    );
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => i_reset
    );
axi_awready_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_awvalid,
      I2 => aw_en_reg_n_0,
      I3 => \^axi_awready_reg_0\,
      O => axi_awready_i_2_n_0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_awready_i_2_n_0,
      Q => \^axi_awready_reg_0\,
      R => i_reset
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF80008000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_awvalid,
      I2 => \^axi_awready_reg_0\,
      I3 => \^axi_wready_reg_0\,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s00_axi_bvalid\,
      R => i_reset
    );
\axi_rdata[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C0C0C2020000C202"
    )
        port map (
      I0 => \^w_ap_start\,
      I1 => axi_araddr(4),
      I2 => axi_araddr(3),
      I3 => SCSR0_reg(0),
      I4 => axi_araddr(2),
      I5 => DIST0_reg(0),
      O => \axi_rdata[0]_i_2_n_0\
    );
\axi_rdata[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000B0008"
    )
        port map (
      I0 => \ADSR_reg_reg_n_0_[0]\,
      I1 => axi_araddr(2),
      I2 => axi_araddr(3),
      I3 => axi_araddr(4),
      I4 => \UCSR_reg_reg_n_0_[0]\,
      O => \axi_rdata[0]_i_3_n_0\
    );
\axi_rdata[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAEAAAAAAAAAAAFA"
    )
        port map (
      I0 => \axi_rdata[10]_i_2_n_0\,
      I1 => DIST0_reg(10),
      I2 => axi_araddr(4),
      I3 => axi_araddr(5),
      I4 => axi_araddr(2),
      I5 => axi_araddr(3),
      O => reg_data_out(10)
    );
\axi_rdata[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000CA00000000"
    )
        port map (
      I0 => \UCSR_reg_reg_n_0_[10]\,
      I1 => \ADSR_reg_reg_n_0_[10]\,
      I2 => axi_araddr(2),
      I3 => axi_araddr(3),
      I4 => axi_araddr(4),
      I5 => axi_araddr(5),
      O => \axi_rdata[10]_i_2_n_0\
    );
\axi_rdata[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAEAAAAAAAAAAAFA"
    )
        port map (
      I0 => \axi_rdata[11]_i_2_n_0\,
      I1 => DIST0_reg(11),
      I2 => axi_araddr(4),
      I3 => axi_araddr(5),
      I4 => axi_araddr(2),
      I5 => axi_araddr(3),
      O => reg_data_out(11)
    );
\axi_rdata[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000CA00000000"
    )
        port map (
      I0 => \UCSR_reg_reg_n_0_[11]\,
      I1 => \ADSR_reg_reg_n_0_[11]\,
      I2 => axi_araddr(2),
      I3 => axi_araddr(3),
      I4 => axi_araddr(4),
      I5 => axi_araddr(5),
      O => \axi_rdata[11]_i_2_n_0\
    );
\axi_rdata[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0D000000"
    )
        port map (
      I0 => axi_araddr(3),
      I1 => DIST0_reg(12),
      I2 => axi_araddr(5),
      I3 => axi_araddr(4),
      I4 => axi_araddr(2),
      I5 => \axi_rdata[12]_i_2_n_0\,
      O => reg_data_out(12)
    );
\axi_rdata[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000CA00000000"
    )
        port map (
      I0 => \UCSR_reg_reg_n_0_[12]\,
      I1 => \ADSR_reg_reg_n_0_[12]\,
      I2 => axi_araddr(2),
      I3 => axi_araddr(3),
      I4 => axi_araddr(4),
      I5 => axi_araddr(5),
      O => \axi_rdata[12]_i_2_n_0\
    );
\axi_rdata[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F4F4F44444F4444"
    )
        port map (
      I0 => \axi_rdata[15]_i_2_n_0\,
      I1 => DIST0_reg(13),
      I2 => \axi_rdata[15]_i_3_n_0\,
      I3 => \axi_rdata[15]_i_4_n_0\,
      I4 => \ADSR_reg_reg_n_0_[13]\,
      I5 => \UCSR_reg_reg_n_0_[13]\,
      O => reg_data_out(13)
    );
\axi_rdata[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAEAAAAAAAAAAAFA"
    )
        port map (
      I0 => \axi_rdata[14]_i_2_n_0\,
      I1 => DIST0_reg(14),
      I2 => axi_araddr(4),
      I3 => axi_araddr(5),
      I4 => axi_araddr(2),
      I5 => axi_araddr(3),
      O => reg_data_out(14)
    );
\axi_rdata[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000CA00000000"
    )
        port map (
      I0 => \UCSR_reg_reg_n_0_[14]\,
      I1 => \ADSR_reg_reg_n_0_[14]\,
      I2 => axi_araddr(2),
      I3 => axi_araddr(3),
      I4 => axi_araddr(4),
      I5 => axi_araddr(5),
      O => \axi_rdata[14]_i_2_n_0\
    );
\axi_rdata[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F4F4F44444F4444"
    )
        port map (
      I0 => \axi_rdata[15]_i_2_n_0\,
      I1 => DIST0_reg(15),
      I2 => \axi_rdata[15]_i_3_n_0\,
      I3 => \axi_rdata[15]_i_4_n_0\,
      I4 => \ADSR_reg_reg_n_0_[15]\,
      I5 => \UCSR_reg_reg_n_0_[15]\,
      O => reg_data_out(15)
    );
\axi_rdata[15]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F7FF"
    )
        port map (
      I0 => axi_araddr(3),
      I1 => axi_araddr(2),
      I2 => axi_araddr(5),
      I3 => axi_araddr(4),
      O => \axi_rdata[15]_i_2_n_0\
    );
\axi_rdata[15]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => axi_araddr(5),
      I1 => axi_araddr(4),
      I2 => axi_araddr(3),
      O => \axi_rdata[15]_i_3_n_0\
    );
\axi_rdata[15]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"45"
    )
        port map (
      I0 => axi_araddr(4),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      O => \axi_rdata[15]_i_4_n_0\
    );
\axi_rdata[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"09000100"
    )
        port map (
      I0 => axi_araddr(3),
      I1 => axi_araddr(2),
      I2 => axi_araddr(5),
      I3 => axi_araddr(4),
      I4 => DIST0_reg(16),
      O => reg_data_out(16)
    );
\axi_rdata[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"09000100"
    )
        port map (
      I0 => axi_araddr(3),
      I1 => axi_araddr(2),
      I2 => axi_araddr(5),
      I3 => axi_araddr(4),
      I4 => DIST0_reg(17),
      O => reg_data_out(17)
    );
\axi_rdata[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"09000100"
    )
        port map (
      I0 => axi_araddr(3),
      I1 => axi_araddr(2),
      I2 => axi_araddr(5),
      I3 => axi_araddr(4),
      I4 => DIST0_reg(18),
      O => reg_data_out(18)
    );
\axi_rdata[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"09000100"
    )
        port map (
      I0 => axi_araddr(3),
      I1 => axi_araddr(2),
      I2 => axi_araddr(5),
      I3 => axi_araddr(4),
      I4 => DIST0_reg(19),
      O => reg_data_out(19)
    );
\axi_rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF88F30000"
    )
        port map (
      I0 => DIST0_reg(1),
      I1 => axi_araddr(3),
      I2 => SCSR0_reg(1),
      I3 => axi_araddr(2),
      I4 => \axi_rdata[1]_i_2_n_0\,
      I5 => \axi_rdata[1]_i_3_n_0\,
      O => reg_data_out(1)
    );
\axi_rdata[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => axi_araddr(4),
      I1 => axi_araddr(5),
      O => \axi_rdata[1]_i_2_n_0\
    );
\axi_rdata[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0008000800030000"
    )
        port map (
      I0 => \ADSR_reg_reg_n_0_[1]\,
      I1 => axi_araddr(2),
      I2 => axi_araddr(3),
      I3 => axi_araddr(4),
      I4 => GCSR_reg(1),
      I5 => axi_araddr(5),
      O => \axi_rdata[1]_i_3_n_0\
    );
\axi_rdata[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => DIST0_reg(20),
      I1 => axi_araddr(4),
      I2 => axi_araddr(5),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      O => reg_data_out(20)
    );
\axi_rdata[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => DIST0_reg(21),
      I1 => axi_araddr(4),
      I2 => axi_araddr(5),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      O => reg_data_out(21)
    );
\axi_rdata[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"09000100"
    )
        port map (
      I0 => axi_araddr(3),
      I1 => axi_araddr(2),
      I2 => axi_araddr(5),
      I3 => axi_araddr(4),
      I4 => DIST0_reg(22),
      O => reg_data_out(22)
    );
\axi_rdata[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => DIST0_reg(23),
      I1 => axi_araddr(4),
      I2 => axi_araddr(5),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      O => reg_data_out(23)
    );
\axi_rdata[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"09000100"
    )
        port map (
      I0 => axi_araddr(3),
      I1 => axi_araddr(2),
      I2 => axi_araddr(5),
      I3 => axi_araddr(4),
      I4 => DIST0_reg(24),
      O => reg_data_out(24)
    );
\axi_rdata[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"09000100"
    )
        port map (
      I0 => axi_araddr(3),
      I1 => axi_araddr(2),
      I2 => axi_araddr(5),
      I3 => axi_araddr(4),
      I4 => DIST0_reg(25),
      O => reg_data_out(25)
    );
\axi_rdata[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => DIST0_reg(26),
      I1 => axi_araddr(4),
      I2 => axi_araddr(5),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      O => reg_data_out(26)
    );
\axi_rdata[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => DIST0_reg(27),
      I1 => axi_araddr(4),
      I2 => axi_araddr(5),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      O => reg_data_out(27)
    );
\axi_rdata[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"09000100"
    )
        port map (
      I0 => axi_araddr(3),
      I1 => axi_araddr(2),
      I2 => axi_araddr(5),
      I3 => axi_araddr(4),
      I4 => DIST0_reg(28),
      O => reg_data_out(28)
    );
\axi_rdata[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => DIST0_reg(29),
      I1 => axi_araddr(4),
      I2 => axi_araddr(5),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      O => reg_data_out(29)
    );
\axi_rdata[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0200FFFF02000000"
    )
        port map (
      I0 => axi_araddr(2),
      I1 => axi_araddr(3),
      I2 => axi_araddr(4),
      I3 => \ADSR_reg_reg_n_0_[2]\,
      I4 => axi_araddr(5),
      I5 => \axi_rdata[2]_i_2_n_0\,
      O => reg_data_out(2)
    );
\axi_rdata[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C0C0C2020000C202"
    )
        port map (
      I0 => GCSR_reg(2),
      I1 => axi_araddr(4),
      I2 => axi_araddr(3),
      I3 => SCSR0_reg(2),
      I4 => axi_araddr(2),
      I5 => DIST0_reg(2),
      O => \axi_rdata[2]_i_2_n_0\
    );
\axi_rdata[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"09000100"
    )
        port map (
      I0 => axi_araddr(3),
      I1 => axi_araddr(2),
      I2 => axi_araddr(5),
      I3 => axi_araddr(4),
      I4 => DIST0_reg(30),
      O => reg_data_out(30)
    );
\axi_rdata[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^axi_arready_reg_0\,
      I2 => \^s00_axi_rvalid\,
      O => slv_reg_rden
    );
\axi_rdata[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000808"
    )
        port map (
      I0 => axi_araddr(2),
      I1 => axi_araddr(4),
      I2 => axi_araddr(5),
      I3 => DIST0_reg(31),
      I4 => axi_araddr(3),
      O => reg_data_out(31)
    );
\axi_rdata[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000C800000008000"
    )
        port map (
      I0 => DIST0_reg(3),
      I1 => axi_araddr(2),
      I2 => axi_araddr(3),
      I3 => axi_araddr(4),
      I4 => axi_araddr(5),
      I5 => \ADSR_reg_reg_n_0_[3]\,
      O => reg_data_out(3)
    );
\axi_rdata[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00C000000A0000F0"
    )
        port map (
      I0 => \ADSR_reg_reg_n_0_[4]\,
      I1 => DIST0_reg(4),
      I2 => axi_araddr(4),
      I3 => axi_araddr(5),
      I4 => axi_araddr(2),
      I5 => axi_araddr(3),
      O => reg_data_out(4)
    );
\axi_rdata[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000C800000008000"
    )
        port map (
      I0 => DIST0_reg(5),
      I1 => axi_araddr(2),
      I2 => axi_araddr(3),
      I3 => axi_araddr(4),
      I4 => axi_araddr(5),
      I5 => \ADSR_reg_reg_n_0_[5]\,
      O => reg_data_out(5)
    );
\axi_rdata[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF02000000"
    )
        port map (
      I0 => axi_araddr(2),
      I1 => axi_araddr(3),
      I2 => axi_araddr(4),
      I3 => axi_araddr(5),
      I4 => \ADSR_reg_reg_n_0_[6]\,
      I5 => \axi_rdata[6]_i_2_n_0\,
      O => reg_data_out(6)
    );
\axi_rdata[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2020300000003030"
    )
        port map (
      I0 => DIST0_reg(6),
      I1 => axi_araddr(5),
      I2 => axi_araddr(4),
      I3 => \^w_reset_ip\,
      I4 => axi_araddr(2),
      I5 => axi_araddr(3),
      O => \axi_rdata[6]_i_2_n_0\
    );
\axi_rdata[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => axi_araddr(5),
      I1 => \axi_rdata[7]_i_2_n_0\,
      O => \axi_rdata[7]_i_1_n_0\
    );
\axi_rdata[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F3D3FFDFF3DFFFD"
    )
        port map (
      I0 => \^w_auto_restart\,
      I1 => axi_araddr(4),
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \^w_freeze_ip\,
      I5 => DIST0_reg(7),
      O => \axi_rdata[7]_i_2_n_0\
    );
\axi_rdata[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F4F4F44444F4444"
    )
        port map (
      I0 => \axi_rdata[15]_i_2_n_0\,
      I1 => DIST0_reg(8),
      I2 => \axi_rdata[15]_i_3_n_0\,
      I3 => \axi_rdata[15]_i_4_n_0\,
      I4 => \ADSR_reg_reg_n_0_[8]\,
      I5 => \UCSR_reg_reg_n_0_[8]\,
      O => reg_data_out(8)
    );
\axi_rdata[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAEAAAAAAAAAAAFA"
    )
        port map (
      I0 => \axi_rdata[9]_i_2_n_0\,
      I1 => DIST0_reg(9),
      I2 => axi_araddr(4),
      I3 => axi_araddr(5),
      I4 => axi_araddr(2),
      I5 => axi_araddr(3),
      O => reg_data_out(9)
    );
\axi_rdata[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000CA00000000"
    )
        port map (
      I0 => \UCSR_reg_reg_n_0_[9]\,
      I1 => \ADSR_reg_reg_n_0_[9]\,
      I2 => axi_araddr(2),
      I3 => axi_araddr(3),
      I4 => axi_araddr(4),
      I5 => axi_araddr(5),
      O => \axi_rdata[9]_i_2_n_0\
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(0),
      Q => s00_axi_rdata(0),
      R => i_reset
    );
\axi_rdata_reg[0]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[0]_i_2_n_0\,
      I1 => \axi_rdata[0]_i_3_n_0\,
      O => reg_data_out(0),
      S => axi_araddr(5)
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(10),
      Q => s00_axi_rdata(10),
      R => i_reset
    );
\axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(11),
      Q => s00_axi_rdata(11),
      R => i_reset
    );
\axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(12),
      Q => s00_axi_rdata(12),
      R => i_reset
    );
\axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(13),
      Q => s00_axi_rdata(13),
      R => i_reset
    );
\axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(14),
      Q => s00_axi_rdata(14),
      R => i_reset
    );
\axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(15),
      Q => s00_axi_rdata(15),
      R => i_reset
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(16),
      Q => s00_axi_rdata(16),
      R => i_reset
    );
\axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(17),
      Q => s00_axi_rdata(17),
      R => i_reset
    );
\axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(18),
      Q => s00_axi_rdata(18),
      R => i_reset
    );
\axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(19),
      Q => s00_axi_rdata(19),
      R => i_reset
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(1),
      Q => s00_axi_rdata(1),
      R => i_reset
    );
\axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(20),
      Q => s00_axi_rdata(20),
      R => i_reset
    );
\axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(21),
      Q => s00_axi_rdata(21),
      R => i_reset
    );
\axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(22),
      Q => s00_axi_rdata(22),
      R => i_reset
    );
\axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(23),
      Q => s00_axi_rdata(23),
      R => i_reset
    );
\axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(24),
      Q => s00_axi_rdata(24),
      R => i_reset
    );
\axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(25),
      Q => s00_axi_rdata(25),
      R => i_reset
    );
\axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(26),
      Q => s00_axi_rdata(26),
      R => i_reset
    );
\axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(27),
      Q => s00_axi_rdata(27),
      R => i_reset
    );
\axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(28),
      Q => s00_axi_rdata(28),
      R => i_reset
    );
\axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(29),
      Q => s00_axi_rdata(29),
      R => i_reset
    );
\axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(2),
      Q => s00_axi_rdata(2),
      R => i_reset
    );
\axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(30),
      Q => s00_axi_rdata(30),
      R => i_reset
    );
\axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(31),
      Q => s00_axi_rdata(31),
      R => i_reset
    );
\axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(3),
      Q => s00_axi_rdata(3),
      R => i_reset
    );
\axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(4),
      Q => s00_axi_rdata(4),
      R => i_reset
    );
\axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(5),
      Q => s00_axi_rdata(5),
      R => i_reset
    );
\axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(6),
      Q => s00_axi_rdata(6),
      R => i_reset
    );
\axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => \axi_rdata[7]_i_1_n_0\,
      Q => s00_axi_rdata(7),
      R => i_reset
    );
\axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(8),
      Q => s00_axi_rdata(8),
      R => i_reset
    );
\axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(9),
      Q => s00_axi_rdata(9),
      R => i_reset
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7444"
    )
        port map (
      I0 => s00_axi_rready,
      I1 => \^s00_axi_rvalid\,
      I2 => \^axi_arready_reg_0\,
      I3 => s00_axi_arvalid,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^s00_axi_rvalid\,
      R => i_reset
    );
axi_wready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_awvalid,
      I2 => \^axi_wready_reg_0\,
      I3 => aw_en_reg_n_0,
      O => axi_wready0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_wready0,
      Q => \^axi_wready_reg_0\,
      R => i_reset
    );
\data_reg[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => \^w_reset_ip\,
      O => \^s00_axi_aresetn_0\
    );
tx_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A8A8A8A00020000"
    )
        port map (
      I0 => \^s00_axi_aresetn_0\,
      I1 => \^w_freeze_ip\,
      I2 => ad_start,
      I3 => ap_start_prev,
      I4 => \^w_ap_start\,
      I5 => tx_reg_reg,
      O => \SCSR0_reg_reg[7]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mbblockdesign_as_1_0_ascii_decoder is
  port (
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    done_reg_reg_0 : out STD_LOGIC;
    first_number_is_2_reg_reg_0 : out STD_LOGIC;
    start_reg_reg_0 : out STD_LOGIC;
    ad_digit_ready : out STD_LOGIC;
    \state_reg[1]_0\ : out STD_LOGIC;
    \state_reg[0]_0\ : out STD_LOGIC;
    \state_reg[2]_0\ : out STD_LOGIC;
    \chars_reg_reg[1]_0\ : out STD_LOGIC;
    clk_counter : out STD_LOGIC;
    read_valid_reg0 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    update_window_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    \ad_digit_index_reg[1]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \error_pos_reg_reg[5]_0\ : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s00_axi_aresetn_0 : out STD_LOGIC;
    \state_reg[2]_1\ : out STD_LOGIC;
    \digit_reg_reg[7]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    error_reg : out STD_LOGIC;
    \error_char_reg_reg[7]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \error_char_reg_reg[7]_1\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    DI : in STD_LOGIC_VECTOR ( 0 to 0 );
    S : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \i__carry_i_3_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \i__carry_i_3_1\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \i__carry__0_i_2_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \data_reg_reg[7]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \data_reg_reg[7]_1\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    global_reset : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    ctl_done : in STD_LOGIC;
    ur_done : in STD_LOGIC;
    i_enable4_out : in STD_LOGIC;
    \data_reg_reg[7]_2\ : in STD_LOGIC;
    \chars_reg_reg[0]_0\ : in STD_LOGIC;
    \state[2]_i_2_0\ : in STD_LOGIC;
    w_freeze_ip : in STD_LOGIC;
    \data_reg_reg[7]_3\ : in STD_LOGIC;
    ap_start_stage2 : in STD_LOGIC;
    w_reset_ip : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    update_window : in STD_LOGIC;
    \ad_dist_char_3_reg_reg[0]\ : in STD_LOGIC;
    \ad_dist_char_3_reg_reg[0]_0\ : in STD_LOGIC;
    first_number_is_2_reg_reg_1 : in STD_LOGIC;
    first_number_is_2_reg_reg_2 : in STD_LOGIC;
    \data_reg_reg[7]_4\ : in STD_LOGIC;
    digit_ready_reg_reg_0 : in STD_LOGIC;
    start_reg_reg_1 : in STD_LOGIC;
    \state_reg[1]_1\ : in STD_LOGIC;
    \state_reg[2]_2\ : in STD_LOGIC;
    \digit_reg_reg[0]_0\ : in STD_LOGIC;
    next_state : in STD_LOGIC_VECTOR ( 0 to 0 );
    \data_reg_reg[7]_5\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \error_pos_reg_reg[5]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    error_reg_reg_0 : in STD_LOGIC;
    error_reg_reg_1 : in STD_LOGIC;
    error_reg_reg_2 : in STD_LOGIC;
    \error_char_reg_reg[7]_2\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of mbblockdesign_as_1_0_ascii_decoder : entity is "ascii_decoder";
end mbblockdesign_as_1_0_ascii_decoder;

architecture STRUCTURE of mbblockdesign_as_1_0_ascii_decoder is
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^ad_digit_ready\ : STD_LOGIC;
  signal chars_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \chars_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \chars_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \chars_reg[3]_i_4_n_0\ : STD_LOGIC;
  signal \chars_reg[3]_i_5_n_0\ : STD_LOGIC;
  signal \^chars_reg_reg[1]_0\ : STD_LOGIC;
  signal \chars_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \chars_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal \chars_reg_reg_n_0_[2]\ : STD_LOGIC;
  signal \chars_reg_reg_n_0_[3]\ : STD_LOGIC;
  signal data_next0 : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \data_next0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \data_next0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \data_next0_carry__0_n_1\ : STD_LOGIC;
  signal \data_next0_carry__0_n_2\ : STD_LOGIC;
  signal \data_next0_carry__0_n_3\ : STD_LOGIC;
  signal \data_next0_carry__0_n_4\ : STD_LOGIC;
  signal \data_next0_carry__0_n_5\ : STD_LOGIC;
  signal \data_next0_carry__0_n_6\ : STD_LOGIC;
  signal \data_next0_carry__0_n_7\ : STD_LOGIC;
  signal data_next0_carry_i_1_n_0 : STD_LOGIC;
  signal data_next0_carry_i_2_n_0 : STD_LOGIC;
  signal data_next0_carry_i_3_n_0 : STD_LOGIC;
  signal data_next0_carry_i_4_n_0 : STD_LOGIC;
  signal data_next0_carry_n_0 : STD_LOGIC;
  signal data_next0_carry_n_1 : STD_LOGIC;
  signal data_next0_carry_n_2 : STD_LOGIC;
  signal data_next0_carry_n_3 : STD_LOGIC;
  signal data_next0_carry_n_4 : STD_LOGIC;
  signal data_next0_carry_n_5 : STD_LOGIC;
  signal data_next0_carry_n_6 : STD_LOGIC;
  signal data_next0_carry_n_7 : STD_LOGIC;
  signal \data_next0_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \data_next0_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \data_next0_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \data_next0_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \data_next0_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \data_next0_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \data_reg[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \data_reg[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \data_reg[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \data_reg[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \data_reg[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \data_reg[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \data_reg[6]_i_1__0_n_0\ : STD_LOGIC;
  signal \data_reg[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \data_reg[7]_i_3__0_n_0\ : STD_LOGIC;
  signal digit_ready_reg_i_1_n_0 : STD_LOGIC;
  signal digit_ready_reg_i_2_n_0 : STD_LOGIC;
  signal \digit_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \digit_reg[7]_i_4_n_0\ : STD_LOGIC;
  signal done_reg_i_1_n_0 : STD_LOGIC;
  signal done_reg_i_2_n_0 : STD_LOGIC;
  signal \^done_reg_reg_0\ : STD_LOGIC;
  signal error_char_next : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \error_pos_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \error_pos_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \error_pos_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \error_pos_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \error_pos_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \^error_pos_reg_reg[5]_0\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \^error_reg\ : STD_LOGIC;
  signal error_reg_i_1_n_0 : STD_LOGIC;
  signal first_number_is_2_reg_i_1_n_0 : STD_LOGIC;
  signal first_number_is_2_reg_i_2_n_0 : STD_LOGIC;
  signal \^first_number_is_2_reg_reg_0\ : STD_LOGIC;
  signal \i__carry__0_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_3_n_0\ : STD_LOGIC;
  signal \i__carry_i_1_n_0\ : STD_LOGIC;
  signal \i__carry_i_2_n_0\ : STD_LOGIC;
  signal \i__carry_i_3_n_0\ : STD_LOGIC;
  signal \i__carry_i_4_n_0\ : STD_LOGIC;
  signal multOp : STD_LOGIC_VECTOR ( 7 downto 5 );
  signal \multOp_carry__0_n_3\ : STD_LOGIC;
  signal \multOp_carry__0_n_6\ : STD_LOGIC;
  signal \multOp_carry__0_n_7\ : STD_LOGIC;
  signal multOp_carry_n_0 : STD_LOGIC;
  signal multOp_carry_n_1 : STD_LOGIC;
  signal multOp_carry_n_2 : STD_LOGIC;
  signal multOp_carry_n_3 : STD_LOGIC;
  signal multOp_carry_n_4 : STD_LOGIC;
  signal multOp_carry_n_5 : STD_LOGIC;
  signal multOp_carry_n_6 : STD_LOGIC;
  signal multOp_carry_n_7 : STD_LOGIC;
  signal \multOp_inferred__0/i___0_carry_n_2\ : STD_LOGIC;
  signal \multOp_inferred__0/i___0_carry_n_3\ : STD_LOGIC;
  signal start_reg_i_1_n_0 : STD_LOGIC;
  signal \^start_reg_reg_0\ : STD_LOGIC;
  signal state : STD_LOGIC;
  signal \state[0]_i_1_n_0\ : STD_LOGIC;
  signal \state[1]_i_1_n_0\ : STD_LOGIC;
  signal \state[2]_i_1_n_0\ : STD_LOGIC;
  signal \state[2]_i_5_n_0\ : STD_LOGIC;
  signal \^state_reg[0]_0\ : STD_LOGIC;
  signal \^state_reg[1]_0\ : STD_LOGIC;
  signal \^state_reg[2]_0\ : STD_LOGIC;
  signal \^state_reg[2]_1\ : STD_LOGIC;
  signal \NLW_data_next0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_data_next0_inferred__0/i__carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_data_next0_inferred__0/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_multOp_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_multOp_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_multOp_inferred__0/i___0_carry_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_multOp_inferred__0/i___0_carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ad_dist_char_2_reg[7]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \ad_dist_char_3_reg[7]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \chars_reg[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \chars_reg[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \chars_reg[3]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \chars_reg[3]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \chars_reg[3]_i_4\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \chars_reg[3]_i_5\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \clk_counter[0]_i_2\ : label is "soft_lutpair4";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of data_next0_carry : label is 35;
  attribute ADDER_THRESHOLD of \data_next0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \data_next0_inferred__0/i__carry\ : label is 35;
  attribute ADDER_THRESHOLD of \data_next0_inferred__0/i__carry__0\ : label is 35;
  attribute SOFT_HLUTNM of \digit_reg[7]_i_4\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of done_reg_i_2 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \error_char_reg[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \error_char_reg[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \error_char_reg[2]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \error_char_reg[3]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \error_char_reg[4]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \error_char_reg[5]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \error_char_reg[6]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \error_char_reg[7]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \error_pos_reg[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \error_pos_reg[3]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \state[2]_i_4\ : label is "soft_lutpair0";
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
  ad_digit_ready <= \^ad_digit_ready\;
  \chars_reg_reg[1]_0\ <= \^chars_reg_reg[1]_0\;
  done_reg_reg_0 <= \^done_reg_reg_0\;
  \error_pos_reg_reg[5]_0\(5 downto 0) <= \^error_pos_reg_reg[5]_0\(5 downto 0);
  error_reg <= \^error_reg\;
  first_number_is_2_reg_reg_0 <= \^first_number_is_2_reg_reg_0\;
  start_reg_reg_0 <= \^start_reg_reg_0\;
  \state_reg[0]_0\ <= \^state_reg[0]_0\;
  \state_reg[1]_0\ <= \^state_reg[1]_0\;
  \state_reg[2]_0\ <= \^state_reg[2]_0\;
  \state_reg[2]_1\ <= \^state_reg[2]_1\;
\ad_dist_char_1_reg[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000400"
    )
        port map (
      I0 => \ad_dist_char_3_reg_reg[0]\,
      I1 => \^ad_digit_ready\,
      I2 => w_freeze_ip,
      I3 => update_window,
      I4 => \ad_dist_char_3_reg_reg[0]_0\,
      O => \ad_digit_index_reg[1]\(0)
    );
\ad_dist_char_2_reg[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => update_window,
      I1 => w_freeze_ip,
      I2 => \^ad_digit_ready\,
      I3 => \ad_dist_char_3_reg_reg[0]_0\,
      I4 => \ad_dist_char_3_reg_reg[0]\,
      O => update_window_reg(0)
    );
\ad_dist_char_3_reg[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => update_window,
      I1 => w_freeze_ip,
      I2 => \^ad_digit_ready\,
      I3 => \ad_dist_char_3_reg_reg[0]\,
      I4 => \ad_dist_char_3_reg_reg[0]_0\,
      O => E(0)
    );
\ad_dist_in_reg[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => \^start_reg_reg_0\,
      I1 => w_reset_ip,
      I2 => s00_axi_aresetn,
      O => read_valid_reg0
    );
\chars_reg[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4101FFFF"
    )
        port map (
      I0 => \^state_reg[1]_0\,
      I1 => \^state_reg[0]_0\,
      I2 => \^state_reg[2]_0\,
      I3 => \chars_reg_reg[0]_0\,
      I4 => \chars_reg_reg_n_0_[0]\,
      O => chars_next(0)
    );
\chars_reg[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6066666066666660"
    )
        port map (
      I0 => \chars_reg_reg_n_0_[1]\,
      I1 => \chars_reg_reg_n_0_[0]\,
      I2 => \^state_reg[1]_0\,
      I3 => \^state_reg[0]_0\,
      I4 => \^state_reg[2]_0\,
      I5 => \chars_reg_reg[0]_0\,
      O => chars_next(1)
    );
\chars_reg[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0078"
    )
        port map (
      I0 => \chars_reg_reg_n_0_[0]\,
      I1 => \chars_reg_reg_n_0_[1]\,
      I2 => \chars_reg_reg_n_0_[2]\,
      I3 => \chars_reg[3]_i_5_n_0\,
      O => chars_next(2)
    );
\chars_reg[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000007F00000000"
    )
        port map (
      I0 => \^state_reg[0]_0\,
      I1 => \^state_reg[2]_0\,
      I2 => \chars_reg[3]_i_3_n_0\,
      I3 => ctl_done,
      I4 => \chars_reg[3]_i_4_n_0\,
      I5 => i_enable4_out,
      O => \chars_reg[3]_i_1_n_0\
    );
\chars_reg[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00007F80"
    )
        port map (
      I0 => \chars_reg_reg_n_0_[1]\,
      I1 => \chars_reg_reg_n_0_[0]\,
      I2 => \chars_reg_reg_n_0_[2]\,
      I3 => \chars_reg_reg_n_0_[3]\,
      I4 => \chars_reg[3]_i_5_n_0\,
      O => chars_next(3)
    );
\chars_reg[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => \chars_reg_reg[0]_0\,
      I1 => \chars_reg_reg_n_0_[3]\,
      I2 => \chars_reg_reg_n_0_[2]\,
      I3 => \chars_reg_reg_n_0_[0]\,
      I4 => \chars_reg_reg_n_0_[1]\,
      O => \chars_reg[3]_i_3_n_0\
    );
\chars_reg[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8F"
    )
        port map (
      I0 => \^state_reg[1]_0\,
      I1 => \^state_reg[2]_0\,
      I2 => ur_done,
      O => \chars_reg[3]_i_4_n_0\
    );
\chars_reg[3]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0083"
    )
        port map (
      I0 => \chars_reg_reg[0]_0\,
      I1 => \^state_reg[2]_0\,
      I2 => \^state_reg[0]_0\,
      I3 => \^state_reg[1]_0\,
      O => \chars_reg[3]_i_5_n_0\
    );
\chars_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \chars_reg[3]_i_1_n_0\,
      D => chars_next(0),
      Q => \chars_reg_reg_n_0_[0]\,
      R => \data_reg[7]_i_1__0_n_0\
    );
\chars_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \chars_reg[3]_i_1_n_0\,
      D => chars_next(1),
      Q => \chars_reg_reg_n_0_[1]\,
      R => \data_reg[7]_i_1__0_n_0\
    );
\chars_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \chars_reg[3]_i_1_n_0\,
      D => chars_next(2),
      Q => \chars_reg_reg_n_0_[2]\,
      R => \data_reg[7]_i_1__0_n_0\
    );
\chars_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \chars_reg[3]_i_1_n_0\,
      D => chars_next(3),
      Q => \chars_reg_reg_n_0_[3]\,
      R => \data_reg[7]_i_1__0_n_0\
    );
\clk_counter[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0054"
    )
        port map (
      I0 => w_freeze_ip,
      I1 => \data_reg_reg[7]_3\,
      I2 => ap_start_stage2,
      I3 => \^done_reg_reg_0\,
      O => clk_counter
    );
data_next0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => data_next0_carry_n_0,
      CO(2) => data_next0_carry_n_1,
      CO(1) => data_next0_carry_n_2,
      CO(0) => data_next0_carry_n_3,
      CYINIT => '0',
      DI(3 downto 0) => \^q\(3 downto 0),
      O(3) => data_next0_carry_n_4,
      O(2) => data_next0_carry_n_5,
      O(1) => data_next0_carry_n_6,
      O(0) => data_next0_carry_n_7,
      S(3) => data_next0_carry_i_1_n_0,
      S(2) => data_next0_carry_i_2_n_0,
      S(1) => data_next0_carry_i_3_n_0,
      S(0) => data_next0_carry_i_4_n_0
    );
\data_next0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => data_next0_carry_n_0,
      CO(3) => \NLW_data_next0_carry__0_CO_UNCONNECTED\(3),
      CO(2) => \data_next0_carry__0_n_1\,
      CO(1) => \data_next0_carry__0_n_2\,
      CO(0) => \data_next0_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \data_next0_carry__0_i_1_n_0\,
      DI(1) => \error_char_reg_reg[7]_1\(4),
      DI(0) => DI(0),
      O(3) => \data_next0_carry__0_n_4\,
      O(2) => \data_next0_carry__0_n_5\,
      O(1) => \data_next0_carry__0_n_6\,
      O(0) => \data_next0_carry__0_n_7\,
      S(3) => \data_next0_carry__0_i_3_n_0\,
      S(2 downto 0) => S(2 downto 0)
    );
\data_next0_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(6),
      I1 => \error_char_reg_reg[7]_1\(6),
      O => \data_next0_carry__0_i_1_n_0\
    );
\data_next0_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1EE1"
    )
        port map (
      I0 => \^q\(6),
      I1 => \error_char_reg_reg[7]_1\(6),
      I2 => \^q\(7),
      I3 => \error_char_reg_reg[7]_1\(7),
      O => \data_next0_carry__0_i_3_n_0\
    );
data_next0_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(3),
      I1 => \error_char_reg_reg[7]_1\(3),
      O => data_next0_carry_i_1_n_0
    );
data_next0_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(2),
      I1 => \error_char_reg_reg[7]_1\(2),
      O => data_next0_carry_i_2_n_0
    );
data_next0_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(1),
      I1 => \error_char_reg_reg[7]_1\(1),
      O => data_next0_carry_i_3_n_0
    );
data_next0_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \error_char_reg_reg[7]_1\(0),
      O => data_next0_carry_i_4_n_0
    );
\data_next0_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \data_next0_inferred__0/i__carry_n_0\,
      CO(2) => \data_next0_inferred__0/i__carry_n_1\,
      CO(1) => \data_next0_inferred__0/i__carry_n_2\,
      CO(0) => \data_next0_inferred__0/i__carry_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^q\(4 downto 1),
      O(3 downto 0) => data_next0(4 downto 1),
      S(3) => \i__carry_i_1_n_0\,
      S(2) => \i__carry_i_2_n_0\,
      S(1) => \i__carry_i_3_n_0\,
      S(0) => \i__carry_i_4_n_0\
    );
\data_next0_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \data_next0_inferred__0/i__carry_n_0\,
      CO(3 downto 2) => \NLW_data_next0_inferred__0/i__carry__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \data_next0_inferred__0/i__carry__0_n_2\,
      CO(0) => \data_next0_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => \^q\(6 downto 5),
      O(3) => \NLW_data_next0_inferred__0/i__carry__0_O_UNCONNECTED\(3),
      O(2 downto 0) => data_next0(7 downto 5),
      S(3) => '0',
      S(2) => \i__carry__0_i_1_n_0\,
      S(1) => \i__carry__0_i_2_n_0\,
      S(0) => \i__carry__0_i_3_n_0\
    );
\data_reg[0]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E200"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^state_reg[0]_0\,
      I2 => data_next0_carry_n_7,
      I3 => \^state_reg[1]_0\,
      O => \data_reg[0]_i_1__0_n_0\
    );
\data_reg[1]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E200"
    )
        port map (
      I0 => data_next0(1),
      I1 => \^state_reg[0]_0\,
      I2 => data_next0_carry_n_6,
      I3 => \^state_reg[1]_0\,
      O => \data_reg[1]_i_1__0_n_0\
    );
\data_reg[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => data_next0_carry_n_5,
      I1 => \^state_reg[0]_0\,
      I2 => data_next0(2),
      I3 => \^state_reg[1]_0\,
      I4 => \error_char_reg_reg[7]_1\(0),
      O => \data_reg[2]_i_1__0_n_0\
    );
\data_reg[3]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => data_next0_carry_n_4,
      I1 => \^state_reg[0]_0\,
      I2 => data_next0(3),
      I3 => \^state_reg[1]_0\,
      I4 => \error_char_reg_reg[7]_1\(1),
      O => \data_reg[3]_i_1__0_n_0\
    );
\data_reg[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \data_next0_carry__0_n_7\,
      I1 => \^state_reg[0]_0\,
      I2 => data_next0(4),
      I3 => \^state_reg[1]_0\,
      I4 => \error_char_reg_reg[7]_1\(2),
      O => \data_reg[4]_i_1__0_n_0\
    );
\data_reg[5]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \data_next0_carry__0_n_6\,
      I1 => \^state_reg[0]_0\,
      I2 => data_next0(5),
      I3 => \^state_reg[1]_0\,
      I4 => multOp(5),
      O => \data_reg[5]_i_1__0_n_0\
    );
\data_reg[6]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \data_next0_carry__0_n_5\,
      I1 => \^state_reg[0]_0\,
      I2 => data_next0(6),
      I3 => \^state_reg[1]_0\,
      I4 => multOp(6),
      O => \data_reg[6]_i_1__0_n_0\
    );
\data_reg[7]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00A80000FFFFFFFF"
    )
        port map (
      I0 => \^done_reg_reg_0\,
      I1 => ap_start_stage2,
      I2 => \data_reg_reg[7]_3\,
      I3 => w_freeze_ip,
      I4 => \data_reg_reg[7]_2\,
      I5 => \data_reg_reg[7]_4\,
      O => \data_reg[7]_i_1__0_n_0\
    );
\data_reg[7]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \data_next0_carry__0_n_4\,
      I1 => \^state_reg[0]_0\,
      I2 => data_next0(7),
      I3 => \^state_reg[1]_0\,
      I4 => multOp(7),
      O => \data_reg[7]_i_3__0_n_0\
    );
\data_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \data_reg_reg[7]_5\(0),
      D => \data_reg[0]_i_1__0_n_0\,
      Q => \^q\(0),
      R => \data_reg[7]_i_1__0_n_0\
    );
\data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \data_reg_reg[7]_5\(0),
      D => \data_reg[1]_i_1__0_n_0\,
      Q => \^q\(1),
      R => \data_reg[7]_i_1__0_n_0\
    );
\data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \data_reg_reg[7]_5\(0),
      D => \data_reg[2]_i_1__0_n_0\,
      Q => \^q\(2),
      R => \data_reg[7]_i_1__0_n_0\
    );
\data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \data_reg_reg[7]_5\(0),
      D => \data_reg[3]_i_1__0_n_0\,
      Q => \^q\(3),
      R => \data_reg[7]_i_1__0_n_0\
    );
\data_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \data_reg_reg[7]_5\(0),
      D => \data_reg[4]_i_1__0_n_0\,
      Q => \^q\(4),
      R => \data_reg[7]_i_1__0_n_0\
    );
\data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \data_reg_reg[7]_5\(0),
      D => \data_reg[5]_i_1__0_n_0\,
      Q => \^q\(5),
      R => \data_reg[7]_i_1__0_n_0\
    );
\data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \data_reg_reg[7]_5\(0),
      D => \data_reg[6]_i_1__0_n_0\,
      Q => \^q\(6),
      R => \data_reg[7]_i_1__0_n_0\
    );
\data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \data_reg_reg[7]_5\(0),
      D => \data_reg[7]_i_3__0_n_0\,
      Q => \^q\(7),
      R => \data_reg[7]_i_1__0_n_0\
    );
digit_ready_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0808080808880808"
    )
        port map (
      I0 => digit_ready_reg_i_2_n_0,
      I1 => \data_reg_reg[7]_4\,
      I2 => i_enable4_out,
      I3 => ctl_done,
      I4 => ur_done,
      I5 => \^done_reg_reg_0\,
      O => digit_ready_reg_i_1_n_0
    );
digit_ready_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0074FFFF00740000"
    )
        port map (
      I0 => \^state_reg[2]_0\,
      I1 => \^state_reg[1]_0\,
      I2 => \^state_reg[0]_0\,
      I3 => digit_ready_reg_reg_0,
      I4 => i_enable4_out,
      I5 => \^ad_digit_ready\,
      O => digit_ready_reg_i_2_n_0
    );
digit_ready_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => digit_ready_reg_i_1_n_0,
      Q => \^ad_digit_ready\,
      R => '0'
    );
\digit_reg[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000CC80000"
    )
        port map (
      I0 => \^state_reg[0]_0\,
      I1 => ur_done,
      I2 => \^state_reg[2]_0\,
      I3 => \^state_reg[1]_0\,
      I4 => \data_reg_reg[7]_2\,
      I5 => \digit_reg[7]_i_4_n_0\,
      O => \digit_reg[7]_i_2_n_0\
    );
\digit_reg[7]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFAB"
    )
        port map (
      I0 => \^done_reg_reg_0\,
      I1 => ap_start_stage2,
      I2 => \data_reg_reg[7]_3\,
      I3 => w_freeze_ip,
      O => \digit_reg[7]_i_4_n_0\
    );
\digit_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \digit_reg[7]_i_2_n_0\,
      D => D(0),
      Q => \digit_reg_reg[7]_0\(0),
      R => \digit_reg_reg[0]_0\
    );
\digit_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \digit_reg[7]_i_2_n_0\,
      D => D(1),
      Q => \digit_reg_reg[7]_0\(1),
      R => \digit_reg_reg[0]_0\
    );
\digit_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \digit_reg[7]_i_2_n_0\,
      D => D(2),
      Q => \digit_reg_reg[7]_0\(2),
      R => \digit_reg_reg[0]_0\
    );
\digit_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \digit_reg[7]_i_2_n_0\,
      D => D(3),
      Q => \digit_reg_reg[7]_0\(3),
      R => \digit_reg_reg[0]_0\
    );
\digit_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \digit_reg[7]_i_2_n_0\,
      D => D(4),
      Q => \digit_reg_reg[7]_0\(4),
      R => \digit_reg_reg[0]_0\
    );
\digit_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \digit_reg[7]_i_2_n_0\,
      D => D(5),
      Q => \digit_reg_reg[7]_0\(5),
      R => \digit_reg_reg[0]_0\
    );
\digit_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \digit_reg[7]_i_2_n_0\,
      D => D(6),
      Q => \digit_reg_reg[7]_0\(6),
      R => \digit_reg_reg[0]_0\
    );
\digit_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \digit_reg[7]_i_2_n_0\,
      D => D(7),
      Q => \digit_reg_reg[7]_0\(7),
      R => \digit_reg_reg[0]_0\
    );
done_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFFFF0D0000"
    )
        port map (
      I0 => \^state_reg[0]_0\,
      I1 => \chars_reg[3]_i_3_n_0\,
      I2 => done_reg_i_2_n_0,
      I3 => ctl_done,
      I4 => i_enable4_out,
      I5 => \^done_reg_reg_0\,
      O => done_reg_i_1_n_0
    );
done_reg_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => \^state_reg[2]_0\,
      I1 => \^state_reg[1]_0\,
      I2 => ur_done,
      O => done_reg_i_2_n_0
    );
done_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => done_reg_i_1_n_0,
      Q => \^done_reg_reg_0\,
      R => global_reset
    );
\error_char_reg[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => \error_char_reg_reg[7]_1\(0),
      I1 => \^state_reg[2]_0\,
      I2 => \^state_reg[0]_0\,
      O => error_char_next(0)
    );
\error_char_reg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => \error_char_reg_reg[7]_1\(1),
      I1 => \^state_reg[2]_0\,
      I2 => \^state_reg[0]_0\,
      O => error_char_next(1)
    );
\error_char_reg[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => \error_char_reg_reg[7]_1\(2),
      I1 => \^state_reg[2]_0\,
      I2 => \^state_reg[0]_0\,
      O => error_char_next(2)
    );
\error_char_reg[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => \error_char_reg_reg[7]_1\(3),
      I1 => \^state_reg[2]_0\,
      I2 => \^state_reg[0]_0\,
      O => error_char_next(3)
    );
\error_char_reg[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => \error_char_reg_reg[7]_1\(4),
      I1 => \^state_reg[2]_0\,
      I2 => \^state_reg[0]_0\,
      O => error_char_next(4)
    );
\error_char_reg[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => \error_char_reg_reg[7]_1\(5),
      I1 => \^state_reg[2]_0\,
      I2 => \^state_reg[0]_0\,
      O => error_char_next(5)
    );
\error_char_reg[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => \error_char_reg_reg[7]_1\(6),
      I1 => \^state_reg[2]_0\,
      I2 => \^state_reg[0]_0\,
      O => error_char_next(6)
    );
\error_char_reg[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => \error_char_reg_reg[7]_1\(7),
      I1 => \^state_reg[2]_0\,
      I2 => \^state_reg[0]_0\,
      O => error_char_next(7)
    );
\error_char_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \error_char_reg_reg[7]_2\(0),
      D => error_char_next(0),
      Q => \error_char_reg_reg[7]_0\(0),
      R => \data_reg[7]_i_1__0_n_0\
    );
\error_char_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \error_char_reg_reg[7]_2\(0),
      D => error_char_next(1),
      Q => \error_char_reg_reg[7]_0\(1),
      R => \data_reg[7]_i_1__0_n_0\
    );
\error_char_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \error_char_reg_reg[7]_2\(0),
      D => error_char_next(2),
      Q => \error_char_reg_reg[7]_0\(2),
      R => \data_reg[7]_i_1__0_n_0\
    );
\error_char_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \error_char_reg_reg[7]_2\(0),
      D => error_char_next(3),
      Q => \error_char_reg_reg[7]_0\(3),
      R => \data_reg[7]_i_1__0_n_0\
    );
\error_char_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \error_char_reg_reg[7]_2\(0),
      D => error_char_next(4),
      Q => \error_char_reg_reg[7]_0\(4),
      R => \data_reg[7]_i_1__0_n_0\
    );
\error_char_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \error_char_reg_reg[7]_2\(0),
      D => error_char_next(5),
      Q => \error_char_reg_reg[7]_0\(5),
      R => \data_reg[7]_i_1__0_n_0\
    );
\error_char_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \error_char_reg_reg[7]_2\(0),
      D => error_char_next(6),
      Q => \error_char_reg_reg[7]_0\(6),
      R => \data_reg[7]_i_1__0_n_0\
    );
\error_char_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \error_char_reg_reg[7]_2\(0),
      D => error_char_next(7),
      Q => \error_char_reg_reg[7]_0\(7),
      R => \data_reg[7]_i_1__0_n_0\
    );
\error_pos_reg[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8888888B"
    )
        port map (
      I0 => \^error_pos_reg_reg[5]_0\(0),
      I1 => ctl_done,
      I2 => \^state_reg[1]_0\,
      I3 => \^state_reg[0]_0\,
      I4 => \^state_reg[2]_0\,
      O => \error_pos_reg[0]_i_1_n_0\
    );
\error_pos_reg[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888B88"
    )
        port map (
      I0 => \^error_pos_reg_reg[5]_0\(1),
      I1 => ctl_done,
      I2 => \^state_reg[2]_0\,
      I3 => \^state_reg[0]_0\,
      I4 => \^state_reg[1]_0\,
      O => \error_pos_reg[1]_i_1_n_0\
    );
\error_pos_reg[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => \^error_pos_reg_reg[5]_0\(2),
      I1 => ctl_done,
      I2 => \^state_reg[1]_0\,
      I3 => \^state_reg[0]_0\,
      O => \error_pos_reg[2]_i_1_n_0\
    );
\error_pos_reg[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => \^error_pos_reg_reg[5]_0\(3),
      I1 => ctl_done,
      I2 => \^state_reg[0]_0\,
      I3 => \^state_reg[1]_0\,
      O => \error_pos_reg[3]_i_1_n_0\
    );
\error_pos_reg[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => \^error_pos_reg_reg[5]_0\(4),
      I1 => ctl_done,
      I2 => \^state_reg[2]_0\,
      I3 => \^state_reg[0]_0\,
      O => \error_pos_reg[4]_i_1_n_0\
    );
\error_pos_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \error_pos_reg_reg[5]_1\(0),
      D => \error_pos_reg[0]_i_1_n_0\,
      Q => \^error_pos_reg_reg[5]_0\(0),
      R => \data_reg[7]_i_1__0_n_0\
    );
\error_pos_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \error_pos_reg_reg[5]_1\(0),
      D => \error_pos_reg[1]_i_1_n_0\,
      Q => \^error_pos_reg_reg[5]_0\(1),
      R => \data_reg[7]_i_1__0_n_0\
    );
\error_pos_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \error_pos_reg_reg[5]_1\(0),
      D => \error_pos_reg[2]_i_1_n_0\,
      Q => \^error_pos_reg_reg[5]_0\(2),
      R => \data_reg[7]_i_1__0_n_0\
    );
\error_pos_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \error_pos_reg_reg[5]_1\(0),
      D => \error_pos_reg[3]_i_1_n_0\,
      Q => \^error_pos_reg_reg[5]_0\(3),
      R => \data_reg[7]_i_1__0_n_0\
    );
\error_pos_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \error_pos_reg_reg[5]_1\(0),
      D => \error_pos_reg[4]_i_1_n_0\,
      Q => \^error_pos_reg_reg[5]_0\(4),
      R => \data_reg[7]_i_1__0_n_0\
    );
\error_pos_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \error_pos_reg_reg[5]_1\(0),
      D => ctl_done,
      Q => \^error_pos_reg_reg[5]_0\(5),
      R => \data_reg[7]_i_1__0_n_0\
    );
error_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FECEFEFE"
    )
        port map (
      I0 => \^error_reg\,
      I1 => error_reg_reg_0,
      I2 => error_reg_reg_1,
      I3 => error_reg_reg_2,
      I4 => \^state_reg[2]_0\,
      I5 => \data_reg[7]_i_1__0_n_0\,
      O => error_reg_i_1_n_0
    );
error_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => error_reg_i_1_n_0,
      Q => \^error_reg\,
      R => '0'
    );
first_number_is_2_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000008ABA8A8A"
    )
        port map (
      I0 => \^first_number_is_2_reg_reg_0\,
      I1 => first_number_is_2_reg_i_2_n_0,
      I2 => first_number_is_2_reg_reg_1,
      I3 => \^state_reg[2]_0\,
      I4 => first_number_is_2_reg_reg_2,
      I5 => \data_reg[7]_i_1__0_n_0\,
      O => first_number_is_2_reg_i_1_n_0
    );
first_number_is_2_reg_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FBFFFFFF"
    )
        port map (
      I0 => \^state_reg[1]_0\,
      I1 => \^state_reg[0]_0\,
      I2 => ctl_done,
      I3 => ur_done,
      I4 => i_enable4_out,
      O => first_number_is_2_reg_i_2_n_0
    );
first_number_is_2_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => first_number_is_2_reg_i_1_n_0,
      Q => \^first_number_is_2_reg_reg_0\,
      R => '0'
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(7),
      I1 => \multOp_carry__0_n_6\,
      O => \i__carry__0_i_1_n_0\
    );
\i__carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(6),
      I1 => \multOp_carry__0_n_7\,
      O => \i__carry__0_i_2_n_0\
    );
\i__carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(5),
      I1 => multOp_carry_n_4,
      O => \i__carry__0_i_3_n_0\
    );
\i__carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(4),
      I1 => multOp_carry_n_5,
      O => \i__carry_i_1_n_0\
    );
\i__carry_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(3),
      I1 => multOp_carry_n_6,
      O => \i__carry_i_2_n_0\
    );
\i__carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(2),
      I1 => multOp_carry_n_7,
      O => \i__carry_i_3_n_0\
    );
\i__carry_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(1),
      I1 => \error_char_reg_reg[7]_1\(0),
      O => \i__carry_i_4_n_0\
    );
multOp_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => multOp_carry_n_0,
      CO(2) => multOp_carry_n_1,
      CO(1) => multOp_carry_n_2,
      CO(0) => multOp_carry_n_3,
      CYINIT => '0',
      DI(3) => \i__carry_i_3_0\(0),
      DI(2 downto 1) => \error_char_reg_reg[7]_1\(3 downto 2),
      DI(0) => '0',
      O(3) => multOp_carry_n_4,
      O(2) => multOp_carry_n_5,
      O(1) => multOp_carry_n_6,
      O(0) => multOp_carry_n_7,
      S(3 downto 1) => \i__carry_i_3_1\(2 downto 0),
      S(0) => \error_char_reg_reg[7]_1\(1)
    );
\multOp_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => multOp_carry_n_0,
      CO(3 downto 1) => \NLW_multOp_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \multOp_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \error_char_reg_reg[7]_1\(3),
      O(3 downto 2) => \NLW_multOp_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \multOp_carry__0_n_6\,
      O(0) => \multOp_carry__0_n_7\,
      S(3 downto 2) => B"00",
      S(1 downto 0) => \i__carry__0_i_2_0\(1 downto 0)
    );
\multOp_inferred__0/i___0_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 2) => \NLW_multOp_inferred__0/i___0_carry_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \multOp_inferred__0/i___0_carry_n_2\,
      CO(0) => \multOp_inferred__0/i___0_carry_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \data_reg_reg[7]_0\(0),
      DI(0) => '0',
      O(3) => \NLW_multOp_inferred__0/i___0_carry_O_UNCONNECTED\(3),
      O(2 downto 0) => multOp(7 downto 5),
      S(3) => '0',
      S(2 downto 0) => \data_reg_reg[7]_1\(2 downto 0)
    );
start_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000002222222E"
    )
        port map (
      I0 => \^start_reg_reg_0\,
      I1 => i_enable4_out,
      I2 => \^state_reg[2]_0\,
      I3 => \^state_reg[0]_0\,
      I4 => \^state_reg[1]_0\,
      I5 => start_reg_reg_1,
      O => start_reg_i_1_n_0
    );
start_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => start_reg_i_1_n_0,
      Q => \^start_reg_reg_0\,
      R => '0'
    );
\state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \^state_reg[0]_0\,
      I1 => state,
      I2 => next_state(0),
      I3 => \digit_reg_reg[0]_0\,
      O => \state[0]_i_1_n_0\
    );
\state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000226E"
    )
        port map (
      I0 => \^state_reg[1]_0\,
      I1 => state,
      I2 => \^state_reg[0]_0\,
      I3 => \^state_reg[2]_1\,
      I4 => \digit_reg_reg[0]_0\,
      O => \state[1]_i_1_n_0\
    );
\state[1]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AABFFFBF"
    )
        port map (
      I0 => \^state_reg[2]_0\,
      I1 => \^state_reg[0]_0\,
      I2 => first_number_is_2_reg_reg_2,
      I3 => \^state_reg[1]_0\,
      I4 => \state_reg[1]_1\,
      O => \^state_reg[2]_1\
    );
\state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000066262626"
    )
        port map (
      I0 => \^state_reg[2]_0\,
      I1 => state,
      I2 => \state_reg[2]_2\,
      I3 => \^state_reg[1]_0\,
      I4 => \^state_reg[0]_0\,
      I5 => \digit_reg_reg[0]_0\,
      O => \state[2]_i_1_n_0\
    );
\state[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F7FF"
    )
        port map (
      I0 => \^state_reg[0]_0\,
      I1 => \^state_reg[2]_0\,
      I2 => \chars_reg_reg[0]_0\,
      I3 => \^chars_reg_reg[1]_0\,
      I4 => \state[2]_i_5_n_0\,
      O => state
    );
\state[2]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => \chars_reg_reg_n_0_[1]\,
      I1 => \chars_reg_reg_n_0_[0]\,
      I2 => \chars_reg_reg_n_0_[2]\,
      I3 => \chars_reg_reg_n_0_[3]\,
      O => \^chars_reg_reg[1]_0\
    );
\state[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFEFEFFFFFFFFF"
    )
        port map (
      I0 => \state[2]_i_2_0\,
      I1 => \^done_reg_reg_0\,
      I2 => \data_reg_reg[7]_2\,
      I3 => \^state_reg[1]_0\,
      I4 => \^state_reg[2]_0\,
      I5 => ur_done,
      O => \state[2]_i_5_n_0\
    );
\state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \state[0]_i_1_n_0\,
      Q => \^state_reg[0]_0\,
      R => '0'
    );
\state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \state[1]_i_1_n_0\,
      Q => \^state_reg[1]_0\,
      R => '0'
    );
\state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \state[2]_i_1_n_0\,
      Q => \^state_reg[2]_0\,
      R => '0'
    );
update_window_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F2F2F0F0F0F2F0F0"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => w_reset_ip,
      I2 => \^start_reg_reg_0\,
      I3 => \^done_reg_reg_0\,
      I4 => update_window,
      I5 => w_freeze_ip,
      O => s00_axi_aresetn_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mbblockdesign_as_1_0_baud_rate_generator is
  port (
    bd_gen_tick : out STD_LOGIC;
    global_reset : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    w_reset_ip : in STD_LOGIC;
    o_baud_enable : in STD_LOGIC;
    i_enable4_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of mbblockdesign_as_1_0_baud_rate_generator : entity is "baud_rate_generator";
end mbblockdesign_as_1_0_baud_rate_generator;

architecture STRUCTURE of mbblockdesign_as_1_0_baud_rate_generator is
  signal \^bd_gen_tick\ : STD_LOGIC;
  signal overflow : STD_LOGIC;
  signal overflow_i_1_n_0 : STD_LOGIC;
  signal overflow_i_3_n_0 : STD_LOGIC;
  signal prev_enable : STD_LOGIC;
  signal value : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \value[0]_i_2_n_0\ : STD_LOGIC;
  signal \value[1]_i_1_n_0\ : STD_LOGIC;
  signal \value[2]_i_2_n_0\ : STD_LOGIC;
  signal \value[2]_i_3_n_0\ : STD_LOGIC;
  signal \value[5]_i_2_n_0\ : STD_LOGIC;
  signal \value[9]_i_1_n_0\ : STD_LOGIC;
  signal \value[9]_i_3_n_0\ : STD_LOGIC;
  signal \value[9]_i_4_n_0\ : STD_LOGIC;
  signal \value_reg_n_0_[0]\ : STD_LOGIC;
  signal \value_reg_n_0_[1]\ : STD_LOGIC;
  signal \value_reg_n_0_[2]\ : STD_LOGIC;
  signal \value_reg_n_0_[3]\ : STD_LOGIC;
  signal \value_reg_n_0_[4]\ : STD_LOGIC;
  signal \value_reg_n_0_[5]\ : STD_LOGIC;
  signal \value_reg_n_0_[6]\ : STD_LOGIC;
  signal \value_reg_n_0_[7]\ : STD_LOGIC;
  signal \value_reg_n_0_[8]\ : STD_LOGIC;
  signal \value_reg_n_0_[9]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \value[2]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \value[5]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \value[6]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \value[7]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \value[8]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \value[9]_i_3\ : label is "soft_lutpair12";
begin
  bd_gen_tick <= \^bd_gen_tick\;
overflow_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00C000A0000000A0"
    )
        port map (
      I0 => \^bd_gen_tick\,
      I1 => overflow,
      I2 => s00_axi_aresetn,
      I3 => w_reset_ip,
      I4 => E(0),
      I5 => prev_enable,
      O => overflow_i_1_n_0
    );
overflow_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => \value_reg_n_0_[7]\,
      I1 => \value_reg_n_0_[8]\,
      I2 => overflow_i_3_n_0,
      I3 => \value_reg_n_0_[6]\,
      I4 => \value_reg_n_0_[9]\,
      O => overflow
    );
overflow_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000040000"
    )
        port map (
      I0 => \value_reg_n_0_[4]\,
      I1 => \value_reg_n_0_[1]\,
      I2 => \value_reg_n_0_[0]\,
      I3 => \value_reg_n_0_[2]\,
      I4 => \value_reg_n_0_[3]\,
      I5 => \value_reg_n_0_[5]\,
      O => overflow_i_3_n_0
    );
overflow_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => overflow_i_1_n_0,
      Q => \^bd_gen_tick\,
      R => '0'
    );
prev_enable_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => E(0),
      Q => prev_enable,
      R => global_reset
    );
\value[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"10000000FEFFFFFF"
    )
        port map (
      I0 => \value_reg_n_0_[6]\,
      I1 => \value_reg_n_0_[8]\,
      I2 => \value[0]_i_2_n_0\,
      I3 => \value_reg_n_0_[7]\,
      I4 => \value_reg_n_0_[9]\,
      I5 => \value_reg_n_0_[0]\,
      O => value(0)
    );
\value[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FEFFFFFF"
    )
        port map (
      I0 => \value_reg_n_0_[5]\,
      I1 => \value_reg_n_0_[4]\,
      I2 => \value_reg_n_0_[2]\,
      I3 => \value_reg_n_0_[1]\,
      I4 => \value_reg_n_0_[3]\,
      I5 => \value_reg_n_0_[0]\,
      O => \value[0]_i_2_n_0\
    );
\value[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"51FFFFFFA2FF0000"
    )
        port map (
      I0 => \value_reg_n_0_[0]\,
      I1 => \value_reg_n_0_[9]\,
      I2 => \value[2]_i_2_n_0\,
      I3 => prev_enable,
      I4 => E(0),
      I5 => \value_reg_n_0_[1]\,
      O => \value[1]_i_1_n_0\
    );
\value[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0BBBB000"
    )
        port map (
      I0 => \value[2]_i_2_n_0\,
      I1 => \value_reg_n_0_[9]\,
      I2 => \value_reg_n_0_[1]\,
      I3 => \value_reg_n_0_[0]\,
      I4 => \value_reg_n_0_[2]\,
      O => value(2)
    );
\value[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEFF"
    )
        port map (
      I0 => \value_reg_n_0_[6]\,
      I1 => \value[2]_i_3_n_0\,
      I2 => \value_reg_n_0_[8]\,
      I3 => \value_reg_n_0_[7]\,
      O => \value[2]_i_2_n_0\
    );
\value[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFBFFFF"
    )
        port map (
      I0 => \value_reg_n_0_[4]\,
      I1 => \value_reg_n_0_[1]\,
      I2 => \value_reg_n_0_[2]\,
      I3 => \value_reg_n_0_[0]\,
      I4 => \value_reg_n_0_[3]\,
      I5 => \value_reg_n_0_[5]\,
      O => \value[2]_i_3_n_0\
    );
\value[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"28888888"
    )
        port map (
      I0 => \value[9]_i_3_n_0\,
      I1 => \value_reg_n_0_[3]\,
      I2 => \value_reg_n_0_[2]\,
      I3 => \value_reg_n_0_[0]\,
      I4 => \value_reg_n_0_[1]\,
      O => value(3)
    );
\value[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2888888888888888"
    )
        port map (
      I0 => \value[9]_i_3_n_0\,
      I1 => \value_reg_n_0_[4]\,
      I2 => \value_reg_n_0_[1]\,
      I3 => \value_reg_n_0_[0]\,
      I4 => \value_reg_n_0_[2]\,
      I5 => \value_reg_n_0_[3]\,
      O => value(4)
    );
\value[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \value[9]_i_3_n_0\,
      I1 => \value_reg_n_0_[5]\,
      I2 => \value[5]_i_2_n_0\,
      O => value(5)
    );
\value[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \value_reg_n_0_[3]\,
      I1 => \value_reg_n_0_[2]\,
      I2 => \value_reg_n_0_[0]\,
      I3 => \value_reg_n_0_[1]\,
      I4 => \value_reg_n_0_[4]\,
      O => \value[5]_i_2_n_0\
    );
\value[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \value[9]_i_3_n_0\,
      I1 => \value_reg_n_0_[6]\,
      I2 => \value[9]_i_4_n_0\,
      O => value(6)
    );
\value[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2888"
    )
        port map (
      I0 => \value[9]_i_3_n_0\,
      I1 => \value_reg_n_0_[7]\,
      I2 => \value[9]_i_4_n_0\,
      I3 => \value_reg_n_0_[6]\,
      O => value(7)
    );
\value[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"28888888"
    )
        port map (
      I0 => \value[9]_i_3_n_0\,
      I1 => \value_reg_n_0_[8]\,
      I2 => \value_reg_n_0_[6]\,
      I3 => \value[9]_i_4_n_0\,
      I4 => \value_reg_n_0_[7]\,
      O => value(8)
    );
\value[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40FFFF"
    )
        port map (
      I0 => prev_enable,
      I1 => o_baud_enable,
      I2 => i_enable4_out,
      I3 => w_reset_ip,
      I4 => s00_axi_aresetn,
      O => \value[9]_i_1_n_0\
    );
\value[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2888888888888888"
    )
        port map (
      I0 => \value[9]_i_3_n_0\,
      I1 => \value_reg_n_0_[9]\,
      I2 => \value_reg_n_0_[6]\,
      I3 => \value[9]_i_4_n_0\,
      I4 => \value_reg_n_0_[8]\,
      I5 => \value_reg_n_0_[7]\,
      O => value(9)
    );
\value[9]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \value[2]_i_2_n_0\,
      I1 => \value_reg_n_0_[9]\,
      O => \value[9]_i_3_n_0\
    );
\value[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \value_reg_n_0_[4]\,
      I1 => \value_reg_n_0_[1]\,
      I2 => \value_reg_n_0_[0]\,
      I3 => \value_reg_n_0_[2]\,
      I4 => \value_reg_n_0_[3]\,
      I5 => \value_reg_n_0_[5]\,
      O => \value[9]_i_4_n_0\
    );
\value_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => E(0),
      D => value(0),
      Q => \value_reg_n_0_[0]\,
      R => \value[9]_i_1_n_0\
    );
\value_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \value[1]_i_1_n_0\,
      Q => \value_reg_n_0_[1]\,
      R => global_reset
    );
\value_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => E(0),
      D => value(2),
      Q => \value_reg_n_0_[2]\,
      R => \value[9]_i_1_n_0\
    );
\value_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => E(0),
      D => value(3),
      Q => \value_reg_n_0_[3]\,
      R => \value[9]_i_1_n_0\
    );
\value_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => E(0),
      D => value(4),
      Q => \value_reg_n_0_[4]\,
      R => \value[9]_i_1_n_0\
    );
\value_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => E(0),
      D => value(5),
      Q => \value_reg_n_0_[5]\,
      R => \value[9]_i_1_n_0\
    );
\value_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => E(0),
      D => value(6),
      Q => \value_reg_n_0_[6]\,
      R => \value[9]_i_1_n_0\
    );
\value_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => E(0),
      D => value(7),
      Q => \value_reg_n_0_[7]\,
      R => \value[9]_i_1_n_0\
    );
\value_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => E(0),
      D => value(8),
      Q => \value_reg_n_0_[8]\,
      R => \value[9]_i_1_n_0\
    );
\value_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => E(0),
      D => value(9),
      Q => \value_reg_n_0_[9]\,
      R => \value[9]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mbblockdesign_as_1_0_control_timer is
  port (
    ctl_done : out STD_LOGIC;
    \SCSR0_reg_reg[7]\ : out STD_LOGIC;
    o_done_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    config_done_reg_reg_0 : out STD_LOGIC;
    o_done_reg_1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    i_enable4_out : out STD_LOGIC;
    o_tx : out STD_LOGIC;
    powerup_done_reg_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    done_reg_reg : out STD_LOGIC;
    \SCSR0_reg_reg[7]_0\ : out STD_LOGIC;
    done_reg_reg_0 : out STD_LOGIC;
    clk_counter : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    \clk_counter_reg[0]_0\ : in STD_LOGIC;
    ap_start_stage2 : in STD_LOGIC;
    \clk_counter_reg[0]_1\ : in STD_LOGIC;
    w_freeze_ip : in STD_LOGIC;
    \error_pos_reg_reg[5]\ : in STD_LOGIC;
    ur_done : in STD_LOGIC;
    \data_reg_reg[7]\ : in STD_LOGIC;
    \ms_counter_reg[0]_0\ : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    w_reset_ip : in STD_LOGIC;
    o_tx_0 : in STD_LOGIC;
    w_auto_restart : in STD_LOGIC;
    global_reset : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of mbblockdesign_as_1_0_control_timer : entity is "control_timer";
end mbblockdesign_as_1_0_control_timer;

architecture STRUCTURE of mbblockdesign_as_1_0_control_timer is
  signal \^scsr0_reg_reg[7]\ : STD_LOGIC;
  signal \clk_counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \clk_counter[0]_i_4_n_0\ : STD_LOGIC;
  signal clk_counter_reg : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal \clk_counter_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \clk_counter_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \clk_counter_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \clk_counter_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \clk_counter_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \clk_counter_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \clk_counter_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \clk_counter_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \clk_counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \clk_counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \clk_counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \clk_counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \clk_counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \clk_counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \clk_counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \clk_counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \clk_counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \clk_counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \clk_counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \clk_counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \clk_counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \clk_counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \clk_counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \clk_counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \clk_counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \clk_counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \clk_counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \clk_counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \clk_counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \clk_counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \clk_counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \clk_counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \clk_counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal config_done_reg_i_1_n_0 : STD_LOGIC;
  signal \^config_done_reg_reg_0\ : STD_LOGIC;
  signal \^ctl_done\ : STD_LOGIC;
  signal done_next : STD_LOGIC;
  signal \^i_enable4_out\ : STD_LOGIC;
  signal ms_counter : STD_LOGIC;
  signal \ms_counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \ms_counter[0]_i_4_n_0\ : STD_LOGIC;
  signal \ms_counter[0]_i_5_n_0\ : STD_LOGIC;
  signal \ms_counter[0]_i_6_n_0\ : STD_LOGIC;
  signal \ms_counter[0]_i_7_n_0\ : STD_LOGIC;
  signal \ms_counter[0]_i_8_n_0\ : STD_LOGIC;
  signal \ms_counter_next1_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \ms_counter_next1_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \ms_counter_next1_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \ms_counter_next1_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \ms_counter_next1_carry__0_n_0\ : STD_LOGIC;
  signal \ms_counter_next1_carry__0_n_1\ : STD_LOGIC;
  signal \ms_counter_next1_carry__0_n_2\ : STD_LOGIC;
  signal \ms_counter_next1_carry__0_n_3\ : STD_LOGIC;
  signal \ms_counter_next1_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \ms_counter_next1_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \ms_counter_next1_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \ms_counter_next1_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \ms_counter_next1_carry__1_n_0\ : STD_LOGIC;
  signal \ms_counter_next1_carry__1_n_1\ : STD_LOGIC;
  signal \ms_counter_next1_carry__1_n_2\ : STD_LOGIC;
  signal \ms_counter_next1_carry__1_n_3\ : STD_LOGIC;
  signal \ms_counter_next1_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \ms_counter_next1_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \ms_counter_next1_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \ms_counter_next1_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \ms_counter_next1_carry__2_n_0\ : STD_LOGIC;
  signal \ms_counter_next1_carry__2_n_1\ : STD_LOGIC;
  signal \ms_counter_next1_carry__2_n_2\ : STD_LOGIC;
  signal \ms_counter_next1_carry__2_n_3\ : STD_LOGIC;
  signal ms_counter_next1_carry_i_1_n_0 : STD_LOGIC;
  signal ms_counter_next1_carry_i_2_n_0 : STD_LOGIC;
  signal ms_counter_next1_carry_i_3_n_0 : STD_LOGIC;
  signal ms_counter_next1_carry_i_4_n_0 : STD_LOGIC;
  signal ms_counter_next1_carry_i_5_n_0 : STD_LOGIC;
  signal ms_counter_next1_carry_i_6_n_0 : STD_LOGIC;
  signal ms_counter_next1_carry_i_7_n_0 : STD_LOGIC;
  signal ms_counter_next1_carry_i_8_n_0 : STD_LOGIC;
  signal ms_counter_next1_carry_n_0 : STD_LOGIC;
  signal ms_counter_next1_carry_n_1 : STD_LOGIC;
  signal ms_counter_next1_carry_n_2 : STD_LOGIC;
  signal ms_counter_next1_carry_n_3 : STD_LOGIC;
  signal ms_counter_next2 : STD_LOGIC_VECTOR ( 5 downto 1 );
  signal ms_counter_next2_carry_i_1_n_0 : STD_LOGIC;
  signal ms_counter_next2_carry_i_2_n_0 : STD_LOGIC;
  signal ms_counter_next2_carry_i_3_n_0 : STD_LOGIC;
  signal ms_counter_next2_carry_i_4_n_0 : STD_LOGIC;
  signal ms_counter_next2_carry_n_0 : STD_LOGIC;
  signal ms_counter_next2_carry_n_1 : STD_LOGIC;
  signal ms_counter_next2_carry_n_2 : STD_LOGIC;
  signal ms_counter_next2_carry_n_3 : STD_LOGIC;
  signal ms_counter_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \ms_counter_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \ms_counter_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \ms_counter_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \ms_counter_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \ms_counter_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \ms_counter_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \ms_counter_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \ms_counter_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \ms_counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \ms_counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \ms_counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \ms_counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \ms_counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \ms_counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \ms_counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \ms_counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \ms_counter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \ms_counter_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \ms_counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \ms_counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \ms_counter_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \ms_counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \ms_counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \ms_counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \ms_counter_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \ms_counter_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \ms_counter_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \ms_counter_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \ms_counter_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \ms_counter_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \ms_counter_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \ms_counter_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \ms_counter_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \ms_counter_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \ms_counter_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \ms_counter_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \ms_counter_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \ms_counter_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \ms_counter_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \ms_counter_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \ms_counter_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \ms_counter_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \ms_counter_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \ms_counter_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \ms_counter_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \ms_counter_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \ms_counter_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \ms_counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \ms_counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \ms_counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \ms_counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \ms_counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \ms_counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \ms_counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \ms_counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \ms_counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \ms_counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \ms_counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \ms_counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \ms_counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \ms_counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \ms_counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \ms_counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal ms_target : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \ms_target[0]_i_1_n_0\ : STD_LOGIC;
  signal \ms_target[1]_i_1_n_0\ : STD_LOGIC;
  signal \ms_target[2]_i_1_n_0\ : STD_LOGIC;
  signal \ms_target[4]_i_1_n_0\ : STD_LOGIC;
  signal \ms_target[6]_i_1_n_0\ : STD_LOGIC;
  signal \ms_target[6]_i_2_n_0\ : STD_LOGIC;
  signal \ms_target[7]_i_1_n_0\ : STD_LOGIC;
  signal \ms_target_reg_n_0_[0]\ : STD_LOGIC;
  signal \ms_target_reg_n_0_[1]\ : STD_LOGIC;
  signal \ms_target_reg_n_0_[2]\ : STD_LOGIC;
  signal \ms_target_reg_n_0_[4]\ : STD_LOGIC;
  signal \ms_target_reg_n_0_[6]\ : STD_LOGIC;
  signal \ms_target_reg_n_0_[7]\ : STD_LOGIC;
  signal o_done_i_1_n_0 : STD_LOGIC;
  signal powerup_done_reg_i_1_n_0 : STD_LOGIC;
  signal \^powerup_done_reg_reg_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \state[0]_i_1_n_0\ : STD_LOGIC;
  signal \state[1]_i_1_n_0\ : STD_LOGIC;
  signal \state_reg_n_0_[0]\ : STD_LOGIC;
  signal \NLW_clk_counter_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_clk_counter_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_ms_counter_next1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_ms_counter_next1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_ms_counter_next1_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_ms_counter_next1_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_ms_counter_next1_carry_i_9_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_ms_counter_next1_carry_i_9_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_ms_counter_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \clk_counter_reg[0]_i_3\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_counter_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_counter_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_counter_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_counter_reg[8]_i_1\ : label is 11;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \data_reg[7]_i_3\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of error_reg_i_2 : label is "soft_lutpair14";
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of ms_counter_next1_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \ms_counter_next1_carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \ms_counter_next1_carry__1\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \ms_counter_next1_carry__2\ : label is 11;
  attribute ADDER_THRESHOLD of \ms_counter_reg[0]_i_3\ : label is 11;
  attribute ADDER_THRESHOLD of \ms_counter_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \ms_counter_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \ms_counter_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \ms_counter_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \ms_counter_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \ms_counter_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \ms_counter_reg[8]_i_1\ : label is 11;
begin
  \SCSR0_reg_reg[7]\ <= \^scsr0_reg_reg[7]\;
  config_done_reg_reg_0 <= \^config_done_reg_reg_0\;
  ctl_done <= \^ctl_done\;
  i_enable4_out <= \^i_enable4_out\;
  powerup_done_reg_reg_0(0) <= \^powerup_done_reg_reg_0\(0);
\clk_counter[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBBBFBFBFBBB"
    )
        port map (
      I0 => ms_counter,
      I1 => \clk_counter_reg[0]_0\,
      I2 => \ms_counter_reg[0]_0\,
      I3 => ap_start_stage2,
      I4 => \clk_counter_reg[0]_1\,
      I5 => w_freeze_ip,
      O => \clk_counter[0]_i_1_n_0\
    );
\clk_counter[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_counter_reg(0),
      O => \clk_counter[0]_i_4_n_0\
    );
\clk_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => clk_counter,
      D => \clk_counter_reg[0]_i_3_n_7\,
      Q => clk_counter_reg(0),
      R => \clk_counter[0]_i_1_n_0\
    );
\clk_counter_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \clk_counter_reg[0]_i_3_n_0\,
      CO(2) => \clk_counter_reg[0]_i_3_n_1\,
      CO(1) => \clk_counter_reg[0]_i_3_n_2\,
      CO(0) => \clk_counter_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \clk_counter_reg[0]_i_3_n_4\,
      O(2) => \clk_counter_reg[0]_i_3_n_5\,
      O(1) => \clk_counter_reg[0]_i_3_n_6\,
      O(0) => \clk_counter_reg[0]_i_3_n_7\,
      S(3 downto 1) => clk_counter_reg(3 downto 1),
      S(0) => \clk_counter[0]_i_4_n_0\
    );
\clk_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => clk_counter,
      D => \clk_counter_reg[8]_i_1_n_5\,
      Q => clk_counter_reg(10),
      R => \clk_counter[0]_i_1_n_0\
    );
\clk_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => clk_counter,
      D => \clk_counter_reg[8]_i_1_n_4\,
      Q => clk_counter_reg(11),
      R => \clk_counter[0]_i_1_n_0\
    );
\clk_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => clk_counter,
      D => \clk_counter_reg[12]_i_1_n_7\,
      Q => clk_counter_reg(12),
      R => \clk_counter[0]_i_1_n_0\
    );
\clk_counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_counter_reg[8]_i_1_n_0\,
      CO(3) => \clk_counter_reg[12]_i_1_n_0\,
      CO(2) => \clk_counter_reg[12]_i_1_n_1\,
      CO(1) => \clk_counter_reg[12]_i_1_n_2\,
      CO(0) => \clk_counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk_counter_reg[12]_i_1_n_4\,
      O(2) => \clk_counter_reg[12]_i_1_n_5\,
      O(1) => \clk_counter_reg[12]_i_1_n_6\,
      O(0) => \clk_counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => clk_counter_reg(15 downto 12)
    );
\clk_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => clk_counter,
      D => \clk_counter_reg[12]_i_1_n_6\,
      Q => clk_counter_reg(13),
      R => \clk_counter[0]_i_1_n_0\
    );
\clk_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => clk_counter,
      D => \clk_counter_reg[12]_i_1_n_5\,
      Q => clk_counter_reg(14),
      R => \clk_counter[0]_i_1_n_0\
    );
\clk_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => clk_counter,
      D => \clk_counter_reg[12]_i_1_n_4\,
      Q => clk_counter_reg(15),
      R => \clk_counter[0]_i_1_n_0\
    );
\clk_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => clk_counter,
      D => \clk_counter_reg[16]_i_1_n_7\,
      Q => clk_counter_reg(16),
      R => \clk_counter[0]_i_1_n_0\
    );
\clk_counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_counter_reg[12]_i_1_n_0\,
      CO(3 downto 0) => \NLW_clk_counter_reg[16]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_clk_counter_reg[16]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \clk_counter_reg[16]_i_1_n_7\,
      S(3 downto 1) => B"000",
      S(0) => clk_counter_reg(16)
    );
\clk_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => clk_counter,
      D => \clk_counter_reg[0]_i_3_n_6\,
      Q => clk_counter_reg(1),
      R => \clk_counter[0]_i_1_n_0\
    );
\clk_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => clk_counter,
      D => \clk_counter_reg[0]_i_3_n_5\,
      Q => clk_counter_reg(2),
      R => \clk_counter[0]_i_1_n_0\
    );
\clk_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => clk_counter,
      D => \clk_counter_reg[0]_i_3_n_4\,
      Q => clk_counter_reg(3),
      R => \clk_counter[0]_i_1_n_0\
    );
\clk_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => clk_counter,
      D => \clk_counter_reg[4]_i_1_n_7\,
      Q => clk_counter_reg(4),
      R => \clk_counter[0]_i_1_n_0\
    );
\clk_counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_counter_reg[0]_i_3_n_0\,
      CO(3) => \clk_counter_reg[4]_i_1_n_0\,
      CO(2) => \clk_counter_reg[4]_i_1_n_1\,
      CO(1) => \clk_counter_reg[4]_i_1_n_2\,
      CO(0) => \clk_counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk_counter_reg[4]_i_1_n_4\,
      O(2) => \clk_counter_reg[4]_i_1_n_5\,
      O(1) => \clk_counter_reg[4]_i_1_n_6\,
      O(0) => \clk_counter_reg[4]_i_1_n_7\,
      S(3 downto 0) => clk_counter_reg(7 downto 4)
    );
\clk_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => clk_counter,
      D => \clk_counter_reg[4]_i_1_n_6\,
      Q => clk_counter_reg(5),
      R => \clk_counter[0]_i_1_n_0\
    );
\clk_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => clk_counter,
      D => \clk_counter_reg[4]_i_1_n_5\,
      Q => clk_counter_reg(6),
      R => \clk_counter[0]_i_1_n_0\
    );
\clk_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => clk_counter,
      D => \clk_counter_reg[4]_i_1_n_4\,
      Q => clk_counter_reg(7),
      R => \clk_counter[0]_i_1_n_0\
    );
\clk_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => clk_counter,
      D => \clk_counter_reg[8]_i_1_n_7\,
      Q => clk_counter_reg(8),
      R => \clk_counter[0]_i_1_n_0\
    );
\clk_counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_counter_reg[4]_i_1_n_0\,
      CO(3) => \clk_counter_reg[8]_i_1_n_0\,
      CO(2) => \clk_counter_reg[8]_i_1_n_1\,
      CO(1) => \clk_counter_reg[8]_i_1_n_2\,
      CO(0) => \clk_counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk_counter_reg[8]_i_1_n_4\,
      O(2) => \clk_counter_reg[8]_i_1_n_5\,
      O(1) => \clk_counter_reg[8]_i_1_n_6\,
      O(0) => \clk_counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => clk_counter_reg(11 downto 8)
    );
\clk_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => clk_counter,
      D => \clk_counter_reg[8]_i_1_n_6\,
      Q => clk_counter_reg(9),
      R => \clk_counter[0]_i_1_n_0\
    );
config_done_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0020"
    )
        port map (
      I0 => \state_reg_n_0_[0]\,
      I1 => \ms_counter_next1_carry__2_n_0\,
      I2 => ms_counter,
      I3 => done_next,
      I4 => \^config_done_reg_reg_0\,
      O => config_done_reg_i_1_n_0
    );
config_done_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => config_done_reg_i_1_n_0,
      Q => \^config_done_reg_reg_0\,
      R => global_reset
    );
\data_reg[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => \^ctl_done\,
      I1 => ur_done,
      I2 => \^i_enable4_out\,
      I3 => \data_reg_reg[7]\,
      O => o_done_reg_1(0)
    );
\data_reg[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00A8"
    )
        port map (
      I0 => \^config_done_reg_reg_0\,
      I1 => ap_start_stage2,
      I2 => \clk_counter_reg[0]_1\,
      I3 => w_freeze_ip,
      O => \^i_enable4_out\
    );
\digit_reg[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40FFFF"
    )
        port map (
      I0 => \ms_counter_reg[0]_0\,
      I1 => \^i_enable4_out\,
      I2 => \^ctl_done\,
      I3 => w_reset_ip,
      I4 => s00_axi_aresetn,
      O => done_reg_reg
    );
\error_pos_reg[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00008880"
    )
        port map (
      I0 => \^ctl_done\,
      I1 => \^config_done_reg_reg_0\,
      I2 => ap_start_stage2,
      I3 => \clk_counter_reg[0]_1\,
      I4 => w_freeze_ip,
      I5 => \error_pos_reg_reg[5]\,
      O => o_done_reg_0(0)
    );
error_reg_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"54000000"
    )
        port map (
      I0 => w_freeze_ip,
      I1 => \clk_counter_reg[0]_1\,
      I2 => ap_start_stage2,
      I3 => \^config_done_reg_reg_0\,
      I4 => \^ctl_done\,
      O => \SCSR0_reg_reg[7]_0\
    );
\ms_counter[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDFDFFFFDDFDDDFD"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => w_reset_ip,
      I2 => \ms_counter_reg[0]_0\,
      I3 => \^scsr0_reg_reg[7]\,
      I4 => \ms_counter_next1_carry__2_n_0\,
      I5 => ms_counter,
      O => \ms_counter[0]_i_1_n_0\
    );
\ms_counter[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000EAAA"
    )
        port map (
      I0 => \ms_counter[0]_i_4_n_0\,
      I1 => \ms_counter[0]_i_5_n_0\,
      I2 => clk_counter_reg(9),
      I3 => clk_counter_reg(10),
      I4 => \ms_counter[0]_i_6_n_0\,
      O => ms_counter
    );
\ms_counter[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => clk_counter_reg(11),
      I1 => clk_counter_reg(14),
      I2 => clk_counter_reg(12),
      I3 => clk_counter_reg(13),
      O => \ms_counter[0]_i_4_n_0\
    );
\ms_counter[0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFBAAAA"
    )
        port map (
      I0 => clk_counter_reg(8),
      I1 => \ms_counter[0]_i_8_n_0\,
      I2 => clk_counter_reg(5),
      I3 => clk_counter_reg(6),
      I4 => clk_counter_reg(7),
      O => \ms_counter[0]_i_5_n_0\
    );
\ms_counter[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFABFFFFFFFFFFFF"
    )
        port map (
      I0 => w_freeze_ip,
      I1 => \clk_counter_reg[0]_1\,
      I2 => ap_start_stage2,
      I3 => \ms_counter_reg[0]_0\,
      I4 => clk_counter_reg(15),
      I5 => clk_counter_reg(16),
      O => \ms_counter[0]_i_6_n_0\
    );
\ms_counter[0]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ms_counter_reg(0),
      O => \ms_counter[0]_i_7_n_0\
    );
\ms_counter[0]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => clk_counter_reg(3),
      I1 => clk_counter_reg(4),
      I2 => clk_counter_reg(0),
      I3 => clk_counter_reg(2),
      I4 => clk_counter_reg(1),
      O => \ms_counter[0]_i_8_n_0\
    );
ms_counter_next1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => ms_counter_next1_carry_n_0,
      CO(2) => ms_counter_next1_carry_n_1,
      CO(1) => ms_counter_next1_carry_n_2,
      CO(0) => ms_counter_next1_carry_n_3,
      CYINIT => '0',
      DI(3) => ms_counter_next1_carry_i_1_n_0,
      DI(2) => ms_counter_next1_carry_i_2_n_0,
      DI(1) => ms_counter_next1_carry_i_3_n_0,
      DI(0) => ms_counter_next1_carry_i_4_n_0,
      O(3 downto 0) => NLW_ms_counter_next1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => ms_counter_next1_carry_i_5_n_0,
      S(2) => ms_counter_next1_carry_i_6_n_0,
      S(1) => ms_counter_next1_carry_i_7_n_0,
      S(0) => ms_counter_next1_carry_i_8_n_0
    );
\ms_counter_next1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => ms_counter_next1_carry_n_0,
      CO(3) => \ms_counter_next1_carry__0_n_0\,
      CO(2) => \ms_counter_next1_carry__0_n_1\,
      CO(1) => \ms_counter_next1_carry__0_n_2\,
      CO(0) => \ms_counter_next1_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_ms_counter_next1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \ms_counter_next1_carry__0_i_1_n_0\,
      S(2) => \ms_counter_next1_carry__0_i_2_n_0\,
      S(1) => \ms_counter_next1_carry__0_i_3_n_0\,
      S(0) => \ms_counter_next1_carry__0_i_4_n_0\
    );
\ms_counter_next1_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ms_counter_reg(15),
      I1 => ms_counter_reg(14),
      O => \ms_counter_next1_carry__0_i_1_n_0\
    );
\ms_counter_next1_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ms_counter_reg(13),
      I1 => ms_counter_reg(12),
      O => \ms_counter_next1_carry__0_i_2_n_0\
    );
\ms_counter_next1_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ms_counter_reg(11),
      I1 => ms_counter_reg(10),
      O => \ms_counter_next1_carry__0_i_3_n_0\
    );
\ms_counter_next1_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ms_counter_reg(9),
      I1 => ms_counter_reg(8),
      O => \ms_counter_next1_carry__0_i_4_n_0\
    );
\ms_counter_next1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \ms_counter_next1_carry__0_n_0\,
      CO(3) => \ms_counter_next1_carry__1_n_0\,
      CO(2) => \ms_counter_next1_carry__1_n_1\,
      CO(1) => \ms_counter_next1_carry__1_n_2\,
      CO(0) => \ms_counter_next1_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_ms_counter_next1_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \ms_counter_next1_carry__1_i_1_n_0\,
      S(2) => \ms_counter_next1_carry__1_i_2_n_0\,
      S(1) => \ms_counter_next1_carry__1_i_3_n_0\,
      S(0) => \ms_counter_next1_carry__1_i_4_n_0\
    );
\ms_counter_next1_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ms_counter_reg(23),
      I1 => ms_counter_reg(22),
      O => \ms_counter_next1_carry__1_i_1_n_0\
    );
\ms_counter_next1_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ms_counter_reg(21),
      I1 => ms_counter_reg(20),
      O => \ms_counter_next1_carry__1_i_2_n_0\
    );
\ms_counter_next1_carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ms_counter_reg(19),
      I1 => ms_counter_reg(18),
      O => \ms_counter_next1_carry__1_i_3_n_0\
    );
\ms_counter_next1_carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ms_counter_reg(17),
      I1 => ms_counter_reg(16),
      O => \ms_counter_next1_carry__1_i_4_n_0\
    );
\ms_counter_next1_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \ms_counter_next1_carry__1_n_0\,
      CO(3) => \ms_counter_next1_carry__2_n_0\,
      CO(2) => \ms_counter_next1_carry__2_n_1\,
      CO(1) => \ms_counter_next1_carry__2_n_2\,
      CO(0) => \ms_counter_next1_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => ms_counter_reg(31),
      DI(2 downto 0) => B"000",
      O(3 downto 0) => \NLW_ms_counter_next1_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \ms_counter_next1_carry__2_i_1_n_0\,
      S(2) => \ms_counter_next1_carry__2_i_2_n_0\,
      S(1) => \ms_counter_next1_carry__2_i_3_n_0\,
      S(0) => \ms_counter_next1_carry__2_i_4_n_0\
    );
\ms_counter_next1_carry__2_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ms_counter_reg(31),
      I1 => ms_counter_reg(30),
      O => \ms_counter_next1_carry__2_i_1_n_0\
    );
\ms_counter_next1_carry__2_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ms_counter_reg(29),
      I1 => ms_counter_reg(28),
      O => \ms_counter_next1_carry__2_i_2_n_0\
    );
\ms_counter_next1_carry__2_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ms_counter_reg(27),
      I1 => ms_counter_reg(26),
      O => \ms_counter_next1_carry__2_i_3_n_0\
    );
\ms_counter_next1_carry__2_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ms_counter_reg(25),
      I1 => ms_counter_reg(24),
      O => \ms_counter_next1_carry__2_i_4_n_0\
    );
ms_counter_next1_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \ms_target_reg_n_0_[7]\,
      I1 => ms_counter_reg(7),
      I2 => \ms_target_reg_n_0_[6]\,
      I3 => ms_counter_reg(6),
      O => ms_counter_next1_carry_i_1_n_0
    );
ms_counter_next1_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => ms_counter_next2(5),
      I1 => ms_counter_reg(5),
      I2 => ms_counter_next2(4),
      I3 => ms_counter_reg(4),
      O => ms_counter_next1_carry_i_2_n_0
    );
ms_counter_next1_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => ms_counter_next2(3),
      I1 => ms_counter_reg(3),
      I2 => ms_counter_next2(2),
      I3 => ms_counter_reg(2),
      O => ms_counter_next1_carry_i_3_n_0
    );
ms_counter_next1_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"222B"
    )
        port map (
      I0 => ms_counter_next2(1),
      I1 => ms_counter_reg(1),
      I2 => \ms_target_reg_n_0_[0]\,
      I3 => ms_counter_reg(0),
      O => ms_counter_next1_carry_i_4_n_0
    );
ms_counter_next1_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => ms_counter_reg(7),
      I1 => \ms_target_reg_n_0_[7]\,
      I2 => ms_counter_reg(6),
      I3 => \ms_target_reg_n_0_[6]\,
      O => ms_counter_next1_carry_i_5_n_0
    );
ms_counter_next1_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => ms_counter_reg(5),
      I1 => ms_counter_next2(5),
      I2 => ms_counter_reg(4),
      I3 => ms_counter_next2(4),
      O => ms_counter_next1_carry_i_6_n_0
    );
ms_counter_next1_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => ms_counter_reg(3),
      I1 => ms_counter_next2(3),
      I2 => ms_counter_reg(2),
      I3 => ms_counter_next2(2),
      O => ms_counter_next1_carry_i_7_n_0
    );
ms_counter_next1_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6006"
    )
        port map (
      I0 => ms_counter_reg(0),
      I1 => \ms_target_reg_n_0_[0]\,
      I2 => ms_counter_reg(1),
      I3 => ms_counter_next2(1),
      O => ms_counter_next1_carry_i_8_n_0
    );
ms_counter_next1_carry_i_9: unisim.vcomponents.CARRY4
     port map (
      CI => ms_counter_next2_carry_n_0,
      CO(3 downto 1) => NLW_ms_counter_next1_carry_i_9_CO_UNCONNECTED(3 downto 1),
      CO(0) => ms_counter_next2(5),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_ms_counter_next1_carry_i_9_O_UNCONNECTED(3 downto 0),
      S(3 downto 0) => B"0001"
    );
ms_counter_next2_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => ms_counter_next2_carry_n_0,
      CO(2) => ms_counter_next2_carry_n_1,
      CO(1) => ms_counter_next2_carry_n_2,
      CO(0) => ms_counter_next2_carry_n_3,
      CYINIT => \ms_target_reg_n_0_[0]\,
      DI(3) => \ms_target_reg_n_0_[4]\,
      DI(2) => \ms_target_reg_n_0_[7]\,
      DI(1) => \ms_target_reg_n_0_[2]\,
      DI(0) => \ms_target_reg_n_0_[1]\,
      O(3 downto 0) => ms_counter_next2(4 downto 1),
      S(3) => ms_counter_next2_carry_i_1_n_0,
      S(2) => ms_counter_next2_carry_i_2_n_0,
      S(1) => ms_counter_next2_carry_i_3_n_0,
      S(0) => ms_counter_next2_carry_i_4_n_0
    );
ms_counter_next2_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \ms_target_reg_n_0_[4]\,
      O => ms_counter_next2_carry_i_1_n_0
    );
ms_counter_next2_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \ms_target_reg_n_0_[7]\,
      O => ms_counter_next2_carry_i_2_n_0
    );
ms_counter_next2_carry_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \ms_target_reg_n_0_[2]\,
      O => ms_counter_next2_carry_i_3_n_0
    );
ms_counter_next2_carry_i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \ms_target_reg_n_0_[1]\,
      O => ms_counter_next2_carry_i_4_n_0
    );
\ms_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[0]_i_3_n_7\,
      Q => ms_counter_reg(0),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \ms_counter_reg[0]_i_3_n_0\,
      CO(2) => \ms_counter_reg[0]_i_3_n_1\,
      CO(1) => \ms_counter_reg[0]_i_3_n_2\,
      CO(0) => \ms_counter_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \ms_counter_reg[0]_i_3_n_4\,
      O(2) => \ms_counter_reg[0]_i_3_n_5\,
      O(1) => \ms_counter_reg[0]_i_3_n_6\,
      O(0) => \ms_counter_reg[0]_i_3_n_7\,
      S(3 downto 1) => ms_counter_reg(3 downto 1),
      S(0) => \ms_counter[0]_i_7_n_0\
    );
\ms_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[8]_i_1_n_5\,
      Q => ms_counter_reg(10),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[8]_i_1_n_4\,
      Q => ms_counter_reg(11),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[12]_i_1_n_7\,
      Q => ms_counter_reg(12),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \ms_counter_reg[8]_i_1_n_0\,
      CO(3) => \ms_counter_reg[12]_i_1_n_0\,
      CO(2) => \ms_counter_reg[12]_i_1_n_1\,
      CO(1) => \ms_counter_reg[12]_i_1_n_2\,
      CO(0) => \ms_counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \ms_counter_reg[12]_i_1_n_4\,
      O(2) => \ms_counter_reg[12]_i_1_n_5\,
      O(1) => \ms_counter_reg[12]_i_1_n_6\,
      O(0) => \ms_counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => ms_counter_reg(15 downto 12)
    );
\ms_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[12]_i_1_n_6\,
      Q => ms_counter_reg(13),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[12]_i_1_n_5\,
      Q => ms_counter_reg(14),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[12]_i_1_n_4\,
      Q => ms_counter_reg(15),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[16]_i_1_n_7\,
      Q => ms_counter_reg(16),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \ms_counter_reg[12]_i_1_n_0\,
      CO(3) => \ms_counter_reg[16]_i_1_n_0\,
      CO(2) => \ms_counter_reg[16]_i_1_n_1\,
      CO(1) => \ms_counter_reg[16]_i_1_n_2\,
      CO(0) => \ms_counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \ms_counter_reg[16]_i_1_n_4\,
      O(2) => \ms_counter_reg[16]_i_1_n_5\,
      O(1) => \ms_counter_reg[16]_i_1_n_6\,
      O(0) => \ms_counter_reg[16]_i_1_n_7\,
      S(3 downto 0) => ms_counter_reg(19 downto 16)
    );
\ms_counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[16]_i_1_n_6\,
      Q => ms_counter_reg(17),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[16]_i_1_n_5\,
      Q => ms_counter_reg(18),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[16]_i_1_n_4\,
      Q => ms_counter_reg(19),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[0]_i_3_n_6\,
      Q => ms_counter_reg(1),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[20]_i_1_n_7\,
      Q => ms_counter_reg(20),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \ms_counter_reg[16]_i_1_n_0\,
      CO(3) => \ms_counter_reg[20]_i_1_n_0\,
      CO(2) => \ms_counter_reg[20]_i_1_n_1\,
      CO(1) => \ms_counter_reg[20]_i_1_n_2\,
      CO(0) => \ms_counter_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \ms_counter_reg[20]_i_1_n_4\,
      O(2) => \ms_counter_reg[20]_i_1_n_5\,
      O(1) => \ms_counter_reg[20]_i_1_n_6\,
      O(0) => \ms_counter_reg[20]_i_1_n_7\,
      S(3 downto 0) => ms_counter_reg(23 downto 20)
    );
\ms_counter_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[20]_i_1_n_6\,
      Q => ms_counter_reg(21),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[20]_i_1_n_5\,
      Q => ms_counter_reg(22),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[20]_i_1_n_4\,
      Q => ms_counter_reg(23),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[24]_i_1_n_7\,
      Q => ms_counter_reg(24),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \ms_counter_reg[20]_i_1_n_0\,
      CO(3) => \ms_counter_reg[24]_i_1_n_0\,
      CO(2) => \ms_counter_reg[24]_i_1_n_1\,
      CO(1) => \ms_counter_reg[24]_i_1_n_2\,
      CO(0) => \ms_counter_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \ms_counter_reg[24]_i_1_n_4\,
      O(2) => \ms_counter_reg[24]_i_1_n_5\,
      O(1) => \ms_counter_reg[24]_i_1_n_6\,
      O(0) => \ms_counter_reg[24]_i_1_n_7\,
      S(3 downto 0) => ms_counter_reg(27 downto 24)
    );
\ms_counter_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[24]_i_1_n_6\,
      Q => ms_counter_reg(25),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[24]_i_1_n_5\,
      Q => ms_counter_reg(26),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[24]_i_1_n_4\,
      Q => ms_counter_reg(27),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[28]_i_1_n_7\,
      Q => ms_counter_reg(28),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \ms_counter_reg[24]_i_1_n_0\,
      CO(3) => \NLW_ms_counter_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \ms_counter_reg[28]_i_1_n_1\,
      CO(1) => \ms_counter_reg[28]_i_1_n_2\,
      CO(0) => \ms_counter_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \ms_counter_reg[28]_i_1_n_4\,
      O(2) => \ms_counter_reg[28]_i_1_n_5\,
      O(1) => \ms_counter_reg[28]_i_1_n_6\,
      O(0) => \ms_counter_reg[28]_i_1_n_7\,
      S(3 downto 0) => ms_counter_reg(31 downto 28)
    );
\ms_counter_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[28]_i_1_n_6\,
      Q => ms_counter_reg(29),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[0]_i_3_n_5\,
      Q => ms_counter_reg(2),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[28]_i_1_n_5\,
      Q => ms_counter_reg(30),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[28]_i_1_n_4\,
      Q => ms_counter_reg(31),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[0]_i_3_n_4\,
      Q => ms_counter_reg(3),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[4]_i_1_n_7\,
      Q => ms_counter_reg(4),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \ms_counter_reg[0]_i_3_n_0\,
      CO(3) => \ms_counter_reg[4]_i_1_n_0\,
      CO(2) => \ms_counter_reg[4]_i_1_n_1\,
      CO(1) => \ms_counter_reg[4]_i_1_n_2\,
      CO(0) => \ms_counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \ms_counter_reg[4]_i_1_n_4\,
      O(2) => \ms_counter_reg[4]_i_1_n_5\,
      O(1) => \ms_counter_reg[4]_i_1_n_6\,
      O(0) => \ms_counter_reg[4]_i_1_n_7\,
      S(3 downto 0) => ms_counter_reg(7 downto 4)
    );
\ms_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[4]_i_1_n_6\,
      Q => ms_counter_reg(5),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[4]_i_1_n_5\,
      Q => ms_counter_reg(6),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[4]_i_1_n_4\,
      Q => ms_counter_reg(7),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[8]_i_1_n_7\,
      Q => ms_counter_reg(8),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \ms_counter_reg[4]_i_1_n_0\,
      CO(3) => \ms_counter_reg[8]_i_1_n_0\,
      CO(2) => \ms_counter_reg[8]_i_1_n_1\,
      CO(1) => \ms_counter_reg[8]_i_1_n_2\,
      CO(0) => \ms_counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \ms_counter_reg[8]_i_1_n_4\,
      O(2) => \ms_counter_reg[8]_i_1_n_5\,
      O(1) => \ms_counter_reg[8]_i_1_n_6\,
      O(0) => \ms_counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => ms_counter_reg(11 downto 8)
    );
\ms_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ms_counter,
      D => \ms_counter_reg[8]_i_1_n_6\,
      Q => ms_counter_reg(9),
      R => \ms_counter[0]_i_1_n_0\
    );
\ms_target[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFBFFFFF0030"
    )
        port map (
      I0 => done_next,
      I1 => \state_reg_n_0_[0]\,
      I2 => ms_counter,
      I3 => \ms_counter_next1_carry__2_n_0\,
      I4 => ms_target(7),
      I5 => \ms_target_reg_n_0_[0]\,
      O => \ms_target[0]_i_1_n_0\
    );
\ms_target[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAAAA8CAA"
    )
        port map (
      I0 => \ms_target_reg_n_0_[1]\,
      I1 => done_next,
      I2 => \state_reg_n_0_[0]\,
      I3 => ms_counter,
      I4 => \ms_counter_next1_carry__2_n_0\,
      I5 => \ms_target[6]_i_2_n_0\,
      O => \ms_target[1]_i_1_n_0\
    );
\ms_target[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAB0AA"
    )
        port map (
      I0 => \ms_target_reg_n_0_[2]\,
      I1 => done_next,
      I2 => \state_reg_n_0_[0]\,
      I3 => ms_counter,
      I4 => \ms_counter_next1_carry__2_n_0\,
      I5 => \ms_target[6]_i_2_n_0\,
      O => \ms_target[2]_i_1_n_0\
    );
\ms_target[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FF9F00000010"
    )
        port map (
      I0 => done_next,
      I1 => \state_reg_n_0_[0]\,
      I2 => ms_counter,
      I3 => \ms_counter_next1_carry__2_n_0\,
      I4 => ms_target(7),
      I5 => \ms_target_reg_n_0_[4]\,
      O => \ms_target[4]_i_1_n_0\
    );
\ms_target[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAAAABCAA"
    )
        port map (
      I0 => \ms_target_reg_n_0_[6]\,
      I1 => done_next,
      I2 => \state_reg_n_0_[0]\,
      I3 => ms_counter,
      I4 => \ms_counter_next1_carry__2_n_0\,
      I5 => \ms_target[6]_i_2_n_0\,
      O => \ms_target[6]_i_1_n_0\
    );
\ms_target[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0020FFFFFFFF"
    )
        port map (
      I0 => done_next,
      I1 => \state_reg_n_0_[0]\,
      I2 => \ms_counter_reg[0]_0\,
      I3 => \^scsr0_reg_reg[7]\,
      I4 => w_reset_ip,
      I5 => s00_axi_aresetn,
      O => \ms_target[6]_i_2_n_0\
    );
\ms_target[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FF8F00000000"
    )
        port map (
      I0 => done_next,
      I1 => \state_reg_n_0_[0]\,
      I2 => ms_counter,
      I3 => \ms_counter_next1_carry__2_n_0\,
      I4 => ms_target(7),
      I5 => \ms_target_reg_n_0_[7]\,
      O => \ms_target[7]_i_1_n_0\
    );
\ms_target[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000540000000000"
    )
        port map (
      I0 => w_freeze_ip,
      I1 => \clk_counter_reg[0]_1\,
      I2 => ap_start_stage2,
      I3 => \ms_counter_reg[0]_0\,
      I4 => \state_reg_n_0_[0]\,
      I5 => done_next,
      O => ms_target(7)
    );
\ms_target_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ms_target[0]_i_1_n_0\,
      Q => \ms_target_reg_n_0_[0]\,
      R => global_reset
    );
\ms_target_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ms_target[1]_i_1_n_0\,
      Q => \ms_target_reg_n_0_[1]\,
      R => '0'
    );
\ms_target_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ms_target[2]_i_1_n_0\,
      Q => \ms_target_reg_n_0_[2]\,
      R => '0'
    );
\ms_target_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ms_target[4]_i_1_n_0\,
      Q => \ms_target_reg_n_0_[4]\,
      S => global_reset
    );
\ms_target_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ms_target[6]_i_1_n_0\,
      Q => \ms_target_reg_n_0_[6]\,
      R => '0'
    );
\ms_target_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ms_target[7]_i_1_n_0\,
      Q => \ms_target_reg_n_0_[7]\,
      S => global_reset
    );
o_done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0002020F0000000"
    )
        port map (
      I0 => ms_counter,
      I1 => \ms_counter_next1_carry__2_n_0\,
      I2 => \clk_counter_reg[0]_0\,
      I3 => \^ctl_done\,
      I4 => \^scsr0_reg_reg[7]\,
      I5 => done_next,
      O => o_done_i_1_n_0
    );
o_done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => o_done_i_1_n_0,
      Q => \^ctl_done\,
      R => '0'
    );
o_tx_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \^powerup_done_reg_reg_0\(0),
      I1 => o_tx_0,
      I2 => w_auto_restart,
      O => o_tx
    );
powerup_done_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0010"
    )
        port map (
      I0 => done_next,
      I1 => \state_reg_n_0_[0]\,
      I2 => ms_counter,
      I3 => \ms_counter_next1_carry__2_n_0\,
      I4 => \^powerup_done_reg_reg_0\(0),
      O => powerup_done_reg_i_1_n_0
    );
powerup_done_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => powerup_done_reg_i_1_n_0,
      Q => \^powerup_done_reg_reg_0\(0),
      R => global_reset
    );
start_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFB00FFFFFFFF"
    )
        port map (
      I0 => \ms_counter_reg[0]_0\,
      I1 => ur_done,
      I2 => \^ctl_done\,
      I3 => \^i_enable4_out\,
      I4 => w_reset_ip,
      I5 => s00_axi_aresetn,
      O => done_reg_reg_0
    );
\state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0F00FFFD0202"
    )
        port map (
      I0 => ms_counter,
      I1 => \ms_counter_next1_carry__2_n_0\,
      I2 => \^scsr0_reg_reg[7]\,
      I3 => done_next,
      I4 => \state_reg_n_0_[0]\,
      I5 => \ms_counter_reg[0]_0\,
      O => \state[0]_i_1_n_0\
    );
\state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FF00FF02FF00"
    )
        port map (
      I0 => ms_counter,
      I1 => \ms_counter_next1_carry__2_n_0\,
      I2 => \^scsr0_reg_reg[7]\,
      I3 => done_next,
      I4 => \state_reg_n_0_[0]\,
      I5 => \ms_counter_reg[0]_0\,
      O => \state[1]_i_1_n_0\
    );
\state[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AB"
    )
        port map (
      I0 => w_freeze_ip,
      I1 => \clk_counter_reg[0]_1\,
      I2 => ap_start_stage2,
      O => \^scsr0_reg_reg[7]\
    );
\state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \state[0]_i_1_n_0\,
      Q => \state_reg_n_0_[0]\,
      R => global_reset
    );
\state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \state[1]_i_1_n_0\,
      Q => done_next,
      R => global_reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mbblockdesign_as_1_0_uart_receiver is
  port (
    o_baud_enable : out STD_LOGIC;
    ur_done : out STD_LOGIC;
    o_error_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \data_reg_reg[1]_0\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    o_done_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \state_reg[1]\ : out STD_LOGIC;
    \data_reg_reg[3]_0\ : out STD_LOGIC;
    \data_reg_reg[5]_0\ : out STD_LOGIC;
    \data_reg_reg[3]_1\ : out STD_LOGIC;
    \state_reg[1]_0\ : out STD_LOGIC;
    \data_reg_reg[5]_1\ : out STD_LOGIC;
    next_state : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \state_reg[2]\ : out STD_LOGIC;
    \data_reg_reg[4]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \data_reg_reg[3]_2\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    DI : out STD_LOGIC_VECTOR ( 0 to 0 );
    S : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \data_reg_reg[5]_2\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \data_reg_reg[4]_1\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \state_reg[0]\ : out STD_LOGIC;
    global_reset : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    \data_reg_reg[7]_0\ : in STD_LOGIC;
    i_enable4_out : in STD_LOGIC;
    w_freeze_ip : in STD_LOGIC;
    prev_enable_reg : in STD_LOGIC;
    ap_start_stage2 : in STD_LOGIC;
    prev_enable_reg_0 : in STD_LOGIC;
    bd_gen_tick : in STD_LOGIC;
    ctl_done : in STD_LOGIC;
    \error_char_reg_reg[7]\ : in STD_LOGIC;
    \digit_reg_reg[7]\ : in STD_LOGIC;
    first_number_is_2_reg_reg : in STD_LOGIC;
    \state_reg[2]_0\ : in STD_LOGIC;
    \state[1]_i_2__0\ : in STD_LOGIC;
    \data_next0_carry__0\ : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of mbblockdesign_as_1_0_uart_receiver : entity is "uart_receiver";
end mbblockdesign_as_1_0_uart_receiver;

architecture STRUCTURE of mbblockdesign_as_1_0_uart_receiver is
  signal \FSM_sequential_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_4_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal baud_enable_reg_i_1_n_0 : STD_LOGIC;
  signal bits_next : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal bits_reg : STD_LOGIC;
  signal \bits_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \bits_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \bits_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \bits_reg[3]_i_4_n_0\ : STD_LOGIC;
  signal \bits_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \bits_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal \bits_reg_reg_n_0_[2]\ : STD_LOGIC;
  signal \bits_reg_reg_n_0_[3]\ : STD_LOGIC;
  signal \chars_reg[1]_i_3_n_0\ : STD_LOGIC;
  signal data_next : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal data_reg : STD_LOGIC;
  signal \data_reg[7]_i_2__0_n_0\ : STD_LOGIC;
  signal \^data_reg_reg[3]_0\ : STD_LOGIC;
  signal \^data_reg_reg[3]_1\ : STD_LOGIC;
  signal \^data_reg_reg[5]_1\ : STD_LOGIC;
  signal \digit_reg[5]_i_2_n_0\ : STD_LOGIC;
  signal \digit_reg[5]_i_3_n_0\ : STD_LOGIC;
  signal done_next : STD_LOGIC;
  signal \error_pos_reg[5]_i_3_n_0\ : STD_LOGIC;
  signal \error_pos_reg[5]_i_4_n_0\ : STD_LOGIC;
  signal \error_pos_reg[5]_i_5_n_0\ : STD_LOGIC;
  signal \error_pos_reg[5]_i_6_n_0\ : STD_LOGIC;
  signal \error_pos_reg[5]_i_7_n_0\ : STD_LOGIC;
  signal \error_pos_reg[5]_i_8_n_0\ : STD_LOGIC;
  signal error_reg_i_4_n_0 : STD_LOGIC;
  signal \^o_baud_enable\ : STD_LOGIC;
  signal \o_done_i_1__0_n_0\ : STD_LOGIC;
  signal o_error_i_1_n_0 : STD_LOGIC;
  signal \^o_error_reg_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal state : STD_LOGIC;
  signal \state__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^state_reg[1]\ : STD_LOGIC;
  signal ticks_reg : STD_LOGIC;
  signal \ticks_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \ticks_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \ticks_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \ticks_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \ticks_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \ticks_reg[3]_i_4_n_0\ : STD_LOGIC;
  signal \ticks_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \ticks_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal \ticks_reg_reg_n_0_[2]\ : STD_LOGIC;
  signal \ticks_reg_reg_n_0_[3]\ : STD_LOGIC;
  signal \^ur_done\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_2\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_4\ : label is "soft_lutpair16";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "start:01,data:10,idle:00,stop:11";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "start:01,data:10,idle:00,stop:11";
  attribute SOFT_HLUTNM of baud_enable_reg_i_2 : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \bits_reg[0]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \bits_reg[1]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \bits_reg[2]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \bits_reg[3]_i_2\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \bits_reg[3]_i_3\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \chars_reg[1]_i_2\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \data_reg[0]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \data_reg[1]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \data_reg[2]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \data_reg[3]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \data_reg[4]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \data_reg[5]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \data_reg[6]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \digit_reg[0]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \digit_reg[1]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \digit_reg[2]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \digit_reg[3]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \digit_reg[4]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \digit_reg[5]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \digit_reg[5]_i_3\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \digit_reg[6]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \digit_reg[7]_i_3\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \error_pos_reg[5]_i_6\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \error_pos_reg[5]_i_7\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \error_pos_reg[5]_i_8\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of error_reg_i_4 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of first_number_is_2_reg_i_4 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \ticks_reg[0]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \ticks_reg[1]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \ticks_reg[3]_i_2\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \ticks_reg[3]_i_3\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \ticks_reg[3]_i_4\ : label is "soft_lutpair21";
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
  \data_reg_reg[3]_0\ <= \^data_reg_reg[3]_0\;
  \data_reg_reg[3]_1\ <= \^data_reg_reg[3]_1\;
  \data_reg_reg[5]_1\ <= \^data_reg_reg[5]_1\;
  o_baud_enable <= \^o_baud_enable\;
  o_error_reg_0(0) <= \^o_error_reg_0\(0);
  \state_reg[1]\ <= \^state_reg[1]\;
  ur_done <= \^ur_done\;
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0FB0"
    )
        port map (
      I0 => bd_gen_tick,
      I1 => \state__0\(1),
      I2 => state,
      I3 => \state__0\(0),
      O => \FSM_sequential_state[0]_i_1_n_0\
    );
\FSM_sequential_state[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4FA0"
    )
        port map (
      I0 => \state__0\(0),
      I1 => bd_gen_tick,
      I2 => state,
      I3 => \state__0\(1),
      O => \FSM_sequential_state[1]_i_2_n_0\
    );
\FSM_sequential_state[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A8A8A8AA"
    )
        port map (
      I0 => i_enable4_out,
      I1 => \FSM_sequential_state[1]_i_4_n_0\,
      I2 => \bits_reg[3]_i_3_n_0\,
      I3 => \data_reg[7]_i_2__0_n_0\,
      I4 => \bits_reg[3]_i_4_n_0\,
      O => state
    );
\FSM_sequential_state[1]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \state__0\(1),
      I2 => \data_reg_reg[7]_0\,
      O => \FSM_sequential_state[1]_i_4_n_0\
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \FSM_sequential_state[0]_i_1_n_0\,
      Q => \state__0\(0),
      R => global_reset
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \FSM_sequential_state[1]_i_2_n_0\,
      Q => \state__0\(1),
      R => global_reset
    );
baud_enable_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"77FF77FF0088008A"
    )
        port map (
      I0 => i_enable4_out,
      I1 => done_next,
      I2 => \state__0\(0),
      I3 => \state__0\(1),
      I4 => \data_reg_reg[7]_0\,
      I5 => \^o_baud_enable\,
      O => baud_enable_reg_i_1_n_0
    );
baud_enable_reg_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \state__0\(1),
      I2 => bd_gen_tick,
      I3 => \ticks_reg[3]_i_4_n_0\,
      I4 => \ticks_reg_reg_n_0_[3]\,
      O => done_next
    );
baud_enable_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => baud_enable_reg_i_1_n_0,
      Q => \^o_baud_enable\,
      R => global_reset
    );
\bits_reg[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \state__0\(1),
      I1 => \bits_reg_reg_n_0_[0]\,
      O => bits_next(0)
    );
\bits_reg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \bits_reg_reg_n_0_[1]\,
      I1 => \bits_reg_reg_n_0_[0]\,
      I2 => \state__0\(1),
      O => \bits_reg[1]_i_1_n_0\
    );
\bits_reg[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => \state__0\(1),
      I1 => \bits_reg_reg_n_0_[0]\,
      I2 => \bits_reg_reg_n_0_[1]\,
      I3 => \bits_reg_reg_n_0_[2]\,
      O => bits_next(2)
    );
\bits_reg[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A88"
    )
        port map (
      I0 => i_enable4_out,
      I1 => \bits_reg[3]_i_3_n_0\,
      I2 => \data_reg[7]_i_2__0_n_0\,
      I3 => \bits_reg[3]_i_4_n_0\,
      O => bits_reg
    );
\bits_reg[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F800000"
    )
        port map (
      I0 => \bits_reg_reg_n_0_[1]\,
      I1 => \bits_reg_reg_n_0_[0]\,
      I2 => \bits_reg_reg_n_0_[2]\,
      I3 => \bits_reg_reg_n_0_[3]\,
      I4 => \state__0\(1),
      O => \bits_reg[3]_i_2_n_0\
    );
\bits_reg[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => bd_gen_tick,
      I1 => \state__0\(0),
      I2 => \state__0\(1),
      I3 => \ticks_reg[3]_i_4_n_0\,
      I4 => \ticks_reg_reg_n_0_[3]\,
      O => \bits_reg[3]_i_3_n_0\
    );
\bits_reg[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45555555"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \bits_reg_reg_n_0_[3]\,
      I2 => \bits_reg_reg_n_0_[1]\,
      I3 => \bits_reg_reg_n_0_[0]\,
      I4 => \bits_reg_reg_n_0_[2]\,
      O => \bits_reg[3]_i_4_n_0\
    );
\bits_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => bits_reg,
      D => bits_next(0),
      Q => \bits_reg_reg_n_0_[0]\,
      R => global_reset
    );
\bits_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => bits_reg,
      D => \bits_reg[1]_i_1_n_0\,
      Q => \bits_reg_reg_n_0_[1]\,
      R => global_reset
    );
\bits_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => bits_reg,
      D => bits_next(2),
      Q => \bits_reg_reg_n_0_[2]\,
      R => global_reset
    );
\bits_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => bits_reg,
      D => \bits_reg[3]_i_2_n_0\,
      Q => \bits_reg_reg_n_0_[3]\,
      R => global_reset
    );
\chars_reg[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(6),
      I2 => \chars_reg[1]_i_3_n_0\,
      O => \^data_reg_reg[5]_1\
    );
\chars_reg[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFFFFFFFFFF"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(7),
      I3 => \^q\(3),
      I4 => \^q\(4),
      I5 => \^q\(1),
      O => \chars_reg[1]_i_3_n_0\
    );
\data_next0_carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(4),
      O => DI(0)
    );
\data_next0_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6999"
    )
        port map (
      I0 => \^q\(6),
      I1 => \data_next0_carry__0\(2),
      I2 => \data_next0_carry__0\(1),
      I3 => \^q\(5),
      O => S(2)
    );
\data_next0_carry__0_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \^q\(4),
      I1 => \data_next0_carry__0\(1),
      I2 => \^q\(5),
      O => S(1)
    );
\data_next0_carry__0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(4),
      I1 => \data_next0_carry__0\(0),
      O => S(0)
    );
\data_reg[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(1),
      I1 => \state__0\(1),
      I2 => \data_reg_reg[7]_0\,
      O => data_next(0)
    );
\data_reg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(2),
      I1 => \state__0\(1),
      I2 => \data_reg_reg[7]_0\,
      O => data_next(1)
    );
\data_reg[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(3),
      I1 => \state__0\(1),
      I2 => \data_reg_reg[7]_0\,
      O => data_next(2)
    );
\data_reg[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(4),
      I1 => \state__0\(1),
      I2 => \data_reg_reg[7]_0\,
      O => data_next(3)
    );
\data_reg[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(5),
      I1 => \state__0\(1),
      I2 => \data_reg_reg[7]_0\,
      O => data_next(4)
    );
\data_reg[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(6),
      I1 => \state__0\(1),
      I2 => \data_reg_reg[7]_0\,
      O => data_next(5)
    );
\data_reg[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(7),
      I1 => \state__0\(1),
      I2 => \data_reg_reg[7]_0\,
      O => data_next(6)
    );
\data_reg[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005700"
    )
        port map (
      I0 => \data_reg[7]_i_2__0_n_0\,
      I1 => \data_reg_reg[7]_0\,
      I2 => \state__0\(1),
      I3 => i_enable4_out,
      I4 => \state__0\(0),
      O => data_reg
    );
\data_reg[7]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \ticks_reg_reg_n_0_[3]\,
      I1 => \ticks_reg_reg_n_0_[1]\,
      I2 => \ticks_reg_reg_n_0_[0]\,
      I3 => \ticks_reg_reg_n_0_[2]\,
      I4 => \state__0\(1),
      I5 => bd_gen_tick,
      O => \data_reg[7]_i_2__0_n_0\
    );
\data_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_reg,
      D => data_next(0),
      Q => \^q\(0),
      R => global_reset
    );
\data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_reg,
      D => data_next(1),
      Q => \^q\(1),
      R => global_reset
    );
\data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_reg,
      D => data_next(2),
      Q => \^q\(2),
      R => global_reset
    );
\data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_reg,
      D => data_next(3),
      Q => \^q\(3),
      R => global_reset
    );
\data_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_reg,
      D => data_next(4),
      Q => \^q\(4),
      R => global_reset
    );
\data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_reg,
      D => data_next(5),
      Q => \^q\(5),
      R => global_reset
    );
\data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_reg,
      D => data_next(6),
      Q => \^q\(6),
      R => global_reset
    );
\data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_reg,
      D => \data_reg_reg[7]_0\,
      Q => \^q\(7),
      R => global_reset
    );
digit_ready_reg_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAA8880"
    )
        port map (
      I0 => \digit_reg_reg[7]\,
      I1 => \^q\(3),
      I2 => \^q\(2),
      I3 => \^q\(1),
      I4 => \digit_reg[5]_i_3_n_0\,
      O => \state_reg[2]\
    );
\digit_reg[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(0),
      I1 => \digit_reg[5]_i_2_n_0\,
      O => D(0)
    );
\digit_reg[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(1),
      I1 => \digit_reg[5]_i_2_n_0\,
      O => D(1)
    );
\digit_reg[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(2),
      I1 => \digit_reg[5]_i_2_n_0\,
      O => D(2)
    );
\digit_reg[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(3),
      I1 => \digit_reg[5]_i_2_n_0\,
      O => D(3)
    );
\digit_reg[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(4),
      I1 => \digit_reg[5]_i_2_n_0\,
      O => D(4)
    );
\digit_reg[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(5),
      I1 => \digit_reg[5]_i_2_n_0\,
      O => D(5)
    );
\digit_reg[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFDDDDD00000000"
    )
        port map (
      I0 => \state_reg[2]_0\,
      I1 => \digit_reg[5]_i_3_n_0\,
      I2 => \^q\(1),
      I3 => \^q\(2),
      I4 => \^q\(3),
      I5 => \digit_reg_reg[7]\,
      O => \digit_reg[5]_i_2_n_0\
    );
\digit_reg[5]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(6),
      I2 => \^q\(4),
      I3 => \^q\(7),
      O => \digit_reg[5]_i_3_n_0\
    );
\digit_reg[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(6),
      I1 => \digit_reg_reg[7]\,
      O => D(6)
    );
\digit_reg[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(7),
      I1 => \digit_reg_reg[7]\,
      O => D(7)
    );
\error_char_reg[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^state_reg[1]\,
      I1 => ctl_done,
      O => o_done_reg_0(0)
    );
\error_pos_reg[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000001D331D"
    )
        port map (
      I0 => \error_pos_reg[5]_i_3_n_0\,
      I1 => \error_char_reg_reg[7]\,
      I2 => \^data_reg_reg[3]_0\,
      I3 => \digit_reg_reg[7]\,
      I4 => \error_pos_reg[5]_i_4_n_0\,
      I5 => \error_pos_reg[5]_i_5_n_0\,
      O => \^state_reg[1]\
    );
\error_pos_reg[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"20202020202F2020"
    )
        port map (
      I0 => \error_pos_reg[5]_i_6_n_0\,
      I1 => \error_pos_reg[5]_i_7_n_0\,
      I2 => \state_reg[2]_0\,
      I3 => \^q\(5),
      I4 => \^q\(6),
      I5 => \chars_reg[1]_i_3_n_0\,
      O => \error_pos_reg[5]_i_3_n_0\
    );
\error_pos_reg[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F2F2F2F2F202F2F2"
    )
        port map (
      I0 => \error_pos_reg[5]_i_8_n_0\,
      I1 => error_reg_i_4_n_0,
      I2 => \state_reg[2]_0\,
      I3 => \^q\(5),
      I4 => \^q\(6),
      I5 => \chars_reg[1]_i_3_n_0\,
      O => \error_pos_reg[5]_i_4_n_0\
    );
\error_pos_reg[5]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DDDFFFFF"
    )
        port map (
      I0 => \^ur_done\,
      I1 => w_freeze_ip,
      I2 => prev_enable_reg,
      I3 => ap_start_stage2,
      I4 => prev_enable_reg_0,
      O => \error_pos_reg[5]_i_5_n_0\
    );
\error_pos_reg[5]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(7),
      I2 => \^q\(4),
      I3 => \^q\(6),
      I4 => \^q\(5),
      O => \error_pos_reg[5]_i_6_n_0\
    );
\error_pos_reg[5]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EC"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(2),
      I2 => \^q\(1),
      O => \error_pos_reg[5]_i_7_n_0\
    );
\error_pos_reg[5]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \^q\(7),
      I1 => \^q\(6),
      I2 => \^q\(4),
      I3 => \^q\(5),
      O => \error_pos_reg[5]_i_8_n_0\
    );
error_reg_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555555555554"
    )
        port map (
      I0 => \state_reg[2]_0\,
      I1 => error_reg_i_4_n_0,
      I2 => \^q\(7),
      I3 => \^q\(6),
      I4 => \^q\(4),
      I5 => \^q\(5),
      O => \state_reg[0]\
    );
error_reg_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(3),
      I3 => \^q\(1),
      O => error_reg_i_4_n_0
    );
first_number_is_2_reg_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5755575500300000"
    )
        port map (
      I0 => first_number_is_2_reg_reg,
      I1 => \chars_reg[1]_i_3_n_0\,
      I2 => \^q\(5),
      I3 => \^q\(6),
      I4 => \^data_reg_reg[3]_1\,
      I5 => \digit_reg_reg[7]\,
      O => \data_reg_reg[5]_0\
    );
first_number_is_2_reg_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010011"
    )
        port map (
      I0 => \digit_reg[5]_i_3_n_0\,
      I1 => \^q\(3),
      I2 => \^q\(1),
      I3 => \^q\(2),
      I4 => \^q\(0),
      O => \^data_reg_reg[3]_1\
    );
\i___0_carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(0),
      O => \data_reg_reg[3]_2\(0)
    );
\i___0_carry_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C3693C96"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(4),
      I4 => \^q\(5),
      O => \data_reg_reg[1]_0\(2)
    );
\i___0_carry_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D22D"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(3),
      I2 => \^q\(1),
      I3 => \^q\(4),
      O => \data_reg_reg[1]_0\(1)
    );
\i___0_carry_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(0),
      O => \data_reg_reg[1]_0\(0)
    );
\multOp_carry__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B4"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(4),
      I2 => \^q\(6),
      O => \data_reg_reg[5]_2\(1)
    );
\multOp_carry__0_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(4),
      I2 => \^q\(3),
      O => \data_reg_reg[5]_2\(0)
    );
multOp_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(4),
      O => \data_reg_reg[4]_0\(0)
    );
multOp_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      O => \data_reg_reg[4]_1\(2)
    );
multOp_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      O => \data_reg_reg[4]_1\(1)
    );
multOp_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      O => \data_reg_reg[4]_1\(0)
    );
\o_done_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080FFFF00800000"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \state__0\(1),
      I2 => bd_gen_tick,
      I3 => \ticks_reg[3]_i_3_n_0\,
      I4 => i_enable4_out,
      I5 => \^ur_done\,
      O => \o_done_i_1__0_n_0\
    );
o_done_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \o_done_i_1__0_n_0\,
      Q => \^ur_done\,
      R => global_reset
    );
o_error_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F20"
    )
        port map (
      I0 => done_next,
      I1 => \data_reg_reg[7]_0\,
      I2 => i_enable4_out,
      I3 => \^o_error_reg_0\(0),
      O => o_error_i_1_n_0
    );
o_error_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => o_error_i_1_n_0,
      Q => \^o_error_reg_0\(0),
      R => global_reset
    );
prev_enable_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"22200000"
    )
        port map (
      I0 => \^o_baud_enable\,
      I1 => w_freeze_ip,
      I2 => prev_enable_reg,
      I3 => ap_start_stage2,
      I4 => prev_enable_reg_0,
      O => E(0)
    );
\state[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"838383B3B3B383B3"
    )
        port map (
      I0 => \^data_reg_reg[5]_1\,
      I1 => \digit_reg_reg[7]\,
      I2 => \state_reg[2]_0\,
      I3 => \^data_reg_reg[3]_1\,
      I4 => \error_char_reg_reg[7]\,
      I5 => \^data_reg_reg[3]_0\,
      O => next_state(0)
    );
\state[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \^data_reg_reg[3]_0\,
      I1 => \error_char_reg_reg[7]\,
      I2 => \^data_reg_reg[3]_1\,
      I3 => \state_reg[2]_0\,
      I4 => \^data_reg_reg[5]_1\,
      O => \state_reg[1]_0\
    );
\state[2]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01111115"
    )
        port map (
      I0 => \digit_reg[5]_i_3_n_0\,
      I1 => \^q\(3),
      I2 => \^q\(2),
      I3 => \^q\(1),
      I4 => \state[1]_i_2__0\,
      O => \^data_reg_reg[3]_0\
    );
\ticks_reg[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02FE"
    )
        port map (
      I0 => \data_reg_reg[7]_0\,
      I1 => \state__0\(1),
      I2 => \state__0\(0),
      I3 => \ticks_reg_reg_n_0_[0]\,
      O => \ticks_reg[0]_i_1_n_0\
    );
\ticks_reg[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02FEFE02"
    )
        port map (
      I0 => \data_reg_reg[7]_0\,
      I1 => \state__0\(1),
      I2 => \state__0\(0),
      I3 => \ticks_reg_reg_n_0_[0]\,
      I4 => \ticks_reg_reg_n_0_[1]\,
      O => \ticks_reg[1]_i_1_n_0\
    );
\ticks_reg[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"02FEFE02FE02FE02"
    )
        port map (
      I0 => \data_reg_reg[7]_0\,
      I1 => \state__0\(1),
      I2 => \state__0\(0),
      I3 => \ticks_reg_reg_n_0_[2]\,
      I4 => \ticks_reg_reg_n_0_[0]\,
      I5 => \ticks_reg_reg_n_0_[1]\,
      O => \ticks_reg[2]_i_1_n_0\
    );
\ticks_reg[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A800AA0228002A02"
    )
        port map (
      I0 => i_enable4_out,
      I1 => \state__0\(1),
      I2 => \state__0\(0),
      I3 => bd_gen_tick,
      I4 => \data_reg_reg[7]_0\,
      I5 => \ticks_reg[3]_i_3_n_0\,
      O => ticks_reg
    );
\ticks_reg[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"998F9980"
    )
        port map (
      I0 => \ticks_reg[3]_i_4_n_0\,
      I1 => \ticks_reg_reg_n_0_[3]\,
      I2 => \state__0\(0),
      I3 => \state__0\(1),
      I4 => \data_reg_reg[7]_0\,
      O => \ticks_reg[3]_i_2_n_0\
    );
\ticks_reg[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \ticks_reg_reg_n_0_[2]\,
      I1 => \ticks_reg_reg_n_0_[0]\,
      I2 => \ticks_reg_reg_n_0_[1]\,
      I3 => \ticks_reg_reg_n_0_[3]\,
      O => \ticks_reg[3]_i_3_n_0\
    );
\ticks_reg[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \ticks_reg_reg_n_0_[1]\,
      I1 => \ticks_reg_reg_n_0_[0]\,
      I2 => \ticks_reg_reg_n_0_[2]\,
      O => \ticks_reg[3]_i_4_n_0\
    );
\ticks_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ticks_reg,
      D => \ticks_reg[0]_i_1_n_0\,
      Q => \ticks_reg_reg_n_0_[0]\,
      R => global_reset
    );
\ticks_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ticks_reg,
      D => \ticks_reg[1]_i_1_n_0\,
      Q => \ticks_reg_reg_n_0_[1]\,
      R => global_reset
    );
\ticks_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ticks_reg,
      D => \ticks_reg[2]_i_1_n_0\,
      Q => \ticks_reg_reg_n_0_[2]\,
      R => global_reset
    );
\ticks_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ticks_reg,
      D => \ticks_reg[3]_i_2_n_0\,
      Q => \ticks_reg_reg_n_0_[3]\,
      R => global_reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mbblockdesign_as_1_0_as_core is
  port (
    ap_start_prev : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    D : out STD_LOGIC_VECTOR ( 14 downto 0 );
    w_ap_done : out STD_LOGIC;
    o_error_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    ad_start : out STD_LOGIC;
    tx_reg_reg_0 : out STD_LOGIC;
    ap_start_stage1 : out STD_LOGIC;
    w_calib_done : out STD_LOGIC;
    o_tx : out STD_LOGIC;
    read_valid_reg_reg_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \ad_dist_char_3_reg_reg[7]_0\ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    global_reset : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    w_ap_start : in STD_LOGIC;
    tx_reg_reg_1 : in STD_LOGIC;
    ap_start_stage1_reg_0 : in STD_LOGIC;
    \clk_counter_reg[0]\ : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    w_reset_ip : in STD_LOGIC;
    w_freeze_ip : in STD_LOGIC;
    \data_reg_reg[7]\ : in STD_LOGIC;
    w_auto_restart : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of mbblockdesign_as_1_0_as_core : entity is "as_core";
end mbblockdesign_as_1_0_as_core;

architecture STRUCTURE of mbblockdesign_as_1_0_as_core is
  signal ASCII_DECODER_INST_n_12 : STD_LOGIC;
  signal ASCII_DECODER_INST_n_13 : STD_LOGIC;
  signal ASCII_DECODER_INST_n_14 : STD_LOGIC;
  signal ASCII_DECODER_INST_n_15 : STD_LOGIC;
  signal ASCII_DECODER_INST_n_27 : STD_LOGIC;
  signal ASCII_DECODER_INST_n_28 : STD_LOGIC;
  signal ASCII_DECODER_INST_n_9 : STD_LOGIC;
  signal CONTROL_TIMER_INST_n_1 : STD_LOGIC;
  signal CONTROL_TIMER_INST_n_10 : STD_LOGIC;
  signal CONTROL_TIMER_INST_n_8 : STD_LOGIC;
  signal CONTROL_TIMER_INST_n_9 : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal UART_RECEIVER_INST_n_16 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_17 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_18 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_19 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_20 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_21 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_3 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_31 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_32 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_33 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_34 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_35 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_36 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_37 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_38 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_39 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_4 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_40 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_41 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_42 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_43 : STD_LOGIC;
  signal UART_RECEIVER_INST_n_5 : STD_LOGIC;
  signal \ad_digit_index[0]_i_1_n_0\ : STD_LOGIC;
  signal \ad_digit_index[1]_i_1_n_0\ : STD_LOGIC;
  signal \ad_digit_index_reg_n_0_[0]\ : STD_LOGIC;
  signal \ad_digit_index_reg_n_0_[1]\ : STD_LOGIC;
  signal ad_digit_ready : STD_LOGIC;
  signal ad_dist_char_1_reg : STD_LOGIC;
  signal ad_dist_char_2_reg : STD_LOGIC;
  signal ad_dist_char_3_reg : STD_LOGIC;
  signal ad_dist_in_reg : STD_LOGIC;
  signal ad_err_pos : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^ap_start_stage1\ : STD_LOGIC;
  signal ap_start_stage2 : STD_LOGIC;
  signal ap_start_stage2_i_1_n_0 : STD_LOGIC;
  signal bd_gen_tick : STD_LOGIC;
  signal clk_counter : STD_LOGIC;
  signal ctl_done : STD_LOGIC;
  signal data_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal data_reg_0 : STD_LOGIC;
  signal digit_next : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal digit_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal error_char_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal error_char_reg_2 : STD_LOGIC;
  signal error_pos_reg : STD_LOGIC_VECTOR ( 5 to 5 );
  signal error_pos_reg_1 : STD_LOGIC;
  signal error_reg : STD_LOGIC;
  signal i_enable : STD_LOGIC;
  signal i_enable4_out : STD_LOGIC;
  signal next_state : STD_LOGIC_VECTOR ( 0 to 0 );
  signal o_baud_enable : STD_LOGIC;
  signal read_valid_reg0 : STD_LOGIC;
  signal read_valid_reg_i_1_n_0 : STD_LOGIC;
  signal \^read_valid_reg_reg_0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^tx_reg_reg_0\ : STD_LOGIC;
  signal update_window : STD_LOGIC;
  signal ur_done : STD_LOGIC;
  signal \^w_ap_done\ : STD_LOGIC;
  signal \^w_calib_done\ : STD_LOGIC;
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
  ap_start_stage1 <= \^ap_start_stage1\;
  read_valid_reg_reg_0(1 downto 0) <= \^read_valid_reg_reg_0\(1 downto 0);
  tx_reg_reg_0 <= \^tx_reg_reg_0\;
  w_ap_done <= \^w_ap_done\;
  w_calib_done <= \^w_calib_done\;
ASCII_DECODER_INST: entity work.mbblockdesign_as_1_0_ascii_decoder
     port map (
      D(7 downto 0) => digit_next(7 downto 0),
      DI(0) => UART_RECEIVER_INST_n_34,
      E(0) => ad_dist_char_3_reg,
      Q(7 downto 0) => data_reg(7 downto 0),
      S(2) => UART_RECEIVER_INST_n_35,
      S(1) => UART_RECEIVER_INST_n_36,
      S(0) => UART_RECEIVER_INST_n_37,
      \ad_digit_index_reg[1]\(0) => ad_dist_char_1_reg,
      ad_digit_ready => ad_digit_ready,
      \ad_dist_char_3_reg_reg[0]\ => \ad_digit_index_reg_n_0_[1]\,
      \ad_dist_char_3_reg_reg[0]_0\ => \ad_digit_index_reg_n_0_[0]\,
      ap_start_stage2 => ap_start_stage2,
      \chars_reg_reg[0]_0\ => UART_RECEIVER_INST_n_21,
      \chars_reg_reg[1]_0\ => ASCII_DECODER_INST_n_15,
      clk_counter => clk_counter,
      ctl_done => ctl_done,
      \data_reg_reg[7]_0\(0) => UART_RECEIVER_INST_n_33,
      \data_reg_reg[7]_1\(2) => UART_RECEIVER_INST_n_3,
      \data_reg_reg[7]_1\(1) => UART_RECEIVER_INST_n_4,
      \data_reg_reg[7]_1\(0) => UART_RECEIVER_INST_n_5,
      \data_reg_reg[7]_2\ => \^w_calib_done\,
      \data_reg_reg[7]_3\ => \^ap_start_stage1\,
      \data_reg_reg[7]_4\ => \clk_counter_reg[0]\,
      \data_reg_reg[7]_5\(0) => data_reg_0,
      digit_ready_reg_reg_0 => UART_RECEIVER_INST_n_31,
      \digit_reg_reg[0]_0\ => CONTROL_TIMER_INST_n_8,
      \digit_reg_reg[7]_0\(7 downto 0) => digit_reg(7 downto 0),
      done_reg_reg_0 => \^w_ap_done\,
      \error_char_reg_reg[7]_0\(7 downto 0) => error_char_reg(7 downto 0),
      \error_char_reg_reg[7]_1\(7 downto 0) => \^q\(7 downto 0),
      \error_char_reg_reg[7]_2\(0) => error_char_reg_2,
      \error_pos_reg_reg[5]_0\(5) => error_pos_reg(5),
      \error_pos_reg_reg[5]_0\(4 downto 0) => ad_err_pos(4 downto 0),
      \error_pos_reg_reg[5]_1\(0) => error_pos_reg_1,
      error_reg => error_reg,
      error_reg_reg_0 => CONTROL_TIMER_INST_n_9,
      error_reg_reg_1 => UART_RECEIVER_INST_n_16,
      error_reg_reg_2 => UART_RECEIVER_INST_n_43,
      first_number_is_2_reg_reg_0 => ASCII_DECODER_INST_n_9,
      first_number_is_2_reg_reg_1 => UART_RECEIVER_INST_n_18,
      first_number_is_2_reg_reg_2 => UART_RECEIVER_INST_n_19,
      global_reset => global_reset,
      \i__carry__0_i_2_0\(1) => UART_RECEIVER_INST_n_38,
      \i__carry__0_i_2_0\(0) => UART_RECEIVER_INST_n_39,
      \i__carry_i_3_0\(0) => UART_RECEIVER_INST_n_32,
      \i__carry_i_3_1\(2) => UART_RECEIVER_INST_n_40,
      \i__carry_i_3_1\(1) => UART_RECEIVER_INST_n_41,
      \i__carry_i_3_1\(0) => UART_RECEIVER_INST_n_42,
      i_enable4_out => i_enable4_out,
      next_state(0) => next_state(0),
      read_valid_reg0 => read_valid_reg0,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_aresetn_0 => ASCII_DECODER_INST_n_27,
      start_reg_reg_0 => ad_start,
      start_reg_reg_1 => CONTROL_TIMER_INST_n_10,
      \state[2]_i_2_0\ => CONTROL_TIMER_INST_n_1,
      \state_reg[0]_0\ => ASCII_DECODER_INST_n_13,
      \state_reg[1]_0\ => ASCII_DECODER_INST_n_12,
      \state_reg[1]_1\ => UART_RECEIVER_INST_n_17,
      \state_reg[2]_0\ => ASCII_DECODER_INST_n_14,
      \state_reg[2]_1\ => ASCII_DECODER_INST_n_28,
      \state_reg[2]_2\ => UART_RECEIVER_INST_n_20,
      update_window => update_window,
      update_window_reg(0) => ad_dist_char_2_reg,
      ur_done => ur_done,
      w_freeze_ip => w_freeze_ip,
      w_reset_ip => w_reset_ip
    );
BAUD_GEN_INST: entity work.mbblockdesign_as_1_0_baud_rate_generator
     port map (
      E(0) => i_enable,
      bd_gen_tick => bd_gen_tick,
      global_reset => global_reset,
      i_enable4_out => i_enable4_out,
      o_baud_enable => o_baud_enable,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      w_reset_ip => w_reset_ip
    );
CONTROL_TIMER_INST: entity work.mbblockdesign_as_1_0_control_timer
     port map (
      \SCSR0_reg_reg[7]\ => CONTROL_TIMER_INST_n_1,
      \SCSR0_reg_reg[7]_0\ => CONTROL_TIMER_INST_n_9,
      ap_start_stage2 => ap_start_stage2,
      clk_counter => clk_counter,
      \clk_counter_reg[0]_0\ => \clk_counter_reg[0]\,
      \clk_counter_reg[0]_1\ => \^ap_start_stage1\,
      config_done_reg_reg_0 => \^w_calib_done\,
      ctl_done => ctl_done,
      \data_reg_reg[7]\ => ASCII_DECODER_INST_n_28,
      done_reg_reg => CONTROL_TIMER_INST_n_8,
      done_reg_reg_0 => CONTROL_TIMER_INST_n_10,
      \error_pos_reg_reg[5]\ => UART_RECEIVER_INST_n_16,
      global_reset => global_reset,
      i_enable4_out => i_enable4_out,
      \ms_counter_reg[0]_0\ => \^w_ap_done\,
      o_done_reg_0(0) => error_pos_reg_1,
      o_done_reg_1(0) => data_reg_0,
      o_tx => o_tx,
      o_tx_0 => \^tx_reg_reg_0\,
      powerup_done_reg_reg_0(0) => \^read_valid_reg_reg_0\(0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      ur_done => ur_done,
      w_auto_restart => w_auto_restart,
      w_freeze_ip => w_freeze_ip,
      w_reset_ip => w_reset_ip
    );
UART_RECEIVER_INST: entity work.mbblockdesign_as_1_0_uart_receiver
     port map (
      D(7 downto 0) => digit_next(7 downto 0),
      DI(0) => UART_RECEIVER_INST_n_34,
      E(0) => i_enable,
      Q(7 downto 0) => \^q\(7 downto 0),
      S(2) => UART_RECEIVER_INST_n_35,
      S(1) => UART_RECEIVER_INST_n_36,
      S(0) => UART_RECEIVER_INST_n_37,
      ap_start_stage2 => ap_start_stage2,
      bd_gen_tick => bd_gen_tick,
      ctl_done => ctl_done,
      \data_next0_carry__0\(2 downto 0) => data_reg(6 downto 4),
      \data_reg_reg[1]_0\(2) => UART_RECEIVER_INST_n_3,
      \data_reg_reg[1]_0\(1) => UART_RECEIVER_INST_n_4,
      \data_reg_reg[1]_0\(0) => UART_RECEIVER_INST_n_5,
      \data_reg_reg[3]_0\ => UART_RECEIVER_INST_n_17,
      \data_reg_reg[3]_1\ => UART_RECEIVER_INST_n_19,
      \data_reg_reg[3]_2\(0) => UART_RECEIVER_INST_n_33,
      \data_reg_reg[4]_0\(0) => UART_RECEIVER_INST_n_32,
      \data_reg_reg[4]_1\(2) => UART_RECEIVER_INST_n_40,
      \data_reg_reg[4]_1\(1) => UART_RECEIVER_INST_n_41,
      \data_reg_reg[4]_1\(0) => UART_RECEIVER_INST_n_42,
      \data_reg_reg[5]_0\ => UART_RECEIVER_INST_n_18,
      \data_reg_reg[5]_1\ => UART_RECEIVER_INST_n_21,
      \data_reg_reg[5]_2\(1) => UART_RECEIVER_INST_n_38,
      \data_reg_reg[5]_2\(0) => UART_RECEIVER_INST_n_39,
      \data_reg_reg[7]_0\ => \data_reg_reg[7]\,
      \digit_reg_reg[7]\ => ASCII_DECODER_INST_n_14,
      \error_char_reg_reg[7]\ => ASCII_DECODER_INST_n_12,
      first_number_is_2_reg_reg => ASCII_DECODER_INST_n_15,
      global_reset => global_reset,
      i_enable4_out => i_enable4_out,
      next_state(0) => next_state(0),
      o_baud_enable => o_baud_enable,
      o_done_reg_0(0) => error_char_reg_2,
      o_error_reg_0(0) => o_error_reg(0),
      prev_enable_reg => \^ap_start_stage1\,
      prev_enable_reg_0 => \^w_calib_done\,
      s00_axi_aclk => s00_axi_aclk,
      \state[1]_i_2__0\ => ASCII_DECODER_INST_n_9,
      \state_reg[0]\ => UART_RECEIVER_INST_n_43,
      \state_reg[1]\ => UART_RECEIVER_INST_n_16,
      \state_reg[1]_0\ => UART_RECEIVER_INST_n_20,
      \state_reg[2]\ => UART_RECEIVER_INST_n_31,
      \state_reg[2]_0\ => ASCII_DECODER_INST_n_13,
      ur_done => ur_done,
      w_freeze_ip => w_freeze_ip
    );
\ad_digit_index[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAA6AA"
    )
        port map (
      I0 => \ad_digit_index_reg_n_0_[0]\,
      I1 => update_window,
      I2 => w_freeze_ip,
      I3 => ad_digit_ready,
      I4 => \ad_digit_index_reg_n_0_[1]\,
      I5 => read_valid_reg0,
      O => \ad_digit_index[0]_i_1_n_0\
    );
\ad_digit_index[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AEAAAAAA"
    )
        port map (
      I0 => \ad_digit_index_reg_n_0_[1]\,
      I1 => ad_digit_ready,
      I2 => w_freeze_ip,
      I3 => update_window,
      I4 => \ad_digit_index_reg_n_0_[0]\,
      I5 => read_valid_reg0,
      O => \ad_digit_index[1]_i_1_n_0\
    );
\ad_digit_index_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ad_digit_index[0]_i_1_n_0\,
      Q => \ad_digit_index_reg_n_0_[0]\,
      R => '0'
    );
\ad_digit_index_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \ad_digit_index[1]_i_1_n_0\,
      Q => \ad_digit_index_reg_n_0_[1]\,
      R => '0'
    );
\ad_dist_char_1_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_1_reg,
      D => digit_reg(0),
      Q => \ad_dist_char_3_reg_reg[7]_0\(8),
      R => read_valid_reg0
    );
\ad_dist_char_1_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_1_reg,
      D => digit_reg(1),
      Q => \ad_dist_char_3_reg_reg[7]_0\(9),
      R => read_valid_reg0
    );
\ad_dist_char_1_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_1_reg,
      D => digit_reg(2),
      Q => \ad_dist_char_3_reg_reg[7]_0\(10),
      R => read_valid_reg0
    );
\ad_dist_char_1_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_1_reg,
      D => digit_reg(3),
      Q => \ad_dist_char_3_reg_reg[7]_0\(11),
      R => read_valid_reg0
    );
\ad_dist_char_1_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_1_reg,
      D => digit_reg(4),
      Q => \ad_dist_char_3_reg_reg[7]_0\(12),
      R => read_valid_reg0
    );
\ad_dist_char_1_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_1_reg,
      D => digit_reg(5),
      Q => \ad_dist_char_3_reg_reg[7]_0\(13),
      R => read_valid_reg0
    );
\ad_dist_char_1_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_1_reg,
      D => digit_reg(6),
      Q => \ad_dist_char_3_reg_reg[7]_0\(14),
      R => read_valid_reg0
    );
\ad_dist_char_1_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_1_reg,
      D => digit_reg(7),
      Q => \ad_dist_char_3_reg_reg[7]_0\(15),
      R => read_valid_reg0
    );
\ad_dist_char_2_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_2_reg,
      D => digit_reg(0),
      Q => \ad_dist_char_3_reg_reg[7]_0\(16),
      R => read_valid_reg0
    );
\ad_dist_char_2_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_2_reg,
      D => digit_reg(1),
      Q => \ad_dist_char_3_reg_reg[7]_0\(17),
      R => read_valid_reg0
    );
\ad_dist_char_2_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_2_reg,
      D => digit_reg(2),
      Q => \ad_dist_char_3_reg_reg[7]_0\(18),
      R => read_valid_reg0
    );
\ad_dist_char_2_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_2_reg,
      D => digit_reg(3),
      Q => \ad_dist_char_3_reg_reg[7]_0\(19),
      R => read_valid_reg0
    );
\ad_dist_char_2_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_2_reg,
      D => digit_reg(4),
      Q => \ad_dist_char_3_reg_reg[7]_0\(20),
      R => read_valid_reg0
    );
\ad_dist_char_2_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_2_reg,
      D => digit_reg(5),
      Q => \ad_dist_char_3_reg_reg[7]_0\(21),
      R => read_valid_reg0
    );
\ad_dist_char_2_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_2_reg,
      D => digit_reg(6),
      Q => \ad_dist_char_3_reg_reg[7]_0\(22),
      R => read_valid_reg0
    );
\ad_dist_char_2_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_2_reg,
      D => digit_reg(7),
      Q => \ad_dist_char_3_reg_reg[7]_0\(23),
      R => read_valid_reg0
    );
\ad_dist_char_3_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_3_reg,
      D => digit_reg(0),
      Q => \ad_dist_char_3_reg_reg[7]_0\(24),
      R => read_valid_reg0
    );
\ad_dist_char_3_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_3_reg,
      D => digit_reg(1),
      Q => \ad_dist_char_3_reg_reg[7]_0\(25),
      R => read_valid_reg0
    );
\ad_dist_char_3_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_3_reg,
      D => digit_reg(2),
      Q => \ad_dist_char_3_reg_reg[7]_0\(26),
      R => read_valid_reg0
    );
\ad_dist_char_3_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_3_reg,
      D => digit_reg(3),
      Q => \ad_dist_char_3_reg_reg[7]_0\(27),
      R => read_valid_reg0
    );
\ad_dist_char_3_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_3_reg,
      D => digit_reg(4),
      Q => \ad_dist_char_3_reg_reg[7]_0\(28),
      R => read_valid_reg0
    );
\ad_dist_char_3_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_3_reg,
      D => digit_reg(5),
      Q => \ad_dist_char_3_reg_reg[7]_0\(29),
      R => read_valid_reg0
    );
\ad_dist_char_3_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_3_reg,
      D => digit_reg(6),
      Q => \ad_dist_char_3_reg_reg[7]_0\(30),
      R => read_valid_reg0
    );
\ad_dist_char_3_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_char_3_reg,
      D => digit_reg(7),
      Q => \ad_dist_char_3_reg_reg[7]_0\(31),
      R => read_valid_reg0
    );
\ad_dist_in_reg[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => update_window,
      I1 => w_freeze_ip,
      O => ad_dist_in_reg
    );
\ad_dist_in_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => data_reg(0),
      Q => \ad_dist_char_3_reg_reg[7]_0\(0),
      R => read_valid_reg0
    );
\ad_dist_in_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => data_reg(1),
      Q => \ad_dist_char_3_reg_reg[7]_0\(1),
      R => read_valid_reg0
    );
\ad_dist_in_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => data_reg(2),
      Q => \ad_dist_char_3_reg_reg[7]_0\(2),
      R => read_valid_reg0
    );
\ad_dist_in_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => data_reg(3),
      Q => \ad_dist_char_3_reg_reg[7]_0\(3),
      R => read_valid_reg0
    );
\ad_dist_in_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => data_reg(4),
      Q => \ad_dist_char_3_reg_reg[7]_0\(4),
      R => read_valid_reg0
    );
\ad_dist_in_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => data_reg(5),
      Q => \ad_dist_char_3_reg_reg[7]_0\(5),
      R => read_valid_reg0
    );
\ad_dist_in_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => data_reg(6),
      Q => \ad_dist_char_3_reg_reg[7]_0\(6),
      R => read_valid_reg0
    );
\ad_dist_in_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => data_reg(7),
      Q => \ad_dist_char_3_reg_reg[7]_0\(7),
      R => read_valid_reg0
    );
\ad_err_char_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => error_char_reg(0),
      Q => D(7),
      R => read_valid_reg0
    );
\ad_err_char_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => error_char_reg(1),
      Q => D(8),
      R => read_valid_reg0
    );
\ad_err_char_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => error_char_reg(2),
      Q => D(9),
      R => read_valid_reg0
    );
\ad_err_char_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => error_char_reg(3),
      Q => D(10),
      R => read_valid_reg0
    );
\ad_err_char_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => error_char_reg(4),
      Q => D(11),
      R => read_valid_reg0
    );
\ad_err_char_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => error_char_reg(5),
      Q => D(12),
      R => read_valid_reg0
    );
\ad_err_char_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => error_char_reg(6),
      Q => D(13),
      R => read_valid_reg0
    );
\ad_err_char_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => error_char_reg(7),
      Q => D(14),
      R => read_valid_reg0
    );
\ad_err_pos_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => ad_err_pos(0),
      Q => D(1),
      R => read_valid_reg0
    );
\ad_err_pos_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => ad_err_pos(1),
      Q => D(2),
      R => read_valid_reg0
    );
\ad_err_pos_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => ad_err_pos(2),
      Q => D(3),
      R => read_valid_reg0
    );
\ad_err_pos_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => ad_err_pos(3),
      Q => D(4),
      R => read_valid_reg0
    );
\ad_err_pos_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => ad_err_pos(4),
      Q => D(5),
      R => read_valid_reg0
    );
\ad_err_pos_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => error_pos_reg(5),
      Q => D(6),
      R => read_valid_reg0
    );
ad_error_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => ad_dist_in_reg,
      D => error_reg,
      Q => D(0),
      R => read_valid_reg0
    );
ap_start_prev_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => w_ap_start,
      Q => ap_start_prev,
      R => global_reset
    );
ap_start_stage1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => ap_start_stage1_reg_0,
      Q => \^ap_start_stage1\,
      R => global_reset
    );
ap_start_stage2_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \^ap_start_stage1\,
      I1 => w_freeze_ip,
      I2 => ap_start_stage2,
      O => ap_start_stage2_i_1_n_0
    );
ap_start_stage2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => ap_start_stage2_i_1_n_0,
      Q => ap_start_stage2,
      R => global_reset
    );
read_valid_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000BAAA"
    )
        port map (
      I0 => \^read_valid_reg_reg_0\(1),
      I1 => w_freeze_ip,
      I2 => update_window,
      I3 => \^w_ap_done\,
      I4 => read_valid_reg0,
      O => read_valid_reg_i_1_n_0
    );
read_valid_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => read_valid_reg_i_1_n_0,
      Q => \^read_valid_reg_reg_0\(1),
      R => '0'
    );
tx_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => tx_reg_reg_1,
      Q => \^tx_reg_reg_0\,
      R => '0'
    );
update_window_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => ASCII_DECODER_INST_n_27,
      Q => update_window,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mbblockdesign_as_1_0_as is
  port (
    i_rx : in STD_LOGIC;
    o_tx : out STD_LOGIC;
    o_interrupt : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute C_AS_CONTROL_CALIBRATION_TIME : integer;
  attribute C_AS_CONTROL_CALIBRATION_TIME of mbblockdesign_as_1_0_as : entity is 49;
  attribute C_AS_CONTROL_FIRST_READING_TIME : integer;
  attribute C_AS_CONTROL_FIRST_READING_TIME of mbblockdesign_as_1_0_as : entity is 100;
  attribute C_AS_CONTROL_MS_DIVISOR : integer;
  attribute C_AS_CONTROL_MS_DIVISOR of mbblockdesign_as_1_0_as : entity is 100000;
  attribute C_AS_CONTROL_POWER_UP_TIME : integer;
  attribute C_AS_CONTROL_POWER_UP_TIME of mbblockdesign_as_1_0_as : entity is 250;
  attribute C_AS_CONTROL_RANGE_READING_TIME : integer;
  attribute C_AS_CONTROL_RANGE_READING_TIME of mbblockdesign_as_1_0_as : entity is 99;
  attribute C_AS_UART_BAUDRATE_DIVISOR : integer;
  attribute C_AS_UART_BAUDRATE_DIVISOR of mbblockdesign_as_1_0_as : entity is 651;
  attribute C_AS_UART_NUM_DATA_BITS : integer;
  attribute C_AS_UART_NUM_DATA_BITS of mbblockdesign_as_1_0_as : entity is 8;
  attribute C_S00_AXI_ADDR_WIDTH : integer;
  attribute C_S00_AXI_ADDR_WIDTH of mbblockdesign_as_1_0_as : entity is 6;
  attribute C_S00_AXI_DATA_WIDTH : integer;
  attribute C_S00_AXI_DATA_WIDTH of mbblockdesign_as_1_0_as : entity is 32;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of mbblockdesign_as_1_0_as : entity is "as";
end mbblockdesign_as_1_0_as;

architecture STRUCTURE of mbblockdesign_as_1_0_as is
  signal \<const0>\ : STD_LOGIC;
  signal AS_CORE_INST_n_27 : STD_LOGIC;
  signal AS_S00_AXI_INST_n_12 : STD_LOGIC;
  signal AS_S00_AXI_INST_n_6 : STD_LOGIC;
  signal AS_S00_AXI_INST_n_7 : STD_LOGIC;
  signal ad_dist_char_1_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ad_dist_char_2_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ad_dist_char_3_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ad_dist_in_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ad_start : STD_LOGIC;
  signal ap_start_prev : STD_LOGIC;
  signal ap_start_stage1 : STD_LOGIC;
  signal global_reset : STD_LOGIC;
  signal i_rx_sync_0 : STD_LOGIC;
  signal i_rx_sync_1 : STD_LOGIC;
  signal i_rx_sync_reg_n_0 : STD_LOGIC;
  signal w_ad_err_char : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal w_ad_err_pos : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal w_ad_error : STD_LOGIC;
  signal w_ap_done : STD_LOGIC;
  signal w_ap_start : STD_LOGIC;
  signal w_auto_restart : STD_LOGIC;
  signal w_calib_done : STD_LOGIC;
  signal w_freeze_ip : STD_LOGIC;
  signal w_powerup_done : STD_LOGIC;
  signal w_read_valid : STD_LOGIC;
  signal w_reset_ip : STD_LOGIC;
  signal w_ur_data : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal w_ur_error : STD_LOGIC;
begin
  o_interrupt <= \<const0>\;
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
AS_CORE_INST: entity work.mbblockdesign_as_1_0_as_core
     port map (
      D(14 downto 7) => w_ad_err_char(7 downto 0),
      D(6 downto 1) => w_ad_err_pos(5 downto 0),
      D(0) => w_ad_error,
      Q(7 downto 0) => w_ur_data(7 downto 0),
      \ad_dist_char_3_reg_reg[7]_0\(31 downto 24) => ad_dist_char_3_reg(7 downto 0),
      \ad_dist_char_3_reg_reg[7]_0\(23 downto 16) => ad_dist_char_2_reg(7 downto 0),
      \ad_dist_char_3_reg_reg[7]_0\(15 downto 8) => ad_dist_char_1_reg(7 downto 0),
      \ad_dist_char_3_reg_reg[7]_0\(7 downto 0) => ad_dist_in_reg(7 downto 0),
      ad_start => ad_start,
      ap_start_prev => ap_start_prev,
      ap_start_stage1 => ap_start_stage1,
      ap_start_stage1_reg_0 => AS_S00_AXI_INST_n_12,
      \clk_counter_reg[0]\ => AS_S00_AXI_INST_n_7,
      \data_reg_reg[7]\ => i_rx_sync_reg_n_0,
      global_reset => global_reset,
      o_error_reg(0) => w_ur_error,
      o_tx => o_tx,
      read_valid_reg_reg_0(1) => w_read_valid,
      read_valid_reg_reg_0(0) => w_powerup_done,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      tx_reg_reg_0 => AS_CORE_INST_n_27,
      tx_reg_reg_1 => AS_S00_AXI_INST_n_6,
      w_ap_done => w_ap_done,
      w_ap_start => w_ap_start,
      w_auto_restart => w_auto_restart,
      w_calib_done => w_calib_done,
      w_freeze_ip => w_freeze_ip,
      w_reset_ip => w_reset_ip
    );
AS_S00_AXI_INST: entity work.mbblockdesign_as_1_0_as_S00_AXI
     port map (
      \ADSR_reg_reg[15]_0\(14 downto 7) => w_ad_err_char(7 downto 0),
      \ADSR_reg_reg[15]_0\(6 downto 1) => w_ad_err_pos(5 downto 0),
      \ADSR_reg_reg[15]_0\(0) => w_ad_error,
      D(8 downto 1) => w_ur_data(7 downto 0),
      D(0) => w_ur_error,
      \DIST0_reg_reg[31]_0\(31 downto 24) => ad_dist_char_3_reg(7 downto 0),
      \DIST0_reg_reg[31]_0\(23 downto 16) => ad_dist_char_2_reg(7 downto 0),
      \DIST0_reg_reg[31]_0\(15 downto 8) => ad_dist_char_1_reg(7 downto 0),
      \DIST0_reg_reg[31]_0\(7 downto 0) => ad_dist_in_reg(7 downto 0),
      \GCSR_reg_reg[0]_0\ => AS_S00_AXI_INST_n_12,
      \SCSR0_reg_reg[2]_0\(2) => w_read_valid,
      \SCSR0_reg_reg[2]_0\(1) => w_calib_done,
      \SCSR0_reg_reg[2]_0\(0) => w_powerup_done,
      \SCSR0_reg_reg[7]_0\ => AS_S00_AXI_INST_n_6,
      ad_start => ad_start,
      ap_start_prev => ap_start_prev,
      ap_start_stage1 => ap_start_stage1,
      axi_arready_reg_0 => s00_axi_arready,
      axi_awready_reg_0 => s00_axi_awready,
      axi_wready_reg_0 => s00_axi_wready,
      global_reset => global_reset,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(3 downto 0) => s00_axi_araddr(5 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_aresetn_0 => AS_S00_AXI_INST_n_7,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(3 downto 0) => s00_axi_awaddr(5 downto 2),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(2 downto 1) => s00_axi_wdata(7 downto 6),
      s00_axi_wdata(0) => s00_axi_wdata(0),
      s00_axi_wstrb(0) => s00_axi_wstrb(0),
      s00_axi_wvalid => s00_axi_wvalid,
      tx_reg_reg => AS_CORE_INST_n_27,
      w_ap_done => w_ap_done,
      w_ap_start => w_ap_start,
      w_auto_restart => w_auto_restart,
      w_freeze_ip => w_freeze_ip,
      w_reset_ip => w_reset_ip
    );
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
i_rx_sync_0_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => i_rx,
      Q => i_rx_sync_0,
      R => '0'
    );
i_rx_sync_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => i_rx_sync_0,
      Q => i_rx_sync_1,
      R => '0'
    );
i_rx_sync_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => i_rx_sync_1,
      Q => i_rx_sync_reg_n_0,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mbblockdesign_as_1_0 is
  port (
    i_rx : in STD_LOGIC;
    o_tx : out STD_LOGIC;
    o_interrupt : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of mbblockdesign_as_1_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of mbblockdesign_as_1_0 : entity is "mbblockdesign_as_1_0,as,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of mbblockdesign_as_1_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of mbblockdesign_as_1_0 : entity is "package_project";
  attribute x_core_info : string;
  attribute x_core_info of mbblockdesign_as_1_0 : entity is "as,Vivado 2023.2";
end mbblockdesign_as_1_0;

architecture STRUCTURE of mbblockdesign_as_1_0 is
  signal \<const0>\ : STD_LOGIC;
  signal NLW_U0_o_interrupt_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s00_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s00_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute C_AS_CONTROL_CALIBRATION_TIME : integer;
  attribute C_AS_CONTROL_CALIBRATION_TIME of U0 : label is 49;
  attribute C_AS_CONTROL_FIRST_READING_TIME : integer;
  attribute C_AS_CONTROL_FIRST_READING_TIME of U0 : label is 100;
  attribute C_AS_CONTROL_MS_DIVISOR : integer;
  attribute C_AS_CONTROL_MS_DIVISOR of U0 : label is 100000;
  attribute C_AS_CONTROL_POWER_UP_TIME : integer;
  attribute C_AS_CONTROL_POWER_UP_TIME of U0 : label is 250;
  attribute C_AS_CONTROL_RANGE_READING_TIME : integer;
  attribute C_AS_CONTROL_RANGE_READING_TIME of U0 : label is 99;
  attribute C_AS_UART_BAUDRATE_DIVISOR : integer;
  attribute C_AS_UART_BAUDRATE_DIVISOR of U0 : label is 651;
  attribute C_AS_UART_NUM_DATA_BITS : integer;
  attribute C_AS_UART_NUM_DATA_BITS of U0 : label is 8;
  attribute C_S00_AXI_ADDR_WIDTH : integer;
  attribute C_S00_AXI_ADDR_WIDTH of U0 : label is 6;
  attribute C_S00_AXI_DATA_WIDTH : integer;
  attribute C_S00_AXI_DATA_WIDTH of U0 : label is 32;
  attribute x_interface_info : string;
  attribute x_interface_info of o_interrupt : signal is "xilinx.com:signal:interrupt:1.0 o_interrupt INTERRUPT";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of o_interrupt : signal is "XIL_INTERFACENAME o_interrupt, SENSITIVITY LEVEL_HIGH, PORTWIDTH 1";
  attribute x_interface_info of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 s00_axi_aclk CLK";
  attribute x_interface_parameter of s00_axi_aclk : signal is "XIL_INTERFACENAME s00_axi_aclk, ASSOCIATED_BUSIF s00_axi, ASSOCIATED_RESET s00_axi_aresetn, FREQ_TOLERANCE_HZ -1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  attribute x_interface_info of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 s00_axi_aresetn RST";
  attribute x_interface_parameter of s00_axi_aresetn : signal is "XIL_INTERFACENAME s00_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARREADY";
  attribute x_interface_info of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARVALID";
  attribute x_interface_info of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWREADY";
  attribute x_interface_info of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWVALID";
  attribute x_interface_info of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 s00_axi BREADY";
  attribute x_interface_info of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi BVALID";
  attribute x_interface_info of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 s00_axi RREADY";
  attribute x_interface_info of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi RVALID";
  attribute x_interface_info of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 s00_axi WREADY";
  attribute x_interface_info of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi WVALID";
  attribute x_interface_info of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARADDR";
  attribute x_interface_info of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARPROT";
  attribute x_interface_info of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWADDR";
  attribute x_interface_parameter of s00_axi_awaddr : signal is "XIL_INTERFACENAME s00_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 6, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute x_interface_info of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWPROT";
  attribute x_interface_info of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 s00_axi BRESP";
  attribute x_interface_info of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 s00_axi RDATA";
  attribute x_interface_info of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 s00_axi RRESP";
  attribute x_interface_info of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 s00_axi WDATA";
  attribute x_interface_info of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 s00_axi WSTRB";
begin
  o_interrupt <= \<const0>\;
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.mbblockdesign_as_1_0_as
     port map (
      i_rx => i_rx,
      o_interrupt => NLW_U0_o_interrupt_UNCONNECTED,
      o_tx => o_tx,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(5 downto 2) => s00_axi_araddr(5 downto 2),
      s00_axi_araddr(1 downto 0) => B"00",
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arprot(2 downto 0) => B"000",
      s00_axi_arready => s00_axi_arready,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(5 downto 2) => s00_axi_awaddr(5 downto 2),
      s00_axi_awaddr(1 downto 0) => B"00",
      s00_axi_awprot(2 downto 0) => B"000",
      s00_axi_awready => s00_axi_awready,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bresp(1 downto 0) => NLW_U0_s00_axi_bresp_UNCONNECTED(1 downto 0),
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rresp(1 downto 0) => NLW_U0_s00_axi_rresp_UNCONNECTED(1 downto 0),
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 8) => B"000000000000000000000000",
      s00_axi_wdata(7 downto 6) => s00_axi_wdata(7 downto 6),
      s00_axi_wdata(5 downto 1) => B"00000",
      s00_axi_wdata(0) => s00_axi_wdata(0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wstrb(3 downto 1) => B"000",
      s00_axi_wstrb(0) => s00_axi_wstrb(0),
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;
