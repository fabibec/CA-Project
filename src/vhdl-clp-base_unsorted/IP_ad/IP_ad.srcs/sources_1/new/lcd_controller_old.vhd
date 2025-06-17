----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2025 07:32:38 AM
-- Design Name: 
-- Module Name: lcd_controller - Behavioral
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

entity lcd_controller is
  Port (
    i_clk                        : in std_logic;
    i_reset                      : in std_logic;
    
    -- register input
    i_ri_ap_start                : in std_logic;                         -- GCSR   - ap_start            (0)
    i_ri_lcd_reset               : in std_logic;                         -- SCSR0  - lcd_reset           (2)
    i_ri_symbol_to_write         : in std_logic_vector(7 downto 0);      -- CDR    - symbol_to_write     (7:0)
    i_ri_ddram_pos_to_read       : in std_logic_vector(7 downto 0);      -- CCR    - ddram_pos_to_read   (15:8)
    i_ri_write_char              : in std_logic;                         -- CCR    - write_char          (24)
    i_ri_read_char               : in std_logic;                         -- CCR    - read_char           (25)
    i_ri_clear_display           : in std_logic;                         -- DCR    - clear_display       (0)
    i_ri_return_home             : in std_logic;                         -- DCR    - return_home         (1)
    i_ri_cursor_on               : in std_logic;                         -- DCR    - cursor_on           (2)
    i_ri_cursor_blink            : in std_logic;                         -- DCR    - cursor_blink        (3)
    i_ri_display_shift           : in std_logic;                         -- DCR    - display_shift       (4)
    i_ri_shift_direction         : in std_logic;                         -- DCR    - shift_direction     (5)
    i_ri_display_line            : in std_logic;                         -- DCR    - display_line        (6)
    i_ri_write_format            : in std_logic;                         -- DCR    - write_format        (7)
    
    -- outputs to LCD
    o_db4_7                      : out std_logic_vector(3 downto 0);
    o_register_select            : out std_logic;
    o_read_write                 : out std_logic;
    o_read_write_enable          : out std_logic;
    
    -- register output
    o_ri_ap_done                 : in std_logic;                          -- GCSR   - ap_done             (1)
    o_ri_ap_idle                 : in std_logic;                          -- GCSR   - ap_idle             (2)
    o_ro_ddram_pos_last_written  : out std_logic_vector(7 downto 0);      -- CCR    - ddram_pos_last_written      (7:0)
    o_ro_symbol_read             : out std_logic_vector(7 downto 0);      -- CDR    - symbol_read         (15:8)
    o_ro_lcd_initialized         : out std_logic;                         -- SCSR0  - lcd_initialized     (0)
    o_ro_lcd_busy                : out std_logic;                         -- SCSR0  - lcd_busy            (1)
    o_ro_lcd_state               : out std_logic_vector(7 downto 0);      -- SCSR0  - lcd_state           (10:3)
    o_ro_display_busy            : out std_logic;                         -- SCSR0  - display_busy        (11)
    o_ro_lcd_error_flag          : out std_logic;                         -- SCSR0  - lcd_error_flag      (12)
    o_ro_lcd_error_code          : out std_logic                          -- SCSR0  - lcd_error_code      (20:13)

    
  );
end lcd_controller;

