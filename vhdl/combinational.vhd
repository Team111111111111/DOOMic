library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity comb is
    port (
        x1		: in std_logic_vector(8 downto 0);
        y1		: in std_logic_vector(7 downto 0);
        y2		: in std_logic_vector(7 downto 0);

        x2		: in std_logic_vector(8 downto 0);
        y3		: in std_logic_vector(7 downto 0);
        y4		: in std_logic_vector(7 downto 0);

	right_cond	: out std_logic_vector(8 downto 0);
	start_pos_1	: out std_logic_vector(8 downto 0);
	start_pos_2	: out std_logic_vector(8 downto 0);

	dxy1		: out std_logic_vector(8 downto 0);
	dxy2		: out std_logic_vector(8 downto 0);
	
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

	dx_temp <= unsigned(x1) - unsigned(x2);
	dy_temp <= unsigned(yR_temp) - unsigned(yL_temp);

	if (dx_temp >= dy_temp) then
		MUX <= '1';
		start_pos_1 <= x1;
		start_pos_2 <= ('0' & yL_temp);
		right_cond <= x2;
		dxy1 <= ('0' & std_logic_vector(dy_temp));
		dxy2 <= std_logic_vector(dx_temp);
	else
		MUX <= '0';
		start_pos_1 <= ('0' & yL_temp);
		start_pos_2 <= x1;
		right_cond <= ('0' & yR_temp);
		dxy1 <= std_logic_vector(dx_temp);
		dxy2 <= ('0'& std_logic_vector(dy_temp));
	end if;

end process;
end architecture behavioural;
					
