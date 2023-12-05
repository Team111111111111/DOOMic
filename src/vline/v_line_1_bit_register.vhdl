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
  signal output_new : std_logic;
begin
    process(clk)
    begin
        if res = '1' then
            output_new <= '0';
            if (rising_edge(clk)) then
                if en = '1' then
                    output_new <= input;
                else
                    output_new <= output;
                end if;
            end if;
        end if;
    end process;
    output <= output_new;
            
end architecture;