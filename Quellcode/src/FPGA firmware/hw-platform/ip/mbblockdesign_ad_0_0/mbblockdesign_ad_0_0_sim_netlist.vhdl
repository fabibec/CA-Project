-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Wed Jun 25 20:47:11 2025
-- Host        : xuser-pc running 64-bit Ubuntu 22.04.3 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/xuser/pmod-maxsonar-pmod-clp/Quellcode/src/hw-platform/hw-platform.gen/sources_1/bd/mbblockdesign/ip/mbblockdesign_ad_0_0/mbblockdesign_ad_0_0_sim_netlist.vhdl
-- Design      : mbblockdesign_ad_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mbblockdesign_ad_0_0_ad_S00_AXI is
  port (
    \SCSR0_reg_reg[9]_0\ : out STD_LOGIC;
    \GCSR_reg_reg[1]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    axi_wready_reg_0 : out STD_LOGIC;
    axi_awready_reg_0 : out STD_LOGIC;
    axi_arready_reg_0 : out STD_LOGIC;
    w_ap_start : out STD_LOGIC;
    w_cursor_apply : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    ns_executing_command : out STD_LOGIC;
    \DCR_reg_reg[0]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \GCSR_reg_reg[0]_0\ : out STD_LOGIC;
    \GCSR_reg_reg[0]_1\ : out STD_LOGIC;
    DCR_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    \GCSR_reg__0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \DCR_reg_reg[1]_0\ : out STD_LOGIC;
    \CDR_reg_reg[7]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    axi_arready_reg_1 : out STD_LOGIC;
    s00_axi_aresetn_0 : out STD_LOGIC;
    \DCR_reg_reg[1]_1\ : out STD_LOGIC;
    \DCR_reg_reg[2]_0\ : out STD_LOGIC;
    \DCR_reg_reg[3]_0\ : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 12 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    w_lcd_initialized : in STD_LOGIC;
    \SCSR0_reg_reg[9]_1\ : in STD_LOGIC;
    w_ap_idle : in STD_LOGIC;
    \GCSR_reg_reg[1]_1\ : in STD_LOGIC;
    \GCSR_reg_reg[0]_2\ : in STD_LOGIC;
    \DCR_reg_reg[4]_0\ : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    s_executing_command : in STD_LOGIC;
    \s_symbol_to_write_reg[0]\ : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_executing_command_reg : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    in24 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \CCR_reg_reg[7]_0\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of mbblockdesign_ad_0_0_ad_S00_AXI : entity is "ad_S00_AXI";
end mbblockdesign_ad_0_0_ad_S00_AXI;

architecture STRUCTURE of mbblockdesign_ad_0_0_ad_S00_AXI is
  signal CCR_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \CCR_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \CCR_reg[16]_i_2_n_0\ : STD_LOGIC;
  signal \CDR_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \CDR_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \^cdr_reg_reg[7]_0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \DCR_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \^dcr_reg_reg[0]_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GCSR_reg : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \GCSR_reg[0]_i_5_n_0\ : STD_LOGIC;
  signal \^gcsr_reg_reg[1]_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^scsr0_reg_reg[9]_0\ : STD_LOGIC;
  signal \SCSR0_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \SCSR0_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal \SCSR0_reg_reg_n_0_[2]\ : STD_LOGIC;
  signal \SCSR0_reg_reg_n_0_[3]\ : STD_LOGIC;
  signal \SCSR0_reg_reg_n_0_[4]\ : STD_LOGIC;
  signal \SCSR0_reg_reg_n_0_[5]\ : STD_LOGIC;
  signal aw_en_i_1_n_0 : STD_LOGIC;
  signal aw_en_reg_n_0 : STD_LOGIC;
  signal axi_araddr : STD_LOGIC_VECTOR ( 5 downto 2 );
  signal axi_arready0 : STD_LOGIC;
  signal \^axi_arready_reg_0\ : STD_LOGIC;
  signal axi_awaddr : STD_LOGIC_VECTOR ( 5 downto 2 );
  signal axi_awready0 : STD_LOGIC;
  signal \^axi_awready_reg_0\ : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal \axi_rdata[0]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_4_n_0\ : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal axi_wready0 : STD_LOGIC;
  signal \^axi_wready_reg_0\ : STD_LOGIC;
  signal reg_data_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal s_cursor_blink_i_2_n_0 : STD_LOGIC;
  signal \s_symbol_to_write[7]_i_2_n_0\ : STD_LOGIC;
  signal slv_reg_rden : STD_LOGIC;
  signal \^w_ap_start\ : STD_LOGIC;
  signal \^w_cursor_apply\ : STD_LOGIC;
  signal w_cursor_blink : STD_LOGIC;
  signal w_cursor_on : STD_LOGIC;
  signal w_return_home : STD_LOGIC;
  signal w_write_char : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \CDR_reg[7]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_9\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \GCSR_reg[0]_i_5\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \axi_rdata[10]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \axi_rdata[12]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \axi_rdata[16]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \axi_rdata[1]_i_3\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \axi_rdata[1]_i_4\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \axi_rdata[31]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \axi_rdata[5]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \axi_rdata[5]_i_3\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \axi_rdata[5]_i_4\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \axi_rdata[9]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of s_cursor_blink_i_1 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of s_cursor_on_i_1 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \s_symbol_to_write[7]_i_2\ : label is "soft_lutpair3";
begin
  \CDR_reg_reg[7]_0\(7 downto 0) <= \^cdr_reg_reg[7]_0\(7 downto 0);
  \DCR_reg_reg[0]_0\(0) <= \^dcr_reg_reg[0]_0\(0);
  \GCSR_reg_reg[1]_0\(0) <= \^gcsr_reg_reg[1]_0\(0);
  \SCSR0_reg_reg[9]_0\ <= \^scsr0_reg_reg[9]_0\;
  axi_arready_reg_0 <= \^axi_arready_reg_0\;
  axi_awready_reg_0 <= \^axi_awready_reg_0\;
  axi_wready_reg_0 <= \^axi_wready_reg_0\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_rvalid <= \^s00_axi_rvalid\;
  w_ap_start <= \^w_ap_start\;
  w_cursor_apply <= \^w_cursor_apply\;
\CCR_reg[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFF80000000"
    )
        port map (
      I0 => s00_axi_wdata(8),
      I1 => \CCR_reg[16]_i_2_n_0\,
      I2 => s00_axi_wvalid,
      I3 => s00_axi_awvalid,
      I4 => \^axi_awready_reg_0\,
      I5 => w_write_char,
      O => \CCR_reg[16]_i_1_n_0\
    );
\CCR_reg[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000000000000000"
    )
        port map (
      I0 => axi_awaddr(4),
      I1 => axi_awaddr(5),
      I2 => axi_awaddr(2),
      I3 => axi_awaddr(3),
      I4 => \^axi_wready_reg_0\,
      I5 => s00_axi_wstrb(1),
      O => \CCR_reg[16]_i_2_n_0\
    );
\CCR_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \CCR_reg_reg[7]_0\(0),
      Q => CCR_reg(0),
      R => SR(0)
    );
\CCR_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \CCR_reg[16]_i_1_n_0\,
      Q => w_write_char,
      R => SR(0)
    );
\CCR_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \CCR_reg_reg[7]_0\(1),
      Q => CCR_reg(1),
      R => SR(0)
    );
\CCR_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \CCR_reg_reg[7]_0\(2),
      Q => CCR_reg(2),
      R => SR(0)
    );
\CCR_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \CCR_reg_reg[7]_0\(3),
      Q => CCR_reg(3),
      R => SR(0)
    );
\CCR_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \CCR_reg_reg[7]_0\(4),
      Q => CCR_reg(6),
      R => SR(0)
    );
\CCR_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \CCR_reg_reg[7]_0\(5),
      Q => CCR_reg(7),
      R => SR(0)
    );
\CDR_reg[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => axi_awaddr(2),
      I1 => \^axi_awready_reg_0\,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_wvalid,
      I4 => \CDR_reg[7]_i_2_n_0\,
      O => \CDR_reg[7]_i_1_n_0\
    );
\CDR_reg[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000000"
    )
        port map (
      I0 => axi_awaddr(3),
      I1 => axi_awaddr(4),
      I2 => s00_axi_wstrb(0),
      I3 => \^axi_wready_reg_0\,
      I4 => axi_awaddr(5),
      O => \CDR_reg[7]_i_2_n_0\
    );
\CDR_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \CDR_reg[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \^cdr_reg_reg[7]_0\(0),
      R => SR(0)
    );
\CDR_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \CDR_reg[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \^cdr_reg_reg[7]_0\(1),
      R => SR(0)
    );
\CDR_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \CDR_reg[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \^cdr_reg_reg[7]_0\(2),
      R => SR(0)
    );
\CDR_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \CDR_reg[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \^cdr_reg_reg[7]_0\(3),
      R => SR(0)
    );
\CDR_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \CDR_reg[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \^cdr_reg_reg[7]_0\(4),
      R => SR(0)
    );
\CDR_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \CDR_reg[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \^cdr_reg_reg[7]_0\(5),
      R => SR(0)
    );
\CDR_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \CDR_reg[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \^cdr_reg_reg[7]_0\(6),
      R => SR(0)
    );
\CDR_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \CDR_reg[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \^cdr_reg_reg[7]_0\(7),
      R => SR(0)
    );
\DCR_reg[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => axi_awaddr(2),
      I1 => \^axi_awready_reg_0\,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_wvalid,
      I4 => \CDR_reg[7]_i_2_n_0\,
      O => \DCR_reg[3]_i_1_n_0\
    );
\DCR_reg[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => axi_awaddr(2),
      I1 => s00_axi_wdata(4),
      I2 => \CDR_reg[7]_i_2_n_0\,
      O => DCR_reg(0)
    );
\DCR_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \DCR_reg[3]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \^dcr_reg_reg[0]_0\(0),
      R => SR(0)
    );
\DCR_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \DCR_reg[3]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => w_return_home,
      R => SR(0)
    );
\DCR_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \DCR_reg[3]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => w_cursor_on,
      R => SR(0)
    );
\DCR_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \DCR_reg[3]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => w_cursor_blink,
      R => SR(0)
    );
\DCR_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \DCR_reg_reg[4]_0\,
      Q => \^w_cursor_apply\,
      R => SR(0)
    );
\FSM_sequential_state[0]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => w_return_home,
      I1 => \^w_cursor_apply\,
      I2 => \^dcr_reg_reg[0]_0\(0),
      O => \DCR_reg_reg[1]_1\
    );
\FSM_sequential_state[1]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => w_return_home,
      I1 => \^w_cursor_apply\,
      O => \DCR_reg_reg[1]_0\
    );
\FSM_sequential_state[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0200020002000000"
    )
        port map (
      I0 => \^w_ap_start\,
      I1 => \s_symbol_to_write_reg[0]\(3),
      I2 => \s_symbol_to_write_reg[0]\(2),
      I3 => \s_symbol_to_write_reg[0]\(1),
      I4 => w_write_char,
      I5 => \s_symbol_to_write[7]_i_2_n_0\,
      O => \GCSR_reg_reg[0]_1\
    );
\GCSR_reg[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => s00_axi_wdata(0),
      I1 => axi_awaddr(2),
      I2 => axi_awaddr(5),
      I3 => \GCSR_reg[0]_i_5_n_0\,
      O => \GCSR_reg__0\(0)
    );
\GCSR_reg[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \^axi_wready_reg_0\,
      I1 => s00_axi_wstrb(0),
      I2 => axi_awaddr(4),
      I3 => axi_awaddr(3),
      O => \GCSR_reg[0]_i_5_n_0\
    );
\GCSR_reg[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => \^axi_arready_reg_0\,
      I2 => axi_araddr(4),
      I3 => axi_araddr(5),
      I4 => axi_araddr(2),
      I5 => axi_araddr(3),
      O => s00_axi_aresetn_0
    );
\GCSR_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \GCSR_reg_reg[0]_2\,
      Q => \^w_ap_start\,
      R => SR(0)
    );
\GCSR_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \GCSR_reg_reg[1]_1\,
      Q => \^gcsr_reg_reg[1]_0\(0),
      R => SR(0)
    );
\GCSR_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => w_ap_idle,
      Q => GCSR_reg(2),
      R => SR(0)
    );
\SCSR0_reg[9]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0008000000000000"
    )
        port map (
      I0 => \^axi_arready_reg_0\,
      I1 => s00_axi_aresetn,
      I2 => axi_araddr(2),
      I3 => axi_araddr(5),
      I4 => axi_araddr(4),
      I5 => axi_araddr(3),
      O => axi_arready_reg_1
    );
\SCSR0_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => w_lcd_initialized,
      Q => \SCSR0_reg_reg_n_0_[0]\,
      R => SR(0)
    );
\SCSR0_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => Q(0),
      Q => \SCSR0_reg_reg_n_0_[1]\,
      R => SR(0)
    );
\SCSR0_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => Q(1),
      Q => \SCSR0_reg_reg_n_0_[2]\,
      R => SR(0)
    );
\SCSR0_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => Q(2),
      Q => \SCSR0_reg_reg_n_0_[3]\,
      R => SR(0)
    );
\SCSR0_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => Q(3),
      Q => \SCSR0_reg_reg_n_0_[4]\,
      R => SR(0)
    );
\SCSR0_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => Q(4),
      Q => \SCSR0_reg_reg_n_0_[5]\,
      R => SR(0)
    );
\SCSR0_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \SCSR0_reg_reg[9]_1\,
      Q => \^scsr0_reg_reg[9]_0\,
      R => SR(0)
    );
aw_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFFFFF88888888"
    )
        port map (
      I0 => \^s00_axi_bvalid\,
      I1 => s00_axi_bready,
      I2 => \^axi_awready_reg_0\,
      I3 => s00_axi_awvalid,
      I4 => s00_axi_wvalid,
      I5 => aw_en_reg_n_0,
      O => aw_en_i_1_n_0
    );
aw_en_reg: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => aw_en_i_1_n_0,
      Q => aw_en_reg_n_0,
      S => SR(0)
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(0),
      Q => axi_araddr(2),
      S => SR(0)
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(1),
      Q => axi_araddr(3),
      S => SR(0)
    );
\axi_araddr_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(2),
      Q => axi_araddr(4),
      S => SR(0)
    );
\axi_araddr_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(3),
      Q => axi_araddr(5),
      S => SR(0)
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
      R => SR(0)
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(0),
      Q => axi_awaddr(2),
      R => SR(0)
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(1),
      Q => axi_awaddr(3),
      R => SR(0)
    );
\axi_awaddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(2),
      Q => axi_awaddr(4),
      R => SR(0)
    );
\axi_awaddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(3),
      Q => axi_awaddr(5),
      R => SR(0)
    );
axi_awready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \^axi_awready_reg_0\,
      I1 => s00_axi_awvalid,
      I2 => s00_axi_wvalid,
      I3 => aw_en_reg_n_0,
      O => axi_awready0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_awready0,
      Q => \^axi_awready_reg_0\,
      R => SR(0)
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55555555C0000000"
    )
        port map (
      I0 => s00_axi_bready,
      I1 => \^axi_awready_reg_0\,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_wvalid,
      I4 => \^axi_wready_reg_0\,
      I5 => \^s00_axi_bvalid\,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s00_axi_bvalid\,
      R => SR(0)
    );
