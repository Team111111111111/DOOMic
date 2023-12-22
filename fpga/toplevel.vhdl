
library ieee;
use ieee.std_logic_1164.all;

entity toplevel is
port
(
	clk : in std_logic;
	rst : in std_logic;

	-- These are the inputs for both of the buttons that the player has 
	--  access to. They are wired directly to their respective button
	--  debouncer component.
	button_l : in std_logic;
	button_r : in std_logic;

	-- The address bus is a 16 bit input that is wired through a 16 bit
	--  register to the frame buffers.
	address_bus : in std_logic_vector(15 downto 0);

	-- The serial bus is a 14 bit output that is wired directly to the
	--  list of vertices.
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

	component reg14 is
	port 
	(
		reg_in	: in  std_logic_vector (13 downto 0);
		reg_out : out std_logic_vector (13 downto 0);

		clk	  : in std_logic;
		reset : in std_logic
	);
	end component; -- input buffer


	-- These are the outputs of both button debouncers. They are fed
	--  directly into the list of vertices.
	signal debounced_l, debounced_r : std_logic;

	-- This is the 'ready' signal created by the frame buffer component,
	--  it is wired directly into the list of vertices.
	signal lov_ready : std_logic;

begin

	-- Both button debouncers
	l_deb : debouncer port map (clk, button_l, debounced_l); 
	r_deb : debouncer port map (clk, button_r, debounced_r); 

	-- The list of vertices
	vertices : lov port map (clk, rst, lov_out, 
	                         debounced_l, debounced_r, rdy);

end architecture; -- arch
