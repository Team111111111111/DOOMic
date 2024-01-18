
SRC=../../fpga/debounce

debouncer:
	rm -f debounce.vcd
	ghdl -a ${SRC}/debounce.vhdl
	ghdl -a debounce_tb.vhdl
	ghdl -r debounce_tb --vcd=debounce.vcd --stop-time=400ns

clean:
	rm *.cf
	rm *.vcd
