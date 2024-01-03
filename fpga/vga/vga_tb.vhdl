library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity testbench is
end entity;

architecture behavioral of testbench is
  component syncpulses is
    port (
        clk   : in std_logic;
    
        hsync : out std_logic;
        vsync : out std_logic;
        byte  : out std_logic_vector (7 downto 0)
      );    
  end component;

  signal hsync, vsync, clk_sig : std_logic := '0';
  signal color : std_logic_vector(7 downto 0);
begin

    x: syncpulses port map (
        clk => clk_sig,
        hsync => hsync,
        vsync => vsync,
        byte => color
    );
    
    clk_sig <= not clk_sig after 5 ns;

end architecture;