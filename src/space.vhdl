when vert0_0_a =>
	-- bus output in decimal: 135
	serial_bus <= "00000010000111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_0_x;
	else
		new_state <= vert0_0_a;
	end if;

when vert0_0_x =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_0_y;
	else
		new_state <= vert0_0_x;
	end if;

when vert0_0_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_1_a;
	else
		new_state <= vert0_0_y;
	end if;

when vert0_1_a =>
	-- bus output in decimal: 120
	serial_bus <= "00000001111000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_1_x;
	else
		new_state <= vert0_1_a;
	end if;

when vert0_1_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_1_y;
	else
		new_state <= vert0_1_x;
	end if;

when vert0_1_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_2_a;
	else
		new_state <= vert0_1_y;
	end if;

when vert0_2_a =>
	-- bus output in decimal: 116
	serial_bus <= "00000001110100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_2_x;
	else
		new_state <= vert0_2_a;
	end if;

when vert0_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_2_y;
	else
		new_state <= vert0_2_x;
	end if;

when vert0_2_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_3_a;
	else
		new_state <= vert0_2_y;
	end if;

when vert0_3_a =>
	-- bus output in decimal: 90
	serial_bus <= "00000001011010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_3_x;
	else
		new_state <= vert0_3_a;
	end if;

when vert0_3_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_3_y;
	else
		new_state <= vert0_3_x;
	end if;

when vert0_3_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_4_a;
	else
		new_state <= vert0_3_y;
	end if;

when vert0_4_a =>
	-- bus output in decimal: 78
	serial_bus <= "00000001001110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_4_x;
	else
		new_state <= vert0_4_a;
	end if;

when vert0_4_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_4_y;
	else
		new_state <= vert0_4_x;
	end if;

when vert0_4_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_5_a;
	else
		new_state <= vert0_4_y;
	end if;

when vert0_5_a =>
	-- bus output in decimal: 56
	serial_bus <= "00000000111000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_5_x;
	else
		new_state <= vert0_5_a;
	end if;

when vert0_5_x =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_5_y;
	else
		new_state <= vert0_5_x;
	end if;

when vert0_5_y =>
	-- bus output in decimal: 701
	serial_bus <= "00001010111101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_6_a;
	else
		new_state <= vert0_5_y;
	end if;

when vert0_6_a =>
	-- bus output in decimal: 45
	serial_bus <= "00000000101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_6_x;
	else
		new_state <= vert0_6_a;
	end if;

when vert0_6_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert0_6_y;
	else
		new_state <= vert0_6_x;
	end if;

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
	-- bus output in decimal: 145
	serial_bus <= "00000010010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_0_x;
	else
		new_state <= vert1_0_a;
	end if;

when vert1_0_x =>
	-- bus output in decimal: 230
	serial_bus <= "00000011100110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_0_y;
	else
		new_state <= vert1_0_x;
	end if;

when vert1_0_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_1_a;
	else
		new_state <= vert1_0_y;
	end if;

when vert1_1_a =>
	-- bus output in decimal: 120
	serial_bus <= "00000001111000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_1_x;
	else
		new_state <= vert1_1_a;
	end if;

when vert1_1_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_1_y;
	else
		new_state <= vert1_1_x;
	end if;

when vert1_1_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_2_a;
	else
		new_state <= vert1_1_y;
	end if;

when vert1_2_a =>
	-- bus output in decimal: 116
	serial_bus <= "00000001110100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_2_x;
	else
		new_state <= vert1_2_a;
	end if;

when vert1_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_2_y;
	else
		new_state <= vert1_2_x;
	end if;

when vert1_2_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_3_a;
	else
		new_state <= vert1_2_y;
	end if;

when vert1_3_a =>
	-- bus output in decimal: 90
	serial_bus <= "00000001011010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_3_x;
	else
		new_state <= vert1_3_a;
	end if;

when vert1_3_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_3_y;
	else
		new_state <= vert1_3_x;
	end if;

when vert1_3_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_4_a;
	else
		new_state <= vert1_3_y;
	end if;

when vert1_4_a =>
	-- bus output in decimal: 78
	serial_bus <= "00000001001110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_4_x;
	else
		new_state <= vert1_4_a;
	end if;

when vert1_4_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_4_y;
	else
		new_state <= vert1_4_x;
	end if;

when vert1_4_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_5_a;
	else
		new_state <= vert1_4_y;
	end if;

when vert1_5_a =>
	-- bus output in decimal: 56
	serial_bus <= "00000000111000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_5_x;
	else
		new_state <= vert1_5_a;
	end if;

when vert1_5_x =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_5_y;
	else
		new_state <= vert1_5_x;
	end if;

when vert1_5_y =>
	-- bus output in decimal: 701
	serial_bus <= "00001010111101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_6_a;
	else
		new_state <= vert1_5_y;
	end if;

when vert1_6_a =>
	-- bus output in decimal: 55
	serial_bus <= "00000000110111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_6_x;
	else
		new_state <= vert1_6_a;
	end if;

when vert1_6_x =>
	-- bus output in decimal: 764
	serial_bus <= "00001011111100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert1_6_y;
	else
		new_state <= vert1_6_x;
	end if;

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
	-- bus output in decimal: 155
	serial_bus <= "00000010011011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_0_x;
	else
		new_state <= vert2_0_a;
	end if;

when vert2_0_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_0_y;
	else
		new_state <= vert2_0_x;
	end if;

when vert2_0_y =>
	-- bus output in decimal: 875
	serial_bus <= "00001101101011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_1_a;
	else
		new_state <= vert2_0_y;
	end if;

when vert2_1_a =>
	-- bus output in decimal: 149
	serial_bus <= "00000010010101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_1_x;
	else
		new_state <= vert2_1_a;
	end if;

when vert2_1_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_1_y;
	else
		new_state <= vert2_1_x;
	end if;

when vert2_1_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_2_a;
	else
		new_state <= vert2_1_y;
	end if;

when vert2_2_a =>
	-- bus output in decimal: 120
	serial_bus <= "00000001111000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_2_x;
	else
		new_state <= vert2_2_a;
	end if;

when vert2_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_2_y;
	else
		new_state <= vert2_2_x;
	end if;

when vert2_2_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_3_a;
	else
		new_state <= vert2_2_y;
	end if;

when vert2_3_a =>
	-- bus output in decimal: 116
	serial_bus <= "00000001110100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_3_x;
	else
		new_state <= vert2_3_a;
	end if;

when vert2_3_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_3_y;
	else
		new_state <= vert2_3_x;
	end if;

when vert2_3_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_4_a;
	else
		new_state <= vert2_3_y;
	end if;

when vert2_4_a =>
	-- bus output in decimal: 90
	serial_bus <= "00000001011010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_4_x;
	else
		new_state <= vert2_4_a;
	end if;

when vert2_4_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_4_y;
	else
		new_state <= vert2_4_x;
	end if;

when vert2_4_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_5_a;
	else
		new_state <= vert2_4_y;
	end if;

when vert2_5_a =>
	-- bus output in decimal: 78
	serial_bus <= "00000001001110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_5_x;
	else
		new_state <= vert2_5_a;
	end if;

when vert2_5_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_5_y;
	else
		new_state <= vert2_5_x;
	end if;

when vert2_5_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_6_a;
	else
		new_state <= vert2_5_y;
	end if;

when vert2_6_a =>
	-- bus output in decimal: 65
	serial_bus <= "00000001000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_6_x;
	else
		new_state <= vert2_6_a;
	end if;

when vert2_6_x =>
	-- bus output in decimal: 706
	serial_bus <= "00001011000010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert2_6_y;
	else
		new_state <= vert2_6_x;
	end if;

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
	-- bus output in decimal: 165
	serial_bus <= "00000010100101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_0_x;
	else
		new_state <= vert3_0_a;
	end if;

when vert3_0_x =>
	-- bus output in decimal: 185
	serial_bus <= "00000010111001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_0_y;
	else
		new_state <= vert3_0_x;
	end if;

when vert3_0_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_1_a;
	else
		new_state <= vert3_0_y;
	end if;

when vert3_1_a =>
	-- bus output in decimal: 161
	serial_bus <= "00000010100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_1_x;
	else
		new_state <= vert3_1_a;
	end if;

when vert3_1_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_1_y;
	else
		new_state <= vert3_1_x;
	end if;

when vert3_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_2_a;
	else
		new_state <= vert3_1_y;
	end if;

when vert3_2_a =>
	-- bus output in decimal: 149
	serial_bus <= "00000010010101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_2_x;
	else
		new_state <= vert3_2_a;
	end if;

when vert3_2_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_2_y;
	else
		new_state <= vert3_2_x;
	end if;

when vert3_2_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_3_a;
	else
		new_state <= vert3_2_y;
	end if;

when vert3_3_a =>
	-- bus output in decimal: 120
	serial_bus <= "00000001111000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_3_x;
	else
		new_state <= vert3_3_a;
	end if;

when vert3_3_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_3_y;
	else
		new_state <= vert3_3_x;
	end if;

when vert3_3_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_4_a;
	else
		new_state <= vert3_3_y;
	end if;

