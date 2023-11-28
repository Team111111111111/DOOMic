-- component for further implementation is emulated_mem_ctrl
-- usage
-- plug in clk and reset


--/* 
--  TODO
    -- 
--*/

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity syncpulses is
  port (
    clk   : in std_logic;
    res : in std_logic;

    hsync : out std_logic;
    vsync : out std_logic;

    screen_address : out std_logic_vector(15 downto 0)
  );    
end entity;

architecture behavioral of syncpulses is  
  signal hcount, vcount : unsigned (15 downto 0) := (others => '0');
  signal screen_address_new : unsigned (15 downto 0);
  signal count_enable : std_logic;
  signal h_end : std_logic;

     -- horizontal
  constant h_screen : integer         := 640 ; 
  constant h_front_porch : integer    := 16;
  constant h_pulse : integer          := 96;
  constant h_back_porch : integer     := 48;
   -- vertical
  constant v_screen : integer         := 400;
  constant v_front_porch : integer    := 12;
  constant v_pulse : integer     	  := 2;
  constant v_back_porch : integer     := 35;
    --clk
  constant clock_demultiplier : integer := 2; # for 50MHZ clock;


begin

   ----------------------------------------------------------------
    -- Hsync signal assignment
  ----------------------------------------------------------------
      
    hsync <= '1' when hcount < ((h_screen + h_front_porch) * clock_demultiplier) + 1 else '0' when hcount < ((h_screen + h_front_porch + h_pulse)  * clock_demultiplier) + 1 else '1';
    h_end <= '1' when hcount >= (h_screen + h_front_porch + h_pulse + h_back_porch) * clock_demultiplier else '0';
    -- 1 when outside of pulse, 0 when in

  -- Synchronous process for vsync counter
  process (clk)
  begin
      --hsync counter
    if (res = '1') then 
      hcount <= (others => '0');
    else

        if (rising_edge(clk)) then
          if (hcount >= (h_screen + h_front_porch + h_pulse + h_back_porch) * clock_demultiplier) then
            hcount <= (others => '0');
          else
            hcount <= hcount + 1;
          end if;
        end if;  

    end if;
  end process;

  ----------------------------------------------------------------
    -- Vsync signal assignment
  ----------------------------------------------------------------

    vsync <= '0' when vcount > (v_screen + v_front_porch -1) + 1 and vcount < (v_screen + v_front_porch + v_pulse) + 1 else '1';
    -- 1 when outside of pulse, 0 when in

  -- Synchronous process for vsync counter
  process (clk)
  begin
    if(res = '1') then
      vcount <= (others => '0');
    else
      if(rising_edge(clk)) then
        if (h_end = '1') then
          if (vcount >= (v_screen + v_front_porch + v_pulse + v_back_porch)) then
            vcount <= (others => '0');
          else
            vcount <= vcount + 1;
          end if;
        end if;
      end if;
    end if;
  end process;

  ----------------------------------------------------------------
    -- screen address signal assignment
  ----------------------------------------------------------------
  # this signal asynchronously desides whether the color can be shown or not
  count_enable <= '0' when hcount > h_screen * clock_demultiplier or vcount > v_screen else '1'; 

  process(clk)
  begin
    if(res = '1') then
      screen_address_new <= (others => '0');
    else
      if(rising_edge(clk)) then
        if vcount > v_screen then
          screen_address_new <= (others => '0');
        elsif count_enable = '1' then
          screen_address_new <= screen_address_new + 1;
        else
        screen_address_new <= screen_address_new;
        end if;
      end if;
    end if;
  end process;

  # this sets 0xFF as a do not send bit in color memory, a memory location that isnt used anyway in the buffer (but is used in the rest of the system memory)
  screen_address <= (others => '1') when count_enable = '0' else screen_address_new; 

  end architecture;