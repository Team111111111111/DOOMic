##NOT DONE
    ## needs ALU functions

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library adder_p.all;

entity v_line_multadder is
  port (
    mult_in_1                       : in std_logic_vector(19 downto 0);
    mult_in_2                       : in std_logic_vector(19 downto 0);
    adder_in                        : in std_logic_vector(19 downto 0);
    inv_in                          : in std_logic;

    block_out                       : out std_logic_vector(19 downto 0);
    overflow                        : out std_logic
  );
end entity;

architecture structural of v_line_multadder is
    
    signal mult_out, mult_out_inv   : std_logic_vector(19 downto 0);
    signal mux_out                  : std_logic_vector(19 downto 0);


begin

    MULTIPLIER (mult_in_1, mult_in_2, mult_out); ##

    mult_out_inv <= adder_p.m_2c(mult_out);

    mux (mult_out, mult_out_inv, inv_in);

    adder_p.m_add(mux_out, adder_in, block_out, overflow);
    
end architecture structural;