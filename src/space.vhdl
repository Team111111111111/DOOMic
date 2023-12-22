when vert0_0_a =>
	-- bus output in decimal: 55
	serial_bus <= "00000000110111";
	new_pointer <= pointer;

	new_state <= vert0_0_x;

when vert0_0_x =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	new_state <= vert0_0_y;

when vert0_0_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_1_x;
	else
		new_state <= vert0_0_y;
	end if;

when vert0_1_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert0_1_y;

when vert0_1_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_2_x;
	else
		new_state <= vert0_1_y;
	end if;

when vert0_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert0_2_y;

when vert0_2_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_3_x;
	else
		new_state <= vert0_2_y;
	end if;

when vert0_3_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert0_3_y;

when vert0_3_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_4_x;
	else
		new_state <= vert0_3_y;
	end if;

when vert0_4_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert0_4_y;

when vert0_4_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_5_x;
	else
		new_state <= vert0_4_y;
	end if;

when vert0_5_x =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	new_state <= vert0_5_y;

when vert0_5_y =>
	-- bus output in decimal: 701
	serial_bus <= "00001010111101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_6_x;
	else
		new_state <= vert0_5_y;
	end if;

when vert0_6_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert0_6_y;

when vert0_6_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert0_6_y;
	end if;

when vert1_0_a =>
	-- bus output in decimal: 56
	serial_bus <= "00000000111000";
	new_pointer <= pointer;

	new_state <= vert1_0_x;

when vert1_0_x =>
	-- bus output in decimal: 230
	serial_bus <= "00000011100110";
	new_pointer <= pointer;

	new_state <= vert1_0_y;

when vert1_0_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_1_x;
	else
		new_state <= vert1_0_y;
	end if;

when vert1_1_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert1_1_y;

when vert1_1_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_2_x;
	else
		new_state <= vert1_1_y;
	end if;

when vert1_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert1_2_y;

when vert1_2_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_3_x;
	else
		new_state <= vert1_2_y;
	end if;

when vert1_3_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert1_3_y;

when vert1_3_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_4_x;
	else
		new_state <= vert1_3_y;
	end if;

when vert1_4_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert1_4_y;

when vert1_4_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_5_x;
	else
		new_state <= vert1_4_y;
	end if;

when vert1_5_x =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	new_state <= vert1_5_y;

when vert1_5_y =>
	-- bus output in decimal: 701
	serial_bus <= "00001010111101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_6_x;
	else
		new_state <= vert1_5_y;
	end if;

when vert1_6_x =>
	-- bus output in decimal: 764
	serial_bus <= "00001011111100";
	new_pointer <= pointer;

	new_state <= vert1_6_y;

when vert1_6_y =>
	-- bus output in decimal: 682
	serial_bus <= "00001010101010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert1_6_y;
	end if;

when vert2_0_a =>
	-- bus output in decimal: 58
	serial_bus <= "00000000111010";
	new_pointer <= pointer;

	new_state <= vert2_0_x;

when vert2_0_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert2_0_y;

when vert2_0_y =>
	-- bus output in decimal: 875
	serial_bus <= "00001101101011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_1_x;
	else
		new_state <= vert2_0_y;
	end if;

when vert2_1_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert2_1_y;

when vert2_1_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_2_x;
	else
		new_state <= vert2_1_y;
	end if;

when vert2_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert2_2_y;

when vert2_2_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_3_x;
	else
		new_state <= vert2_2_y;
	end if;

when vert2_3_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert2_3_y;

when vert2_3_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_4_x;
	else
		new_state <= vert2_3_y;
	end if;

when vert2_4_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert2_4_y;

when vert2_4_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_5_x;
	else
		new_state <= vert2_4_y;
	end if;

when vert2_5_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert2_5_y;

when vert2_5_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_6_x;
	else
		new_state <= vert2_5_y;
	end if;

when vert2_6_x =>
	-- bus output in decimal: 706
	serial_bus <= "00001011000010";
	new_pointer <= pointer;

	new_state <= vert2_6_y;

when vert2_6_y =>
	-- bus output in decimal: 748
	serial_bus <= "00001011101100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert2_6_y;
	end if;

when vert3_0_a =>
	-- bus output in decimal: 60
	serial_bus <= "00000000111100";
	new_pointer <= pointer;

	new_state <= vert3_0_x;

when vert3_0_x =>
	-- bus output in decimal: 185
	serial_bus <= "00000010111001";
	new_pointer <= pointer;

	new_state <= vert3_0_y;

when vert3_0_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_1_x;
	else
		new_state <= vert3_0_y;
	end if;

when vert3_1_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert3_1_y;

when vert3_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_2_x;
	else
		new_state <= vert3_1_y;
	end if;

when vert3_2_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert3_2_y;

when vert3_2_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_3_x;
	else
		new_state <= vert3_2_y;
	end if;

when vert3_3_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert3_3_y;

when vert3_3_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_4_x;
	else
		new_state <= vert3_3_y;
	end if;

when vert3_4_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert3_4_y;

