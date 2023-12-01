#!/bin/bash

ghdl -a -fsynopsys *.vhdl
ghdl -e -fsynopsys lov_tb
ghdl -r -fsynopsys lov_tb
