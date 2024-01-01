library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity eof_detector is
	port (
		clk	: in std_logic;
		reset	: in std_logic;

		butt_l	: in std_logic;
		butt_r	: in std_logic;
		ctr_rdy	: in std_logic;
		ctr_eof : out std_logic;
		lov_eof : in std_logic;
		lov_rdy	: out std_logic;
		address	: in std_logic_vector (15 downto 0)
	);
end entity;


architecture behavioural of eof_detector is

begin
	process(reset, butt_l, butt_r, ctr_rdy, lov_eof, address)
	begin
		if (reset = '1') then
			lov_rdy <= '0';
			ctr_eof <= '0';

		else
			if (address = "1111111111111111") then
				if (lov_eof = '1') then
					ctr_eof <= '1';

					if (ctr_rdy = '1') then
						lov_rdy <= '1';

					else
						lov_rdy <= '0';

					end if;

				else
					ctr_eof <= '0';
					lov_rdy <= '1';

				end if;

			else
				ctr_eof <= '0';
				lov_rdy <= '0';

			end if;
		end if;
	end process;
end architecture;