when vert3_4_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_5_x;
	else
		new_state <= vert3_4_y;
	end if;

when vert3_5_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert3_5_y;

when vert3_5_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_6_x;
	else
		new_state <= vert3_5_y;
	end if;

when vert3_6_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert3_6_y;

when vert3_6_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_7_x;
	else
		new_state <= vert3_6_y;
	end if;

when vert3_7_x =>
	-- bus output in decimal: 625
	serial_bus <= "00001001110001";
	new_pointer <= pointer;

	new_state <= vert3_7_y;

when vert3_7_y =>
	-- bus output in decimal: 788
	serial_bus <= "00001100010100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert3_7_y;
	end if;

when vert4_0_a =>
	-- bus output in decimal: 62
	serial_bus <= "00000000111110";
	new_pointer <= pointer;

	new_state <= vert4_0_x;

when vert4_0_x =>
	-- bus output in decimal: 133
	serial_bus <= "00000010000101";
	new_pointer <= pointer;

	new_state <= vert4_0_y;

when vert4_0_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_1_x;
	else
		new_state <= vert4_0_y;
	end if;

when vert4_1_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert4_1_y;

when vert4_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_2_x;
	else
		new_state <= vert4_1_y;
	end if;

when vert4_2_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert4_2_y;

when vert4_2_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_3_x;
	else
		new_state <= vert4_2_y;
	end if;

when vert4_3_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert4_3_y;

when vert4_3_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_4_x;
	else
		new_state <= vert4_3_y;
	end if;

when vert4_4_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert4_4_y;

when vert4_4_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_5_x;
	else
		new_state <= vert4_4_y;
	end if;

when vert4_5_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert4_5_y;

when vert4_5_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_6_x;
	else
		new_state <= vert4_5_y;
	end if;

when vert4_6_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert4_6_y;

when vert4_6_y =>
	-- bus output in decimal: 852
	serial_bus <= "00001101010100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert4_6_y;
	end if;

when vert5_0_a =>
	-- bus output in decimal: 0
	serial_bus <= "00000000000000";
	new_pointer <= pointer;

	new_state <= vert5_0_x;

when vert5_0_x =>
	-- bus output in decimal: 62
	serial_bus <= "00000000111110";
	new_pointer <= pointer;

	new_state <= vert5_0_y;

when vert5_0_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_1_x;
	else
		new_state <= vert5_0_y;
	end if;

when vert5_1_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert5_1_y;

when vert5_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_2_x;
	else
		new_state <= vert5_1_y;
	end if;

when vert5_2_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert5_2_y;

when vert5_2_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_3_x;
	else
		new_state <= vert5_2_y;
	end if;

when vert5_3_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert5_3_y;

when vert5_3_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_4_x;
	else
		new_state <= vert5_3_y;
	end if;

when vert5_4_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert5_4_y;

when vert5_4_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_5_x;
	else
		new_state <= vert5_4_y;
	end if;

when vert5_5_x =>
	-- bus output in decimal: 552
	serial_bus <= "00001000101000";
	new_pointer <= pointer;

	new_state <= vert5_5_y;

when vert5_5_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert5_5_y;
	end if;

when vert6_0_a =>
	-- bus output in decimal: 2
	serial_bus <= "00000000000010";
	new_pointer <= pointer;

	new_state <= vert6_0_x;

when vert6_0_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert6_0_y;

when vert6_0_y =>
	-- bus output in decimal: 774
	serial_bus <= "00001100000110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_1_x;
	else
		new_state <= vert6_0_y;
	end if;

when vert6_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert6_1_y;

when vert6_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_2_x;
	else
		new_state <= vert6_1_y;
	end if;

when vert6_2_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert6_2_y;

when vert6_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_3_x;
	else
		new_state <= vert6_2_y;
	end if;

when vert6_3_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert6_3_y;

when vert6_3_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_4_x;
	else
		new_state <= vert6_3_y;
	end if;

when vert6_4_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert6_4_y;

when vert6_4_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_5_x;
	else
		new_state <= vert6_4_y;
	end if;

when vert6_5_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert6_5_y;

when vert6_5_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_6_x;
	else
		new_state <= vert6_5_y;
	end if;

when vert6_6_x =>
	-- bus output in decimal: 474
	serial_bus <= "00000111011010";
	new_pointer <= pointer;

	new_state <= vert6_6_y;

when vert6_6_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert6_6_y;
	end if;

when vert7_0_a =>
	-- bus output in decimal: 4
	serial_bus <= "00000000000100";
	new_pointer <= pointer;

	new_state <= vert7_0_x;

when vert7_0_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert7_0_y;

when vert7_0_y =>
	-- bus output in decimal: 710
	serial_bus <= "00001011000110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_1_x;
	else
		new_state <= vert7_0_y;
	end if;

when vert7_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert7_1_y;

when vert7_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_2_x;
	else
		new_state <= vert7_1_y;
	end if;

when vert7_2_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert7_2_y;

when vert7_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_3_x;
	else
		new_state <= vert7_2_y;
	end if;

when vert7_3_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert7_3_y;

