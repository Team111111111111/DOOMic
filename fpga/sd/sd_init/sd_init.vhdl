library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SD_init_fsm is
	port (  clk		: in std_logic;
		reset		: in std_logic;
		count_in	: in std_logic_vector (19 downto 0);
		count_reset	: out std_logic;
		
		rdy			: in std_logic;
		enable		: out std_logic;
		CMD_out		: out std_logic_vector (7 downto 0);
		data		: in std_logic_vector (7 downto 0)
	);
end entity SD_init_fsm;

architecture behavioural of SD_init_fsm is

	type init_state is (res, dummy_clk, CMD0, CMD8, fail, R1_resp_1, lower_12b_in_R7, ACMD41_1, 
	R1_resp_2, ACMD41_2, R1_resp_3, CMD1, R1_resp_4, CMD58, CSS_bit, MCC_Ver_3, SD_Ver_1, SD_Byte,
	CMD16, SD_Block, succeeded); -- You gotta add all the states
								       -- here, I added just few
	signal state, new_state : init_state;

begin
	process (clk)
	begin
		if (rising_edge (clk)) then
			if (reset = '0') then -- most of the boards work in the inverse logic
					      -- so pullups, and 0 being active
				state <= res;
			else
				state <= new_state;
			end if;
		end if;
	end process;

	process (count_in, state, CMD_in, rdy) 
	begin
		case state is 

			when res =>
				enable <= '0';
				CMD_out <= "00000000";

				-- I am doing the reset state and waiting for power 
				-- stabilization state here
				if (count_in >= /*some value idk yet*/) then -- depends on the clock so
									     -- need to have big margin
									     -- but for sure >= 1ms
					new_state <= dummy_clk;
					count_reset <= '1';
				else
					new_state <= res;
					count_reset <= '0';
				end if;

			when dummy_clk =>
				enable <= '1';
				CMD_out <= "00000000";

				if (count_in >= 80 ) then -- it was supposed to be 74 cycles, but 
							  -- nothing prevents us from pumping a bit more

					new_state <= CMD0;
					count_reset <= '1';
				else
					new_state <= dummy_clk;
					count_reset <= '0';
				end if;

			when CMD0 =>
				enable <= '1';
				count_reset <= '1'; 	-- just hold it reset, it's not needed
				CMD_out <= /* CMD0 */;  -- we need to find the correct application
							-- note with data tokens for correct commands
							-- and how to correctly setup CRC - cyclic
							-- redundancy check (error detection)

				if (rdy = '1') then -- rdy signal is will come from SPI controller
						    -- I will also do the sampling control there
						    -- because it's also needed for data transfers;
						    -- [this is the only thing I am unsure about]

					new_state <= R1_resp_1;
				else
					new_state <= CMD0;

				end if;

			when R1_resp_1 =>
				enable <= '1';
				count_reset <= '1';
				CMD_out <= "00000000";

				if (CMD_in = "00000001") then

					new_state <= CMD8;

				else 
					new_state <= fail;
				end if;

			when CMD8 =>
				enable <= '1';
				new_state <= lower_12b_in_R7;

			when lower_12b_in_R7 =>
				enable <= '1';
				CMD_out <= "000001AA"

				if (CMD_in = "000001AA") then	-- if 0x1AA matched
					new_state <= ACMD41_1; -- but this is different from the state when error
				elsif (CMD_in != "000001AA") then -- if 0x1AA mismatch
					new_state <= fail;
				else 		-- error or no resp
					new_state <= ACMD41_2; 
				end if;
				
			when ACMD41_1 =>
				enable <= '1';
				new_state <= R1_resp_2;

			when R1_resp_2 =>
				enable <= '1';
				CMD_out <= "40000000";

				if (CMD_in = "00000001") then
					next_state <= ACMD41_1;
				elsif (CMD_in = "00000000") then
					next_state <= CMD58;
				else
					next_state <= fail;
				end if;

			when ACMD41_2 => 
				enable <= '1';
				next_state <= R1_resp_3;

			when R1_resp_3 => 
				enable <= '1';
				CMD_out <= "00000000";

				if (CMD_in = "00000001") then
					next_state <= ACMD41_2;
				elsif (CMD_in = "00000000") then
					next_state <= SD_Ver_1;
				else
					next_state <= CMD1;
				end if;

			when CMD1 =>
				enable <= '1';
				next_state <= R1_resp_4;


			when R1_resp_4 =>
				enable <= '1';
				CMD_out <= "00000000";

				if (CMD_in = "00000001") then
					next_state <= CMD1;
				elsif (CMD_in = "00000000") then
					next_state <= MCC_Ver_3;
				else 
					next_state <= fail;
				end if;

			when CMD58 => 
				enable <= '1';
				next_state <= CSS_bit;

			when CSS_bit => 
				enable <= '1';
				CMD_out = "00000000";

				if (CMD_in = '1') then
					next_state <= SD_Block;
				else
					next_state <= SD_Byte;
				end if;

			when MCC_Ver_3 =>
				enable <= '1';
				next_state <= CMD16;
			
			when SD_Ver_1 =>
				enable <= '1'; 
				next_state <= CMD16;
			
			when SD_Byte =>
				enable <= '1';
				next_state <= CMD16;
			
			when CMD16 => 
				enable <= '1';
				next_state <= succeeded;
			
			when SD_Block =>
				enable <= '1';
				next_state <= succeeded;


			-- All the rest of the states gotta be here analogically to this stuff
			-- I was writing this part of the code very late and on the train and 
			-- bus so there might be bugs and stuff, but it's a starting point



			when succeeded => 
				enable <= '1';
				CMD_out <= "00000200"; -- not so sure

			when fail =>
				enable <= '0';
				count_reset <= '1';
				CMD_out <= "00000000";

				-- I guess some LED can be on here to indicate failure condition

				new_state <= fail;

		end case;
	end process;
end architecture behavioural;
