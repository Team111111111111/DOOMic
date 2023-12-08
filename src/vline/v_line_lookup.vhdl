library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity v_line_lookup is
    port (
        input_vector :  in std_logic_vector(13 downto 0);
        output_vector : out std_logic_vector(21 downto 0)
    );
end entity;

architecture any of v_line_lookup is
begin

    process (input_vector) is
    begin
        case input_vector is      
        -- input_vector|output_vector
        when "--000000------" => output_vector <= "";
        when "--000001------" => output_vector <= "";
        when "--000010------" => output_vector <= "";
         
        end case;
    end process;
end architecture; 