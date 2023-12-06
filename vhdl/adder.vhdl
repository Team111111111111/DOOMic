
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
generic
(
    n_bits : integer := 24
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
    n_bits : integer := 24
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
