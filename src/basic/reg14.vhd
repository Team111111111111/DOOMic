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

	signal memory, new_memory : std_logic_vector(13 downto 0);
begin
	reg: process(clk)
	begin 
		if (rising_edge(clk)) then
			if reset = '1' then
				memory <= "00000000000000";
			else
				memory <= new_memory;	
			end if;
		end if;
	end process;

	process(memory, new_memory)
	begin
		new_memory <= REG_IN;
	end process;

	REG_OUT <= memory;
end architecture;

