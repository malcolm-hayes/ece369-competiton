//The adder that allows the memmory to pull from 16 locations of the memmory
`timescale 1ns / 1ps

module Adder32bit_4(In1,In2,In3,In4,In5,In6,In7,In8,
                	Out1,Out2,Out3,Out4);
                      
	input [31:0] In1,In2,In3,In4,In5,In6,In7,In8;	    // inputs

	output wire [31:0] Out1,Out2,Out3,Out4;	// answer
	

        

		Adder32Bit Adder32Bit_1(In1, In5, Out1);
		Adder32Bit Adder32Bit_2(In2, In6, Out2);
		Adder32Bit Adder32Bit_3(In3, In7, Out3);
		Adder32Bit Adder32Bit_4(In4, In8, Out4);
		//First four







	
endmodule