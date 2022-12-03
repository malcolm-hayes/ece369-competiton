`timescale 1ns / 1ps

module EX5_EX6_Reg(RegWrite_ID, RegDst_ID, ALUOp_ID,
 ALUSrc_ID, /*Branch_ID,*/ MemWrite_ID, MemToReg_ID, MemRead_ID, 
 rs_value_ID, rt_value_ID, Immediate_ID, rs_address_ID, rt_address_ID, rd_address_ID, /*PCAddresult_ID,*/ jal_ID, Jump_ID, JR_ID, JumpPC_ID,
 RegWrite_EX, RegDst_EX, ALUOp_EX,
 ALUSrc_EX, /*Branch_EX,*/ MemWrite_EX, MemToReg_EX, MemRead_EX, 
 rs_value_EX, rt_value_EX, Immediate_EX, rs_address_EX, rt_address_EX, rd_address_EX, /*PCAddresult_EX,*/ jal_EX, Jump_EX, JR_EX, JumpPC_EX, ControlMuxSig,Clk, Reset); 

input [31:0] ;
input [4:0] ;
input Clk, Reset;

output reg [31:0] ;

input Reset;
input Clk;  // each pipeline register should be clocked

 initial begin
     
 end

always @(posedge Clk) begin
    
    if (Reset == 1)begin
    
    end
    else begin
    
    end
    
end

endmodule
