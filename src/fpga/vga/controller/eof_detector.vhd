-- tbh the controller is more just a sequencer and this is
-- the actuall control logic; the controller just does a loop

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

	signal ctr_rdy_memory, new_ctr_rdy_memory : std_logic;

begin

	process(clk, reset)
	begin
		if (rising_edge(clk)) then
			ctr_rdy_memory <= new_ctr_rdy_memory;

		end if;
	end process;

	process(reset, butt_l, butt_r, ctr_rdy, lov_eof, address, new_ctr_rdy_memory, ctr_rdy_memory)
	begin
		-- This is though component, it does a bunch of shit toegether

		-- Here we just check for the reset
		if (reset = '1') then
			lov_rdy <= '0';
			ctr_eof <= '0';
			new_ctr_rdy_memory <= '0';

		else

			-- Here we check for the flag from the chip

			-- if there's a flag then we go deeper
			if (address = "1111111111111110") then

				-- Here we check if we are just requested to send a
				-- new vertex, or if we are at the end of the list
				-- and we need to change the set

				-- if we are supposed to change the set then we start
				-- the clearing process and check the memory if we
				-- maybe didn't already do so
				if (lov_eof = '1' and ctr_rdy_memory = '0') then

					-- this starts the cleaning
					ctr_eof <= '1';
					lov_rdy <= '0';

					-- this checks if the cleaning is done and 
					-- sets the flag in the memory
					if (ctr_rdy = '1') then
						new_ctr_rdy_memory <= '1';

					else
						new_ctr_rdy_memory <= '0';

					end if;

				-- if we already did the cleaning then we wait for a
				-- button press before we start push the lov further;
				-- there's no point in computing the same frame again
				elsif (lov_eof = '1' and ctr_rdy_memory = '1') then

					new_ctr_rdy_memory <= ctr_rdy_memory;

					-- this gotta be a zero so the controller is in
					-- the correct branch of the fsm; it will keep
					-- throwing data into address with all 1s, but
					-- that's outside of the screen, so whatever;
					ctr_eof <= '0';

					if (butt_l = '1' or butt_r = '1') then
						lov_rdy <= '1';

					else
						lov_rdy <= '0';

					end if;
					
				else
					-- if this is not an end of frame then we just
					-- ignore it
					ctr_eof <= '0';
					lov_rdy <= '0';
					new_ctr_rdy_memory <= '0';

				end if;

			-- if we are asked to feed new data then we just pass the flag
			-- and feed the new data
			elsif (address = "1111111111111111" and lov_eof = '0') then
				ctr_eof <= '0';
				lov_rdy <= '1';
				new_ctr_rdy_memory <= '0';

			else
				-- if there's no flag then we just do nothing
				ctr_eof <= '0';
				lov_rdy <= '0';
				new_ctr_rdy_memory <= '0';

			end if;
		end if;
	end process;
end architecture;