when vert7_3_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_4_x;
	else
		new_state <= vert7_3_y;
	end if;

when vert7_4_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert7_4_y;

when vert7_4_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_5_x;
	else
		new_state <= vert7_4_y;
	end if;

when vert7_5_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert7_5_y;

when vert7_5_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_6_x;
	else
		new_state <= vert7_5_y;
	end if;

when vert7_6_x =>
	-- bus output in decimal: 410
	serial_bus <= "00000110011010";
	new_pointer <= pointer;

	new_state <= vert7_6_y;

when vert7_6_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert7_6_y;
	end if;

when vert8_0_a =>
	-- bus output in decimal: 6
	serial_bus <= "00000000000110";
	new_pointer <= pointer;

	new_state <= vert8_0_x;

when vert8_0_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert8_0_y;

when vert8_0_y =>
	-- bus output in decimal: 653
	serial_bus <= "00001010001101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert8_1_x;
	else
		new_state <= vert8_0_y;
	end if;

when vert8_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert8_1_y;

when vert8_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert8_2_x;
	else
		new_state <= vert8_1_y;
	end if;

when vert8_2_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert8_2_y;

when vert8_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert8_3_x;
	else
		new_state <= vert8_2_y;
	end if;

when vert8_3_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert8_3_y;

when vert8_3_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert8_4_x;
	else
		new_state <= vert8_3_y;
	end if;

when vert8_4_x =>
	-- bus output in decimal: 371
	serial_bus <= "00000101110011";
	new_pointer <= pointer;

	new_state <= vert8_4_y;

when vert8_4_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert8_4_y;
	end if;

when vert9_0_a =>
	-- bus output in decimal: 7
	serial_bus <= "00000000000111";
	new_pointer <= pointer;

	new_state <= vert9_0_x;

when vert9_0_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert9_0_y;

when vert9_0_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert9_1_x;
	else
		new_state <= vert9_0_y;
	end if;

when vert9_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert9_1_y;

when vert9_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert9_2_x;
	else
		new_state <= vert9_1_y;
	end if;

when vert9_2_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert9_2_y;

when vert9_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert9_3_x;
	else
		new_state <= vert9_2_y;
	end if;

when vert9_3_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert9_3_y;

when vert9_3_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert9_4_x;
	else
		new_state <= vert9_3_y;
	end if;

when vert9_4_x =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	new_state <= vert9_4_y;

when vert9_4_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert9_4_y;
	end if;

when vert10_0_a =>
	-- bus output in decimal: 9
	serial_bus <= "00000000001001";
	new_pointer <= pointer;

	new_state <= vert10_0_x;

when vert10_0_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert10_0_y;

when vert10_0_y =>
	-- bus output in decimal: 548
	serial_bus <= "00001000100100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert10_1_x;
	else
		new_state <= vert10_0_y;
	end if;

when vert10_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert10_1_y;

when vert10_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert10_2_x;
	else
		new_state <= vert10_1_y;
	end if;

when vert10_2_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert10_2_y;

when vert10_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert10_3_x;
	else
		new_state <= vert10_2_y;
	end if;

when vert10_3_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert10_3_y;

when vert10_3_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert10_4_x;
	else
		new_state <= vert10_3_y;
	end if;

when vert10_4_x =>
	-- bus output in decimal: 230
	serial_bus <= "00000011100110";
	new_pointer <= pointer;

	new_state <= vert10_4_y;

when vert10_4_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert10_4_y;
	end if;

when vert11_0_a =>
	-- bus output in decimal: 11
	serial_bus <= "00000000001011";
	new_pointer <= pointer;

	new_state <= vert11_0_x;

when vert11_0_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert11_0_y;

when vert11_0_y =>
	-- bus output in decimal: 491
	serial_bus <= "00000111101011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert11_1_x;
	else
		new_state <= vert11_0_y;
	end if;

when vert11_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert11_1_y;

when vert11_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert11_2_x;
	else
		new_state <= vert11_1_y;
	end if;

when vert11_2_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert11_2_y;

when vert11_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert11_3_x;
	else
		new_state <= vert11_2_y;
	end if;

when vert11_3_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert11_3_y;

when vert11_3_y =>
	-- bus output in decimal: 875
	serial_bus <= "00001101101011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert11_3_y;
	end if;

when vert12_0_a =>
	-- bus output in decimal: 13
	serial_bus <= "00000000001101";
	new_pointer <= pointer;

	new_state <= vert12_0_x;

when vert12_0_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert12_0_y;

when vert12_0_y =>
	-- bus output in decimal: 427
	serial_bus <= "00000110101011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert12_1_x;
	else
		new_state <= vert12_0_y;
	end if;

when vert12_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert12_1_y;

when vert12_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert12_2_x;
	else
		new_state <= vert12_1_y;
	end if;

when vert12_2_x =>
	-- bus output in decimal: 185
	serial_bus <= "00000010111001";
	new_pointer <= pointer;

	new_state <= vert12_2_y;

when vert12_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert12_2_y;
	end if;

