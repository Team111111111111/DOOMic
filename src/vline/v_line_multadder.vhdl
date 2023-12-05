--NOT DONE
    -- needs ALU functions

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

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

  component multiplier is
    generic
    (
      n_bits : integer := 22;
      f_bits : integer := 8
    );
    port 
    (
      a     : in  std_logic_vector(n_bits - 1 downto 0);
      b     : in  std_logic_vector(n_bits - 1 downto 0);
      r     : out std_logic_vector(n_bits - 1 downto 0);
      inv_r : out std_logic_vector(n_bits - 1 downto 0)
    );
  end component ; -- multiplier

  component adder is
    generic
    (
        n_bits : integer := 22
    );
    port
    (
      a : in  std_logic_vector(n_bits - 1 downto 0);
      b : in  std_logic_vector(n_bits - 1 downto 0);
      r : out std_logic_vector(n_bits - 1 downto 0)
    );
  end component adder;
    
    signal mult_out, mult_out_inv   : std_logic_vector(21 downto 0);
    signal mux_out                  : std_logic_vector(21 downto 0);


begin

    multiplier_inst: multiplier
    generic map (
      n_bits => 22,
      f_bits => 8
    )
    port map (
      a     => mult_in_1,
      b     => mult_in_2,
      r     => mult_out,
      inv_r => mult_out_inv
    );

    mux_inst: v_line_2_vector_mux
    port map (
      input_1 => mult_out,
      input_2 => mult_out_inv,
      sel     => inv_in,
      output  => mux_out
    );

    adder_inst: adder
    generic map (
      n_bits => 22
    )
    port map (
      a => mux_out,
      b => adder_in,
      r => block_out
    );
    
end architecture structural;