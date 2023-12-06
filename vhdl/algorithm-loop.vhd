
-- this is an FSM for the line drawing algorithm. 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity algorithm is
    port (
	clk		: in std_logic;
	reset		: in std_logic;
	mux   		: in std_logic;
	enable		: in std_logic;

	start_pos_1 	: in std_logic_vector(8 downto 0);
	start_pos_2	: in std_logic_vector(8 downto 0);
        right_cond	: in std_logic_vector(8 downto 0);

        dxy1		: in std_logic_vector(8 downto 0);
        dxy2		: in std_logic_vector(8 downto 0);

	adress		: out std_logic_vector(15 downto 0);
	ready		: out std_logic    );
end entity algorithm;

architecture behavioural of algorithm is

	type loop_states is (		reset_state,
					populate,
					for_loop,

					draw_1, -- adress out
					mirror, -- 199 - y 
					draw_2, -- adress out

					e_calc, -- e + dy or e + dx (MUX = '0')
					e_compare, 
					e_calc1, -- e - dx or e - dy (MUX = '0')

					count_increase, -- x+1 or y + 1 (MUX = '0')
					sec_count_increase, -- y+1 or x+1 (MUX = '0')
					done);
	
	signal state, next_state: loop_states;


signal position, new_position: unsigned(8 downto 0);
signal sec_position, new_sec_position: unsigned(8 downto 0);
signal e_count, new_e_count: signed(14 downto 0);

signal draw_x_sig: unsigned(8 downto 0);
signal draw_y_sig: unsigned(7 downto 0);
signal mirror_y: unsigned(7 downto 0);

signal shift_in_sign, shift_out_sign: std_logic_vector(14 downto 0);

component bitshift_left is
	port(
		input  : in  std_logic_vector(14 downto 0);	
		output : out std_logic_vector(14 downto 0);
		flag   : out std_logic
	);
end component;

component adders is
	port(
		add_1: in std_logic_vector(15 downto 0);
		add_2: in std_logic_vector(15 downto 0);
		sub:	in std_logic_vector(15 downto 0);
		sel:	in std_logic;
		result: out std_logic_vector(15 downto 0));
end component;


signal add_1_sig, add_2_sig, sub_sig, result_adder_sig: std_logic_vector(15 downto 0);
signal sel_sig: std_logic;


begin

bitshift: bitshift_left
port map(
	input => shift_in_sign,
	output => shift_out_sign,
	flag => open);

