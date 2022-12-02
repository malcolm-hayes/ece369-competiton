//The adder that allows the memmory to pull from 16 locations of the memmory
`timescale 1ns / 1ps

module Target_Add_16(target_window,
                Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9,Out10,Out11,Out12,Out13,Out14,Out15,Out16);

	input [1:0] check_wcol_out; // control bits for ALU operation
                      
	input signed [31:0] A, B;	    // inputs

	output reg [31:0] Out;	// answer
	

        

		Adder32Bit Adder32Bit_1(target_window, 0, Out1);
		Adder32Bit Adder32Bit_2(target_window, 4, Out2);
		Adder32Bit Adder32Bit_3(target_window, 8, Out3);
		Adder32Bit Adder32Bit_4(target_window, 12, Out4);
		//First four
		Adder32Bit Adder32Bit_5(target_window, 16, Out5);
		Adder32Bit Adder32Bit_6(target_window, 20, Out6);
		Adder32Bit Adder32Bit_7(target_window, 24, Out7);
		Adder32Bit Adder32Bit_8(target_window, 28, Out8);
		//second four
		Adder32Bit Adder32Bit_9(target_window, 32, Out9);
		Adder32Bit Adder32Bit_10(target_window, 36, Out10);
		Adder32Bit Adder32Bit_11(target_window, 40, Out11);
		Adder32Bit Adder32Bit_12(target_window, 44, Out12);
		//third four
		Adder32Bit Adder32Bit_13(target_window, 48, Out13);
		Adder32Bit Adder32Bit_14(target_window, 52, Out14);
		Adder32Bit Adder32Bit_15(target_window, 56, Out15);
		Adder32Bit Adder32Bit_16(target_window, 60, Out16);
		//fourth four

        //possible take from a different register than a1, that would require resetting the register after each 
        //completed loop, and Out16 can be stored into it intermediately.
		//Out 16 will be the input as the target window



	
endmodule