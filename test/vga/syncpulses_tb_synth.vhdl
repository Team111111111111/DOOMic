library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity syncpulses_tb is
      port (
          clk   : in std_logic;
          res : in std_logic;

          clk_6 : out std_logic;
      
          hsync : out std_logic;
          vsync : out std_logic;
      	  
      	  color : out std_logic_vector (11 downto 0);
      
          screen_address : out std_logic_vector(15 downto 0)
      );
end entity;

architecture rtl of syncpulses_tb is
    component syncpulses is
        port (
          clk_6   : in std_logic;
          res : in std_logic;
      
          hsync : out std_logic;
          vsync : out std_logic;
      
          screen_address : out std_logic_vector(15 downto 0)
        );    
      end component;

      signal clk_sig, res_sig : std_logic;

      component clk_divider is
        port (
          clk : in std_logic;
          clk_6 : out std_logic;
          res : in std_logic
        );
      end component;
begin

    syncpulses_inst: syncpulses
    port map (
      clk_6          => clk,
      res            => res_sig,
      hsync          => hsync,
      vsync          => vsync,
      screen_address => screen_address
    );

    clk_divider_inst: clk_divider
    port map (
      clk => clk,
      clk_6 => clk_sig,
      res   => res_sig
    );

    color <= "111100001111";
    clk_6 <= clk_sig;
    res_sig <= not res;

end architecture;

--.qsf
