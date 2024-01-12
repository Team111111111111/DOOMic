library IEEE;
use IEEE.std_logic_1164.ALL;

entity reg14 is
   port(REG_IN : in  std_logic_vector(13 downto 0);
	REG_OUT: out std_logic_vector(13 downto 0);
	clk, reset: in std_logic);
end reg14;

library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of reg14 is
begin
	reg: process(clk)
	begin 
		if (rising_edge(clk)) then
			if reset = '0' then
				REG_OUT <= REG_IN;
			else
				REG_OUT <= "00000000000000";	
			end if;
		end if;
	end process;
end behaviour;

