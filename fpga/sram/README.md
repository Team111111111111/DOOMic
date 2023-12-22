
The following was written by Gyan:

>Associated files: sram_entity.vhdl, sram_behaviour.vhdl
>
>The sram_controller component takes in an adress, data, enable, and readwrite signal, clk and rst are also present. it outputs data. It is used to simplify the controlling of the onboard SRAM chip. This chip offers 512 KB of fast memory.
>
>At any rising clock edge, if enable = 0 or rst = 1, the component remains inactive and gives all zeroes as data out.
>
>If enable = 1 at a rising clock edge, the components reads the readwrite signal, where it reads if a 0 is present, and writes if a one is present. for both reading and writing, an adress in the form of a (17 downto 0) bitvector needs to be provided.
>
>Reading presents the requested data within a single clock cycle (at 50 Mhz) as the (15 downto 0) bitvector "data_out".
>
>Writing stores the data present at the (7 downto 0) bitvector "data_in" in the RAM chip ath the given adress.
>