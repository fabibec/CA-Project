library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_lcd_top is
end entity;

architecture sim of tb_lcd_top is
    -- Component under test
    component lcd_top
        Port (
            i_clk       : in  std_logic;
            i_reset     : in  std_logic;
            o_lcd_db4_7 : out std_logic_vector(3 downto 0);
            o_lcd_rs    : out std_logic;
            o_lcd_rw    : out std_logic;
            o_lcd_e     : out std_logic;
            o_led_init : out std_logic;
            o_led_busy  : out std_logic;
            o_led_done  : out std_logic
        );
    end component;

    -- Signals
    signal clk         : std_logic := '0';
    signal reset       : std_logic := '0';
    signal lcd_db4_7   : std_logic_vector(3 downto 0);
    signal lcd_rs      : std_logic;
    signal lcd_rw      : std_logic;
    signal lcd_e       : std_logic;
    signal led_init   : std_logic;
    signal led_busy    : std_logic;
    signal led_done    : std_logic;

    constant CLK_PERIOD : time := 10 ns;

begin
    -- DUT instantiation
    uut: lcd_top
        port map (
            i_clk       => clk,
            i_reset     => reset,
            o_lcd_db4_7 => lcd_db4_7,
            o_lcd_rs    => lcd_rs,
            o_lcd_rw    => lcd_rw,
            o_lcd_e     => lcd_e,
            o_led_init => led_init,
            o_led_busy  => led_busy,
            o_led_done  => led_done
        );

    -- Clock generation
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Step 1: Reset the system
        reset <= '1';
        wait for 50 ns;
        reset <= '0';
        wait for 50 ns;

        -- Wait for some time to observe behavior
        wait for 50 ms;

        -- End simulation
        wait;
    end process;

end architecture;
