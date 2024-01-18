library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity address_buffer is
	port (
		reset	: in std_logic;	

		input	: in std_logic_vector (15 downto 0);
		output	: out std_logic_vector (15 downto 0);
		
		hold	: in std_logic
	);
end entity;

architecture behavioural of address_buffer is

	signal memory : std_logic_vector (15 downto 0);

begin
	process(hold, reset, input, memory)
	begin
		if (reset = '1') then
			output <= "0000000000000000";
			memory <= "0000000000000000";

		elsif (hold = '0') then
			output <= input;
			memory <= input;

		else
			output <= memory;
			memory <= memory;

		end if;
	end process;
end architecture;
