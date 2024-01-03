#!/bin/bash

# Yeah I am too lazy to make a proper makefile

ghdl -a rop.vhd controller/address_buffer.vhd controller/color_buffer.vhd controller/controller.vhd controller/eof_detector.vhd controller/ram_mux.vhd controller/zeros_counter.vhd
ghdl -e rop
