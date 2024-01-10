Library IEEE:
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity fixed_comparators is
generic (n_bits : integer := 24);
port (	a : in std_logic_vector(n_bits - 1 downto 0);
		s : in std_logic_vector(1 downto 0);
		o : out std_logic);	
end entity fixed_comparators;

architecture behavioral of fixed_comparators is
	function f_comparators
		(signal a : std_logic_vector(n_bits - 1 downto 0);
		 signal s : std_logic_vector(1 downto 0))
		return std_logic is
			variable o : std_logic := '0';
	begin
		case s is
			when "00" =>
				if unsigned(a) > 16 then
					o := '1';
				end if;
			when "01" =>
				if unsigned(a) > 32 then
					o := '1';
				end if;
			when "10" =>
				if unsigned(a) > 48 then
					o := '1';
				end if;
			when others =>
				o := '0';
			end case;
		return (o);
	end f_comparators;
begin
	o <= f_comparators(a, s);
end behavior;


