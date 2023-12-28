library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity plus_minus is
	port(
	add_1	: in std_logic_vector(15 downto 0);
	add_2	: in std_logic_vector(15 downto 0);
	sub	: in std_logic_vector(15 downto 0);
	result	: out std_logic_vector(15 downto 0));
end entity;


architecture behavioural of plus_minus is

component adder is
	generic(n_bits	: integer := 16);
	port(	a	: in  std_logic_vector(n_bits - 1 downto 0);	
		b	: in std_logic_vector(n_bits - 1 downto 0);
		r	: out std_logic_vector(n_bits - 1 downto 0)
	);
end component;

component complement is
	generic(n_bits	: integer := 16);
	port(	a 	: in  std_logic_vector(n_bits - 1 downto 0);	
		r 	: out std_logic_vector(n_bits - 1 downto 0)
	);
end component;

signal add_r_sig, inverse_r_sig: std_logic_vector(15 downto 0);

begin
	addition: adder port map(
		a => add_1,
		b => add_2,
		r => add_r_sig);

	inverse: complement port map(
		a => sub,
		r => inverse_r_sig);

	subtraction: adder port map(
		a => inverse_r_sig,
		b => add_r_sig,
		r => result);

end architecture behavioural;

	

