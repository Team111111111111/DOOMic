library ieee;
use ieee.std_logic_1164.all;

entity vga_ram_mux is 
	port (
		reset 	 : in std_logic;
		
		switch	 : in std_logic_vector (1 downto 0);
		addr_0	 : in std_logic_vector (17 downto 0);
		addr_1	 : in std_logic_vector (17 downto 0);
		addr_2	 : in std_logic_vector (17 downto 0);
		addr_out : out std_logic_vector (17 downto 0)
	);
end entity;

architecture behavioural of vga_ram_mux is

	process (reset, switch)
	begin
		if (reset = '1') then
			addr_out <= "000000000000000000";

		else
			case switch is
				when "00" =>
					addr_out <= addr_0;

				when "01" =>
					addr_out <= addr_1;

				when "10" =>
					addr_out <= addr_2;

				when others =>
					addr_out <= "000000000000000000";
			end case;
		end if;
	end process;
end architecture;
