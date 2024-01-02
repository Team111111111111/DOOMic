LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity lov is			-- short for the list of all verticies
	port (
		clk		: in std_logic;
		res		: in std_logic;

		serial_bus 	: out std_logic_vector (13 downto 0);
		eof_flag	: out std_logic;
		left		: in std_logic;
		right 		: in std_logic;
		rdy		: in std_logic
		);
end lov;

architecture beahvioural of lov is 

				-- All the states here
	type lov_state is (	reset, plr_x, plr_y, EOF, BOF,
				vert0_0_a, vert0_0_x, vert0_0_y, 
				vert0_1_x, vert0_1_y, 
				vert0_2_x, vert0_2_y, 
				vert0_3_x, vert0_3_y, 
				vert0_4_x, vert0_4_y, 
				vert0_5_x, vert0_5_y, 
				vert0_6_x, vert0_6_y, 
				vert1_0_a, vert1_0_x, vert1_0_y, 
				vert1_1_x, vert1_1_y, 
				vert1_2_x, vert1_2_y, 
				vert1_3_x, vert1_3_y, 
				vert1_4_x, vert1_4_y, 
				vert1_5_x, vert1_5_y, 
				vert1_6_x, vert1_6_y, 
				vert2_0_a, vert2_0_x, vert2_0_y, 
				vert2_1_x, vert2_1_y, 
				vert2_2_x, vert2_2_y, 
				vert2_3_x, vert2_3_y, 
				vert2_4_x, vert2_4_y, 
				vert2_5_x, vert2_5_y, 
				vert2_6_x, vert2_6_y, 
				vert3_0_a, vert3_0_x, vert3_0_y, 
				vert3_1_x, vert3_1_y, 
				vert3_2_x, vert3_2_y, 
				vert3_3_x, vert3_3_y, 
				vert3_4_x, vert3_4_y, 
				vert3_5_x, vert3_5_y, 
				vert3_6_x, vert3_6_y, 
				vert3_7_x, vert3_7_y, 
				vert4_0_a, vert4_0_x, vert4_0_y, 
				vert4_1_x, vert4_1_y, 
				vert4_2_x, vert4_2_y, 
				vert4_3_x, vert4_3_y, 
				vert4_4_x, vert4_4_y, 
				vert4_5_x, vert4_5_y, 
				vert4_6_x, vert4_6_y, 
				vert5_0_a, vert5_0_x, vert5_0_y, 
				vert5_1_x, vert5_1_y, 
				vert5_2_x, vert5_2_y, 
				vert5_3_x, vert5_3_y, 
				vert5_4_x, vert5_4_y, 
				vert5_5_x, vert5_5_y, 
				vert6_0_a, vert6_0_x, vert6_0_y, 
				vert6_1_x, vert6_1_y, 
				vert6_2_x, vert6_2_y, 
				vert6_3_x, vert6_3_y, 
				vert6_4_x, vert6_4_y, 
				vert6_5_x, vert6_5_y, 
				vert6_6_x, vert6_6_y, 
				vert7_0_a, vert7_0_x, vert7_0_y, 
				vert7_1_x, vert7_1_y, 
				vert7_2_x, vert7_2_y, 
				vert7_3_x, vert7_3_y, 
				vert7_4_x, vert7_4_y, 
				vert7_5_x, vert7_5_y, 
				vert7_6_x, vert7_6_y, 
				vert8_0_a, vert8_0_x, vert8_0_y, 
				vert8_1_x, vert8_1_y, 
				vert8_2_x, vert8_2_y, 
				vert8_3_x, vert8_3_y, 
				vert8_4_x, vert8_4_y, 
				vert9_0_a, vert9_0_x, vert9_0_y, 
				vert9_1_x, vert9_1_y, 
				vert9_2_x, vert9_2_y, 
				vert9_3_x, vert9_3_y, 
				vert9_4_x, vert9_4_y, 
				vert10_0_a, vert10_0_x, vert10_0_y, 
				vert10_1_x, vert10_1_y, 
				vert10_2_x, vert10_2_y, 
				vert10_3_x, vert10_3_y, 
				vert10_4_x, vert10_4_y, 
				vert11_0_a, vert11_0_x, vert11_0_y, 
				vert11_1_x, vert11_1_y, 
				vert11_2_x, vert11_2_y, 
				vert11_3_x, vert11_3_y, 
				vert12_0_a, vert12_0_x, vert12_0_y, 
				vert12_1_x, vert12_1_y, 
				vert12_2_x, vert12_2_y, 
				vert13_0_a, vert13_0_x, vert13_0_y, 
				vert13_1_x, vert13_1_y, 
				vert13_2_x, vert13_2_y, 
				vert14_0_a, vert14_0_x, vert14_0_y, 
				vert14_1_x, vert14_1_y, 
				vert14_2_x, vert14_2_y, 
				vert15_0_a, vert15_0_x, vert15_0_y, 
				vert15_1_x, vert15_1_y, 
				vert15_2_x, vert15_2_y, 
				vert16_0_a, vert16_0_x, vert16_0_y, 
				vert16_1_x, vert16_1_y, 
				vert16_2_x, vert16_2_y, 
				vert17_0_a, vert17_0_x, vert17_0_y, 
				vert17_1_x, vert17_1_y, 
				vert17_2_x, vert17_2_y, 
				vert18_0_a, vert18_0_x, vert18_0_y, 
				vert18_1_x, vert18_1_y, 
				vert18_2_x, vert18_2_y, 
				vert18_3_x, vert18_3_y, 
				vert19_0_a, vert19_0_x, vert19_0_y, 
				vert19_1_x, vert19_1_y, 
				vert19_2_x, vert19_2_y, 
				vert19_3_x, vert19_3_y, 
				vert19_4_x, vert19_4_y, 
				vert20_0_a, vert20_0_x, vert20_0_y, 
				vert20_1_x, vert20_1_y, 
				vert20_2_x, vert20_2_y, 
				vert20_3_x, vert20_3_y, 
				vert20_4_x, vert20_4_y, 
				vert20_5_x, vert20_5_y, 
				vert21_0_a, vert21_0_x, vert21_0_y, 
				vert21_1_x, vert21_1_y, 
				vert21_2_x, vert21_2_y, 
				vert21_3_x, vert21_3_y, 
				vert21_4_x, vert21_4_y, 
				vert21_5_x, vert21_5_y, 
				vert22_0_a, vert22_0_x, vert22_0_y, 
				vert22_1_x, vert22_1_y, 
				vert22_2_x, vert22_2_y, 
				vert22_3_x, vert22_3_y, 
				vert22_4_x, vert22_4_y, 
				vert22_5_x, vert22_5_y, 
				vert23_0_a, vert23_0_x, vert23_0_y, 
				vert23_1_x, vert23_1_y, 
				vert23_2_x, vert23_2_y, 
				vert23_3_x, vert23_3_y, 
				vert23_4_x, vert23_4_y, 
				vert23_5_x, vert23_5_y, 
				vert23_6_x, vert23_6_y, 
				vert24_0_a, vert24_0_x, vert24_0_y, 
				vert24_1_x, vert24_1_y, 
				vert24_2_x, vert24_2_y, 
				vert24_3_x, vert24_3_y, 
				vert24_4_x, vert24_4_y, 
				vert24_5_x, vert24_5_y, 
				vert25_0_a, vert25_0_x, vert25_0_y, 
				vert25_1_x, vert25_1_y, 
				vert25_2_x, vert25_2_y, 
				vert25_3_x, vert25_3_y, 
				vert25_4_x, vert25_4_y, 
				vert25_5_x, vert25_5_y, 
				vert26_0_a, vert26_0_x, vert26_0_y, 
				vert26_1_x, vert26_1_y, 
				vert26_2_x, vert26_2_y, 
				vert26_3_x, vert26_3_y, 
				vert26_4_x, vert26_4_y, 
				vert26_5_x, vert26_5_y, 
				vert27_0_a, vert27_0_x, vert27_0_y, 
				vert27_1_x, vert27_1_y, 
				vert27_2_x, vert27_2_y, 
				vert27_3_x, vert27_3_y, 
				vert27_4_x, vert27_4_y, 
				vert28_0_a, vert28_0_x, vert28_0_y, 
				vert28_1_x, vert28_1_y, 
				vert28_2_x, vert28_2_y, 
				vert28_3_x, vert28_3_y, 
				vert28_4_x, vert28_4_y, 
				vert29_0_a, vert29_0_x, vert29_0_y, 
				vert29_1_x, vert29_1_y, 
				vert29_2_x, vert29_2_y, 
				vert29_3_x, vert29_3_y, 
				vert29_4_x, vert29_4_y, 
				vert30_0_a, vert30_0_x, vert30_0_y, 
				vert30_1_x, vert30_1_y, 
				vert30_2_x, vert30_2_y, 
				vert30_3_x, vert30_3_y, 
				vert30_4_x, vert30_4_y, 
				vert31_0_a, vert31_0_x, vert31_0_y, 
				vert31_1_x, vert31_1_y, 
				vert31_2_x, vert31_2_y, 
				vert31_3_x, vert31_3_y, 
				vert31_4_x, vert31_4_y, 
				vert31_5_x, vert31_5_y, 
				vert32_0_a, vert32_0_x, vert32_0_y, 
				vert32_1_x, vert32_1_y, 
				vert32_2_x, vert32_2_y, 
				vert32_3_x, vert32_3_y, 
				vert32_4_x, vert32_4_y, 
				vert32_5_x, vert32_5_y, 
				vert33_0_a, vert33_0_x, vert33_0_y, 
				vert33_1_x, vert33_1_y, 
				vert33_2_x, vert33_2_y, 
				vert33_3_x, vert33_3_y, 
				vert33_4_x, vert33_4_y, 
				vert33_5_x, vert33_5_y, 
				vert34_0_a, vert34_0_x, vert34_0_y, 
				vert34_1_x, vert34_1_y, 
				vert34_2_x, vert34_2_y, 
				vert34_3_x, vert34_3_y, 
				vert34_4_x, vert34_4_y, 
				vert34_5_x, vert34_5_y, 
				vert35_0_a, vert35_0_x, vert35_0_y, 
				vert35_1_x, vert35_1_y, 
				vert35_2_x, vert35_2_y, 
				vert35_3_x, vert35_3_y, 
				vert35_4_x, vert35_4_y, 
				vert35_5_x, vert35_5_y, 
				vert35_6_x, vert35_6_y, 
				vert35_7_x, vert35_7_y
			);

	signal state, new_state : lov_state;
	signal pointer, new_pointer : unsigned(5 downto 0) := "010000";

