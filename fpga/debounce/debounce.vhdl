
library ieee;
use ieee.std_logic_1164.all;

entity debouncer is
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
end entity; -- debouncer

architecture arch of debouncer is

	type state_type is (idle, active, waiting);
	signal state : state_type := idle;

	signal count : integer := 0;

begin

	s_update : process (clk)
	begin
		if rising_edge(clk) then
			case (state) is
				when idle =>
					debounced <= '0';
					if en = '1' then
						count <= 0;
						state <= active;
					end if;
				when active =>
					debounced <= '1';
					count <= count + 1;
					if count >= max_count then
						count <= 0;
						state <= waiting;
					end if;
				when waiting => 
					debounced <= '0';
					count <= count + 1;
					if count >= wait_count then
						state <= idle;
					end if;
			end case;
		end if;
	end process; -- s_update

end architecture; -- arch
