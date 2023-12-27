Library IEEE:
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

package fixed_comparators is
generic(n_bits : integer := 24);
	
	function m_la_16 (a: std_logic_vector(n_bits - 1 downto 0))
	return std_logic;

	function m_la_32 (a: std_logic_vector(n_bits - 1 downto 0))
	return std_logic;

	function m_la_48 (a: std_logic_vector(n_bits - 1 downto 0))
	return std_logic;

end package fixed_comparators;

package body fixed_comparators is
generic(n_bits : integer := 24);

	pure function m_la_16 (a: std_logic_vector(n_bits - 1 downto 0))
	return std_logic is
		variable y: std_logic := '0';
	begin
		if (unsigned(a) > 16) then
			y := '1';
		end if;
		return (y);
	end function;

	pure function m_la_32 (a: std_logic_vector(n_bits - 1 downto 0))
	return std_logic is
		variable y: std_logic := '0';
	begin
		if (unsigned(a) > 32) then
			y := '1';
		end if;
		return (y);
	end function;

	pure function m_la_48 (a: std_logic_vector(n_bits - 1 downto 0))
	return std_logic is
		variable y: std_logic := '0';
	begin
		if (unsigned(a) > 48) then
			y := '1';
		end if;
		return (y);
	end function;
end package body fixed comparators;
