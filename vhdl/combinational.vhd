library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity comb is
    port (
	clk		: in std_logic;
        x1		: in std_logic_vector(8 downto 0);
        y1		: in std_logic_vector(7 downto 0);
        y2		: in std_logic_vector(7 downto 0);

        x2		: in std_logic_vector(8 downto 0);
        y3		: in std_logic_vector(7 downto 0);
        y4		: in std_logic_vector(7 downto 0);

	right_cond_out	: out std_logic_vector(8 downto 0);
	start_pos_1_out	: out std_logic_vector(8 downto 0);
	start_pos_2_out	: out std_logic_vector(8 downto 0);

	dxy1_out	: out std_logic_vector(8 downto 0);
	dxy2_out	: out std_logic_vector(8 downto 0);
	
	mux 	  	: out std_logic
    );	
end entity comb;

architecture behavioural of comb is

signal yL_temp, yR_temp: std_logic_vector(7 downto 0);
signal dy_temp: unsigned(7 downto 0);
signal dx_temp: unsigned(8 downto 0);

begin
process(clk)
begin
	if (unsigned(y1) < unsigned(y3)) then
		yL_temp <= y1;
		yR_temp <= y3;
	else
		yL_temp <= y2;
		yR_temp <= y4;
	end if;

	dx_temp <= unsigned(x2) - unsigned(x1);
	dy_temp <= unsigned(yR_temp) - unsigned(yL_temp);

	if (dx_temp >= dy_temp) then
		mux_out <= '1';
		start_pos_1_out <= x1;
		start_pos_2_out <= ('0' & yL_temp);
		right_cond_out <= x2;
		dxy1_out <= ('0' & std_logic_vector(dy_temp));
		dxy2_out <= std_logic_vector(dx_temp);
	else
		mux_out <= '0';
		start_pos_1_out <= ('0' & yL_temp);
		start_pos_2_out <= x1;
		right_cond_out <= ('0' & yR_temp);
		dxy1_out <= std_logic_vector(dx_temp);
		dxy2_out <= ('0'& std_logic_vector(dy_temp));
	end if;

end process;
end architecture behavioural;
					
