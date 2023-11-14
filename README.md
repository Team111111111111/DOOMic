# DOOM

## Outline

The goal of this project is to create a 3D render in hardware based on the rendering methodes of Wolfenstein 3D and idTech1 (aka the Doom engine). <br>
This project consists of a set of intermidiate goals that lead to the DOOM video game. The first one is to create a quadrilateral geometry pipeline with a space partitioning algorithm that will create a wireframe based on a simple map of the world.<br>
<br>
The main part of the geometry engine will be implamented in a small chip (less than 1000 flipflops) fabed with TSMC's 180nm node, which is a part of the TU Delft EE EPO-3 project. The rest of the features (for example VGA based Rendering Output Unit) will go to the FPGA designed to extend the IO capabilities of the chip and take any features that won't fit in the ASIC. <br>

## Documentation
Every component should have a block diagram, flow chart and a description in the wiki that explains its operation.<br>

## Tools used for the documentation
Draw.io<br>


## Development toolchain
1.) VHDL description - preffered text editor (VIM, VSCode, Notepad);<br>
2.) VHDL simulation  - Questasim, GHDL;<br>
3.) VHDL synthesis   - Xilinx ISE for testing; Quartus for deployment;<br>
4.) Timing analysis  - Arjan's PHD thing;<br>
5.) Routing and implementation - GoWithTheFLow;<br>
