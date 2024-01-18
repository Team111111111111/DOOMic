library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end entity;

architecture behavioral of testbench is
  component v_line_lookup is
    port (
        input_vector :	in std_logic_vector(5 downto 0);
	output_vector : out std_logic_vector(7 downto 0)
      );    
  end component;

  signal inp_sig : std_logic_vector(5 downto 0) := (others => '0');
  signal out_sig : std_logic_vector(7 downto 0);

begin

    lu: v_line_lookup port map (
        input_vector => inp_sig,
        output_vector => out_sig
    );
    
    inp_sig <= std_logic_vector(unsigned(inp_sig) + 1) after 5 ns;

end architecture;