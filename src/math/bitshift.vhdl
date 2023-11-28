library IEEE;
use IEEE.std_logic_1164.ALL;

entity bitshift8_l is
port
(
	input : in  std_logic_vector (23 downto 0);
	output : out std_logic_vector(23 downto 0)
);
end bitshift8_l;

architecture structural of bitshift8_l is
begin

	output(0) <= '0';
	output(1) <= '0';
	output(2) <= '0';
	output(3) <= '0';
	output(4) <= '0';
	output(5) <= '0';
	output(6) <= '0';
	output(7) <= '0';
	output(8) <= input(0);
	output(9) <= input(1);
	output(10) <= input(2);
	output(11) <= input(3);
	output(12) <= input(4);
	output(13) <= input(5);
	output(14) <= input(6);
	output(15) <= input(7);
	output(16) <= input(8);
	output(17) <= input(9);
	output(18) <= input(10);
	output(19) <= input(11);
	output(20) <= input(12);
	output(21) <= input(13);
	output(22) <= input(14);
	output(23) <= input(15);

end structural;


library IEEE;
use IEEE.std_logic_1164.ALL;

entity bitshift8_r is
port(
	input  : in  std_logic_vector(23 downto 0);
        output : out std_logic_vector(23 downto 0)
);
end bitshift8_r;

architecture structural of bitshift8_r is
begin
	output(0) <= input(8);
	output(1) <= input(9);
	output(2) <= input(10);
	output(3) <= input(11);
	output(4) <= input(12);
	output(5) <= input(13);
	output(6) <= input(14);
	output(7) <= input(15);
	output(8) <= input(16);
	output(9) <= input(17);
	output(10) <= input(18);
	output(11) <= input(19);
	output(12) <= input(20);
	output(13) <= input(21);
	output(14) <= input(22);
	output(15) <= input(23);
	output(16) <= '0';
	output(17) <= '0';
	output(18) <= '0';
	output(19) <= '0';
	output(20) <= '0';
	output(21) <= '0';
	output(22) <= '0';
	output(23) <= '0';
end structural;





library IEEE;
use IEEE.std_logic_1164.ALL;

entity bitshift_right is
port(
	input  : in  std_logic_vector(23 downto 0);
        output : out std_logic_vector(23 downto 0);
	flag : out std_logic
);
end bitshift_right;

architecture structural of bitshift_right is
begin
	flag <= input(0);
	output(0) <= input(1);
	output(1) <= input(2);
	output(2) <= input(3);
	output(3) <= input(4);
	output(4) <= input(5);
	output(5) <= input(6);
	output(6) <= input(7);
	output(7) <= input(8);
	output(8) <= input(9);
	output(9) <= input(10);
	output(10) <= input(11);
	output(11) <= input(12);
	output(12) <= input(13);
	output(13) <= input(14);
	output(14) <= input(15);
	output(15) <= input(16);
	output(16) <= input(17);
	output(17) <= input(18);
	output(18) <= input(19);
	output(19) <= input(20);
	output(20) <= input(21);
	output(21) <= input(22);
	output(22) <= '0';
	output(23) <= input(23);

end structural;





library IEEE;
use IEEE.std_logic_1164.ALL;

entity bitshift_left is
port(
	input  : in  std_logic_vector(23 downto 0);
        output : out std_logic_vector(23 downto 0);
        flag   : out std_logic
);
end bitshift_left;

architecture structural of bitshift_left is
begin
	flag <= input(22);
	output(23) <= input(23);
	output(22) <= input(21);
	output(21) <= input(20);
	output(20) <= input(19);
	output(19) <= input(18);
	output(18) <= input(17);
	output(17) <= input(16);
	output(16) <= input(15);
	output(15) <= input(14);
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