\axi_rdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBAAABAAABAAA"
    )
        port map (
      I0 => \axi_rdata[0]_i_2_n_0\,
      I1 => axi_araddr(4),
      I2 => \^w_ap_start\,
      I3 => \axi_rdata[1]_i_3_n_0\,
      I4 => \axi_rdata[1]_i_4_n_0\,
      I5 => \^dcr_reg_reg[0]_0\(0),
      O => reg_data_out(0)
    );
\axi_rdata[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[5]_i_2_n_0\,
      I1 => \SCSR0_reg_reg_n_0_[0]\,
      I2 => \axi_rdata[5]_i_3_n_0\,
      I3 => CCR_reg(0),
      I4 => \^cdr_reg_reg[7]_0\(0),
      I5 => \axi_rdata[5]_i_4_n_0\,
      O => \axi_rdata[0]_i_2_n_0\
    );
\axi_rdata[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
        port map (
      I0 => axi_araddr(3),
      I1 => axi_araddr(2),
      I2 => axi_araddr(5),
      I3 => axi_araddr(4),
      O => reg_data_out(10)
    );
\axi_rdata[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => axi_araddr(3),
      I1 => axi_araddr(2),
      I2 => axi_araddr(5),
      I3 => axi_araddr(4),
      O => reg_data_out(12)
    );
\axi_rdata[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0800000C"
    )
        port map (
      I0 => w_write_char,
      I1 => axi_araddr(4),
      I2 => axi_araddr(5),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      O => reg_data_out(16)
    );
\axi_rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBAAABAAABAAA"
    )
        port map (
      I0 => \axi_rdata[1]_i_2_n_0\,
      I1 => axi_araddr(4),
      I2 => \^gcsr_reg_reg[1]_0\(0),
      I3 => \axi_rdata[1]_i_3_n_0\,
      I4 => \axi_rdata[1]_i_4_n_0\,
      I5 => w_return_home,
      O => reg_data_out(1)
    );
\axi_rdata[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[5]_i_2_n_0\,
      I1 => \SCSR0_reg_reg_n_0_[1]\,
      I2 => \axi_rdata[5]_i_3_n_0\,
      I3 => CCR_reg(1),
      I4 => \^cdr_reg_reg[7]_0\(1),
      I5 => \axi_rdata[5]_i_4_n_0\,
      O => \axi_rdata[1]_i_2_n_0\
    );
\axi_rdata[1]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => axi_araddr(3),
      I1 => axi_araddr(2),
      I2 => axi_araddr(5),
      O => \axi_rdata[1]_i_3_n_0\
    );
\axi_rdata[1]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => axi_araddr(3),
      I1 => axi_araddr(2),
      I2 => axi_araddr(4),
      I3 => axi_araddr(5),
      O => \axi_rdata[1]_i_4_n_0\
    );
\axi_rdata[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF8"
    )
        port map (
      I0 => \axi_rdata[5]_i_3_n_0\,
      I1 => CCR_reg(2),
      I2 => \axi_rdata[2]_i_2_n_0\,
      I3 => \axi_rdata[2]_i_3_n_0\,
      O => reg_data_out(2)
    );
\axi_rdata[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000022000000F0"
    )
        port map (
      I0 => \^cdr_reg_reg[7]_0\(2),
      I1 => axi_araddr(4),
      I2 => GCSR_reg(2),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => axi_araddr(5),
      O => \axi_rdata[2]_i_2_n_0\
    );
\axi_rdata[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000C0000AF0000"
    )
        port map (
      I0 => \SCSR0_reg_reg_n_0_[2]\,
      I1 => w_cursor_on,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => axi_araddr(4),
      I5 => axi_araddr(5),
      O => \axi_rdata[2]_i_3_n_0\
    );
\axi_rdata[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^axi_arready_reg_0\,
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_rvalid\,
      O => slv_reg_rden
    );
\axi_rdata[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => axi_araddr(5),
      I1 => axi_araddr(4),
      I2 => axi_araddr(3),
      O => reg_data_out(31)
    );
\axi_rdata[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \^cdr_reg_reg[7]_0\(3),
      I1 => \axi_rdata[5]_i_4_n_0\,
      I2 => \axi_rdata[5]_i_3_n_0\,
      I3 => CCR_reg(3),
      I4 => \axi_rdata[3]_i_2_n_0\,
      O => reg_data_out(3)
    );
\axi_rdata[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000C0000A00000"
    )
        port map (
      I0 => \SCSR0_reg_reg_n_0_[3]\,
      I1 => w_cursor_blink,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => axi_araddr(4),
      I5 => axi_araddr(5),
      O => \axi_rdata[3]_i_2_n_0\
    );
\axi_rdata[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \^cdr_reg_reg[7]_0\(4),
      I1 => \axi_rdata[5]_i_4_n_0\,
      I2 => \axi_rdata[5]_i_3_n_0\,
      I3 => CCR_reg(7),
      I4 => \axi_rdata[4]_i_2_n_0\,
      O => reg_data_out(4)
    );
\axi_rdata[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000C0000A00000"
    )
        port map (
      I0 => \SCSR0_reg_reg_n_0_[4]\,
      I1 => \^w_cursor_apply\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => axi_araddr(4),
      I5 => axi_araddr(5),
      O => \axi_rdata[4]_i_2_n_0\
    );
\axi_rdata[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[5]_i_2_n_0\,
      I1 => \SCSR0_reg_reg_n_0_[5]\,
      I2 => \axi_rdata[5]_i_3_n_0\,
      I3 => CCR_reg(7),
      I4 => \^cdr_reg_reg[7]_0\(5),
      I5 => \axi_rdata[5]_i_4_n_0\,
      O => reg_data_out(5)
    );
\axi_rdata[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => axi_araddr(3),
      I1 => axi_araddr(4),
      I2 => axi_araddr(5),
      I3 => axi_araddr(2),
      O => \axi_rdata[5]_i_2_n_0\
    );
\axi_rdata[5]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => axi_araddr(3),
      I1 => axi_araddr(4),
      I2 => axi_araddr(5),
      I3 => axi_araddr(2),
      O => \axi_rdata[5]_i_3_n_0\
    );
\axi_rdata[5]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => axi_araddr(4),
      I1 => axi_araddr(5),
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      O => \axi_rdata[5]_i_4_n_0\
    );
\axi_rdata[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000C000000A0F00"
    )
        port map (
      I0 => \^cdr_reg_reg[7]_0\(6),
      I1 => CCR_reg(6),
      I2 => axi_araddr(3),
      I3 => axi_araddr(4),
      I4 => axi_araddr(5),
      I5 => axi_araddr(2),
      O => reg_data_out(6)
    );
\axi_rdata[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000C000000A0000"
    )
        port map (
      I0 => \^cdr_reg_reg[7]_0\(7),
      I1 => CCR_reg(7),
      I2 => axi_araddr(3),
      I3 => axi_araddr(4),
      I4 => axi_araddr(5),
      I5 => axi_araddr(2),
      O => reg_data_out(7)
    );
\axi_rdata[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0008000C"
    )
        port map (
      I0 => \^scsr0_reg_reg[9]_0\,
      I1 => axi_araddr(4),
      I2 => axi_araddr(5),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      O => reg_data_out(9)
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(0),
      Q => s00_axi_rdata(0),
      R => SR(0)
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(10),
      Q => s00_axi_rdata(9),
      R => SR(0)
    );
\axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(12),
      Q => s00_axi_rdata(10),
      R => SR(0)
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(16),
      Q => s00_axi_rdata(11),
      R => SR(0)
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(1),
      Q => s00_axi_rdata(1),
      R => SR(0)
    );
\axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(2),
      Q => s00_axi_rdata(2),
      R => SR(0)
    );
\axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(31),
      Q => s00_axi_rdata(12),
      R => SR(0)
    );
\axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(3),
      Q => s00_axi_rdata(3),
      R => SR(0)
    );
\axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(4),
      Q => s00_axi_rdata(4),
      R => SR(0)
    );
\axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(5),
      Q => s00_axi_rdata(5),
      R => SR(0)
    );
\axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(6),
      Q => s00_axi_rdata(6),
      R => SR(0)
    );
\axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(7),
      Q => s00_axi_rdata(7),
      R => SR(0)
    );
\axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => reg_data_out(9),
      Q => s00_axi_rdata(8),
      R => SR(0)
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7444"
    )
        port map (
      I0 => s00_axi_rready,
      I1 => \^s00_axi_rvalid\,
      I2 => s00_axi_arvalid,
      I3 => \^axi_arready_reg_0\,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^s00_axi_rvalid\,
      R => SR(0)
    );
axi_wready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => aw_en_reg_n_0,
      I1 => s00_axi_wvalid,
      I2 => s00_axi_awvalid,
      I3 => \^axi_wready_reg_0\,
      O => axi_wready0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_wready0,
      Q => \^axi_wready_reg_0\,
      R => SR(0)
    );
s_cursor_blink_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => w_cursor_blink,
      I1 => s_cursor_blink_i_2_n_0,
      I2 => in24(0),
      O => \DCR_reg_reg[3]_0\
    );
s_cursor_blink_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000000000"
    )
        port map (
      I0 => s_executing_command,
      I1 => \^dcr_reg_reg[0]_0\(0),
      I2 => w_return_home,
      I3 => \^w_cursor_apply\,
      I4 => \^w_ap_start\,
      I5 => w_ap_idle,
      O => s_cursor_blink_i_2_n_0
    );
s_cursor_on_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => w_cursor_on,
      I1 => s_cursor_blink_i_2_n_0,
      I2 => in24(1),
      O => \DCR_reg_reg[2]_0\
    );
s_executing_command_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FEFFFF00000000"
    )
        port map (
      I0 => \^dcr_reg_reg[0]_0\(0),
      I1 => w_return_home,
      I2 => \^w_cursor_apply\,
      I3 => s_executing_command,
      I4 => \s_symbol_to_write_reg[0]\(1),
      I5 => s_executing_command_reg,
      O => ns_executing_command
    );
s_executing_command_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000AAA800000000"
    )
        port map (
      I0 => \^w_ap_start\,
      I1 => \^dcr_reg_reg[0]_0\(0),
      I2 => w_return_home,
      I3 => \^w_cursor_apply\,
      I4 => s_executing_command,
      I5 => w_ap_idle,
      O => \GCSR_reg_reg[0]_0\
    );
\s_symbol_to_write[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0040000000000000"
    )
        port map (
      I0 => \s_symbol_to_write[7]_i_2_n_0\,
      I1 => w_write_char,
      I2 => \^w_ap_start\,
      I3 => \s_symbol_to_write_reg[0]\(0),
      I4 => D(0),
      I5 => \s_symbol_to_write_reg[0]\(4),
      O => E(0)
    );
\s_symbol_to_write[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00FE"
    )
        port map (
      I0 => \^dcr_reg_reg[0]_0\(0),
      I1 => w_return_home,
      I2 => \^w_cursor_apply\,
      I3 => s_executing_command,
      O => \s_symbol_to_write[7]_i_2_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mbblockdesign_ad_0_0_timing_controller is
  port (
    SS : out STD_LOGIC_VECTOR ( 0 to 0 );
    \GCSR_reg_reg[1]\ : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_state_reg[1]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_writing_data_reg : out STD_LOGIC;
    s_executing_command_reg : out STD_LOGIC;
    \FSM_sequential_state_reg[1]_0\ : out STD_LOGIC;
    \FSM_sequential_state_reg[0]\ : out STD_LOGIC;
    \FSM_sequential_state_reg[0]_0\ : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    \GCSR_reg_reg[1]_0\ : in STD_LOGIC;
    s_writing_data_reg_0 : in STD_LOGIC;
    \GCSR_reg_reg[1]_1\ : in STD_LOGIC;
    \GCSR_reg_reg[1]_2\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 4 downto 0 );
    \s_lcd_state_reg[0]\ : in STD_LOGIC;
    \s_lcd_state_reg[0]_0\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \FSM_sequential_state_reg[0]_1\ : in STD_LOGIC;
    \FSM_sequential_state_reg[0]_2\ : in STD_LOGIC;
    \FSM_sequential_state_reg[0]_3\ : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    \DCR_reg_reg[4]\ : in STD_LOGIC;
    \DCR_reg_reg[4]_0\ : in STD_LOGIC;
    \DCR_reg_reg[4]_1\ : in STD_LOGIC;
    s_executing_command_reg_0 : in STD_LOGIC;
    s_writing_data : in STD_LOGIC;
    \GCSR_reg_reg[1]_3\ : in STD_LOGIC;
    \delay_time_reg[17]_0\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_send_lower : in STD_LOGIC;
    s_writing_data_reg_1 : in STD_LOGIC;
    ns_writing_data : in STD_LOGIC;
    ns_executing_command : in STD_LOGIC;
    s_executing_command_reg_1 : in STD_LOGIC;
    s_executing_command_reg_2 : in STD_LOGIC;
    s_executing_command_reg_3 : in STD_LOGIC;
    s_register_select_reg : in STD_LOGIC;
    o_register_select : in STD_LOGIC;
    \GCSR_reg__0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \GCSR_reg_reg[0]\ : in STD_LOGIC;
    w_ap_start : in STD_LOGIC;
    DCR_reg : in STD_LOGIC_VECTOR ( 0 to 0 );
    w_cursor_apply : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of mbblockdesign_ad_0_0_timing_controller : entity is "timing_controller";
end mbblockdesign_ad_0_0_timing_controller;

architecture STRUCTURE of mbblockdesign_ad_0_0_timing_controller is
  signal \FSM_sequential_state[4]_i_6_n_0\ : STD_LOGIC;
  signal \GCSR_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \GCSR_reg[1]_i_3_n_0\ : STD_LOGIC;
  signal \^ss\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal counter : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter[0]_i_2_n_0\ : STD_LOGIC;
  signal \counter[21]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal delay_time : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \delay_time[17]_i_2_n_0\ : STD_LOGIC;
  signal \delay_time[17]_i_3_n_0\ : STD_LOGIC;
  signal done_i_1_n_0 : STD_LOGIC;
  signal nstate : STD_LOGIC;
  signal \nstate1_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \nstate1_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \nstate1_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \nstate1_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \nstate1_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \nstate1_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \nstate1_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \nstate1_carry__0_n_0\ : STD_LOGIC;
  signal \nstate1_carry__0_n_1\ : STD_LOGIC;
  signal \nstate1_carry__0_n_2\ : STD_LOGIC;
  signal \nstate1_carry__0_n_3\ : STD_LOGIC;
  signal \nstate1_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \nstate1_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \nstate1_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \nstate1_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \nstate1_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \nstate1_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \nstate1_carry__1_n_1\ : STD_LOGIC;
  signal \nstate1_carry__1_n_2\ : STD_LOGIC;
  signal \nstate1_carry__1_n_3\ : STD_LOGIC;
  signal nstate1_carry_i_1_n_0 : STD_LOGIC;
  signal nstate1_carry_i_2_n_0 : STD_LOGIC;
  signal nstate1_carry_i_3_n_0 : STD_LOGIC;
  signal nstate1_carry_i_4_n_0 : STD_LOGIC;
  signal nstate1_carry_i_5_n_0 : STD_LOGIC;
  signal nstate1_carry_i_6_n_0 : STD_LOGIC;
  signal nstate1_carry_i_7_n_0 : STD_LOGIC;
  signal nstate1_carry_i_8_n_0 : STD_LOGIC;
  signal nstate1_carry_n_0 : STD_LOGIC;
  signal nstate1_carry_n_1 : STD_LOGIC;
  signal nstate1_carry_n_2 : STD_LOGIC;
  signal nstate1_carry_n_3 : STD_LOGIC;
  signal o_done : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 21 downto 1 );
  signal \s_lcd_state[4]_i_3_n_0\ : STD_LOGIC;
  signal s_register_select_i_5_n_0 : STD_LOGIC;
  signal s_timer_delay_time : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal state : STD_LOGIC;
  signal state_i_1_n_0 : STD_LOGIC;
  signal \NLW_counter_reg[21]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_counter_reg[21]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_nstate1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_nstate1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_nstate1_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_nstate1_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[4]_i_6\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \counter[0]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \counter[0]_i_2\ : label is "soft_lutpair10";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \counter_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[16]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[20]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[21]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[8]_i_1\ : label is 35;
  attribute SOFT_HLUTNM of \delay_time[0]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \delay_time[10]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \delay_time[11]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \delay_time[15]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \delay_time[17]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \delay_time[17]_i_3\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \delay_time[1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \delay_time[21]_i_2\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \delay_time[2]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \delay_time[4]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \delay_time[5]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \delay_time[7]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of done_i_1 : label is "soft_lutpair9";
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of nstate1_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \nstate1_carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \nstate1_carry__1\ : label is 11;
begin
  SS(0) <= \^ss\(0);
\DCR_reg[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABBBBBBAAAAAAAA"
    )
        port map (
      I0 => DCR_reg(0),
      I1 => \GCSR_reg[0]_i_3_n_0\,
      I2 => Q(0),
      I3 => Q(4),
      I4 => \GCSR_reg_reg[0]\,
      I5 => w_cursor_apply,
      O => \FSM_sequential_state_reg[0]_0\
    );
\FSM_sequential_state[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFF02"
    )
        port map (
      I0 => \FSM_sequential_state_reg[0]_1\,
      I1 => Q(1),
      I2 => Q(4),
      I3 => \FSM_sequential_state_reg[0]_2\,
      I4 => \FSM_sequential_state_reg[0]_3\,
      I5 => \FSM_sequential_state[4]_i_6_n_0\,
      O => \FSM_sequential_state_reg[1]\(0)
    );
\FSM_sequential_state[4]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"03FE00AB"
    )
        port map (
      I0 => o_done,
      I1 => Q(3),
      I2 => Q(0),
      I3 => Q(4),
      I4 => Q(2),
      O => \FSM_sequential_state[4]_i_6_n_0\
    );
