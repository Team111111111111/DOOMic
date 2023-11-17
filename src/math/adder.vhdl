library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package adder_p is
	procedure m_add
	(
		a : in  std_logic_vector(23 downto 0);
		b : in  std_logic_vector(23 downto 0);
		y : out std_logic_vector(23 downto 0);
		c : out std_logic
	);
end adder_p;

package body adder_p is
	procedure m_add
	(
		a : in  std_logic_vector(23 downto 0);
		b : in  std_logic_vector(23 downto 0);
		y : out std_logic_vector(23 downto 0);
		c : out std_logic
	) 
	is
		variable temp_carry : STD_LOGIC := '0';
	begin
		for i in 7 downto 0 loop
			y(i) := a(i) xor b(i) xor temp_carry;
			temp_carry := (a(i) and b(i)) or (a(i) and temp_carry) or (b(i) and temp_carry);
		end loop;
		c := temp_carry;
	end m_add;
end adder_p;