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
		vga_address : in std_logic_vector(15 downto 0);
	
		display_color   : out std_logic_vector(7 downto 0);
		vga_enable	: in std_logic;
	
		sram_address   : out std_logic_vector(17 downto 0);
		sram_color_in  : out std_logic_vector(7 downto 0);
		sram_color_out : out std_logic_vector(7 downto 0);

		readwrite  : out std_logic;
		enable     : out std_logic;
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

	signal out_hold, in_hold, offset, ctrl_eof, ctrl_rdy : std_logic;
	signal mux_switch : std_logic_vector (1 downto 0);
	signal address : std_logic_vector (15 downto 0);


