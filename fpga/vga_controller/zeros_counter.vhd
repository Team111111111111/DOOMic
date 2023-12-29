library ieee;
use ieee.std_logic_1164.all;

entity zeros_counter is
	port (
		clk	: in std_logic;
		reset	: in std_logic;

		value	: out std_logic_vector (15 downto 0);
		zeroed	: out std_logic
	);
end entity zeros_counter;

architecture behavioural of zeros_counter is

	signal new_value : std_logic_vector (15 downto 0);

	process (clk, reset)
	begin
		if (rising_edge(clk)) then
			value <= new_value;

		end if;
	end process;

	process (value)
		if (reset = '1') then
			new_value <= "0000000000000000";
			zeroed	  <= '0';

		elsif (unsigned(value) > 64000) then
			new_value <= "0000000000000000";
			zeroed	  <= '1';
		else
			new_value <= value + 1;
			zeroed	  <= '0';
		end if;
	end process;
end architecture;