\GCSR_reg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABBBBBBAAAAAAAA"
    )
        port map (
      I0 => \GCSR_reg__0\(0),
      I1 => \GCSR_reg[0]_i_3_n_0\,
      I2 => Q(0),
      I3 => Q(4),
      I4 => \GCSR_reg_reg[0]\,
      I5 => w_ap_start,
      O => \FSM_sequential_state_reg[0]\
    );
\GCSR_reg[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FE000000"
    )
        port map (
      I0 => \DCR_reg_reg[4]\,
      I1 => \DCR_reg_reg[4]_0\,
      I2 => \DCR_reg_reg[4]_1\,
      I3 => s_register_select_i_5_n_0,
      I4 => s_executing_command_reg_0,
      I5 => s_writing_data,
      O => \GCSR_reg[0]_i_3_n_0\
    );
\GCSR_reg[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EAFFEAEA"
    )
        port map (
      I0 => \GCSR_reg_reg[1]_0\,
      I1 => \GCSR_reg[1]_i_3_n_0\,
      I2 => s_writing_data_reg_0,
      I3 => \GCSR_reg_reg[1]_1\,
      I4 => \GCSR_reg_reg[1]_2\(0),
      O => \GCSR_reg_reg[1]\
    );
\GCSR_reg[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0040000000000000"
    )
        port map (
      I0 => s_writing_data,
      I1 => s_executing_command_reg_0,
      I2 => \FSM_sequential_state_reg[0]_1\,
      I3 => \GCSR_reg_reg[1]_3\,
      I4 => o_done,
      I5 => Q(1),
      O => \GCSR_reg[1]_i_3_n_0\
    );
\counter[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4400F000"
    )
        port map (
      I0 => counter(0),
      I1 => \nstate1_carry__1_n_1\,
      I2 => \counter[0]_i_2_n_0\,
      I3 => s00_axi_aresetn,
      I4 => state,
      O => \counter[0]_i_1_n_0\
    );
\counter[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"010E0001"
    )
        port map (
      I0 => Q(1),
      I1 => Q(2),
      I2 => Q(4),
      I3 => Q(3),
      I4 => Q(0),
      O => \counter[0]_i_2_n_0\
    );
\counter[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \nstate1_carry__1_n_1\,
      I1 => s00_axi_aresetn,
      I2 => state,
      O => \counter[21]_i_1_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \counter[0]_i_1_n_0\,
      Q => counter(0),
      R => '0'
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(10),
      Q => counter(10),
      R => \counter[21]_i_1_n_0\
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(11),
      Q => counter(11),
      R => \counter[21]_i_1_n_0\
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(12),
      Q => counter(12),
      R => \counter[21]_i_1_n_0\
    );
\counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1_n_0\,
      CO(3) => \counter_reg[12]_i_1_n_0\,
      CO(2) => \counter_reg[12]_i_1_n_1\,
      CO(1) => \counter_reg[12]_i_1_n_2\,
      CO(0) => \counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => plusOp(12 downto 9),
      S(3 downto 0) => counter(12 downto 9)
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(13),
      Q => counter(13),
      R => \counter[21]_i_1_n_0\
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(14),
      Q => counter(14),
      R => \counter[21]_i_1_n_0\
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(15),
      Q => counter(15),
      R => \counter[21]_i_1_n_0\
    );
\counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(16),
      Q => counter(16),
      R => \counter[21]_i_1_n_0\
    );
\counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[12]_i_1_n_0\,
      CO(3) => \counter_reg[16]_i_1_n_0\,
      CO(2) => \counter_reg[16]_i_1_n_1\,
      CO(1) => \counter_reg[16]_i_1_n_2\,
      CO(0) => \counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => plusOp(16 downto 13),
      S(3 downto 0) => counter(16 downto 13)
    );
\counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(17),
      Q => counter(17),
      R => \counter[21]_i_1_n_0\
    );
\counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(18),
      Q => counter(18),
      R => \counter[21]_i_1_n_0\
    );
\counter_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(19),
      Q => counter(19),
      R => \counter[21]_i_1_n_0\
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(1),
      Q => counter(1),
      R => \counter[21]_i_1_n_0\
    );
\counter_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(20),
      Q => counter(20),
      R => \counter[21]_i_1_n_0\
    );
\counter_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[16]_i_1_n_0\,
      CO(3) => \counter_reg[20]_i_1_n_0\,
      CO(2) => \counter_reg[20]_i_1_n_1\,
      CO(1) => \counter_reg[20]_i_1_n_2\,
      CO(0) => \counter_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => plusOp(20 downto 17),
      S(3 downto 0) => counter(20 downto 17)
    );
\counter_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(21),
      Q => counter(21),
      R => \counter[21]_i_1_n_0\
    );
\counter_reg[21]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[20]_i_1_n_0\,
      CO(3 downto 0) => \NLW_counter_reg[21]_i_2_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_counter_reg[21]_i_2_O_UNCONNECTED\(3 downto 1),
      O(0) => plusOp(21),
      S(3 downto 1) => B"000",
      S(0) => counter(21)
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(2),
      Q => counter(2),
      R => \counter[21]_i_1_n_0\
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(3),
      Q => counter(3),
      R => \counter[21]_i_1_n_0\
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(4),
      Q => counter(4),
      R => \counter[21]_i_1_n_0\
    );
\counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[4]_i_1_n_0\,
      CO(2) => \counter_reg[4]_i_1_n_1\,
      CO(1) => \counter_reg[4]_i_1_n_2\,
      CO(0) => \counter_reg[4]_i_1_n_3\,
      CYINIT => counter(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => plusOp(4 downto 1),
      S(3 downto 0) => counter(4 downto 1)
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(5),
      Q => counter(5),
      R => \counter[21]_i_1_n_0\
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(6),
      Q => counter(6),
      R => \counter[21]_i_1_n_0\
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(7),
      Q => counter(7),
      R => \counter[21]_i_1_n_0\
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(8),
      Q => counter(8),
      R => \counter[21]_i_1_n_0\
    );
\counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1_n_0\,
      CO(3) => \counter_reg[8]_i_1_n_0\,
      CO(2) => \counter_reg[8]_i_1_n_1\,
      CO(1) => \counter_reg[8]_i_1_n_2\,
      CO(0) => \counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => plusOp(8 downto 5),
      S(3 downto 0) => counter(8 downto 5)
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => plusOp(9),
      Q => counter(9),
      R => \counter[21]_i_1_n_0\
    );
\delay_time[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => Q(3),
      I1 => Q(2),
      I2 => Q(0),
      O => s_timer_delay_time(0)
    );
\delay_time[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => s_timer_delay_time(11),
      I1 => Q(1),
      I2 => Q(3),
      I3 => Q(0),
      I4 => Q(2),
      O => s_timer_delay_time(10)
    );
\delay_time[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EB000000"
    )
        port map (
      I0 => \delay_time[17]_i_2_n_0\,
      I1 => \delay_time_reg[17]_0\(1),
      I2 => \delay_time_reg[17]_0\(0),
      I3 => s_send_lower,
      I4 => \delay_time[17]_i_3_n_0\,
      O => s_timer_delay_time(11)
    );
\delay_time[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => s_timer_delay_time(17),
      I1 => Q(1),
      I2 => Q(3),
      I3 => Q(0),
      I4 => Q(2),
      O => s_timer_delay_time(15)
    );
\delay_time[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"14000000"
    )
        port map (
      I0 => \delay_time[17]_i_2_n_0\,
      I1 => \delay_time_reg[17]_0\(0),
      I2 => \delay_time_reg[17]_0\(1),
      I3 => s_send_lower,
      I4 => \delay_time[17]_i_3_n_0\,
      O => s_timer_delay_time(17)
    );
\delay_time[17]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \delay_time_reg[17]_0\(2),
      I1 => \delay_time_reg[17]_0\(3),
      I2 => \delay_time_reg[17]_0\(5),
      I3 => \delay_time_reg[17]_0\(4),
      I4 => \delay_time_reg[17]_0\(6),
      I5 => \delay_time_reg[17]_0\(7),
      O => \delay_time[17]_i_2_n_0\
    );
\delay_time[17]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001000"
    )
        port map (
      I0 => Q(2),
      I1 => Q(4),
      I2 => Q(0),
      I3 => Q(3),
      I4 => Q(1),
      O => \delay_time[17]_i_3_n_0\
    );
\delay_time[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00F01000"
    )
        port map (
      I0 => s_send_lower,
      I1 => Q(2),
      I2 => Q(0),
      I3 => Q(3),
      I4 => Q(1),
      O => s_timer_delay_time(1)
    );
\delay_time[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000002020209"
    )
        port map (
      I0 => Q(0),
      I1 => Q(3),
      I2 => Q(4),
      I3 => Q(2),
      I4 => Q(1),
      I5 => state,
      O => nstate
    );
\delay_time[21]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => Q(2),
      I1 => Q(0),
      I2 => Q(3),
      I3 => Q(1),
      O => s_timer_delay_time(21)
    );
\delay_time[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"001030C0"
    )
        port map (
      I0 => s_send_lower,
      I1 => Q(1),
      I2 => Q(0),
      I3 => Q(2),
      I4 => Q(3),
      O => s_timer_delay_time(2)
    );
\delay_time[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => Q(3),
      I1 => Q(2),
      I2 => Q(0),
      I3 => Q(1),
      O => s_timer_delay_time(3)
    );
\delay_time[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000040"
    )
        port map (
      I0 => Q(1),
      I1 => Q(3),
      I2 => Q(0),
      I3 => Q(2),
      I4 => s_send_lower,
      O => s_timer_delay_time(4)
    );
\delay_time[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000020C0"
    )
        port map (
      I0 => s_send_lower,
      I1 => Q(2),
      I2 => Q(0),
      I3 => Q(3),
      I4 => Q(1),
      O => s_timer_delay_time(5)
    );
\delay_time[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0041"
    )
        port map (
      I0 => Q(1),
      I1 => Q(3),
      I2 => Q(0),
      I3 => Q(2),
      O => s_timer_delay_time(7)
    );
\delay_time_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => nstate,
      D => s_timer_delay_time(0),
      Q => delay_time(0),
      R => \^ss\(0)
    );
\delay_time_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => nstate,
      D => s_timer_delay_time(10),
      Q => delay_time(10),
      R => \^ss\(0)
    );
\delay_time_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => nstate,
      D => s_timer_delay_time(11),
      Q => delay_time(11),
      R => \^ss\(0)
    );
\delay_time_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => nstate,
      D => s_timer_delay_time(15),
      Q => delay_time(15),
      R => \^ss\(0)
    );
\delay_time_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => nstate,
      D => s_timer_delay_time(17),
      Q => delay_time(17),
      R => \^ss\(0)
    );
\delay_time_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => nstate,
      D => s_timer_delay_time(1),
      Q => delay_time(1),
      R => \^ss\(0)
    );
\delay_time_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => nstate,
      D => s_timer_delay_time(21),
      Q => delay_time(21),
      R => \^ss\(0)
    );
\delay_time_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => nstate,
      D => s_timer_delay_time(2),
      Q => delay_time(2),
      R => \^ss\(0)
    );
\delay_time_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => nstate,
      D => s_timer_delay_time(3),
      Q => delay_time(3),
      R => \^ss\(0)
    );
\delay_time_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => nstate,
      D => s_timer_delay_time(4),
      Q => delay_time(4),
      R => \^ss\(0)
    );
\delay_time_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => nstate,
      D => s_timer_delay_time(5),
      Q => delay_time(5),
      R => \^ss\(0)
    );
\delay_time_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => nstate,
      D => s_timer_delay_time(7),
      Q => delay_time(7),
      R => \^ss\(0)
    );
done_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => state,
      I1 => s00_axi_aresetn,
      I2 => \nstate1_carry__1_n_1\,
      O => done_i_1_n_0
    );
done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => done_i_1_n_0,
      Q => o_done,
      R => '0'
    );
nstate1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => nstate1_carry_n_0,
      CO(2) => nstate1_carry_n_1,
      CO(1) => nstate1_carry_n_2,
      CO(0) => nstate1_carry_n_3,
      CYINIT => '0',
      DI(3) => nstate1_carry_i_1_n_0,
      DI(2) => nstate1_carry_i_2_n_0,
      DI(1) => nstate1_carry_i_3_n_0,
      DI(0) => nstate1_carry_i_4_n_0,
      O(3 downto 0) => NLW_nstate1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => nstate1_carry_i_5_n_0,
      S(2) => nstate1_carry_i_6_n_0,
      S(1) => nstate1_carry_i_7_n_0,
      S(0) => nstate1_carry_i_8_n_0
    );