when vert3_4_a =>
	-- bus output in decimal: 116
	serial_bus <= "00000001110100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_4_x;
	else
		new_state <= vert3_4_a;
	end if;

when vert3_4_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_4_y;
	else
		new_state <= vert3_4_x;
	end if;

when vert3_4_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_5_a;
	else
		new_state <= vert3_4_y;
	end if;

when vert3_5_a =>
	-- bus output in decimal: 90
	serial_bus <= "00000001011010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_5_x;
	else
		new_state <= vert3_5_a;
	end if;

when vert3_5_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_5_y;
	else
		new_state <= vert3_5_x;
	end if;

when vert3_5_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_6_a;
	else
		new_state <= vert3_5_y;
	end if;

when vert3_6_a =>
	-- bus output in decimal: 78
	serial_bus <= "00000001001110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_6_x;
	else
		new_state <= vert3_6_a;
	end if;

when vert3_6_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_6_y;
	else
		new_state <= vert3_6_x;
	end if;

when vert3_6_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_7_a;
	else
		new_state <= vert3_6_y;
	end if;

when vert3_7_a =>
	-- bus output in decimal: 75
	serial_bus <= "00000001001011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_7_x;
	else
		new_state <= vert3_7_a;
	end if;

when vert3_7_x =>
	-- bus output in decimal: 625
	serial_bus <= "00001001110001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert3_7_y;
	else
		new_state <= vert3_7_x;
	end if;

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
	-- bus output in decimal: 175
	serial_bus <= "00000010101111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_0_x;
	else
		new_state <= vert4_0_a;
	end if;

when vert4_0_x =>
	-- bus output in decimal: 133
	serial_bus <= "00000010000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_0_y;
	else
		new_state <= vert4_0_x;
	end if;

when vert4_0_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_1_a;
	else
		new_state <= vert4_0_y;
	end if;

when vert4_1_a =>
	-- bus output in decimal: 161
	serial_bus <= "00000010100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_1_x;
	else
		new_state <= vert4_1_a;
	end if;

when vert4_1_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_1_y;
	else
		new_state <= vert4_1_x;
	end if;

when vert4_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_2_a;
	else
		new_state <= vert4_1_y;
	end if;

when vert4_2_a =>
	-- bus output in decimal: 149
	serial_bus <= "00000010010101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_2_x;
	else
		new_state <= vert4_2_a;
	end if;

when vert4_2_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_2_y;
	else
		new_state <= vert4_2_x;
	end if;

when vert4_2_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_3_a;
	else
		new_state <= vert4_2_y;
	end if;

when vert4_3_a =>
	-- bus output in decimal: 120
	serial_bus <= "00000001111000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_3_x;
	else
		new_state <= vert4_3_a;
	end if;

when vert4_3_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_3_y;
	else
		new_state <= vert4_3_x;
	end if;

when vert4_3_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_4_a;
	else
		new_state <= vert4_3_y;
	end if;

when vert4_4_a =>
	-- bus output in decimal: 116
	serial_bus <= "00000001110100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_4_x;
	else
		new_state <= vert4_4_a;
	end if;

when vert4_4_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_4_y;
	else
		new_state <= vert4_4_x;
	end if;

when vert4_4_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_5_a;
	else
		new_state <= vert4_4_y;
	end if;

when vert4_5_a =>
	-- bus output in decimal: 90
	serial_bus <= "00000001011010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_5_x;
	else
		new_state <= vert4_5_a;
	end if;

when vert4_5_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_5_y;
	else
		new_state <= vert4_5_x;
	end if;

when vert4_5_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_6_a;
	else
		new_state <= vert4_5_y;
	end if;

when vert4_6_a =>
	-- bus output in decimal: 85
	serial_bus <= "00000001010101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_6_x;
	else
		new_state <= vert4_6_a;
	end if;

when vert4_6_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert4_6_y;
	else
		new_state <= vert4_6_x;
	end if;

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
	-- bus output in decimal: 185
	serial_bus <= "00000010111001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_0_x;
	else
		new_state <= vert5_0_a;
	end if;

when vert5_0_x =>
	-- bus output in decimal: 62
	serial_bus <= "00000000111110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_0_y;
	else
		new_state <= vert5_0_x;
	end if;

when vert5_0_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_1_a;
	else
		new_state <= vert5_0_y;
	end if;

when vert5_1_a =>
	-- bus output in decimal: 161
	serial_bus <= "00000010100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_1_x;
	else
		new_state <= vert5_1_a;
	end if;

when vert5_1_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_1_y;
	else
		new_state <= vert5_1_x;
	end if;

when vert5_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_2_a;
	else
		new_state <= vert5_1_y;
	end if;

when vert5_2_a =>
	-- bus output in decimal: 149
	serial_bus <= "00000010010101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_2_x;
	else
		new_state <= vert5_2_a;
	end if;

when vert5_2_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_2_y;
	else
		new_state <= vert5_2_x;
	end if;

when vert5_2_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_3_a;
	else
		new_state <= vert5_2_y;
	end if;

when vert5_3_a =>
	-- bus output in decimal: 120
	serial_bus <= "00000001111000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_3_x;
	else
		new_state <= vert5_3_a;
	end if;

when vert5_3_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_3_y;
	else
		new_state <= vert5_3_x;
	end if;

when vert5_3_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_4_a;
	else
		new_state <= vert5_3_y;
	end if;

when vert5_4_a =>
	-- bus output in decimal: 116
	serial_bus <= "00000001110100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_4_x;
	else
		new_state <= vert5_4_a;
	end if;

when vert5_4_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_4_y;
	else
		new_state <= vert5_4_x;
	end if;

when vert5_4_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_5_a;
	else
		new_state <= vert5_4_y;
	end if;

when vert5_5_a =>
	-- bus output in decimal: 95
	serial_bus <= "00000001011111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_5_x;
	else
		new_state <= vert5_5_a;
	end if;

when vert5_5_x =>
	-- bus output in decimal: 552
	serial_bus <= "00001000101000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert5_5_y;
	else
		new_state <= vert5_5_x;
	end if;

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
	-- bus output in decimal: 195
	serial_bus <= "00000011000011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_0_x;
	else
		new_state <= vert6_0_a;
	end if;

when vert6_0_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_0_y;
	else
		new_state <= vert6_0_x;
	end if;

when vert6_0_y =>
	-- bus output in decimal: 774
	serial_bus <= "00001100000110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_1_a;
	else
		new_state <= vert6_0_y;
	end if;

when vert6_1_a =>
	-- bus output in decimal: 191
	serial_bus <= "00000010111111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_1_x;
	else
		new_state <= vert6_1_a;
	end if;

when vert6_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_1_y;
	else
		new_state <= vert6_1_x;
	end if;

when vert6_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_2_a;
	else
		new_state <= vert6_1_y;
	end if;

when vert6_2_a =>
	-- bus output in decimal: 161
	serial_bus <= "00000010100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_2_x;
	else
		new_state <= vert6_2_a;
	end if;

when vert6_2_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_2_y;
	else
		new_state <= vert6_2_x;
	end if;

when vert6_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_3_a;
	else
		new_state <= vert6_2_y;
	end if;

when vert6_3_a =>
	-- bus output in decimal: 149
	serial_bus <= "00000010010101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_3_x;
	else
		new_state <= vert6_3_a;
	end if;

when vert6_3_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_3_y;
	else
		new_state <= vert6_3_x;
	end if;

when vert6_3_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_4_a;
	else
		new_state <= vert6_3_y;
	end if;

when vert6_4_a =>
	-- bus output in decimal: 120
	serial_bus <= "00000001111000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_4_x;
	else
		new_state <= vert6_4_a;
	end if;

when vert6_4_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_4_y;
	else
		new_state <= vert6_4_x;
	end if;

when vert6_4_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_5_a;
	else
		new_state <= vert6_4_y;
	end if;

when vert6_5_a =>
	-- bus output in decimal: 116
	serial_bus <= "00000001110100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_5_x;
	else
		new_state <= vert6_5_a;
	end if;

when vert6_5_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_5_y;
	else
		new_state <= vert6_5_x;
	end if;

when vert6_5_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_6_a;
	else
		new_state <= vert6_5_y;
	end if;

when vert6_6_a =>
	-- bus output in decimal: 105
	serial_bus <= "00000001101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_6_x;
	else
		new_state <= vert6_6_a;
	end if;

when vert6_6_x =>
	-- bus output in decimal: 474
	serial_bus <= "00000111011010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert6_6_y;
	else
		new_state <= vert6_6_x;
	end if;

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
	-- bus output in decimal: 205
	serial_bus <= "00000011001101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_0_x;
	else
		new_state <= vert7_0_a;
	end if;

when vert7_0_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_0_y;
	else
		new_state <= vert7_0_x;
	end if;

when vert7_0_y =>
	-- bus output in decimal: 710
	serial_bus <= "00001011000110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_1_a;
	else
		new_state <= vert7_0_y;
	end if;

when vert7_1_a =>
	-- bus output in decimal: 191
	serial_bus <= "00000010111111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_1_x;
	else
		new_state <= vert7_1_a;
	end if;

