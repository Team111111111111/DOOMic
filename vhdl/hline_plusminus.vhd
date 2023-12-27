library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity plus_minus is
	port(
	clk	: in std_logic;
	add_1	: in std_logic_vector(15 downto 0);
	add_2	: in std_logic_vector(15 downto 0);
	sub	: in std_logic_vector(15 downto 0);
	sel	: in std_logic;
	result	: out std_logic_vector(15 downto 0));
end entity;


architecture behavioural of plus_minus is

component adder is
	generic(n_bits	: integer := 16);
	port(	a	: in  std_logic_vector(n_bits - 1 downto 0);	
		b	: in std_logic_vector(n_bits - 1 downto 0);
		r	: out std_logic_vector(n_bits - 1 downto 0)
	);
end component;

component complement is
	generic(n_bits	: integer := 16);
	port(	a 	: in  std_logic_vector(n_bits - 1 downto 0);	
		r 	: out std_logic_vector(n_bits - 1 downto 0)
	);
end component;

signal add_r_sig, inverse_r_sig, sub_r_sig : std_logic_vector(15 downto 0);

begin
	addition: adder port map(
		a => add_1,
		b => add_2,
		r => add_r_sig);

	inverse: complement port map(
		a => sub,
		r => inverse_r_sig);

	subtraction: adder port map(
		a => inverse_r_sig,
		b => add_r_sig,
		r => sub_r_sig);

process(clk)
begin

        case sel is
            when '1' =>
                result <= sub_r_sig;
            when '0' =>
                result <= add_r_sig;
            when others =>
                result <= (others => '0');
        end case;
end process;

end architecture behavioural;

end architecture behavioural;

	

