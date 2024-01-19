library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity comparator is
   port(a : in  std_logic_vector(21 downto 0);
		b : in	std_logic_vector(21 downto 0);
        o : out std_logic);
end comparator;

architecture behaviour of comparator is
	function f_comparators
		(signal a : std_logic_vector(21 downto 0);
		 signal b : std_logic_vector(21 downto 0))
		return std_logic is
			variable o : std_logic := '0';
	begin
		if unsigned(a) > unsigned(b) then
			o := '1';
		end if;
		return (o);
	end f_comparators;
begin
	o <= f_comparators(a, b);
end behaviour;