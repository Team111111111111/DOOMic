library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity h_line_tb is
end entity h_line_tb;

architecture structural of h_line_tb is

	component h_line is
		port (	clk		: in	std_logic;
			reset		: in	std_logic;
			shift		: in	std_logic;	
			enable		: in	std_logic;

      			x_in 		: in 	std_logic_vector(8 downto 0);
        		y_top 		: in 	std_logic_vector(7 downto 0);
        		y_bot 		: in 	std_logic_vector(7 downto 0);

			address_out 	: out	 std_logic_vector(15 downto 0);
			ready		: out 	std_logic
		);
	end component h_line;

	signal	clk, reset, shift, enable, ready: std_logic;
	signal	x_in				: std_logic_vector(8 downto 0);
	signal	y_top, y_bot			: std_logic_vector(7 downto 0);
	signal	address_out			: std_logic_vector(15 downto 0);


begin

	lbl0: h_line port map	(	clk 		=> clk,
					reset		=> reset,
					shift		=> shift,
					enable		=> enable,
					x_in		=> x_in,
					y_top		=> y_top,
					y_bot		=> y_bot,
					address_out	=> address_out,
					ready		=> ready
				);

	-- 20 ns = 50 MHz
	clk			<=	'0' after 0 ns,
					'1' after 500 ns when clk /= '1' else '0' after 500 ns;

	reset			<=	'1' after 0 ns,
					'0' after 40 ns;

	shift			<=	'0' after 0 ns,
					'1' after 3 us,
					'0' after 4 us,
					'1' after 12 us,
					'0' after 13 us;


	enable			<=	'0'		after 0 ns,
					'1'		after 15 us,
					'0'		after 17 us;
				



	x_in			<=	"000000000"	after 0 ns,--0
					"000010100"	after 1 us,--20
					"000011001"     after 9 us;--25
	
	y_top			<=	"00000000"	after 0 ns, --0
					"01100010"      after 2 us, --98
					"01011110"      after 11 us; --94

	y_bot			<=	"00000000"	after 0 ns,
					"01100101"	after 3 us, --101
					"01101001"	after 12 us; --105


end architecture structural;