when vert13_0_a =>
	-- bus output in decimal: 14
	serial_bus <= "00000000001110";
	new_pointer <= pointer;

	new_state <= vert13_0_x;

when vert13_0_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert13_0_y;

when vert13_0_y =>
	-- bus output in decimal: 349
	serial_bus <= "00000101011101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert13_1_x;
	else
		new_state <= vert13_0_y;
	end if;

when vert13_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert13_1_y;

when vert13_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert13_2_x;
	else
		new_state <= vert13_1_y;
	end if;

when vert13_2_x =>
	-- bus output in decimal: 133
	serial_bus <= "00000010000101";
	new_pointer <= pointer;

	new_state <= vert13_2_y;

when vert13_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert13_2_y;
	end if;

when vert14_0_a =>
	-- bus output in decimal: 16
	serial_bus <= "00000000010000";
	new_pointer <= pointer;

	new_state <= vert14_0_x;

when vert14_0_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert14_0_y;

when vert14_0_y =>
	-- bus output in decimal: 243
	serial_bus <= "00000011110011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert14_1_x;
	else
		new_state <= vert14_0_y;
	end if;

when vert14_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert14_1_y;

when vert14_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert14_2_x;
	else
		new_state <= vert14_1_y;
	end if;

when vert14_2_x =>
	-- bus output in decimal: 62
	serial_bus <= "00000000111110";
	new_pointer <= pointer;

	new_state <= vert14_2_y;

when vert14_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert14_2_y;
	end if;

when vert15_0_a =>
	-- bus output in decimal: 18
	serial_bus <= "00000000010010";
	new_pointer <= pointer;

	new_state <= vert15_0_x;

when vert15_0_x =>
	-- bus output in decimal: 44
	serial_bus <= "00000000101100";
	new_pointer <= pointer;

	new_state <= vert15_0_y;

when vert15_0_y =>
	-- bus output in decimal: 157
	serial_bus <= "00000010011101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert15_1_x;
	else
		new_state <= vert15_0_y;
	end if;

when vert15_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert15_1_y;

when vert15_1_y =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert15_2_x;
	else
		new_state <= vert15_1_y;
	end if;

when vert15_2_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert15_2_y;

when vert15_2_y =>
	-- bus output in decimal: 774
	serial_bus <= "00001100000110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert15_2_y;
	end if;

when vert16_0_a =>
	-- bus output in decimal: 20
	serial_bus <= "00000000010100";
	new_pointer <= pointer;

	new_state <= vert16_0_x;

when vert16_0_x =>
	-- bus output in decimal: 114
	serial_bus <= "00000001110010";
	new_pointer <= pointer;

	new_state <= vert16_0_y;

when vert16_0_y =>
	-- bus output in decimal: 87
	serial_bus <= "00000001010111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert16_1_x;
	else
		new_state <= vert16_0_y;
	end if;

when vert16_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert16_1_y;

when vert16_1_y =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert16_2_x;
	else
		new_state <= vert16_1_y;
	end if;

when vert16_2_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert16_2_y;

when vert16_2_y =>
	-- bus output in decimal: 710
	serial_bus <= "00001011000110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert16_2_y;
	end if;

when vert17_0_a =>
	-- bus output in decimal: 21
	serial_bus <= "00000000010101";
	new_pointer <= pointer;

	new_state <= vert17_0_x;

when vert17_0_x =>
	-- bus output in decimal: 196
	serial_bus <= "00000011000100";
	new_pointer <= pointer;

	new_state <= vert17_0_y;

when vert17_0_y =>
	-- bus output in decimal: 5
	serial_bus <= "00000000000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert17_1_x;
	else
		new_state <= vert17_0_y;
	end if;

when vert17_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert17_1_y;

when vert17_1_y =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert17_2_x;
	else
		new_state <= vert17_1_y;
	end if;

when vert17_2_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert17_2_y;

when vert17_2_y =>
	-- bus output in decimal: 653
	serial_bus <= "00001010001101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert17_2_y;
	end if;

when vert18_0_a =>
	-- bus output in decimal: 23
	serial_bus <= "00000000010111";
	new_pointer <= pointer;

	new_state <= vert18_0_x;

when vert18_0_x =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	new_state <= vert18_0_y;

when vert18_0_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert18_1_x;
	else
		new_state <= vert18_0_y;
	end if;

when vert18_1_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert18_1_y;

when vert18_1_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert18_2_x;
	else
		new_state <= vert18_1_y;
	end if;

when vert18_2_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert18_2_y;

when vert18_2_y =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert18_3_x;
	else
		new_state <= vert18_2_y;
	end if;

when vert18_3_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert18_3_y;

when vert18_3_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert18_3_y;
	end if;

when vert19_0_a =>
	-- bus output in decimal: 25
	serial_bus <= "00000000011001";
	new_pointer <= pointer;

	new_state <= vert19_0_x;

when vert19_0_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert19_0_y;

when vert19_0_y =>
	-- bus output in decimal: 33
	serial_bus <= "00000000100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert19_1_x;
	else
		new_state <= vert19_0_y;
	end if;

