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

		chip_bus : in std_logic_vector (15 downto 0);
			
		hsync	 : out std_logic;
		vsync	 : out std_logic;

		
