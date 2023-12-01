
library ieee;
use ieee.std_logic_1164.all;

entity adder_tester is
port 
(
	clk  : in std_logic;
	a, b : in std_logic_vector(23 downto 0);

	r   : out std_logic_vector(23 downto 0);
	m2c : out std_logic_vector(23 downto 0);
	c   : out std_logic
);
end entity ; -- adder_tester

architecture arch of adder_tester is
	component adder is 
	port
	(
		a : in  std_logic_vector(23 downto 0);
		b : in  std_logic_vector(23 downto 0);
		r : out std_logic_vector(23 downto 0)
	);
	end component;
	component complement is
	port
	(
		a : in  std_logic_vector(23 downto 0);
		r : out std_logic_vector(23 downto 0)
	);
	end component; -- complement
begin
	
	adder_c : adder port map(a, b, r);
	complement_c : complement port map(a, m2c);

end architecture ; -- arch

library ieee;
use ieee.std_logic_1164.all;

entity adder_tb is
end entity;

architecture adder_tb_arch of adder_tb is

	component adder_tester is
	port 
	(
		clk  : in std_logic;
		a, b : in std_logic_vector(23 downto 0);

		r   : out std_logic_vector(23 downto 0);
		m2c : out std_logic_vector(23 downto 0);
		c   : out std_logic
	);
	end component;

	signal in0    : std_logic_vector(23 downto 0);
	signal in1    : std_logic_vector(23 downto 0);
	signal result : std_logic_vector(23 downto 0);
	signal comp   : std_logic_vector(23 downto 0);
	signal carry  : std_logic;

	signal clk : std_logic := '0';

begin

	clk <= not clk after 1 ns;
	bt : adder_tester port map (clk, in0, in1, result, comp, carry);

	in0 <= "000000000000000000000000" after 0 ns,
	       "000000000000000000000001" after 20 ns,
	       "000000000000000000000010" after 40 ns,
	       "000000000000000000000100" after 60 ns,
	       "000000000000000000001000" after 80 ns;

	in1 <= "000000000000000000000000" after 0 ns,
	       "000000000000000000000001" after 20 ns,
	       "000000000000000000000010" after 40 ns,
	       "000000000000000000000100" after 60 ns,
	       "000000000000000000001000" after 80 ns;

end; -- bitwise_tb