when vert7_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_1_y;
	else
		new_state <= vert7_1_x;
	end if;

when vert7_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_2_a;
	else
		new_state <= vert7_1_y;
	end if;

when vert7_2_a =>
	-- bus output in decimal: 161
	serial_bus <= "00000010100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_2_x;
	else
		new_state <= vert7_2_a;
	end if;

when vert7_2_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_2_y;
	else
		new_state <= vert7_2_x;
	end if;

when vert7_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_3_a;
	else
		new_state <= vert7_2_y;
	end if;

when vert7_3_a =>
	-- bus output in decimal: 149
	serial_bus <= "00000010010101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_3_x;
	else
		new_state <= vert7_3_a;
	end if;

when vert7_3_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_3_y;
	else
		new_state <= vert7_3_x;
	end if;

when vert7_3_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_4_a;
	else
		new_state <= vert7_3_y;
	end if;

when vert7_4_a =>
	-- bus output in decimal: 120
	serial_bus <= "00000001111000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_4_x;
	else
		new_state <= vert7_4_a;
	end if;

when vert7_4_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_4_y;
	else
		new_state <= vert7_4_x;
	end if;

when vert7_4_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_5_a;
	else
		new_state <= vert7_4_y;
	end if;

when vert7_5_a =>
	-- bus output in decimal: 116
	serial_bus <= "00000001110100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_5_x;
	else
		new_state <= vert7_5_a;
	end if;

when vert7_5_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_5_y;
	else
		new_state <= vert7_5_x;
	end if;

when vert7_5_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_6_a;
	else
		new_state <= vert7_5_y;
	end if;

when vert7_6_a =>
	-- bus output in decimal: 115
	serial_bus <= "00000001110011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_6_x;
	else
		new_state <= vert7_6_a;
	end if;

when vert7_6_x =>
	-- bus output in decimal: 410
	serial_bus <= "00000110011010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert7_6_y;
	else
		new_state <= vert7_6_x;
	end if;

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
	-- bus output in decimal: 215
	serial_bus <= "00000011010111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert8_0_x;
	else
		new_state <= vert8_0_a;
	end if;

when vert8_0_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert8_0_y;
	else
		new_state <= vert8_0_x;
	end if;

when vert8_0_y =>
	-- bus output in decimal: 653
	serial_bus <= "00001010001101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert8_1_a;
	else
		new_state <= vert8_0_y;
	end if;

when vert8_1_a =>
	-- bus output in decimal: 191
	serial_bus <= "00000010111111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert8_1_x;
	else
		new_state <= vert8_1_a;
	end if;

when vert8_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert8_1_y;
	else
		new_state <= vert8_1_x;
	end if;

when vert8_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert8_2_a;
	else
		new_state <= vert8_1_y;
	end if;

when vert8_2_a =>
	-- bus output in decimal: 161
	serial_bus <= "00000010100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert8_2_x;
	else
		new_state <= vert8_2_a;
	end if;

when vert8_2_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert8_2_y;
	else
		new_state <= vert8_2_x;
	end if;

when vert8_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert8_3_a;
	else
		new_state <= vert8_2_y;
	end if;

when vert8_3_a =>
	-- bus output in decimal: 149
	serial_bus <= "00000010010101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert8_3_x;
	else
		new_state <= vert8_3_a;
	end if;

when vert8_3_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert8_3_y;
	else
		new_state <= vert8_3_x;
	end if;

when vert8_3_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert8_4_a;
	else
		new_state <= vert8_3_y;
	end if;

when vert8_4_a =>
	-- bus output in decimal: 125
	serial_bus <= "00000001111101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert8_4_x;
	else
		new_state <= vert8_4_a;
	end if;

when vert8_4_x =>
	-- bus output in decimal: 371
	serial_bus <= "00000101110011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert8_4_y;
	else
		new_state <= vert8_4_x;
	end if;

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
	-- bus output in decimal: 225
	serial_bus <= "00000011100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert9_0_x;
	else
		new_state <= vert9_0_a;
	end if;

when vert9_0_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert9_0_y;
	else
		new_state <= vert9_0_x;
	end if;

when vert9_0_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert9_1_a;
	else
		new_state <= vert9_0_y;
	end if;

when vert9_1_a =>
	-- bus output in decimal: 191
	serial_bus <= "00000010111111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert9_1_x;
	else
		new_state <= vert9_1_a;
	end if;

when vert9_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert9_1_y;
	else
		new_state <= vert9_1_x;
	end if;

when vert9_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert9_2_a;
	else
		new_state <= vert9_1_y;
	end if;

when vert9_2_a =>
	-- bus output in decimal: 161
	serial_bus <= "00000010100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert9_2_x;
	else
		new_state <= vert9_2_a;
	end if;

when vert9_2_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert9_2_y;
	else
		new_state <= vert9_2_x;
	end if;

when vert9_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert9_3_a;
	else
		new_state <= vert9_2_y;
	end if;

when vert9_3_a =>
	-- bus output in decimal: 149
	serial_bus <= "00000010010101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert9_3_x;
	else
		new_state <= vert9_3_a;
	end if;

when vert9_3_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert9_3_y;
	else
		new_state <= vert9_3_x;
	end if;

when vert9_3_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert9_4_a;
	else
		new_state <= vert9_3_y;
	end if;

when vert9_4_a =>
	-- bus output in decimal: 135
	serial_bus <= "00000010000111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert9_4_x;
	else
		new_state <= vert9_4_a;
	end if;

when vert9_4_x =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert9_4_y;
	else
		new_state <= vert9_4_x;
	end if;

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
	-- bus output in decimal: 235
	serial_bus <= "00000011101011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert10_0_x;
	else
		new_state <= vert10_0_a;
	end if;

when vert10_0_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert10_0_y;
	else
		new_state <= vert10_0_x;
	end if;

when vert10_0_y =>
	-- bus output in decimal: 548
	serial_bus <= "00001000100100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert10_1_a;
	else
		new_state <= vert10_0_y;
	end if;

when vert10_1_a =>
	-- bus output in decimal: 191
	serial_bus <= "00000010111111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert10_1_x;
	else
		new_state <= vert10_1_a;
	end if;

when vert10_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert10_1_y;
	else
		new_state <= vert10_1_x;
	end if;

when vert10_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert10_2_a;
	else
		new_state <= vert10_1_y;
	end if;

when vert10_2_a =>
	-- bus output in decimal: 161
	serial_bus <= "00000010100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert10_2_x;
	else
		new_state <= vert10_2_a;
	end if;

when vert10_2_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert10_2_y;
	else
		new_state <= vert10_2_x;
	end if;

when vert10_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert10_3_a;
	else
		new_state <= vert10_2_y;
	end if;

when vert10_3_a =>
	-- bus output in decimal: 149
	serial_bus <= "00000010010101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert10_3_x;
	else
		new_state <= vert10_3_a;
	end if;

when vert10_3_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert10_3_y;
	else
		new_state <= vert10_3_x;
	end if;

when vert10_3_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert10_4_a;
	else
		new_state <= vert10_3_y;
	end if;

when vert10_4_a =>
	-- bus output in decimal: 145
	serial_bus <= "00000010010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert10_4_x;
	else
		new_state <= vert10_4_a;
	end if;

when vert10_4_x =>
	-- bus output in decimal: 230
	serial_bus <= "00000011100110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert10_4_y;
	else
		new_state <= vert10_4_x;
	end if;

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
	-- bus output in decimal: 245
	serial_bus <= "00000011110101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert11_0_x;
	else
		new_state <= vert11_0_a;
	end if;

when vert11_0_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert11_0_y;
	else
		new_state <= vert11_0_x;
	end if;

when vert11_0_y =>
	-- bus output in decimal: 491
	serial_bus <= "00000111101011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert11_1_a;
	else
		new_state <= vert11_0_y;
	end if;

when vert11_1_a =>
	-- bus output in decimal: 191
	serial_bus <= "00000010111111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert11_1_x;
	else
		new_state <= vert11_1_a;
	end if;

when vert11_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert11_1_y;
	else
		new_state <= vert11_1_x;
	end if;

when vert11_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert11_2_a;
	else
		new_state <= vert11_1_y;
	end if;

when vert11_2_a =>
	-- bus output in decimal: 161
	serial_bus <= "00000010100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert11_2_x;
	else
		new_state <= vert11_2_a;
	end if;

when vert11_2_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert11_2_y;
	else
		new_state <= vert11_2_x;
	end if;

when vert11_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert11_3_a;
	else
		new_state <= vert11_2_y;
	end if;

when vert11_3_a =>
	-- bus output in decimal: 155
	serial_bus <= "00000010011011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert11_3_x;
	else
		new_state <= vert11_3_a;
	end if;

when vert11_3_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert11_3_y;
	else
		new_state <= vert11_3_x;
	end if;

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
	-- bus output in decimal: 255
	serial_bus <= "00000011111111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert12_0_x;
	else
		new_state <= vert12_0_a;
	end if;

when vert12_0_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert12_0_y;
	else
		new_state <= vert12_0_x;
	end if;

