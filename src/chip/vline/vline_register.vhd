library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity v_line_register is
  port (
    clk : in std_logic;
    res : in std_logic;
    en : in std_logic;

    input : in std_logic_vector(21 downto 0);
    output : out std_logic_vector(21 downto 0)
  );
end entity;

architecture behavioral of v_line_register is
begin
  process(clk, res, en)
  begin
    if res = '1' then
      output <= (others => '0');
    elsif (rising_edge(clk) and en = '1') then
        output <= input;
    end if;
  end process;
end architecture;