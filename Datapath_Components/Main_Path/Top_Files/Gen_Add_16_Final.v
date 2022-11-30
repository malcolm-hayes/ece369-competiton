//8th operation used for calculating generate_window
`timescale 1ns / 1ps

module Gen_Add_16_Final(add4_out,
				In1,In2,In3,In4,In5,In6,In7,In8,In9,In10,In11,In12,In13,In14,In15,In16,
                Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9,Out10,Out11,Out12,Out13,Out14,Out15,Out16);

	input [1:0] check_wcol_out; // control bits for ALU operation
                      
	input signed [31:0] A, B;	    // inputs

	output reg [31:0] Out;	// answer
	

		Adder32Bit Adder32Bit_1(In1, add4_out, Out1);
		Adder32Bit Adder32Bit_1(In2, add4_out, Out2);
		Adder32Bit Adder32Bit_1(In3, add4_out, Out3);
		Adder32Bit Adder32Bit_1(In4, add4_out, Out4);
		//First four
		Adder32Bit Adder32Bit_1(In5, add4_out, Out5);
		Adder32Bit Adder32Bit_1(In6, add4_out, Out6);
		Adder32Bit Adder32Bit_1(In7, add4_out, Out7);
		Adder32Bit Adder32Bit_1(In8, add4_out, Out8);
		//second four
		Adder32Bit Adder32Bit_1(In9, add4_out, Out9);
		Adder32Bit Adder32Bit_1(In10, add4_out, Out10);
		Adder32Bit Adder32Bit_1(In11, add4_out, Out11);
		Adder32Bit Adder32Bit_1(In12, add4_out, Out12);
		//third four
		Adder32Bit Adder32Bit_1(In13, add4_out, Out13);
		Adder32Bit Adder32Bit_1(In14, add4_out, Out14);
		Adder32Bit Adder32Bit_1(In15, add4_out, Out15);
		Adder32Bit Adder32Bit_1(In16, add4_out, Out16);
		//fourth four



	
endmodule