when vert12_0_y =>
	-- bus output in decimal: 427
	serial_bus <= "00000110101011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert12_1_a;
	else
		new_state <= vert12_0_y;
	end if;

when vert12_1_a =>
	-- bus output in decimal: 191
	serial_bus <= "00000010111111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert12_1_x;
	else
		new_state <= vert12_1_a;
	end if;

when vert12_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert12_1_y;
	else
		new_state <= vert12_1_x;
	end if;

when vert12_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert12_2_a;
	else
		new_state <= vert12_1_y;
	end if;

when vert12_2_a =>
	-- bus output in decimal: 165
	serial_bus <= "00000010100101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert12_2_x;
	else
		new_state <= vert12_2_a;
	end if;

when vert12_2_x =>
	-- bus output in decimal: 185
	serial_bus <= "00000010111001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert12_2_y;
	else
		new_state <= vert12_2_x;
	end if;

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
	-- bus output in decimal: 265
	serial_bus <= "00000100001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert13_0_x;
	else
		new_state <= vert13_0_a;
	end if;

when vert13_0_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert13_0_y;
	else
		new_state <= vert13_0_x;
	end if;

when vert13_0_y =>
	-- bus output in decimal: 349
	serial_bus <= "00000101011101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert13_1_a;
	else
		new_state <= vert13_0_y;
	end if;

when vert13_1_a =>
	-- bus output in decimal: 191
	serial_bus <= "00000010111111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert13_1_x;
	else
		new_state <= vert13_1_a;
	end if;

when vert13_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert13_1_y;
	else
		new_state <= vert13_1_x;
	end if;

when vert13_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert13_2_a;
	else
		new_state <= vert13_1_y;
	end if;

when vert13_2_a =>
	-- bus output in decimal: 175
	serial_bus <= "00000010101111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert13_2_x;
	else
		new_state <= vert13_2_a;
	end if;

when vert13_2_x =>
	-- bus output in decimal: 133
	serial_bus <= "00000010000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert13_2_y;
	else
		new_state <= vert13_2_x;
	end if;

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
	-- bus output in decimal: 275
	serial_bus <= "00000100010011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert14_0_x;
	else
		new_state <= vert14_0_a;
	end if;

when vert14_0_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert14_0_y;
	else
		new_state <= vert14_0_x;
	end if;

when vert14_0_y =>
	-- bus output in decimal: 243
	serial_bus <= "00000011110011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert14_1_a;
	else
		new_state <= vert14_0_y;
	end if;

when vert14_1_a =>
	-- bus output in decimal: 191
	serial_bus <= "00000010111111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert14_1_x;
	else
		new_state <= vert14_1_a;
	end if;

when vert14_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert14_1_y;
	else
		new_state <= vert14_1_x;
	end if;

when vert14_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert14_2_a;
	else
		new_state <= vert14_1_y;
	end if;

when vert14_2_a =>
	-- bus output in decimal: 185
	serial_bus <= "00000010111001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert14_2_x;
	else
		new_state <= vert14_2_a;
	end if;

when vert14_2_x =>
	-- bus output in decimal: 62
	serial_bus <= "00000000111110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert14_2_y;
	else
		new_state <= vert14_2_x;
	end if;

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
	-- bus output in decimal: 285
	serial_bus <= "00000100011101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert15_0_x;
	else
		new_state <= vert15_0_a;
	end if;

when vert15_0_x =>
	-- bus output in decimal: 44
	serial_bus <= "00000000101100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert15_0_y;
	else
		new_state <= vert15_0_x;
	end if;

when vert15_0_y =>
	-- bus output in decimal: 157
	serial_bus <= "00000010011101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert15_1_a;
	else
		new_state <= vert15_0_y;
	end if;

when vert15_1_a =>
	-- bus output in decimal: 278
	serial_bus <= "00000100010110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert15_1_x;
	else
		new_state <= vert15_1_a;
	end if;

when vert15_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert15_1_y;
	else
		new_state <= vert15_1_x;
	end if;

when vert15_1_y =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert15_2_a;
	else
		new_state <= vert15_1_y;
	end if;

when vert15_2_a =>
	-- bus output in decimal: 195
	serial_bus <= "00000011000011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert15_2_x;
	else
		new_state <= vert15_2_a;
	end if;

when vert15_2_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert15_2_y;
	else
		new_state <= vert15_2_x;
	end if;

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
	-- bus output in decimal: 295
	serial_bus <= "00000100100111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert16_0_x;
	else
		new_state <= vert16_0_a;
	end if;

when vert16_0_x =>
	-- bus output in decimal: 114
	serial_bus <= "00000001110010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert16_0_y;
	else
		new_state <= vert16_0_x;
	end if;

when vert16_0_y =>
	-- bus output in decimal: 87
	serial_bus <= "00000001010111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert16_1_a;
	else
		new_state <= vert16_0_y;
	end if;

when vert16_1_a =>
	-- bus output in decimal: 268
	serial_bus <= "00000100001100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert16_1_x;
	else
		new_state <= vert16_1_a;
	end if;

when vert16_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert16_1_y;
	else
		new_state <= vert16_1_x;
	end if;

when vert16_1_y =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert16_2_a;
	else
		new_state <= vert16_1_y;
	end if;

when vert16_2_a =>
	-- bus output in decimal: 205
	serial_bus <= "00000011001101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert16_2_x;
	else
		new_state <= vert16_2_a;
	end if;

when vert16_2_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert16_2_y;
	else
		new_state <= vert16_2_x;
	end if;

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
	-- bus output in decimal: 305
	serial_bus <= "00000100110001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert17_0_x;
	else
		new_state <= vert17_0_a;
	end if;

when vert17_0_x =>
	-- bus output in decimal: 196
	serial_bus <= "00000011000100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert17_0_y;
	else
		new_state <= vert17_0_x;
	end if;

when vert17_0_y =>
	-- bus output in decimal: 5
	serial_bus <= "00000000000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert17_1_a;
	else
		new_state <= vert17_0_y;
	end if;

when vert17_1_a =>
	-- bus output in decimal: 268
	serial_bus <= "00000100001100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert17_1_x;
	else
		new_state <= vert17_1_a;
	end if;

when vert17_1_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert17_1_y;
	else
		new_state <= vert17_1_x;
	end if;

when vert17_1_y =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert17_2_a;
	else
		new_state <= vert17_1_y;
	end if;

when vert17_2_a =>
	-- bus output in decimal: 215
	serial_bus <= "00000011010111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert17_2_x;
	else
		new_state <= vert17_2_a;
	end if;

when vert17_2_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert17_2_y;
	else
		new_state <= vert17_2_x;
	end if;

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
	-- bus output in decimal: 315
	serial_bus <= "00000100111011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert18_0_x;
	else
		new_state <= vert18_0_a;
	end if;

when vert18_0_x =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert18_0_y;
	else
		new_state <= vert18_0_x;
	end if;

when vert18_0_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert18_1_a;
	else
		new_state <= vert18_0_y;
	end if;

when vert18_1_a =>
	-- bus output in decimal: 305
	serial_bus <= "00000100110001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert18_1_x;
	else
		new_state <= vert18_1_a;
	end if;

when vert18_1_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert18_1_y;
	else
		new_state <= vert18_1_x;
	end if;

when vert18_1_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert18_2_a;
	else
		new_state <= vert18_1_y;
	end if;

when vert18_2_a =>
	-- bus output in decimal: 268
	serial_bus <= "00000100001100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert18_2_x;
	else
		new_state <= vert18_2_a;
	end if;

when vert18_2_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert18_2_y;
	else
		new_state <= vert18_2_x;
	end if;

when vert18_2_y =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert18_3_a;
	else
		new_state <= vert18_2_y;
	end if;

when vert18_3_a =>
	-- bus output in decimal: 225
	serial_bus <= "00000011100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert18_3_x;
	else
		new_state <= vert18_3_a;
	end if;

when vert18_3_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert18_3_y;
	else
		new_state <= vert18_3_x;
	end if;

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
	-- bus output in decimal: 325
	serial_bus <= "00000101000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert19_0_x;
	else
		new_state <= vert19_0_a;
	end if;

when vert19_0_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert19_0_y;
	else
		new_state <= vert19_0_x;
	end if;

when vert19_0_y =>
	-- bus output in decimal: 33
	serial_bus <= "00000000100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert19_1_a;
	else
		new_state <= vert19_0_y;
	end if;

when vert19_1_a =>
	-- bus output in decimal: 324
	serial_bus <= "00000101000100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert19_1_x;
	else
		new_state <= vert19_1_a;
	end if;

when vert19_1_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert19_1_y;
	else
		new_state <= vert19_1_x;
	end if;

when vert19_1_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert19_2_a;
	else
		new_state <= vert19_1_y;
	end if;

when vert19_2_a =>
	-- bus output in decimal: 305
	serial_bus <= "00000100110001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert19_2_x;
	else
		new_state <= vert19_2_a;
	end if;

