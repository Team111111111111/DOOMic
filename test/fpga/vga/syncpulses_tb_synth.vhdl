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
      
          screen_address : out std_logic_vector(16 downto 0)
      );
end entity;

architecture rtl of syncpulses_tb is
    component syncpulses is
        port (
          clk_6   : in std_logic;
          res : in std_logic;
      
          hsync : out std_logic;
          vsync : out std_logic;
      
          screen_address : out std_logic_vector(16 downto 0)
        );    
      end component;

      signal clk_sig, res_sig, vsync_sig, hsync_sig  : std_logic;
      signal screen_address_sig : std_logic_vector(16 downto 0);
      signal color_sig : unsigned(16 downto 0);

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
      clk_6          => clk_sig,
      res            => res_sig,
      hsync          => hsync_sig,
      vsync          => vsync_sig,
      screen_address => screen_address_sig
    );

    clk_divider_inst: clk_divider
    port map (
      clk => clk,
      clk_6 => clk_sig,
      res   => res_sig
    );

    process(vsync_sig)
    begin
      if(res_sig = '1') then
        color_sig <= (others => '0');
      else
        if(falling_edge(vsync_sig)) then
          if (vsync_sig = '0') then
            --color_sig <= not color_sig;
            color_sig <= color_sig + 50;
          end if;
          --if (vsync_sig = '0') then
          --  color_sig <= (others => '0');
          --end if;
        end if;
      end if;
    end process;    

	  --color <= (others => '0') when screen_address_sig = ("11111111111111111") else std_logic_vector(color_sig);
    color <= (others => '1') when screen_address_sig /= ("11111111111111111") and screen_address_sig = std_logic_vector(color_sig) else (others => '0') ;
    screen_address <= screen_address_sig;
    vsync <= vsync_sig;
    hsync <= hsync_sig;
    clk_6 <= clk_sig;
    res_sig <= not res;

end architecture;

--.qsf
