library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity sram is 
	port (
		clk 		: in std_logic;
		res		    : in std_logic;
		
		data_in     : in std_logic_vector(7 downto 0); --byte in
		data_out    : out std_logic_vector(7 downto 0); -- byte out
		address	    : in std_logic_vector(17 downto 0); -- address in

		readwrite	: in std_logic; -- 0 for read, 1 for write
		enable		: in std_logic; -- 1 tp perform r/w action
		
		SRAM_ADDR	: out std_logic_vector(17 downto 0); -- address out
		SRAM_DQ     : inout std_logic_vector(7 downto 0); -- data in/out
		SRAM_CE_N   : out std_logic; -- chip select active low
		SRAM_OE_N   : out std_logic; -- output enable active low
		SRAM_WE_N   : out std_logic; -- write enable active low	
		SRAM_UB_N   : out std_logic; -- upper byte mask active low
		SRAM_LB_N   : out std_logic -- lower byte mask active low
		
	);
end entity;

architecture behaviour of sram is

	type ramstate is (
		inactive,
		readstate,
		writestate
	);
	signal S_ramstate : ramstate := inactive;
	signal S_readwrite : std_logic;
	signal S_readdata : std_logic_vector(7 downto 0);
	
begin

	
process(clk)
	begin
		if(res = '1') then --async reset
			S_readdata <= (others => '0');
			SRAM_CE_N<='0'; --enable chip
			SRAM_LB_N<='1'; --disable low bit mask
			SRAM_UB_N<='1'; --disable high bit mask
			SRAM_ADDR <= (others => '-'); --RAM adress dont care
			SRAM_DQ <= (others => 'Z'); --RAM data high Z

		elsif (rising_edge(clk) and enable = '1') then 
			SRAM_ADDR <= (others => '-'); --RAM adress dont care
			SRAM_DQ <= (others => 'Z'); --RAM data high Z
			if readwrite = '0'  then --byte read
				S_readwrite <= '0';
				SRAM_ADDR <= address;
				SRAM_LB_N <= '0'; --enable low bit mask
				SRAM_UB_N <= '0'; --enable high bit mask
				data_out <= SRAM_DQ(7 downto 0);
			elsif readwrite = '1'  then --byte write
				S_readwrite <= '1';
				SRAM_ADDR <= address;
				SRAM_LB_N <= '0'; --enable low bit mask
				SRAM_UB_N <= '0'; --enable high bit mask
				SRAM_DQ <= data_in;
			end if;
		end if;
	end process;
	
process(S_readwrite) --perform read/write action when signal changes
	begin
		if(S_readwrite = '0') then --read
			S_ramstate <= readstate;
			SRAM_WE_N <= '1'; --disable write
			SRAM_OE_N <= '0'; --enable output
		else --write
			S_ramstate <= writestate;
			SRAM_OE_N <= '1'; --disable output
			SRAM_WE_N <= '0'; --enable write
		end if;
	end process;
	
end architecture;
