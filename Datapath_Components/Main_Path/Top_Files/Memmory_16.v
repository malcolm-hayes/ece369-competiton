//8th operation used for calculating generate_window
`timescale 1ns / 1ps

module Memmory_16(Clk, Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9,Out10,Out11,Out12,Out13,Out14,Out15,Out16,
                ReadData1,ReadData2,ReadData3,ReadData4,ReadData5,ReadData6,ReadData7,ReadData8,ReadData9,ReadData10,
                ReadData11,ReadData12,ReadData13,ReadData14,ReadData15,ReadData16,
                WriteData, MemWrite, MemRead);
    input Clk;
    input [1:0] MemWrite, MemRead;                  
    input [31:0] Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9,Out10,Out11,Out12,Out13,Out14,Out15,Out16;
	output wire [31:0] ReadData1,ReadData2,ReadData3,ReadData4,ReadData5,ReadData6,ReadData7,ReadData8,ReadData9,ReadData10,
                ReadData11,ReadData12,ReadData13,ReadData14,ReadData15,ReadData16;	// answer

    input [31:0] WriteData;
	
//      BaseAddress, WriteData, Clk, MemWrite, MemRead, ReadData
        DataMemory DataMemory_1(Out1, WriteData, Clk, MemWrite, MemRead, ReadData1);
        DataMemory DataMemory_2(Out2, WriteData, Clk, MemWrite, MemRead, ReadData2);
        DataMemory DataMemory_3(Out3, WriteData, Clk, MemWrite, MemRead, ReadData3);
        DataMemory DataMemory_4(Out4, WriteData, Clk, MemWrite, MemRead, ReadData4);

        DataMemory DataMemory_5(Out5, WriteData, Clk, MemWrite, MemRead, ReadData5);
        DataMemory DataMemory_6(Out6, WriteData, Clk, MemWrite, MemRead, ReadData6);
        DataMemory DataMemory_7(Out7, WriteData, Clk, MemWrite, MemRead, ReadData7);
        DataMemory DataMemory_8(Out8, WriteData, Clk, MemWrite, MemRead, ReadData8);

        DataMemory DataMemory_9(Out9, WriteData, Clk, MemWrite, MemRead, ReadData9);
        DataMemory DataMemory_10(Out10, WriteData, Clk, MemWrite, MemRead, ReadData10);
        DataMemory DataMemory_11(Out11, WriteData, Clk, MemWrite, MemRead, ReadData11);
        DataMemory DataMemory_12(Out12, WriteData, Clk, MemWrite, MemRead, ReadData12);

        DataMemory DataMemory_13(Out13, WriteData, Clk, MemWrite, MemRead, ReadData13);
        DataMemory DataMemory_14(Out14, WriteData, Clk, MemWrite, MemRead, ReadData14);
        DataMemory DataMemory_15(Out15, WriteData, Clk, MemWrite, MemRead, ReadData15);
        DataMemory DataMemory_16(Out16, WriteData, Clk, MemWrite, MemRead, ReadData16);
        


//Maybe hardcode clock as 1 or 0 to save usage or something

	
endmodule