\nstate1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => nstate1_carry_n_0,
      CO(3) => \nstate1_carry__0_n_0\,
      CO(2) => \nstate1_carry__0_n_1\,
      CO(1) => \nstate1_carry__0_n_2\,
      CO(0) => \nstate1_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \nstate1_carry__0_i_1_n_0\,
      DI(2) => '0',
      DI(1) => \nstate1_carry__0_i_2_n_0\,
      DI(0) => \nstate1_carry__0_i_3_n_0\,
      O(3 downto 0) => \NLW_nstate1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \nstate1_carry__0_i_4_n_0\,
      S(2) => \nstate1_carry__0_i_5_n_0\,
      S(1) => \nstate1_carry__0_i_6_n_0\,
      S(0) => \nstate1_carry__0_i_7_n_0\
    );
\nstate1_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => delay_time(15),
      I1 => counter(15),
      I2 => delay_time(21),
      I3 => counter(14),
      O => \nstate1_carry__0_i_1_n_0\
    );
\nstate1_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => delay_time(11),
      I1 => counter(11),
      I2 => delay_time(10),
      I3 => counter(10),
      O => \nstate1_carry__0_i_2_n_0\
    );
\nstate1_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => delay_time(10),
      I1 => counter(9),
      I2 => delay_time(11),
      I3 => counter(8),
      O => \nstate1_carry__0_i_3_n_0\
    );
\nstate1_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => counter(14),
      I1 => delay_time(21),
      I2 => counter(15),
      I3 => delay_time(15),
      O => \nstate1_carry__0_i_4_n_0\
    );
\nstate1_carry__0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter(12),
      I1 => counter(13),
      O => \nstate1_carry__0_i_5_n_0\
    );
\nstate1_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => counter(11),
      I1 => delay_time(11),
      I2 => counter(10),
      I3 => delay_time(10),
      O => \nstate1_carry__0_i_6_n_0\
    );
\nstate1_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => counter(8),
      I1 => delay_time(11),
      I2 => counter(9),
      I3 => delay_time(10),
      O => \nstate1_carry__0_i_7_n_0\
    );
\nstate1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \nstate1_carry__0_n_0\,
      CO(3) => \NLW_nstate1_carry__1_CO_UNCONNECTED\(3),
      CO(2) => \nstate1_carry__1_n_1\,
      CO(1) => \nstate1_carry__1_n_2\,
      CO(0) => \nstate1_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \nstate1_carry__1_i_1_n_0\,
      DI(1) => \nstate1_carry__1_i_2_n_0\,
      DI(0) => \nstate1_carry__1_i_3_n_0\,
      O(3 downto 0) => \NLW_nstate1_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => \nstate1_carry__1_i_4_n_0\,
      S(1) => \nstate1_carry__1_i_5_n_0\,
      S(0) => \nstate1_carry__1_i_6_n_0\
    );
\nstate1_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => delay_time(21),
      I1 => counter(21),
      O => \nstate1_carry__1_i_1_n_0\
    );
\nstate1_carry__1_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"70"
    )
        port map (
      I0 => counter(19),
      I1 => counter(18),
      I2 => delay_time(21),
      O => \nstate1_carry__1_i_2_n_0\
    );
\nstate1_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => delay_time(17),
      I1 => counter(17),
      I2 => delay_time(21),
      I3 => counter(16),
      O => \nstate1_carry__1_i_3_n_0\
    );
\nstate1_carry__1_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"41"
    )
        port map (
      I0 => counter(20),
      I1 => counter(21),
      I2 => delay_time(21),
      O => \nstate1_carry__1_i_4_n_0\
    );
\nstate1_carry__1_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"81"
    )
        port map (
      I0 => delay_time(21),
      I1 => counter(18),
      I2 => counter(19),
      O => \nstate1_carry__1_i_5_n_0\
    );
\nstate1_carry__1_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => counter(16),
      I1 => delay_time(21),
      I2 => counter(17),
      I3 => delay_time(17),
      O => \nstate1_carry__1_i_6_n_0\
    );
nstate1_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => delay_time(7),
      I1 => counter(7),
      I2 => delay_time(21),
      I3 => counter(6),
      O => nstate1_carry_i_1_n_0
    );
nstate1_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => delay_time(5),
      I1 => counter(5),
      I2 => delay_time(4),
      I3 => counter(4),
      O => nstate1_carry_i_2_n_0
    );
nstate1_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => delay_time(3),
      I1 => counter(3),
      I2 => delay_time(2),
      I3 => counter(2),
      O => nstate1_carry_i_3_n_0
    );
nstate1_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => delay_time(1),
      I1 => counter(1),
      I2 => delay_time(0),
      I3 => counter(0),
      O => nstate1_carry_i_4_n_0
    );
nstate1_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => counter(6),
      I1 => delay_time(21),
      I2 => counter(7),
      I3 => delay_time(7),
      O => nstate1_carry_i_5_n_0
    );
nstate1_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => counter(5),
      I1 => delay_time(5),
      I2 => counter(4),
      I3 => delay_time(4),
      O => nstate1_carry_i_6_n_0
    );
nstate1_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => counter(3),
      I1 => delay_time(3),
      I2 => counter(2),
      I3 => delay_time(2),
      O => nstate1_carry_i_7_n_0
    );
nstate1_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => counter(1),
      I1 => delay_time(1),
      I2 => counter(0),
      I3 => delay_time(0),
      O => nstate1_carry_i_8_n_0
    );
s_executing_command_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAABBABAAAA88A8"
    )
        port map (
      I0 => ns_executing_command,
      I1 => s_executing_command_reg_1,
      I2 => s_executing_command_reg_2,
      I3 => s_executing_command_reg_3,
      I4 => \GCSR_reg[0]_i_3_n_0\,
      I5 => s_executing_command_reg_0,
      O => s_executing_command_reg
    );
\s_lcd_state[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAEAEAEAA"
    )
        port map (
      I0 => \s_lcd_state[4]_i_3_n_0\,
      I1 => Q(4),
      I2 => \s_lcd_state_reg[0]\,
      I3 => \s_lcd_state_reg[0]_0\(0),
      I4 => \s_lcd_state_reg[0]_0\(1),
      I5 => \s_lcd_state_reg[0]_0\(2),
      O => E(0)
    );
\s_lcd_state[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0049004C0048004C"
    )
        port map (
      I0 => Q(2),
      I1 => Q(4),
      I2 => Q(1),
      I3 => Q(3),
      I4 => Q(0),
      I5 => o_done,
      O => \s_lcd_state[4]_i_3_n_0\
    );
s_register_select_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => \^ss\(0)
    );
s_register_select_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"888F8F8F88808080"
    )
        port map (
      I0 => ns_writing_data,
      I1 => Q(1),
      I2 => s_register_select_reg,
      I3 => s_register_select_i_5_n_0,
      I4 => s_writing_data_reg_0,
      I5 => o_register_select,
      O => \FSM_sequential_state_reg[1]_0\
    );
s_register_select_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0008000000000000"
    )
        port map (
      I0 => Q(1),
      I1 => o_done,
      I2 => Q(2),
      I3 => Q(4),
      I4 => Q(0),
      I5 => Q(3),
      O => s_register_select_i_5_n_0
    );
s_writing_data_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFFF8888"
    )
        port map (
      I0 => s_writing_data_reg_1,
      I1 => ns_writing_data,
      I2 => s_writing_data_reg_0,
      I3 => s_register_select_i_5_n_0,
      I4 => s_writing_data,
      O => s_writing_data_reg
    );
state_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \nstate1_carry__1_n_1\,
      I1 => state,
      I2 => \counter[0]_i_2_n_0\,
      O => state_i_1_n_0
    );
state_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => state_i_1_n_0,
      Q => state,
      R => \^ss\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mbblockdesign_ad_0_0_lcd_controller is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_executing_command_reg_0 : out STD_LOGIC;
    in24 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    w_lcd_initialized : out STD_LOGIC;
    o_register_select : out STD_LOGIC;
    o_read_write_enable : out STD_LOGIC;
    \SCSR0_reg_reg[9]\ : out STD_LOGIC;
    \GCSR_reg_reg[1]\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 4 downto 0 );
    w_ap_idle : out STD_LOGIC;
    \FSM_sequential_state_reg[2]_0\ : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    o_db4_7 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \FSM_sequential_state_reg[0]_0\ : out STD_LOGIC;
    \FSM_sequential_state_reg[0]_1\ : out STD_LOGIC;
    \s_lcd_state_reg[4]_0\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \s_ddram_pos_last_written_reg[7]_0\ : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    s_cursor_blink_reg_0 : in STD_LOGIC;
    s_cursor_on_reg_0 : in STD_LOGIC;
    \SCSR0_reg_reg[9]_0\ : in STD_LOGIC;
    \SCSR0_reg_reg[9]_1\ : in STD_LOGIC;
    \GCSR_reg_reg[1]_0\ : in STD_LOGIC;
    \GCSR_reg_reg[1]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_state_reg[0]_2\ : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    \FSM_sequential_state_reg[1]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_state_reg[1]_1\ : in STD_LOGIC;
    \FSM_sequential_state_reg[0]_3\ : in STD_LOGIC;
    ns_executing_command : in STD_LOGIC;
    s_executing_command_reg_1 : in STD_LOGIC;
    \GCSR_reg__0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    w_ap_start : in STD_LOGIC;
    DCR_reg : in STD_LOGIC_VECTOR ( 0 to 0 );
    w_cursor_apply : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    \s_symbol_to_write_reg[7]_0\ : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of mbblockdesign_ad_0_0_lcd_controller : entity is "lcd_controller";
end mbblockdesign_ad_0_0_lcd_controller;

architecture STRUCTURE of mbblockdesign_ad_0_0_lcd_controller is
  signal \^d\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \FSM_sequential_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_7_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_8_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_10_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_12_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_7_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_8_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_9_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[4]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[4]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[4]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[4]_i_7_n_0\ : STD_LOGIC;
  signal \^fsm_sequential_state_reg[2]_0\ : STD_LOGIC;
  signal \GCSR_reg[0]_i_4_n_0\ : STD_LOGIC;
  signal \GCSR_reg[0]_i_6_n_0\ : STD_LOGIC;
  signal \GCSR_reg[0]_i_7_n_0\ : STD_LOGIC;
  signal \GCSR_reg[1]_i_2_n_0\ : STD_LOGIC;
  signal \GCSR_reg[1]_i_5_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \SCSR0_reg[9]_i_2_n_0\ : STD_LOGIC;
  signal \SCSR0_reg[9]_i_3_n_0\ : STD_LOGIC;
  signal \SCSR0_reg[9]_i_4_n_0\ : STD_LOGIC;
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \_inferred__5/s_lcd_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \_inferred__5/s_lcd_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \_inferred__5/s_lcd_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \_inferred__5/s_lcd_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \_inferred__5/s_lcd_state[4]_i_2_n_0\ : STD_LOGIC;
  signal \^in24\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal in25 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal ns_ddram_pos_last_written0_in : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal ns_next_ddram_pos : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal ns_writing_data : STD_LOGIC;
  signal \^o_read_write_enable\ : STD_LOGIC;
  signal \^o_register_select\ : STD_LOGIC;
  signal s_data : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \s_data[0]_i_1_n_0\ : STD_LOGIC;
  signal \s_data[0]_i_2_n_0\ : STD_LOGIC;
  signal \s_data[0]_i_3_n_0\ : STD_LOGIC;
  signal \s_data[1]_i_1_n_0\ : STD_LOGIC;
  signal \s_data[1]_i_2_n_0\ : STD_LOGIC;
  signal \s_data[2]_i_1_n_0\ : STD_LOGIC;
  signal \s_data[2]_i_2_n_0\ : STD_LOGIC;
  signal \s_data[3]_i_1_n_0\ : STD_LOGIC;
  signal \s_data[3]_i_2_n_0\ : STD_LOGIC;
  signal \s_data[4]_i_1_n_0\ : STD_LOGIC;
  signal \s_data[5]_i_1_n_0\ : STD_LOGIC;
  signal \s_data[6]_i_1_n_0\ : STD_LOGIC;
  signal \s_data[7]_i_1_n_0\ : STD_LOGIC;
  signal \s_data[7]_i_2_n_0\ : STD_LOGIC;
  signal \s_ddram_pos_last_written[7]_i_1_n_0\ : STD_LOGIC;
  signal s_executing_command_i_4_n_0 : STD_LOGIC;
  signal s_executing_command_i_5_n_0 : STD_LOGIC;
  signal \^s_executing_command_reg_0\ : STD_LOGIC;
  signal s_function_set_twice : STD_LOGIC;
  signal s_function_set_twice_i_1_n_0 : STD_LOGIC;
  signal s_function_set_twice_i_2_n_0 : STD_LOGIC;
  signal s_lcd_initialized_i_1_n_0 : STD_LOGIC;
  signal s_lower_nibble : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \s_lower_nibble[3]_i_1_n_0\ : STD_LOGIC;
  signal \s_next_ddram_pos[6]_i_1_n_0\ : STD_LOGIC;
  signal \s_next_ddram_pos[6]_i_3_n_0\ : STD_LOGIC;
  signal s_read_write_enable_i_1_n_0 : STD_LOGIC;
  signal s_register_select_i_4_n_0 : STD_LOGIC;
  signal s_register_select_i_6_n_0 : STD_LOGIC;
  signal s_register_select_i_7_n_0 : STD_LOGIC;
  signal s_send_lower : STD_LOGIC;
  signal s_send_lower_i_1_n_0 : STD_LOGIC;
  signal s_send_lower_i_2_n_0 : STD_LOGIC;
  signal s_symbol_to_write : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s_upper_nibble : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s_writing_data : STD_LOGIC;
  signal timing_controller_inst_n_2 : STD_LOGIC;
  signal timing_controller_inst_n_3 : STD_LOGIC;
  signal timing_controller_inst_n_4 : STD_LOGIC;
  signal timing_controller_inst_n_5 : STD_LOGIC;
  signal timing_controller_inst_n_6 : STD_LOGIC;
  signal \^w_ap_idle\ : STD_LOGIC;
  signal \^w_lcd_initialized\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_3\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_5\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_6\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_7\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_8\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_10\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_6\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_8\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_9\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_3\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \FSM_sequential_state[3]_i_3\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \FSM_sequential_state[4]_i_3\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \FSM_sequential_state[4]_i_5\ : label is "soft_lutpair22";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "pulse_enable_delay:00110,pulse_enable:00111,wait_setup_delay:00100,write_cursor_pos:10001,check_cursor_pos:10000,init_func_set:00010,exec_delay:01011,init_wait_30ms_delay:00001,disable_enable_delay:01000,init_wait_30ms:00000,display_control:10101,wait_setup:00101,return_home:10100,setup_control_delay:01010,init_finished:01111,clear_display:10011,init_clear:01110,write:10110,setup_control:00011,ready:10010,init_entry_mode:01101,disable_enable:01001,init_disp_ctrl:01100";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "pulse_enable_delay:00110,pulse_enable:00111,wait_setup_delay:00100,write_cursor_pos:10001,check_cursor_pos:10000,init_func_set:00010,exec_delay:01011,init_wait_30ms_delay:00001,disable_enable_delay:01000,init_wait_30ms:00000,display_control:10101,wait_setup:00101,return_home:10100,setup_control_delay:01010,init_finished:01111,clear_display:10011,init_clear:01110,write:10110,setup_control:00011,ready:10010,init_entry_mode:01101,disable_enable:01001,init_disp_ctrl:01100";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "pulse_enable_delay:00110,pulse_enable:00111,wait_setup_delay:00100,write_cursor_pos:10001,check_cursor_pos:10000,init_func_set:00010,exec_delay:01011,init_wait_30ms_delay:00001,disable_enable_delay:01000,init_wait_30ms:00000,display_control:10101,wait_setup:00101,return_home:10100,setup_control_delay:01010,init_finished:01111,clear_display:10011,init_clear:01110,write:10110,setup_control:00011,ready:10010,init_entry_mode:01101,disable_enable:01001,init_disp_ctrl:01100";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[3]\ : label is "pulse_enable_delay:00110,pulse_enable:00111,wait_setup_delay:00100,write_cursor_pos:10001,check_cursor_pos:10000,init_func_set:00010,exec_delay:01011,init_wait_30ms_delay:00001,disable_enable_delay:01000,init_wait_30ms:00000,display_control:10101,wait_setup:00101,return_home:10100,setup_control_delay:01010,init_finished:01111,clear_display:10011,init_clear:01110,write:10110,setup_control:00011,ready:10010,init_entry_mode:01101,disable_enable:01001,init_disp_ctrl:01100";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[4]\ : label is "pulse_enable_delay:00110,pulse_enable:00111,wait_setup_delay:00100,write_cursor_pos:10001,check_cursor_pos:10000,init_func_set:00010,exec_delay:01011,init_wait_30ms_delay:00001,disable_enable_delay:01000,init_wait_30ms:00000,display_control:10101,wait_setup:00101,return_home:10100,setup_control_delay:01010,init_finished:01111,clear_display:10011,init_clear:01110,write:10110,setup_control:00011,ready:10010,init_entry_mode:01101,disable_enable:01001,init_disp_ctrl:01100";
  attribute SOFT_HLUTNM of \GCSR_reg[0]_i_4\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \GCSR_reg[0]_i_6\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \GCSR_reg[0]_i_7\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \GCSR_reg[1]_i_6\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \GCSR_reg[2]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \SCSR0_reg[9]_i_2\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \SCSR0_reg[9]_i_3\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \SCSR0_reg[9]_i_4\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \_inferred__5/s_lcd_state[0]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \_inferred__5/s_lcd_state[1]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \_inferred__5/s_lcd_state[2]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \_inferred__5/s_lcd_state[3]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \_inferred__5/s_lcd_state[4]_i_2\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \o_db4_7[0]_INST_0\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \o_db4_7[1]_INST_0\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \o_db4_7[2]_INST_0\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \o_db4_7[3]_INST_0\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \s_data[2]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \s_data[3]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \s_data[4]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \s_data[5]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \s_data[7]_i_2\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \s_ddram_pos_last_written[1]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \s_ddram_pos_last_written[2]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \s_ddram_pos_last_written[3]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \s_ddram_pos_last_written[6]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \s_ddram_pos_last_written[7]_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of s_executing_command_i_4 : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of s_executing_command_i_5 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of s_function_set_twice_i_2 : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \s_next_ddram_pos[1]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \s_next_ddram_pos[2]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \s_next_ddram_pos[3]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \s_next_ddram_pos[6]_i_3\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of s_register_select_i_3 : label is "soft_lutpair17";
