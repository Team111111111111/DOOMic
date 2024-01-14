library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
 
entity v_line_testbench is
end entity;
 
architecture behavioral of v_line_testbench is
  component v_line is
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
 
    signal clk : std_logic := '0';
    signal res, ready_out_h, ready_out_bus, bus_empty_in : std_logic;
    signal a_out : std_logic_vector(8 downto 0);
    signal b_top_out, b_bot_out : std_logic_vector(7 downto 0);
    signal data_in : std_logic_vector(13 downto 0);
    signal adress_out : std_logic_vector(15 downto 0);
 
begin
 
    VLINE : v_line port map (
        clk => clk,
        res => res,
        data_in => data_in,
        a_out => a_out,
        b_top_out => b_top_out,
        b_bot_out => b_bot_out,
        ready_out_bus => ready_out_bus,
        ready_out_h => ready_out_h,
        bus_empty_in => bus_empty_in,
        adress_out => adress_out
    );
 
    clk <= not clk after 20 ns;
 
    res <= '1' after 0 ns, 
            '0' after 100 ns;
bus_empty_in <= '1' after 0 ns;	
 
    data_in	<=	"00000000000000" after 0 ns, --start at 0

            "00000100101100" after 140 ns, -- set player x to 300
            "00001001011000" after 180 ns, -- set player y yo 600
            "00000000100011" after 220 ns, -- set alpha to a test value 35

            "00000001110010" after  260 ns, -- set first vertex x to 114
            "00000001010111" after 300 ns, -- set first vertex y to 87
            "00000000000000" after 340 ns, --set to zero

            "00000000000001" after  2000 ns,-- set second vertex x to 1
            "00000011001001"after  2040 ns,-- set second vertex y to 201
            "00000000000000" after 2080 ns, -- set to zero

            "00000000000001" after 4000 ns,-- set third vertex x to 1
            "00001011000110" after 4040 ns,-- set third vertex y to 710 
		    "00000000000000" after 4080 ns, -- set to zero
              

		    "11111111111111" after 6000 ns, --set all one's
		    "00000000000000" after 6040 ns; --set to zero
 
end architecture;