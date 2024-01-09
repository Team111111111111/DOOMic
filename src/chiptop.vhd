library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity chip_top is
	port (
	clk : in std_logic;
	reset : in std_logic;

	serial_bus : in std_logic_vector(13 downto 0);
	addrress : out std_logic_vector(15 downto 0)
);
	
end entity;



architecture behavioural of chip_top is

component h_line is
	port (	clk 		: in std_logic;
        	reset 		: in std_logic;
		shift 		: in std_logic;		-- from v-line 
		enable 		: in std_logic;		-- from controller

        	x_in 		: in std_logic_vector(8 downto 0);	-- from v-line
        	y_top 		: in std_logic_vector(7 downto 0);	-- from v-line
        	y_bot 		: in std_logic_vector(7 downto 0);	-- from v-line

		address_out 	: out std_logic_vector(15 downto 0);	-- to bus
		ready		: out std_logic				-- to bus controller
    );
end component;


component v_line is
    generic (
        nr_of_buffers : integer := 7
    );
    port (
        clk : in std_logic;
        res : in std_logic;

        data_in : in std_logic_vector(13 downto 0);

        a_out : out std_logic_vector(8 downto 0);
        b_top_out : out std_logic_vector(7 downto 0);
        b_bot_out : out std_logic_vector(7 downto 0);
    
        ready_out_h : out std_logic;
        ready_out_bus: out std_logic;
        bus_empty_in : in std_logic;
        adress_out : out std_logic_vector(15 downto 0)
    );
end component v_line;

component reg16 is
   port(REG_IN : in  std_logic_vector(15 downto 0);
	REG_OUT: out std_logic_vector(15 downto 0);
	clk, enable, reset: in std_logic);
end component;


component reg14 is
   port(REG_IN : in  std_logic_vector(13 downto 0);
	REG_OUT: out std_logic_vector(13 downto 0);
	clk, reset: in std_logic);
end component;

component pipeline_controler is
   port(clk        : in  std_logic;
        res        : in  std_logic;
        input_bus  : in  std_logic_vector(13 downto 0);
        h_rdy      : in  std_logic;
	    v_rdy      : in  std_logic;
        h_enable   : out std_logic;
        v_enable   : out std_logic;
        transmit   : out std_logic);
end component;


signal buffer_bsp, buffer_bsp_to_bus: std_logic_vector(13 downto 0);
signal address_to_outbuffer: std_logic_vector(15 downto 0);
signal v_to_h_x: std_logic_vector(8 downto 0);
signal v_to_h_y_top, v_to_h_y_bot : std_logic_vector(7 downto 0);
signal v_to_bus_ready, bus_to_v_enable, bus_to_h_enable, h_to_bus_ready, bus_to_outbuffer_enable, v_to_h_shift: std_logic;

begin
	reg_out: reg16 port map(clk	=> clk,
				reset	=> reset,
				enable	=> bus_to_outbuffer_enable,
				REG_IN	=> address_to_outbuffer,
				REG_OUT	=> addrress
				);






	reg_in: reg14 port map(clk		=> clk,
				reset		=> reset,
				REG_IN		=> serial_bus,		
				REG_OUT		=> buffer_bsp
				);






	contr: pipeline_controler port map(clk	=> clk,
				res		=> reset,
				input_bus	=> buffer_bsp_to_bus,
				h_rdy		=> h_to_bus_ready,
				v_rdy		=> v_to_bus_ready,
				h_enable	=> bus_to_h_enable,
				v_enable	=> bus_to_v_enable,
				transmit	=> bus_to_outbuffer_enable
				
				);


	ver:	v_line port map(clk			=>	clk,
				res			=>	reset,
				data_in			=>	buffer_bsp,
				a_out			=>	v_to_h_x,
				b_top_out		=>	v_to_h_y_top,
				b_bot_out		=>	v_to_h_y_bot,
				ready_out_h		=>	v_to_h_shift,
				ready_out_bus		=>	v_to_bus_ready,
				bus_empty_in		=>	bus_to_v_enable,
				adress_out		=>	address_to_outbuffer
				);




	hor:	h_line port map(clk		=>	clk,
				reset		=>	reset,
				shift		=>	v_to_h_shift,
				enable		=>	bus_to_h_enable,
				x_in		=>	v_to_h_x,
				y_top		=>	v_to_h_y_top,
				y_bot		=>	v_to_h_y_bot,
				address_out	=>	address_to_outbuffer,
				ready		=>	h_to_bus_ready
				);
end architecture behavioural;
