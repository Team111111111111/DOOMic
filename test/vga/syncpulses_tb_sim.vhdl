library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity syncpulses_tb is
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

      signal clk_sig, res_sig, hsync_sig, vsync_sig : std_logic := '0';
      signal screen_address_sig : std_logic_vector(15 downto 0);
begin

    syncpulses_inst: syncpulses
    port map (
      clk_6          => clk_sig,
      res            => res_sig,
      hsync          => hsync_sig,
      vsync          => vsync_sig,
      screen_address => screen_address_sig
    );

    clk_sig <= not clk_sig after 160 ns;

    res_sig <= '0' after 160 ns;

end architecture;

--.qsf