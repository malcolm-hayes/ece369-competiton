//The adder that allows the memmory to pull from 16 locations of the memmory
`timescale 1ns / 1ps

module Adder32bit_2(In1,In2,In3,In4,
                	Out1,Out2);

	input [1:0] check_wcol_out; // control bits for ALU operation
                      
	input signed [31:0] A, B;	    // inputs

	output reg [31:0] Out;	// answer
	

        

		Adder32Bit Adder32Bit_1(In1, In3, Out1);
		Adder32Bit Adder32Bit_2(In2, In4, Out2);







	
endmodule