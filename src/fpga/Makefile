
# This target only exists so I (Thijs) can easily check for syntax errors
#  in the toplevel entity/architecture
# All files that are generated are automatically deleted
compile_test:
	ghdl -a debounce/debounce.vhdl
	ghdl -a -fsynopsys vertices_list/lov.vhdl
	ghdl -a sram/sram.vhdl
	ghdl -a toplevel.vhdl
	rm -f ./*.cf
