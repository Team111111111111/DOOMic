
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package bitwise_ops is

	function m_and (a, b : std_logic_vector(23 downto 0)) 
	return std_logic_vector;

	function m_or  (a, b : std_logic_vector(23 downto 0)) 
	return std_logic_vector;

	function m_xor  (a, b : std_logic_vector(23 downto 0)) 
	return std_logic_vector;

	function m_not (a : std_logic_vector(23 downto 0)) 
	return std_logic_vector;

end package bitwise_ops;

package body bitwise_ops is

	pure function m_and (a, b : std_logic_vector(23 downto 0)) 
	return std_logic_vector is
		variable y : std_logic_vector(23 downto 0);
	begin
		y := a and b;
		return (y);
	end;

	pure function m_or (a, b : std_logic_vector(23 downto 0)) 
	return std_logic_vector is
		variable y : std_logic_vector(23 downto 0);
	begin
		y := a or b;
		return (y);
	end;

	pure function m_xor (a, b : std_logic_vector(23 downto 0)) 
	return std_logic_vector is
		variable y : std_logic_vector(23 downto 0);
	begin
		y := a xor b;
		return (y);
	end;

	pure function m_not (a : std_logic_vector(23 downto 0)) 
	return std_logic_vector is
		variable y : std_logic_vector(23 downto 0);
	begin
		y := not a;
		return (y);
	end;

end package body bitwise_ops;
