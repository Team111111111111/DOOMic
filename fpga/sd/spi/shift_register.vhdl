LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity shift_register is
	port (
		MISO	 : in std_logic;
		raw_data : out std_logic_vector (7 downto 0);

		detected : in std_logic;
		clk 	 : in std_logic;
		enable	 : in std_logic;
		reset	 : in std_logic
		);
end shift_register;

architecture behavioural of shift_register is

	signal rx_buf : std_logic_vector (7 downto 0);

begin
	process (clk)
	begin
		if (rising_edge(clk)) then
			if (reset = '1') then
				rx_buf <= "00000000";

			elsif (enable = '0') then
				rx_buf <= "00000000";

			else
				if (detected = '1') then 
					-- rx_buf <= shift_left(rx_buf, 1);
					-- rx_buf(rx_buf'low) <= MISO;

					rx_buf <= rx_buf(6 downto 0) & rx_buf(7); -- bit shift
					rx_buf(rx_buf'low) <= MISO;	-- shift in new bit 

				else
					rx_buf <= rx_buf;

				end if;
			end if;
		end if;
	end process;

	raw_data <= rx_buf;

end architecture;
