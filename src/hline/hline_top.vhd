library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity h_line is
	port (	clk 		: in std_logic;
        	reset 		: in std_logic;
		shift 		: in std_logic;
		enable 		: in std_logic;

        	x_in 		: in std_logic_vector(8 downto 0);
        	y_top 		: in std_logic_vector(7 downto 0);
        	y_bot 		: in std_logic_vector(7 downto 0);

		adress_out 	: out std_logic_vector(15 downto 0);
		ready		: out std_logic
    );
end entity h_line;

architecture behavioural of h_line is

component reg is
	port(
		clk 		: in std_logic;
      	  	reset 		: in std_logic;
		shift 		: in std_logic;

      	  	x_in 		: in std_logic_vector(8 downto 0);
     	  	y_top 		: in std_logic_vector(7 downto 0);
     	   	y_bot 		: in std_logic_vector(7 downto 0);

       	 	x1_out 		: out std_logic_vector(8 downto 0);
        	y1_top 		: out std_logic_vector(7 downto 0);
        	y2_bot 		: out std_logic_vector(7 downto 0);

        	x2_out 		: out std_logic_vector(8 downto 0);
        	y3_top 		: out std_logic_vector(7 downto 0);
        	y4_bot 		: out std_logic_vector(7 downto 0)
	);
end component;

component comb is
	port(	clk		: in std_logic;
        	x1		: in std_logic_vector(8 downto 0);
  	      	y1		: in std_logic_vector(7 downto 0);
        	y2		: in std_logic_vector(7 downto 0);

  	      	x2		: in std_logic_vector(8 downto 0);
        	y3		: in std_logic_vector(7 downto 0);
  	      	y4		: in std_logic_vector(7 downto 0);

		right_cond_out	: out std_logic_vector(8 downto 0);
		start_pos_1_out	: out std_logic_vector(8 downto 0);
		start_pos_2_out : out std_logic_vector(8 downto 0);

		dxy1_out	: out std_logic_vector(8 downto 0);
		dxy2_out	: out std_logic_vector(8 downto 0);

		mux_out 	: out std_logic
	);
end component;


component algorithm is
	port(
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
		ready		: out std_logic   
	);
end component;

signal x1_signal, x2_signal: std_logic_vector(8 downto 0);
signal y1_signal, y2_signal, y3_signal, y4_signal: std_logic_vector(7 downto 0);
signal right_cond_sig, start_pos_1_sig, start_pos_2_sig, dxy1_sig, dxy2_sig: std_logic_vector(8 downto 0);
signal mux_sig: std_logic;

begin
	buff: reg port map(	clk	=> clk,
				reset	=> reset,
				shift	=> shift,
				x_in	=> x_in,
				y_top	=> y_top,
				y_bot	=> y_bot,
				x1_out	=> x1_signal,
				y1_top	=> y1_signal,
				y2_bot	=> y2_signal,
				x2_out	=> x2_signal,
				y3_top	=> y3_signal,
				y4_bot	=> y4_signal
				);

	set_para: comb port map(clk		=> clk,
				x1		=> x1_signal,
				y1		=> y1_signal,		
				y2		=> y2_signal,
				x2		=> x2_signal,
				y3		=> y3_signal,
				y4		=> y4_signal,
				right_cond_out	=> right_cond_sig,
				start_pos_1_out	=> start_pos_1_sig,
				start_pos_2_out	=> start_pos_2_sig,
				dxy1_out	=> dxy1_sig,
				dxy2_out	=> dxy2_sig,
				mux_out		=> mux_sig
				);

	alg: algorithm port map(clk		=> clk,
				reset		=> reset,
				mux		=> mux_sig,
				enable		=> enable,
				start_pos_1	=> start_pos_1_sig,
				start_pos_2	=> start_pos_2_sig,
				right_cond	=> right_cond_sig,
				dxy1		=> dxy1_sig,
				dxy2		=> dxy2_sig,
				adress		=> adress_out,
				ready		=> ready
				);
end architecture behavioural;