library IEEE;
use IEEE.std_logic_1164.ALL;

entity multi_reg16 is
   port(input_a : in  std_logic_vector(15 downto 0);
	input_b : in  std_logic_vector(15 downto 0);
	selector: in  std_logic;
	enable: in std_logic;
	reset: in std_logic;
	clk: in std_logic;
	output: out std_logic_vector(15 downto 0)
);
end multi_reg16;

library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of multi_reg16 is
	component multiplexer
		port(a, b: in std_logic_vector(15 downto 0);
			s: in std_logic;
			output: out std_logic_vector(15 downto 0)
		);
	end component;

	component reg16 
		port(REG_IN : in  std_logic_vector(15 downto 0);
			REG_OUT: out std_logic_vector(15 downto 0);
			clk, enable, reset: in std_logic
		);
	end component;

	signal reg_input: std_logic_vector(15 downto 0);
			
begin

L1: multiplexer port map (a => input_a, b => input_b, s => selector, output => reg_input);

L2: reg16 port map (REG_IN => reg_input, REG_OUT => output, clk => clk, enable => enable, reset => reset);

end behaviour;

