//The adder that allows the memmory to pull from 16 locations of the memmory
`timescale 1ns / 1ps

module Adder32bit_16(In1,In2,In3,In4,In5,In6,In7,In8,In9,In10,In11,In12,In13,In14,In15,In16,
					In17,In18,In19,In20,In21,In22,In23,In24,In25,In26,In27,In28,In29,In30,In31,In32,
                	Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9,Out10,Out11,Out12,Out13,Out14,Out15,Out16);

	input [1:0] check_wcol_out; // control bits for ALU operation
                      
	input signed [31:0] A, B;	    // inputs

	output reg [31:0] Out;	// answer
	

        

		Adder32Bit Adder32Bit_1(In1, In17, Out1);
		Adder32Bit Adder32Bit_2(In2, In18, Out2);
		Adder32Bit Adder32Bit_3(In3, In19, Out3);
		Adder32Bit Adder32Bit_4(In4, In20, Out4);
		//First four
		Adder32Bit Adder32Bit_5(In5, In21, Out5);
		Adder32Bit Adder32Bit_6(In6, In22, Out6);
		Adder32Bit Adder32Bit_7(In7, In23, Out7);
		Adder32Bit Adder32Bit_8(In8, In24, Out8);
		//second four
		Adder32Bit Adder32Bit_9(In9, In25, Out9);
		Adder32Bit Adder32Bit_10(In10, In26, Out10);
		Adder32Bit Adder32Bit_11(In11, In27, Out11);
		Adder32Bit Adder32Bit_12(In12, In28, Out12);
		//third four
		Adder32Bit Adder32Bit_13(In13, In29, Out13);
		Adder32Bit Adder32Bit_14(In14, In30, Out14);
		Adder32Bit Adder32Bit_15(In15, In31, Out15);
		Adder32Bit Adder32Bit_16(In16, In32, Out16);
		//fourth four





	
endmodule