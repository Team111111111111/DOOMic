library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

entity pipeline_controler_tb is
end pipeline_controler_tb;

architecture behaviour of pipeline_controler_tb is
   component pipeline_controler
      port(clk        : in  std_logic;
           res        : in  std_logic;
           output_bus : in  std_logic_vector(15 downto 0);
           input_bus  : in  std_logic_vector(13 downto 0);
           h_rdy      : in  std_logic;
   	   	   v_rdy      : in  std_logic;
           h_enable   : out std_logic;
           v_enable   : out std_logic;
           transmit   : out std_logic);
   end component;
   signal clk        : std_logic;
   signal res        : std_logic;
   signal output_bus : std_logic_vector(15 downto 0);
   signal input_bus  : std_logic_vector(13 downto 0);
   signal h_rdy      : std_logic;
   signal v_rdy      : std_logic;
   signal h_enable   : std_logic;
   signal v_enable   : std_logic;
   signal transmit   : std_logic;
begin
   test: pipeline_controler port map (clk, res, output_bus, input_bus, h_rdy, v_rdy, h_enable, v_enable, transmit);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   res <= '0' after 0 ns;
   output_bus <= "0000000000000000" after 0 ns;
   input_bus <= "00000000000000" after 0 ns,
		"11111111111111" after 320 ns;
   h_rdy <= '0' after 0 ns,
	'1' after 80 ns,
	'0' after 120 ns,
	'1' after 160 ns,
	'0' after 200 ns,
	'1' after 240 ns,
	'0' after 280 ns;
   v_rdy <= '0' after 0 ns,
	'1' after 80 ns,
	'0' after 120 ns,
	'1' after 160 ns,
	'0' after 200 ns;
end behaviour;


