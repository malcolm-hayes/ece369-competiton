`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - MoveCheck.v
////////////////////////////////////////////////////////////////////////////////

module MoveCheck(x, y, cdif, move,outValue,outRegister);
    input [31:0] x,y, cdif;
    input move;
    output reg [31:0] outValue;
    output reg outRegister;
    //x = 0(rt), y = 1(rd)
    
    //possibly change to output signals that are controlled by adders
    initial begin
        outValue <= 0;
        outRegister <= 0;
    end
    always @(*)begin
    if (move)begin
    if ((x != cdif) && (y[0] == 1))begin
        outValue <= x+1;
        outRegister <= 0;
    end
    else if ((x == cdif) && (y[0] == 1))begin
        outValue <= y+1;
        outRegister <= 1;
    end
    else if ((x != 0) && (y[0] == 0))begin
        outValue <= x-1;
        outRegister <= 0;
    end
    else if ((x == 0) && (y[0] == 0))begin
        outValue <= y+1;
        outRegister <= 1;
    end
    end
    else begin
        outValue <= 0;
        outRegister <= 0;
    end
    end    
	
endmodule

