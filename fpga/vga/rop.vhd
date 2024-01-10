library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rop is
	port (
		clk	 : in std_logic;
		res	 : in std_logic;

		lov_eof	 : in std_logic;
		lov_rdy  : out std_logic;
		butt_l	 : in std_logic;
		butt_r	 : in std_logic;

		chip_data   : in std_logic_vector(15 downto 0);
		vga_address : in std_logic_vector(16 downto 0);
	
		display_color   : out std_logic_vector(7 downto 0);
		vga_enable	: in std_logic;
	
		sram_address   : out std_logic_vector(17 downto 0);
		sram_color_in  : out std_logic_vector(7 downto 0);
		sram_color_out : in std_logic_vector(7 downto 0);

		readwrite  : out std_logic;
		enable     : out std_logic
	);
end entity;

architecture structural of rop is
	component address_buffer is
		port (
			reset   : in std_logic;

			input   : in std_logic_vector (15 downto 0);
			output  : out std_logic_vector (15 downto 0);

			hold    : in std_logic
		);
	end component;

	component color_buffer is
		port (
			reset   : in std_logic;

			input   : in std_logic_vector (7 downto 0);
			output  : out std_logic_vector (7 downto 0);

			hold    : in std_logic
		);
	end component;


	component ram_mux is
		port (
			reset    : in std_logic;

			switch   : in std_logic_vector (1 downto 0);
			addr_0   : in std_logic_vector (17 downto 0);
			addr_1   : in std_logic_vector (17 downto 0);
			addr_2   : in std_logic_vector (17 downto 0);
			addr_out : out std_logic_vector (17 downto 0)
		);
	end component;

	component controller is
		port (
			clk     : in std_logic;
			reset   : in std_logic;

			in_hold         : out std_logic;
			out_hold        : out std_logic;
			offset_bit_out  : out std_logic;
			rdy             : out std_logic;
			r_w             : out std_logic;
			sram_enable     : out std_logic;
			mux_switch      : out std_logic_vector (1 downto 0);
			color_byte      : out std_logic_vector (7 downto 0);
			count           : out std_logic_vector (15 downto 0);

			enable          : in std_logic;
			eof_flag        : in std_logic
		);
	end component;

	component eof_detector is
		port (
			clk     : in std_logic;
			reset   : in std_logic;

			butt_l  : in std_logic;
			butt_r  : in std_logic;
			ctr_rdy : in std_logic;
			ctr_eof : out std_logic;
			lov_eof : in std_logic;
			lov_rdy : out std_logic;
			address : in std_logic_vector (15 downto 0)
		);
	end component;

	signal out_hold, in_hold, offset, ctr_eof, ctr_rdy : std_logic;
	signal mux_switch	: std_logic_vector (1 downto 0);
	signal address		: std_logic_vector (15 downto 0);
	signal clearing_addres	: std_logic_vector (15 downto 0);
	signal mux0, mux1, mux2 : std_logic_vector (17 downto 0);

begin

	in_buffer : address_buffer	port map (res, chip_data, address, in_hold);

	out_buffer : color_buffer	port map (res, sram_color_out, display_color, out_hold); 

	-- 00 - counter; 01 - chip; 10 - VGA;
	-- I am connectin that offset bit to the bus so we can swap the buffers with it by
	-- swapping the adresses, by fliping one bit in the address buses; it's also inverted
	-- on the vga so it always points to the other buffer;
	-- This also has to be checked, idk it the ram chips uses small or big endian;
	mux : ram_mux			port map (res, mux_switch, mux0, mux1, mux2,
							sram_address);

	the_controller : controller	port map (clk, res, in_hold, out_hold, offset,
							ctr_rdy, readwrite, enable,
							mux_switch, sram_color_in,
							clearing_addres, vga_enable,
							ctr_eof);

	the_eof_detector : eof_detector	port map (clk, res, butt_l, butt_r, ctr_rdy, ctr_eof,
							lov_eof, lov_rdy, address);
	
	-- This has to be done with those intermidiate signals otherwise compiler craps out
	mux0 <= '0' & offset & clearing_addres;         
	mux1 <= '0' & offset & address;
	mux2 <= '0' & not offset & vga_address;

end architecture;
