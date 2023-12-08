
library ieee;
use ieee.std_logic_1164.all;

entity top_tb is
end entity ; 

architecture arch of top_tb is
	component toplevel is
	port
	(
		clk	 : in std_logic;
		rst	 : in std_logic;
		
		button_l : in std_logic;
		button_r : in std_logic;

		serial_bus : out std_logic_vector (13 downto 0)
	);
	end component;


	signal clk	: std_logic;
	signal rst	: std_logic;
	
	signal button_l	: std_logic;
	signal button_r : std_logic;

	signal serial_bus : std_logic_vector (13 downto 0);

begin

	top_test: toplevel port map(
		clk => clk,
		rst => rst,
		button_l => button_l,
		button_r => button_r
	);

	clk	 <= not clk after 20 ns;

	rst	 <= '1' after 0 ns,
		    '0' after 500 ms;

	button_l <= '0' after 0 ns,
		    '1' after 10000 ms,
		    '0' after 10500 ms;

	button_r <= '0' after 0 ns,
		    '1' after 11000 ms;


end architecture ; -- arch
