
library ieee;
use ieee.std_logic_1164.all;

entity debounce_tb is
end entity ; -- debounce_tb

architecture arch of debounce_tb is

	signal clk       : std_logic := '0';
	signal en        : std_logic;
	signal debounced : std_logic;
	signal state_o   : std_logic_vector(1 downto 0);

	component debouncer is
	generic
	(
		max_count  : integer := 32;
		wait_count : integer := 64
	);
	port
	(
		clk : in std_logic;
		en  : in std_logic;

		debounced : out std_logic;
		state_o   : out std_logic_vector(1 downto 0)
	);
	end component;

begin

	db : debouncer port map(clk, en, debounced, state_o);

	clk <= not clk after 50 ps;

	en <= '0' after 0 ns,
	      '1' after 25 ns,
	      '0' after 50 ns,
	      '1' after 150 ns,
	      '0' after 175 ns,
	      '1' after 250 ns,
	      '0' after 350 ns;

end architecture ; -- arch
