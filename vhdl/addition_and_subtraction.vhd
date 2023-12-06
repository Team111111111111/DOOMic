
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
generic
(
    n_bits : integer := 16
);
port
(
	a : in  std_logic_vector(n_bits - 1 downto 0);
	b : in  std_logic_vector(n_bits - 1 downto 0);
	r : out std_logic_vector(n_bits - 1 downto 0)
);
end entity adder;

architecture behavioral of adder is
begin
    r <= std_logic_vector(signed(a) + signed(b));
end architecture behavioral;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity complement is
generic
(
    n_bits : integer := 16
);
port
(
	a : in  std_logic_vector(n_bits - 1 downto 0);
	r : out std_logic_vector(n_bits - 1 downto 0)
);
end entity ; -- complement

architecture behavioral of complement is
signal tmp : std_logic_vector(n_bits - 1 downto 0);
begin
	tmp <= not a;
	r   <= std_logic_vector(unsigned(tmp) + 1);
end architecture ; -- behavioral


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adders is
	port(
	add_1	: in std_logic_vector(15 downto 0);
	add_2	: in std_logic_vector(15 downto 0);
	sub	: in std_logic_vector(15 downto 0);
	sel	: in std_logic;
	result	: out std_logic_vector(15 downto 0));
end entity;


architecture behavioural of adders is

component adder is
	port(
		a  : in  std_logic_vector(15 downto 0);	
		b : in std_logic_vector(15 downto 0);
		r  : out std_logic_vector(15 downto 0)
	);
end component;

component complement is
	port(
		a  : in  std_logic_vector(15 downto 0);	
		r : out std_logic_vector(15 downto 0)
	);
end component;

signal add_r_sig, inverse_r_sig, sub_r_sig : std_logic_vector(15 downto 0);

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
		r => sub_r_sig);
process(sel)
begin
	if (sel = '1') then
		result <= sub_r_sig;
	else
		result <= add_r_sig;
	end if;
end process;
end architecture behavioural;


	

