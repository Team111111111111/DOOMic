library IEEE;
use IEEE.std_logic_1164.ALL;

entity bitshift_left is
port(
	input  : in  std_logic_vector(15 downto 0);
        output : out std_logic_vector(15 downto 0);
        flag   : out std_logic
);
end bitshift_left;

architecture structural of bitshift_left is
begin
	flag <= input(14);
	output(15) <= input(15);
--	output(22) <= input(21);
--	output(21) <= input(20);
--	output(20) <= input(19);
--	output(19) <= input(18);
--	output(18) <= input(17);
--	output(17) <= input(16);
--	output(16) <= input(15);
--	output(15) <= input(14);
	output(14) <= input(13);
	output(13) <= input(12);
	output(12) <= input(11);
	output(11) <= input(10);
	output(10) <= input(9);
	output(9) <= input(8);
	output(8) <= input(7);
	output(7) <= input(6);
	output(6) <= input(5);
	output(5) <= input(4);
	output(4) <= input(3);
	output(3) <= input(2);
	output(2) <= input(1);
	output(1) <= input(0);
	output(0) <= '0';
end structural;
