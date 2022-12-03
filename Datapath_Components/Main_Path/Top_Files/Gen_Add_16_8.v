//8th operation used for calculating generate_window
`timescale 1ns / 1ps

module Gen_Add_16_8(check_wcol_out, add7_out_1,add7_out_2, add7_out_3, add7_out_4, 
                Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9,Out10,Out11,Out12,Out13,Out14,Out15,Out16);

	input [1:0] check_wcol_out; // control bits for ALU operation
                      
	input [31:0] add7_out_1,add7_out_2, add7_out_3, add7_out_4;	    // inputs
	wire [31:0] out_mux1,out_mux2,out_mux3,out_mux4,out_mux5,out_mux6,out_mux7,out_mux8,out_mux9,out_mux10,out_mux12,out_mux13
				,out_mux14,out_mux15,out_mux16;
	output wire [31:0] Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9,Out10,Out11,Out12,Out13,Out14,Out15,Out16;	// answer
	
				//                A, B, C, out, sel
		Mux32Bit3To1 MUX_1(0, 0, 0, out_mux1, check_wcol_out);
		Mux32Bit3To1 MUX_2(1, 1, 1, out_mux2, check_wcol_out);
		Mux32Bit3To1 MUX_3(2, 2, 2, out_mux3, check_wcol_out);
		Mux32Bit3To1 MUX_4(3, 3, 3, out_mux4, check_wcol_out);
		//first four are consistent
		Mux32Bit3To1 MUX_5(0, 4, 4, out_mux5, check_wcol_out);
		Mux32Bit3To1 MUX_6(1, 5, 5, out_mux6, check_wcol_out);
		Mux32Bit3To1 MUX_7(2, 6, 6, out_mux7, check_wcol_out);
		Mux32Bit3To1 MUX_8(3, 7, 7, out_mux8, check_wcol_out);
		//second four have 2 inputs consistent
		Mux32Bit3To1 MUX_9(0, 0, 8, out_mux9, check_wcol_out);
		Mux32Bit3To1 MUX_10(1, 1, 9, out_mux10, check_wcol_out);
		Mux32Bit3To1 MUX_11(2, 2, 10, out_mux11, check_wcol_out);
		Mux32Bit3To1 MUX_12(3, 3, 11, out_mux12, check_wcol_out);
		//third four have all inputs different
		Mux32Bit3To1 MUX_13(0, 4, 12, out_mux13, check_wcol_out);
		Mux32Bit3To1 MUX_14(1, 5, 13, out_mux14, check_wcol_out);
		Mux32Bit3To1 MUX_15(2, 6, 14, out_mux15, check_wcol_out);
		Mux32Bit3To1 MUX_16(3, 7, 15, out_mux16, check_wcol_out);
		//fourth four have all inputs different

		Adder32Bit Adder32Bit_1(out_mux1, add7_out_1, Out1);
		Adder32Bit Adder32Bit_2(out_mux2, add7_out_1, Out2);
		Adder32Bit Adder32Bit_3(out_mux3, add7_out_1, Out3);
		Adder32Bit Adder32Bit_4(out_mux4, add7_out_1, Out4);
		//First four
		Adder32Bit Adder32Bit_5(out_mux5, add7_out_2, Out5);
		Adder32Bit Adder32Bit_6(out_mux6, add7_out_2, Out6);
		Adder32Bit Adder32Bit_7(out_mux7, add7_out_2, Out7);
		Adder32Bit Adder32Bit_8(out_mux8, add7_out_2, Out8);
		//second four
		Adder32Bit Adder32Bit_9(out_mux9, add7_out_3, Out9);
		Adder32Bit Adder32Bit_10(out_mux10, add7_out_3, Out10);
		Adder32Bit Adder32Bit_11(out_mux11, add7_out_3, Out11);
		Adder32Bit Adder32Bit_12(out_mux12, add7_out_3, Out12);
		//third four
		Adder32Bit Adder32Bit_13(out_mux13, add7_out_4, Out13);
		Adder32Bit Adder32Bit_14(out_mux14, add7_out_4, Out14);
		Adder32Bit Adder32Bit_15(out_mux15, add7_out_4, Out15);
		Adder32Bit Adder32Bit_16(out_mux16, add7_out_4, Out16);
		//fourth four



	
endmodule