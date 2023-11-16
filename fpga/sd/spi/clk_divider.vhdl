library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity timebase is
	port (  clk		: in std_logic;
        	reset		: in std_logic;
        	count_out	: out std_logic_vector (19 downto 0);
		sclk_count_out	: out std_logic_vector (19 downto 0); -- this one is used for the Init FSM
		enable		: in std_logic;
		sclk		: out std_logic
 	) ;
 end entity timebase ;

 architecture behavioural of timebase is

 	signal count, new_count, sclk_count, sclk_new_count : unsigned (19 downto 0);

 begin
 	process ( clk )
 	begin
 		if ( clk'event and clk ='1' ) then
			if ( reset = '1' ) then
 				count <= ( others => '0');
				sclk_count <= (others => '0');
			
			elsif (enable = '0') then
 			else
 				count <= new_count;
				sclk_count <= sclk_new_count;

 			end if;
 		end if;
 	end process;


 	process ( count )
 	begin
		if (count >= /*some value idk yet*/) then
			sclk <= '1';
			sclk_new_count <= sclk_count + 1;

		else 
			sclk <= '0';
			sclk_new_count <= sclk_count;

		end if;

		if (count >= /*some value in symetry 
				to the first one*/) then --reset of the count
			new_count <= (others => '0');

		else
			new_count <= count + 1;

		end if;
 	end process;

 	count_out	<= std_logic_vector ( count );
	sclk_count_out	<= std_logic_vector ( sclk_count );
 end architecture behavioural;
