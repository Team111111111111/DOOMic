
SRC=../../src/math

multiplier:
	ghdl -a ${SRC}/multiplier.vhdl
	ghdl -a multiplier_tb.vhdl
	ghdl -r multiplier_tb --vcd=multiplier.vcd --stop-time=200ns

adder:
	ghdl -a ${SRC}/adder.vhdl
	ghdl -a adder_tb.vhdl
	ghdl -r adder_tb --vcd=adder.vcd --stop-time=200ns

clean:
	rm -f ./*.vcd
	rm -f ./*.cf