when vert19_2_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert19_2_y;
	else
		new_state <= vert19_2_x;
	end if;

when vert19_2_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert19_3_a;
	else
		new_state <= vert19_2_y;
	end if;

when vert19_3_a =>
	-- bus output in decimal: 268
	serial_bus <= "00000100001100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert19_3_x;
	else
		new_state <= vert19_3_a;
	end if;

when vert19_3_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert19_3_y;
	else
		new_state <= vert19_3_x;
	end if;

when vert19_3_y =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert19_4_a;
	else
		new_state <= vert19_3_y;
	end if;

when vert19_4_a =>
	-- bus output in decimal: 235
	serial_bus <= "00000011101011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert19_4_x;
	else
		new_state <= vert19_4_a;
	end if;

when vert19_4_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert19_4_y;
	else
		new_state <= vert19_4_x;
	end if;

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
	-- bus output in decimal: 335
	serial_bus <= "00000101001111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_0_x;
	else
		new_state <= vert20_0_a;
	end if;

when vert20_0_x =>
	-- bus output in decimal: 410
	serial_bus <= "00000110011010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_0_y;
	else
		new_state <= vert20_0_x;
	end if;

when vert20_0_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_1_a;
	else
		new_state <= vert20_0_y;
	end if;

when vert20_1_a =>
	-- bus output in decimal: 333
	serial_bus <= "00000101001101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_1_x;
	else
		new_state <= vert20_1_a;
	end if;

when vert20_1_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_1_y;
	else
		new_state <= vert20_1_x;
	end if;

when vert20_1_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_2_a;
	else
		new_state <= vert20_1_y;
	end if;

when vert20_2_a =>
	-- bus output in decimal: 324
	serial_bus <= "00000101000100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_2_x;
	else
		new_state <= vert20_2_a;
	end if;

when vert20_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_2_y;
	else
		new_state <= vert20_2_x;
	end if;

when vert20_2_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_3_a;
	else
		new_state <= vert20_2_y;
	end if;

when vert20_3_a =>
	-- bus output in decimal: 305
	serial_bus <= "00000100110001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_3_x;
	else
		new_state <= vert20_3_a;
	end if;

when vert20_3_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_3_y;
	else
		new_state <= vert20_3_x;
	end if;

when vert20_3_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_4_a;
	else
		new_state <= vert20_3_y;
	end if;

when vert20_4_a =>
	-- bus output in decimal: 268
	serial_bus <= "00000100001100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_4_x;
	else
		new_state <= vert20_4_a;
	end if;

when vert20_4_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_4_y;
	else
		new_state <= vert20_4_x;
	end if;

when vert20_4_y =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_5_a;
	else
		new_state <= vert20_4_y;
	end if;

when vert20_5_a =>
	-- bus output in decimal: 245
	serial_bus <= "00000011110101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_5_x;
	else
		new_state <= vert20_5_a;
	end if;

when vert20_5_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert20_5_y;
	else
		new_state <= vert20_5_x;
	end if;

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
	-- bus output in decimal: 345
	serial_bus <= "00000101011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_0_x;
	else
		new_state <= vert21_0_a;
	end if;

when vert21_0_x =>
	-- bus output in decimal: 474
	serial_bus <= "00000111011010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_0_y;
	else
		new_state <= vert21_0_x;
	end if;

when vert21_0_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_1_a;
	else
		new_state <= vert21_0_y;
	end if;

when vert21_1_a =>
	-- bus output in decimal: 333
	serial_bus <= "00000101001101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_1_x;
	else
		new_state <= vert21_1_a;
	end if;

when vert21_1_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_1_y;
	else
		new_state <= vert21_1_x;
	end if;

when vert21_1_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_2_a;
	else
		new_state <= vert21_1_y;
	end if;

when vert21_2_a =>
	-- bus output in decimal: 324
	serial_bus <= "00000101000100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_2_x;
	else
		new_state <= vert21_2_a;
	end if;

when vert21_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_2_y;
	else
		new_state <= vert21_2_x;
	end if;

when vert21_2_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_3_a;
	else
		new_state <= vert21_2_y;
	end if;

when vert21_3_a =>
	-- bus output in decimal: 305
	serial_bus <= "00000100110001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_3_x;
	else
		new_state <= vert21_3_a;
	end if;

when vert21_3_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_3_y;
	else
		new_state <= vert21_3_x;
	end if;

when vert21_3_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_4_a;
	else
		new_state <= vert21_3_y;
	end if;

when vert21_4_a =>
	-- bus output in decimal: 268
	serial_bus <= "00000100001100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_4_x;
	else
		new_state <= vert21_4_a;
	end if;

when vert21_4_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_4_y;
	else
		new_state <= vert21_4_x;
	end if;

when vert21_4_y =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_5_a;
	else
		new_state <= vert21_4_y;
	end if;

when vert21_5_a =>
	-- bus output in decimal: 255
	serial_bus <= "00000011111111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_5_x;
	else
		new_state <= vert21_5_a;
	end if;

when vert21_5_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert21_5_y;
	else
		new_state <= vert21_5_x;
	end if;

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
	-- bus output in decimal: 355
	serial_bus <= "00000101100011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_0_x;
	else
		new_state <= vert22_0_a;
	end if;

when vert22_0_x =>
	-- bus output in decimal: 552
	serial_bus <= "00001000101000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_0_y;
	else
		new_state <= vert22_0_x;
	end if;

when vert22_0_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_1_a;
	else
		new_state <= vert22_0_y;
	end if;

when vert22_1_a =>
	-- bus output in decimal: 333
	serial_bus <= "00000101001101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_1_x;
	else
		new_state <= vert22_1_a;
	end if;

when vert22_1_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_1_y;
	else
		new_state <= vert22_1_x;
	end if;

when vert22_1_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_2_a;
	else
		new_state <= vert22_1_y;
	end if;

when vert22_2_a =>
	-- bus output in decimal: 324
	serial_bus <= "00000101000100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_2_x;
	else
		new_state <= vert22_2_a;
	end if;

when vert22_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_2_y;
	else
		new_state <= vert22_2_x;
	end if;

when vert22_2_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_3_a;
	else
		new_state <= vert22_2_y;
	end if;

when vert22_3_a =>
	-- bus output in decimal: 305
	serial_bus <= "00000100110001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_3_x;
	else
		new_state <= vert22_3_a;
	end if;

when vert22_3_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_3_y;
	else
		new_state <= vert22_3_x;
	end if;

when vert22_3_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_4_a;
	else
		new_state <= vert22_3_y;
	end if;

when vert22_4_a =>
	-- bus output in decimal: 278
	serial_bus <= "00000100010110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_4_x;
	else
		new_state <= vert22_4_a;
	end if;

when vert22_4_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_4_y;
	else
		new_state <= vert22_4_x;
	end if;

when vert22_4_y =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_5_a;
	else
		new_state <= vert22_4_y;
	end if;

when vert22_5_a =>
	-- bus output in decimal: 265
	serial_bus <= "00000100001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_5_x;
	else
		new_state <= vert22_5_a;
	end if;

when vert22_5_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert22_5_y;
	else
		new_state <= vert22_5_x;
	end if;

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
	-- bus output in decimal: 365
	serial_bus <= "00000101101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_0_x;
	else
		new_state <= vert23_0_a;
	end if;

when vert23_0_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_0_y;
	else
		new_state <= vert23_0_x;
	end if;

when vert23_0_y =>
	-- bus output in decimal: 349
	serial_bus <= "00000101011101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_1_a;
	else
		new_state <= vert23_0_y;
	end if;

when vert23_1_a =>
	-- bus output in decimal: 360
	serial_bus <= "00000101101000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_1_x;
	else
		new_state <= vert23_1_a;
	end if;

when vert23_1_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_1_y;
	else
		new_state <= vert23_1_x;
	end if;

when vert23_1_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_2_a;
	else
		new_state <= vert23_1_y;
	end if;

when vert23_2_a =>
	-- bus output in decimal: 333
	serial_bus <= "00000101001101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_2_x;
	else
		new_state <= vert23_2_a;
	end if;

when vert23_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_2_y;
	else
		new_state <= vert23_2_x;
	end if;

when vert23_2_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_3_a;
	else
		new_state <= vert23_2_y;
	end if;

when vert23_3_a =>
	-- bus output in decimal: 324
	serial_bus <= "00000101000100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_3_x;
	else
		new_state <= vert23_3_a;
	end if;

when vert23_3_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_3_y;
	else
		new_state <= vert23_3_x;
	end if;

when vert23_3_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_4_a;
	else
		new_state <= vert23_3_y;
	end if;

when vert23_4_a =>
	-- bus output in decimal: 305
	serial_bus <= "00000100110001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_4_x;
	else
		new_state <= vert23_4_a;
	end if;

when vert23_4_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_4_y;
	else
		new_state <= vert23_4_x;
	end if;

when vert23_4_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_5_a;
	else
		new_state <= vert23_4_y;
	end if;

when vert23_5_a =>
	-- bus output in decimal: 278
	serial_bus <= "00000100010110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_5_x;
	else
		new_state <= vert23_5_a;
	end if;

