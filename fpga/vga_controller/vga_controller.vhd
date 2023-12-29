library ieee;
use ieee.std_logic_1164.all;

entity vga_controller is
	port (
		clk	: in std_logic;
		reset	: in std_logic; 
		
		zeroed	: in std_logic;
		c_res	: out std_logic;
		in_hold	: out std_logic;
		o_hold	: out std_logic;
		rdy	: out std_logic;
		r_w	: out std_logic;
		ram_en 	: out std_logic;
		offset	: out std_logic;
		
