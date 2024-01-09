library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity v_line_approx is
    port (
        clk : in std_logic;
        res : in std_logic;

        alpha : in std_logic_vector(13 downto 0);

        cos_alpha : out std_logic_vector(21 downto 0);
        sin_alpha : out std_logic_vector(21 downto 0);

        adder_overflow_out : out std_logic
    );
end entity v_line_approx;

architecture structural of v_line_approx is

    type states is (reset_state,

                    aprox_cos_comp,
                    aprox_cos_32,
                    aprox_cos_64,
                    aprox_cos_pt1,
                    aprox_cos_pt2,
                    aprox_cos_out,

                    aprox_sin_comp,
                    aprox_sin_32,
                    aprox_sin_pt1,
                    aprox_sin_pt2,
                    aprox_sin_out
                    );
                    
    signal state, new_state : states;

    signal alpha_comp_buffer_in :   std_logic; -- single bit
    signal alpha_comp_buffer_out :  std_logic; 
    signal alpha_comp_buffer_en :   std_logic;

    signal mult_1_sig, mult_2_sig, adder_sig, block_out_sig : std_logic_vector(21 downto 0);
    signal inv_sig : std_logic;
    signal comp16_out, comp32_out, comp48_out : std_logic;

    component v_line_multadder is
        port (
          mult_in_1                       : in std_logic_vector(21 downto 0);
          mult_in_2                       : in std_logic_vector(21 downto 0);
          adder_in                        : in std_logic_vector(21 downto 0);
          inv_in                          : in std_logic;
      
          block_out                       : out std_logic_vector(21 downto 0);
          overflow                        : out std_logic
        );
      end component;

      component v_line_1_bit_register is
        port (
          clk : in std_logic;
          res : in std_logic;
          en : in std_logic;
      
          input : in std_logic;
          output : out std_logic
        );
    end component;

    component m_comparator is
        generic(n_bits	:	integer := 24);
           port(a   : in  std_logic_vector(n_bits - 1 downto 0);
                b   : in  std_logic_vector(n_bits - 1 downto 0);
                ala : out std_logic
            );
    end component;