architecture Behavioral of lcd_controller is

  -- import timing_controller
  component timing_controller is
    Port (
      i_clk         : in  std_logic;
      i_reset       : in  std_logic;
      i_start       : in  std_logic;
      i_delay_time  : in  std_logic_vector(31 downto 0); -- needs to be calculated into clock based time
      i_read_write  : in std_logic;
      o_enable_out  : out std_logic;
      o_done        : out std_logic
    );
  end component;

  -- type enum
  type state_type is (
      STARTUP, WAIT_20MS,

        -- Function Set
      SEND_FUNCTION_SET_HI, PULSE_FUNCTION_SET_HI, WAIT_FUNCTION_SET_HI,
      SEND_FUNCTION_SET_LO, PULSE_FUNCTION_SET_LO, WAIT_FUNCTION_SET_LO,

        -- Display On/Off
      SEND_DISPLAY_ON_OFF_HI, PULSE_DISPLAY_ON_OFF_HI, WAIT_DISPLAY_ON_OFF_HI,
      SEND_DISPLAY_ON_OFF_LO, PULSE_DISPLAY_ON_OFF_LO, WAIT_DISPLAY_ON_OFF_LO,

        -- Clear Display
      SEND_DISPLAY_CLEAR_HI, PULSE_DISPLAY_CLEAR_HI, WAIT_DISPLAY_CLEAR_HI,
      SEND_DISPLAY_CLEAR_LO, PULSE_DISPLAY_CLEAR_LO, WAIT_DISPLAY_CLEAR_LO,

        -- Entry Mode
      SEND_ENTRY_MODE_HI, PULSE_ENTRY_MODE_HI, WAIT_ENTRY_MODE_HI,
      SEND_ENTRY_MODE_LO, PULSE_ENTRY_MODE_LO, WAIT_ENTRY_MODE_LO,

        -- Return Home
    --   SEND_RETURN_HOME_HI, PULSE_RETURN_HOME_HI, WAIT_RETURN_HOME_HI,
    --   SEND_RETURN_HOME_LO, PULSE_RETURN_HOME_LO, WAIT_RETURN_HOME_LO,
      
      INITIALIZED,

      SEND_SET_DDRAM_ADDR_FOR_WRITE_DATA_HI, PULSE_SET_DDRAM_ADDR_FOR_WRITE_DATA_HI, WAIT_SET_DDRAM_ADDR_FOR_WRITE_DATA_HI,
      SEND_SET_DDRAM_ADDR_FOR_WRITE_DATA_LO, PULSE_SET_DDRAM_ADDR_FOR_WRITE_DATA_LO, WAIT_SET_DDRAM_ADDR_FOR_WRITE_DATA_LO,

      SEND_WRITE_DATA_HI, PULSE_WRITE_DATA_HI, WAIT_WRITE_DATA_HI,
      SEND_WRITE_DATA_LO, PULSE_WRITE_DATA_LO, WAIT_WRITE_DATA_LO,

      SEND_SET_DDRAM_ADDR_FOR_READ_DATA_HI, PULSE_SET_DDRAM_ADDR_FOR_READ_DATA_HI, WAIT_SET_DDRAM_ADDR_FOR_READ_DATA_HI,
      SEND_SET_DDRAM_ADDR_FOR_READ_DATA_LO, PULSE_SET_DDRAM_ADDR_FOR_READ_DATA_LO, WAIT_SET_DDRAM_ADDR_FOR_READ_DATA_LO,

      SEND_READ_DATA_HI, PULSE_READ_DATA_HI, WAIT_READ_DATA_HI,
      SEND_READ_DATA_LO, PULSE_READ_DATA_LO, WAIT_READ_DATA_LO,

      CLEAR_DISPLAY,
      RETURN_HOME,
      CURSOR_ON,
      CURSOR_BLINK,
      DISPLAY_SHIFT,
      DISPLAY_LINE
  );

  -- signals fsm
  signal state, nstate   : state_type := STARTUP;
  
  -- signals lcd
  signal register_select : std_logic := '0';
  signal read_write : std_logic := '0';
  signal db4_7: std_logic_vector(3 downto 0) := (others => '0');
  signal read_write_enable : std_logic := '0';
  
  -- signals register output  
  signal ro_last_ddram_pos : std_logic_vector(7 downto 0) := (others => '1');
  signal ro_symbol_read : std_logic_vector(7 downto 0) := x"3F";
  signal ro_lcd_initialized : std_logic := '0';
  signal ro_lcd_busy        : std_logic;
  signal ro_lcd_state       : std_logic_vector(7 downto 0);
  signal ro_display_busy    : std_logic;
  signal ro_lcd_error_flag  : std_logic;
  signal ro_lcd_error_code  : std_logic;
  
  -- signals timing_controller
  signal timer_start, timer_read_write, timer_enable_out, timer_done : std_logic := '0';
  signal timer_delay_time : std_logic_vector(20 downto 0) := (others => '0');

  -- internal signals
  signal next_ddram_pos : std_logic_vector(7 downto 0);
  
  -- 100 MHz → 10 ns / Takt
  constant TIME_POWER_ON               : std_logic_vector(20 downto 0) := std_logic_vector(to_unsigned(2000100, 21));
  constant TIME_CLEAR_DISPLAY          : std_logic_vector(20 downto 0) := std_logic_vector(to_unsigned(153000 + 100, 21)); -- 1.53ms
  constant TIME_RETURN_HOME            : std_logic_vector(20 downto 0) := std_logic_vector(to_unsigned(153000 + 100, 21)); -- 1.53ms
  constant TIME_ENTRY_MODE_SET         : std_logic_vector(20 downto 0) := std_logic_vector(to_unsigned(3900 + 100, 21));   -- 39us
  constant TIME_DISPLAY_ON_OFF         : std_logic_vector(20 downto 0) := std_logic_vector(to_unsigned(3900 + 100, 21));   -- 39us
  constant TIME_CURSOR_OR_DISPLAY_SHIFT: std_logic_vector(20 downto 0) := std_logic_vector(to_unsigned(3900 + 100, 21));   -- 39us
  constant TIME_FUNCTION_SET           : std_logic_vector(20 downto 0) := std_logic_vector(to_unsigned(3900 + 100, 21));   -- 39us
  constant TIME_SET_CGRAM_ADDR         : std_logic_vector(20 downto 0) := std_logic_vector(to_unsigned(3900 + 100, 21));   -- 39us
  constant TIME_SET_DDRAM_ADDR         : std_logic_vector(20 downto 0) := std_logic_vector(to_unsigned(3900 + 100, 21));   -- 39us
  constant TIME_WRITE_DATA_TO_RAM      : std_logic_vector(20 downto 0) := std_logic_vector(to_unsigned(4300 + 100, 21));   -- 43us
  constant TIME_READ_DATA_FROM_RAM     : std_logic_vector(20 downto 0) := std_logic_vector(to_unsigned(4300 + 100, 21));   -- 43us
  
  -- TODO
  constant C_EN_PULSE: unsigned(20 downto 0)  := to_unsigned(30, 21);  -- ca. 300 ns
  
  -- LCD Commands (8-bit), werden in 2x 4-bit gesendet
  constant CMD_INIT_CLEAR_DISPLAY : std_logic_vector(7 downto 0) := "00000001";
  constant CMD_RETURN_HOME        : std_logic_vector(7 downto 0) := "00000010"; -- Return home
  constant CMD_INIT_ENTRY_MODE    : std_logic_vector(7 downto 0) := "00000110"; -- Increment mode
  constant CMD_INIT_FUNCTION_SET  : std_logic_vector(7 downto 0) := "00101000"; -- 4-bit, 2-line, 5x8 font 
  constant CMD_INIT_DISPLAY_CTRL  : std_logic_vector(7 downto 0) := "00001100"; -- Display ON, Cursor OFF
  
