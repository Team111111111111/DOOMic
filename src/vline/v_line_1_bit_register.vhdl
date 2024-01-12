library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity v_line_1_bit_register is
  port (
    clk : in std_logic;
    res : in std_logic;
    en : in std_logic;

    input : in std_logic;
    output : out std_logic
  );
end entity;

architecture behavioral of v_line_1_bit_register is
begin
    process(clk, res, en)
    begin
      if res = '1' then
        output <= '0';
      elsif (rising_edge(clk) and en = '1') then
          output <= input;
      end if;
    end process;
            
end architecture;