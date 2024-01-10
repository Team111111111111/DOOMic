library IEEE;
use IEEE.std_logic_1164.ALL;

entity SRAM_tb is
end SRAM_tb;

architecture behaviour of SRAM_tb is
   component sram_entity
     port(  clk         :in std_logic;
            res         :in std_logic;

            address     :in std_logic_vector(17 downto 0);
            readwrite   :in std_logic;
            maskselect  :in std_logic;
            enable      :in std_logic;
            data_in     :in std_logic_vector(7 downto 0);
            data_out    :out std_logic_vector(7 downto 0);

            out_rdy     :out std_logic;

            SRAM_DQ     :inout std_logic_vector(7 downto 0);
            SRAM_ADDR   :out std_logic_vector(17 downto 0);
            
            SRAM_WE_N   :out std_logic;
            SRAM_CE_N   :out std_logic;
            SRAM_OE_N   :out std_logic;
            SRAM_LB_N   :out std_logic;
            SRAM_UB_N   :out std_logic
    );
   end component;

	signal clk         :std_logic;
	signal res         :std_logic;

	signal address     :std_logic_vector(17 downto 0);
	signal readwrite   :std_logic;
	signal maskselect  :std_logic;
	signal enable      :std_logic;
	signal data_in     :std_logic_vector(7 downto 0);
	signal data_out    :std_logic_vector(7 downto 0);

       signal out_rdy     :std_logic;
	
	signal SRAM_DQ     :std_logic_vector(7 downto 0);
	signal SRAM_ADDR   :std_logic_vector(17 downto 0);
          
	signal SRAM_WE_N   :std_logic;
	signal SRAM_CE_N   :std_logic;
	signal SRAM_OE_N   :std_logic;
	signal SRAM_LB_N   :std_logic;
	signal SRAM_UB_N   :std_logic;

begin
   test: sram_entity port map (
    clk => clk,
    res => res,
    address => address,
    readwrite => readwrite,
    maskselect => maskselect,
    enable => enable,
    data_in => data_in,
    data_out => data_out,
    out_rdy => out_rdy,
    SRAM_DQ => SRAM_DQ,
    SRAM_ADDR => SRAM_ADDR,
    SRAM_WE_N => SRAM_WE_N,
    SRAM_CE_N => SRAM_CE_N,
    SRAM_OE_N => SRAM_OE_N,
    SRAM_LB_N => SRAM_LB_N,
    SRAM_UB_N => SRAM_UB_N
   );
       
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;

   res <= '1' after 0 ns,
          '0' after 100 ns;

   readwrite <= '0' after 0 ns, 
        	'1' after 100 ns,
        	'0' after 120 ns;

   enable    <= '0' after 0 ns,
        	'1' after 100 ns,
        	'0' after 120 ns,
              '1' after 180 ns,
              '0' after 200 ns;

   maskselect <= '0' after 0 ns;

   address <= "000000000000000001" after 0 ns;
        	
   data_in <= "00001000" after 0 ns;

   SRAM_DQ <=  "00000111" after 190 ns,
               "00000111" after 200 ns;

     
end behaviour;