begin
  timer_inst : timing_controller
    port map (
      i_clk         => i_clk,
      i_reset       => i_reset,
      i_start       => timer_start,
      i_delay_time  => timer_delay_time,
      i_read_write  => timer_read_write,
      o_enable_out  => timer_enable_out,
      o_done       => timer_done
  );

  clock_fsm: process (i_clk) is
  begin
    if(i_clk='1' and i_clk'event) then
      --reset
      if i_reset ='1' then
        timer_enable_out <= '0';
        register_select <= '0';
        read_write <= '0';
        db4_7 <= (others => '0');
        state<=STARTUP;
      else
        state<=nstate;     
      end if;
    end if;
  end process;
  
  state_fsm: process(i_clk, i_reset)
  begin
    case state is
        when STARTUP =>
            ro_lcd_initialized <= '0';
            timer_delay_time <= TIME_POWER_ON;
            timer_read_write <= '0';
            timer_start <= '1';
            nstate <= WAIT_20MS;

        when WAIT_20MS =>
            if timer_done = '1' then
                timer_start <= '0';
                nstate <= SEND_FUNCTION_SET_HI;
            end if;

        -----------------------------------------------------------------------
        ---------------------         Function Set          -------------------
        -----------------------------------------------------------------------
        when SEND_FUNCTION_SET_HI =>
            read_write_enable <= '1';
            register_select <= '0';
            read_write <= '0';
            db4_7 <= CMD_INIT_FUNCTION_SET(7 downto 4);
            timer_delay_time <= std_logic_vector(C_EN_PULSE);
            timer_read_write <= '1';
            timer_start <= '1';
            nstate <= PULSE_FUNCTION_SET_HI;

        when PULSE_FUNCTION_SET_HI =>
            if timer_done = '1' then
                timer_start <= '0';
                timer_delay_time <= TIME_FUNCTION_SET;
                timer_read_write <= '0';
                timer_start <= '1';
                nstate <= WAIT_FUNCTION_SET_HI;
            end if;

        when WAIT_FUNCTION_SET_HI =>
            if timer_done = '1' then
                timer_start <= '0';
                nstate <= SEND_FUNCTION_SET_LO;
            end if;

        when SEND_FUNCTION_SET_LO =>
            db4_7 <= CMD_INIT_FUNCTION_SET(3 downto 0);
            timer_delay_time <= std_logic_vector(C_EN_PULSE);
            timer_read_write <= '1';
            timer_start <= '1';
            nstate <= PULSE_FUNCTION_SET_LO;

        when PULSE_FUNCTION_SET_LO =>
            if timer_done = '1' then
                timer_start <= '0';
                timer_delay_time <= TIME_FUNCTION_SET;
                timer_read_write <= '0';
                timer_start <= '1';
                nstate <= WAIT_FUNCTION_SET_LO;
            end if;

        when WAIT_FUNCTION_SET_LO =>
            if timer_done = '1' then
                timer_start <= '0';
                nstate <= SEND_DISPLAY_ON_OFF_HI;
            end if;

        -----------------------------------------------------------------------
        --------------------         Display On/Off          ------------------
        -----------------------------------------------------------------------
        when SEND_DISPLAY_ON_OFF_HI =>
            register_select <= '0';
            read_write <= '0';
            db4_7 <= CMD_INIT_DISPLAY_CTRL(7 downto 4);
            timer_delay_time <= std_logic_vector(C_EN_PULSE);
            timer_read_write <= '1';
            timer_start <= '1';
            nstate <= PULSE_DISPLAY_ON_OFF_HI;

        when PULSE_DISPLAY_ON_OFF_HI =>
            if timer_done = '1' then
                timer_start <= '0';
                timer_delay_time <= TIME_DISPLAY_ON_OFF;
                timer_read_write <= '0';
                timer_start <= '1';
                nstate <= WAIT_DISPLAY_ON_OFF_HI;
            end if;

        when WAIT_DISPLAY_ON_OFF_HI =>
            if timer_done = '1' then
                timer_start <= '0';
                nstate <= SEND_DISPLAY_ON_OFF_LO;
            end if;

        when SEND_DISPLAY_ON_OFF_LO =>
            db4_7 <= CMD_INIT_DISPLAY_CTRL(3 downto 0);
            timer_delay_time <= std_logic_vector(C_EN_PULSE);
            timer_read_write <= '1';
            timer_start <= '1';
            nstate <= PULSE_DISPLAY_ON_OFF_LO;

        when PULSE_DISPLAY_ON_OFF_LO =>
            if timer_done = '1' then
                timer_start <= '0';
                timer_delay_time <= TIME_DISPLAY_ON_OFF;
                timer_read_write <= '0';
                timer_start <= '1';
                nstate <= WAIT_DISPLAY_ON_OFF_LO;
            end if;

        when WAIT_DISPLAY_ON_OFF_LO =>
            if timer_done = '1' then
                timer_start <= '0';
                nstate <= SEND_DISPLAY_CLEAR_HI;
            end if;

        -----------------------------------------------------------------------
        --------------------         Clear Display           ------------------
        -----------------------------------------------------------------------
        when SEND_DISPLAY_CLEAR_HI =>
            register_select <= '0';
            read_write <= '0';
            db4_7 <= CMD_INIT_CLEAR_DISPLAY(7 downto 4);
            timer_delay_time <= std_logic_vector(C_EN_PULSE);
            timer_read_write <= '1';
            timer_start <= '1';
            nstate <= PULSE_DISPLAY_CLEAR_HI;

        when PULSE_DISPLAY_CLEAR_HI =>
            if timer_done = '1' then
                timer_start <= '0';
                timer_delay_time <= TIME_CLEAR_DISPLAY;
                timer_read_write <= '0';
                timer_start <= '1';
                nstate <= WAIT_DISPLAY_CLEAR_HI;
            end if;

        when WAIT_DISPLAY_CLEAR_HI =>
            if timer_done = '1' then
                timer_start <= '0';
                nstate <= SEND_DISPLAY_CLEAR_LO;
            end if;

        when SEND_DISPLAY_CLEAR_LO =>
            db4_7 <= CMD_INIT_CLEAR_DISPLAY(3 downto 0);
            timer_delay_time <= std_logic_vector(C_EN_PULSE);
            timer_read_write <= '1';
            timer_start <= '1';
            nstate <= PULSE_DISPLAY_CLEAR_LO;

        when PULSE_DISPLAY_CLEAR_LO =>
            if timer_done = '1' then
                timer_start <= '0';
                timer_delay_time <= TIME_CLEAR_DISPLAY;
                timer_read_write <= '0';
                timer_start <= '1';
                nstate <= WAIT_DISPLAY_CLEAR_LO;
            end if;

        when WAIT_DISPLAY_CLEAR_LO =>
            if timer_done = '1' then
                timer_start <= '0';
                nstate <= SEND_ENTRY_MODE_HI;
            end if;

        -----------------------------------------------------------------------
        --------------------         Entry Mode              ------------------
        -----------------------------------------------------------------------        
        when SEND_ENTRY_MODE_HI =>
            register_select <= '0';
            read_write <= '0';
            db4_7 <= CMD_INIT_ENTRY_MODE(7 downto 4);
            timer_delay_time <= std_logic_vector(C_EN_PULSE);
            timer_read_write <= '1';
            timer_start <= '1';
            nstate <= PULSE_ENTRY_MODE_HI;

        when PULSE_ENTRY_MODE_HI =>
            if timer_done = '1' then
                timer_start <= '0';
                timer_delay_time <= TIME_ENTRY_MODE_SET;
                timer_read_write <= '0';
                timer_start <= '1';
                nstate <= WAIT_ENTRY_MODE_HI;
            end if;

        when WAIT_ENTRY_MODE_HI =>
            if timer_done = '1' then
                timer_start <= '0';
                nstate <= SEND_ENTRY_MODE_LO;
            end if;

        when SEND_ENTRY_MODE_LO =>
            db4_7 <= CMD_INIT_ENTRY_MODE(3 downto 0);
            timer_delay_time <= std_logic_vector(C_EN_PULSE);
            timer_read_write <= '1';
            timer_start <= '1';
            nstate <= PULSE_ENTRY_MODE_LO;

        when PULSE_ENTRY_MODE_LO =>
            if timer_done = '1' then
                timer_start <= '0';
                timer_delay_time <= TIME_ENTRY_MODE_SET;
                timer_read_write <= '0';
                timer_start <= '1';
                nstate <= WAIT_ENTRY_MODE_LO;
            end if;

        when WAIT_ENTRY_MODE_LO =>
            if timer_done = '1' then
                timer_start <= '0';
                nstate <= INITIALIZED;
            end if;

        -----------------------------------------------------------------------
        --------------------         Initialized             ------------------
        -----------------------------------------------------------------------    
        when INITIALIZED =>
            ro_lcd_initialized <= '1';
            
            if (
              (
                (unsigned(i_symbol_to_write) >= x"20" and unsigned(i_symbol_to_write) <= x"7F") or 
                (i_symbol_to_write = x"FF")
              ) and
              i_write_char = '1'
            ) then
                -- calculate next position
                if ro_last_ddram_pos = x"FF" then
                    next_ddram_pos <= x"00";
                elsif ro_last_ddram_pos = x"27" then
                    next_ddram_pos <= x"40";
                elsif ro_last_ddram_pos = x"67" then
                    next_ddram_pos <= x"00";
                else
                    next_ddram_pos <= std_logic_vector(unsigned(ro_last_ddram_pos) + 1);
                end if;

                nstate <= SEND_SET_DDRAM_ADDR_FOR_WRITE_DATA_HI;
            else
                -- TODO: evtl. error flag bzw. error code?
            end if;
            
            if (
              (
                (unsigned(i_ri_ddram_pos_to_read) >= x"00" and unsigned(i_ri_ddram_pos_to_read) <= x"27") or 
                (unsigned(i_ri_ddram_pos_to_read) >= x"40" and unsigned(i_ri_ddram_pos_to_read) <= x"67")
              ) and 
              i_ri_read_char = '1'
            ) then
                nstate <= SEND_SET_DDRAM_ADDR_FOR_READ_DATA_HI;
            else
                -- TODO: evtl. error flag bzw. error code?
            end if;

            -- if i_ri_write_format = '1' then
            --     nstate <= SEND_DISPLAY_CLEAR_HI;
            -- end if;
            
            -- if i_ri_return_home = '1' then
            --   nstate <= SEND_RETURN_HOME_HI;
            -- end if;
            
            -- if i_ri_cursor_on = '1' then
            --   nstate <= CURSOR_ON;
            -- end if;
            
            -- if i_ri_cursor_blink = '1' then
            --   nstate <= CURSOR_BLINK;
            -- end if;
            
            -- if i_ri_display_shift = '1' then
            --   nstate <= DISPLAY_SHIFT;
            -- end if;
            
            -- if i_ri_display_line = '1' then
            --   nstate <= DISPLAY_LINE;
            -- end if;

        -- when SEND_RETURN_HOME_HI =>
        --     rs_reg <= '0';
        --     data_reg <= CMD_RETURN_HOME(7 downto 4);
        --     timer_delay_time <= std_logic_vector(C_EN_PULSE);
        --     timer_read_write <= '1';
        --     timer_start <= '1';
        --     nstate <= PULSE_RETURN_HOME_HI;

        -- when PULSE_RETURN_HOME_HI =>
        --     if timer_done = '1' then
        --         timer_start <= '0';
        --         timer_delay_time <= std_logic_vector(C_1_52MS);
        --         timer_read_write <= '0';
        --         timer_start <= '1';
        --         nstate <= WAIT_RETURN_HOME_HI;
        --     end if;

        -- when WAIT_RETURN_HOME_HI =>
        --     if timer_done = '1' then
        --         timer_start <= '0';
        --         nstate <= SEND_RETURN_HOME_LO;
        --     end if;

        -- when SEND_RETURN_HOME_LO =>
        --     rs_reg <= '0';
        --     data_reg <= CMD_RETURN_HOME(3 downto 0);
        --     timer_delay_time <= std_logic_vector(C_EN_PULSE);
        --     timer_read_write <= '1';
        --     timer_start <= '1';
        --     nstate <= PULSE_RETURN_HOME_LO;

        -- when PULSE_RETURN_HOME_LO =>
        --     if timer_done = '1' then
        --         timer_start <= '0';
        --         timer_delay_time <= std_logic_vector(C_1_52MS);
        --         timer_read_write <= '0';
        --         timer_start <= '1';
        --         nstate <= WAIT_RETURN_HOME_LO;
        --     end if;

        -- when WAIT_RETURN_HOME_LO =>
        --     if timer_done = '1' then
        --         timer_start <= '0';
        --         nstate <= INITIALIZED;
        --     end if;
        
        -----------------------------------------------------------------------
        ----------------          Set DDRAM for Write            --------------
        -----------------------------------------------------------------------            
        when SEND_SET_DDRAM_ADDR_FOR_WRITE_DATA_HI =>
            register_select <= '0';
            read_write <= '0';
            db4_7 <= (next_ddram_pos(7 downto 4) or "1000"); -- left bit must be 1
            timer_delay_time <= std_logic_vector(C_EN_PULSE);
            timer_read_write <= '1';
            timer_start <= '1';
            nstate <= PULSE_SET_DDRAM_ADDR_FOR_WRITE_DATA_HI;

        when PULSE_SET_DDRAM_ADDR_FOR_WRITE_DATA_HI =>
            if timer_done = '1' then
                timer_start <= '0';
                timer_delay_time <= TIME_SET_DDRAM_ADDR;
                timer_read_write <= '0';
                timer_start <= '1';
                nstate <= WAIT_SET_DDRAM_ADDR_FOR_WRITE_DATA_HI;
            end if;

        when WAIT_SET_DDRAM_ADDR_FOR_WRITE_DATA_HI =>
            if timer_done = '1' then
                timer_start <= '0';
                nstate <= SEND_SET_DDRAM_ADDR_FOR_WRITE_DATA_LO;
            end if;

        when SEND_SET_DDRAM_ADDR_FOR_WRITE_DATA_LO =>
            db4_7 <= next_ddram_pos(3 downto 0);
            timer_delay_time <= std_logic_vector(C_EN_PULSE);
            timer_read_write <= '1';
            timer_start <= '1';
            nstate <= PULSE_SET_DDRAM_ADDR_FOR_WRITE_DATA_LO;

        when PULSE_SET_DDRAM_ADDR_FOR_WRITE_DATA_LO =>
            if timer_done = '1' then
                timer_start <= '0';
                timer_delay_time <= TIME_SET_DDRAM_ADDR;
                timer_read_write <= '0';
                timer_start <= '1';
                nstate <= WAIT_SET_DDRAM_ADDR_FOR_WRITE_DATA_LO;
            end if;

        when WAIT_SET_DDRAM_ADDR_FOR_WRITE_DATA_LO =>
            if timer_done = '1' then
                timer_start <= '0';
                ro_last_ddram_pos <= next_ddram_pos;
                nstate <= SEND_WRITE_DATA_HI;
            end if;

        -----------------------------------------------------------------------
        --------------------          Write Data             ------------------
        -----------------------------------------------------------------------
        when SEND_WRITE_DATA_HI =>
            register_select <= '1';
            read_write <= '0';
            db4_7 <= i_symbol_to_write(7 downto 4);
            timer_delay_time <= std_logic_vector(C_EN_PULSE);
            timer_read_write <= '1';
            timer_start <= '1';
            nstate <= PULSE_WRITE_DATA_HI;

        when PULSE_WRITE_DATA_HI =>
            if timer_done = '1' then
                timer_start <= '0';
                timer_delay_time <= TIME_WRITE_DATA_TO_RAM;
                timer_read_write <= '0';
                timer_start <= '1';
                nstate <= WAIT_WRITE_DATA_HI;
            end if;

        when WAIT_WRITE_DATA_HI =>
            if timer_done = '1' then
                timer_start <= '0';
                nstate <= SEND_WRITE_DATA_LO;
            end if;

        when SEND_WRITE_DATA_LO =>
            db4_7 <= i_symbol_to_write(3 downto 0);
            timer_delay_time <= std_logic_vector(C_EN_PULSE);
            timer_read_write <= '1';
            timer_start <= '1';
            nstate <= PULSE_WRITE_DATA_LO;

        when PULSE_WRITE_DATA_LO =>
            if timer_done = '1' then
                timer_start <= '0';
                timer_delay_time <= TIME_WRITE_DATA_TO_RAM;
                timer_read_write <= '0';
                timer_start <= '1';
                nstate <= WAIT_WRITE_DATA_LO;
            end if;

        when WAIT_WRITE_DATA_LO =>
            if timer_done = '1' then
                timer_start <= '0';
                nstate <= INITIALIZED;
            end if;
        -----------------------------------------------------------------------
        ----------------          Set DDRAM for Read             --------------
        -----------------------------------------------------------------------
        when SEND_SET_DDRAM_ADDR_FOR_READ_DATA_HI =>
            register_select <= '0';
            read_write <= '0';
            db4_7 <= i_ri_ddram_pos_to_read(7 downto 4);
            timer_delay_time <= std_logic_vector(C_EN_PULSE);
            timer_read_write <= '1';
            timer_start <= '1';
            nstate <= PULSE_SET_DDRAM_ADDR_FOR_READ_DATA_HI;

        when PULSE_SET_DDRAM_ADDR_FOR_READ_DATA_HI =>
            if timer_done = '1' then
                timer_start <= '0';
                timer_delay_time <= TIME_SET_DDRAM_ADDR;
                timer_read_write <= '0';
                timer_start <= '1';
                nstate <= WAIT_SET_DDRAM_ADDR_FOR_READ_DATA_HI;
            end if;

        when WAIT_SET_DDRAM_ADDR_FOR_READ_DATA_HI =>
            if timer_done = '1' then
                timer_start <= '0';
                nstate <= SEND_SET_DDRAM_ADDR_FOR_READ_DATA_LO;
            end if;

        when SEND_SET_DDRAM_ADDR_FOR_READ_DATA_LO =>
            db4_7 <= i_ri_ddram_pos_to_read(3 downto 0);
            timer_delay_time <= std_logic_vector(C_EN_PULSE);
            timer_read_write <= '1';
            timer_start <= '1';
            nstate <= PULSE_SET_DDRAM_ADDR_FOR_READ_DATA_LO;

        when PULSE_SET_DDRAM_ADDR_FOR_READ_DATA_LO =>
            if timer_done = '1' then
                timer_start <= '0';
                timer_delay_time <= TIME_SET_DDRAM_ADDR;
                timer_read_write <= '0';
                timer_start <= '1';
                nstate <= WAIT_SET_DDRAM_ADDR_FOR_READ_DATA_LO;
            end if;

        when WAIT_SET_DDRAM_ADDR_FOR_READ_DATA_LO =>
            if timer_done = '1' then
                timer_start <= '0';
                ro_last_ddram_pos <= next_ddram_pos;
                nstate <= SEND_READ_DATA_HI;
            end if;


        -----------------------------------------------------------------------
        --------------------          Read Data              ------------------
        -----------------------------------------------------------------------
        when SEND_READ_DATA_HI =>
            register_select <= '1';
            read_write <= '1';
            db4_7 <= i_symbol_to_write(7 downto 4);
            timer_delay_time <= std_logic_vector(C_EN_PULSE);
            timer_read_write <= '1';
            timer_start <= '1';
            nstate <= PULSE_READ_DATA_HI;

        when PULSE_READ_DATA_HI =>
            if timer_done = '1' then
                timer_start <= '0';
                timer_delay_time <= TIME_READ_DATA_FROM_RAM;
                timer_read_write <= '0';
                timer_start <= '1';
                nstate <= WAIT_READ_DATA_HI;
            end if;

        when WAIT_READ_DATA_HI =>
            if timer_done = '1' then
                timer_start <= '0';
                nstate <= SEND_READ_DATA_LO;
            end if;

        when SEND_READ_DATA_LO =>
            db4_7 <= i_symbol_to_write(3 downto 0);
            timer_delay_time <= std_logic_vector(C_EN_PULSE);
            timer_read_write <= '1';
            timer_start <= '1';
            nstate <= PULSE_READ_DATA_LO;

        when PULSE_READ_DATA_LO =>
            if timer_done = '1' then
                timer_start <= '0';
                timer_delay_time <= TIME_READ_DATA_FROM_RAM;
                timer_read_write <= '0';
                timer_start <= '1';
                nstate <= WAIT_READ_DATA_LO;
            end if;

        when WAIT_READ_DATA_LO =>
            if timer_done = '1' then
                timer_start <= '0';
                nstate <= INITIALIZED;
            end if;
        
        when others =>
            state <= STARTUP;
    end case;
  end process;
  
  -- assign lcd outputs
  o_register_select  <= register_select;
  o_read_write  <= read_write;
  o_read_write_enable  <= timer_enable_out;
  o_db4_7 <= db4_7;
  
  -- assign register outputs
  o_ro_ddram_pos_last_written <= ro_last_ddram_pos;
  o_lcd_initialized <= ro_lcd_initialized;
  o_lcd_busy <= ro_lcd_busy;
  o_ro_lcd_state <= ro_lcd_state;
  o_ro_display_busy <= ro_display_busy;
  o_ro_lcd_error_flag <= ro_lcd_error_flag;
  o_ro_lcd_error_code <= ro_lcd_error_code;
    
end Behavioral;
