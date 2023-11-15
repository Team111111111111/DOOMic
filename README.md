# DOOM

## Outline
The goal of this project is to create a 3D render in hardware based on the rendering methodes of Wolfenstein 3D and idTech1 (aka the Doom engine). <br>
This project consists of a set of intermidiate goals that lead to the DOOM video game. The first one is to create a quadrilateral geometry pipeline with a space partitioning algorithm that will create a wireframe based on a simple map of the world.<br>
<br>
The main part of the geometry engine will be implamented in a small chip (less than 1000 flipflops) fabed with TSMC's 180nm node, which is a part of the TU Delft EE EPO-3 project. The rest of the features (for example VGA based Rendering Output Unit) will go to the FPGA designed to extend the IO capabilities of the chip and take any features that won't fit in the ASIC. <br>

## Documentation
Every component should have a block diagram, flow chart and a description in <a href="https://github.com/Team111111111111/DOOMic/wiki"> the wiki </a> that explains its operation.<br>

## Tools used for the documentation
Draw.io<br>
Text editor<br>

## Development toolchain
<ol>
<li> VHDL description - preffered text editor (VIM, VSCode, Notepad); </li>
<li> VHDL simulation  - Questasim, GHDL; </li>
<li> VHDL synthesis   - Xilinx ISE for testing; Quartus for deployment; </li>
<li> Timing analysis  - Arjan's PHD thing; </li>
<li> Routing and implementation - GoWithTheFLow; </li>
</ol>

## Guidlines for pushing the code
<ul>
<li> Don't use capital letters in the names of the files. </li>
<li> Don't use white characters in the names of the files. </li>
<li> Every component should have a separate file.</li> 
<li> Use standard FSM structure with synchronous and asynchronous process if possible.</li> 
<li> Write at least some simple coments that expalin what's going on in the code.</li> 
<li> Use only .vhdl exentsion.</li> 
<li> Put everything in your branch in a folder that has the same name as your branch.</li>
<li> Subscribe to LinusTechTips </li>
<li> At the end everything in your branch should be connected with one top entity, you can have other top-entity-like-things in between, but at the end those are also connected to the top entity. </li>
<li> Eventually every file should have a commented out header section with names of the original autors, title of the project and name of the subgroup, date, and one line of what the code is; template soon in the wiki </li>
<li> Don't upload garbage; only files that has actuall vhdl code are allowed; </li>
</ul>
