library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity vga_ram_controller is
	port (
		clk	: in std_logic;
		reset	: in std_logic;
		
		in_hold		: out std_logic;
		out_hold	: out std_logic;
		offset_bit	: out std_logic;
		rdy		: out std_logic;
		r\w		: out std_logic;
		sram_enable	: out std_logic;
		mux_switch	: out std_logic_vector (1 downto 0);
		color_byte	: out std_logic_vector (7 downto 0);
		counter		: out std_logic_vector (15 downto 0);

		enable		: in std_logic;
		eof_flag	: in std_logic
	);
end entity;


architecture behavioural of vga_ram_controller is

	type ctrl_state is (
		reset,
		read_chip,
		read_zeros,
		out_store_chip,
		out_store_zeros,
		mux_chip,
		mux_zeros,
		in_store,
		zeros_store,
		mux_vga_chip,
		mux_vga_zeros.
		wait_vga_chip,
		wait_vga_zeros
	);

	signal state, new_state	: ctrl_state;
	signal new_counter : std_logic_vector (15 downto 0);
	signal clk_counter, new_clk_counter : std_logic_vector (1 downto 0);
	signal new_offset_bit : std_logic;

begin
	process(clk, reset)
	begin
		if (clk'event and clk = '1' ) then
			if (reset = '1') then
				state	<= reset;
				counter <= "0000000000000000";
				clk_counter	<= "00";
				offset_bit	<= '0';

			else
				state 	<= new_state;
				counter <= new_counter;
				clk_counter <= new_clk_counter;
				offset_bit  <= new_offset_bit;

			end if;
		end if;
	end process;

	process (state, enable, address)
	begin
		case state is
			when reset =>
				in_hold		<= '0'; 
				out_hold	<= '0'; 
				rdy		<= '0';
				r\w		<= '0'; 
				sram_enable	<= '0'; 

				mux_switch	<= "10"; 
				color_byte	<= "00000000"; 

				new_counter	<= "0000000000000000";
				new_clk_counter <= "00";
				new_offset_bit	<= '0';

				if (enable = '1') then
					new_state <= read_chip;
					
				else
					new_state <= reset;
				end if;

			when read_chip =>
				in_hold		<= '0'; 
				out_hold	<= '0'; 
				rdy		<= '0'; 
				r\w		<= '0'; -- read is 0 
				sram_enable	<= '1'; 
				mux_switch	<= "10"; -- 00 - counter; 01 - chip; 10 - VGA;
				color_byte	<= "11100111"; 

				new_counter	<= "0000000000000000";
				new_clk_counter <= clk_counter + 1;
				new_offset_bit	<= offset_bit;

				if (unsigned(clk_counter) >= 1) then
					new_state <= out_store_chip;

				else
					new_state <= read_chip;

				end if;

			when out_store_chip => 
				in_hold		<= '0'; 
				out_hold	<= '1'; 
				rdy		<= '0'; 
				r\w		<= '0'; -- read is 0 
				sram_enable	<= '1'; 
				mux_switch	<= "10"; -- 00 - counter; 01 - chip; 10 - VGA;
				color_byte	<= "11100111"; 

				new_counter	<= "0000000000000000";
				new_clk_counter <= "00";

				if (eof_flag = '1') then
					new_state	<= mux_zeros;
					new_offset_bit	<= not offset_bit;

				else
					new_state <= mux_chip;
					new_offset_bit <= offset_bit;

				end if;

			when mux_chip =>
				in_hold		<= '1'; 
				out_hold	<= '1'; 
				rdy		<= '0'; 
				r\w		<= '1'; -- read is 0 
				sram_enable	<= '0'; 
				mux_switch	<= "01"; -- 00 - counter; 01 - chip; 10 - VGA;
				color_byte	<= "11100111"; 

				new_counter	<= "0000000000000000";
				new_clk_counter <= "00";

				new_state	<= in_store;
				new_offset_bit	<= offset_bit;

			when in_store =>
				in_hold		<= '1'; 
				out_hold	<= '1'; 
				rdy		<= '0'; 
				r\w		<= '1'; -- read is 0 
				sram_enable	<= '1'; 
				mux_switch	<= "01"; -- 00 - counter; 01 - chip; 10 - VGA;
				color_byte	<= "11100111"; 

				new_counter	<= "0000000000000000";
				new_clk_counter <= clk_counter + 1;
				new_offset_bit	<= offset_bit;

				if (unsigned(clk_counter) >= 1) then
					new_state <= mux_vga_chip;

				else
					new_state <= in_store;

				end if;
				
			when mux_vga_chip =>
				in_hold		<= '0'; 
				out_hold	<= '1'; 
				rdy		<= '0'; 
				r\w		<= '1'; -- read is 0 
				sram_enable	<= '0'; 
				mux_switch	<= "10"; -- 00 - counter; 01 - chip; 10 - VGA;
				color_byte	<= "11100111"; 

				new_counter	<= "0000000000000000";
				new_clk_counter <= "00";

				new_state	<= wait_vga_chip;
				new_offset_bit	<= offset_bit;

			when wait_vga_chip =>
				in_hold		<= '0'; 
				out_hold	<= '1'; 
				rdy		<= '0'; 
				r\w		<= '0'; -- read is 0 
				sram_enable	<= '0'; 
				mux_switch	<= "10"; -- 00 - counter; 01 - chip; 10 - VGA;
				color_byte	<= "11100111"; 

				new_counter	<= "0000000000000000";
				new_clk_counter <= "00";
				new_offset_bit	<= offset_bit;

				if (enable = '1') then
					new_state <= read_chip;

				else
					new_state <= wait_vga_chip;

				end if;

			when read_zeros =>
				in_hold		<= '0'; 
				out_hold	<= '0'; 
				rdy		<= '0'; 
				r\w		<= '0'; -- read is 0 
				sram_enable	<= '1'; 
				mux_switch	<= "10"; -- 00 - counter; 01 - chip; 10 - VGA;
				color_byte	<= "00000000"; 

				new_counter	<= counter;
				new_clk_counter <= clk_counter + 1;
				new_offset_bit	<= offset_bit;

				if (unsigned(clk_counter) >= 1) then
					new_state <= out_store_zeros;

				else
					new_state <= read_zeros;

				end if;

			when out_store_zeros => 
				in_hold		<= '0'; 
				out_hold	<= '1'; 
				rdy		<= '0'; 
				r\w		<= '0'; -- read is 0 
				sram_enable	<= '1'; 
				mux_switch	<= "10"; -- 00 - counter; 01 - chip; 10 - VGA;
				color_byte	<= "00000000"; 

				new_counter	<= counter;
				new_clk_counter <= "00";

				new_state	<= mux_zeros;
				new_offset_bit	<= offset_bit;

			when mux_zeros =>
				in_hold		<= '0'; 
				out_hold	<= '1'; 
				rdy		<= '0'; 
				r\w		<= '1'; -- read is 0 
				sram_enable	<= '0'; 
				mux_switch	<= "00"; -- 00 - counter; 01 - chip; 10 - VGA;
				color_byte	<= "00000000"; 

				new_counter	<= counter;
				new_clk_counter <= "00";

				new_state	<= zeros_store;
				new_offset_bit	<= offset_bit;

			when zeros_store =>
				in_hold		<= '0'; 
				out_hold	<= '1'; 
				rdy		<= '0'; 
				r\w		<= '1'; -- read is 0 
				sram_enable	<= '1'; 
				mux_switch	<= "00"; -- 00 - counter; 01 - chip; 10 - VGA;
				color_byte	<= "00000000"; 

				new_counter	<= counter;
				new_clk_counter <= clk_counter + 1;
				new_offset_bit	<= offset_bit;

				if (unsigned(clk_counter) >= 1) then
					if (unsigned(counter) >= 64000) then
						new_state <= mux_vga_chip;

					else
						new_state <= mux_vga_zeros;

					end if;
				else
					new_state <= zeros_store;

				end if;
				
			when mux_vga_zeros =>
				in_hold		<= '0'; 
				out_hold	<= '1'; 
				rdy		<= '0'; 
				r\w		<= '1'; -- read is 0 
				sram_enable	<= '0'; 
				mux_switch	<= "10"; -- 00 - counter; 01 - chip; 10 - VGA;
				color_byte	<= "00000000"; 

				new_counter	<= counter + 1;
				new_clk_counter <= "00";

				new_state	<= wait_vga_zeros;
				new_offset_bit	<= offset_bit;

			when wait_vga_zeros =>
				in_hold		<= '0'; 
				out_hold	<= '1'; 
				rdy		<= '0'; 
				r\w		<= '0'; -- read is 0 
				sram_enable	<= '0'; 
				mux_switch	<= "10"; -- 00 - counter; 01 - chip; 10 - VGA;
				color_byte	<= "00000000"; 

				new_counter	<= "counter";
				new_clk_counter <= "00";
				new_offset_bit	<= offset_bit;

				if (enable = '1') then
					new_state <= read_zeros;

				else
					new_state <= wait_vga_zeros;

				end if;
		end case;
	end process;
end architecture;
