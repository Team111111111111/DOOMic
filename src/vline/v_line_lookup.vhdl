library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity v_line_lookup is
    port (
        -- only take 6 relevant bits in
        input_vector :  in std_logic_vector(5 downto 0);
        -- only output the 8 bits after the point (backfill with zeros if 22 bit required)
        output_vector : out std_logic_vector(5 downto 0)
    );
end entity;

architecture behavioral of v_line_lookup is
begin

    process (input_vector) is
    begin
        case input_vector is      
        -- input_vector|output_vector
        when "000000" => output_vector <= "111111";
        when "000001" => output_vector <= "111100";
        when "000010" => output_vector <= "111000";
        when "000011" => output_vector <= "110100";
        when "000100" => output_vector <= "110000";
        when "000101" => output_vector <= "101100";
        when "000110" => output_vector <= "101000";
        when "000111" => output_vector <= "100100";
        when "001000" => output_vector <= "100000";
        when "001001" => output_vector <= "011100";
        when "001010" => output_vector <= "011000";
        when "001011" => output_vector <= "010100";
        when "001100" => output_vector <= "010000";
        when "001101" => output_vector <= "001100";
        when "001110" => output_vector <= "001000";
        when "001111" => output_vector <= "000100";
        when "010000" => output_vector <= "000000";
        when "010001" => output_vector <= "111100";
        when "010010" => output_vector <= "111000";
        when "010011" => output_vector <= "110100";
        when "010100" => output_vector <= "110000";
        when "010101" => output_vector <= "101100";
        when "010110" => output_vector <= "101000";
        when "010111" => output_vector <= "100100";
        when "011000" => output_vector <= "100000";
        when "011001" => output_vector <= "011100";
        when "011010" => output_vector <= "011000";
        when "011011" => output_vector <= "010100";
        when "011100" => output_vector <= "010000";
        when "011101" => output_vector <= "001100";
        when "011110" => output_vector <= "001000";
        when "011111" => output_vector <= "000100";
        when "100000" => output_vector <= "000000";
        when "100001" => output_vector <= "111100";
        when "100010" => output_vector <= "111000";
        when "100011" => output_vector <= "110100";
        when "100100" => output_vector <= "110000";
        when "100101" => output_vector <= "101100";
        when "100110" => output_vector <= "101000";
        when "100111" => output_vector <= "100100";
        when "101000" => output_vector <= "100000";
        when "101001" => output_vector <= "011100";
        when "101010" => output_vector <= "011000";
        when "101011" => output_vector <= "010100";
        when "101100" => output_vector <= "010000";
        when "101101" => output_vector <= "001100";
        when "101110" => output_vector <= "001000";
        when "101111" => output_vector <= "000100";
        when "110000" => output_vector <= "000000";
        when "110001" => output_vector <= "111100";
        when "110010" => output_vector <= "111000";
        when "110011" => output_vector <= "110100";
        when "110100" => output_vector <= "110000";
        when "110101" => output_vector <= "101100";
        when "110110" => output_vector <= "101000";
        when "110111" => output_vector <= "100100";
        when "111000" => output_vector <= "100000";
        when "111001" => output_vector <= "011100";
        when "111010" => output_vector <= "011000";
        when "111011" => output_vector <= "010100";
        when "111100" => output_vector <= "010000";
        when "111101" => output_vector <= "001100";
        when "111110" => output_vector <= "001000";
        when "111111" => output_vector <= "000100";
        when others   => output_vector <= "000001";     
        end case;
    end process;
end architecture; 