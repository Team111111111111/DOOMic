library IEEE;
use IEEE.std_logic_1164.ALL;

entity multiplexer is
   port(a : in  std_logic_vector(15 downto 0);
	b : in  std_logic_vector(15 downto 0);
	s : in std_logic;
	output : out std_logic_vector(15 downto 0)
);
end multiplexer;

library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of multiplexer is
begin
	output <= b when (s = '1') else a;

end behaviour;

