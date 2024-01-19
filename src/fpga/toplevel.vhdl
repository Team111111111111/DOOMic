library ieee;
use ieee.std_logic_1164.all;

entity toplevel is
port
(
	clk_50 : in std_logic;
	rst : in std_logic;

	clk_25:out std_logic;
	clk_6:in std_logic;
	clk_100:out std_logic;

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
	-- 
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
end entity; -- toplevel

architecture arch of toplevel is

	component clock_dividers is
	  port (
		inclk0 : in std_logic;
		c0 : out std_logic;
		c1 : out std_logic;
		c2 : out std_logic
	  );
	end component;

	component debouncer is
	generic
	(
		max_count  : integer := 32;
		wait_count : integer := 64
	);
	port
	(
		clk : in std_logic;
		en  : in std_logic;

		debounced : out std_logic
	);
	end component; -- debouncer

	component lov is -- means 'list of all verticies'
	port 
	(
		clk	: in std_logic;
		res	: in std_logic;

		serial_bus : out std_logic_vector (13 downto 0);
		eof_flag   : out std_logic;
		left       : in  std_logic;
		right      : in  std_logic;
		rdy        : in  std_logic
	);
	end component; -- lov

	component rop is
	port
	(
		clk      : in std_logic;
                res      : in std_logic;

                lov_eof  : in std_logic;
                lov_rdy  : out std_logic;
                butt_l   : in std_logic;
                butt_r   : in std_logic;

                chip_data   : in std_logic_vector(15 downto 0);
                vga_address : in std_logic_vector(16 downto 0);

                display_color   : out std_logic_vector(7 downto 0);
                vga_enable      : in std_logic;

                sram_address   : out std_logic_vector(17 downto 0);
                sram_color_in  : out std_logic_vector(7 downto 0);
                sram_color_out : in std_logic_vector(7 downto 0);

                readwrite  : out std_logic;
                enable     : out std_logic
	);
	end component; -- parent

	component syncpulses is
	port 
	(
		clk_6 : in std_logic;
		clk_25 : in std_logic;
		res : in std_logic;

		-- These are wired directly to the VGA display
		hsync : out std_logic;
		vsync : out std_logic;

		-- This output is wired directly to the 'vga_address' input
		--  of the 'parent' component.
		screen_address : out std_logic_vector(16 downto 0)
	);    
	end component; -- syncpulses

	component sram is
	port
	(
		clk : in std_logic;
		res : in std_logic;
		
		data_in  : in std_logic_vector(7 downto 0);
		data_out : out std_logic_vector(7 downto 0);
		address  : in std_logic_vector(17 downto 0);

		readwrite  : in std_logic;
		enable     : in std_logic;
		
		sram_addr : out   std_logic_vector(17 downto 0);
		sram_dq   : inout std_logic_vector(7 downto 0);
		sram_ce_n : out   std_logic;
		sram_oe_n : out   std_logic;
		sram_we_n : out   std_logic;
		sram_ub_n : out   std_logic;
		sram_lb_n : out   std_logic
		
	);
	end component; -- sram

	signal clk_100_sig : std_logic;
	signal clk_25_sig : std_logic;
	-- These are the outputs of both button debouncers. They are fed
	--  directly into the list of vertices.
	signal debounced_l, debounced_r : std_logic;

	-- This is the 'ready' signal created by the frame buffer component,
	--  it is wired directly into the list of vertices.
	signal lov_rdy : std_logic;

	-- This is the 'screen_address' output of the syncpulses entity 
	--  (the 'vga_sp' component), it is wired directly to the 'vga_parent'
	--  component
	signal screen_address : std_logic_vector(16 downto 0);

	-- This is needed because vsync is connected to the output and to the rop
	signal vsync_signal : std_logic;

	-- This signal is to send eof flag from the lov to vga
	signal eof_flag : std_logic;

	signal vga_rgb_color : std_logic_vector(7 downto 0);
	signal ram_address  : std_logic_vector(17 downto 0);

	-- These are the color that are being sent/received between the parent
	--  and the sram entity.
	signal ram_color_in  : std_logic_vector(7 downto 0); -- from sram to parent
	signal ram_color_out : std_logic_vector(7 downto 0); -- from parent to sram

	signal ram_readwrite  : std_logic;
	signal ram_enable : std_logic;

begin

	-- Both button debouncers
	l_deb : debouncer port map (clk_6, button_l, debounced_l); 
	r_deb : debouncer port map (clk_6, button_r, debounced_r); 

	-- The list of vertices
	-- WARNING: The 'lov_rdy' signal is not mapped to any other
	--  component nor is it given any value!
	vertices : lov port map (clk_6,  rst, serial_bus, eof_flag, 
	                         debounced_l, debounced_r, lov_rdy);

	-- The VGA output rendering unit (syncpulses)
	syncpulses_inst: syncpulses
	port map (
	  clk_6          => clk_6,
	  clk_25         => clk_25_sig,
	  res            =>  rst,
	  hsync          => hsync,
	  vsync          => vsync_signal,
	  screen_address => screen_address
	);

	-- The VGA rop top entity entity
	vga_rop : rop port map(clk_50,  rst, eof_flag, lov_rdy, debounced_l, debounced_r,
							chip_data_bus, screen_address,
	                        vga_rgb_color, vsync_signal, ram_address, ram_color_in,
	                        ram_color_out, ram_readwrite, ram_enable);

	-- The SRAM entity
	memory_c : sram port map(clk_50,  rst, ram_color_in, ram_color_out, 
	                         ram_address, ram_readwrite,
	                         ram_enable, sram_addr, sram_dq, sram_ce_n,
	                         sram_oe_n, sram_we_n, sram_ub_n, sram_lb_n);
						
	pll_inst: clock_dividers
	port map (
	  inclk0 => clk_50,
	  c0     => clk_100_sig,
	  c2 	=> clk_25_sig
	);

	vsync <= vsync_signal;

	vga_rgb <= ("00000000") when screen_address = ("11111111111111111") else vga_rgb_color;

	clk_25 <= clk_25_sig;
	clk_100 <= clk_100_sig;
end architecture; -- arch
