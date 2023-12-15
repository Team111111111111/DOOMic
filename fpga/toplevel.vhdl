
library ieee;
use ieee.std_logic_1164.all;

entity toplevel is
port
(
	clk : in std_logic;
	rst : in std_logic;

	button_l : in std_logic;
	button_r : in std_logic;

	serial_bus : out std_logic_vector(13 downto 0)
);
end entity; -- toplevel

architecture arch of toplevel is

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

		debounced : out std_logic
	);
	end component; -- debouncer

	component lov is -- means 'list of all verticies'
	port 
	(
		clk	: in std_logic;
		res	: in std_logic;

		serial_bus : out std_logic_vector (13 downto 0);
		left       : in  std_logic;
		right      : in  std_logic;
		rdy        : in  std_logic
	);
	end component; -- lov

	-- These are the outputs of both debouncers
	-- They are fed directly into the `lov` component
	signal debounced_l, debounced_r : std_logic;

	-- WARNING: This signal is assigned to the `rdy` input of the `lov` 
	--  component, but is not assigned to an output of any other component
	signal lov_ready : std_logic;

begin

	l_deb : debouncer port map (clk, button_l, debounced_l); 
	r_deb : debouncer port map (clk, button_r, debounced_r); 

	vertices : lov port map (clk, rst, serial_bus, 
	                         debounced_l, debounced_r, lov_ready);

end architecture; -- arch