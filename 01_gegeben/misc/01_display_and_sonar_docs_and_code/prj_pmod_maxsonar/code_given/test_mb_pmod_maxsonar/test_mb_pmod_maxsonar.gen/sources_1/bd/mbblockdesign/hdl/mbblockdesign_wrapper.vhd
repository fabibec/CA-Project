--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
--Date        : Fri Jan  3 11:00:49 2025
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
    gpio_rtl_tri_o : out STD_LOGIC_VECTOR ( 0 to 0 );
    led_4bits_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    push_buttons_4bits_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    pwm0_0 : out STD_LOGIC;
    reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC;
    uart_rtl_rxd : in STD_LOGIC;
    uart_rtl_txd : out STD_LOGIC;
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
    uart_rtl_rxd : in STD_LOGIC;
    uart_rtl_txd : out STD_LOGIC;
    gpio_rtl_tri_o : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component mbblockdesign;
begin
mbblockdesign_i: component mbblockdesign
     port map (
      gpio_rtl_tri_o(0) => gpio_rtl_tri_o(0),
      led_4bits_tri_o(3 downto 0) => led_4bits_tri_o(3 downto 0),
      push_buttons_4bits_tri_i(3 downto 0) => push_buttons_4bits_tri_i(3 downto 0),
      pwm0_0 => pwm0_0,
      reset => reset,
      sys_clock => sys_clock,
      uart_rtl_rxd => uart_rtl_rxd,
      uart_rtl_txd => uart_rtl_txd,
      usb_uart_rxd => usb_uart_rxd,
      usb_uart_txd => usb_uart_txd
    );
end STRUCTURE;
