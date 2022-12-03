//8th operation used for calculating generate_window
`timescale 1ns / 1ps

module Memmory_16(Clk, Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9,Out10,Out11,Out12,Out13,Out14,Out15,Out16,
                ReadData1,ReadData2,ReadData3,ReadData4,ReadData5,ReadData6,ReadData7,ReadData8,ReadData9,ReadData10,
                ReadData11,ReadData12,ReadData13,ReadData14,ReadData15,ReadData16);

	input [1:0] check_wcol_out; // control bits for ALU operation
                      
	input signed [31:0] A, B;	    // inputs

	output reg [31:0] Out;	// answer
	
//      BaseAddress, WriteData, Clk, MemWrite, MemRead, ReadData
        DataMemory DataMemory_1(Out1, 0, Clk, 0, 1, ReadData1);
        DataMemory DataMemory_2(Out2, 0, Clk, 0, 1, ReadData2);
        DataMemory DataMemory_3(Out3, 0, Clk, 0, 1, ReadData3);
        DataMemory DataMemory_4(Out4, 0, Clk, 0, 1, ReadData4);

        DataMemory DataMemory_5(Out5, 0, Clk, 0, 1, ReadData5);
        DataMemory DataMemory_6(Out6, 0, Clk, 0, 1, ReadData6);
        DataMemory DataMemory_7(Out7, 0, Clk, 0, 1, ReadData7);
        DataMemory DataMemory_8(Out8, 0, Clk, 0, 1, ReadData8);

        DataMemory DataMemory_9(Out9, 0, Clk, 0, 1, ReadData9);
        DataMemory DataMemory_10(Out10, 0, Clk, 0, 1, ReadData10);
        DataMemory DataMemory_11(Out11, 0, Clk, 0, 1, ReadData11);
        DataMemory DataMemory_12(Out12, 0, Clk, 0, 1, ReadData12);

        DataMemory DataMemory_13(Out13, 0, Clk, 0, 1, ReadData13);
        DataMemory DataMemory_14(Out14, 0, Clk, 0, 1, ReadData14);
        DataMemory DataMemory_15(Out15, 0, Clk, 0, 1, ReadData15);
        DataMemory DataMemory_16(Out16, 0, Clk, 0, 1, ReadData16);
        


//Maybe hardcode clock as 1 or 0 to save usage or something

	
endmodule