//7th operation used for calculating generate_window
`timescale 1ns / 1ps

module Gen_Add_16_7(x, mul_out_1,mul_out_2,mul_out_3,mul_out_4, add7_out_1,
					add7_out_2, add7_out_3, add7_out_4);

	input [1:0] check_wcol_out; // control bits for ALU operation
                      
	input signed [31:0] A, B;	    // inputs

	output reg [31:0] Out;	// answer
	//output reg Zero;	    // Zero=1 if Out == 0
		//                A, B, C, out, sel
		Adder32Bit Adder32Bit_1(mul_out_1, x, add7_out_1); //first 4
		Adder32Bit Adder32Bit_2(mul_out_2, x, add7_out_2); //second 4
		Adder32Bit Adder32Bit_3(mul_out_3, x, add7_out_3); //third 4
		Adder32Bit Adder32Bit_4(mul_out_4, x, add7_out_4); //fourth 4




	
endmodule