//The adder that allows the memmory to pull from 16 locations of the memmory
`timescale 1ns / 1ps

module Adder32bit_8(In1,In2,In3,In4,In5,In6,In7,In8,In9,In10,In11,In12,In13,In14,In15,In16,
                	Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8);
                      
	input [31:0] In1,In2,In3,In4,In5,In6,In7,In8,In9,In10,In11,In12,In13,In14,In15,In16;	    // inputs

	output wire [31:0] Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8;	// answer
	

        

		Adder32Bit Adder32Bit_1(In1, In9, Out1);
		Adder32Bit Adder32Bit_2(In2, In10, Out2);
		Adder32Bit Adder32Bit_3(In3, In11, Out3);
		Adder32Bit Adder32Bit_4(In4, In12, Out4);
		//First four
		Adder32Bit Adder32Bit_5(In5, In13, Out5);
		Adder32Bit Adder32Bit_6(In6, In14, Out6);
		Adder32Bit Adder32Bit_7(In7, In15, Out7);
		Adder32Bit Adder32Bit_8(In8, In16, Out8);
		//second four






	
endmodule