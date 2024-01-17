##NOT DONE

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity v_line is
    generic (
        nr_of_buffers : integer := 7;
        size_of_vector : integer := 20
    );
    port (
        clk : in std_logic;
        res : in std_logic;

        data_in : in std_logic_vector(13 downto 0);

        a_out : out std_logic_vector(8 downto 0);
        b_out : out std_logic_vector(7 downto 0);

        ready_out : out std_logic;
        adress_out : out std_logic_vector(15 downto 0)
    );
end entity v_line;

architecture structural of v_line is

    type buffers is array (0 to (nr_of_buffers-1)) of std_logic_vector((size_of_vector-1) downto 0);
    signal buffer_array : buffers;

    component v_line_multadder is
        port (
          mult_in_1                       : in std_logic_vector(19 downto 0);
          mult_in_2                       : in std_logic_vector(19 downto 0);
          adder_in                        : in std_logic_vector(19 downto 0);
          inv_in                          : in std_logic;
      
          block_out                       : out std_logic_vector(19 downto 0);
          overflow                        : out std_logic
        );
      end component;
  
begin

    

    
end architecture;