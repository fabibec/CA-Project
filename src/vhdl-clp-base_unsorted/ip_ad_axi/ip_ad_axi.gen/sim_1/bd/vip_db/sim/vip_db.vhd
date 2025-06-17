--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
--Date        : Fri Jul 12 08:06:26 2024
--Host        : xuser-pc running 64-bit Ubuntu 22.04.3 LTS
--Command     : generate_target vip_db.bd
--Design      : vip_db
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity vip_db is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    interrupt_0 : out STD_LOGIC;
    o_t0_out : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of vip_db : entity is "vip_db,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=vip_db,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=1,da_clkrst_cnt=1,synth_mode=None}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of vip_db : entity is "vip_db.hwdef";
end vip_db;

architecture STRUCTURE of vip_db is
  component vip_db_axi_vip_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component vip_db_axi_vip_0_0;
  component vip_db_at_0_2 is
  port (
    o_t0_out : out STD_LOGIC;
    interrupt : out STD_LOGIC;
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
  end component vip_db_at_0_2;
  signal aclk_0_1 : STD_LOGIC;
  signal aresetn_0_1 : STD_LOGIC;
  signal at_0_interrupt : STD_LOGIC;
  signal at_0_o_t0_out : STD_LOGIC;
  signal axi_vip_0_M_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_vip_0_M_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_vip_0_M_AXI_ARREADY : STD_LOGIC;
  signal axi_vip_0_M_AXI_ARVALID : STD_LOGIC;
  signal axi_vip_0_M_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_vip_0_M_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_vip_0_M_AXI_AWREADY : STD_LOGIC;
  signal axi_vip_0_M_AXI_AWVALID : STD_LOGIC;
  signal axi_vip_0_M_AXI_BREADY : STD_LOGIC;
  signal axi_vip_0_M_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_vip_0_M_AXI_BVALID : STD_LOGIC;
  signal axi_vip_0_M_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_vip_0_M_AXI_RREADY : STD_LOGIC;
  signal axi_vip_0_M_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_vip_0_M_AXI_RVALID : STD_LOGIC;
  signal axi_vip_0_M_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_vip_0_M_AXI_WREADY : STD_LOGIC;
  signal axi_vip_0_M_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_vip_0_M_AXI_WVALID : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ACLK : signal is "xilinx.com:signal:clock:1.0 CLK.ACLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ACLK : signal is "XIL_INTERFACENAME CLK.ACLK, ASSOCIATED_RESET ARESETN, CLK_DOMAIN vip_db_ACLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of ARESETN : signal is "xilinx.com:signal:reset:1.0 RST.ARESETN RST";
  attribute X_INTERFACE_PARAMETER of ARESETN : signal is "XIL_INTERFACENAME RST.ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of interrupt_0 : signal is "xilinx.com:signal:interrupt:1.0 INTR.INTERRUPT_0 INTERRUPT";
  attribute X_INTERFACE_PARAMETER of interrupt_0 : signal is "XIL_INTERFACENAME INTR.INTERRUPT_0, PortWidth 1, SENSITIVITY LEVEL_HIGH";
begin
  aclk_0_1 <= ACLK;
  aresetn_0_1 <= ARESETN;
  interrupt_0 <= at_0_interrupt;
  o_t0_out <= at_0_o_t0_out;
at_0: component vip_db_at_0_2
     port map (
      interrupt => at_0_interrupt,
      o_t0_out => at_0_o_t0_out,
      s00_axi_aclk => aclk_0_1,
      s00_axi_araddr(5 downto 0) => axi_vip_0_M_AXI_ARADDR(5 downto 0),
      s00_axi_aresetn => aresetn_0_1,
      s00_axi_arprot(2 downto 0) => axi_vip_0_M_AXI_ARPROT(2 downto 0),
      s00_axi_arready => axi_vip_0_M_AXI_ARREADY,
      s00_axi_arvalid => axi_vip_0_M_AXI_ARVALID,
      s00_axi_awaddr(5 downto 0) => axi_vip_0_M_AXI_AWADDR(5 downto 0),
      s00_axi_awprot(2 downto 0) => axi_vip_0_M_AXI_AWPROT(2 downto 0),
      s00_axi_awready => axi_vip_0_M_AXI_AWREADY,
      s00_axi_awvalid => axi_vip_0_M_AXI_AWVALID,
      s00_axi_bready => axi_vip_0_M_AXI_BREADY,
      s00_axi_bresp(1 downto 0) => axi_vip_0_M_AXI_BRESP(1 downto 0),
      s00_axi_bvalid => axi_vip_0_M_AXI_BVALID,
      s00_axi_rdata(31 downto 0) => axi_vip_0_M_AXI_RDATA(31 downto 0),
      s00_axi_rready => axi_vip_0_M_AXI_RREADY,
      s00_axi_rresp(1 downto 0) => axi_vip_0_M_AXI_RRESP(1 downto 0),
      s00_axi_rvalid => axi_vip_0_M_AXI_RVALID,
      s00_axi_wdata(31 downto 0) => axi_vip_0_M_AXI_WDATA(31 downto 0),
      s00_axi_wready => axi_vip_0_M_AXI_WREADY,
      s00_axi_wstrb(3 downto 0) => axi_vip_0_M_AXI_WSTRB(3 downto 0),
      s00_axi_wvalid => axi_vip_0_M_AXI_WVALID
    );
axi_vip_0: component vip_db_axi_vip_0_0
     port map (
      aclk => aclk_0_1,
      aresetn => aresetn_0_1,
      m_axi_araddr(31 downto 0) => axi_vip_0_M_AXI_ARADDR(31 downto 0),
      m_axi_arprot(2 downto 0) => axi_vip_0_M_AXI_ARPROT(2 downto 0),
      m_axi_arready => axi_vip_0_M_AXI_ARREADY,
      m_axi_arvalid => axi_vip_0_M_AXI_ARVALID,
      m_axi_awaddr(31 downto 0) => axi_vip_0_M_AXI_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => axi_vip_0_M_AXI_AWPROT(2 downto 0),
      m_axi_awready => axi_vip_0_M_AXI_AWREADY,
      m_axi_awvalid => axi_vip_0_M_AXI_AWVALID,
      m_axi_bready => axi_vip_0_M_AXI_BREADY,
      m_axi_bresp(1 downto 0) => axi_vip_0_M_AXI_BRESP(1 downto 0),
      m_axi_bvalid => axi_vip_0_M_AXI_BVALID,
      m_axi_rdata(31 downto 0) => axi_vip_0_M_AXI_RDATA(31 downto 0),
      m_axi_rready => axi_vip_0_M_AXI_RREADY,
      m_axi_rresp(1 downto 0) => axi_vip_0_M_AXI_RRESP(1 downto 0),
      m_axi_rvalid => axi_vip_0_M_AXI_RVALID,
      m_axi_wdata(31 downto 0) => axi_vip_0_M_AXI_WDATA(31 downto 0),
      m_axi_wready => axi_vip_0_M_AXI_WREADY,
      m_axi_wstrb(3 downto 0) => axi_vip_0_M_AXI_WSTRB(3 downto 0),
      m_axi_wvalid => axi_vip_0_M_AXI_WVALID
    );
end STRUCTURE;
