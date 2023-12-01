

library ieee;
use ieee.std_logic_1164.all;

entity multiplier_tb is
end entity;

architecture adder_tb_arch of multiplier_tb is

	component multiplier is
	port 
	(
		a     : in  std_logic_vector(23 downto 0);
		b     : in  std_logic_vector(23 downto 0);
		r     : out std_logic_vector(23 downto 0);
		inv_r : out std_logic_vector(23 downto 0)
	);
	end component;

	signal in0    : std_logic_vector(23 downto 0);
	signal in1    : std_logic_vector(23 downto 0);
	signal result : std_logic_vector(23 downto 0);
	signal inv_r  : std_logic_vector(23 downto 0);

begin

	bt : multiplier port map (in0, in1, result, inv_r);

	in0 <= "000000000000000000000000" after 0 ns,
	       "000000000000000100001100" after 20 ns,
	       "000000000000001000001100" after 40 ns,
	       "000000000000010000000000" after 60 ns,
	       "000000000000100000000000" after 80 ns,
	       "000000000001000000000000" after 100 ns,
	       "000000000010000000000000" after 120 ns,
	       "000000000100000000000000" after 140 ns,
	       "000000001000000000000000" after 160 ns;

	in1 <= "000000000000000000000000" after 0 ns,
	       "000000000000000100000000" after 20 ns,
	       "000000000000001000000000" after 40 ns,
	       "000000000000010000000000" after 60 ns,
	       "000000000000100000000000" after 80 ns,
	       "000000000001000000000000" after 100 ns,
	       "000000000010000000000000" after 120 ns,
	       "000000000100000000000000" after 140 ns,
	       "000000001000000000000000" after 160 ns;

end; -- multiplier_tb
