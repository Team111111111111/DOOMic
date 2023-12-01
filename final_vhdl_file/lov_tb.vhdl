LIBRARY ieee;                                                       
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;                                       
USE ieee.std_logic_unsigned.all;

entity lov_tb is
end entity lov_tb;

architecture structural of lov_tb is

	component lov is 
		port (
			clk             : in std_logic;                    
			res             : in std_logic;

			serial_bus      : out std_logic_vector (13 downto 0);               
			left            : in std_logic;                    
			right           : in std_logic;
			rdy             : in std_logic                     
			);

	end component lov;

	signal clk, res, left, right, rdy : std_logic;
	signal serial_bus : std_logic_vector (13 downto 0);

begin
	clk 	<= '1' after 0 ns,
	       	   '0' after 10 ns when clk /= '0' else '1' after 10 ns;

	res	<= '1' after 0 ns,
		   '1' after 100 ns;

	left	<= '0' after 0 ns;

	right	<= '0' after 0 ns,
		   '1' after 100 us;

	rdy	<= '0' after 0 ns,
	           '1' after 1 us;


	L1: lov port map ( clk		=> clk,
			   res		=> res,
			   serial_bus	=> serial_bus,
			   left		=> left,
			   right	=> right,
			   rdy		=> rdy);

end architecture;