addsub: adders
port map(
	add_1 => add_1_sig,
	add_2 => add_2_sig,
	sub   => sub_sig,
	result => result_adder_sig,
	sel => sel_sig);



	process (clk)
	begin	
		if (rising_edge (clk)) then
			if (reset = '1') then
				state <= reset_state;

				position <= (others => '0') ;
				sec_position <= (others => '0');
				e_count <= (others => '0');

			else 
				state <= next_state;
				position <= new_position+1;
				sec_position <= new_sec_position+1;
				e_count <= new_e_count;

			end if;
		end if;
	end process;

	process (state)
	begin
		case state is
			when reset_state => 
				shift_in_sign <= (others => '0');
				add_1_sig <= (others => '0');
				add_2_sig <= (others => '0');
				sub_sig <= (others => '0');
				sel_sig <= '0';

				adress <= (others => '0');
				ready <= '0';

				new_position <= (others => '0');
				new_sec_position <= (others => '0');
				new_e_count <= (others => '0');

				if (enable = '1') then
					next_state <= populate;
				else
					next_state <= reset_state;

			when populate => 
				shift_in_sign <= (others => '0');
				add_1_sig <= (others => '0');
				add_2_sig <= (others => '0');
				sub_sig <= (others => '0');
				sel_sig <= '0';

				adress <= (others => '0');
				ready <= '0';

				new_position <= unsigned(start_pos_1);
				new_sec_position <= unsigned(start_pos_2);
				new_e_count <= (others => '0');

				next_state <= for_loop;
			
		
			when for_loop =>

				shift_in_sign <= (others => '0');
				add_1_sig <= (others => '0');
				add_2_sig <= (others => '0');
				sub_sig <= (others => '0');
				sel_sig <= '0';

				adress <= (others => '0');
				ready <= '0';

				new_position <= position;
				new_sec_position <= sec_position;
				new_e_count <= e_count;

				if (unsigned(position) < unsigned(right_cond)) then
					next_state <= done;
				else
					next_state <= draw_1;
				end if;

			when done =>
				shift_in_sign <= (others => '0');
				add_1_sig <= (others => '0');
				add_2_sig <= (others => '0');
				sub_sig <= (others => '0');
				sel_sig <= '0';

				adress <= (others => '0');
				ready <= '0';

				new_position <= position;
				new_sec_position <= sec_position;
				new_e_count <= e_count;

				if (enable = '1') then
					next_state <= reset_state;
				else
					next_state <= done;
				end if;


			when draw_1 =>
					if (MUX = '1') then
						draw_x_sig <= position;
						draw_y_sig <= sec_position(7 downto 0);
					else
						draw_x_sig <= sec_position;
						draw_y_sig <= position(7 downto 0);
					end if;

				shift_in_sign <= (others => '0');
				add_1_sig <= ((draw_y_sig & "00000") * unsigned("1010"));
				add_2_sig <= (others=> '0');
				sub_sig <= ("00000000" & std_logic_vector(draw_y_sig));
				sel_sig <= '1';

				mirror_y <= unsigned(result_adder_sig(7 downto 0));

				new_position <= position;
				new_sec_position <= sec_position;
				new_e_count <= e_count;

				adress <= "1111111111111111"; --320draw_y_sig+draw_x_sig
				ready <= '1';

				next_state <= mirror;


			when mirror =>
				shift_in_sign <= (others => '0');
				add_1_sig <= "0000000011000111";
				add_2_sig <= (others=> '0');
				sub_sig <= ("00000000" & std_logic_vector(draw_y_sig));
				sel_sig <= '1';

				mirror_y <= unsigned(result_adder_sig(7 downto 0));

				new_position <= position;
				new_sec_position <= sec_position;
				new_e_count <= e_count;

				adress <= (others => '0');
				ready <= '0';

				next_state <= draw_2;


			when draw_2 =>
				shift_in_sign <= (others => '0');
				add_1_sig <= (others => '0');
				add_2_sig <= (others => '0');
				sub_sig <= (others => '0');
				sel_sig <= '0';

				new_position <= position;
				new_sec_position <= sec_position;
				new_e_count <= e_count;

				adress <= "1010101010101010"; -- 320y_mirror+position;
				ready <= '1';

				next_state <=e_calc;


			when e_calc =>
				shift_in_sign <= (others => '0');
				add_1_sig <= std_logic_vector(e_count(14) & '0' & e_count(13 downto 0));
				add_2_sig <= std_logic_vector("0000000"& dxy1);
				sub_sig <= (others => '0');
				sel_sig <= '0';

				new_position <= position;
				new_sec_position <= sec_position;
				new_e_count <= signed(result_adder_sig(15) & result_adder_sig(13 downto 0));	

				adress <= (others => '0');
				ready <= '0';

				next_state <= e_compare;


			when e_compare =>
				shift_in_sign <= (others => '0');
				add_1_sig <= (others => '0');
				add_2_sig <= (others => '0');
				sub_sig <= (others => '0');
				sel_sig <= '0';

				adress <= (others => '0');
				ready <= '0';

				new_position <= position;
				new_sec_position <= sec_position;
				new_e_count <= e_count;

				shift_in_sign <= std_logic_vector(e_count);
				if (signed(shift_out_sign) > signed("000000" & dxy2)) then
					next_state <=e_calc1;
				else
					next_state <=count_increase;
				end if;


			when e_calc1 =>
				add_1_sig <= std_logic_vector(e_count(14)&"0"&e_count(13 downto 0));
				add_2_sig <= (others => '0');
				sub_sig <= (std_logic_vector("0000000"& dxy2));
				sel_sig <= '1';

				adress <= (others => '0');
				ready <= '0';

				new_position <= position;
				new_sec_position <= sec_position;
				new_e_count <= signed(result_adder_sig(15) & result_adder_sig(13 downto 0));

				next_state <= sec_count_increase;


			when sec_count_increase => 
				shift_in_sign <= (others => '0');
				add_1_sig <= (others => '0');
				add_2_sig <= (others => '0');
				sub_sig <= (others => '0');
				sel_sig <= '0';

				adress <= (others => '0');
				ready <= '0';

				new_position <= position;
				new_sec_position <= sec_position+1;
				new_e_count <= e_count;

				next_state <= count_increase;


			when count_increase =>
				shift_in_sign <= (others => '0');
				add_1_sig <= (others => '0');
				add_2_sig <= (others => '0');
				sub_sig <= (others => '0');
				sel_sig <= '0';

				adress <= (others => '0');
				ready <= '0';

				new_position <= position+1;
				new_sec_position <= sec_position;
				new_e_count <= e_count;

				next_state <= for_loop;

			when others =>

				shift_in_sign <= (others => '0');
				add_1_sig <= (others => '0');
				add_2_sig <= (others => '0');
				sub_sig <= (others => '0');
				sel_sig <= '0';

				adress <= (others => '0');
				ready <= '0';

				new_position <= position;
				new_sec_position <= sec_position;
				new_e_count <= e_count;

				next_state <= reset_state;

		
				
		end case;
	end process;	
end architecture behavioural;