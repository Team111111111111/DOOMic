## Author : Mathieu Demeestere
## Date of last update : 24/11/2023
## Title : DOOMic main VGA implementation and dual frame buffers
## Description : this controls the main output to VGA and sets the timings correct for the sync pulses and color output. 
##
## This is the Main VGA component
## Write_x writes to the empty buffer, keep these stable for at least one clock cycle when setting write_enable high.
## Switch_bank needs to be held high for 1 clk to switch buffers
## hsync vsync and color can be mapped straight to the VGA port or trough a VGA color pallete
##


library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity memctrl_vga_parent is
  port (
    clk : in std_logic;
    res : in std_logic;

    write_adress : in std_logic_vector(15 downto 0);
    write_color  : in std_logic_vector(7 downto 0);
    write_enable : in std_logic_vector;
    switch_bank  : in std_logic;

    hsync : out std_logic;
    vsync : out std_logic;
    color : out std_logic_vector(7 downto 0)
  );
end entity;

architecture structural of memctrl_vga_parent is
    component syncpulses is
        port (
          clk   : in std_logic;
          res : in std_logic;
      
          hsync : out std_logic;
          vsync : out std_logic;

          screen_address : out std_logic_vector(15 downto 0)
        );    
      end component;

      component byteofram is
        port (
          clk   : in  std_logic;
          write_enable      : in  std_logic;
          address : in  std_logic_vector (7 downto 0);
          datain  : in  std_logic_vector (7 downto 0);
          dataout : out std_logic_vector
        );
      end component byteofram;

    signal color_signal_1, color_signal_2, color_out_sig : std_logic_vector(7 downto 0);
    signal write_enable_1, write_enable_2 : std_logic;
    signal address_signal_1, address_signal_2 : std_logic_vector(15 downto 0);
    signal screen_address_signal : std_logic_vector(15 downto 0);
    signal bank_select : std_logic;

begin

    syncpulses_inst: syncpulses # straight port map from compontent to top level
    port map (
      clk   => clk,
      res => res,
      hsync => hsync,
      vsync => vsync,
      screen_address => screen_address_signal #screen address is used to be able to switch the write and read buffer
    );

    # these are the two framebuffers, 1 and 2, each get their own signals for the differentiated interface
    byteofram_inst_1: byteofram 
    port map (
      clk          => clk,
      write_enable => write_enable_1,
      address      => address_signal_1,
      datain       => write_color,
      dataout      => color_signal_1
    );

    byteofram_inst_2: byteofram
    port map (
      clk          => clk,
      write_enable => write_enable_2,
      address      => address_signal_2,
      datain       => write_color,
      dataout      => color_signal_2
    );

    process(bank_select) # asynchrounous code allows for the 2 frame buffers to be swapped
    begin
        case bank_select is
            when '1'  =>
                color_out_sig <= color_signal_1;
                write_enable_1 <= '0';
                address_signal_1 <= screen_address_signal;
                write_enable_2 <= write_enable;
                address_signal_2 <= write_adress;
                
            when '0'  =>
                color_out_sig <= color_signal_2;
                write_enable_2 <= '0';
                address_signal_2 <= screen_address_signal;
                write_enable_1 <= write_enable;
                address_signal_1 <= write_adress;

            when others =>
                color_out_sig <= (others => '0');
        end case;
    end process;

    process(clk, switch_bank) # synchrounous code that sets the swap flag
    begin
        if res = '1' then
            bank_select <= '0';
        else
            if(rising_edge(clk)) then
                if switch_bank = '1' then
                    bank_select <= not bank_select;
                end if;
            end if;
        end if;
    end process;

    ##takes
    color <= (others => '0') when screen_address_signal = (others => '1') else color_out_sig;

end architecture;