begin
  D(0) <= \^d\(0);
  \FSM_sequential_state_reg[2]_0\ <= \^fsm_sequential_state_reg[2]_0\;
  Q(4 downto 0) <= \^q\(4 downto 0);
  SR(0) <= \^sr\(0);
  in24(1 downto 0) <= \^in24\(1 downto 0);
  o_read_write_enable <= \^o_read_write_enable\;
  o_register_select <= \^o_register_select\;
  s_executing_command_reg_0 <= \^s_executing_command_reg_0\;
  w_ap_idle <= \^w_ap_idle\;
  w_lcd_initialized <= \^w_lcd_initialized\;
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEEE"
    )
        port map (
      I0 => \FSM_sequential_state[0]_i_2_n_0\,
      I1 => \FSM_sequential_state[0]_i_3_n_0\,
      I2 => ns_writing_data,
      I3 => \^q\(2),
      I4 => \FSM_sequential_state[0]_i_4_n_0\,
      I5 => \FSM_sequential_state[0]_i_5_n_0\,
      O => \FSM_sequential_state[0]_i_1_n_0\
    );
\FSM_sequential_state[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"08080808FF080808"
    )
        port map (
      I0 => \FSM_sequential_state[0]_i_6_n_0\,
      I1 => \^q\(3),
      I2 => \^q\(1),
      I3 => \FSM_sequential_state[0]_i_7_n_0\,
      I4 => \FSM_sequential_state[0]_i_8_n_0\,
      I5 => s_register_select_i_7_n_0,
      O => \FSM_sequential_state[0]_i_2_n_0\
    );
\FSM_sequential_state[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01010001"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(3),
      I3 => s_executing_command_i_5_n_0,
      I4 => \^q\(2),
      O => \FSM_sequential_state[0]_i_3_n_0\
    );
\FSM_sequential_state[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA08000000FFFF"
    )
        port map (
      I0 => \^fsm_sequential_state_reg[2]_0\,
      I1 => \^q\(1),
      I2 => \^s_executing_command_reg_0\,
      I3 => \FSM_sequential_state_reg[0]_3\,
      I4 => \^q\(0),
      I5 => \^q\(4),
      O => \FSM_sequential_state[0]_i_4_n_0\
    );
\FSM_sequential_state[0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02020C00"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(3),
      I2 => \^q\(1),
      I3 => s_send_lower,
      I4 => \^q\(4),
      O => \FSM_sequential_state[0]_i_5_n_0\
    );
\FSM_sequential_state[0]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(4),
      O => \FSM_sequential_state[0]_i_6_n_0\
    );
\FSM_sequential_state[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8002"
    )
        port map (
      I0 => s_data(0),
      I1 => s_data(1),
      I2 => s_data(2),
      I3 => s_data(3),
      O => \FSM_sequential_state[0]_i_7_n_0\
    );
\FSM_sequential_state[0]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000040"
    )
        port map (
      I0 => s_data(5),
      I1 => \^q\(1),
      I2 => \^q\(3),
      I3 => \^q\(4),
      I4 => \^q\(2),
      O => \FSM_sequential_state[0]_i_8_n_0\
    );
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFEFFFE"
    )
        port map (
      I0 => \FSM_sequential_state[1]_i_2_n_0\,
      I1 => \FSM_sequential_state[1]_i_3_n_0\,
      I2 => \FSM_sequential_state[1]_i_4_n_0\,
      I3 => \FSM_sequential_state[1]_i_5_n_0\,
      I4 => \FSM_sequential_state[1]_i_6_n_0\,
      I5 => \FSM_sequential_state[1]_i_7_n_0\,
      O => \FSM_sequential_state[1]_i_1_n_0\
    );
\FSM_sequential_state[1]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"007F"
    )
        port map (
      I0 => s_data(2),
      I1 => s_data(0),
      I2 => s_data(1),
      I3 => s_data(5),
      O => \FSM_sequential_state[1]_i_10_n_0\
    );
\FSM_sequential_state[1]_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => s_data(0),
      I1 => s_data(1),
      O => \FSM_sequential_state[1]_i_12_n_0\
    );
\FSM_sequential_state[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0D5FFC0F0D5F0C0"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(2),
      I2 => \^q\(3),
      I3 => \^q\(4),
      I4 => \^q\(1),
      I5 => s_executing_command_i_5_n_0,
      O => \FSM_sequential_state[1]_i_2_n_0\
    );
\FSM_sequential_state[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C8EAFFFFC8EAC8EA"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(4),
      I2 => \^q\(2),
      I3 => \^q\(1),
      I4 => s_data(3),
      I5 => \FSM_sequential_state[1]_i_8_n_0\,
      O => \FSM_sequential_state[1]_i_3_n_0\
    );
\FSM_sequential_state[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A000000FE000000"
    )
        port map (
      I0 => \FSM_sequential_state[1]_i_9_n_0\,
      I1 => \FSM_sequential_state[1]_i_10_n_0\,
      I2 => s_register_select_i_7_n_0,
      I3 => \^q\(3),
      I4 => \^q\(0),
      I5 => s_writing_data,
      O => \FSM_sequential_state[1]_i_4_n_0\
    );
\FSM_sequential_state[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF4444444444444"
    )
        port map (
      I0 => \FSM_sequential_state_reg[1]_1\,
      I1 => \FSM_sequential_state[1]_i_6_n_0\,
      I2 => \FSM_sequential_state[1]_i_12_n_0\,
      I3 => s_data(2),
      I4 => \FSM_sequential_state[1]_i_8_n_0\,
      I5 => s_data(5),
      O => \FSM_sequential_state[1]_i_5_n_0\
    );
\FSM_sequential_state[1]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      O => \FSM_sequential_state[1]_i_6_n_0\
    );
\FSM_sequential_state[1]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^s_executing_command_reg_0\,
      I1 => \FSM_sequential_state_reg[1]_0\(0),
      O => \FSM_sequential_state[1]_i_7_n_0\
    );
\FSM_sequential_state[1]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(0),
      I2 => s_writing_data,
      O => \FSM_sequential_state[1]_i_8_n_0\
    );
\FSM_sequential_state[1]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100100"
    )
        port map (
      I0 => s_data(5),
      I1 => s_data(3),
      I2 => s_data(2),
      I3 => s_data(0),
      I4 => s_data(1),
      O => \FSM_sequential_state[1]_i_9_n_0\
    );
\FSM_sequential_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF01040404"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(3),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => \FSM_sequential_state[2]_i_2_n_0\,
      O => \FSM_sequential_state[2]_i_1_n_0\
    );
\FSM_sequential_state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF404040FF4040"
    )
        port map (
      I0 => s_register_select_i_7_n_0,
      I1 => \FSM_sequential_state[2]_i_3_n_0\,
      I2 => \FSM_sequential_state[3]_i_3_n_0\,
      I3 => \FSM_sequential_state_reg[1]_0\(0),
      I4 => \^w_ap_idle\,
      I5 => \^s_executing_command_reg_0\,
      O => \FSM_sequential_state[2]_i_2_n_0\
    );
\FSM_sequential_state[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(4),
      I3 => \^q\(2),
      O => \FSM_sequential_state[2]_i_3_n_0\
    );
\FSM_sequential_state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABAAAAEAAAAAAAE"
    )
        port map (
      I0 => \FSM_sequential_state[3]_i_2_n_0\,
      I1 => \^q\(3),
      I2 => \^q\(2),
      I3 => \^q\(4),
      I4 => \^q\(1),
      I5 => \^q\(0),
      O => \FSM_sequential_state[3]_i_1_n_0\
    );
\FSM_sequential_state[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000004000000000"
    )
        port map (
      I0 => s_register_select_i_7_n_0,
      I1 => \^q\(3),
      I2 => \^q\(0),
      I3 => \^q\(4),
      I4 => \^q\(2),
      I5 => \FSM_sequential_state[3]_i_3_n_0\,
      O => \FSM_sequential_state[3]_i_2_n_0\
    );
\FSM_sequential_state[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08010240"
    )
        port map (
      I0 => s_data(2),
      I1 => s_data(3),
      I2 => s_data(5),
      I3 => s_data(1),
      I4 => s_data(0),
      O => \FSM_sequential_state[3]_i_3_n_0\
    );
\FSM_sequential_state[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \FSM_sequential_state[4]_i_7_n_0\,
      I1 => s_register_select_i_6_n_0,
      I2 => \^q\(2),
      I3 => \^q\(3),
      I4 => \^q\(0),
      I5 => \^q\(1),
      O => \FSM_sequential_state[4]_i_2_n_0\
    );
\FSM_sequential_state[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(3),
      O => \FSM_sequential_state[4]_i_3_n_0\
    );
\FSM_sequential_state[4]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000C080B"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(0),
      I2 => \^q\(3),
      I3 => \^q\(2),
      I4 => \^q\(1),
      O => \FSM_sequential_state[4]_i_5_n_0\
    );
\FSM_sequential_state[4]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA8880AAAA0A0A"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \SCSR0_reg[9]_i_4_n_0\,
      I4 => \^q\(3),
      I5 => \^q\(2),
      O => \FSM_sequential_state[4]_i_7_n_0\
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => timing_controller_inst_n_3,
      D => \FSM_sequential_state[0]_i_1_n_0\,
      Q => \^q\(0),
      R => \^sr\(0)
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => timing_controller_inst_n_3,
      D => \FSM_sequential_state[1]_i_1_n_0\,
      Q => \^q\(1),
      R => \^sr\(0)
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => timing_controller_inst_n_3,
      D => \FSM_sequential_state[2]_i_1_n_0\,
      Q => \^q\(2),
      R => \^sr\(0)
    );
\FSM_sequential_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => timing_controller_inst_n_3,
      D => \FSM_sequential_state[3]_i_1_n_0\,
      Q => \^q\(3),
      R => \^sr\(0)
    );
\FSM_sequential_state_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => timing_controller_inst_n_3,
      D => \FSM_sequential_state[4]_i_2_n_0\,
      Q => \^q\(4),
      R => \^sr\(0)
    );
\GCSR_reg[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0C00000A"
    )
        port map (
      I0 => s_executing_command_i_5_n_0,
      I1 => \SCSR0_reg[9]_i_4_n_0\,
      I2 => \^q\(3),
      I3 => \^q\(2),
      I4 => \^q\(1),
      O => \GCSR_reg[0]_i_4_n_0\
    );
\GCSR_reg[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AEE7"
    )
        port map (
      I0 => s_data(5),
      I1 => s_data(3),
      I2 => s_data(1),
      I3 => s_data(0),
      O => \GCSR_reg[0]_i_6_n_0\
    );
\GCSR_reg[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4FF0"
    )
        port map (
      I0 => s_data(3),
      I1 => s_data(0),
      I2 => s_data(2),
      I3 => s_data(1),
      O => \GCSR_reg[0]_i_7_n_0\
    );
\GCSR_reg[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4040444040404040"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(4),
      I2 => \GCSR_reg[1]_i_5_n_0\,
      I3 => \^fsm_sequential_state_reg[2]_0\,
      I4 => \^q\(1),
      I5 => s_executing_command_i_5_n_0,
      O => \GCSR_reg[1]_i_2_n_0\
    );
\GCSR_reg[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0808080800000008"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(2),
      I2 => \^q\(3),
      I3 => s_symbol_to_write(5),
      I4 => s_symbol_to_write(6),
      I5 => s_symbol_to_write(7),
      O => \GCSR_reg[1]_i_5_n_0\
    );
\GCSR_reg[1]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(3),
      O => \^fsm_sequential_state_reg[2]_0\
    );
\GCSR_reg[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000200"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(3),
      I2 => \^q\(2),
      I3 => \^q\(1),
      I4 => \^q\(0),
      O => \^w_ap_idle\
    );
