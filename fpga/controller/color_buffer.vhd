library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity color_buffer is
	port (
		reset	: in std_logic;	

		input	: in std_logic_vector (7 downto 0);
		output	: out std_logic_vector (7 downto 0);
		
		hold	: in std_logic
	);
end entity;

architecture behavioural of color_buffer is

	signal memory : std_logic_vector (7 downto 0);

begin
	process(hold, reset)
	begin
		if (reset = '1') then
			output <= "00000000";
			memory <= "00000000";

		elsif (hold = '0') then
			output <= input;
			memory <= input;

		else
			output <= memory;

		end if;
	end process;
end architecture;
