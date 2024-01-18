library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cbuf_test is
end entity;

architecture cbuf_test of cbuf_test is
	component color_buffer is
		port (
			reset   : in std_logic;

			input   : in std_logic_vector (7 downto 0);
			output  : out std_logic_vector (7 downto 0);

			hold    : in std_logic
		);
	end component;

	signal reset, hold : std_logic;
	signal input, output : std_logic_vector (7 downto 0);

begin

	the_buffer_of_the_color : color_buffer
		port map ( reset, input, output, hold);

		reset <= '1' after 0 ns,
			 '0' after 100 ns;

		input <= "00000000" after 0 ns,
			 "11010101" after 500 ns,
			 "01010101" after 1 us,
			 "00000000" after 2 us;

		hold <= '0' after 0 ns,
			'1' after 1500 ns;
end architecture;