when vert19_1_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert19_1_y;

when vert19_1_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert19_2_x;
	else
		new_state <= vert19_1_y;
	end if;

when vert19_2_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert19_2_y;

when vert19_2_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert19_3_x;
	else
		new_state <= vert19_2_y;
	end if;

when vert19_3_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert19_3_y;

when vert19_3_y =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert19_4_x;
	else
		new_state <= vert19_3_y;
	end if;

when vert19_4_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert19_4_y;

when vert19_4_y =>
	-- bus output in decimal: 548
	serial_bus <= "00001000100100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert19_4_y;
	end if;

when vert20_0_a =>
	-- bus output in decimal: 27
	serial_bus <= "00000000011011";
	new_pointer <= pointer;

	new_state <= vert20_0_x;

when vert20_0_x =>
	-- bus output in decimal: 410
	serial_bus <= "00000110011010";
	new_pointer <= pointer;

	new_state <= vert20_0_y;

when vert20_0_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_1_x;
	else
		new_state <= vert20_0_y;
	end if;

when vert20_1_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert20_1_y;

when vert20_1_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_2_x;
	else
		new_state <= vert20_1_y;
	end if;

when vert20_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert20_2_y;

when vert20_2_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_3_x;
	else
		new_state <= vert20_2_y;
	end if;

when vert20_3_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert20_3_y;

when vert20_3_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_4_x;
	else
		new_state <= vert20_3_y;
	end if;

when vert20_4_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert20_4_y;

when vert20_4_y =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_5_x;
	else
		new_state <= vert20_4_y;
	end if;

when vert20_5_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert20_5_y;

when vert20_5_y =>
	-- bus output in decimal: 491
	serial_bus <= "00000111101011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert20_5_y;
	end if;

when vert21_0_a =>
	-- bus output in decimal: 28
	serial_bus <= "00000000011100";
	new_pointer <= pointer;

	new_state <= vert21_0_x;

when vert21_0_x =>
	-- bus output in decimal: 474
	serial_bus <= "00000111011010";
	new_pointer <= pointer;

	new_state <= vert21_0_y;

when vert21_0_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_1_x;
	else
		new_state <= vert21_0_y;
	end if;

when vert21_1_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert21_1_y;

when vert21_1_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_2_x;
	else
		new_state <= vert21_1_y;
	end if;

when vert21_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert21_2_y;

when vert21_2_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_3_x;
	else
		new_state <= vert21_2_y;
	end if;

when vert21_3_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert21_3_y;

when vert21_3_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_4_x;
	else
		new_state <= vert21_3_y;
	end if;

when vert21_4_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert21_4_y;

when vert21_4_y =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_5_x;
	else
		new_state <= vert21_4_y;
	end if;

when vert21_5_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert21_5_y;

when vert21_5_y =>
	-- bus output in decimal: 427
	serial_bus <= "00000110101011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert21_5_y;
	end if;

when vert22_0_a =>
	-- bus output in decimal: 30
	serial_bus <= "00000000011110";
	new_pointer <= pointer;

	new_state <= vert22_0_x;

when vert22_0_x =>
	-- bus output in decimal: 552
	serial_bus <= "00001000101000";
	new_pointer <= pointer;

	new_state <= vert22_0_y;

when vert22_0_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_1_x;
	else
		new_state <= vert22_0_y;
	end if;

when vert22_1_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert22_1_y;

when vert22_1_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_2_x;
	else
		new_state <= vert22_1_y;
	end if;

when vert22_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert22_2_y;

when vert22_2_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_3_x;
	else
		new_state <= vert22_2_y;
	end if;

when vert22_3_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert22_3_y;

when vert22_3_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_4_x;
	else
		new_state <= vert22_3_y;
	end if;

when vert22_4_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert22_4_y;

when vert22_4_y =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_5_x;
	else
		new_state <= vert22_4_y;
	end if;

when vert22_5_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert22_5_y;

when vert22_5_y =>
	-- bus output in decimal: 349
	serial_bus <= "00000101011101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert22_5_y;
	end if;

when vert23_0_a =>
	-- bus output in decimal: 32
	serial_bus <= "00000000100000";
	new_pointer <= pointer;

	new_state <= vert23_0_x;

when vert23_0_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert23_0_y;

when vert23_0_y =>
	-- bus output in decimal: 349
	serial_bus <= "00000101011101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_1_x;
	else
		new_state <= vert23_0_y;
	end if;

when vert23_1_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert23_1_y;

when vert23_1_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_2_x;
	else
		new_state <= vert23_1_y;
	end if;

when vert23_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert23_2_y;

when vert23_2_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_3_x;
	else
		new_state <= vert23_2_y;
	end if;

when vert23_3_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert23_3_y;

when vert23_3_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_4_x;
	else
		new_state <= vert23_3_y;
	end if;

when vert23_4_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert23_4_y;

when vert23_4_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_5_x;
	else
		new_state <= vert23_4_y;
	end if;

when vert23_5_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert23_5_y;

