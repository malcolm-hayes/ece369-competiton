`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
////////////////////////////////////////////////////////////////////////////////

module Multiplier32Bit_Generate(check_wcol_out, A, B, ALUResult);

	input [1:0] check_wcol_out; // control bits for ALU operation
                      // you need to adjust the bitwidth as needed
	input signed [31:0] A, B;	    // inputs

	output reg [31:0] ALUResult;	// answer
	//output reg Zero;	    // Zero=1 if ALUResult == 0



	always @(A, B, check_wcol_out) begin
		ALUResult <= A * B;
	end

	
endmodule

