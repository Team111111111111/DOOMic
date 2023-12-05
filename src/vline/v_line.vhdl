--NOT DONE

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity v_line is
    generic (
        nr_of_buffers : integer := 7;
        size_of_vector : integer := 22
    );
    port (
        clk : in std_logic;
        res : in std_logic;

        data_in : in std_logic_vector(13 downto 0);

        a_out : out std_logic_vector(8 downto 0);
        b_out : out std_logic_vector(7 downto 0);

        ready_out : out std_logic;
        adder_overflow_out : out std_logic;
        adress_out : out std_logic_vector(15 downto 0)
    );
end entity v_line;

architecture structural of v_line is

    type buffer_array is array (0 to (nr_of_buffers-1)) of std_logic_vector((size_of_vector-1) downto 0);
    signal buffers : buffer_array;
    signal alpha_comp_buffer: std_logic; -- single bit

    type states is (reset_state, 

                    populate_x_p, 
                    populate_y_p, 
                    populate_a_p,
                    
                    populate_x_v,
                    populate_y_v,

                    --SIN APPROX SOMEWHERE HERE (Store Sin a in Buffer 0 and Cos a in Buffer 1)
                    aprox_cos_comp,
                    aprox_cos_32,
                    aprox_cos_60,
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

                    done -- wait for restart to send ready

                    );
    signal state, new_state : states;

    signal mult_1_sig, mult_2_sig, adder_sig, block_out_sig : std_logic_vector(21 downto 0);
    signal inv_sig : std_logic;


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
                

            when populate_x_p => 
                buffers(0) <= "0000000000000000000000"; -- Reset the sin buffers such that they can be detected empty
                buffers(1) <= "0000000000000000000000";
                if(data_in = "00000000000000") then -- Check if data is on the bus (please make the bus to honour this)
                    new_state <= populate_x_p;
                else
                    new_state <= populate_y_p;
                    buffers(2)(21 downto 8) <= data_in;          -- if data on bus store x_p in buffer 2
                    buffers(2)(7 downto 0) <= (others => '0');
                end if;

            when populate_y_p =>
                if(data_in = "00000000000000") then
                    new_state <= populate_y_p;      
                else
                    new_state <= populate_a_p;
                    buffers(3)(21 downto 8) <= data_in;          -- store y_p in buffer 3
                    buffers(3)(7 downto 0) <= (others => '0');
                end if;

            when populate_a_p =>
                if(data_in = "00000000000000") then
                    new_state <= populate_a_p;      
                else
                    new_state <= populate_x_v;                   -- next state to sin cos approx??
                    buffers(0)(21 downto 8) <= data_in;          -- store a_p in buffer 0
                    buffers(0)(7 downto 0) <= (others => '0');
                end if;

            when populate_x_v =>
                if(data_in = "00000000000000") then
                    new_state <= populate_x_v;      
                else
                    new_state <= populate_y_v;
                    buffers(4)(21 downto 8) <= data_in;          -- store x_v in buffer 4
                    buffers(4)(7 downto 0) <= (others => '0');
                end if;

            when populate_y_v =>  
                if(data_in = "00000000000000") then
                    new_state <= populate_y_v;      
                else
                    new_state <= invert_x_p;
                    buffers(5)(21 downto 8) <= data_in;          -- store y_v in buffer 5
                    buffers(5)(7 downto 0) <= (others => '0');
                end if;

            -- APPROXIMATOR
            when aprox_cos_comp =>
                -- port map alpha (buffer(0)) to comparators: TODO
                    -- comp16 comp48

                if (comp16 == '0') then         -- comp16 is a comparator that outputs '0' if alpha <= 16
                    buffers(1)  <= buffers(0)    -- copy alpha into buffer 1, this is the input to aprox_cos_pt1
                    new_state   <= aprox_cos_pt1;
                elsif (comp48 == '0') then      -- comp48 outputs '0' if alpha <= 48, hence 16 < alpha <= 48 due to elsif
                    new_state   <= aprox_cos_32;
                else                            -- 48 < alpha <= 64
                    new_state   <= aprox_cos_60;
                end if;
                  
            when aprox_cos_32 =>
                -- subtract 32 so that alpha is in approximator's domain
                mult_1_sig  <= buffers(0);                   -- alpha stored in buffer 0
                mult_2_sig  <= "00000000000001 00000000";    
                inv_sig     <= '0';                             -- do not invert
                adder_sig   <= "11111111100000 00000000";      -- add -32 (subtract)
                buffers(1)  <= block_out_sig;                -- store (intermediate) output of cos(alpha) into buffer 1
                new_state   <= aprox_cos_pt1;
            
            when aprox_cos_60 => 
                -- subtract 60 so that alpha is in approximator's domain
                mult_1_sig  <= buffers(0);                   
                mult_2_sig  <= "00000000000001 00000000";    
                inv_sig     <= '0';                             
                adder_sig   <= "11111111000000 00000000";      -- add -64 (subtract)
                buffers(1)  <= block_out_sig;
                new_state   <= aprox_cos_pt1;
            
            when aprox_cos_pt1 =>
                -- square and take -ve => -(x^2)
                mult_1_sig  <= buffers(1);
                mult_2_sig  <= buffers(1);
                inv_sig     <= '1';                         -- invert
                adder_sig   <= "00000000000000 00000001";
                buffers(1)  <= block_out_sig;
                new_state   <= aprox_cos_pt2;

            when aprox_cos_pt2 =>
                -- divide by 256, add 1 (could shift but we have the mult anyway)
                mult_1_sig  <= buffers(1);
                mult_2_sig  <= "00000000000000 00000001";
                inv_sig     <= '0';
                adder_sig   <= "00000000000001 00000000";
                buffers(1)  <= block_out_sig;
                new_state   <= aprox_cos_out;
            
            when aprox_cos_out =>   -- could be split into two states if needed?
                -- checks if output needs to be -ve, then converts and stores output
                -- we dont need to buffer the comparison result here as buffers(0) is unchanged
                if (comp16 == '1' && comp48 == '0') then    -- 16 < alpha <= 48
                    -- times -1
                    mult_1_sig  <= buffers(1);
                    mult_2_sig  <= "00000000000001 00000000"; -- (x1 then invert instead of x-1 for power optimisation?)
                    inv_sig     <= '1';
                    adder_sig   <= "00000000000000 00000001";
                    buffers(1)  <= block_out_sig;
                else:
                    -- defining signals so latches aren't synthesised
                    mult_1_sig  <= "00000000000000 00000000";
                    mult_2_sig  <= "00000000000000 00000000";
                    inv_sig     <= '0';
                    adder_sig   <= "00000000000000 00000000";
                end if;
                new_state   <= aprox_sin_comp;
                    
            when aprox_sin_comp =>
                -- port map alpha (buffer(0)) to comparators: TODO
                    -- comp32

                if (comp32 == '0') then         -- comp32: '0' if alpha <= 32
                    alpha_comp_buffer <= comp32;    -- need to buffer result for later as we modify buffers(0) now
                    new_state   <= aprox_sin_pt1;
                else                            -- 48 < alpha <= 64
                    new_state   <= aprox_sin_32;
                end if;
            
            when aprox_sin_32 =>
                mult_1_sig  <= buffers(0);
                mult_2_sig  <= "00000000000001 00000000";
                inv_sig     <= '0';
                adder_sig   <= "11111111100000 00000000";      -- add -32 (subtract)
                buffers(0)  <= block_out_sig;                   -- store (intermediate) output of sin(alpha) into buffer 0
                new_state   <= aprox_sin_pt1;

            when aprox_cos_pt1 =>
                -- square and take -ve => -(x^2)
                mult_1_sig  <= buffers(0);
                mult_2_sig  <= buffers(0);
                inv_sig     <= '1';                         -- invert
                adder_sig   <= "00000000000000 00000001";
                buffers(0)  <= block_out_sig;
                new_state   <= aprox_sin_pt2;

            when aprox_sin_pt2 =>
                -- divide by 256, add 1 (could shift but we have the mult anyway)
                mult_1_sig  <= buffers(0);
                mult_2_sig  <= "00000000000000 00000001";
                inv_sig     <= '0';
                adder_sig   <= "00000000000001 00000000";
                buffers(0)  <= block_out_sig;
                new_state   <= aprox_sin_out;

            when aprox_sin_out =>
                if (alpha_comp_buffer == '1') then      -- alpha > 32
                    -- times -1
                    mult_1_sig  <= buffers(0);
                    mult_2_sig  <= "00000000000001 00000000"; -- (x1 then invert instead of x-1 for power optimisation?)
                    inv_sig     <= '1';
                    adder_sig   <= "00000000000000 00000001";
                    buffers(0)  <= block_out_sig;  
                else:
                    -- defining signals so latches aren't synthesised
                    mult_1_sig  <= "00000000000000 00000000";
                    mult_2_sig  <= "00000000000000 00000000";
                    inv_sig     <= '0';
                    adder_sig   <= "00000000000000 00000000";
                end if;
                new_state <= populate_x_v;      -- whatever the next state should be
                 
                
                

            when invert_x_p =>          -- invert_x_p + LSB
                mult_1_sig <= buffers(2);                   -- X_p stored in buffer 2
                mult_2_sig <= "00000000000001 00000000"; 
                inv_sig <= '1';
                adder_sig <= "00000000000000 00000001";        -- add LSB to calc 2s complement inverse
                buffers(2) <= block_out_sig;                -- store the inverse in the same buffer
                new_state <= invert_y_p;

            when invert_y_p =>          -- invert_y_p + LSB
                mult_1_sig <= buffers(3);                   -- Y_p stored in buffer 3
                mult_2_sig <= "00000000000001 00000000";       -- set mult2_sig to fixed point 1
                inv_sig <= '1';                             -- bitwise not
                adder_sig <= "00000000000000 00000001";        -- add LSB to calc 2s complement inverse
                block_out_sig <= buffers(3);                -- store the inverse in the same buffer
                new_state <= calc_dx;

            when calc_dx =>             -- x_v + (-x_p)
                mult_1_sig <= buffers(4);                   -- x_v stored in buffer  4
                mult_2_sig <= "00000000000001 00000000";       -- set mult2_sig to fixed point 1 (do not multiply)
                inv_sig <= '0';                             -- do not invert
                adder_sig <= buffers(2);                    -- add -x_p stored in buffer 2
                buffers(2) <= block_out_sig;                 -- store result in buffer 2
                new_state <= calc_dy;

            when calc_dy =>             -- y_v + (-y_p)
                mult_1_sig <= buffers(5);                   -- y_v stored in buffer  5
                mult_2_sig <= "00000000000001 00000000";       -- set mult2_sig to fixed point 1 (do not multiply)
                inv_sig <= '0';                             -- do not invert
                adder_sig <= buffers(3);                    -- add -y_p stored in buffer 3
                buffers(3) <= block_out_sig;                 -- store result in buffer 3
                new_state <= calc_dy_sin_a_inv;

            when calc_dy_sin_a_inv =>   -- -dy*sina_inv + LSB
                mult_1_sig <= buffers(3);                   -- dY stored in buffer  3
                mult_2_sig <= buffers(0);                   -- sin a stored in buffer 0
                inv_sig <= '1';                             -- invert
                adder_sig <= "00000000000000 00000001";         -- add LSB
                buffers(4) <= block_out_sig;                 -- store result in buffer 4
                new_state <= calc_z;

            when calc_Z =>              -- dxcosa - dysina --> Somehow to LUT ( component?? )
                mult_1_sig <= buffers(2);                   -- dX stored in buffer  2
                mult_2_sig <= buffers(1);                   -- cos a stored in buffer 1
                inv_sig <= '0';                             -- No invert
                adder_sig <= buffers(4);                    -- add -dysina
                buffers(4) <= block_out_sig;                -- store result in buffer 2
                new_state <= calc_dx_sin_a;
                                                            -- Somehow LUT this

            when calc_dx_sin_a =>       -- -dx*sina
                mult_1_sig <= buffers(2);                   -- dX stored in buffer  2
                mult_2_sig <= buffers(0);                   -- sin a stored in buffer 0
                inv_sig <= '0';                             -- No invert
                adder_sig <= (others => '0');               -- add 0
                buffers(2) <= block_out_sig;                -- store result in buffer 2
                new_state <= calc_da;

            when calc_da =>             -- -dy*cosa + dx sina
                mult_1_sig <= buffers(3);                   -- dY stored in buffer  3
                mult_2_sig <= buffers(1);                   -- cos a stored in buffer 1
                inv_sig <= '0';                             -- No invert
                adder_sig <= buffers(2);               -- add dx sin a stored in buffer 2
                buffers(2) <= block_out_sig;                -- store result in buffer 2
                new_state <= calc_da_k;                                                    

            when calc_da_k =>           -- da * k
                mult_1_sig <= buffers(3);                   -- da stored in buffer 2
                mult_2_sig <= buffers(4);                   -- k stored in buffer 4
                inv_sig <= '0';                             -- No invert
                adder_sig <= (others => '0');               -- add 0
                buffers(2) <= block_out_sig;                -- store result in buffer 2
                new_state <= calc_a;                                                

            when calc_a =>              -- (da * k * c1) + 99 -- OUT TO HLINE
                mult_1_sig <= buffers(2);                   -- daK stored in buffer 2
                mult_2_sig <= ;                             -- Multiply by Constant (tbd)
                inv_sig <= '0';                             -- No invert
                adder_sig <= " 00000001100011 00000000";      -- add 99
                buffers(2) <= block_out_sig;                -- store result in buffer 2
                new_state <= calc_a;    

            when calc_h =>              -- K * c2 = h/2
                mult_1_sig <= buffers(4);                   -- K stored in buffer 4
                mult_2_sig <= ;                             -- Multiply by Constant (tbd)
                inv_sig <= '0';                             -- No invert
                adder_sig <= (others => '0');               -- add 0
                buffers(3) <= block_out_sig;                -- store result in buffer 3
                new_state <= calc_b_bot;

            when calc_b_bot =>          -- h/2 + 99 -- OUT TO HLINE
                mult_1_sig <= buffers(3);                   -- h/2 stored in buffer 3
                mult_2_sig <= "00000000000001 00000000";    -- Multiply by 1
                inv_sig <= '0';                             -- No invert
                adder_sig <= "0000000110001100000000";      -- add 99
                buffers(4) <= block_out_sig;                -- store result in buffer 5
                new_state <= calc_b_top;

            when calc_b_top =>          -- h/2 - 99 -- OUT TO HLINE
                mult_1_sig <= buffers(3);                   -- h/2 stored in buffer 3
                mult_2_sig <= "00000000000001 00000000";    -- Multiply by 1
                inv_sig <= '0';                             -- No invert
                adder_sig <= "1111111001110100000000";      -- add -99
                buffers(3) <= block_out_sig;                -- store result in buffer 6
                new_state <= calc_b_top;

            when calc_bot_addr =>       -- 320 * b_bot + a

            when calc_top_addr =>       -- 320 * b_top + a

            when done =>                -- wait for restart to send ready

            when others =>
                new_state <= reset_state;

        end case;
    end process;
    
end architecture;