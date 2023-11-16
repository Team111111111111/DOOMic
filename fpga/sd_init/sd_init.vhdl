
library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity ram_initializer is
	port
	(
		clk : in std_logic;
		reset : in std_logic;

		-- The inputs for the data and data_ready signal of the SD card
		-- I am assuming that the SD card also has 
		sd_d : in std_logic_vector(7 downto 0);
		sd_r : in std_logic;
		sd_a : out std_logic_vector(31 downto 0);

		-- The RAM data signal and the transfer signal
		-- Remember to ask Wiktor if I understood correctly how the transfer
		--  signal worked
		ram_d : out std_logic_vector(7 downto 0);
		ram_t : out std_logic;
		ram_a : out std_logic_vector(31 downto 0)
	);
end entity; -- ram_initializer

architecture behavioral of ram_initializer is
	type state_type is (dev_off, int_rst, r_sd_0, r_sd_1, w_ram);
	signal state, next_state : state_type;

	-- These values describe the range of addresses that the entity will
	--  read/write to
	signal min_addr : integer := 0;
	signal max_addr : integer := 65535;

	-- So the first address from which data is read form the SD card is
	--  the value of 'min_addr', while the first address to which data
	--  will be written to the RAM module is equal to the sum of 'min_addr'
	--  and this value.
	-- I've added this because I'm not sure if both address ranges are
	--  equal. If left as zero, all data is copied to the same address.
	signal addr_offset : integer := 0;

	-- This signal is being updated in each iteration.
	signal address : integer := 0;

	-- Data that was just read from the SD card is written here, this 
	--  signal will then be written to RAM
	signal data : std_logic_vector(7 downto 0);
begin
	s_update : process(clk)
	begin
		if (rising_edge(clk)) then
			-- If the reset signal is active, we should start writing the
			--  data to RAM (move to 'int_rst' state)
			-- If the reset signal is not active, just go to next state
			if (reset = '1') then
				state <= int_rst;
			else
				state <= next_state;
			end if;
		end if;
	end process; -- s_update

	fsm_p : process (state)
	begin
		case (state) is
			when int_rst => 
				address <= min_addr;
			when r_sd_0 => 
				sd_a <= std_logic_vector(to_unsigned(address, sd_a'length));
				if (sd_r = '1') then
					next_state <= r_sd_1;
				end if;
			when r_sd_1 =>
				data <= sd_d;
				next_state <= w_ram;
			when w_ram =>
				ram_d <= data;
				ram_t <= '1';
				ram_a <= std_logic_vector(to_unsigned(address + addr_offset, ram_a'length));

				address <= address + 1;
				if (address >= max_addr) then
					next_state <= dev_off;
				else
					next_state <= r_sd_0;
				end if;
			when dev_off =>
				next_state <= dev_off;
		end case;
	end process; -- fsm_p
end architecture; -- behavioral
