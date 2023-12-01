
library ieee;
use ieee.std_logic_1164.all;

entity multiplier_tester is
port 
(
	a : in  std_logic_vector(23 downto 0);
	b : in  std_logic_vector(23 downto 0);
	r : out std_logic_vector(23 downto 0)
);
end entity ; -- adder_tester

architecture arch of multiplier_tester is
	component multiplier is 
	port
	(
		a : in  std_logic_vector(23 downto 0);
		b : in  std_logic_vector(23 downto 0);
		r : out std_logic_vector(23 downto 0)
	);
	end component;
begin
	
	multiplier_c : multiplier port map(a, b, r);

end architecture ; -- arch

library ieee;
use ieee.std_logic_1164.all;

entity multiplier_tb is
end entity;

architecture adder_tb_arch of multiplier_tb is

	component multiplier_tester is
	port 
	(
		a : in  std_logic_vector(23 downto 0);
		b : in  std_logic_vector(23 downto 0);
		r : out std_logic_vector(23 downto 0)
	);
	end component;

	signal in0    : std_logic_vector(23 downto 0);
	signal in1    : std_logic_vector(23 downto 0);
	signal result : std_logic_vector(23 downto 0);

begin

	bt : multiplier_tester port map (in0, in1, result);

	in0 <= "000000000000000000000000" after 0 ns,
	       "000000000000000000000001" after 20 ns,
	       "000000000000000000000010" after 40 ns,
	       "000000000000000000000100" after 60 ns,
	       "000000000000000000001000" after 80 ns,
	       "000000000000000000010000" after 100 ns,
	       "000000000000000000100000" after 120 ns,
	       "000000000000000001000000" after 140 ns,
	       "000000000000000010000000" after 160 ns;

	in1 <= "000000000000000000000000" after 0 ns,
	       "000000000000000000000001" after 20 ns,
	       "000000000000000000000010" after 40 ns,
	       "000000000000000000000100" after 60 ns,
	       "000000000000000000001000" after 80 ns,
	       "000000000000000000010000" after 100 ns,
	       "000000000000000000000000" after 120 ns,
	       "111111111111111111000000" after 140 ns,
	       "111111111111111111111111" after 160 ns,
	       "111111111111111111111111" after 180 ns;

end; -- multiplier_tb
