----------------------------------------------------------------------------------
-- Engineers: Fabian Becker, Nicolas Koch
-- 
-- Module Name: as - arch
-- Project Name: AS - an AXI IP for PMod MaxSonar
-- Target Devices: Arty A7-100
-- Description: 
--  The original file was taken from the project given to us in the interrupts lab. We added the instantiation of our own IP-Core
--  and created the needed signals. 
--
--  This is the top-level module of our IP and combines the VHDL Logic and the AXI Slave Interface.
--
-- Verison 1.0 - File Created
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity as is
    generic (
        -- Parameters of Axi Slave Bus Interface S00_AXI
        C_S00_AXI_DATA_WIDTH  : integer := 32;
        C_S00_AXI_ADDR_WIDTH  : integer := 6;
        
        -- Parameters of the UART Receiver
        C_AS_UART_BAUDRATE_DIVISOR: integer := 651; -- 100 MHz / 9600 Baud / 16 (oversampling rate) ~ 651
        C_AS_UART_NUM_DATA_BITS: integer := 8;
        
        -- Timing Constraints Initialisation
        C_AS_CONTROL_MS_DIVISOR: integer := 100_000; -- @ 100 MHz -> 1 ms
        C_AS_CONTROL_POWER_UP_TIME : integer := 250; -- 1. 250 ms power-up delay
        C_AS_CONTROL_CALIBRATION_TIME : integer := 49; -- 2. 49 ms calibration cycle
        C_AS_CONTROL_FIRST_READING_TIME : integer := 100; -- 100 ms first reading delay 
        
        -- Timing Constraints Reading
        -- The sensor checks if tx is high every 49 ms and then proceeds to measure or not
        -- during manual reading (no auto_restart) we may just miss the the 1 check one clock
        -- Furthermore the reading stops in the middle of the stop bit + 2 clock cycles, so if the IP is instantly restarted
        -- we need to add some additional timing to be safe, this takes < 1 ms, so 1 ms will suffice
        C_AS_CONTROL_RANGE_READING_TIME : integer := 99 -- 49 ms range reading time * 2 + 1
    );
    port (
        -- I/O ports
        i_rx: in std_logic;
        o_tx: out std_logic;
        o_interrupt: out std_logic; -- doesn't work in this version of the IP

        -- Ports of Axi Slave Bus Interface S00_AXI
        s00_axi_aclk  : in std_logic;
        s00_axi_aresetn : in std_logic;
        s00_axi_awaddr  : in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
        s00_axi_awprot  : in std_logic_vector(2 downto 0);
        s00_axi_awvalid : in std_logic;
        s00_axi_awready : out std_logic;
        s00_axi_wdata : in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
        s00_axi_wstrb : in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
        s00_axi_wvalid  : in std_logic;
        s00_axi_wready  : out std_logic;
        s00_axi_bresp : out std_logic_vector(1 downto 0);
        s00_axi_bvalid  : out std_logic;
        s00_axi_bready  : in std_logic;
        s00_axi_araddr  : in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
        s00_axi_arprot  : in std_logic_vector(2 downto 0);
        s00_axi_arvalid : in std_logic;
        s00_axi_arready : out std_logic;
        s00_axi_rdata : out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
        s00_axi_rresp : out std_logic_vector(1 downto 0);
        s00_axi_rvalid  : out std_logic;
        s00_axi_rready  : in std_logic    
    );
end as;

