----------------------------------------------------------------------------------
-- Engineer: Jendrik Juergens (3361128), Michael Specht (3362589)
-- Further Information: -
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity timing_controller is
  Port (
    i_clk         : in  std_logic;
    i_reset       : in  std_logic;
    i_start       : in  std_logic;
    i_delay_time  : in  std_logic_vector(21 downto 0);
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
  
begin
  clock_fsm: process (i_clk)
  begin
    if(i_clk'event and i_clk = '1') then
      if i_reset='1' then
        state <= IDLE;
        counter <= (others => '0');
        done <= '0';
        delay_time <= (others => '0');
      else
        state <= nstate;
        counter <= ncounter; 
        done <= ndone;
        delay_time <= ndelay_time;
      end if;
   end if;       
  end process;

  state_fsm: process(state, counter, i_delay_time, delay_time, i_start)
  begin
    nstate   <= state;
    ncounter <= counter;
    ndone    <= '0';
    ndelay_time <= delay_time;

    case state is
      when IDLE =>
        ncounter <= (others => '0');
        if i_start = '1' then
          nstate <= WORK;
          ndelay_time <= i_delay_time;
          ncounter <= to_unsigned(1, 22); 
        end if;

      when WORK =>
        if counter < unsigned(delay_time) then
          ncounter <= counter + 1;
        else
          ncounter <= (others => '0');
          ndone <= '1';
          nstate <= IDLE;
        end if;

      when others =>
        nstate <= IDLE;
        ncounter <= (others => '0');
    end case;
  end process;

  o_done <= done;

end Behavioral;
