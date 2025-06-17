--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
--Date        : Wed Jan 22 10:12:13 2025
--Host        : xuser-pc running 64-bit Ubuntu 22.04.3 LTS
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
    clp_cb_tri_o : out STD_LOGIC_VECTOR ( 2 downto 0 );
    clp_db_tri_io : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    led_4bits_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    push_buttons_4bits_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    pwm0_0 : out STD_LOGIC;
    reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC;
    usb_uart_rxd : in STD_LOGIC;
    usb_uart_txd : out STD_LOGIC
  );
end mbblockdesign_wrapper;

architecture STRUCTURE of mbblockdesign_wrapper is
  component mbblockdesign is
  port (
    usb_uart_rxd : in STD_LOGIC;
    usb_uart_txd : out STD_LOGIC;
    led_4bits_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    push_buttons_4bits_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    sys_clock : in STD_LOGIC;
    reset : in STD_LOGIC;
    pwm0_0 : out STD_LOGIC;
    clp_cb_tri_o : out STD_LOGIC_VECTOR ( 2 downto 0 );
    clp_db_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clp_db_tri_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    clp_db_tri_t : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component mbblockdesign;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal clp_db_tri_i_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal clp_db_tri_i_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal clp_db_tri_i_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal clp_db_tri_i_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal clp_db_tri_i_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal clp_db_tri_i_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal clp_db_tri_i_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal clp_db_tri_i_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal clp_db_tri_io_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal clp_db_tri_io_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal clp_db_tri_io_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal clp_db_tri_io_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal clp_db_tri_io_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal clp_db_tri_io_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal clp_db_tri_io_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal clp_db_tri_io_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal clp_db_tri_o_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal clp_db_tri_o_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal clp_db_tri_o_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal clp_db_tri_o_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal clp_db_tri_o_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal clp_db_tri_o_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal clp_db_tri_o_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal clp_db_tri_o_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal clp_db_tri_t_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal clp_db_tri_t_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal clp_db_tri_t_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal clp_db_tri_t_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal clp_db_tri_t_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal clp_db_tri_t_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal clp_db_tri_t_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal clp_db_tri_t_7 : STD_LOGIC_VECTOR ( 7 to 7 );
begin
clp_db_tri_iobuf_0: component IOBUF
     port map (
      I => clp_db_tri_o_0(0),
      IO => clp_db_tri_io(0),
      O => clp_db_tri_i_0(0),
      T => clp_db_tri_t_0(0)
    );
clp_db_tri_iobuf_1: component IOBUF
     port map (
      I => clp_db_tri_o_1(1),
      IO => clp_db_tri_io(1),
      O => clp_db_tri_i_1(1),
      T => clp_db_tri_t_1(1)
    );
clp_db_tri_iobuf_2: component IOBUF
     port map (
      I => clp_db_tri_o_2(2),
      IO => clp_db_tri_io(2),
      O => clp_db_tri_i_2(2),
      T => clp_db_tri_t_2(2)
    );
clp_db_tri_iobuf_3: component IOBUF
     port map (
      I => clp_db_tri_o_3(3),
      IO => clp_db_tri_io(3),
      O => clp_db_tri_i_3(3),
      T => clp_db_tri_t_3(3)
    );
clp_db_tri_iobuf_4: component IOBUF
     port map (
      I => clp_db_tri_o_4(4),
      IO => clp_db_tri_io(4),
      O => clp_db_tri_i_4(4),
      T => clp_db_tri_t_4(4)
    );
clp_db_tri_iobuf_5: component IOBUF
     port map (
      I => clp_db_tri_o_5(5),
      IO => clp_db_tri_io(5),
      O => clp_db_tri_i_5(5),
      T => clp_db_tri_t_5(5)
    );
clp_db_tri_iobuf_6: component IOBUF
     port map (
      I => clp_db_tri_o_6(6),
      IO => clp_db_tri_io(6),
      O => clp_db_tri_i_6(6),
      T => clp_db_tri_t_6(6)
    );
clp_db_tri_iobuf_7: component IOBUF
     port map (
      I => clp_db_tri_o_7(7),
      IO => clp_db_tri_io(7),
      O => clp_db_tri_i_7(7),
      T => clp_db_tri_t_7(7)
    );
mbblockdesign_i: component mbblockdesign
     port map (
      clp_cb_tri_o(2 downto 0) => clp_cb_tri_o(2 downto 0),
      clp_db_tri_i(7) => clp_db_tri_i_7(7),
      clp_db_tri_i(6) => clp_db_tri_i_6(6),
      clp_db_tri_i(5) => clp_db_tri_i_5(5),
      clp_db_tri_i(4) => clp_db_tri_i_4(4),
      clp_db_tri_i(3) => clp_db_tri_i_3(3),
      clp_db_tri_i(2) => clp_db_tri_i_2(2),
      clp_db_tri_i(1) => clp_db_tri_i_1(1),
      clp_db_tri_i(0) => clp_db_tri_i_0(0),
      clp_db_tri_o(7) => clp_db_tri_o_7(7),
      clp_db_tri_o(6) => clp_db_tri_o_6(6),
      clp_db_tri_o(5) => clp_db_tri_o_5(5),
      clp_db_tri_o(4) => clp_db_tri_o_4(4),
      clp_db_tri_o(3) => clp_db_tri_o_3(3),
      clp_db_tri_o(2) => clp_db_tri_o_2(2),
      clp_db_tri_o(1) => clp_db_tri_o_1(1),
      clp_db_tri_o(0) => clp_db_tri_o_0(0),
      clp_db_tri_t(7) => clp_db_tri_t_7(7),
      clp_db_tri_t(6) => clp_db_tri_t_6(6),
      clp_db_tri_t(5) => clp_db_tri_t_5(5),
      clp_db_tri_t(4) => clp_db_tri_t_4(4),
      clp_db_tri_t(3) => clp_db_tri_t_3(3),
      clp_db_tri_t(2) => clp_db_tri_t_2(2),
      clp_db_tri_t(1) => clp_db_tri_t_1(1),
      clp_db_tri_t(0) => clp_db_tri_t_0(0),
      led_4bits_tri_o(3 downto 0) => led_4bits_tri_o(3 downto 0),
      push_buttons_4bits_tri_i(3 downto 0) => push_buttons_4bits_tri_i(3 downto 0),
      pwm0_0 => pwm0_0,
      reset => reset,
      sys_clock => sys_clock,
      usb_uart_rxd => usb_uart_rxd,
      usb_uart_txd => usb_uart_txd
    );
end STRUCTURE;