architecture arch of as is

    -- AXI Interface
    component as_S00_AXI is
        generic (
        C_S_AXI_DATA_WIDTH  : integer := 32;
        C_S_AXI_ADDR_WIDTH  : integer := 6
        );
        port (
        S_AXI_ACLK  : in std_logic;
        S_AXI_ARESETN : in std_logic;
        S_AXI_AWADDR  : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
        S_AXI_AWPROT  : in std_logic_vector(2 downto 0);
        S_AXI_AWVALID : in std_logic;
        S_AXI_AWREADY : out std_logic;
        S_AXI_WDATA : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        S_AXI_WSTRB : in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
        S_AXI_WVALID  : in std_logic;
        S_AXI_WREADY  : out std_logic;
        S_AXI_BRESP : out std_logic_vector(1 downto 0);
        S_AXI_BVALID  : out std_logic;
        S_AXI_BREADY  : in std_logic;
        S_AXI_ARADDR  : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
        S_AXI_ARPROT  : in std_logic_vector(2 downto 0);
        S_AXI_ARVALID : in std_logic;
        S_AXI_ARREADY : out std_logic;
        S_AXI_RDATA : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        S_AXI_RRESP : out std_logic_vector(1 downto 0);
        S_AXI_RVALID  : out std_logic;
        S_AXI_RREADY  : in std_logic;
        --
        --GSCR Signals 
        o_ap_start : out std_logic;
        i_ap_idle : in std_logic;
        i_ap_done : in std_logic;      
        o_auto_restart : out std_logic;
        
        -- SCSR0
        i_powerup_done: in std_logic;
        i_calib_done: in std_logic;
        i_read_valid: in std_logic;
        o_reset_ip: out std_logic;
        o_freeze_ip: out std_logic;
        
        -- DIST0
        i_dist_in: in std_logic_vector(7 downto 0);
        i_dist_char_1: in std_logic_vector(7 downto 0);
        i_dist_char_2: in std_logic_vector(7 downto 0);
        i_dist_char_3: in std_logic_vector(7 downto 0);
        
        -- UCSR
        i_ur_error: in std_logic;
        i_ur_data: in std_logic_vector(7 downto 0);
        
        -- ADSR
        i_ad_error: in std_logic;
        i_ad_err_pos: in std_logic_vector(5 downto 0);
        i_ad_err_char: in std_logic_vector(7 downto 0);
        
        --
        interrupt: out std_logic
        --  
        );
    end component as_S00_AXI;

    -- IP Core
    component as_core is
        generic (
            UART_BAUDRATE_DIVISOR: integer;
            UART_NUM_DATA_BITS: integer;
            CONTROL_MS_DIVISOR: integer;
            CONTROL_POWER_UP_TIME : integer;
            CONTROL_CALIBRATION_TIME : integer;
            CONTROL_FIRST_READING_TIME : integer;
            CONTROL_RANGE_READING_TIME : integer
        );
        port ( 
            -- AXI 
            i_clk: in std_logic;
            i_reset: in std_logic;
            
            -- GCSR
            i_ap_start: in std_logic;
            o_ap_idle: out std_logic;
            o_ap_done: out std_logic;        
            i_auto_restart: in std_logic;
            
            -- SCSR0
            o_powerup_done: out std_logic;
            o_calib_done: out std_logic;
            o_read_valid: out std_logic;
            i_reset_ip: in std_logic;
            i_freeze_ip: in std_logic;
     
            -- DIST0
            o_dist_in: out std_logic_vector(7 downto 0);
            o_dist_char_1: out std_logic_vector(7 downto 0);
            o_dist_char_2: out std_logic_vector(7 downto 0);
            o_dist_char_3: out std_logic_vector(7 downto 0);
     
           -- UCSR Signals
           o_ur_error: out std_logic;
           o_ur_data: out std_logic_vector(7 downto 0);
     
           -- ADSR Signals
           o_ad_error: out std_logic;
           o_ad_err_pos: out std_logic_vector(5 downto 0);
           o_ad_err_char: out std_logic_vector(7 downto 0);

           -- I/Os
            i_rx: in std_logic;
            o_tx: out std_logic
        );
    end component;  
 
   -- GCSR Signals
   signal w_reset : std_logic;
   signal w_ap_start : std_logic;
   signal w_ap_idle : std_logic;
   signal w_ap_done : std_logic; 
   signal w_auto_restart : std_logic;
   
   -- SCSR0 Signals
   signal w_powerup_done : std_logic;
   signal w_calib_done : std_logic;
   signal w_read_valid : std_logic;
   signal w_reset_ip: std_logic;
   signal w_freeze_ip: std_logic;
   
   -- DIST0 Signals
   signal w_dist_in: std_logic_vector(7 downto 0);
   signal w_dist_char_1: std_logic_vector(7 downto 0);
   signal w_dist_char_2: std_logic_vector(7 downto 0);
   signal w_dist_char_3: std_logic_vector(7 downto 0);
   
   -- UCSR Signals
   signal w_ur_error: std_logic;
   signal w_ur_data: std_logic_vector(7 downto 0);
   
   -- ADSR Signals
   signal w_ad_error: std_logic;
   signal w_ad_err_pos: std_logic_vector(5 downto 0);
   signal w_ad_err_char: std_logic_vector(7 downto 0);
   
   -- Interrupt Signals
   signal w_interrupt: std_logic;

   -- I/O Signals
   signal w_tx: std_logic;
 
