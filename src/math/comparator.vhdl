library IEEE;
use IEEE.std_logic_1164.ALL;

entity m_comparator is
generic(n_bits	:	integer := 23);
   port(a   : in  std_logic_vector(n_bits downto 0);
        b   : in  std_logic_vector(n_bits downto 0);
        ala : out std_logic);
end m_comparator;

library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of m_comparator is
	function fm_comparator 
		(signal a, b: std_logic_vector (n_bits downto 0)) 
			return std_logic is
		variable ala: std_logic := '0';
		variable pala: std_logic_vector (n_bits downto 0);
		variable bnla: std_logic := '1';
	begin
		for i in a'range loop
			pala(n_bits - i) := a(n_bits - i) and 
(not b(n_bits - i)) and bnla;
			bnla := bnla and (a(n_bits - i) or 
(not b(n_bits - i)));
			ala := ala or pala(n_bits - i);
		end loop;
		return (ala);
	end fm_comparator;
begin
	ala <= fm_comparator(a, b);
end behaviour;
