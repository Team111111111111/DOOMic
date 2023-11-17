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

	function m_2c(a: in std_logic_vector(23 downto 0)) return std_logic_vector;
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

	function m_2c(a: in std_logic_vector(23 downto 0)) 
	return std_logic_vector is
        variable complement: std_logic_vector(23 downto 0);
        variable carry: std_logic := '1';
    begin
        for i in a'range loop
            complement(i) := a(i) xor '1' xor carry;
            carry := (a(i) and carry) or (a(i) and '1') or (carry and '1');
        end loop;

        return (complement);
    end m_2c;
end adder_p;