begin

    -- Instantiation of Axi Bus Interface S00_AXI
    AS_S00_AXI_INST : as_S00_AXI
    generic map (
        C_S_AXI_DATA_WIDTH  => C_S00_AXI_DATA_WIDTH,
        C_S_AXI_ADDR_WIDTH  => C_S00_AXI_ADDR_WIDTH
    )
    port map (
        S_AXI_ACLK  => s00_axi_aclk,
        S_AXI_ARESETN => s00_axi_aresetn,
        S_AXI_AWADDR  => s00_axi_awaddr,
        S_AXI_AWPROT  => s00_axi_awprot,
        S_AXI_AWVALID => s00_axi_awvalid,
        S_AXI_AWREADY => s00_axi_awready,
        S_AXI_WDATA => s00_axi_wdata,
        S_AXI_WSTRB => s00_axi_wstrb,
        S_AXI_WVALID  => s00_axi_wvalid,
        S_AXI_WREADY  => s00_axi_wready,
        S_AXI_BRESP => s00_axi_bresp,
        S_AXI_BVALID  => s00_axi_bvalid,
        S_AXI_BREADY  => s00_axi_bready,
        S_AXI_ARADDR  => s00_axi_araddr,
        S_AXI_ARPROT  => s00_axi_arprot,
        S_AXI_ARVALID => s00_axi_arvalid,
        S_AXI_ARREADY => s00_axi_arready,
        S_AXI_RDATA => s00_axi_rdata,
        S_AXI_RRESP => s00_axi_rresp,
        S_AXI_RVALID  => s00_axi_rvalid,
        S_AXI_RREADY  => s00_axi_rready,
        --
        --GSCR Signals 
        o_ap_start => w_ap_start,
        i_ap_idle => w_ap_idle,
        i_ap_done => w_ap_done,   
        o_auto_restart => w_auto_restart,
        
        -- SCSR0
        i_powerup_done => w_powerup_done,
        i_calib_done => w_calib_done,
        i_read_valid => w_read_valid,
        o_reset_ip => w_reset_ip,
        o_freeze_ip => w_freeze_ip,
        
        -- DIST0
        i_dist_in => w_dist_in,
        i_dist_char_1 => w_dist_char_1,
        i_dist_char_2 => w_dist_char_2,
        i_dist_char_3 => w_dist_char_3,
        
        -- UCSR
        i_ur_error => w_ur_error,
        i_ur_data => w_ur_data,
        
        -- ADSR
        i_ad_error => w_ad_error,
        i_ad_err_pos => w_ad_err_pos,
        i_ad_err_char => w_ad_err_char,
        
        --
        interrupt => w_interrupt
        --  
    );

    -- Instantiation of IP
    w_reset <= not s00_axi_aresetn;

    AS_CORE_INST: as_core
        generic map (
            UART_BAUDRATE_DIVISOR => C_AS_UART_BAUDRATE_DIVISOR,
            UART_NUM_DATA_BITS => C_AS_UART_NUM_DATA_BITS,
            CONTROL_MS_DIVISOR => C_AS_CONTROL_MS_DIVISOR,
            CONTROL_POWER_UP_TIME => C_AS_CONTROL_POWER_UP_TIME,
            CONTROL_CALIBRATION_TIME => C_AS_CONTROL_CALIBRATION_TIME,
            CONTROL_FIRST_READING_TIME => C_AS_CONTROL_FIRST_READING_TIME,
            CONTROL_RANGE_READING_TIME => C_AS_CONTROL_RANGE_READING_TIME
        )
        port map(
            -- AXI 
            i_clk => s00_axi_aclk,
            i_reset => w_reset,
            
            -- GCSR
            i_ap_start => w_ap_start,
            o_ap_idle => w_ap_idle,
            o_ap_done => w_ap_done,      
            i_auto_restart => w_auto_restart,
            
            -- SCSR0
            o_powerup_done => w_powerup_done,
            o_calib_done => w_calib_done,
            o_read_valid => w_read_valid,
            i_reset_ip => w_reset_ip,
            i_freeze_ip => w_freeze_ip,
    
            -- DIST0
            o_dist_in => w_dist_in,
            o_dist_char_1 => w_dist_char_1,
            o_dist_char_2 => w_dist_char_2,
            o_dist_char_3 => w_dist_char_3,
    
            -- UCSR Signals
            o_ur_error => w_ur_error,
            o_ur_data => w_ur_data,
        
            -- ADSR Signals
            o_ad_error => w_ad_error,
            o_ad_err_pos => w_ad_err_pos,
            o_ad_err_char => w_ad_err_char,

            -- I/Os
            i_rx => i_rx,
            o_tx => w_tx
        );

    o_tx <= w_tx;
    o_interrupt <= w_interrupt;
    
end arch;
