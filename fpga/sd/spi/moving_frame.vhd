LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity moving_frame is
	port ( 
		clk 	: in std_logic;
		reset	: in std_logic;
		enable	: in std_logic;
		tx_send : in std_logic;
		
		MOSI	: out std_logic;
		CMD	: in  std_logic_vector (7 downto 0)
	);
end entity moving_frame;

architecture bahavioural of moving_frame is 

	signal tx_buf : std_logic_vector (7 downto 0);
	signal pointer, new_pointer : std_logic_vector (2 downto 0);
	signal txing : std_logic;

begin 
	process (clk)
	begin
		if (rising_edge(clk)) then
			if (reset = '1') then

				MOSI <= '0';
				tx_buf <= "00000000";
				pointer <= "000";

			elsif (enable = '0') then

				MOSI <= '0';
				tx_buf <= "00000000";
				pointer <= "000";
				
			else	
				if (txing = '1') then 
					case pointer is

						when "000" =>
							MOSI <= tx_buf(0);

						when "001" =>
							MOSI <= tx_buf(1);

						when "010" =>
							MOSI <= tx_buf(2);

						when "011" =>
							MOSI <= tx_buf(3);

						when "100" =>
							MOSI <= tx_buf(4);

						when "101" =>
							MOSI <= tx_buf(5);

						when "110" =>
							MOSI <= tx_buf(6);

						when "111" =>
							MOSI <= tx_buf(7);
							txing <= '0';

						when others =>

					end case;

					pointer <= new_pointer;

				else
					MOSI <= '0';
				end if;
			end if;
		end if;
		
		tx_buf <= CMD;
		
		if (pointer < 7) then
			new_pointer <= pointer + 1;
		else
			new_pointer <=	"000";
		end if;

		if (rising_edge(tx_send)) then
			txing <= '1';
		end if;
	end process;
end architecture;