when vert23_5_y =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_6_x;
	else
		new_state <= vert23_5_y;
	end if;

when vert23_6_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	new_state <= vert23_6_y;

when vert23_6_y =>
	-- bus output in decimal: 243
	serial_bus <= "00000011110011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert23_6_y;
	end if;

when vert24_0_a =>
	-- bus output in decimal: 34
	serial_bus <= "00000000100010";
	new_pointer <= pointer;

	new_state <= vert24_0_x;

when vert24_0_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert24_0_y;

when vert24_0_y =>
	-- bus output in decimal: 427
	serial_bus <= "00000110101011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_1_x;
	else
		new_state <= vert24_0_y;
	end if;

when vert24_1_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert24_1_y;

when vert24_1_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_2_x;
	else
		new_state <= vert24_1_y;
	end if;

when vert24_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert24_2_y;

when vert24_2_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_3_x;
	else
		new_state <= vert24_2_y;
	end if;

when vert24_3_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert24_3_y;

when vert24_3_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_4_x;
	else
		new_state <= vert24_3_y;
	end if;

when vert24_4_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert24_4_y;

when vert24_4_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_5_x;
	else
		new_state <= vert24_4_y;
	end if;

when vert24_5_x =>
	-- bus output in decimal: 44
	serial_bus <= "00000000101100";
	new_pointer <= pointer;

	new_state <= vert24_5_y;

when vert24_5_y =>
	-- bus output in decimal: 157
	serial_bus <= "00000010011101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert24_5_y;
	end if;

when vert25_0_a =>
	-- bus output in decimal: 35
	serial_bus <= "00000000100011";
	new_pointer <= pointer;

	new_state <= vert25_0_x;

when vert25_0_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert25_0_y;

when vert25_0_y =>
	-- bus output in decimal: 491
	serial_bus <= "00000111101011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_1_x;
	else
		new_state <= vert25_0_y;
	end if;

when vert25_1_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert25_1_y;

when vert25_1_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_2_x;
	else
		new_state <= vert25_1_y;
	end if;

when vert25_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert25_2_y;

when vert25_2_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_3_x;
	else
		new_state <= vert25_2_y;
	end if;

when vert25_3_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert25_3_y;

when vert25_3_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_4_x;
	else
		new_state <= vert25_3_y;
	end if;

when vert25_4_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert25_4_y;

when vert25_4_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_5_x;
	else
		new_state <= vert25_4_y;
	end if;

when vert25_5_x =>
	-- bus output in decimal: 114
	serial_bus <= "00000001110010";
	new_pointer <= pointer;

	new_state <= vert25_5_y;

when vert25_5_y =>
	-- bus output in decimal: 87
	serial_bus <= "00000001010111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert25_5_y;
	end if;

when vert26_0_a =>
	-- bus output in decimal: 37
	serial_bus <= "00000000100101";
	new_pointer <= pointer;

	new_state <= vert26_0_x;

when vert26_0_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert26_0_y;

when vert26_0_y =>
	-- bus output in decimal: 548
	serial_bus <= "00001000100100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_1_x;
	else
		new_state <= vert26_0_y;
	end if;

when vert26_1_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert26_1_y;

when vert26_1_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_2_x;
	else
		new_state <= vert26_1_y;
	end if;

when vert26_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert26_2_y;

when vert26_2_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_3_x;
	else
		new_state <= vert26_2_y;
	end if;

when vert26_3_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert26_3_y;

when vert26_3_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_4_x;
	else
		new_state <= vert26_3_y;
	end if;

when vert26_4_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	new_state <= vert26_4_y;

when vert26_4_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_5_x;
	else
		new_state <= vert26_4_y;
	end if;

when vert26_5_x =>
	-- bus output in decimal: 196
	serial_bus <= "00000011000100";
	new_pointer <= pointer;

	new_state <= vert26_5_y;

when vert26_5_y =>
	-- bus output in decimal: 5
	serial_bus <= "00000000000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert26_5_y;
	end if;

when vert27_0_a =>
	-- bus output in decimal: 39
	serial_bus <= "00000000100111";
	new_pointer <= pointer;

	new_state <= vert27_0_x;

when vert27_0_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert27_0_y;

when vert27_0_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert27_1_x;
	else
		new_state <= vert27_0_y;
	end if;

when vert27_1_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert27_1_y;

when vert27_1_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert27_2_x;
	else
		new_state <= vert27_1_y;
	end if;

when vert27_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert27_2_y;

when vert27_2_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert27_3_x;
	else
		new_state <= vert27_2_y;
	end if;

when vert27_3_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert27_3_y;

when vert27_3_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert27_4_x;
	else
		new_state <= vert27_3_y;
	end if;

when vert27_4_x =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	new_state <= vert27_4_y;

when vert27_4_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert27_4_y;
	end if;

when vert28_0_a =>
	-- bus output in decimal: 41
	serial_bus <= "00000000101001";
	new_pointer <= pointer;

	new_state <= vert28_0_x;

