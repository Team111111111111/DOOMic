LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


entity adress_to_cmd is
	port (
		clk 	 : in  std_logic;
		reset	 : in  std_logic;	

		adress	 : in  std_logic_vector (31 downto 0);
		sd_type  : in std_logic_vector (1 downto 0);
		transfer : in std_logic;
		
		cmd	 : out std_logic_vector (7 downto 0);
		tx_send  : out std_logic;
		enable	 : out std_logic
		
	); 
end adress_to_cmd;

architecture behavioural of adress_to_cmd is

	type atc_state is (reset, load, pump);
	-- load state loads the adress
	-- pump state sends the command and then the adress 

	signal state, new_state : atc_state;
	signal pointer 		: std_logic_vector (2  downto 0);
	signal buf		: std_logic_vector (31 downto 0);
	-- buffer buffers the adress and it's used to split 32bit adress to 4xbyte

begin
	process (clk)
	begin
		if (clk'event and clk = '1' ) then
			if (reset = '1') then
				state	<= reset;

			else
				state	<= new_state;

			end if;
		end if;
	end process;

	process (state)
	begin
		case state is
			when reset =>
				cmd	<= (others => '0');
				tx_send	<= '0';
				enable	<= '0';
				pointer <= (others => '0');
				buf	<= (others => '0');

				if (transfer = '0') then 
					new_state <= reset;
				else
					new_state <= load;
				end if;

			when load =>
				cmd	<= (others => '0');
				tx_send	<= '0';
				enable	<= '0';
				pointer <= (others => '0');
