library IEEE;
use IEEE.std_logic_1164.ALL;

entity reg16 is
   port(REG_IN_VLINE : in  std_logic_vector(15 downto 0);
	REG_IN_HLINE : in  std_logic_vector(15 downto 0);
	REG_OUT: out std_logic_vector(15 downto 0);
	clk, enable_v, enable_h, reset: in std_logic);
end reg16;

library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of reg16 is
begin
	reg16: process(clk, enable_v, enable_h, reset, REG_IN_VLINE, REG_IN_HLINE)
	begin 
		if (rising_edge(clk)) then
		    if(reset = '0') then
			if (enable_v = '1') then
				REG_OUT <= REG_IN_VLINE;
			elsif (enable_h = '1') then
				REG_OUT <= REG_IN_HLINE;
			else 
				REG_OUT <= "0000000000000000";
			end if;
		    else 
			REG_OUT <= "0000000000000000" ;
		    end if;
		end if;
	end process;
			
end behaviour;

