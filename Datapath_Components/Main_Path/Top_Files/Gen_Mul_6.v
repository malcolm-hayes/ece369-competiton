//7th operation used for calculating generate_window
`timescale 1ns / 1ps

module Gen_Mul_6(check_wcol_out, frow, 
                mul_out_1,mul_out_2,mul_out_3,mul_out_4);

	input [1:0] check_wcol_out; // control bits for ALU operation
                      
	input [31:0] frow;	    // inputs

	output wire [31:0] mul_out_1,mul_out_2,mul_out_3,mul_out_4;

		//                A, B, C, out, sel
		Mux32Bit3To1 MUX_1_to_4(0, 0, 0, out1, check_wcol_out);
		//First 4 are always the same
		Mux32Bit3To1 MUX_5_to_8(1, 0, 0, out2, check_wcol_out);
		//Second four are the same for 2 instances
		Mux32Bit3To1 MUX_9_to_12(2, 1, 0, out3, check_wcol_out);
		//Third four are different for all instances
		Mux32Bit3To1 MUX_13_to_5(3, 1, 0, out4, check_wcol_out);
		//Fourth four are different for all instances

		Multiplier32Bit Multiplier32Bit_1(out1, frow, mul_out_1); //first 4
		Multiplier32Bit Multiplier32Bit_2(out2, frow, mul_out_2); //second 4
		Multiplier32Bit Multiplier32Bit_3(out3, frow, mul_out_3); //third 4
		Multiplier32Bit Multiplier32Bit_4(out4, frow, mul_out_4); //fourth 4




	
endmodule