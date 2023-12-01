#include <bits/stdc++.h>

int main () {

	int i = 0;
	int j = 0;

        std::string line        = "";
        std::string ifilename   = "../verticies.csv";

        std::ifstream verticies (ifilename);

        if (!verticies.is_open()) {
                std::cout << "File could not be open, f you!" << std::endl;

                return -1;
        }



        while (getline(verticies, line)) {

		if (line.length() <= 4) {
			i++;
			j = 0;

		} else { 
			std::cout << "vert" << i << "_" << j << "_a, "
				  << "vert" << i << "_" << j << "_x, " 
				  << "vert" << i << "_" << j << "_y, " ;

			std::cout << std::endl;

			j++;
		}
        }

        verticies.close();



	return 0; 
}