\SCSR0_reg[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20FF2020"
    )
        port map (
      I0 => \SCSR0_reg[9]_i_2_n_0\,
      I1 => \SCSR0_reg[9]_i_3_n_0\,
      I2 => \SCSR0_reg[9]_i_4_n_0\,
      I3 => \SCSR0_reg_reg[9]_0\,
      I4 => \SCSR0_reg_reg[9]_1\,
      O => \SCSR0_reg_reg[9]\
    );
\SCSR0_reg[9]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(1),
      O => \SCSR0_reg[9]_i_2_n_0\
    );
\SCSR0_reg[9]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(3),
      O => \SCSR0_reg[9]_i_3_n_0\
    );
\SCSR0_reg[9]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AB"
    )
        port map (
      I0 => s_symbol_to_write(7),
      I1 => s_symbol_to_write(6),
      I2 => s_symbol_to_write(5),
      O => \SCSR0_reg[9]_i_4_n_0\
    );
\_inferred__5/s_lcd_state[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(4),
      I2 => \^q\(3),
      I3 => \^q\(0),
      I4 => \^q\(2),
      O => \_inferred__5/s_lcd_state[0]_i_1_n_0\
    );
\_inferred__5/s_lcd_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(3),
      I2 => \^q\(4),
      I3 => \^q\(0),
      I4 => \^q\(2),
      O => \_inferred__5/s_lcd_state[1]_i_1_n_0\
    );
\_inferred__5/s_lcd_state[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200030"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(4),
      I3 => \^q\(3),
      I4 => \^q\(1),
      O => \_inferred__5/s_lcd_state[2]_i_1_n_0\
    );
\_inferred__5/s_lcd_state[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000000"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(3),
      I2 => \^q\(4),
      I3 => \^q\(0),
      I4 => \^q\(2),
      O => \_inferred__5/s_lcd_state[3]_i_1_n_0\
    );
\_inferred__5/s_lcd_state[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"004000A0"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(4),
      I3 => \^q\(3),
      I4 => \^q\(1),
      O => \_inferred__5/s_lcd_state[4]_i_2_n_0\
    );
\o_db4_7[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_lower_nibble(0),
      I1 => s_send_lower,
      I2 => s_upper_nibble(0),
      O => o_db4_7(0)
    );
\o_db4_7[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_lower_nibble(1),
      I1 => s_send_lower,
      I2 => s_upper_nibble(1),
      O => o_db4_7(1)
    );
\o_db4_7[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_lower_nibble(2),
      I1 => s_send_lower,
      I2 => s_upper_nibble(2),
      O => o_db4_7(2)
    );
\o_db4_7[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_lower_nibble(3),
      I1 => s_send_lower,
      I2 => s_upper_nibble(3),
      O => o_db4_7(3)
    );
s_cursor_blink_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => s_cursor_blink_reg_0,
      Q => \^in24\(0),
      S => \^sr\(0)
    );
s_cursor_on_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => s_cursor_on_reg_0,
      Q => \^in24\(1),
      S => \^sr\(0)
    );
\s_data[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \s_data[0]_i_2_n_0\,
      I1 => \s_data[0]_i_3_n_0\,
      O => \s_data[0]_i_1_n_0\
    );
\s_data[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"40400000FF000000"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^in24\(0),
      I2 => \^q\(0),
      I3 => in25(0),
      I4 => \^q\(4),
      I5 => \^q\(2),
      O => \s_data[0]_i_2_n_0\
    );
\s_data[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B0B0B0B0F0FF0000"
    )
        port map (
      I0 => s_symbol_to_write(0),
      I1 => \^q\(2),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \^q\(3),
      I5 => \^q\(4),
      O => \s_data[0]_i_3_n_0\
    );
\s_data[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAAAAAAAEEAAAAAA"
    )
        port map (
      I0 => \s_data[1]_i_2_n_0\,
      I1 => \^in24\(1),
      I2 => s_symbol_to_write(1),
      I3 => \^q\(4),
      I4 => \^q\(2),
      I5 => \^q\(1),
      O => \s_data[1]_i_1_n_0\
    );
\s_data[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000F00AA00CC00AA"
    )
        port map (
      I0 => \^q\(3),
      I1 => in25(1),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^q\(4),
      I5 => \^q\(2),
      O => \s_data[1]_i_2_n_0\
    );
\s_data[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => s_symbol_to_write(2),
      I1 => \^q\(4),
      I2 => \^q\(2),
      I3 => \^q\(1),
      I4 => \s_data[2]_i_2_n_0\,
      O => \s_data[2]_i_1_n_0\
    );
\s_data[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F000AA00CC00AA"
    )
        port map (
      I0 => \^q\(3),
      I1 => in25(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^q\(4),
      I5 => \^q\(2),
      O => \s_data[2]_i_2_n_0\
    );
\s_data[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EAAAAAAA"
    )
        port map (
      I0 => \s_data[3]_i_2_n_0\,
      I1 => s_symbol_to_write(3),
      I2 => \^q\(4),
      I3 => \^q\(2),
      I4 => \^q\(1),
      O => \s_data[3]_i_1_n_0\
    );
\s_data[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"05F5053F05C5050F"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(2),
      I2 => \^q\(4),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => in25(3),
      O => \s_data[3]_i_2_n_0\
    );
\s_data[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(2),
      I2 => \^q\(4),
      I3 => s_symbol_to_write(4),
      O => \s_data[4]_i_1_n_0\
    );
\s_data[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C5050505"
    )
        port map (
      I0 => \^q\(3),
      I1 => s_symbol_to_write(5),
      I2 => \^q\(4),
      I3 => \^q\(2),
      I4 => \^q\(1),
      O => \s_data[5]_i_1_n_0\
    );
\s_data[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0000C00"
    )
        port map (
      I0 => s_symbol_to_write(6),
      I1 => in25(6),
      I2 => \^q\(1),
      I3 => \^q\(4),
      I4 => \^q\(2),
      O => \s_data[6]_i_1_n_0\
    );
\s_data[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"030730F00F00000C"
    )
        port map (
      I0 => \SCSR0_reg[9]_i_4_n_0\,
      I1 => \^q\(1),
      I2 => \^q\(3),
      I3 => \^q\(0),
      I4 => \^q\(4),
      I5 => \^q\(2),
      O => \s_data[7]_i_1_n_0\
    );
\s_data[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8030"
    )
        port map (
      I0 => s_symbol_to_write(7),
      I1 => \^q\(2),
      I2 => \^q\(4),
      I3 => \^q\(1),
      O => \s_data[7]_i_2_n_0\
    );
\s_data_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_data[7]_i_1_n_0\,
      D => \s_data[0]_i_1_n_0\,
      Q => s_data(0),
      R => \^sr\(0)
    );
\s_data_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_data[7]_i_1_n_0\,
      D => \s_data[1]_i_1_n_0\,
      Q => s_data(1),
      R => \^sr\(0)
    );
\s_data_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_data[7]_i_1_n_0\,
      D => \s_data[2]_i_1_n_0\,
      Q => s_data(2),
      R => \^sr\(0)
    );
\s_data_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_data[7]_i_1_n_0\,
      D => \s_data[3]_i_1_n_0\,
      Q => s_data(3),
      R => \^sr\(0)
    );
\s_data_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_data[7]_i_1_n_0\,
      D => \s_data[4]_i_1_n_0\,
      Q => s_data(4),
      R => \^sr\(0)
    );
\s_data_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_data[7]_i_1_n_0\,
      D => \s_data[5]_i_1_n_0\,
      Q => s_data(5),
      R => \^sr\(0)
    );
\s_data_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_data[7]_i_1_n_0\,
      D => \s_data[6]_i_1_n_0\,
      Q => s_data(6),
      R => \^sr\(0)
    );
\s_data_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_data[7]_i_1_n_0\,
      D => \s_data[7]_i_2_n_0\,
      Q => s_data(7),
      R => \^sr\(0)
    );
\s_ddram_pos_last_written[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => in25(0),
      I1 => \^q\(1),
      O => ns_ddram_pos_last_written0_in(0)
    );
\s_ddram_pos_last_written[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => in25(1),
      I1 => \^q\(1),
      O => ns_ddram_pos_last_written0_in(1)
    );
\s_ddram_pos_last_written[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => in25(2),
      I1 => \^q\(1),
      O => ns_ddram_pos_last_written0_in(2)
    );
\s_ddram_pos_last_written[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => in25(3),
      I1 => \^q\(1),
      O => ns_ddram_pos_last_written0_in(3)
    );
\s_ddram_pos_last_written[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => in25(6),
      I1 => \^q\(1),
      O => ns_ddram_pos_last_written0_in(6)
    );
\s_ddram_pos_last_written[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00090000"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \s_ddram_pos_last_written[7]_i_1_n_0\
    );
\s_ddram_pos_last_written[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(2),
      I2 => \^q\(1),
      O => \^d\(0)
    );
\s_ddram_pos_last_written_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_ddram_pos_last_written[7]_i_1_n_0\,
      D => ns_ddram_pos_last_written0_in(0),
      Q => \s_ddram_pos_last_written_reg[7]_0\(0),
      S => \^sr\(0)
    );
\s_ddram_pos_last_written_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_ddram_pos_last_written[7]_i_1_n_0\,
      D => ns_ddram_pos_last_written0_in(1),
      Q => \s_ddram_pos_last_written_reg[7]_0\(1),
      S => \^sr\(0)
    );
\s_ddram_pos_last_written_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_ddram_pos_last_written[7]_i_1_n_0\,
      D => ns_ddram_pos_last_written0_in(2),
      Q => \s_ddram_pos_last_written_reg[7]_0\(2),
      S => \^sr\(0)
    );
\s_ddram_pos_last_written_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_ddram_pos_last_written[7]_i_1_n_0\,
      D => ns_ddram_pos_last_written0_in(3),
      Q => \s_ddram_pos_last_written_reg[7]_0\(3),
      S => \^sr\(0)
    );
\s_ddram_pos_last_written_reg[6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_ddram_pos_last_written[7]_i_1_n_0\,
      D => ns_ddram_pos_last_written0_in(6),
      Q => \s_ddram_pos_last_written_reg[7]_0\(4),
      S => \^sr\(0)
    );
\s_ddram_pos_last_written_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_ddram_pos_last_written[7]_i_1_n_0\,
      D => \^d\(0),
      Q => \s_ddram_pos_last_written_reg[7]_0\(5),
      S => \^sr\(0)
    );
s_executing_command_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(2),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(4),
      O => s_executing_command_i_4_n_0
    );
s_executing_command_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => in25(2),
      I1 => in25(0),
      I2 => in25(1),
      I3 => in25(3),
      O => s_executing_command_i_5_n_0
    );
s_executing_command_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => timing_controller_inst_n_5,
      Q => \^s_executing_command_reg_0\,
      R => \^sr\(0)
    );
s_function_set_twice_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000040"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(3),
      I2 => \^q\(0),
      I3 => s_function_set_twice_i_2_n_0,
      I4 => s_send_lower,
      I5 => s_function_set_twice,
      O => s_function_set_twice_i_1_n_0
    );
s_function_set_twice_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(4),
      O => s_function_set_twice_i_2_n_0
    );
s_function_set_twice_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => s_function_set_twice_i_1_n_0,
      Q => s_function_set_twice,
      R => \^sr\(0)
    );
s_lcd_initialized_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF20000000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(4),
      I2 => \^q\(3),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => \^w_lcd_initialized\,
      O => s_lcd_initialized_i_1_n_0
    );
s_lcd_initialized_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => s_lcd_initialized_i_1_n_0,
      Q => \^w_lcd_initialized\,
      R => \^sr\(0)
    );
\s_lcd_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => timing_controller_inst_n_2,
      D => \_inferred__5/s_lcd_state[0]_i_1_n_0\,
      Q => \s_lcd_state_reg[4]_0\(0),
      R => \^sr\(0)
    );
\s_lcd_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => timing_controller_inst_n_2,
      D => \_inferred__5/s_lcd_state[1]_i_1_n_0\,
      Q => \s_lcd_state_reg[4]_0\(1),
      R => \^sr\(0)
    );
\s_lcd_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => timing_controller_inst_n_2,
      D => \_inferred__5/s_lcd_state[2]_i_1_n_0\,
      Q => \s_lcd_state_reg[4]_0\(2),
      R => \^sr\(0)
    );
\s_lcd_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => timing_controller_inst_n_2,
      D => \_inferred__5/s_lcd_state[3]_i_1_n_0\,
      Q => \s_lcd_state_reg[4]_0\(3),
      R => \^sr\(0)
    );
\s_lcd_state_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => timing_controller_inst_n_2,
      D => \_inferred__5/s_lcd_state[4]_i_2_n_0\,
      Q => \s_lcd_state_reg[4]_0\(4),
      R => \^sr\(0)
    );
\s_lower_nibble[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(4),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^q\(3),
      O => \s_lower_nibble[3]_i_1_n_0\
    );
\s_lower_nibble_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_lower_nibble[3]_i_1_n_0\,
      D => s_data(0),
      Q => s_lower_nibble(0),
      R => \^sr\(0)
    );
\s_lower_nibble_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_lower_nibble[3]_i_1_n_0\,
      D => s_data(1),
      Q => s_lower_nibble(1),
      R => \^sr\(0)
    );
\s_lower_nibble_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_lower_nibble[3]_i_1_n_0\,
      D => s_data(2),
      Q => s_lower_nibble(2),
      R => \^sr\(0)
    );
\s_lower_nibble_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_lower_nibble[3]_i_1_n_0\,
      D => s_data(3),
      Q => s_lower_nibble(3),
      R => \^sr\(0)
    );
\s_next_ddram_pos[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(2),
      I2 => in25(0),
      O => ns_next_ddram_pos(0)
    );
\s_next_ddram_pos[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0110"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => in25(0),
      I3 => in25(1),
      O => ns_next_ddram_pos(1)
    );
\s_next_ddram_pos[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01111000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => in25(1),
      I3 => in25(0),
      I4 => in25(2),
      O => ns_next_ddram_pos(2)
    );
\s_next_ddram_pos[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAA8000"
    )
        port map (
      I0 => \s_next_ddram_pos[6]_i_3_n_0\,
      I1 => in25(2),
      I2 => in25(0),
      I3 => in25(1),
      I4 => in25(3),
      O => ns_next_ddram_pos(3)
    );
\s_next_ddram_pos[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000300"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(3),
      I3 => \^q\(4),
      I4 => \^q\(1),
      O => \s_next_ddram_pos[6]_i_1_n_0\
    );
\s_next_ddram_pos[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF000080000000"
    )
        port map (
      I0 => in25(2),
      I1 => in25(0),
      I2 => in25(1),
      I3 => in25(3),
      I4 => \s_next_ddram_pos[6]_i_3_n_0\,
      I5 => in25(6),
      O => ns_next_ddram_pos(6)
    );
\s_next_ddram_pos[6]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(2),
      I2 => \^q\(1),
      O => \s_next_ddram_pos[6]_i_3_n_0\
    );
\s_next_ddram_pos_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_next_ddram_pos[6]_i_1_n_0\,
      D => ns_next_ddram_pos(0),
      Q => in25(0),
      R => \^sr\(0)
    );
