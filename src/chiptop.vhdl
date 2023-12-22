library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity chip_top is
	port (
	clk : in std_logic;
	reset : in std_logic;

	serial_bus : out std_logic_vector(13 downto 0);
	
