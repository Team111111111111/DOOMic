library ieee;
use ieee.std_logic_1164.all;

entity toptop is
port(
   clk : in std_logic;
	  rst : in std_logic;
    clk_6 : in std_logic;
    clk_out : out std_logic;
	-- These are the inputs for both of the buttons that the player has 
	--  access to. They are wired directly to their respective button
	--  debouncer component.
    
	button_l : in std_logic;
	button_r : in std_logic;

    vga_rgb : out std_logic_vector(11 downto 0);
	hsync   : out std_logic;
	vsync   : out std_logic;

	-- The following signals are all outputs of the 'sram' entity. They
	--  are wired directly to the external memory.
	sram_addr : out   std_logic_vector(17 downto 0);
	sram_dq   : inout std_logic_vector(7 downto 0);
	sram_ce_n : out   std_logic;
	sram_oe_n : out   std_logic;
	sram_we_n : out   std_logic;
	sram_ub_n : out   std_logic;
	sram_lb_n : out   std_logic

);
end entity;

architecture arch of toptop is

	component toplevel is
        port
        (
            clk_50 : in std_logic;
            clk_chip : in std_logic;
            clk_25 : in std_logic;
            rst : in std_logic;
        
            -- These are the inputs for both of the buttons that the player has 
            --  access to. They are wired directly to their respective button
            --  debouncer component.
            button_l : in std_logic;
            button_r : in std_logic;
        
            -- This bus is a 16 bit input that holds address data or color data.
            --  The type of data that is sent from the chip over this bus switches
            --  every clock cycle. 
            chip_data_bus : in std_logic_vector(15 downto 0);
        
            -- The serial bus is a 14 bit output that is wired directly to the
            --  list of vertices.
            serial_bus : out std_logic_vector(13 downto 0);
        
            -- These are the ouputs that go to the VGA display.
            -- The 'vga_rgb' output byte is generated by the parent, while 'vsync'
            --  and 'hsync' are generated by the VGA ROP component.
            vga_rgb : out std_logic_vector(7 downto 0);
            hsync   : out std_logic;
            vsync   : out std_logic;
        
            -- The following signals are all outputs of the 'sram' entity. They
            --  are wired directly to the external memory.
            sram_addr : out   std_logic_vector(17 downto 0);
            sram_dq   : inout std_logic_vector(7 downto 0);
            sram_ce_n : out   std_logic;
            sram_oe_n : out   std_logic;
            sram_we_n : out   std_logic;
            sram_ub_n : out   std_logic;
            sram_lb_n : out   std_logic
        );
	end component;

    component chip_top is
        port 
        (
            clk : in std_logic;
            reset : in std_logic;
        
            serial_bus : in std_logic_vector(13 downto 0);
            address : out std_logic_vector(15 downto 0)
        );
    end component;

    component clock_dividers is
        port (
          inclk0 : in std_logic;
          c0 : out std_logic;
          c1 : out std_logic;
          c2 : out std_logic
        );
      end component;

    signal chip_data_bus_signal : std_logic_vector(15 downto 0);
    signal chip_serial_bus_signal : std_logic_vector(13 downto 0);

    signal clk_chip_sig : std_logic;
    signal clk_fpga_sig : std_logic;

    signal clk_100_sig : std_logic;
	signal clk_12_sig : std_logic;
	signal clk_25_sig : std_logic;

begin

    toplevel_inst: toplevel
    port map (
      clk_50           => clk_fpga_sig,
      rst           => not rst,
      clk_chip         => clk_chip_sig,
      clk_25        => clk_25_sig,
      button_l      => not button_l,
      button_r      => not button_r,
      chip_data_bus => chip_data_bus_signal,
      serial_bus    => chip_serial_bus_signal,
      vga_rgb       => vga_rgb(7 downto 0),
      hsync         => hsync,
      vsync         => vsync,
      sram_addr     => sram_addr,
      sram_dq       => sram_dq,
      sram_ce_n     => sram_ce_n,
      sram_oe_n     => sram_oe_n,
      sram_we_n     => sram_we_n,
      sram_ub_n     => sram_ub_n,
      sram_lb_n     => sram_lb_n
    );

    chip_top_inst: chip_top
    port map (
      clk        => clk_chip_sig,
      reset      => not rst,
      serial_bus => chip_serial_bus_signal,
      address    => chip_data_bus_signal
    );

    pll_inst: clock_dividers
	port map (
	  inclk0 => clk,
	  c0     => clk_100_sig,
	  c1    => clk_12_sig,
	  c2 	=> clk_25_sig
	);

    clk_out <= clk;
    vga_rgb(11 downto 8) <= (others => '0');

    clk_chip_sig <= clk_12_sig;
    clk_fpga_sig <= clk_100_sig;


end architecture;