\s_next_ddram_pos_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_next_ddram_pos[6]_i_1_n_0\,
      D => ns_next_ddram_pos(1),
      Q => in25(1),
      R => \^sr\(0)
    );
\s_next_ddram_pos_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_next_ddram_pos[6]_i_1_n_0\,
      D => ns_next_ddram_pos(2),
      Q => in25(2),
      R => \^sr\(0)
    );
\s_next_ddram_pos_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_next_ddram_pos[6]_i_1_n_0\,
      D => ns_next_ddram_pos(3),
      Q => in25(3),
      R => \^sr\(0)
    );
\s_next_ddram_pos_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_next_ddram_pos[6]_i_1_n_0\,
      D => ns_next_ddram_pos(6),
      Q => in25(6),
      R => \^sr\(0)
    );
s_read_write_enable_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FDFFFFFE00000200"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(3),
      I2 => \^q\(4),
      I3 => \^q\(2),
      I4 => \^q\(1),
      I5 => \^o_read_write_enable\,
      O => s_read_write_enable_i_1_n_0
    );
s_read_write_enable_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => s_read_write_enable_i_1_n_0,
      Q => \^o_read_write_enable\,
      S => \^sr\(0)
    );
s_register_select_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001110"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(0),
      I2 => s_symbol_to_write(5),
      I3 => s_symbol_to_write(6),
      I4 => s_symbol_to_write(7),
      O => ns_writing_data
    );
s_register_select_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1400040114004401"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(2),
      I2 => \^q\(1),
      I3 => \^q\(4),
      I4 => \^q\(0),
      I5 => \SCSR0_reg[9]_i_4_n_0\,
      O => s_register_select_i_4_n_0
    );
s_register_select_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFFBFFFFBEF"
    )
        port map (
      I0 => s_register_select_i_7_n_0,
      I1 => s_data(2),
      I2 => s_data(0),
      I3 => s_data(1),
      I4 => s_data(3),
      I5 => s_data(5),
      O => s_register_select_i_6_n_0
    );
s_register_select_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => s_data(4),
      I1 => s_data(6),
      I2 => s_data(7),
      I3 => \^w_lcd_initialized\,
      O => s_register_select_i_7_n_0
    );
s_register_select_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => timing_controller_inst_n_6,
      Q => \^o_register_select\,
      S => \^sr\(0)
    );
s_send_lower_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0F40"
    )
        port map (
      I0 => \^q\(4),
      I1 => s_function_set_twice,
      I2 => s_send_lower_i_2_n_0,
      I3 => s_send_lower,
      O => s_send_lower_i_1_n_0
    );
s_send_lower_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000030400300C0F0"
    )
        port map (
      I0 => \SCSR0_reg[9]_i_4_n_0\,
      I1 => \^q\(2),
      I2 => \^q\(4),
      I3 => \^q\(0),
      I4 => \^q\(3),
      I5 => \^q\(1),
      O => s_send_lower_i_2_n_0
    );
s_send_lower_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => s_send_lower_i_1_n_0,
      Q => s_send_lower,
      R => \^sr\(0)
    );
\s_symbol_to_write_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => E(0),
      D => \s_symbol_to_write_reg[7]_0\(0),
      Q => s_symbol_to_write(0),
      S => \^sr\(0)
    );
\s_symbol_to_write_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => E(0),
      D => \s_symbol_to_write_reg[7]_0\(1),
      Q => s_symbol_to_write(1),
      S => \^sr\(0)
    );
\s_symbol_to_write_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => E(0),
      D => \s_symbol_to_write_reg[7]_0\(2),
      Q => s_symbol_to_write(2),
      S => \^sr\(0)
    );
\s_symbol_to_write_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => E(0),
      D => \s_symbol_to_write_reg[7]_0\(3),
      Q => s_symbol_to_write(3),
      S => \^sr\(0)
    );
\s_symbol_to_write_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => E(0),
      D => \s_symbol_to_write_reg[7]_0\(4),
      Q => s_symbol_to_write(4),
      S => \^sr\(0)
    );
\s_symbol_to_write_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => E(0),
      D => \s_symbol_to_write_reg[7]_0\(5),
      Q => s_symbol_to_write(5),
      S => \^sr\(0)
    );
\s_symbol_to_write_reg[6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => E(0),
      D => \s_symbol_to_write_reg[7]_0\(6),
      Q => s_symbol_to_write(6),
      S => \^sr\(0)
    );
\s_symbol_to_write_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => E(0),
      D => \s_symbol_to_write_reg[7]_0\(7),
      Q => s_symbol_to_write(7),
      S => \^sr\(0)
    );
\s_upper_nibble_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_lower_nibble[3]_i_1_n_0\,
      D => s_data(4),
      Q => s_upper_nibble(0),
      R => \^sr\(0)
    );
\s_upper_nibble_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_lower_nibble[3]_i_1_n_0\,
      D => s_data(5),
      Q => s_upper_nibble(1),
      R => \^sr\(0)
    );
\s_upper_nibble_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_lower_nibble[3]_i_1_n_0\,
      D => s_data(6),
      Q => s_upper_nibble(2),
      R => \^sr\(0)
    );
\s_upper_nibble_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \s_lower_nibble[3]_i_1_n_0\,
      D => s_data(7),
      Q => s_upper_nibble(3),
      R => \^sr\(0)
    );
s_writing_data_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => timing_controller_inst_n_4,
      Q => s_writing_data,
      R => \^sr\(0)
    );
