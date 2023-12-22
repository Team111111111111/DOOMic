entity hline_complement is
generic
(
    n_bits : integer := 24
);
port
(
	a : in  std_logic_vector(n_bits - 1 downto 0);
	r : out std_logic_vector(n_bits - 1 downto 0)
);
end entity hline_complement; -- complement

architecture behavioral of hline_complement is
signal tmp : std_logic_vector(n_bits - 1 downto 0);
begin
	tmp <= not a;
	r   <= std_logic_vector(unsigned(tmp) + 1);
end architecture ; -- behavioral
