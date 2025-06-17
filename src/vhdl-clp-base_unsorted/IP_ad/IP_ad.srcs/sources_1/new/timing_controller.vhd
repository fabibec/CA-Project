----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2025 07:32:09 AM
-- Design Name: 
-- Module Name: timing_controller - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timing_controller is
  Port (
    i_clk         : in  std_logic;
    i_reset       : in  std_logic;
    i_start       : in  std_logic;
    i_delay_time  : in  std_logic_vector(21 downto 0); -- needs to be calculated into clock based time
    o_done        : out std_logic
  );
end timing_controller;

architecture Behavioral of timing_controller is

  type state_type is (
    IDLE, WORK
  );
  
  signal state: state_type := IDLE;
  signal nstate : state_type := IDLE;
  signal counter, ncounter : unsigned(21 downto 0) := (others => '0');
  signal done, ndone : std_logic := '0';
  signal delay_time, ndelay_time: std_logic_vector(21 downto 0);
  signal start_prev : std_logic := '0';
  signal start_edge : std_logic := '0';
  
begin
  -- Edge detection for start signal
  start_edge <= i_start and not start_prev;
  
  -- CLOCKED PROCESS: Registers state, counter, and done
  clock_fsm: process (i_clk)
  begin
    if(i_clk'event and i_clk = '1') then
      if i_reset='1' then
        state <= IDLE;
        counter <= (others => '0');
        done <= '0';
        delay_time <= (others => '0');
        start_prev <= '0';
      else
        state <= nstate;
        counter <= ncounter; 
        done <= ndone;
        delay_time <= ndelay_time;
        start_prev <= i_start;
      end if;
   end if;       
  end process;

  -- COMBINATIONAL PROCESS: Computes next state, next counter, next done
  state_fsm: process(state, start_edge, counter, i_delay_time, delay_time)
  begin
    nstate   <= state;
    ncounter <= counter;
    ndone    <= '0';
    ndelay_time <= delay_time;

    case state is
      when IDLE =>
        ncounter <= (others => '0');
        if start_edge = '1' then
          nstate <= WORK;
          ndelay_time <= i_delay_time;
          ncounter <= to_unsigned(1, 22); -- Start counting from 1 otherwise we have 1 Clock Delay
          -- e.g. val of counter var, start at 0: 0---10ns--->1---20ns--->2---30ns--->3---40ns--->4---50ns--->5---60ns--->5
          -- Since we check counter < unsigned(i_delay_time) and ncounter gets assigned to counter one clock later  
        end if;

      when WORK =>
        if counter < unsigned(delay_time) then
          ncounter <= counter + 1;
        else
          ncounter <= (others => '0');
          ndone <= '1';           -- Pulse done
          nstate <= IDLE;
        end if;

      when others =>
        nstate <= IDLE;
        ncounter <= (others => '0');
    end case;
  end process;

  o_done <= done;

end Behavioral;