timing_controller_inst: entity work.mbblockdesign_ad_0_0_timing_controller
     port map (
      DCR_reg(0) => DCR_reg(0),
      \DCR_reg_reg[4]\ => \GCSR_reg[0]_i_6_n_0\,
      \DCR_reg_reg[4]_0\ => \GCSR_reg[0]_i_7_n_0\,
      \DCR_reg_reg[4]_1\ => s_register_select_i_7_n_0,
      E(0) => timing_controller_inst_n_2,
      \FSM_sequential_state_reg[0]\ => \FSM_sequential_state_reg[0]_0\,
      \FSM_sequential_state_reg[0]_0\ => \FSM_sequential_state_reg[0]_1\,
      \FSM_sequential_state_reg[0]_1\ => \FSM_sequential_state[4]_i_3_n_0\,
      \FSM_sequential_state_reg[0]_2\ => \FSM_sequential_state_reg[0]_2\,
      \FSM_sequential_state_reg[0]_3\ => \FSM_sequential_state[4]_i_5_n_0\,
      \FSM_sequential_state_reg[1]\(0) => timing_controller_inst_n_3,
      \FSM_sequential_state_reg[1]_0\ => timing_controller_inst_n_6,
      \GCSR_reg__0\(0) => \GCSR_reg__0\(0),
      \GCSR_reg_reg[0]\ => \GCSR_reg[0]_i_4_n_0\,
      \GCSR_reg_reg[1]\ => \GCSR_reg_reg[1]\,
      \GCSR_reg_reg[1]_0\ => \GCSR_reg[1]_i_2_n_0\,
      \GCSR_reg_reg[1]_1\ => \GCSR_reg_reg[1]_0\,
      \GCSR_reg_reg[1]_2\(0) => \GCSR_reg_reg[1]_1\(0),
      \GCSR_reg_reg[1]_3\ => s_function_set_twice_i_2_n_0,
      Q(4 downto 0) => \^q\(4 downto 0),
      SS(0) => \^sr\(0),
      \delay_time_reg[17]_0\(7 downto 0) => s_data(7 downto 0),
      ns_executing_command => ns_executing_command,
      ns_writing_data => ns_writing_data,
      o_register_select => \^o_register_select\,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      s_executing_command_reg => timing_controller_inst_n_5,
      s_executing_command_reg_0 => \^s_executing_command_reg_0\,
      s_executing_command_reg_1 => s_executing_command_reg_1,
      s_executing_command_reg_2 => s_executing_command_i_4_n_0,
      s_executing_command_reg_3 => s_executing_command_i_5_n_0,
      \s_lcd_state_reg[0]\ => \SCSR0_reg[9]_i_3_n_0\,
      \s_lcd_state_reg[0]_0\(2 downto 0) => s_symbol_to_write(7 downto 5),
      s_register_select_reg => s_register_select_i_4_n_0,
      s_send_lower => s_send_lower,
      s_writing_data => s_writing_data,
      s_writing_data_reg => timing_controller_inst_n_4,
      s_writing_data_reg_0 => s_register_select_i_6_n_0,
      s_writing_data_reg_1 => \SCSR0_reg[9]_i_2_n_0\,
      w_ap_start => w_ap_start,
      w_cursor_apply => w_cursor_apply
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mbblockdesign_ad_0_0_ad_core is
  port (
    SS : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_executing_command : out STD_LOGIC;
    in24 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    w_lcd_initialized : out STD_LOGIC;
    o_register_select : out STD_LOGIC;
    o_read_write_enable : out STD_LOGIC;
    \SCSR0_reg_reg[9]\ : out STD_LOGIC;
    \GCSR_reg_reg[1]\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 4 downto 0 );
    w_ap_idle : out STD_LOGIC;
    \FSM_sequential_state_reg[2]\ : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    o_db4_7 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \FSM_sequential_state_reg[0]\ : out STD_LOGIC;
    \FSM_sequential_state_reg[0]_0\ : out STD_LOGIC;
    \s_lcd_state_reg[4]\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \s_ddram_pos_last_written_reg[7]\ : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    s_cursor_blink_reg : in STD_LOGIC;
    s_cursor_on_reg : in STD_LOGIC;
    \SCSR0_reg_reg[9]_0\ : in STD_LOGIC;
    \SCSR0_reg_reg[9]_1\ : in STD_LOGIC;
    \GCSR_reg_reg[1]_0\ : in STD_LOGIC;
    \GCSR_reg_reg[1]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_state_reg[0]_1\ : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    \FSM_sequential_state_reg[1]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_state_reg[1]_0\ : in STD_LOGIC;
    \FSM_sequential_state_reg[0]_2\ : in STD_LOGIC;
    ns_executing_command : in STD_LOGIC;
    s_executing_command_reg : in STD_LOGIC;
    \GCSR_reg__0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    w_ap_start : in STD_LOGIC;
    DCR_reg : in STD_LOGIC_VECTOR ( 0 to 0 );
    w_cursor_apply : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    \s_symbol_to_write_reg[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of mbblockdesign_ad_0_0_ad_core : entity is "ad_core";
end mbblockdesign_ad_0_0_ad_core;

architecture STRUCTURE of mbblockdesign_ad_0_0_ad_core is
begin
lcd_controller_inst: entity work.mbblockdesign_ad_0_0_lcd_controller
     port map (
      D(0) => D(0),
      DCR_reg(0) => DCR_reg(0),
      E(0) => E(0),
      \FSM_sequential_state_reg[0]_0\ => \FSM_sequential_state_reg[0]\,
      \FSM_sequential_state_reg[0]_1\ => \FSM_sequential_state_reg[0]_0\,
      \FSM_sequential_state_reg[0]_2\ => \FSM_sequential_state_reg[0]_1\,
      \FSM_sequential_state_reg[0]_3\ => \FSM_sequential_state_reg[0]_2\,
      \FSM_sequential_state_reg[1]_0\(0) => \FSM_sequential_state_reg[1]\(0),
      \FSM_sequential_state_reg[1]_1\ => \FSM_sequential_state_reg[1]_0\,
      \FSM_sequential_state_reg[2]_0\ => \FSM_sequential_state_reg[2]\,
      \GCSR_reg__0\(0) => \GCSR_reg__0\(0),
      \GCSR_reg_reg[1]\ => \GCSR_reg_reg[1]\,
      \GCSR_reg_reg[1]_0\ => \GCSR_reg_reg[1]_0\,
      \GCSR_reg_reg[1]_1\(0) => \GCSR_reg_reg[1]_1\(0),
      Q(4 downto 0) => Q(4 downto 0),
      \SCSR0_reg_reg[9]\ => \SCSR0_reg_reg[9]\,
      \SCSR0_reg_reg[9]_0\ => \SCSR0_reg_reg[9]_0\,
      \SCSR0_reg_reg[9]_1\ => \SCSR0_reg_reg[9]_1\,
      SR(0) => SS(0),
      in24(1 downto 0) => in24(1 downto 0),
      ns_executing_command => ns_executing_command,
      o_db4_7(3 downto 0) => o_db4_7(3 downto 0),
      o_read_write_enable => o_read_write_enable,
      o_register_select => o_register_select,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      s_cursor_blink_reg_0 => s_cursor_blink_reg,
      s_cursor_on_reg_0 => s_cursor_on_reg,
      \s_ddram_pos_last_written_reg[7]_0\(5 downto 0) => \s_ddram_pos_last_written_reg[7]\(5 downto 0),
      s_executing_command_reg_0 => s_executing_command,
      s_executing_command_reg_1 => s_executing_command_reg,
      \s_lcd_state_reg[4]_0\(4 downto 0) => \s_lcd_state_reg[4]\(4 downto 0),
      \s_symbol_to_write_reg[7]_0\(7 downto 0) => \s_symbol_to_write_reg[7]\(7 downto 0),
      w_ap_idle => w_ap_idle,
      w_ap_start => w_ap_start,
      w_cursor_apply => w_cursor_apply,
      w_lcd_initialized => w_lcd_initialized
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mbblockdesign_ad_0_0_ad is
  port (
    o_db4_7 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_register_select : out STD_LOGIC;
    o_read_write : out STD_LOGIC;
    o_read_write_enable : out STD_LOGIC;
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
  attribute C_S00_AXI_ADDR_WIDTH : integer;
  attribute C_S00_AXI_ADDR_WIDTH of mbblockdesign_ad_0_0_ad : entity is 6;
  attribute C_S00_AXI_DATA_WIDTH : integer;
  attribute C_S00_AXI_DATA_WIDTH of mbblockdesign_ad_0_0_ad : entity is 32;
  attribute G_AXI_AD_T_16_4MS : integer;
  attribute G_AXI_AD_T_16_4MS of mbblockdesign_ad_0_0_ad : entity is 164000;
  attribute G_AXI_AD_T_40_US : integer;
  attribute G_AXI_AD_T_40_US of mbblockdesign_ad_0_0_ad : entity is 4000;
  attribute G_AXI_AD_T_H : integer;
  attribute G_AXI_AD_T_H of mbblockdesign_ad_0_0_ad : entity is 3;
  attribute G_AXI_AD_T_LOWER_UPPER_WAIT : integer;
  attribute G_AXI_AD_T_LOWER_UPPER_WAIT of mbblockdesign_ad_0_0_ad : entity is 150;
  attribute G_AXI_AD_T_POWER_ON : integer;
  attribute G_AXI_AD_T_POWER_ON of mbblockdesign_ad_0_0_ad : entity is 3000000;
  attribute G_AXI_AD_T_SU : integer;
  attribute G_AXI_AD_T_SU of mbblockdesign_ad_0_0_ad : entity is 6;
  attribute G_AXI_AD_T_W : integer;
  attribute G_AXI_AD_T_W of mbblockdesign_ad_0_0_ad : entity is 45;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of mbblockdesign_ad_0_0_ad : entity is "ad";
end mbblockdesign_ad_0_0_ad;

architecture STRUCTURE of mbblockdesign_ad_0_0_ad is
  signal \<const0>\ : STD_LOGIC;
  signal DCR_reg : STD_LOGIC_VECTOR ( 4 to 4 );
  signal GCSR_reg : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \GCSR_reg__0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ad_S00_AXI_inst_n_0 : STD_LOGIC;
  signal ad_S00_AXI_inst_n_11 : STD_LOGIC;
  signal ad_S00_AXI_inst_n_12 : STD_LOGIC;
  signal ad_S00_AXI_inst_n_13 : STD_LOGIC;
  signal ad_S00_AXI_inst_n_16 : STD_LOGIC;
  signal ad_S00_AXI_inst_n_25 : STD_LOGIC;
  signal ad_S00_AXI_inst_n_26 : STD_LOGIC;
  signal ad_S00_AXI_inst_n_27 : STD_LOGIC;
  signal ad_S00_AXI_inst_n_28 : STD_LOGIC;
  signal ad_S00_AXI_inst_n_29 : STD_LOGIC;
  signal ad_core_inst_n_15 : STD_LOGIC;
  signal ad_core_inst_n_21 : STD_LOGIC;
  signal ad_core_inst_n_22 : STD_LOGIC;
  signal ad_core_inst_n_7 : STD_LOGIC;
  signal ad_core_inst_n_8 : STD_LOGIC;
  signal i_reset : STD_LOGIC;
  signal in24 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \lcd_controller_inst/ns_executing_command\ : STD_LOGIC;
  signal \lcd_controller_inst/s_executing_command\ : STD_LOGIC;
  signal \lcd_controller_inst/state\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal ns_ddram_pos_last_written0_in : STD_LOGIC_VECTOR ( 4 to 4 );
  signal \^s00_axi_rdata\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal w_ap_idle : STD_LOGIC;
  signal w_ap_start : STD_LOGIC;
  signal w_clear_display : STD_LOGIC;
  signal w_cursor_apply : STD_LOGIC;
  signal w_ddram_pos_last_written : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal w_lcd_initialized : STD_LOGIC;
  signal w_lcd_state : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal w_symbol_to_write : STD_LOGIC_VECTOR ( 7 downto 0 );
begin
  o_interrupt <= \<const0>\;
  o_read_write <= \<const0>\;
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rdata(31) <= \^s00_axi_rdata\(31);
  s00_axi_rdata(30) <= \<const0>\;
  s00_axi_rdata(29) <= \<const0>\;
  s00_axi_rdata(28) <= \<const0>\;
  s00_axi_rdata(27) <= \<const0>\;
  s00_axi_rdata(26) <= \<const0>\;
  s00_axi_rdata(25) <= \<const0>\;
  s00_axi_rdata(24) <= \<const0>\;
  s00_axi_rdata(23) <= \<const0>\;
  s00_axi_rdata(22) <= \<const0>\;
  s00_axi_rdata(21) <= \<const0>\;
  s00_axi_rdata(20) <= \<const0>\;
  s00_axi_rdata(19) <= \<const0>\;
  s00_axi_rdata(18) <= \<const0>\;
  s00_axi_rdata(17) <= \<const0>\;
  s00_axi_rdata(16) <= \^s00_axi_rdata\(16);
  s00_axi_rdata(15) <= \<const0>\;
  s00_axi_rdata(14) <= \<const0>\;
  s00_axi_rdata(13) <= \<const0>\;
  s00_axi_rdata(12) <= \^s00_axi_rdata\(12);
  s00_axi_rdata(11) <= \<const0>\;
  s00_axi_rdata(10) <= \^s00_axi_rdata\(8);
  s00_axi_rdata(9 downto 0) <= \^s00_axi_rdata\(9 downto 0);
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
ad_S00_AXI_inst: entity work.mbblockdesign_ad_0_0_ad_S00_AXI
     port map (
      \CCR_reg_reg[7]_0\(5 downto 4) => w_ddram_pos_last_written(7 downto 6),
      \CCR_reg_reg[7]_0\(3 downto 0) => w_ddram_pos_last_written(3 downto 0),
      \CDR_reg_reg[7]_0\(7 downto 0) => w_symbol_to_write(7 downto 0),
      D(0) => ns_ddram_pos_last_written0_in(4),
      DCR_reg(0) => DCR_reg(4),
      \DCR_reg_reg[0]_0\(0) => w_clear_display,
      \DCR_reg_reg[1]_0\ => ad_S00_AXI_inst_n_16,
      \DCR_reg_reg[1]_1\ => ad_S00_AXI_inst_n_27,
      \DCR_reg_reg[2]_0\ => ad_S00_AXI_inst_n_28,
      \DCR_reg_reg[3]_0\ => ad_S00_AXI_inst_n_29,
      \DCR_reg_reg[4]_0\ => ad_core_inst_n_22,
      E(0) => ad_S00_AXI_inst_n_11,
      \GCSR_reg__0\(0) => \GCSR_reg__0\(0),
      \GCSR_reg_reg[0]_0\ => ad_S00_AXI_inst_n_12,
      \GCSR_reg_reg[0]_1\ => ad_S00_AXI_inst_n_13,
      \GCSR_reg_reg[0]_2\ => ad_core_inst_n_21,
      \GCSR_reg_reg[1]_0\(0) => GCSR_reg(1),
      \GCSR_reg_reg[1]_1\ => ad_core_inst_n_8,
      Q(4 downto 0) => w_lcd_state(4 downto 0),
      \SCSR0_reg_reg[9]_0\ => ad_S00_AXI_inst_n_0,
      \SCSR0_reg_reg[9]_1\ => ad_core_inst_n_7,
      SR(0) => i_reset,
      axi_arready_reg_0 => s00_axi_arready,
      axi_arready_reg_1 => ad_S00_AXI_inst_n_25,
      axi_awready_reg_0 => s00_axi_awready,
      axi_wready_reg_0 => s00_axi_wready,
      in24(1 downto 0) => in24(1 downto 0),
      ns_executing_command => \lcd_controller_inst/ns_executing_command\,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(3 downto 0) => s00_axi_araddr(5 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_aresetn_0 => ad_S00_AXI_inst_n_26,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(3 downto 0) => s00_axi_awaddr(5 downto 2),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(12) => \^s00_axi_rdata\(31),
      s00_axi_rdata(11) => \^s00_axi_rdata\(16),
      s00_axi_rdata(10) => \^s00_axi_rdata\(12),
      s00_axi_rdata(9) => \^s00_axi_rdata\(8),
      s00_axi_rdata(8) => \^s00_axi_rdata\(9),
      s00_axi_rdata(7 downto 0) => \^s00_axi_rdata\(7 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(8) => s00_axi_wdata(16),
      s00_axi_wdata(7 downto 0) => s00_axi_wdata(7 downto 0),
      s00_axi_wstrb(1) => s00_axi_wstrb(2),
      s00_axi_wstrb(0) => s00_axi_wstrb(0),
      s00_axi_wvalid => s00_axi_wvalid,
      s_executing_command => \lcd_controller_inst/s_executing_command\,
      s_executing_command_reg => ad_core_inst_n_15,
      \s_symbol_to_write_reg[0]\(4 downto 0) => \lcd_controller_inst/state\(4 downto 0),
      w_ap_idle => w_ap_idle,
      w_ap_start => w_ap_start,
      w_cursor_apply => w_cursor_apply,
      w_lcd_initialized => w_lcd_initialized
    );
ad_core_inst: entity work.mbblockdesign_ad_0_0_ad_core
     port map (
      D(0) => ns_ddram_pos_last_written0_in(4),
      DCR_reg(0) => DCR_reg(4),
      E(0) => ad_S00_AXI_inst_n_11,
      \FSM_sequential_state_reg[0]\ => ad_core_inst_n_21,
      \FSM_sequential_state_reg[0]_0\ => ad_core_inst_n_22,
      \FSM_sequential_state_reg[0]_1\ => ad_S00_AXI_inst_n_13,
      \FSM_sequential_state_reg[0]_2\ => ad_S00_AXI_inst_n_27,
      \FSM_sequential_state_reg[1]\(0) => w_clear_display,
      \FSM_sequential_state_reg[1]_0\ => ad_S00_AXI_inst_n_16,
      \FSM_sequential_state_reg[2]\ => ad_core_inst_n_15,
      \GCSR_reg__0\(0) => \GCSR_reg__0\(0),
      \GCSR_reg_reg[1]\ => ad_core_inst_n_8,
      \GCSR_reg_reg[1]_0\ => ad_S00_AXI_inst_n_26,
      \GCSR_reg_reg[1]_1\(0) => GCSR_reg(1),
      Q(4 downto 0) => \lcd_controller_inst/state\(4 downto 0),
      \SCSR0_reg_reg[9]\ => ad_core_inst_n_7,
      \SCSR0_reg_reg[9]_0\ => ad_S00_AXI_inst_n_25,
      \SCSR0_reg_reg[9]_1\ => ad_S00_AXI_inst_n_0,
      SS(0) => i_reset,
      in24(1 downto 0) => in24(1 downto 0),
      ns_executing_command => \lcd_controller_inst/ns_executing_command\,
      o_db4_7(3 downto 0) => o_db4_7(3 downto 0),
      o_read_write_enable => o_read_write_enable,
      o_register_select => o_register_select,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      s_cursor_blink_reg => ad_S00_AXI_inst_n_29,
      s_cursor_on_reg => ad_S00_AXI_inst_n_28,
      \s_ddram_pos_last_written_reg[7]\(5 downto 4) => w_ddram_pos_last_written(7 downto 6),
      \s_ddram_pos_last_written_reg[7]\(3 downto 0) => w_ddram_pos_last_written(3 downto 0),
      s_executing_command => \lcd_controller_inst/s_executing_command\,
      s_executing_command_reg => ad_S00_AXI_inst_n_12,
      \s_lcd_state_reg[4]\(4 downto 0) => w_lcd_state(4 downto 0),
      \s_symbol_to_write_reg[7]\(7 downto 0) => w_symbol_to_write(7 downto 0),
      w_ap_idle => w_ap_idle,
      w_ap_start => w_ap_start,
      w_cursor_apply => w_cursor_apply,
      w_lcd_initialized => w_lcd_initialized
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mbblockdesign_ad_0_0 is
  port (
    o_db4_7 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_register_select : out STD_LOGIC;
    o_read_write : out STD_LOGIC;
    o_read_write_enable : out STD_LOGIC;
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
  attribute NotValidForBitStream of mbblockdesign_ad_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of mbblockdesign_ad_0_0 : entity is "mbblockdesign_ad_0_0,ad,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of mbblockdesign_ad_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of mbblockdesign_ad_0_0 : entity is "package_project";
  attribute x_core_info : string;
  attribute x_core_info of mbblockdesign_ad_0_0 : entity is "ad,Vivado 2023.2";
end mbblockdesign_ad_0_0;

architecture STRUCTURE of mbblockdesign_ad_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^s00_axi_rdata\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_o_interrupt_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_o_read_write_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s00_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s00_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 30 downto 11 );
  signal NLW_U0_s00_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute C_S00_AXI_ADDR_WIDTH : integer;
  attribute C_S00_AXI_ADDR_WIDTH of U0 : label is 6;
  attribute C_S00_AXI_DATA_WIDTH : integer;
  attribute C_S00_AXI_DATA_WIDTH of U0 : label is 32;
  attribute G_AXI_AD_T_16_4MS : integer;
  attribute G_AXI_AD_T_16_4MS of U0 : label is 164000;
  attribute G_AXI_AD_T_40_US : integer;
  attribute G_AXI_AD_T_40_US of U0 : label is 4000;
  attribute G_AXI_AD_T_H : integer;
  attribute G_AXI_AD_T_H of U0 : label is 3;
  attribute G_AXI_AD_T_LOWER_UPPER_WAIT : integer;
  attribute G_AXI_AD_T_LOWER_UPPER_WAIT of U0 : label is 150;
  attribute G_AXI_AD_T_POWER_ON : integer;
  attribute G_AXI_AD_T_POWER_ON of U0 : label is 3000000;
  attribute G_AXI_AD_T_SU : integer;
  attribute G_AXI_AD_T_SU of U0 : label is 6;
  attribute G_AXI_AD_T_W : integer;
  attribute G_AXI_AD_T_W of U0 : label is 45;
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
  o_read_write <= \<const0>\;
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rdata(31) <= \^s00_axi_rdata\(31);
  s00_axi_rdata(30) <= \<const0>\;
  s00_axi_rdata(29) <= \<const0>\;
  s00_axi_rdata(28) <= \<const0>\;
  s00_axi_rdata(27) <= \<const0>\;
  s00_axi_rdata(26) <= \<const0>\;
  s00_axi_rdata(25) <= \<const0>\;
  s00_axi_rdata(24) <= \<const0>\;
  s00_axi_rdata(23) <= \<const0>\;
  s00_axi_rdata(22) <= \<const0>\;
  s00_axi_rdata(21) <= \<const0>\;
  s00_axi_rdata(20) <= \<const0>\;
  s00_axi_rdata(19) <= \<const0>\;
  s00_axi_rdata(18) <= \<const0>\;
  s00_axi_rdata(17) <= \<const0>\;
  s00_axi_rdata(16) <= \^s00_axi_rdata\(16);
  s00_axi_rdata(15) <= \<const0>\;
  s00_axi_rdata(14) <= \<const0>\;
  s00_axi_rdata(13) <= \<const0>\;
  s00_axi_rdata(12) <= \^s00_axi_rdata\(12);
  s00_axi_rdata(11) <= \<const0>\;
  s00_axi_rdata(10 downto 0) <= \^s00_axi_rdata\(10 downto 0);
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.mbblockdesign_ad_0_0_ad
     port map (
      o_db4_7(3 downto 0) => o_db4_7(3 downto 0),
      o_interrupt => NLW_U0_o_interrupt_UNCONNECTED,
      o_read_write => NLW_U0_o_read_write_UNCONNECTED,
      o_read_write_enable => o_read_write_enable,
      o_register_select => o_register_select,
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
      s00_axi_rdata(31) => \^s00_axi_rdata\(31),
      s00_axi_rdata(30 downto 17) => NLW_U0_s00_axi_rdata_UNCONNECTED(30 downto 17),
      s00_axi_rdata(16) => \^s00_axi_rdata\(16),
      s00_axi_rdata(15 downto 13) => NLW_U0_s00_axi_rdata_UNCONNECTED(15 downto 13),
      s00_axi_rdata(12) => \^s00_axi_rdata\(12),
      s00_axi_rdata(11) => NLW_U0_s00_axi_rdata_UNCONNECTED(11),
      s00_axi_rdata(10 downto 0) => \^s00_axi_rdata\(10 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rresp(1 downto 0) => NLW_U0_s00_axi_rresp_UNCONNECTED(1 downto 0),
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 17) => B"000000000000000",
      s00_axi_wdata(16) => s00_axi_wdata(16),
      s00_axi_wdata(15 downto 8) => B"00000000",
      s00_axi_wdata(7 downto 0) => s00_axi_wdata(7 downto 0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wstrb(3) => '0',
      s00_axi_wstrb(2) => s00_axi_wstrb(2),
      s00_axi_wstrb(1) => '0',
      s00_axi_wstrb(0) => s00_axi_wstrb(0),
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;
