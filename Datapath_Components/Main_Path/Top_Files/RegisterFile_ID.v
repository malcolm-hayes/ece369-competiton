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

		RegisterFile numrow_cdif_s0_s1(16, 17, WriteRegister, WriteData, RegWrite, Clk, ReadData3, ReadData4);
		RegisterFile iterator_sad_s2_t1(18, 9, WriteRegister, WriteData, RegWrite, Clk, ReadData5, ReadData6);
		
		RegisterFile frow_wcol_s4_s5(20, 21, WriteRegister, WriteData, RegWrite, Clk, ReadData7, ReadData8);
		RegisterFile x_y_s6_s7(22, 23, WriteRegister, WriteData, RegWrite, Clk, ReadData9, ReadData10);
		RegisterFile targetwindow_frame_t0_a1(8, 5, WriteRegister, WriteData, RegWrite, Clk, ReadData11, ReadData12);

		







	
endmodule