when vert23_5_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_5_y;
	else
		new_state <= vert23_5_x;
	end if;

when vert23_5_y =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_6_a;
	else
		new_state <= vert23_5_y;
	end if;

when vert23_6_a =>
	-- bus output in decimal: 275
	serial_bus <= "00000100010011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_6_x;
	else
		new_state <= vert23_6_a;
	end if;

when vert23_6_x =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert23_6_y;
	else
		new_state <= vert23_6_x;
	end if;

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
	-- bus output in decimal: 375
	serial_bus <= "00000101110111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_0_x;
	else
		new_state <= vert24_0_a;
	end if;

when vert24_0_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_0_y;
	else
		new_state <= vert24_0_x;
	end if;

when vert24_0_y =>
	-- bus output in decimal: 427
	serial_bus <= "00000110101011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_1_a;
	else
		new_state <= vert24_0_y;
	end if;

when vert24_1_a =>
	-- bus output in decimal: 360
	serial_bus <= "00000101101000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_1_x;
	else
		new_state <= vert24_1_a;
	end if;

when vert24_1_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_1_y;
	else
		new_state <= vert24_1_x;
	end if;

when vert24_1_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_2_a;
	else
		new_state <= vert24_1_y;
	end if;

when vert24_2_a =>
	-- bus output in decimal: 333
	serial_bus <= "00000101001101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_2_x;
	else
		new_state <= vert24_2_a;
	end if;

when vert24_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_2_y;
	else
		new_state <= vert24_2_x;
	end if;

when vert24_2_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_3_a;
	else
		new_state <= vert24_2_y;
	end if;

when vert24_3_a =>
	-- bus output in decimal: 324
	serial_bus <= "00000101000100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_3_x;
	else
		new_state <= vert24_3_a;
	end if;

when vert24_3_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_3_y;
	else
		new_state <= vert24_3_x;
	end if;

when vert24_3_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_4_a;
	else
		new_state <= vert24_3_y;
	end if;

when vert24_4_a =>
	-- bus output in decimal: 305
	serial_bus <= "00000100110001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_4_x;
	else
		new_state <= vert24_4_a;
	end if;

when vert24_4_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_4_y;
	else
		new_state <= vert24_4_x;
	end if;

when vert24_4_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_5_a;
	else
		new_state <= vert24_4_y;
	end if;

when vert24_5_a =>
	-- bus output in decimal: 285
	serial_bus <= "00000100011101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_5_x;
	else
		new_state <= vert24_5_a;
	end if;

when vert24_5_x =>
	-- bus output in decimal: 44
	serial_bus <= "00000000101100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert24_5_y;
	else
		new_state <= vert24_5_x;
	end if;

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
	-- bus output in decimal: 385
	serial_bus <= "00000110000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_0_x;
	else
		new_state <= vert25_0_a;
	end if;

when vert25_0_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_0_y;
	else
		new_state <= vert25_0_x;
	end if;

when vert25_0_y =>
	-- bus output in decimal: 491
	serial_bus <= "00000111101011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_1_a;
	else
		new_state <= vert25_0_y;
	end if;

when vert25_1_a =>
	-- bus output in decimal: 360
	serial_bus <= "00000101101000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_1_x;
	else
		new_state <= vert25_1_a;
	end if;

when vert25_1_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_1_y;
	else
		new_state <= vert25_1_x;
	end if;

when vert25_1_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_2_a;
	else
		new_state <= vert25_1_y;
	end if;

when vert25_2_a =>
	-- bus output in decimal: 333
	serial_bus <= "00000101001101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_2_x;
	else
		new_state <= vert25_2_a;
	end if;

when vert25_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_2_y;
	else
		new_state <= vert25_2_x;
	end if;

when vert25_2_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_3_a;
	else
		new_state <= vert25_2_y;
	end if;

when vert25_3_a =>
	-- bus output in decimal: 324
	serial_bus <= "00000101000100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_3_x;
	else
		new_state <= vert25_3_a;
	end if;

when vert25_3_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_3_y;
	else
		new_state <= vert25_3_x;
	end if;

when vert25_3_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_4_a;
	else
		new_state <= vert25_3_y;
	end if;

when vert25_4_a =>
	-- bus output in decimal: 305
	serial_bus <= "00000100110001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_4_x;
	else
		new_state <= vert25_4_a;
	end if;

when vert25_4_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_4_y;
	else
		new_state <= vert25_4_x;
	end if;

when vert25_4_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_5_a;
	else
		new_state <= vert25_4_y;
	end if;

when vert25_5_a =>
	-- bus output in decimal: 295
	serial_bus <= "00000100100111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_5_x;
	else
		new_state <= vert25_5_a;
	end if;

when vert25_5_x =>
	-- bus output in decimal: 114
	serial_bus <= "00000001110010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert25_5_y;
	else
		new_state <= vert25_5_x;
	end if;

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
	-- bus output in decimal: 395
	serial_bus <= "00000110001011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_0_x;
	else
		new_state <= vert26_0_a;
	end if;

when vert26_0_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_0_y;
	else
		new_state <= vert26_0_x;
	end if;

when vert26_0_y =>
	-- bus output in decimal: 548
	serial_bus <= "00001000100100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_1_a;
	else
		new_state <= vert26_0_y;
	end if;

when vert26_1_a =>
	-- bus output in decimal: 360
	serial_bus <= "00000101101000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_1_x;
	else
		new_state <= vert26_1_a;
	end if;

when vert26_1_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_1_y;
	else
		new_state <= vert26_1_x;
	end if;

when vert26_1_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_2_a;
	else
		new_state <= vert26_1_y;
	end if;

when vert26_2_a =>
	-- bus output in decimal: 333
	serial_bus <= "00000101001101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_2_x;
	else
		new_state <= vert26_2_a;
	end if;

when vert26_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_2_y;
	else
		new_state <= vert26_2_x;
	end if;

when vert26_2_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_3_a;
	else
		new_state <= vert26_2_y;
	end if;

when vert26_3_a =>
	-- bus output in decimal: 324
	serial_bus <= "00000101000100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_3_x;
	else
		new_state <= vert26_3_a;
	end if;

when vert26_3_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_3_y;
	else
		new_state <= vert26_3_x;
	end if;

when vert26_3_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_4_a;
	else
		new_state <= vert26_3_y;
	end if;

when vert26_4_a =>
	-- bus output in decimal: 305
	serial_bus <= "00000100110001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_4_x;
	else
		new_state <= vert26_4_a;
	end if;

when vert26_4_x =>
	-- bus output in decimal: 201
	serial_bus <= "00000011001001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_4_y;
	else
		new_state <= vert26_4_x;
	end if;

when vert26_4_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_5_a;
	else
		new_state <= vert26_4_y;
	end if;

when vert26_5_a =>
	-- bus output in decimal: 305
	serial_bus <= "00000100110001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_5_x;
	else
		new_state <= vert26_5_a;
	end if;

when vert26_5_x =>
	-- bus output in decimal: 196
	serial_bus <= "00000011000100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert26_5_y;
	else
		new_state <= vert26_5_x;
	end if;

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
	-- bus output in decimal: 45
	serial_bus <= "00000000101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert27_0_x;
	else
		new_state <= vert27_0_a;
	end if;

when vert27_0_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert27_0_y;
	else
		new_state <= vert27_0_x;
	end if;

when vert27_0_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert27_1_a;
	else
		new_state <= vert27_0_y;
	end if;

when vert27_1_a =>
	-- bus output in decimal: 360
	serial_bus <= "00000101101000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert27_1_x;
	else
		new_state <= vert27_1_a;
	end if;

when vert27_1_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert27_1_y;
	else
		new_state <= vert27_1_x;
	end if;

when vert27_1_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert27_2_a;
	else
		new_state <= vert27_1_y;
	end if;

when vert27_2_a =>
	-- bus output in decimal: 333
	serial_bus <= "00000101001101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert27_2_x;
	else
		new_state <= vert27_2_a;
	end if;

when vert27_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert27_2_y;
	else
		new_state <= vert27_2_x;
	end if;

when vert27_2_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert27_3_a;
	else
		new_state <= vert27_2_y;
	end if;

when vert27_3_a =>
	-- bus output in decimal: 324
	serial_bus <= "00000101000100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert27_3_x;
	else
		new_state <= vert27_3_a;
	end if;

when vert27_3_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert27_3_y;
	else
		new_state <= vert27_3_x;
	end if;

when vert27_3_y =>
	-- bus output in decimal: 1
	serial_bus <= "00000000000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert27_4_a;
	else
		new_state <= vert27_3_y;
	end if;

when vert27_4_a =>
	-- bus output in decimal: 315
	serial_bus <= "00000100111011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert27_4_x;
	else
		new_state <= vert27_4_a;
	end if;

when vert27_4_x =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert27_4_y;
	else
		new_state <= vert27_4_x;
	end if;

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
	-- bus output in decimal: 55
	serial_bus <= "00000000110111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert28_0_x;
	else
		new_state <= vert28_0_a;
	end if;

