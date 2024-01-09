library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_divider is
	port (
		clk : in std_logic;
		res : in std_logic;
		clk_6 : out std_logic
	);
end entity;

architecture behavioural of clk_divider is
	
	signal counter, new_counter : unsigned (2 downto 0);

begin
	process (clk, res)
	begin
		if (rising_edge(clk)) then
			if (res = '1') then
				counter <= "000";

			else
				counter <= new_counter;

			end if;
		end if;
	end process;

	process (counter)
	begin
		if (res = '1') then
			new_counter <= "000";
			clk_6 <= '1';

		elsif (std_logic_vector(counter) >= "100" and
			std_logic_vector(counter) < "111") then

			new_counter <= counter + 1;
			clk_6 <= '0';

		elsif (std_logic_vector(counter) = "111") then
			new_counter <= "000";
			clk_6 <= '0';

		else
			new_counter <= counter + 1;
			clk_6 <= '1';

		end if;
	end process;
end architecture;
