//The adder that allows the memmory to pull from 16 locations of the memmory
`timescale 1ns / 1ps

module RegisterFile_ID(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, 
						ReadData1, ReadData2,ReadData3, ReadData4,ReadData5, ReadData6,ReadData7, 
						ReadData8,ReadData9, ReadData10,ReadData11, ReadData12);

	input Clk, RegWrite;
	input [4:0] ReadRegister1;
	input [4:0] ReadRegister2;
	input [4:0] WriteRegister;
	input [31:0] WriteData;
	
	output wire [31:0] ReadData1, ReadData2,ReadData3, ReadData4,ReadData5, ReadData6,ReadData7, 
						ReadData8,ReadData9, ReadData10,ReadData11, ReadData12;
	

        RegisterFile Default(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2);
										//16,17,18,9,20,21,22,23,8,5 right to left read register values
		RegisterFile numrow_cdif_s0_s1(5'b10000, 5'b10001, WriteRegister, WriteData, RegWrite, Clk, ReadData3, ReadData4);
		RegisterFile iterator_sad_s2_t1(5'b10010, 5'b01001, WriteRegister, WriteData, RegWrite, Clk, ReadData5, ReadData6);
		
		RegisterFile frow_wcol_s4_s5(5'b10100, 5'b10101, WriteRegister, WriteData, RegWrite, Clk, ReadData7, ReadData8);
		RegisterFile x_y_s6_s7(5'b10110, 5'b10111, WriteRegister, WriteData, RegWrite, Clk, ReadData9, ReadData10);
		RegisterFile targetwindow_frame_t0_a1(5'b01000, 5'b00101, WriteRegister, WriteData, RegWrite, Clk, ReadData11, ReadData12);

		







	
endmodule