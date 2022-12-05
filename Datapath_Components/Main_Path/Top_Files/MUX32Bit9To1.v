
`timescale 1ns / 1ps

module Mux32Bit9To1 (rs_value_EX,ALUResult_EX3,ALUResult_EX4,ALUResult_EX5,ALUResult_EX6,ALUResult_EX7,
             sadMUX_regwrite_value, sadMUX_regwrite_value_MEM, MemToReg_WB_MUX, forward_rs_value, ALU_input_rs);
                      
	input [31:0] rs_value_EX,ALUResult_EX3,ALUResult_EX4,ALUResult_EX5,ALUResult_EX6,ALUResult_EX7,
             sadMUX_regwrite_value, sadMUX_regwrite_value_MEM,MemToReg_WB_MUX;	    // inputs
	
	input [3:0] ALU_input_rs;

	wire [31:0] default_EX3,EX4_EX5,EX6_EX7,EX8_EX9,MUX_1_2,MUX_3_4,MUX_5_6;
	// MUX SIGNAL KEY:
    // 0000 --> default
    // 0001 --> EX3
    // 0010 --> EX4
    // 0011 --> EX5
    // 0100 --> EX6
    // 0101 --> EX7
    // 0110 --> EX8
    // 0111 --> forwarding from Memory
    // 1000 --> forwarding from WriteBack

	output wire [31:0] forward_rs_value;	// answer
	
				//  out, a, b, sel
		Mux32Bit2To1 MUX_1(default_EX3, rs_value_EX, ALUResult_EX3, ALU_input_rs[0]);
		Mux32Bit2To1 MUX_2(EX4_EX5, ALUResult_EX4, ALUResult_EX5, ALU_input_rs[0]);
		Mux32Bit2To1 MUX_3(EX6_EX7, ALUResult_EX6, ALUResult_EX7, ALU_input_rs[0]);
		Mux32Bit2To1 MUX_4(EX8_EX9, sadMUX_regwrite_value, sadMUX_regwrite_value_MEM, ALU_input_rs[0]);

		Mux32Bit2To1 MUX_5(MUX_1_2, EX6_EX7, EX8_EX9, ALU_input_rs[1]);
		Mux32Bit2To1 MUX_6(MUX_3_4, default_EX3, EX4_EX5, ALU_input_rs[1]);

		Mux32Bit2To1 MUX_7(MUX_5_6, MUX_1_2, MUX_3_4, ALU_input_rs[2]);

		Mux32Bit2To1 MUX_8(forward_rs_value, MemToReg_WB_MUX, ALU_input_rs[3]);
		


	
endmodule