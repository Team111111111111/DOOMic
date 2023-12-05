LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity pipeline_controler is
	port (
		clk 		: in std_logic;
		res 		: in std_logic;
		
		output_bus 	: in std_logic_vector (15 downto 0);
		input_bus	: in std_logic_vector (13 downto 0);
		h_rdy		: in std_logic;
		v_rdy		: in std_logic;
		h_enable	: out std_logic;
		v_enable	: out std_logic;
		transmit	: out std_logic
	);
end pipeline_controler; 

architecture behavioural of pipeline_controler is

	type pc_state is ( reset, v_line0, v_line, h_line, txv0, txv, txh);

	signal state, new_state : lov_state;

begin
	process (clk)
	begin
		if (clk'event and clk = '1') then
			if (res = '1') then
				state <= reset;

			else
				state <= new_state;

			end if;
		end if;
	end process;


	process (clk, state, new_state)
	begin
		case state is
			when reset =>
				h_enable <= '0';
				v_enable <= '0';
				transmit <= '0';

				new_state <= v_line0;

			when v_line0 =>
				h_enable <= '0';
				v_enable <= '1';
				transmit <= '0';

				if (v_rdy = '1') then
					new_state <= txv0;

				else
					new_state <= v_line0;

				end if;

			when txv0 =>
				h_enable <= '0';
				v_enable <= '1';
				transmit <= '1';

				if (output_bus = "0000000000000000") then
					new_state <= v_line;

				else
					new_state <= txv0;

				end if;


			when v_line =>
				h_enable <= '0';
				v_enable <= '1';
				transmit <= '0';

				if (v_rdy = '1') then
					new_state <= txv;

				else
					new_state <= v_line;

				end if;

			when txv =>
				h_enable <= '0';
				v_enable <= '1';
				transmit <= '1';

				if (output_bus = "0000000000000000") then
					new_state <= h_line;

				else
					new_state <= txv;

				end if;
				
			when h_line =>
				h_enable <= '1';
				v_enable <= '0';
				transmit <= '0';

				if (rdy = '1') then
					new_state <= txh;

				else
					new_state <= h_line;

				end if;

			when txh =>
				h_enable <= '1';
				v_enable <= '0';
				transmit <= '1';

				if (input_bus = "11111111111111") then
					new_state <= reset;

				elsif (output_bus = "0000000000000000") then
					new_state <= v_line;

				else
					new_state <= txh;

				end if;
		end case;
	end process;
end architecture;
