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

    data_in <= "00000000000000" after 0 ns, --start at 0
               "00001010111100" after 140 ns, -- set player x to 700
               "00000001100100" after 180 ns, -- set player y yo 100
               "00000000110000" after 220 ns, -- set alpha to a test value
               "00001100100000" after 260 ns, -- set first vertex x to 700
               "00000011001000" after 300 ns, -- set first vertex y to 40
               "00000000000001" after 340 ns;

end architecture;