begin
	process (clk)
	begin
		if (clk'event and clk = '1') then
			if (res = '1') then
				state 	<= reset;
				pointer <= "010000";

			else
				state	<= new_state;
				pointer <= new_pointer;

			end if;
		end if;
	end process;

	process (state, clk)
	begin
		case state is
			when reset =>
				serial_bus	<= "00000000000000";
				new_pointer	<= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= BOF;

				else 
					new_state <= reset;
				end if;

			when EOF =>
				serial_bus	<= "11111111111111";
				new_pointer	<= pointer;
				eof_flag <= '1';

				if (rdy = '1') then
					new_state <= reset;

				else
					new_state <= EOF;
				end if;

			when BOF =>
				serial_bus	<= "11111111111111";
				new_pointer	<= pointer;
				eof_flag <= '0';

				new_state <= plr_x;

			when plr_x =>
				serial_bus	<= "00000100101101";
				new_pointer	<= pointer;
				eof_flag <= '0';

				new_state <= plr_y;

			when plr_y =>
				serial_bus <= "00001001011001";
				eof_flag <= '0';
				

				-- Updating the pointer based on the input buttons
				if (left = '1') then

					-- Checking for underflow
					if (pointer = 0) then
						new_pointer <= "100011"; -- 35 in binary

					else 
						new_pointer <= pointer - 1;

					end if;

				elsif (right = '1') then

					-- Checking for overflow
					if (pointer = 35) then -- 35 in binary
						new_pointer <= "000000";

					else
						new_pointer <= pointer + 1;

					end if;

				else
					new_pointer <= pointer;
				end if;



				-- Choosing the new state based on the value of the pointer
				if (pointer = 0) then
					new_state <= vert0_0_a;

				elsif (pointer = 1) then
					new_state <= vert1_0_a;

				elsif (pointer = 2) then
					new_state <= vert2_0_a;

				elsif (pointer = 3) then
					new_state <= vert3_0_a;

				elsif (pointer = 4) then
					new_state <= vert4_0_a;

				elsif (pointer = 5) then
					new_state <= vert5_0_a;

				elsif (pointer = 6) then
					new_state <= vert6_0_a;

				elsif (pointer = 7) then
					new_state <= vert7_0_a;

				elsif (pointer = 8) then
					new_state <= vert8_0_a;

				elsif (pointer = 9) then
					new_state <= vert9_0_a;

				elsif (pointer = 10) then
					new_state <= vert10_0_a;

				elsif (pointer = 11) then
					new_state <= vert11_0_a;

				elsif (pointer = 12) then
					new_state <= vert12_0_a;

				elsif (pointer = 13) then
					new_state <= vert13_0_a;

				elsif (pointer = 14) then
					new_state <= vert14_0_a;

				elsif (pointer = 15) then
					new_state <= vert15_0_a;

				elsif (pointer = 16) then
					new_state <= vert16_0_a;

				elsif (pointer = 17) then
					new_state <= vert17_0_a;

				elsif (pointer = 18) then
					new_state <= vert18_0_a;

				elsif (pointer = 19) then
					new_state <= vert19_0_a;

				elsif (pointer = 20) then
					new_state <= vert20_0_a;

				elsif (pointer = 21) then
					new_state <= vert21_0_a;

				elsif (pointer = 22) then
					new_state <= vert22_0_a;

				elsif (pointer = 23) then
					new_state <= vert23_0_a;

				elsif (pointer = 24) then
					new_state <= vert24_0_a;

				elsif (pointer = 25) then
					new_state <= vert25_0_a;

				elsif (pointer = 26) then
					new_state <= vert26_0_a;

				elsif (pointer = 27) then
					new_state <= vert27_0_a;

				elsif (pointer = 28) then
					new_state <= vert28_0_a;

				elsif (pointer = 29) then
					new_state <= vert29_0_a;

				elsif (pointer = 30) then
					new_state <= vert30_0_a;

				elsif (pointer = 31) then
					new_state <= vert31_0_a;

				elsif (pointer = 32) then
					new_state <= vert32_0_a;

				elsif (pointer = 33) then
					new_state <= vert33_0_a;

				elsif (pointer = 34) then
					new_state <= vert34_0_a;

				elsif (pointer = 35) then
					new_state <= vert35_0_a;

				end if;

			when vert0_0_a =>
				-- bus output in decimal: 55
				serial_bus <= "00000000110111";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert0_0_x;

			when vert0_0_x =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert0_0_y;

			when vert0_0_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert0_1_x;
				else
					new_state <= vert0_0_y;
				end if;

			when vert0_1_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert0_1_y;

			when vert0_1_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert0_2_x;
				else
					new_state <= vert0_1_y;
				end if;

			when vert0_2_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert0_2_y;

			when vert0_2_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert0_3_x;
				else
					new_state <= vert0_2_y;
				end if;

			when vert0_3_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert0_3_y;

			when vert0_3_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert0_4_x;
				else
					new_state <= vert0_3_y;
				end if;

			when vert0_4_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert0_4_y;

			when vert0_4_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert0_5_x;
				else
					new_state <= vert0_4_y;
				end if;

			when vert0_5_x =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert0_5_y;

			when vert0_5_y =>
				-- bus output in decimal: 701
				serial_bus <= "00001010111101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert0_6_x;
				else
					new_state <= vert0_5_y;
				end if;

			when vert0_6_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert0_6_y;

			when vert0_6_y =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert0_6_y;
				end if;

			when vert1_0_a =>
				-- bus output in decimal: 56
				serial_bus <= "00000000111000";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert1_0_x;

			when vert1_0_x =>
				-- bus output in decimal: 230
				serial_bus <= "00000011100110";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert1_0_y;

			when vert1_0_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert1_1_x;
				else
					new_state <= vert1_0_y;
				end if;

			when vert1_1_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert1_1_y;

			when vert1_1_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert1_2_x;
				else
					new_state <= vert1_1_y;
				end if;

			when vert1_2_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert1_2_y;

			when vert1_2_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert1_3_x;
				else
					new_state <= vert1_2_y;
				end if;

			when vert1_3_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert1_3_y;

			when vert1_3_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert1_4_x;
				else
					new_state <= vert1_3_y;
				end if;

			when vert1_4_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert1_4_y;

			when vert1_4_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert1_5_x;
				else
					new_state <= vert1_4_y;
				end if;

			when vert1_5_x =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert1_5_y;

			when vert1_5_y =>
				-- bus output in decimal: 701
				serial_bus <= "00001010111101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert1_6_x;
				else
					new_state <= vert1_5_y;
				end if;

			when vert1_6_x =>
				-- bus output in decimal: 764
				serial_bus <= "00001011111100";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert1_6_y;

			when vert1_6_y =>
				-- bus output in decimal: 682
				serial_bus <= "00001010101010";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert1_6_y;
				end if;

			when vert2_0_a =>
				-- bus output in decimal: 58
				serial_bus <= "00000000111010";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert2_0_x;

			when vert2_0_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert2_0_y;

			when vert2_0_y =>
				-- bus output in decimal: 875
				serial_bus <= "00001101101011";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert2_1_x;
				else
					new_state <= vert2_0_y;
				end if;

			when vert2_1_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert2_1_y;

			when vert2_1_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert2_2_x;
				else
					new_state <= vert2_1_y;
				end if;

			when vert2_2_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert2_2_y;

			when vert2_2_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert2_3_x;
				else
					new_state <= vert2_2_y;
				end if;

			when vert2_3_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert2_3_y;

			when vert2_3_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert2_4_x;
				else
					new_state <= vert2_3_y;
				end if;

			when vert2_4_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert2_4_y;

			when vert2_4_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert2_5_x;
				else
					new_state <= vert2_4_y;
				end if;

			when vert2_5_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert2_5_y;

			when vert2_5_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert2_6_x;
				else
					new_state <= vert2_5_y;
				end if;

			when vert2_6_x =>
				-- bus output in decimal: 706
				serial_bus <= "00001011000010";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert2_6_y;

			when vert2_6_y =>
				-- bus output in decimal: 748
				serial_bus <= "00001011101100";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert2_6_y;
				end if;

			when vert3_0_a =>
				-- bus output in decimal: 60
				serial_bus <= "00000000111100";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert3_0_x;

			when vert3_0_x =>
				-- bus output in decimal: 185
				serial_bus <= "00000010111001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert3_0_y;

			when vert3_0_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert3_1_x;
				else
					new_state <= vert3_0_y;
				end if;

			when vert3_1_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert3_1_y;

			when vert3_1_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert3_2_x;
				else
					new_state <= vert3_1_y;
				end if;

			when vert3_2_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert3_2_y;

			when vert3_2_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert3_3_x;
				else
					new_state <= vert3_2_y;
				end if;

			when vert3_3_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert3_3_y;

			when vert3_3_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert3_4_x;
				else
					new_state <= vert3_3_y;
				end if;

			when vert3_4_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert3_4_y;

			when vert3_4_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert3_5_x;
				else
					new_state <= vert3_4_y;
				end if;

			when vert3_5_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert3_5_y;

			when vert3_5_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert3_6_x;
				else
					new_state <= vert3_5_y;
				end if;

			when vert3_6_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert3_6_y;

			when vert3_6_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert3_7_x;
				else
					new_state <= vert3_6_y;
				end if;

			when vert3_7_x =>
				-- bus output in decimal: 625
				serial_bus <= "00001001110001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert3_7_y;

			when vert3_7_y =>
				-- bus output in decimal: 788
				serial_bus <= "00001100010100";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert3_7_y;
				end if;

			when vert4_0_a =>
				-- bus output in decimal: 62
				serial_bus <= "00000000111110";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert4_0_x;

			when vert4_0_x =>
				-- bus output in decimal: 133
				serial_bus <= "00000010000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert4_0_y;

			when vert4_0_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert4_1_x;
				else
					new_state <= vert4_0_y;
				end if;

			when vert4_1_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert4_1_y;

			when vert4_1_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert4_2_x;
				else
					new_state <= vert4_1_y;
				end if;

			when vert4_2_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert4_2_y;

			when vert4_2_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert4_3_x;
				else
					new_state <= vert4_2_y;
				end if;

			when vert4_3_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert4_3_y;

			when vert4_3_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert4_4_x;
				else
					new_state <= vert4_3_y;
				end if;

			when vert4_4_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert4_4_y;

			when vert4_4_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert4_5_x;
				else
					new_state <= vert4_4_y;
				end if;

			when vert4_5_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert4_5_y;

			when vert4_5_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert4_6_x;
				else
					new_state <= vert4_5_y;
				end if;

			when vert4_6_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert4_6_y;

			when vert4_6_y =>
				-- bus output in decimal: 852
				serial_bus <= "00001101010100";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert4_6_y;
				end if;

			when vert5_0_a =>
				-- bus output in decimal: 0
				serial_bus <= "00000000000000";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert5_0_x;

			when vert5_0_x =>
				-- bus output in decimal: 62
				serial_bus <= "00000000111110";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert5_0_y;

			when vert5_0_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert5_1_x;
				else
					new_state <= vert5_0_y;
				end if;

			when vert5_1_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert5_1_y;

			when vert5_1_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert5_2_x;
				else
					new_state <= vert5_1_y;
				end if;

			when vert5_2_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert5_2_y;

			when vert5_2_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert5_3_x;
				else
					new_state <= vert5_2_y;
				end if;

			when vert5_3_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert5_3_y;

			when vert5_3_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert5_4_x;
				else
					new_state <= vert5_3_y;
				end if;

			when vert5_4_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert5_4_y;

			when vert5_4_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert5_5_x;
				else
					new_state <= vert5_4_y;
				end if;

			when vert5_5_x =>
				-- bus output in decimal: 552
				serial_bus <= "00001000101000";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert5_5_y;

			when vert5_5_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert5_5_y;
				end if;

			when vert6_0_a =>
				-- bus output in decimal: 2
				serial_bus <= "00000000000010";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert6_0_x;

			when vert6_0_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert6_0_y;

			when vert6_0_y =>
				-- bus output in decimal: 774
				serial_bus <= "00001100000110";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert6_1_x;
				else
					new_state <= vert6_0_y;
				end if;

			when vert6_1_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert6_1_y;

			when vert6_1_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert6_2_x;
				else
					new_state <= vert6_1_y;
				end if;

			when vert6_2_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert6_2_y;

			when vert6_2_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert6_3_x;
				else
					new_state <= vert6_2_y;
				end if;

			when vert6_3_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert6_3_y;

			when vert6_3_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert6_4_x;
				else
					new_state <= vert6_3_y;
				end if;

			when vert6_4_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert6_4_y;

			when vert6_4_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert6_5_x;
				else
					new_state <= vert6_4_y;
				end if;

			when vert6_5_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert6_5_y;

			when vert6_5_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert6_6_x;
				else
					new_state <= vert6_5_y;
				end if;

			when vert6_6_x =>
				-- bus output in decimal: 474
				serial_bus <= "00000111011010";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert6_6_y;

			when vert6_6_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert6_6_y;
				end if;

			when vert7_0_a =>
				-- bus output in decimal: 4
				serial_bus <= "00000000000100";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert7_0_x;

			when vert7_0_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert7_0_y;

			when vert7_0_y =>
				-- bus output in decimal: 710
				serial_bus <= "00001011000110";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert7_1_x;
				else
					new_state <= vert7_0_y;
				end if;

			when vert7_1_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert7_1_y;

			when vert7_1_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert7_2_x;
				else
					new_state <= vert7_1_y;
				end if;

			when vert7_2_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert7_2_y;

			when vert7_2_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert7_3_x;
				else
					new_state <= vert7_2_y;
				end if;

			when vert7_3_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert7_3_y;

			when vert7_3_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert7_4_x;
				else
					new_state <= vert7_3_y;
				end if;

			when vert7_4_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert7_4_y;

			when vert7_4_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert7_5_x;
				else
					new_state <= vert7_4_y;
				end if;

			when vert7_5_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert7_5_y;

			when vert7_5_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert7_6_x;
				else
					new_state <= vert7_5_y;
				end if;

			when vert7_6_x =>
				-- bus output in decimal: 410
				serial_bus <= "00000110011010";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert7_6_y;

			when vert7_6_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert7_6_y;
				end if;

			when vert8_0_a =>
				-- bus output in decimal: 6
				serial_bus <= "00000000000110";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert8_0_x;

			when vert8_0_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert8_0_y;

			when vert8_0_y =>
				-- bus output in decimal: 653
				serial_bus <= "00001010001101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert8_1_x;
				else
					new_state <= vert8_0_y;
				end if;

			when vert8_1_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert8_1_y;

			when vert8_1_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert8_2_x;
				else
					new_state <= vert8_1_y;
				end if;

			when vert8_2_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert8_2_y;

			when vert8_2_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert8_3_x;
				else
					new_state <= vert8_2_y;
				end if;

			when vert8_3_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert8_3_y;

			when vert8_3_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert8_4_x;
				else
					new_state <= vert8_3_y;
				end if;

			when vert8_4_x =>
				-- bus output in decimal: 371
				serial_bus <= "00000101110011";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert8_4_y;

			when vert8_4_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert8_4_y;
				end if;

			when vert9_0_a =>
				-- bus output in decimal: 7
				serial_bus <= "00000000000111";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert9_0_x;

			when vert9_0_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert9_0_y;

			when vert9_0_y =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert9_1_x;
				else
					new_state <= vert9_0_y;
				end if;

			when vert9_1_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert9_1_y;

			when vert9_1_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert9_2_x;
				else
					new_state <= vert9_1_y;
				end if;

			when vert9_2_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert9_2_y;

			when vert9_2_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert9_3_x;
				else
					new_state <= vert9_2_y;
				end if;

			when vert9_3_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert9_3_y;

			when vert9_3_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert9_4_x;
				else
					new_state <= vert9_3_y;
				end if;

			when vert9_4_x =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert9_4_y;

			when vert9_4_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert9_4_y;
				end if;

			when vert10_0_a =>
				-- bus output in decimal: 9
				serial_bus <= "00000000001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert10_0_x;

			when vert10_0_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert10_0_y;

			when vert10_0_y =>
				-- bus output in decimal: 548
				serial_bus <= "00001000100100";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert10_1_x;
				else
					new_state <= vert10_0_y;
				end if;

			when vert10_1_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert10_1_y;

			when vert10_1_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert10_2_x;
				else
					new_state <= vert10_1_y;
				end if;

			when vert10_2_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert10_2_y;

			when vert10_2_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert10_3_x;
				else
					new_state <= vert10_2_y;
				end if;

			when vert10_3_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert10_3_y;

			when vert10_3_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert10_4_x;
				else
					new_state <= vert10_3_y;
				end if;

			when vert10_4_x =>
				-- bus output in decimal: 230
				serial_bus <= "00000011100110";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert10_4_y;

			when vert10_4_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert10_4_y;
				end if;

			when vert11_0_a =>
				-- bus output in decimal: 11
				serial_bus <= "00000000001011";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert11_0_x;

			when vert11_0_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert11_0_y;

			when vert11_0_y =>
				-- bus output in decimal: 491
				serial_bus <= "00000111101011";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert11_1_x;
				else
					new_state <= vert11_0_y;
				end if;

			when vert11_1_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert11_1_y;

			when vert11_1_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert11_2_x;
				else
					new_state <= vert11_1_y;
				end if;

			when vert11_2_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert11_2_y;

			when vert11_2_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert11_3_x;
				else
					new_state <= vert11_2_y;
				end if;

			when vert11_3_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert11_3_y;

			when vert11_3_y =>
				-- bus output in decimal: 875
				serial_bus <= "00001101101011";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert11_3_y;
				end if;

			when vert12_0_a =>
				-- bus output in decimal: 13
				serial_bus <= "00000000001101";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert12_0_x;

			when vert12_0_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert12_0_y;

			when vert12_0_y =>
				-- bus output in decimal: 427
				serial_bus <= "00000110101011";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert12_1_x;
				else
					new_state <= vert12_0_y;
				end if;

			when vert12_1_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert12_1_y;

			when vert12_1_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert12_2_x;
				else
					new_state <= vert12_1_y;
				end if;

			when vert12_2_x =>
				-- bus output in decimal: 185
				serial_bus <= "00000010111001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert12_2_y;

			when vert12_2_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert12_2_y;
				end if;

			when vert13_0_a =>
				-- bus output in decimal: 14
				serial_bus <= "00000000001110";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert13_0_x;

			when vert13_0_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert13_0_y;

			when vert13_0_y =>
				-- bus output in decimal: 349
				serial_bus <= "00000101011101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert13_1_x;
				else
					new_state <= vert13_0_y;
				end if;

			when vert13_1_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert13_1_y;

			when vert13_1_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert13_2_x;
				else
					new_state <= vert13_1_y;
				end if;

			when vert13_2_x =>
				-- bus output in decimal: 133
				serial_bus <= "00000010000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert13_2_y;

			when vert13_2_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert13_2_y;
				end if;

			when vert14_0_a =>
				-- bus output in decimal: 16
				serial_bus <= "00000000010000";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert14_0_x;

			when vert14_0_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert14_0_y;

			when vert14_0_y =>
				-- bus output in decimal: 243
				serial_bus <= "00000011110011";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert14_1_x;
				else
					new_state <= vert14_0_y;
				end if;

			when vert14_1_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert14_1_y;

			when vert14_1_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert14_2_x;
				else
					new_state <= vert14_1_y;
				end if;

			when vert14_2_x =>
				-- bus output in decimal: 62
				serial_bus <= "00000000111110";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert14_2_y;

			when vert14_2_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert14_2_y;
				end if;

			when vert15_0_a =>
				-- bus output in decimal: 18
				serial_bus <= "00000000010010";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert15_0_x;

			when vert15_0_x =>
				-- bus output in decimal: 44
				serial_bus <= "00000000101100";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert15_0_y;

			when vert15_0_y =>
				-- bus output in decimal: 157
				serial_bus <= "00000010011101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert15_1_x;
				else
					new_state <= vert15_0_y;
				end if;

			when vert15_1_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert15_1_y;

			when vert15_1_y =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert15_2_x;
				else
					new_state <= vert15_1_y;
				end if;

			when vert15_2_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert15_2_y;

			when vert15_2_y =>
				-- bus output in decimal: 774
				serial_bus <= "00001100000110";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert15_2_y;
				end if;

			when vert16_0_a =>
				-- bus output in decimal: 20
				serial_bus <= "00000000010100";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert16_0_x;

			when vert16_0_x =>
				-- bus output in decimal: 114
				serial_bus <= "00000001110010";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert16_0_y;

			when vert16_0_y =>
				-- bus output in decimal: 87
				serial_bus <= "00000001010111";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert16_1_x;
				else
					new_state <= vert16_0_y;
				end if;

			when vert16_1_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert16_1_y;

			when vert16_1_y =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert16_2_x;
				else
					new_state <= vert16_1_y;
				end if;

			when vert16_2_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert16_2_y;

			when vert16_2_y =>
				-- bus output in decimal: 710
				serial_bus <= "00001011000110";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert16_2_y;
				end if;

			when vert17_0_a =>
				-- bus output in decimal: 21
				serial_bus <= "00000000010101";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert17_0_x;

			when vert17_0_x =>
				-- bus output in decimal: 196
				serial_bus <= "00000011000100";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert17_0_y;

			when vert17_0_y =>
				-- bus output in decimal: 5
				serial_bus <= "00000000000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert17_1_x;
				else
					new_state <= vert17_0_y;
				end if;

			when vert17_1_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert17_1_y;

			when vert17_1_y =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert17_2_x;
				else
					new_state <= vert17_1_y;
				end if;

			when vert17_2_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert17_2_y;

			when vert17_2_y =>
				-- bus output in decimal: 653
				serial_bus <= "00001010001101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert17_2_y;
				end if;

			when vert18_0_a =>
				-- bus output in decimal: 23
				serial_bus <= "00000000010111";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert18_0_x;

			when vert18_0_x =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert18_0_y;

			when vert18_0_y =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert18_1_x;
				else
					new_state <= vert18_0_y;
				end if;

			when vert18_1_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert18_1_y;

			when vert18_1_y =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert18_2_x;
				else
					new_state <= vert18_1_y;
				end if;

			when vert18_2_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert18_2_y;

			when vert18_2_y =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert18_3_x;
				else
					new_state <= vert18_2_y;
				end if;

			when vert18_3_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert18_3_y;

			when vert18_3_y =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert18_3_y;
				end if;

			when vert19_0_a =>
				-- bus output in decimal: 25
				serial_bus <= "00000000011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert19_0_x;

			when vert19_0_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert19_0_y;

			when vert19_0_y =>
				-- bus output in decimal: 33
				serial_bus <= "00000000100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert19_1_x;
				else
					new_state <= vert19_0_y;
				end if;

			when vert19_1_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert19_1_y;

			when vert19_1_y =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert19_2_x;
				else
					new_state <= vert19_1_y;
				end if;

			when vert19_2_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert19_2_y;

			when vert19_2_y =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert19_3_x;
				else
					new_state <= vert19_2_y;
				end if;

			when vert19_3_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert19_3_y;

			when vert19_3_y =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert19_4_x;
				else
					new_state <= vert19_3_y;
				end if;

			when vert19_4_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert19_4_y;

			when vert19_4_y =>
				-- bus output in decimal: 548
				serial_bus <= "00001000100100";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert19_4_y;
				end if;

			when vert20_0_a =>
				-- bus output in decimal: 27
				serial_bus <= "00000000011011";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert20_0_x;

			when vert20_0_x =>
				-- bus output in decimal: 410
				serial_bus <= "00000110011010";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert20_0_y;

			when vert20_0_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert20_1_x;
				else
					new_state <= vert20_0_y;
				end if;

			when vert20_1_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert20_1_y;

			when vert20_1_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert20_2_x;
				else
					new_state <= vert20_1_y;
				end if;

			when vert20_2_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert20_2_y;

			when vert20_2_y =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert20_3_x;
				else
					new_state <= vert20_2_y;
				end if;

			when vert20_3_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert20_3_y;

			when vert20_3_y =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert20_4_x;
				else
					new_state <= vert20_3_y;
				end if;

			when vert20_4_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert20_4_y;

			when vert20_4_y =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert20_5_x;
				else
					new_state <= vert20_4_y;
				end if;

			when vert20_5_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert20_5_y;

			when vert20_5_y =>
				-- bus output in decimal: 491
				serial_bus <= "00000111101011";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert20_5_y;
				end if;

			when vert21_0_a =>
				-- bus output in decimal: 28
				serial_bus <= "00000000011100";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert21_0_x;

			when vert21_0_x =>
				-- bus output in decimal: 474
				serial_bus <= "00000111011010";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert21_0_y;

			when vert21_0_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert21_1_x;
				else
					new_state <= vert21_0_y;
				end if;

			when vert21_1_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert21_1_y;

			when vert21_1_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert21_2_x;
				else
					new_state <= vert21_1_y;
				end if;

			when vert21_2_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert21_2_y;

			when vert21_2_y =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert21_3_x;
				else
					new_state <= vert21_2_y;
				end if;

			when vert21_3_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert21_3_y;

			when vert21_3_y =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert21_4_x;
				else
					new_state <= vert21_3_y;
				end if;

			when vert21_4_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert21_4_y;

			when vert21_4_y =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert21_5_x;
				else
					new_state <= vert21_4_y;
				end if;

			when vert21_5_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert21_5_y;

			when vert21_5_y =>
				-- bus output in decimal: 427
				serial_bus <= "00000110101011";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert21_5_y;
				end if;

			when vert22_0_a =>
				-- bus output in decimal: 30
				serial_bus <= "00000000011110";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert22_0_x;

			when vert22_0_x =>
				-- bus output in decimal: 552
				serial_bus <= "00001000101000";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert22_0_y;

			when vert22_0_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert22_1_x;
				else
					new_state <= vert22_0_y;
				end if;

			when vert22_1_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert22_1_y;

			when vert22_1_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert22_2_x;
				else
					new_state <= vert22_1_y;
				end if;

			when vert22_2_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert22_2_y;

			when vert22_2_y =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert22_3_x;
				else
					new_state <= vert22_2_y;
				end if;

			when vert22_3_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert22_3_y;

			when vert22_3_y =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert22_4_x;
				else
					new_state <= vert22_3_y;
				end if;

			when vert22_4_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert22_4_y;

			when vert22_4_y =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert22_5_x;
				else
					new_state <= vert22_4_y;
				end if;

			when vert22_5_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert22_5_y;

			when vert22_5_y =>
				-- bus output in decimal: 349
				serial_bus <= "00000101011101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert22_5_y;
				end if;

			when vert23_0_a =>
				-- bus output in decimal: 32
				serial_bus <= "00000000100000";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert23_0_x;

			when vert23_0_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert23_0_y;

			when vert23_0_y =>
				-- bus output in decimal: 349
				serial_bus <= "00000101011101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert23_1_x;
				else
					new_state <= vert23_0_y;
				end if;

			when vert23_1_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert23_1_y;

			when vert23_1_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert23_2_x;
				else
					new_state <= vert23_1_y;
				end if;

			when vert23_2_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert23_2_y;

			when vert23_2_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert23_3_x;
				else
					new_state <= vert23_2_y;
				end if;

			when vert23_3_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert23_3_y;

			when vert23_3_y =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert23_4_x;
				else
					new_state <= vert23_3_y;
				end if;

			when vert23_4_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert23_4_y;

			when vert23_4_y =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert23_5_x;
				else
					new_state <= vert23_4_y;
				end if;

			when vert23_5_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert23_5_y;

			when vert23_5_y =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert23_6_x;
				else
					new_state <= vert23_5_y;
				end if;

			when vert23_6_x =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert23_6_y;

			when vert23_6_y =>
				-- bus output in decimal: 243
				serial_bus <= "00000011110011";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert23_6_y;
				end if;

			when vert24_0_a =>
				-- bus output in decimal: 34
				serial_bus <= "00000000100010";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert24_0_x;

			when vert24_0_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert24_0_y;

			when vert24_0_y =>
				-- bus output in decimal: 427
				serial_bus <= "00000110101011";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert24_1_x;
				else
					new_state <= vert24_0_y;
				end if;

			when vert24_1_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert24_1_y;

			when vert24_1_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert24_2_x;
				else
					new_state <= vert24_1_y;
				end if;

			when vert24_2_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert24_2_y;

			when vert24_2_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert24_3_x;
				else
					new_state <= vert24_2_y;
				end if;

			when vert24_3_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert24_3_y;

			when vert24_3_y =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert24_4_x;
				else
					new_state <= vert24_3_y;
				end if;

			when vert24_4_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert24_4_y;

			when vert24_4_y =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert24_5_x;
				else
					new_state <= vert24_4_y;
				end if;

			when vert24_5_x =>
				-- bus output in decimal: 44
				serial_bus <= "00000000101100";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert24_5_y;

			when vert24_5_y =>
				-- bus output in decimal: 157
				serial_bus <= "00000010011101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert24_5_y;
				end if;

			when vert25_0_a =>
				-- bus output in decimal: 35
				serial_bus <= "00000000100011";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert25_0_x;

			when vert25_0_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert25_0_y;

			when vert25_0_y =>
				-- bus output in decimal: 491
				serial_bus <= "00000111101011";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert25_1_x;
				else
					new_state <= vert25_0_y;
				end if;

			when vert25_1_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert25_1_y;

			when vert25_1_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert25_2_x;
				else
					new_state <= vert25_1_y;
				end if;

			when vert25_2_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert25_2_y;

			when vert25_2_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert25_3_x;
				else
					new_state <= vert25_2_y;
				end if;

			when vert25_3_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert25_3_y;

			when vert25_3_y =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert25_4_x;
				else
					new_state <= vert25_3_y;
				end if;

			when vert25_4_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert25_4_y;

			when vert25_4_y =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert25_5_x;
				else
					new_state <= vert25_4_y;
				end if;

			when vert25_5_x =>
				-- bus output in decimal: 114
				serial_bus <= "00000001110010";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert25_5_y;

			when vert25_5_y =>
				-- bus output in decimal: 87
				serial_bus <= "00000001010111";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert25_5_y;
				end if;

			when vert26_0_a =>
				-- bus output in decimal: 37
				serial_bus <= "00000000100101";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert26_0_x;

			when vert26_0_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert26_0_y;

			when vert26_0_y =>
				-- bus output in decimal: 548
				serial_bus <= "00001000100100";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert26_1_x;
				else
					new_state <= vert26_0_y;
				end if;

			when vert26_1_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert26_1_y;

			when vert26_1_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert26_2_x;
				else
					new_state <= vert26_1_y;
				end if;

			when vert26_2_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert26_2_y;

			when vert26_2_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert26_3_x;
				else
					new_state <= vert26_2_y;
				end if;

			when vert26_3_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert26_3_y;

			when vert26_3_y =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert26_4_x;
				else
					new_state <= vert26_3_y;
				end if;

			when vert26_4_x =>
				-- bus output in decimal: 201
				serial_bus <= "00000011001001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert26_4_y;

			when vert26_4_y =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert26_5_x;
				else
					new_state <= vert26_4_y;
				end if;

			when vert26_5_x =>
				-- bus output in decimal: 196
				serial_bus <= "00000011000100";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert26_5_y;

			when vert26_5_y =>
				-- bus output in decimal: 5
				serial_bus <= "00000000000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert26_5_y;
				end if;

			when vert27_0_a =>
				-- bus output in decimal: 39
				serial_bus <= "00000000100111";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert27_0_x;

			when vert27_0_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert27_0_y;

			when vert27_0_y =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert27_1_x;
				else
					new_state <= vert27_0_y;
				end if;

			when vert27_1_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert27_1_y;

			when vert27_1_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert27_2_x;
				else
					new_state <= vert27_1_y;
				end if;

			when vert27_2_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert27_2_y;

			when vert27_2_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert27_3_x;
				else
					new_state <= vert27_2_y;
				end if;

			when vert27_3_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert27_3_y;

			when vert27_3_y =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert27_4_x;
				else
					new_state <= vert27_3_y;
				end if;

			when vert27_4_x =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert27_4_y;

			when vert27_4_y =>
				-- bus output in decimal: 1
				serial_bus <= "00000000000001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert27_4_y;
				end if;

			when vert28_0_a =>
				-- bus output in decimal: 41
				serial_bus <= "00000000101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert28_0_x;

			when vert28_0_x =>
				-- bus output in decimal: 764
				serial_bus <= "00001011111100";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert28_0_y;

			when vert28_0_y =>
				-- bus output in decimal: 682
				serial_bus <= "00001010101010";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert28_1_x;
				else
					new_state <= vert28_0_y;
				end if;

			when vert28_1_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert28_1_y;

			when vert28_1_y =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert28_2_x;
				else
					new_state <= vert28_1_y;
				end if;

			when vert28_2_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert28_2_y;

			when vert28_2_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert28_3_x;
				else
					new_state <= vert28_2_y;
				end if;

			when vert28_3_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert28_3_y;

			when vert28_3_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert28_4_x;
				else
					new_state <= vert28_3_y;
				end if;

			when vert28_4_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert28_4_y;

			when vert28_4_y =>
				-- bus output in decimal: 33
				serial_bus <= "00000000100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert28_4_y;
				end if;

			when vert29_0_a =>
				-- bus output in decimal: 42
				serial_bus <= "00000000101010";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert29_0_x;

			when vert29_0_x =>
				-- bus output in decimal: 706
				serial_bus <= "00001011000010";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert29_0_y;

			when vert29_0_y =>
				-- bus output in decimal: 748
				serial_bus <= "00001011101100";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert29_1_x;
				else
					new_state <= vert29_0_y;
				end if;

			when vert29_1_x =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert29_1_y;

			when vert29_1_y =>
				-- bus output in decimal: 701
				serial_bus <= "00001010111101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert29_2_x;
				else
					new_state <= vert29_1_y;
				end if;

			when vert29_2_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert29_2_y;

			when vert29_2_y =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert29_3_x;
				else
					new_state <= vert29_2_y;
				end if;

			when vert29_3_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert29_3_y;

			when vert29_3_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert29_4_x;
				else
					new_state <= vert29_3_y;
				end if;

			when vert29_4_x =>
				-- bus output in decimal: 410
				serial_bus <= "00000110011010";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert29_4_y;

			when vert29_4_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert29_4_y;
				end if;

			when vert30_0_a =>
				-- bus output in decimal: 44
				serial_bus <= "00000000101100";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert30_0_x;

			when vert30_0_x =>
				-- bus output in decimal: 625
				serial_bus <= "00001001110001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert30_0_y;

			when vert30_0_y =>
				-- bus output in decimal: 788
				serial_bus <= "00001100010100";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert30_1_x;
				else
					new_state <= vert30_0_y;
				end if;

			when vert30_1_x =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert30_1_y;

			when vert30_1_y =>
				-- bus output in decimal: 701
				serial_bus <= "00001010111101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert30_2_x;
				else
					new_state <= vert30_1_y;
				end if;

			when vert30_2_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert30_2_y;

			when vert30_2_y =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert30_3_x;
				else
					new_state <= vert30_2_y;
				end if;

			when vert30_3_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert30_3_y;

			when vert30_3_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert30_4_x;
				else
					new_state <= vert30_3_y;
				end if;

			when vert30_4_x =>
				-- bus output in decimal: 474
				serial_bus <= "00000111011010";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert30_4_y;

			when vert30_4_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert30_4_y;
				end if;

			when vert31_0_a =>
				-- bus output in decimal: 46
				serial_bus <= "00000000101110";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert31_0_x;

			when vert31_0_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert31_0_y;

			when vert31_0_y =>
				-- bus output in decimal: 852
				serial_bus <= "00001101010100";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert31_1_x;
				else
					new_state <= vert31_0_y;
				end if;

			when vert31_1_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert31_1_y;

			when vert31_1_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert31_2_x;
				else
					new_state <= vert31_1_y;
				end if;

			when vert31_2_x =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert31_2_y;

			when vert31_2_y =>
				-- bus output in decimal: 701
				serial_bus <= "00001010111101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert31_3_x;
				else
					new_state <= vert31_2_y;
				end if;

			when vert31_3_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert31_3_y;

			when vert31_3_y =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert31_4_x;
				else
					new_state <= vert31_3_y;
				end if;

			when vert31_4_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert31_4_y;

			when vert31_4_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert31_5_x;
				else
					new_state <= vert31_4_y;
				end if;

			when vert31_5_x =>
				-- bus output in decimal: 552
				serial_bus <= "00001000101000";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert31_5_y;

			when vert31_5_y =>
				-- bus output in decimal: 301
				serial_bus <= "00000100101101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert31_5_y;
				end if;

			when vert32_0_a =>
				-- bus output in decimal: 48
				serial_bus <= "00000000110000";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert32_0_x;

			when vert32_0_x =>
				-- bus output in decimal: 552
				serial_bus <= "00001000101000";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert32_0_y;

			when vert32_0_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert32_1_x;
				else
					new_state <= vert32_0_y;
				end if;

			when vert32_1_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert32_1_y;

			when vert32_1_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert32_2_x;
				else
					new_state <= vert32_1_y;
				end if;

			when vert32_2_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert32_2_y;

			when vert32_2_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert32_3_x;
				else
					new_state <= vert32_2_y;
				end if;

			when vert32_3_x =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert32_3_y;

			when vert32_3_y =>
				-- bus output in decimal: 701
				serial_bus <= "00001010111101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert32_4_x;
				else
					new_state <= vert32_3_y;
				end if;

			when vert32_4_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert32_4_y;

			when vert32_4_y =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert32_5_x;
				else
					new_state <= vert32_4_y;
				end if;

			when vert32_5_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert32_5_y;

			when vert32_5_y =>
				-- bus output in decimal: 349
				serial_bus <= "00000101011101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert32_5_y;
				end if;

			when vert33_0_a =>
				-- bus output in decimal: 49
				serial_bus <= "00000000110001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert33_0_x;

			when vert33_0_x =>
				-- bus output in decimal: 474
				serial_bus <= "00000111011010";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert33_0_y;

			when vert33_0_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert33_1_x;
				else
					new_state <= vert33_0_y;
				end if;

			when vert33_1_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert33_1_y;

			when vert33_1_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert33_2_x;
				else
					new_state <= vert33_1_y;
				end if;

			when vert33_2_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert33_2_y;

			when vert33_2_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert33_3_x;
				else
					new_state <= vert33_2_y;
				end if;

			when vert33_3_x =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert33_3_y;

			when vert33_3_y =>
				-- bus output in decimal: 701
				serial_bus <= "00001010111101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert33_4_x;
				else
					new_state <= vert33_3_y;
				end if;

			when vert33_4_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert33_4_y;

			when vert33_4_y =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert33_5_x;
				else
					new_state <= vert33_4_y;
				end if;

			when vert33_5_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert33_5_y;

			when vert33_5_y =>
				-- bus output in decimal: 427
				serial_bus <= "00000110101011";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert33_5_y;
				end if;

			when vert34_0_a =>
				-- bus output in decimal: 51
				serial_bus <= "00000000110011";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert34_0_x;

			when vert34_0_x =>
				-- bus output in decimal: 410
				serial_bus <= "00000110011010";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert34_0_y;

			when vert34_0_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert34_1_x;
				else
					new_state <= vert34_0_y;
				end if;

			when vert34_1_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert34_1_y;

			when vert34_1_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert34_2_x;
				else
					new_state <= vert34_1_y;
				end if;

			when vert34_2_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert34_2_y;

			when vert34_2_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert34_3_x;
				else
					new_state <= vert34_2_y;
				end if;

			when vert34_3_x =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert34_3_y;

			when vert34_3_y =>
				-- bus output in decimal: 701
				serial_bus <= "00001010111101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert34_4_x;
				else
					new_state <= vert34_3_y;
				end if;

			when vert34_4_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert34_4_y;

			when vert34_4_y =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert34_5_x;
				else
					new_state <= vert34_4_y;
				end if;

			when vert34_5_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert34_5_y;

			when vert34_5_y =>
				-- bus output in decimal: 491
				serial_bus <= "00000111101011";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert34_5_y;
				end if;

			when vert35_0_a =>
				-- bus output in decimal: 53
				serial_bus <= "00000000110101";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert35_0_x;

			when vert35_0_x =>
				-- bus output in decimal: 371
				serial_bus <= "00000101110011";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert35_0_y;

			when vert35_0_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert35_1_x;
				else
					new_state <= vert35_0_y;
				end if;

			when vert35_1_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert35_1_y;

			when vert35_1_y =>
				-- bus output in decimal: 1001
				serial_bus <= "00001111101001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert35_2_x;
				else
					new_state <= vert35_1_y;
				end if;

			when vert35_2_x =>
				-- bus output in decimal: 401
				serial_bus <= "00000110010001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert35_2_y;

			when vert35_2_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert35_3_x;
				else
					new_state <= vert35_2_y;
				end if;

			when vert35_3_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert35_3_y;

			when vert35_3_y =>
				-- bus output in decimal: 901
				serial_bus <= "00001110000101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert35_4_x;
				else
					new_state <= vert35_3_y;
				end if;

			when vert35_4_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert35_4_y;

			when vert35_4_y =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert35_5_x;
				else
					new_state <= vert35_4_y;
				end if;

			when vert35_5_x =>
				-- bus output in decimal: 801
				serial_bus <= "00001100100001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert35_5_y;

			when vert35_5_y =>
				-- bus output in decimal: 701
				serial_bus <= "00001010111101";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert35_6_x;
				else
					new_state <= vert35_5_y;
				end if;

			when vert35_6_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert35_6_y;

			when vert35_6_y =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= vert35_7_x;
				else
					new_state <= vert35_6_y;
				end if;

			when vert35_7_x =>
				-- bus output in decimal: 601
				serial_bus <= "00001001011001";
				new_pointer <= pointer;
				eof_flag <= '0';

				new_state <= vert35_7_y;

			when vert35_7_y =>
				-- bus output in decimal: 548
				serial_bus <= "00001000100100";
				new_pointer <= pointer;
				eof_flag <= '0';

				if (rdy = '1') then
					new_state <= EOF;
				else
					new_state <= vert35_7_y;
				end if;
		end case;
	end process;
end architecture;
