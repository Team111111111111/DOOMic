--vline top entity
-- TODO
-- calc C1, C2
-- Bug Hunt

-- ADDRESS IS 16 BIT CALC IS 14 BIT
-- BITSHIFT? HOW

-- double check how to do the Xps etc cause I dont think I can actually erase those, new buffers?
-- -- Bithshift right by 2 when swithcing to 16 bit and bitshift left by 2 every time you go trought the multiplier




library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity v_line is
    generic (
        nr_of_buffers : integer := 7
    );
    port (
        clk : in std_logic;
        res : in std_logic;

        data_in : in std_logic_vector(13 downto 0);

        a_out : out std_logic_vector(8 downto 0);
        b_top_out : out std_logic_vector(7 downto 0);
        b_bot_out : out std_logic_vector(7 downto 0);
    
        ready_out_h : out std_logic;
        ready_out_bus: out std_logic;
        bus_empty_in : in std_logic;
        adder_overflow_out : out std_logic;
        adress_out : out std_logic_vector(15 downto 0)
    );
end entity v_line;

architecture structural of v_line is

    type states is (reset_state, 

                    populate_x_p, 
                    populate_y_p, 
                    populate_a_p,
                    
                    populate_x_v,
                    populate_y_v,

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
                    aprox_sin_out,


                    invert_x_p, -- invert_x_v + LSB
                    invert_y_p, -- invert_y_v + LSB
                    calc_dx,    -- x_v + (-x_p)
                    calc_dy,    -- y_v + (-y_p)

                    calc_dy_sin_a_inv, -- -dy*sina_inv + LSB
                    calc_Z, -- dxcosa - dysina --> Somehow to LUT ( component?? )

                    calc_dx_sin_a, -- -dx*sina
                    calc_da, -- -dy*cosa + dx sina
                    
                    calc_da_k, -- da * k
                    calc_a, -- (da * k * c1) + 99 -- OUT TO HLINE

                    calc_h, -- K * c2 = h/2
                    calc_b_bot, -- h/2 + 99 -- OUT TO HLINE
                    calc_b_top, -- h/2 - 99 -- OUT TO HLINE

                    calc_bot_addr, -- 320 * b_bot + a
                    calc_top_addr, -- 320 * b_top + a

                    addres_calc,
                    addres_wait,

                    done -- wait for restart to send ready

                    );
    signal state, new_state : states;

    type buffer_array is array ((nr_of_buffers-1) downto 0) of std_logic_vector(21 downto (nr_of_buffers-1));
    signal buffers_in : buffer_array;
    signal buffers_out : buffer_array;
    type en_array is array ((nr_of_buffers-1) downto 0) of std_logic;
    signal en : en_array;
    
    signal alpha_comp_buffer_in :   std_logic; -- single bit
    signal alpha_comp_buffer_out :  std_logic; 
    signal alpha_comp_buffer_en :   std_logic; -- Possible for deletion and use B6

    signal mult_1_sig, mult_2_sig, adder_sig, block_out_sig : std_logic_vector(21 downto 0);
    signal inv_sig : std_logic;
    signal comp16_out, comp32_out, comp48_out : std_logic;
    signal lookup_in :  std_logic_vector(5 downto 0);
    signal lookup_out:  std_logic_vector(7 downto 0);


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

    component v_line_register is
        port (
          clk : in std_logic;
          res : in std_logic;
          en : in std_logic;
      
          input : in std_logic_vector(21 downto 0);
          output : out std_logic_vector(21 downto 0)
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
    
    component v_line_lookup is
        port (
            input_vector :  std_logic_vector(5 downto 0);
            output_vector : std_logic_vector(7 downto 0)
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

    buffer_0: v_line_register
    port map (
      clk    => clk,
      res    => res,
      en     => en(0),
      input  => buffers_in(0),
      output => buffers_out(0)
    );

    buffer_1: v_line_register
    port map (
      clk    => clk,
      res    => res,
      en     => en(1),
      input  => buffers_in(1),
      output => buffers_out(1)
    );

    buffer_2: v_line_register
    port map (
      clk    => clk,
      res    => res,
      en     => en(2),
      input  => buffers_in(2),
      output => buffers_out(2)
    );

    buffer_3: v_line_register
    port map (
      clk    => clk,
      res    => res,
      en     => en(3),
      input  => buffers_in(3),
      output => buffers_out(3)
    );

    buffer_4: v_line_register
    port map (
      clk    => clk,
      res    => res,
      en     => en(4),
      input  => buffers_in(4),
      output => buffers_out(4)
    );

    buffer_5: v_line_register
    port map (
      clk    => clk,
      res    => res,
      en     => en(5),
      input  => buffers_in(5),
      output => buffers_out(5)
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
      a   => buffers_out(0),
      b   => "0000000001000000000000",
      ala => comp16_out
    );
    
    comp32_inst: m_comparator
    generic map (
      n_bits => 22
    )
    port map (
      a   => buffers_out(0),
      b   => "0000000010000000000000",
      ala => comp32_out
    );

    comp48_inst: m_comparator
    generic map (
      n_bits => 22
    )
    port map (
      a   => buffers_out(0),
      b   => "0000000011000000000000",
      ala => comp48_out
    );

    lookup_inst: v_line_lookup
    port map (
      input_vector  => lookup_in,
      output_vector => lookup_out
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
                new_state <= populate_x_p;
                buffers_in <= (others => (others => '0'));   
                en <= (others => '0');
                mult_1_sig <= (others => '0');
                mult_2_sig <= (others => '0');
                inv_sig <= '0'; 
                adder_sig <= (others => '0');
                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                lookup_in <= (others => '0');
                
                ready_out_h <= '0';
ready_out_bus <='0';
                

            when populate_x_p => 
                buffers_in(0) <= (others => '0'); -- Reset the sin buffers such that they can be detected empty
                en(0) <= '1';
                buffers_in(1) <= (others => '0');
                en(1) <= '1';

                if(data_in = "00000000000000") then -- Check if data is on the bus (please make the bus to honour this)
                    new_state <= populate_x_p;
                    buffers_in(2) <= (others => '0');
                    en(2) <= '0';
                else
                    new_state <= populate_y_p;
                    buffers_in(2)(21 downto 8) <= data_in;          -- if data on bus store x_p in buffer 2
                    buffers_in(2)(7 downto 0) <= (others => '0');
                    en(2) <= '1';
                end if;

                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                mult_1_sig <= (others => '0');
                mult_2_sig <= (others => '0');
                inv_sig <= '0'; 
                adder_sig <= (others => '0');
                buffers_in(6 downto 3) <= (others => (others => '0'));
                en(6 downto 3) <= (others => '0');
                ready_out_h <= '0';
ready_out_bus <='0';
                lookup_in <= (others => '0');

            when populate_y_p =>
                if(data_in = "00000000000000") then
                    new_state <= populate_y_p;      

                else
                    new_state <= populate_a_p;
                    buffers_in(3)(21 downto 8) <= data_in;          -- store y_p in buffer 3
                    buffers_in(3)(7 downto 0) <= (others => '0');
                    en(3) <= '1';
                end if;

                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                mult_1_sig <= (others => '0');
                mult_2_sig <= (others => '0');
                inv_sig <= '0'; 
                adder_sig <= (others => '0');
                buffers_in(6 downto 4) <= (others => (others => '0'));          -- Prevent Latches
                en(6 downto 4) <= '0';
                buffers_in(2 downto 0) <= (others => (others => '0'));
                en(2 downto 0) <= (others => '0');
                lookup_in <= (others => '0');
                ready_out_h <= '0';
ready_out_bus <='0';

            when populate_a_p =>
                if(data_in = "00000000000000") then
                    new_state <= populate_a_p;     
                    buffers_in(0) <= (others => '0');          -- Prevent Latches
                    en(0) <= '0'; 
                else
                    new_state <= populate_x_v;                   -- next state to sin cos approx??
                    buffers_in(0)(21 downto 8) <= data_in;          -- store a_p in buffer 0
                    buffers_in(0)(7 downto 0) <= (others => '0');
                    en(0) <= '1';
                end if;

                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                mult_1_sig <= (others => '0');
                mult_2_sig <= (others => '0');
                inv_sig <= '0'; 
                adder_sig <= (others => '0');
                buffers_in(6 downto 1) <= (others => (others => '0'));          -- Prevent Latches
                en(6 downto 1) <= (others => '0');
                lookup_in <= (others => '0');
                ready_out_h <= '0';
ready_out_bus <='0';

            when populate_x_v =>
                if(data_in = "00000000000000") then
                    new_state <= populate_x_v;    
                    buffers_in(4) <= (others => '0');          -- Prevent Latches
                    en(4) <= '0';  
                elsif data_in = "11111111111111" then
                    new_state <= populate_x_p;

                    buffers_in(4) <= (others => '0');          -- Prevent Latches
                    en(4) <= '0';  
                else
                    new_state <= populate_y_v;
                    buffers_in(4)(21 downto 8) <= data_in;          -- store x_v in buffer 4
                    buffers_in(4)(7 downto 0) <= (others => '0');
                end if;

                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                mult_1_sig <= (others => '0');
                mult_2_sig <= (others => '0');
                inv_sig <= '0'; 
                adder_sig <= (others => '0');
                buffers_in(5) <= (others => '0');          -- Prevent Latches
                en(5) <= '0';
                buffers_in(3 downto 0) <= (others => (others => '0'));
                en(3 downto 0) <= (others => '0');
                lookup_in <= (others => '0');
                ready_out_h <= '0';
ready_out_bus <='0';

            when populate_y_v =>  
                if(data_in = "00000000000000") then
                    new_state <= populate_y_v;    
                    buffers_in(5) <= (others => '0');
                    en(5) <= '0';  
                elsif data_in = "11111111111111" then
                    new_state <= populate_x_p;

                    buffers_in(5) <= (others => '0');          -- Prevent Latches
                    en(5) <= '0';  
                else
                    new_state <= aprox_cos_comp;
                    buffers_in(5)(21 downto 8) <= data_in;          -- store y_v in buffer 5
                    buffers_in(5)(7 downto 0) <= (others => '0');
                    en(5) <= '1';
                end if;

                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                mult_1_sig <= (others => '0');
                mult_2_sig <= (others => '0');
                inv_sig <= '0'; 
                adder_sig <= (others => '0');
                buffers_in(4 downto 0) <= (others => (others => '0'));          -- Prevent Latches
                en(4 downto 0) <= '0';
                lookup_in <= (others => '0');
                ready_out_h <= '0';
ready_out_bus <='0';

            -- APPROXIMATOR
            when aprox_cos_comp =>
                if (buffers_out(1) /= "0000000000000000000000") then -- approx already done
                    new_state <= invert_x_p;
                else
                    -- port map alpha (buffer(0)) to comparators: TODO
                        -- comp16 comp48

                    if (comp16_out = '0') then         -- comp16 is a comparator that outputs '0' if alpha <= 16
                        new_state       <= aprox_cos_pt1;
                        buffers_in(1)   <= buffers_out(0);    -- copy alpha into buffer 1, this is the input to aprox_cos_pt1
                        en(1)           <= '1';
                    elsif (comp48_out = '0') then      -- comp48 outputs '0' if alpha <= 48, hence 16 < alpha <= 48 due to elsif
                        new_state       <= aprox_cos_32;
                        buffers_in(1)   <= (others => '0');
                        en(1)           <= '0';
                    else                            -- 48 < alpha <= 64
                        new_state       <= aprox_cos_64;
                        buffers_in(1)   <= (others => '0');
                        en(1)           <= '0';
                    end if;

                    buffers_in(6 downto 2)  <= (others => '0');
                    buffers_in(0)           <= (others => '0');
                    en(6 downto 2)  <= '0';
                    en(0)           <= '0';
                end if;

                buffers_in(6 downto 0)  <= (others => (others => '0'));
                en(6 downto 0)          <= (others => '0');
                mult_1_sig  <= (others => '0');
                mult_2_sig  <= (others => '0');
                inv_sig     <= '0';
                adder_sig   <= (others => '0');
                alpha_comp_buffer_en    <= '0';
                alpha_comp_buffer_in    <= '0';
                lookup_in <= (others => '0');
                ready_out_h               <= '0';

                  
            when aprox_cos_32 =>
                -- subtract 32 so that alpha is in approximator's domain
                mult_1_sig      <= buffers_out(0);                   -- alpha stored in buffer 0
                mult_2_sig      <= "0000000000000100000000";    
                inv_sig         <= '0';                             -- do not invert
                adder_sig       <= "1111111110000000000000";       -- add -32 (subtract)
                buffers_in(1)   <= block_out_sig;  
                en(1)           <= '1';                             -- store (intermediate) output of cos(alpha) into buffer 1
                new_state       <= aprox_cos_pt1;

                buffers_in(6 downto 2)  <= (others => '0');
                buffers_in(0)           <= (others => '0');
                en(6 downto 2)          <= '0';
                en(0)                   <= '0';
                alpha_comp_buffer_in    <= '0';
                alpha_comp_buffer_en    <= '0';
                lookup_in <= (others => '0');
                ready_out_h               <= '0';

            when aprox_cos_64 => 
                -- subtract 60 so that alpha is in approximator's domain
                mult_1_sig      <= buffers_out(0);                   
                mult_2_sig      <= "0000000000000100000000";    
                inv_sig         <= '0';                             
                adder_sig       <= "1111111100000000000000";      -- add -64 (subtract)
                buffers_in(1)   <= block_out_sig;
                en(1)           <= '1';
                new_state       <= aprox_cos_pt1;

                buffers_in(6 downto 2)  <= (others => '0');
                buffers_in(0)           <= (others => '0');
                en(6 downto 2)          <= '0';
                en(0)                   <= '0';
                alpha_comp_buffer_in    <= '0';
                alpha_comp_buffer_en    <= '0';
                lookup_in <= (others => '0');
                ready_out_h               <= '0';

            when aprox_cos_pt1 =>
                -- square and take -ve => -(x^2)
                mult_1_sig      <= buffers_out(1);
                mult_2_sig      <= buffers_out(1);
                inv_sig         <= '1';                         -- invert
                adder_sig       <= "0000000000000000000001";
                buffers_in(1)   <= block_out_sig;
                en(1) <= '1';
                new_state       <= aprox_cos_pt2;
                
                buffers_in(6 downto 2)  <= (others => '0');
                buffers_in(0)           <= (others => '0');
                en(6 downto 2)          <= '0';
                en(0)                   <= '0';
                alpha_comp_buffer_in    <= '0';
                alpha_comp_buffer_en    <= '0';
                lookup_in <= (others => '0');
                ready_out_h               <= '0';

            when aprox_cos_pt2 =>
                -- divide by 256, add 1 (could shift but we have the mult anyway)
                mult_1_sig      <= buffers_out(1);
                mult_2_sig      <= "0000000000000000000001";
                inv_sig         <= '0';
                adder_sig       <= "0000000000000100000000";
                buffers_in(1)   <= block_out_sig;
                en(1)           <= '1';
                new_state       <= aprox_cos_out;
                
                buffers_in(6 downto 2)  <= (others => '0');
                buffers_in(0)           <= (others => '0');
                en(6 downto 2)          <= '0';
                en(0)                   <= '0';
                alpha_comp_buffer_in    <= '0';
                alpha_comp_buffer_en    <= '0';
                lookup_in <= (others => '0');
                ready_out_h               <= '0';
            
            when aprox_cos_out =>   -- could be split into two states if needed?
                -- checks if output needs to be -ve, then converts and stores output
                -- we dont need to buffer the comparison result here as buffers_out(0) is unchanged
                if ((comp16_out = '1') and (comp48_out = '0')) then    -- 16 < alpha <= 48
                    -- times -1
                    mult_1_sig      <= buffers_out(1);
                    mult_2_sig      <= "0000000000000100000000"; -- (x1 then invert instead of x-1 for power optimisation?)
                    inv_sig         <= '1';
                    adder_sig       <= "0000000000000000000001";
                    buffers_in(1)   <= block_out_sig;
                    en(1)           <= '1';
                    
                    buffers_in(6 downto 2)  <= (others => '0');
                    buffers_in(0)           <= (others => '0');
                    en(6 downto 2)          <= '0';
                    en(0)                   <= '0';
                else
                    buffers_in(6 downto 0)  <= (others => '0');
                    en(6 downto 0)          <= '0';
                    mult_1_sig              <= (others => '0');
                    mult_2_sig              <= (others => '0');
                    inv_sig                 <= '0'; 
                    adder_sig               <= (others => '0');
                end if;
                new_state   <= aprox_sin_comp;

                alpha_comp_buffer_in    <= '0';
                alpha_comp_buffer_en    <= '0';
                lookup_in <= (others => '0');
                ready_out_h               <= '0';
                    
            when aprox_sin_comp =>
                
                -- port map alpha (buffer(0)) to comparators: TODO
                    -- comp32
                alpha_comp_buffer_in    <= comp32_out;    -- need to buffer result for later as we modify buffers(0) now
                alpha_comp_buffer_en    <= '1';

                if (comp32_out = '0') then         -- comp32: '0' if alpha <= 32
                    new_state   <= aprox_sin_pt1;
                else                            -- 48 < alpha <= 64
                    new_state   <= aprox_sin_32;
                end if;

                buffers_in(6 downto 0)  <= (others => '0');
                en(6 downto 0)          <= '0';
                mult_1_sig  <= (others => '0');
                mult_2_sig  <= (others => '0');
                inv_sig     <= '0';
                adder_sig   <= (others => '0');
                lookup_in <= (others => '0');
                ready_out_h   <= '0';
            
            when aprox_sin_32 =>
                mult_1_sig      <= buffers_out(0);
                mult_2_sig      <= "0000000000000100000000";
                inv_sig         <= '0';
                adder_sig       <= "1111111110000000000000";      -- add -32 (subtract)
                buffers_in(0)   <= block_out_sig;                   -- store (intermediate) output of sin(alpha) into buffer 0
                en(0)           <= '1';
                new_state       <= aprox_sin_pt1;

                buffers_in(6 downto 1)  <= (others => '0');
                en(6 downto 1)          <= '0';
                alpha_comp_buffer_in    <= '0';
                alpha_comp_buffer_en    <= '0';
                lookup_in <= (others => '0');
                ready_out_h               <= '0';



            when aprox_cos_pt1 =>
                -- square and take -ve => -(x^2)
                mult_1_sig      <= buffers_out(0);
                mult_2_sig      <= buffers_out(0);
                inv_sig         <= '1';                         -- invert
                adder_sig       <= "0000000000000000000001";
                buffers_in(0)   <= block_out_sig;
                en(0)           <= '1';
                new_state       <= aprox_sin_pt2;
                
                buffers_in(6 downto 1)  <= (others => '0');
                en(6 downto 1)          <= '0';
                alpha_comp_buffer_in    <= '0';
                alpha_comp_buffer_en    <= '0';
                lookup_in <= (others => '0');
                ready_out_h               <= '0';

            when aprox_sin_pt2 =>
                -- divide by 256, add 1 (could shift but we have the mult anyway)
                mult_1_sig      <= buffers_out(0);
                mult_2_sig      <= "0000000000000000000001";
                inv_sig         <= '0';
                adder_sig       <= "0000000000000100000000";
                buffers_in(0)   <= block_out_sig;
                en(0)           <= '1';
                new_state       <= aprox_sin_out;

                buffers_in(6 downto 1)  <= (others => '0');
                en(6 downto 1)          <= '0';
                alpha_comp_buffer_in    <= '0';
                alpha_comp_buffer_en    <= '0';
                lookup_in <= (others => '0');
                ready_out_h               <= '0';

            when aprox_sin_out =>
                if (alpha_comp_buffer_out = '1') then      -- alpha > 32
                    -- times -1
                    mult_1_sig  <= buffers_out(0);
                    mult_2_sig  <= "0000000000000100000000"; -- (x1 then invert instead of x-1 for power optimisation?)
                    inv_sig     <= '1';
                    adder_sig   <= "0000000000000000000001";
                    buffers_in(0)  <= block_out_sig;  
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
                lookup_in <= (others => '0');
                ready_out_h               <= '0';
                 
            when invert_x_p =>          -- invert_x_p + LSB
                mult_1_sig <= buffers_out(2);                   -- X_p stored in buffer 2
                mult_2_sig <= "0000000000000100000000"; 
                inv_sig <= '1';
                adder_sig <= "0000000000000000000001";        -- add LSB to calc 2s complement inverse
                buffers_in(2) <= block_out_sig;                -- store the inverse in the same buffer
                en(2) <= '1';
                new_state <= invert_y_p;

                
                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                buffers_in(6 downto 3) <= (others => '0');          -- Prevent Latches
                en(6 downto 3) <= '0';
                buffers_in(1 downto 0) <= (others => '0');
                en(1 downto 0) <= '0';
                lookup_in <= (others => '0');
                ready_out_h <= '0';
ready_out_bus <='0';

             

            when invert_y_p =>          -- invert_y_p + LSB
                mult_1_sig <= buffers_out(3);                   -- Y_p stored in buffer 3
                mult_2_sig <= "0000000000000100000000";       -- set mult2_sig to fixed point 1
                inv_sig <= '1';                             -- bitwise not
                adder_sig <= "0000000000000000000001";        -- add LSB to calc 2s complement inverse
                buffers_in(3) <= block_out_sig;                -- store the inverse in the same buffer
                en(3) <= '1';
                new_state <= calc_dx;

                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                buffers_in(6 downto 4) <= (others => '0');          -- Prevent Latches
                en(6 downto 4) <= '0';
                buffers_in(2 downto 0) <= (others => '0');
                en(2 downto 0) <= '0';
                lookup_in <= (others => '0');
                ready_out_h <= '0';
ready_out_bus <='0';

            when calc_dx =>             -- x_v + (-x_p)
                mult_1_sig <= buffers_out(4);                   -- x_v stored in buffer  4
                mult_2_sig <= "0000000000000100000000";       -- set mult2_sig to fixed point 1 (do not multiply)
                inv_sig <= '0';                             -- do not invert
                adder_sig <= buffers_out(2);                    -- add -x_p stored in buffer 2
                buffers_in(2) <= block_out_sig;                 -- store result in buffer 2
                en(2) <= '1';
                new_state <= calc_dy;

                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                buffers_in(6 downto 3) <= (others => '0');          -- Prevent Latches
                en(6 downto 3) <= '0';
                buffers_in(1 downto 0) <= (others => '0');
                en(1 downto 0) <= '0';
                lookup_in <= (others => '0');
                ready_out_h <= '0';
ready_out_bus <='0';

            when calc_dy =>             -- y_v + (-y_p)
                mult_1_sig <= buffers_out(5);                   -- y_v stored in buffer  5
                mult_2_sig <= "0000000000000100000000";       -- set mult2_sig to fixed point 1 (do not multiply)
                inv_sig <= '0';                             -- do not invert
                adder_sig <= buffers_out(3);                    -- add -y_p stored in buffer 3
                buffers_in(3) <= block_out_sig;                 -- store result in buffer 3
                en(3) <= '1';
                new_state <= calc_dy_sin_a_inv;

                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                buffers_in(6 downto 4) <= (others => '0');          -- Prevent Latches
                en(6 downto 4) <= '0';
                buffers_in(2 downto 0) <= (others => '0');
                en(2 downto 0) <= '0';
                lookup_in <= (others => '0');
                ready_out_h <= '0';
ready_out_bus <='0';

            when calc_dy_sin_a_inv =>   -- -dy*sina_inv + LSB
                mult_1_sig <= buffers_out(3);                   -- dY stored in buffer  3
                mult_2_sig <= buffers_out(0);                   -- sin a stored in buffer 0
                inv_sig <= '1';                             -- invert
                adder_sig <= "0000000000000000000001";         -- add LSB
                buffers_in(4) <= block_out_sig;                 -- store result in buffer 4
                en(4) <= '1';
                new_state <= calc_z;

                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                buffers_in(6 downto 5) <= (others => '0');          -- Prevent Latches
                en(6 downto 5) <= '0';
                buffers_in(3 downto 0) <= (others => '0');
                en(3 downto 0) <= '0';
                lookup_in <= (others => '0');
                ready_out_h <= '0';
ready_out_bus <='0';

            when calc_Z =>              -- dxcosa - dysina --> Somehow to LUT ( component?? )
                mult_1_sig <= buffers_out(2);                   -- dX stored in buffer  2
                mult_2_sig <= buffers_out(1);                   -- cos a stored in buffer 1
                inv_sig <= '0';                                 -- No invert
                adder_sig <= buffers_out(4);                    -- add -dysina
                lookup_in <= block_out_sig(14 downto 9);        -- store result in buffer 4
                buffers_in(4)(7 downto 0) <= lookup_out;
                buffers_in(4)(21 downto 8) <= (others => '0');
                en(4) <= '1';
                new_state <= calc_dx_sin_a;

                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                buffers_in(6 downto 5) <= (others => '0');          -- Prevent Latches
                en(6 downto 5) <= '0';
                buffers_in(3 downto 0) <= (others => '0');
                en(3 downto 0) <= '0';
                ready_out_h <= '0';
ready_out_bus <='0';

            when calc_dx_sin_a =>       -- -dx*sina
                mult_1_sig <= buffers_out(2);                   -- dX stored in buffer  2
                mult_2_sig <= buffers_out(0);                   -- sin a stored in buffer 0
                inv_sig <= '0';                             -- No invert
                adder_sig <= (others => '0');               -- add 0
                buffers_in(2) <= block_out_sig;                -- store result in buffer 2
                en(2) <= '1'; 
                new_state <= calc_da;
                
                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                buffers_in(6 downto 3) <= (others => '0');          -- Prevent Latches
                en(6 downto 3) <= '0';
                buffers_in(1 downto 0) <= (others => '0');
                en(1 downto 0) <= '0';
                lookup_in <= (others => '0');
                ready_out_h <= '0';
ready_out_bus <='0';

            when calc_da =>             -- -dy*cosa + dx sina
                mult_1_sig <= buffers_out(3);                   -- dY stored in buffer  3
                mult_2_sig <= buffers_out(1);                   -- cos a stored in buffer 1
                inv_sig <= '0';                             -- No invert
                adder_sig <= buffers_out(2);               -- add dx sin a stored in buffer 2
                buffers_in(2) <= block_out_sig;                -- store result in buffer 
                en(2) <= '1';
                new_state <= calc_da_k;

                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                buffers_in(6 downto 3) <= (others => '0');          -- Prevent Latches
                en(6 downto 3) <= '0';
                buffers_in(1 downto 0) <= (others => '0');
                en(1 downto 0) <= '0';
                lookup_in <= (others => '0');
                ready_out_h <= '0';
ready_out_bus <='0';

            when calc_da_k =>           -- da * k
                mult_1_sig <= buffers_out(3);                   -- da stored in buffer 2
                mult_2_sig <= buffers_out(4);                   -- k stored in buffer 4
                inv_sig <= '0';                             -- No invert
                adder_sig <= (others => '0');               -- add 0
                buffers_in(2) <= block_out_sig;                -- store result in buffer 2
                en(2) <= '1';
                new_state <= calc_a;              
                
                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                buffers_in(6 downto 3) <= (others => '0');          -- Prevent Latches
                en(6 downto 3) <= '0';
                buffers_in(1 downto 0) <= (others => '0');
                en(1 downto 0) <= '0';
                lookup_in <= (others => '0');
                ready_out_h <= '0';
ready_out_bus <='0';


            when calc_a =>              -- (da * k * c1) + 160 -- OUT TO HLINE
                mult_1_sig <= buffers_out(2);                   -- daK stored in buffer 2
                mult_2_sig <= "0000000000000100000000";     -- Multiply by Constant (tbd now set to 1)
                inv_sig <= '0';                             -- No invert
                adder_sig <= "0000001010000000000000";      -- add 160
                buffers_in(2) <= block_out_sig;                -- store result in buffer 2
                en(2) <= '1';
                new_state <= calc_a;    

                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                buffers_in(6 downto 3) <= (others => '0');          -- Prevent Latches
                en(6 downto 3) <= '0';
                buffers_in(1 downto 0) <= (others => '0');
                en(1 downto 0) <= '0';
                lookup_in <= (others => '0');
                ready_out_h <= '0';
ready_out_bus <='0';


            when calc_h =>              -- K * c2 = h/2
                mult_1_sig <= buffers_out(4);                   -- K stored in buffer 4
                mult_2_sig <= "0000001100100000000000";   -- Multiply by Constant (tbd now set to 00)
                inv_sig <= '0';                             -- No invert
                adder_sig <= (others => '0');               -- add 0
                buffers_in(3) <= block_out_sig;                -- store result in buffer 3
                en(3) <= '1';
                new_state <= calc_b_bot;

                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                buffers_in(6 downto 3) <= (others => '0');          -- Prevent Latches
                en(6 downto 3) <= '0';
                buffers_in(1 downto 0) <= (others => '0');
                en(1 downto 0) <= '0';
                lookup_in <= (others => '0');
                ready_out_h <= '0';
                ready_out_bus <='0';


            when calc_b_bot =>          -- h/2 + 99 -- OUT TO HLINE
                mult_1_sig <= buffers_out(3);                   -- h/2 stored in buffer 3
                mult_2_sig <= "0000000000000100000000";    -- Multiply by 1
                inv_sig <= '0';                             -- No invert
                adder_sig <= "0000000110001100000000";      -- add 99
                buffers_in(4) <= block_out_sig;                -- store result in buffer 4
                en(4) <= '1';
                new_state <= calc_b_top;

                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                buffers_in(6 downto 5) <= (others => '0');          -- Prevent Latches
                en(6 downto 5) <= '0';
                buffers_in(3 downto 0) <= (others => '0');
                en(3 downto 0) <= '0';
                lookup_in <= (others => '0');
                ready_out_h <= '0';
ready_out_bus <='0';


            when calc_b_top =>          -- h/2 - 99 -- OUT TO HLINE
                mult_1_sig <= buffers_out(3);                   -- h/2 stored in buffer 3
                mult_2_sig <= "0000000000000100000000";    -- Multiply by 1
                inv_sig <= '0';                             -- No invert
                adder_sig <= "1111111001110100000000";      -- add -99
                buffers_in(3) <= block_out_sig;                -- store result in buffer 3
                en(3) <= '1';
                new_state <= calc_bot_addr;

                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                buffers_in(6 downto 4) <= (others => '0');          -- Prevent Latches
                en(6 downto 4) <= '0';
                buffers_in(2 downto 0) <= (others => '0');
                en(2 downto 0) <= '0';
                lookup_in <= (others => '0');
                ready_out_h <= '0';
ready_out_bus <='0';


            when calc_bot_addr =>       -- 320 * b_bot + a
                mult_1_sig <= buffers_out(4);               -- b_bot stored in B4
                mult_2_sig <= "0000010100000000000000";    -- Multiply by 320
                inv_sig <= '0';                             -- No invert
                adder_sig <= buffers_out(2);      -- add a stored in B2
                buffers_in(6) <= block_out_sig;                -- store result in buffer 6
                en(6) <= '1';
                new_state <= calc_top_addr;

                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                buffers_in(5 downto 0) <= (others => '0');          -- Prevent Latches
                en(5 downto 0) <= '0';
                lookup_in <= (others => '0');
                ready_out_h <= '1';
ready_out_bus <='0';

            when calc_top_addr => -- 320 * b_top + a
                mult_1_sig <= buffers_out(3);                -- b_top stored in buffer B3
                mult_2_sig <= "0000010100000000000000";    -- Multiply by 320
                inv_sig <= '0';                             -- No invert
                adder_sig <= buffers_out(2);      -- add a in B2
                buffers_in(5) <= block_out_sig;                -- store result in buffer 5
                en(5) <= '1';
                new_state <= addres_calc;

                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                buffers_in(6) <= (others => '0');          -- Prevent Latches
                en(6) <= '0';
                buffers_in(4 downto 0) <= (others => '0');
                en(4 downto 0) <= '0';
                lookup_in <= (others => '0');
                ready_out_h <= '0';
                ready_out_bus <='0';
                                        
                
                                        -- Making the address calculation sequential saves an extra adder but needs an extra register
                                        -- because we cannot erase the SIN and COS registers since those are reused for the next vertex
                                        -- It also means ready out will only go high once all the pixels are written
                                        -- Possible optimisation, add an H-ready flag saves a buffer

            when addres_calc => -- B_top + 320
                ready_out_bus <= '1';
                ready_out_h <= '0';

                mult_1_sig <= buffers_out(5);               -- curr_adr (top_addr) stored in buffer 5 
                mult_2_sig <= "0000000000000100000000";    -- Multiply by 1
                inv_sig <= '0';                             -- No invert
                adder_sig <= "1111111001110100000000";      -- add 320
                buffers_in(5) <= block_out_sig;             -- store result in buffer 5
                en(5) <= '1';
                new_state <= addres_wait;

                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                buffers_in(6) <= (others => '0');          -- Prevent Latches
                en(6) <= '0';
                buffers_in(4 downto 0) <= (others => '0');
                en(4 downto 0) <= '0';
                lookup_in <= (others => '0');


            when addres_wait => -- Add a small delay to make the bus catch up
                ready_out_bus <= '1';
                ready_out_h <= '0';

                if (buffers_out(5) = buffers_out(6)) then
                    new_state <= done;
                elsif (bus_empty_in = '1') then
                    new_state <= addres_calc;
                else
                    new_state <= addres_wait;
                end if;

                buffers_in(6 downto 0) <= (others => '0');
                en(6 downto 0) <= '0';
                mult_1_sig <= (others => '0');
                mult_2_sig <= (others => '0');
                inv_sig <= '0'; 
                adder_sig <= (others => '0');
                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                lookup_in <= (others => '0');

            when done =>                -- wait for restart to send ready
                ready_out_bus <= '1';
                ready_out_h <= '0';

                buffers_in(5) <= (others => '1');
                en(5) <= '1';

                new_state <= populate_x_v;

                buffers_in(6) <= (others => '0');
                en(6) <= '0';
                buffers_in(4 downto 0) <= (others => '0');
                en(4 downto 0) <= '0';
                mult_1_sig <= (others => '0');
                mult_2_sig <= (others => '0');
                inv_sig <= '0'; 
                adder_sig <= (others => '0');
                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                lookup_in <= (others => '0');

            when others =>
                new_state <= reset_state;
                
                buffers_in(6 downto 0) <= (others => '0');
                en(6 downto 0) <= '0';
                mult_1_sig <= (others => '0');
                mult_2_sig <= (others => '0');
                inv_sig <= '0'; 
                adder_sig <= (others => '0');
                alpha_comp_buffer_in <= '0';
                alpha_comp_buffer_en <= '0';
                lookup_in <= (others => '0');
                ready_out_h <= '0';
ready_out_bus <='0';

        end case;
    end process;

    a_out <= buffers_out(2)(16 downto 8);
    b_bot_out <= buffers_out(4)(15 downto 8);
    b_top_out <= buffers_out(3)(15 downto 8);
    adress_out <= buffers_out(5)(21 downto 8);
    
end architecture;

