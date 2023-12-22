library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity reg is
    port (
        clk : in std_logic;
        reset : in std_logic;
	shift : in std_logic;

        x_in : in std_logic_vector(8 downto 0);
        y_top : in std_logic_vector(7 downto 0);
        y_bot : in std_logic_vector(7 downto 0);

        x1_out : out std_logic_vector(8 downto 0);
        y1_top : out std_logic_vector(7 downto 0);
        y2_bot : out std_logic_vector(7 downto 0);

        x2_out : out std_logic_vector(8 downto 0);
        y3_top : out std_logic_vector(7 downto 0);
        y4_bot : out std_logic_vector(7 downto 0)
    );
end entity reg;


architecture behavioural of reg is

signal x_buf1, x_buf2: std_logic_vector(8 downto 0);
signal y_top_buf1, y_bot_buf1, y_top_buf2, y_bot_buf2: std_logic_vector(7 downto 0);


begin
	process(clk)
	begin
		if (rising_edge (clk)) then
			if (reset = '1') then
				x_buf1 <= (others => '0');
				y_top_buf1 <= (others => '0');
				y_bot_buf1 <= (others => '0');

				x_buf2 <= (others => '0');
				y_top_buf2 <= (others => '0');
				y_bot_buf2 <= (others => '0');

			elsif (shift = '1') then
				x_buf1 <= x_in;
				y_top_buf1 <= y_top;
				y_bot_buf1 <= y_bot;

				x_buf2 <= x_buf1;
				y_top_buf2 <= y_top_buf1;
				y_bot_buf2 <= y_bot_buf1;
			end if;
		end if;
	end process;

x1_out <= x_buf2;
y1_top <= y_top_buf2;
y2_bot <= y_bot_buf2;

x2_out <= x_buf1;
y3_top <= y_top_buf1;
y4_bot <= y_bot_buf1;

end architecture behavioural;
