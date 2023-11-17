
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package bitwise_ops is
	function m_and (a : std_logic; b : std_logic) return std_logic;
	function m_or  (a : std_logic; b : std_logic) return std_logic;
	function m_not (a : std_logic) return std_logic;
end package bitwise_ops;

package body bitwise_ops is

	pure function m_and (a : std_logic; b : std_logic) return std_logic is
		variable y : std_logic;
	begin
		y := a and b;
		return (y);
	end;

	pure function m_or (a : std_logic; b : std_logic) return std_logic is
		variable y : std_logic;
	begin
		y := a or b;
		return (y);
	end;

	pure function m_not (a : std_logic) return std_logic is
		variable y : std_logic;
	begin
		y := not a;
		return (y);
	end;

end package body bitwise_ops;
