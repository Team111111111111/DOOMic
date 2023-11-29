--NOT DONE
    -- needs ALU functions

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library adder_p.all;

entity v_line_multadder is
  port (
    mult_in_1                       : in std_logic_vector(21 downto 0);
    mult_in_2                       : in std_logic_vector(21 downto 0);
    adder_in                        : in std_logic_vector(21 downto 0);
    inv_in                          : in std_logic;

    block_out                       : out std_logic_vector(21 downto 0);
    overflow                        : out std_logic
  );
end entity;

architecture structural of v_line_multadder is

  component v_line_2_vector_mux is
    port (
      input_1 : in std_logic_vector(21 downto 0);
      input_2 : in std_logic_vector(21 downto 0);

      sel : in std_logic;

      output : out std_logic_vector(21 downto 0)
    );
  end component;
    
    signal mult_out, mult_out_inv   : std_logic_vector(21 downto 0);
    signal mux_out                  : std_logic_vector(21 downto 0);


begin

    MULTIPLIER (mult_in_1, mult_in_2, mult_out); -- TODO

    mult_out_inv <= adder_p.m_2c(mult_out); -- TODO

    mux_inst: v_line_2_vector_mux
    port map (
      input_1 => mult_out,
      input_2 => mult_out_inv,
      sel     => inv_in,
      output  => mux_out
    );

    adder_p.m_add(mux_out, adder_in, block_out, overflow); -- TODO
    
end architecture structural;