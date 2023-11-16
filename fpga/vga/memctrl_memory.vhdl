library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

entity byteofram is
  port (
    clk   : in  std_logic;
    write_enable      : in  std_logic;
    address : in  std_logic_vector (7 downto 0);
    datain  : in  std_logic_vector (7 downto 0);
    dataout : out std_logic_vector
  );
end entity byteofram;

architecture behavioral of byteofram is

   type ram_type is array (255 downto 0) of std_logic_vector(7 downto 0);
   signal ram : ram_type;
   signal read_address : std_logic_vector(7 downto 0);

begin

  process(clk) is

  begin
    if rising_edge(clk) then
      if write_enable = '1' then
        ram(to_integer(unsigned(address))) <= datain;
      end if;
      read_address <= address;
    end if;
  end process;

  dataout <= ram(to_integer(unsigned(read_address)));

end architecture behavioral;
