`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - CheckWindowColumns.v
// Description - Controls the ALUs that determin the loads from the frame.
//
// FUNCTIONALITY:-
////////////////////////////////////////////////////////////////////////////////

module CheckWindowColumns(window_columns, check_wcol_out);
    input [31:0] window_columns;
    output reg [1:0] check_wcol_out;
    // check_wcol_out = 0 for 4
    //                = 1 for 8
    //                = 2 for 16

    if (window_columns == 4){
        check_wcol_out = 0;
    }
	else if (window_columns == 8){
        check_wcol_out = 1;
    }
    else if (window_columns == 16){
        check_wcol_out = 2;
    }

	
endmodule