when vert28_0_x =>
	-- bus output in decimal: 764
	serial_bus <= "00001011111100";
	new_pointer <= pointer;

	new_state <= vert28_0_y;

when vert28_0_y =>
	-- bus output in decimal: 682
	serial_bus <= "00001010101010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert28_1_x;
	else
		new_state <= vert28_0_y;
	end if;

when vert28_1_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert28_1_y;

when vert28_1_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert28_2_x;
	else
		new_state <= vert28_1_y;
	end if;

when vert28_2_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert28_2_y;

when vert28_2_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert28_3_x;
	else
		new_state <= vert28_2_y;
	end if;

when vert28_3_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert28_3_y;

when vert28_3_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert28_4_x;
	else
		new_state <= vert28_3_y;
	end if;

when vert28_4_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert28_4_y;

when vert28_4_y =>
	-- bus output in decimal: 33
	serial_bus <= "00000000100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert28_4_y;
	end if;

when vert29_0_a =>
	-- bus output in decimal: 42
	serial_bus <= "00000000101010";
	new_pointer <= pointer;

	new_state <= vert29_0_x;

when vert29_0_x =>
	-- bus output in decimal: 706
	serial_bus <= "00001011000010";
	new_pointer <= pointer;

	new_state <= vert29_0_y;

when vert29_0_y =>
	-- bus output in decimal: 748
	serial_bus <= "00001011101100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert29_1_x;
	else
		new_state <= vert29_0_y;
	end if;

when vert29_1_x =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	new_state <= vert29_1_y;

when vert29_1_y =>
	-- bus output in decimal: 701
	serial_bus <= "00001010111101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert29_2_x;
	else
		new_state <= vert29_1_y;
	end if;

when vert29_2_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert29_2_y;

when vert29_2_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert29_3_x;
	else
		new_state <= vert29_2_y;
	end if;

when vert29_3_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert29_3_y;

when vert29_3_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert29_4_x;
	else
		new_state <= vert29_3_y;
	end if;

when vert29_4_x =>
	-- bus output in decimal: 410
	serial_bus <= "00000110011010";
	new_pointer <= pointer;

	new_state <= vert29_4_y;

when vert29_4_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert29_4_y;
	end if;

when vert30_0_a =>
	-- bus output in decimal: 44
	serial_bus <= "00000000101100";
	new_pointer <= pointer;

	new_state <= vert30_0_x;

when vert30_0_x =>
	-- bus output in decimal: 625
	serial_bus <= "00001001110001";
	new_pointer <= pointer;

	new_state <= vert30_0_y;

when vert30_0_y =>
	-- bus output in decimal: 788
	serial_bus <= "00001100010100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert30_1_x;
	else
		new_state <= vert30_0_y;
	end if;

when vert30_1_x =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	new_state <= vert30_1_y;

when vert30_1_y =>
	-- bus output in decimal: 701
	serial_bus <= "00001010111101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert30_2_x;
	else
		new_state <= vert30_1_y;
	end if;

when vert30_2_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert30_2_y;

when vert30_2_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert30_3_x;
	else
		new_state <= vert30_2_y;
	end if;

when vert30_3_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert30_3_y;

when vert30_3_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert30_4_x;
	else
		new_state <= vert30_3_y;
	end if;

when vert30_4_x =>
	-- bus output in decimal: 474
	serial_bus <= "00000111011010";
	new_pointer <= pointer;

	new_state <= vert30_4_y;

when vert30_4_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert30_4_y;
	end if;

when vert31_0_a =>
	-- bus output in decimal: 46
	serial_bus <= "00000000101110";
	new_pointer <= pointer;

	new_state <= vert31_0_x;

when vert31_0_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert31_0_y;

when vert31_0_y =>
	-- bus output in decimal: 852
	serial_bus <= "00001101010100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_1_x;
	else
		new_state <= vert31_0_y;
	end if;

when vert31_1_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert31_1_y;

when vert31_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_2_x;
	else
		new_state <= vert31_1_y;
	end if;

when vert31_2_x =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	new_state <= vert31_2_y;

when vert31_2_y =>
	-- bus output in decimal: 701
	serial_bus <= "00001010111101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_3_x;
	else
		new_state <= vert31_2_y;
	end if;

when vert31_3_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert31_3_y;

when vert31_3_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_4_x;
	else
		new_state <= vert31_3_y;
	end if;

when vert31_4_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert31_4_y;

when vert31_4_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_5_x;
	else
		new_state <= vert31_4_y;
	end if;

when vert31_5_x =>
	-- bus output in decimal: 552
	serial_bus <= "00001000101000";
	new_pointer <= pointer;

	new_state <= vert31_5_y;

when vert31_5_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert31_5_y;
	end if;

when vert32_0_a =>
	-- bus output in decimal: 48
	serial_bus <= "00000000110000";
	new_pointer <= pointer;

	new_state <= vert32_0_x;

when vert32_0_x =>
	-- bus output in decimal: 552
	serial_bus <= "00001000101000";
	new_pointer <= pointer;

	new_state <= vert32_0_y;

