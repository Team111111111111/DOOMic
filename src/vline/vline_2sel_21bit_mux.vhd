library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity v_line_2_vector_mux is
  port (
    input_1 : in std_logic_vector(21 downto 0);
    input_2 : in std_logic_vector(21 downto 0);

    sel : in std_logic;

    output : out std_logic_vector(21 downto 0)
  );
end entity;

architecture behavioral of v_line_2_vector_mux is
begin
    process(sel, input_1, input_2)
    begin
        case sel is
            when '0' =>
                output <= input_1;
            when '1' =>
                output <= input_2;
            when others =>
                output <= (others => '0');
        end case;
    end process;
end architecture;