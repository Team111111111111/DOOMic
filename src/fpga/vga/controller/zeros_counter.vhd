-- This is no longer used. The controller now does the counting
-- job so the counting is done at the correct transition and in
-- the correct tempo - VGA clock not the ram clock.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity zeros_counter is
	port (
		clk	: in std_logic;
		reset	: in std_logic;

		count	: out std_logic_vector (15 downto 0);
		zeroed	: out std_logic
	);
end entity zeros_counter;

architecture behavioural of zeros_counter is

	signal new_value, value : unsigned (15 downto 0);

begin
	process (clk, reset)
	begin
		if (rising_edge(clk)) then
			value <= new_value;

		end if;
	end process;

	process (value)
	begin
		if (reset = '1') then
			new_value <= "0000000000000000";
			zeroed	  <= '0';

		elsif (value > 64000) then
			new_value <= "0000000000000000";
			zeroed	  <= '1';
		else
			new_value <= value + 1;
			zeroed	  <= '0';
		end if;
	end process;

	count <= std_logic_vector(value);

end architecture;
