
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

		rdy	 : in std_logic;

		serial_bus : out std_logic_vector (13 downto 0)
	);
	end component;


	signal clk	: std_logic;
	signal rst	: std_logic;
	
	signal button_l	: std_logic;
	signal button_r : std_logic;

	signal rdy	: std_logic;

	signal serial_bus : std_logic_vector (13 downto 0);

begin

	top_test: toplevel port map(
		clk => clk,
		rst => rst,
		button_l => button_l,
		button_r => button_r,
		rdy => rdy
	);

	clk	 <= '0' after 0 ns,
		    '1' after 20 ns when clk /= '1' else '0' after 20 ns;

	rst	 <= '1' after 0 ns,
		    '0' after 50 us;

	button_l <= '0' after 0 ns,
		    '1' after 1000 us,
		    '0' after 1050 us;

	button_r <= '0' after 0 ns,
		    '1' after 1100 us;

	rdy	 <= '0' after 0 ns,
		    '1' after 51 us;


end architecture ; -- arch