when vert28_0_x =>
	-- bus output in decimal: 764
	serial_bus <= "00001011111100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert28_0_y;
	else
		new_state <= vert28_0_x;
	end if;

when vert28_0_y =>
	-- bus output in decimal: 682
	serial_bus <= "00001010101010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert28_1_a;
	else
		new_state <= vert28_0_y;
	end if;

when vert28_1_a =>
	-- bus output in decimal: 45
	serial_bus <= "00000000101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert28_1_x;
	else
		new_state <= vert28_1_a;
	end if;

when vert28_1_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert28_1_y;
	else
		new_state <= vert28_1_x;
	end if;

when vert28_1_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert28_2_a;
	else
		new_state <= vert28_1_y;
	end if;

when vert28_2_a =>
	-- bus output in decimal: 360
	serial_bus <= "00000101101000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert28_2_x;
	else
		new_state <= vert28_2_a;
	end if;

when vert28_2_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert28_2_y;
	else
		new_state <= vert28_2_x;
	end if;

when vert28_2_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert28_3_a;
	else
		new_state <= vert28_2_y;
	end if;

when vert28_3_a =>
	-- bus output in decimal: 333
	serial_bus <= "00000101001101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert28_3_x;
	else
		new_state <= vert28_3_a;
	end if;

when vert28_3_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert28_3_y;
	else
		new_state <= vert28_3_x;
	end if;

when vert28_3_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert28_4_a;
	else
		new_state <= vert28_3_y;
	end if;

when vert28_4_a =>
	-- bus output in decimal: 325
	serial_bus <= "00000101000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert28_4_x;
	else
		new_state <= vert28_4_a;
	end if;

when vert28_4_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert28_4_y;
	else
		new_state <= vert28_4_x;
	end if;

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
	-- bus output in decimal: 65
	serial_bus <= "00000001000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert29_0_x;
	else
		new_state <= vert29_0_a;
	end if;

when vert29_0_x =>
	-- bus output in decimal: 706
	serial_bus <= "00001011000010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert29_0_y;
	else
		new_state <= vert29_0_x;
	end if;

when vert29_0_y =>
	-- bus output in decimal: 748
	serial_bus <= "00001011101100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert29_1_a;
	else
		new_state <= vert29_0_y;
	end if;

when vert29_1_a =>
	-- bus output in decimal: 56
	serial_bus <= "00000000111000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert29_1_x;
	else
		new_state <= vert29_1_a;
	end if;

when vert29_1_x =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert29_1_y;
	else
		new_state <= vert29_1_x;
	end if;

when vert29_1_y =>
	-- bus output in decimal: 701
	serial_bus <= "00001010111101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert29_2_a;
	else
		new_state <= vert29_1_y;
	end if;

when vert29_2_a =>
	-- bus output in decimal: 45
	serial_bus <= "00000000101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert29_2_x;
	else
		new_state <= vert29_2_a;
	end if;

when vert29_2_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert29_2_y;
	else
		new_state <= vert29_2_x;
	end if;

when vert29_2_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert29_3_a;
	else
		new_state <= vert29_2_y;
	end if;

when vert29_3_a =>
	-- bus output in decimal: 360
	serial_bus <= "00000101101000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert29_3_x;
	else
		new_state <= vert29_3_a;
	end if;

when vert29_3_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert29_3_y;
	else
		new_state <= vert29_3_x;
	end if;

when vert29_3_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert29_4_a;
	else
		new_state <= vert29_3_y;
	end if;

when vert29_4_a =>
	-- bus output in decimal: 335
	serial_bus <= "00000101001111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert29_4_x;
	else
		new_state <= vert29_4_a;
	end if;

when vert29_4_x =>
	-- bus output in decimal: 410
	serial_bus <= "00000110011010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert29_4_y;
	else
		new_state <= vert29_4_x;
	end if;

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
	-- bus output in decimal: 75
	serial_bus <= "00000001001011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert30_0_x;
	else
		new_state <= vert30_0_a;
	end if;

when vert30_0_x =>
	-- bus output in decimal: 625
	serial_bus <= "00001001110001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert30_0_y;
	else
		new_state <= vert30_0_x;
	end if;

when vert30_0_y =>
	-- bus output in decimal: 788
	serial_bus <= "00001100010100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert30_1_a;
	else
		new_state <= vert30_0_y;
	end if;

when vert30_1_a =>
	-- bus output in decimal: 56
	serial_bus <= "00000000111000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert30_1_x;
	else
		new_state <= vert30_1_a;
	end if;

when vert30_1_x =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert30_1_y;
	else
		new_state <= vert30_1_x;
	end if;

when vert30_1_y =>
	-- bus output in decimal: 701
	serial_bus <= "00001010111101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert30_2_a;
	else
		new_state <= vert30_1_y;
	end if;

when vert30_2_a =>
	-- bus output in decimal: 45
	serial_bus <= "00000000101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert30_2_x;
	else
		new_state <= vert30_2_a;
	end if;

when vert30_2_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert30_2_y;
	else
		new_state <= vert30_2_x;
	end if;

when vert30_2_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert30_3_a;
	else
		new_state <= vert30_2_y;
	end if;

when vert30_3_a =>
	-- bus output in decimal: 360
	serial_bus <= "00000101101000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert30_3_x;
	else
		new_state <= vert30_3_a;
	end if;

when vert30_3_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert30_3_y;
	else
		new_state <= vert30_3_x;
	end if;

when vert30_3_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert30_4_a;
	else
		new_state <= vert30_3_y;
	end if;

when vert30_4_a =>
	-- bus output in decimal: 345
	serial_bus <= "00000101011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert30_4_x;
	else
		new_state <= vert30_4_a;
	end if;

when vert30_4_x =>
	-- bus output in decimal: 474
	serial_bus <= "00000111011010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert30_4_y;
	else
		new_state <= vert30_4_x;
	end if;

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
	-- bus output in decimal: 85
	serial_bus <= "00000001010101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_0_x;
	else
		new_state <= vert31_0_a;
	end if;

when vert31_0_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_0_y;
	else
		new_state <= vert31_0_x;
	end if;

when vert31_0_y =>
	-- bus output in decimal: 852
	serial_bus <= "00001101010100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_1_a;
	else
		new_state <= vert31_0_y;
	end if;

when vert31_1_a =>
	-- bus output in decimal: 78
	serial_bus <= "00000001001110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_1_x;
	else
		new_state <= vert31_1_a;
	end if;

when vert31_1_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_1_y;
	else
		new_state <= vert31_1_x;
	end if;

when vert31_1_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_2_a;
	else
		new_state <= vert31_1_y;
	end if;

when vert31_2_a =>
	-- bus output in decimal: 56
	serial_bus <= "00000000111000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_2_x;
	else
		new_state <= vert31_2_a;
	end if;

when vert31_2_x =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_2_y;
	else
		new_state <= vert31_2_x;
	end if;

when vert31_2_y =>
	-- bus output in decimal: 701
	serial_bus <= "00001010111101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_3_a;
	else
		new_state <= vert31_2_y;
	end if;

when vert31_3_a =>
	-- bus output in decimal: 45
	serial_bus <= "00000000101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_3_x;
	else
		new_state <= vert31_3_a;
	end if;

when vert31_3_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_3_y;
	else
		new_state <= vert31_3_x;
	end if;

when vert31_3_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_4_a;
	else
		new_state <= vert31_3_y;
	end if;

when vert31_4_a =>
	-- bus output in decimal: 360
	serial_bus <= "00000101101000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_4_x;
	else
		new_state <= vert31_4_a;
	end if;

when vert31_4_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_4_y;
	else
		new_state <= vert31_4_x;
	end if;

when vert31_4_y =>
	-- bus output in decimal: 301
	serial_bus <= "00000100101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_5_a;
	else
		new_state <= vert31_4_y;
	end if;

when vert31_5_a =>
	-- bus output in decimal: 355
	serial_bus <= "00000101100011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_5_x;
	else
		new_state <= vert31_5_a;
	end if;

when vert31_5_x =>
	-- bus output in decimal: 552
	serial_bus <= "00001000101000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert31_5_y;
	else
		new_state <= vert31_5_x;
	end if;

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
	-- bus output in decimal: 95
	serial_bus <= "00000001011111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_0_x;
	else
		new_state <= vert32_0_a;
	end if;

when vert32_0_x =>
	-- bus output in decimal: 552
	serial_bus <= "00001000101000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_0_y;
	else
		new_state <= vert32_0_x;
	end if;

when vert32_0_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_1_a;
	else
		new_state <= vert32_0_y;
	end if;

when vert32_1_a =>
	-- bus output in decimal: 90
	serial_bus <= "00000001011010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_1_x;
	else
		new_state <= vert32_1_a;
	end if;

when vert32_1_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_1_y;
	else
		new_state <= vert32_1_x;
	end if;

when vert32_1_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_2_a;
	else
		new_state <= vert32_1_y;
	end if;

when vert32_2_a =>
	-- bus output in decimal: 78
	serial_bus <= "00000001001110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_2_x;
	else
		new_state <= vert32_2_a;
	end if;

