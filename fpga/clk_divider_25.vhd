library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_divider_25 is
	port (
		clk : in std_logic;
		res : in std_logic;
		clk_25 : out std_logic
	);
end entity;

architecture behavioural of clk_divider_25 is
	
	signal counter, new_counter : unsigned (1 downto 0);

begin
	process (clk, res)
	begin
		if (rising_edge(clk)) then
			if (res = '1') then
				counter <= "00";

			else
				counter <= new_counter;

			end if;
		end if;
	end process;

	process (counter, res)
	begin
		if (res = '1') then
			new_counter <= "00";
			clk_25 <= '1';

		elsif (counter = 1) then
			new_counter <= "00";
			clk_25 <= '0';

		else
			new_counter <= counter + 1;
			clk_25 <= '1';

		end if;
	end process;
end architecture;
