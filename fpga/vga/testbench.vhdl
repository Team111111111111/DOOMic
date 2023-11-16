library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity VGATEST is
    port (
          clk : in std_logic;
          reset : in std_logic;
      
          hsync : out std_logic;
          vsync : out std_logic;
          colorbyte: out std_logic_vector (7 downto 0)
    );
end entity VGATEST;

architecture structural of VGATEST is
    component emulated_mem_ctrl is
        port (
          clk : in std_logic;
          reset : in std_logic;
      
          writeadress : in std_logic_vector (7 downto 0);
          writebyte : in std_logic_vector (7 downto 0);
          write_enable : in std_logic;
          switch_bank : in std_logic;
      
          hsync : out std_logic;
          vsync : out std_logic;
          colorbyte: out std_logic_vector (7 downto 0)
          
        );
      end component emulated_mem_ctrl;
    signal writebyte_sig_new, write_adress_sig_new : unsigned (7 downto 0);
    signal writebyte_sig, write_adress_sig : std_logic_vector(7 downto 0);
    signal write_enable_sig, switch_bank_sig, vsync_sig: std_logic;
begin

    VGA : emulated_mem_ctrl port map (
          clk => clk,
          reset => reset,
      
          writeadress => write_adress_sig,
          writebyte => writebyte_sig,
          write_enable => write_enable_sig,
          switch_bank => switch_bank_sig,
      
          hsync => hsync,
          vsync => vsync_sig,
          colorbyte => colorbyte
        
    );

    process(clk, reset, vsync_sig)
    begin
        if (rising_edge(clk)) then 
            if (reset = '1') then
                writebyte_sig_new <= (others => '0');
                write_adress_sig_new <= (others => '0');
                write_enable_sig <= '0';
                switch_bank_sig <= '0';
            else
                if (vsync_sig = '1') then
                    switch_bank_sig <= '1';
                    writebyte_sig_new <= (others => '0');
                    write_adress_sig_new <= (others => '0');
                    write_enable_sig <= '1';
                else
                    switch_bank_sig <= '0';
                    writebyte_sig_new <= unsigned(writebyte_sig) + 1;
                    write_adress_sig_new <= unsigned(write_adress_sig) + 1;
                    write_enable_sig <= '1';
                end if;
            end if;
        end if;
        
        vsync <= vsync_sig;
        write_adress_sig <= std_logic_vector(write_adress_sig_new);
        writebyte_sig <= std_logic_vector(writebyte_sig_new);

    end process;
    
    
end architecture structural;