when vert32_0_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_1_x;
	else
		new_state <= vert32_0_y;
	end if;

when vert32_1_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert32_1_y;

when vert32_1_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_2_x;
	else
		new_state <= vert32_1_y;
	end if;

when vert32_2_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert32_2_y;

when vert32_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_3_x;
	else
		new_state <= vert32_2_y;
	end if;

when vert32_3_x =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	new_state <= vert32_3_y;

when vert32_3_y =>
	-- bus output in decimal: 701
	serial_bus <= "00001010111101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_4_x;
	else
		new_state <= vert32_3_y;
	end if;

when vert32_4_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert32_4_y;

when vert32_4_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_5_x;
	else
		new_state <= vert32_4_y;
	end if;

when vert32_5_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert32_5_y;

when vert32_5_y =>
	-- bus output in decimal: 349
	serial_bus <= "00000101011101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert32_5_y;
	end if;

when vert33_0_a =>
	-- bus output in decimal: 49
	serial_bus <= "00000000110001";
	new_pointer <= pointer;

	new_state <= vert33_0_x;

when vert33_0_x =>
	-- bus output in decimal: 474
	serial_bus <= "00000111011010";
	new_pointer <= pointer;

	new_state <= vert33_0_y;

when vert33_0_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_1_x;
	else
		new_state <= vert33_0_y;
	end if;

when vert33_1_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert33_1_y;

when vert33_1_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_2_x;
	else
		new_state <= vert33_1_y;
	end if;

when vert33_2_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert33_2_y;

when vert33_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_3_x;
	else
		new_state <= vert33_2_y;
	end if;

when vert33_3_x =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	new_state <= vert33_3_y;

when vert33_3_y =>
	-- bus output in decimal: 701
	serial_bus <= "00001010111101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_4_x;
	else
		new_state <= vert33_3_y;
	end if;

when vert33_4_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert33_4_y;

when vert33_4_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_5_x;
	else
		new_state <= vert33_4_y;
	end if;

when vert33_5_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert33_5_y;

when vert33_5_y =>
	-- bus output in decimal: 427
	serial_bus <= "00000110101011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert33_5_y;
	end if;

when vert34_0_a =>
	-- bus output in decimal: 51
	serial_bus <= "00000000110011";
	new_pointer <= pointer;

	new_state <= vert34_0_x;

when vert34_0_x =>
	-- bus output in decimal: 410
	serial_bus <= "00000110011010";
	new_pointer <= pointer;

	new_state <= vert34_0_y;

when vert34_0_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_1_x;
	else
		new_state <= vert34_0_y;
	end if;

when vert34_1_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert34_1_y;

when vert34_1_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_2_x;
	else
		new_state <= vert34_1_y;
	end if;

when vert34_2_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert34_2_y;

when vert34_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_3_x;
	else
		new_state <= vert34_2_y;
	end if;

when vert34_3_x =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	new_state <= vert34_3_y;

when vert34_3_y =>
	-- bus output in decimal: 701
	serial_bus <= "00001010111101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_4_x;
	else
		new_state <= vert34_3_y;
	end if;

when vert34_4_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert34_4_y;

when vert34_4_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_5_x;
	else
		new_state <= vert34_4_y;
	end if;

when vert34_5_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert34_5_y;

when vert34_5_y =>
	-- bus output in decimal: 491
	serial_bus <= "00000111101011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert34_5_y;
	end if;

when vert35_0_a =>
	-- bus output in decimal: 53
	serial_bus <= "00000000110101";
	new_pointer <= pointer;

	new_state <= vert35_0_x;

when vert35_0_x =>
	-- bus output in decimal: 371
	serial_bus <= "00000101110011";
	new_pointer <= pointer;

	new_state <= vert35_0_y;

when vert35_0_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_1_x;
	else
		new_state <= vert35_0_y;
	end if;

when vert35_1_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert35_1_y;

when vert35_1_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_2_x;
	else
		new_state <= vert35_1_y;
	end if;

when vert35_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	new_state <= vert35_2_y;

when vert35_2_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_3_x;
	else
		new_state <= vert35_2_y;
	end if;

when vert35_3_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert35_3_y;

when vert35_3_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_4_x;
	else
		new_state <= vert35_3_y;
	end if;

when vert35_4_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert35_4_y;

when vert35_4_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_5_x;
	else
		new_state <= vert35_4_y;
	end if;

when vert35_5_x =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	new_state <= vert35_5_y;

when vert35_5_y =>
	-- bus output in decimal: 701
	serial_bus <= "00001010111101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_6_x;
	else
		new_state <= vert35_5_y;
	end if;

when vert35_6_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert35_6_y;

when vert35_6_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_7_x;
	else
		new_state <= vert35_6_y;
	end if;

when vert35_7_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	new_state <= vert35_7_y;

when vert35_7_y =>
	-- bus output in decimal: 548
	serial_bus <= "00001000100100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert35_7_y;
	end if;

when vert36_0_a =>
	-- bus output in decimal: 55
	serial_bus <= "00000000110111";
	new_pointer <= pointer;

	new_state <= vert36_0_x;

