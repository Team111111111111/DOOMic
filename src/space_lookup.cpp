#include <bits/stdc++.h>

int main () {

	int set		 = 0;
	int vertex	 = 0;
	int line_pointer = 0;
	int x_pointer	 = 0;
	int y_pointer	 = 0;
	int ix		 = 0;
	int iy		 = 0;
	int ia		 = 0;
	int iA		 = 0;

	std::string line = "";
	char x[100];
	char y[100];
	char a[100];
	char A[100];

	std::string ifilename 	= "../verticies.csv";
	std::string ofilename = "./space.vhdl";



	std::ifstream verticies (ifilename);
	std::ofstream lov (ofilename);			//short for the list of verticies

	if (!verticies.is_open() || !lov.is_open()) {
		std::cout << "File could not be open!" << std::endl;

		verticies.close();
		lov.close();

		return -1;
	}


	while (getline(verticies, line)) {
		if (line.length() <= 4) {

			if (vertex != 0) {
				/* Checking if the end of the list is supposed to point to the
				 * new set or somwhere else */
				lov << "\tif (rdy = '1') then" << std::endl;
				lov << "\t\tnew_state <= EOF;" << std::endl; 
				lov << "\telse" << std::endl;
				lov << "\t\tnew_state <= vert" << set << "_" << vertex - 1 << "_y;" << std::endl;
				lov << "\tend if;" << std::endl << std::endl;
			}


			/* Outputing the first angle for the set of vertices (the player angle) */
			std::size_t lengthA = line.copy(A, line.length(), 0);
			A[lengthA] = '\0';

			std::cout << iA << std::endl;

			iA = atoi(A) + 45;

			std::cout << iA << std::endl;

			if (iA >= 360) {
				iA = iA - 360;

			} else if (iA < 0) {
				iA = iA + 360;

			}

			std::cout << iA << std::endl;

			iA = iA * 63 / 360;
			std::bitset<14> biA(iA); 
		
			std::cout << iA << std::endl;
			std::cout << "--------" << std::endl;

			/* Checking if the a state is there for the first time, then it's state 0_0 otherwise x_0 */
			if ((set == 0) && (vertex == 0)) {
				lov << "when vert" << set << "_" << vertex << "_a_0 =>" << std::endl;
				lov << "\tserial_bus <= \"00000000000000\";" << std::endl;
				lov << "\tnew_pointer <= pointer;" << std::endl;
				lov << "\teof_flag <= '0';" << std::endl;
				lov << std::endl;
				lov << "\tnew_state <= vert" << set << "_" << vertex << "_a;" << std::endl;
				lov << std::endl;

				lov << "when vert" << set << "_" << vertex << "_a =>" << std::endl;
				lov << "\t-- bus output in decimal: " << iA << std::endl;
				lov << "\tserial_bus <= \"" << biA << "\";" << std::endl;
				lov << "\tnew_pointer <= pointer;" << std::endl;
				lov << "\teof_flag <= '0';" << std::endl;
				lov << std::endl;
				lov << "\tnew_state <= vert" << set << "_" << vertex << "_x_0;" << std::endl;
				lov << std::endl;
				
			} else {
				set++;
				vertex = 0;

				lov << "when vert" << set << "_" << vertex << "_a_0 =>" << std::endl;
				lov << "\tserial_bus <= \"00000000000000\";" << std::endl;
				lov << "\tnew_pointer <= pointer;" << std::endl;
				lov << "\teof_flag <= '0';" << std::endl;
				lov << std::endl;
				lov << "\tnew_state <= vert" << set << "_" << vertex << "_a;" << std::endl;
				lov << std::endl;

				lov << "when vert" << set << "_" << vertex << "_a =>" << std::endl;
				lov << "\t-- bus output in decimal: " << iA << std::endl;
				lov << "\tserial_bus <= \"" << biA << "\";" << std::endl;
				lov << "\tnew_pointer <= pointer;" << std::endl;
				lov << "\teof_flag <= '0';" << std::endl;
				lov << std::endl;
				lov << "\tnew_state <= vert" << set << "_" << vertex << "_x_0;" << std::endl;
				lov << std::endl;

			}
                } else {

			/* If the end of the list is still pointing to a new vertex
			 * within the set then output this */
			if (vertex != 0) {
				lov << "\tif (rdy = '1') then" << std::endl;
				lov << "\t\tnew_state <= vert" << set << "_" << vertex << "_x_0;" << std::endl;
				lov << "\telse" << std::endl;
				lov << "\t\tnew_state <= vert" << set << "_" << vertex - 1 << "_y;" << std::endl;
				lov << "\tend if;" << std::endl << std::endl;
			}



			/****** This section splits the line into x, y, and angle ******/
			// This loop just finds the position of the first ";"
			for (line_pointer = 0; line[line_pointer] != ';'; line_pointer++) {}

			std::size_t lengthx = line.copy(x, line_pointer, 0);
			x[lengthx] = '\0';
			x_pointer = line_pointer;

			// This find position of the 2nd ";"
			for (line_pointer++; line[line_pointer] != ';'; line_pointer++) {}

			x_pointer++;
			std::size_t lengthy = line.copy(y, line_pointer - x_pointer, x_pointer);
			y[lengthy] = '\0';
			y_pointer = line_pointer;

			// And this finds the position of the last ";" that matter thus the one for the angle
			for (line_pointer++; line[line_pointer] != ';'; line_pointer++) {}

			y_pointer++;
			std::size_t lengtha = line.copy(a, line_pointer - y_pointer, y_pointer);
			a[lengtha] = '\0';
			



			/******* Convert the x, y, angle strings into integers *******/
			ix = atoi(x) + 1;
			iy = atoi(y) + 1;
			ia = atoi(a) + 45;

			std::cout << x << std::endl;
			std::cout << y << std::endl;
			std::cout << a << std::endl;
			std::cout << std::endl;

			std::bitset<14> bix(ix);
			std::bitset<14> biy(iy);
			std::bitset<14> bia(ia);

			


			/******* Output the x, y, angle in the vhdl code as the signal ******/
			
			// This is the section for outputing the a state
			/*
			lov << "when vert" << set << "_" << vertex << "_a =>" << std::endl;
			lov << "\t-- bus output in decimal: " << ia << std::endl;
			lov << "\tserial_bus <= \"" << bia << "\";" << std::endl;
			lov << "\tnew_pointer <= pointer;" << std::endl;
			lov << std::endl;
			lov << "\tif (rdy = '1') then" << std::endl;
			lov << "\t\tnew_state <= vert" << set << "_" << vertex << "_x;" << std::endl;
			lov << "\telse" << std::endl;
			lov << "\t\tnew_state <= vert" << set << "_" << vertex << "_a;" << std::endl;
			lov << "\tend if;" << std::endl << std::endl;
			*/

			// This is the section for outputing the x state
			lov << "when vert" << set << "_" << vertex << "_x_0 =>" << std::endl;
			lov << "\tserial_bus <= \"00000000000000\";" << std::endl;
			lov << "\tnew_pointer <= pointer;" << std::endl;
			lov << "\teof_flag <= '0';" << std::endl;
			lov << std::endl;
			lov << "\tnew_state <= vert" << set << "_" << vertex << "_x;" << std::endl;
			lov << std::endl;

			lov << "when vert" << set << "_" << vertex << "_x =>" << std::endl;
			lov << "\t-- bus output in decimal: " << ix << std::endl;
			lov << "\tserial_bus <= \"" << bix <<  "\";" << std::endl;
			lov << "\tnew_pointer <= pointer;" << std::endl;
			lov << "\teof_flag <= '0';" << std::endl;
			lov << std::endl;
			lov << "\tnew_state <= vert" << set << "_" << vertex << "_y_0;" << std::endl;
			lov << std::endl;

			// This is the section for outputing the y state
			// 	without the last part since that is done at the beggining of this 
			// 	section of code since it depends on the next state (if it's EOF)
			lov << "when vert" << set << "_" << vertex << "_y_0 =>" << std::endl;
			lov << "\t-- bus output in decimal: " << iy << std::endl;
			lov << "\tserial_bus <= \"" << biy << "\";" << std::endl;
			lov << "\tnew_pointer <= pointer;" << std::endl;
			lov << "\teof_flag <= '0';" << std::endl;
			lov << std::endl;
			lov << "\tnew_state <= vert" << set << "_" << vertex << "_y;" << std::endl;
			lov << std::endl;

			lov << "when vert" << set << "_" << vertex << "_y =>" << std::endl;
			lov << "\tserial_bus <= \"00000000000000\";" << std::endl;
			lov << "\tnew_pointer <= pointer;" << std::endl;
			lov << "\teof_flag <= '0';" << std::endl;
			lov << std::endl;
			

			line_pointer 	 = 0;
			x_pointer	 = 0;
			y_pointer	 = 0;
			ix		 = 0;
			iy		 = 0;
			ia		 = 0;

			vertex++;
                }

	}
	
	verticies.close();
	lov.close();



	return 0;
}