begin

    v_line_multadder_inst: v_line_multadder
    port map (
      mult_in_1 => mult_1_sig,
      mult_in_2 => mult_2_sig,
      adder_in  => adder_sig,
      inv_in    => inv_sig,
      block_out => block_out_sig,
      overflow  => adder_overflow_out
    );

    v_line_1_bit_register_inst: v_line_1_bit_register
    port map (
      clk    => clk,
      res    => res,
      en     => alpha_comp_buffer_en,
      input  => alpha_comp_buffer_in,
      output => alpha_comp_buffer_out
    );

    comp16_inst: m_comparator
    generic map (
      n_bits => 22
    )
    port map (
      a   => alpha,
      b   => "00000000010000 00000000",
      ala => comp16_out
    );
    
    comp32_inst: m_comparator
    generic map (
      n_bits => 22
    )
    port map (
      a   => alpha,
      b   => "00000000100000 00000000",
      ala => comp32_out
    );

    comp48_inst: m_comparator
    generic map (
      n_bits => 22
    )
    port map (
      a   => alpha,
      b   => "00000000110000 00000000",
      ala => comp48_out
    );

    process(clk, res)
    begin
        if (res = '1') then
            state <= reset_state;
        elsif (rising_edge(clk)) then
            state <= new_state;
        end if;
    end process;

    process(state)
    begin

        case state is
            when reset_state =>
                new_state <= aprox_cos_comp;
                mult_1_sig <= (others => '0');
                mult_2_sig <= (others => '0');
                inv_sig <= '0'; 
                adder_sig <= (others => '0');
                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                cos_alpha   <= (others => '0');
                sin_alpha   <= (others => '0');
                
            when aprox_cos_comp =>
                if (comp16_out = '0') then         -- comp16 is a comparator that outputs '0' if alpha <= 16
                    new_state       <= aprox_cos_pt1;
                    cos_alpha       <= alpha;    -- copy alpha into buffer 1, this is the input to aprox_cos_pt1
                elsif (comp48_out = '0') then      -- comp48 outputs '0' if alpha <= 48, hence 16 < alpha <= 48 due to elsif
                    new_state       <= aprox_cos_32;
                    cos_alpha       <= (others => '0');
                else                            -- 48 < alpha <= 64
                    new_state       <= aprox_cos_64;
                    cos_alpha   <= (others => '0');
                end if;
            
            sin_alpha   <= (others => '0');
            mult_1_sig  <= (others => '0');
            mult_2_sig  <= (others => '0');
            inv_sig     <= '0';
            adder_sig   <= (others => '0');
            alpha_comp_buffer_en    <= '0';
            alpha_comp_buffer_in    <= '0';

            when aprox_cos_32 =>
                -- subtract 32 so that alpha is in approximator's domain
                mult_1_sig      <= alpha;                  
                mult_2_sig      <= "00000000000001 00000000";    
                inv_sig         <= '0';                             -- do not invert
                adder_sig       <= "11111111100000 00000000";       -- add -32 (subtract)
                cos_alpha       <= block_out_sig;       
                new_state       <= aprox_cos_pt1;

                sin_alpha               <= (others => '0');
                alpha_comp_buffer_in    <= '0';
                alpha_comp_buffer_en    <= '0';

            when aprox_cos_64 => 
                -- subtract 64 so that alpha is in approximator's domain
                mult_1_sig      <= alpha;                   
                mult_2_sig      <= "00000000000001 00000000";    
                inv_sig         <= '0';                             
                adder_sig       <= "11111111000000 00000000";      -- add -64 (subtract)
                cos_alpha       <= block_out_sig;
                new_state       <= aprox_cos_pt1;

                sin_alpha               <= (others => '0');
                alpha_comp_buffer_in    <= '0';
                alpha_comp_buffer_en    <= '0';


            when aprox_cos_pt1 =>
                -- square and take -ve => -(x^2)
                mult_1_sig      <= cos_alpha;
                mult_2_sig      <= cos_alpha;
                inv_sig         <= '1';                         -- invert
                adder_sig       <= "00000000000000 00000001";
                cos_alpha   <= block_out_sig;
                new_state       <= aprox_cos_pt2;
                
                sin_alpha               <= (others => '0');
                alpha_comp_buffer_in    <= '0';
                alpha_comp_buffer_en    <= '0';

            when aprox_cos_pt2 =>
                -- divide by 256, add 1 (could shift but we have the mult anyway)
                mult_1_sig      <= cos_alpha;
                mult_2_sig      <= "00000000000000 00000001";
                inv_sig         <= '0';
                adder_sig       <= "00000000000001 00000000";
                cos_alpha       <= block_out_sig;
                new_state       <= aprox_cos_out;
                

                sin_alpha               <= (others => '0');
                alpha_comp_buffer_in    <= '0';
                alpha_comp_buffer_en    <= '0';
            
            when aprox_cos_out =>   -- could be split into two states if needed?
                -- checks if output needs to be -ve, then converts and stores output
                -- we dont need to buffer the comparison result here as buffers_out(0) is unchanged
                if ((comp16_out = '1') & (comp48_out = '0')) then    -- 16 < alpha <= 48
                    -- times -1
                    mult_1_sig      <= cos_alpha;
                    mult_2_sig      <= "00000000000001 00000000"; -- (x1 then invert instead of x-1 for power optimisation?)
                    inv_sig         <= '1';
                    adder_sig       <= "00000000000000 00000001";
                    cos_alpha       <= block_out_sig;
                    sin_alpha       <= (others => '0');

                else
                    sin_alpha       <= (others => '0');
                    mult_1_sig      <= (others => '0');
                    mult_2_sig      <= (others => '0');
                    inv_sig         <= '0'; 
                    adder_sig       <= (others => '0');
                end if;
                new_state   <= aprox_sin_comp;

                alpha_comp_buffer_in    <= '0';
                alpha_comp_buffer_en    <= '0';
                    
            when aprox_sin_comp =>
                alpha_comp_buffer_in    <= comp32_out;    -- need to buffer result for later as we modify buffers(0) now
                alpha_comp_buffer_en    <= '1';

                if (comp32_out = '0') then         -- comp32: '0' if alpha <= 32
                    new_state   <= aprox_sin_pt1;
                else                            -- 48 < alpha <= 64
                    new_state   <= aprox_sin_32;
                end if;

                cos_alpha   <= cos_alpha;
                sin_alpha   <= (others => '0');
                mult_1_sig  <= (others => '0');
                mult_2_sig  <= (others => '0');
                inv_sig     <= '0';
                adder_sig   <= (others => '0');
            
            when aprox_sin_32 =>
                mult_1_sig      <= alpha;
                mult_2_sig      <= "00000000000001 00000000";
                inv_sig         <= '0';
                adder_sig       <= "11111111100000 00000000";      -- add -32 (subtract)
                sin_alpha       <= block_out_sig;                   -- store (intermediate) output of sin(alpha) into buffer 0
                new_state       <= aprox_sin_pt1;

                cos_alpha  <= cos_alpha;
                alpha_comp_buffer_in    <= '0';
                alpha_comp_buffer_en    <= '0';

            when aprox_cos_pt1 =>
                -- square and take -ve => -(x^2)
                mult_1_sig      <= sin_alpha;
                mult_2_sig      <= sin_alpha;
                inv_sig         <= '1';                         -- invert
                adder_sig       <= "00000000000000 00000001";
                sin_alpha       <= block_out_sig;
                new_state       <= aprox_sin_pt2;
                
                cos_alpha       <= cos_alpha;
                alpha_comp_buffer_in    <= '0';
                alpha_comp_buffer_en    <= '0';

            when aprox_sin_pt2 =>
                -- divide by 256, add 1 (could shift but we have the mult anyway)
                mult_1_sig      <= sin_alpha;
                mult_2_sig      <= "00000000000000 00000001";
                inv_sig         <= '0';
                adder_sig       <= "00000000000001 00000000";
                sin_alpha       <= block_out_sig;
                new_state       <= aprox_sin_out;

                cos_alpha       <= cos_alpha;
                alpha_comp_buffer_in    <= '0';
                alpha_comp_buffer_en    <= '0';

            when aprox_sin_out =>
                if (alpha_comp_buffer_out = '1') then      -- alpha > 32
                    -- times -1
                    mult_1_sig  <= buffers_out(0);
                    mult_2_sig  <= "00000000000001 00000000"; -- (x1 then invert instead of x-1 for power optimisation?)
                    inv_sig     <= '1';
                    adder_sig   <= "00000000000000 00000001";
                    buffers(0)  <= block_out_sig;  
                    en(0)       <= '1';
                    
                    buffers_in(6 downto 1)  <= (others => '0');
                    en(6 downto 1)          <= '0';
                else
                    buffers_in(6 downto 0)  <= (others => '0');
                    en(6 downto 0)  <= '0';
                    mult_1_sig      <= (others => '0');
                    mult_2_sig      <= (others => '0');
                    inv_sig         <= '0';
                    adder_sig       <= (others => '0');
                end if;
                new_state <= invert_x_p;                    

                alpha_comp_buffer_in    <= '0';
                alpha_comp_buffer_en    <= '0';
                ready_out               <= '0';

        end case;
    end process;

end architecture;