when vert32_2_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_2_y;
	else
		new_state <= vert32_2_x;
	end if;

when vert32_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_3_a;
	else
		new_state <= vert32_2_y;
	end if;

when vert32_3_a =>
	-- bus output in decimal: 56
	serial_bus <= "00000000111000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_3_x;
	else
		new_state <= vert32_3_a;
	end if;

when vert32_3_x =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_3_y;
	else
		new_state <= vert32_3_x;
	end if;

when vert32_3_y =>
	-- bus output in decimal: 701
	serial_bus <= "00001010111101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_4_a;
	else
		new_state <= vert32_3_y;
	end if;

when vert32_4_a =>
	-- bus output in decimal: 45
	serial_bus <= "00000000101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_4_x;
	else
		new_state <= vert32_4_a;
	end if;

when vert32_4_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_4_y;
	else
		new_state <= vert32_4_x;
	end if;

when vert32_4_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_5_a;
	else
		new_state <= vert32_4_y;
	end if;

when vert32_5_a =>
	-- bus output in decimal: 365
	serial_bus <= "00000101101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_5_x;
	else
		new_state <= vert32_5_a;
	end if;

when vert32_5_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert32_5_y;
	else
		new_state <= vert32_5_x;
	end if;

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
	-- bus output in decimal: 105
	serial_bus <= "00000001101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_0_x;
	else
		new_state <= vert33_0_a;
	end if;

when vert33_0_x =>
	-- bus output in decimal: 474
	serial_bus <= "00000111011010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_0_y;
	else
		new_state <= vert33_0_x;
	end if;

when vert33_0_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_1_a;
	else
		new_state <= vert33_0_y;
	end if;

when vert33_1_a =>
	-- bus output in decimal: 90
	serial_bus <= "00000001011010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_1_x;
	else
		new_state <= vert33_1_a;
	end if;

when vert33_1_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_1_y;
	else
		new_state <= vert33_1_x;
	end if;

when vert33_1_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_2_a;
	else
		new_state <= vert33_1_y;
	end if;

when vert33_2_a =>
	-- bus output in decimal: 78
	serial_bus <= "00000001001110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_2_x;
	else
		new_state <= vert33_2_a;
	end if;

when vert33_2_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_2_y;
	else
		new_state <= vert33_2_x;
	end if;

when vert33_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_3_a;
	else
		new_state <= vert33_2_y;
	end if;

when vert33_3_a =>
	-- bus output in decimal: 56
	serial_bus <= "00000000111000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_3_x;
	else
		new_state <= vert33_3_a;
	end if;

when vert33_3_x =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_3_y;
	else
		new_state <= vert33_3_x;
	end if;

when vert33_3_y =>
	-- bus output in decimal: 701
	serial_bus <= "00001010111101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_4_a;
	else
		new_state <= vert33_3_y;
	end if;

when vert33_4_a =>
	-- bus output in decimal: 45
	serial_bus <= "00000000101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_4_x;
	else
		new_state <= vert33_4_a;
	end if;

when vert33_4_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_4_y;
	else
		new_state <= vert33_4_x;
	end if;

when vert33_4_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_5_a;
	else
		new_state <= vert33_4_y;
	end if;

when vert33_5_a =>
	-- bus output in decimal: 375
	serial_bus <= "00000101110111";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_5_x;
	else
		new_state <= vert33_5_a;
	end if;

when vert33_5_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert33_5_y;
	else
		new_state <= vert33_5_x;
	end if;

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
	-- bus output in decimal: 115
	serial_bus <= "00000001110011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_0_x;
	else
		new_state <= vert34_0_a;
	end if;

when vert34_0_x =>
	-- bus output in decimal: 410
	serial_bus <= "00000110011010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_0_y;
	else
		new_state <= vert34_0_x;
	end if;

when vert34_0_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_1_a;
	else
		new_state <= vert34_0_y;
	end if;

when vert34_1_a =>
	-- bus output in decimal: 90
	serial_bus <= "00000001011010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_1_x;
	else
		new_state <= vert34_1_a;
	end if;

when vert34_1_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_1_y;
	else
		new_state <= vert34_1_x;
	end if;

when vert34_1_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_2_a;
	else
		new_state <= vert34_1_y;
	end if;

when vert34_2_a =>
	-- bus output in decimal: 78
	serial_bus <= "00000001001110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_2_x;
	else
		new_state <= vert34_2_a;
	end if;

when vert34_2_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_2_y;
	else
		new_state <= vert34_2_x;
	end if;

when vert34_2_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_3_a;
	else
		new_state <= vert34_2_y;
	end if;

when vert34_3_a =>
	-- bus output in decimal: 56
	serial_bus <= "00000000111000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_3_x;
	else
		new_state <= vert34_3_a;
	end if;

when vert34_3_x =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_3_y;
	else
		new_state <= vert34_3_x;
	end if;

when vert34_3_y =>
	-- bus output in decimal: 701
	serial_bus <= "00001010111101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_4_a;
	else
		new_state <= vert34_3_y;
	end if;

when vert34_4_a =>
	-- bus output in decimal: 45
	serial_bus <= "00000000101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_4_x;
	else
		new_state <= vert34_4_a;
	end if;

when vert34_4_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_4_y;
	else
		new_state <= vert34_4_x;
	end if;

when vert34_4_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_5_a;
	else
		new_state <= vert34_4_y;
	end if;

when vert34_5_a =>
	-- bus output in decimal: 385
	serial_bus <= "00000110000001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_5_x;
	else
		new_state <= vert34_5_a;
	end if;

when vert34_5_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert34_5_y;
	else
		new_state <= vert34_5_x;
	end if;

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
	-- bus output in decimal: 125
	serial_bus <= "00000001111101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_0_x;
	else
		new_state <= vert35_0_a;
	end if;

when vert35_0_x =>
	-- bus output in decimal: 371
	serial_bus <= "00000101110011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_0_y;
	else
		new_state <= vert35_0_x;
	end if;

when vert35_0_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_1_a;
	else
		new_state <= vert35_0_y;
	end if;

when vert35_1_a =>
	-- bus output in decimal: 120
	serial_bus <= "00000001111000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_1_x;
	else
		new_state <= vert35_1_a;
	end if;

when vert35_1_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_1_y;
	else
		new_state <= vert35_1_x;
	end if;

when vert35_1_y =>
	-- bus output in decimal: 1001
	serial_bus <= "00001111101001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_2_a;
	else
		new_state <= vert35_1_y;
	end if;

when vert35_2_a =>
	-- bus output in decimal: 116
	serial_bus <= "00000001110100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_2_x;
	else
		new_state <= vert35_2_a;
	end if;

when vert35_2_x =>
	-- bus output in decimal: 401
	serial_bus <= "00000110010001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_2_y;
	else
		new_state <= vert35_2_x;
	end if;

when vert35_2_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_3_a;
	else
		new_state <= vert35_2_y;
	end if;

when vert35_3_a =>
	-- bus output in decimal: 90
	serial_bus <= "00000001011010";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_3_x;
	else
		new_state <= vert35_3_a;
	end if;

when vert35_3_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_3_y;
	else
		new_state <= vert35_3_x;
	end if;

when vert35_3_y =>
	-- bus output in decimal: 901
	serial_bus <= "00001110000101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_4_a;
	else
		new_state <= vert35_3_y;
	end if;

when vert35_4_a =>
	-- bus output in decimal: 78
	serial_bus <= "00000001001110";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_4_x;
	else
		new_state <= vert35_4_a;
	end if;

when vert35_4_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_4_y;
	else
		new_state <= vert35_4_x;
	end if;

when vert35_4_y =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_5_a;
	else
		new_state <= vert35_4_y;
	end if;

when vert35_5_a =>
	-- bus output in decimal: 56
	serial_bus <= "00000000111000";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_5_x;
	else
		new_state <= vert35_5_a;
	end if;

when vert35_5_x =>
	-- bus output in decimal: 801
	serial_bus <= "00001100100001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_5_y;
	else
		new_state <= vert35_5_x;
	end if;

when vert35_5_y =>
	-- bus output in decimal: 701
	serial_bus <= "00001010111101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_6_a;
	else
		new_state <= vert35_5_y;
	end if;

when vert35_6_a =>
	-- bus output in decimal: 45
	serial_bus <= "00000000101101";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_6_x;
	else
		new_state <= vert35_6_a;
	end if;

when vert35_6_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_6_y;
	else
		new_state <= vert35_6_x;
	end if;

when vert35_6_y =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_7_a;
	else
		new_state <= vert35_6_y;
	end if;

when vert35_7_a =>
	-- bus output in decimal: 395
	serial_bus <= "00000110001011";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_7_x;
	else
		new_state <= vert35_7_a;
	end if;

when vert35_7_x =>
	-- bus output in decimal: 601
	serial_bus <= "00001001011001";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= vert35_7_y;
	else
		new_state <= vert35_7_x;
	end if;

when vert35_7_y =>
	-- bus output in decimal: 548
	serial_bus <= "00001000100100";
	new_pointer <= pointer;

	if (rdy = '1') then
		new_state <= EOF;
	else
		new_state <= vert35_7_y;
	end if;

