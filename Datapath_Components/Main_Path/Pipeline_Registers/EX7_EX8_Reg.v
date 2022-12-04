`timescale 1ns / 1ps

module EX7_EX8_Reg(ALUResult_EX7, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX7,*/
    RegDst1Result_EX7, /*Zero_MEM,*/ MemWrite_EX7, MemToReg_EX7, MemRead_EX7, /*Branch_MEM,*/ RegWrite_EX7, 
    jal_EX7, Jump_EX7, JR_EX7, JumpPC_EX7, rs_value_EX7, rt_value_EX7,Clk, Reset,
    //EX8
    ALUResult_EX8, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX8,*/
    RegDst1Result_EX8, /*Zero_MEM,*/ MemWrite_EX8, MemToReg_EX8, MemRead_EX8, /*Branch_MEM,*/ RegWrite_EX8, 
    jal_EX8, Jump_EX8, JR_EX8, JumpPC_EX8, rs_value_EX8,rt_value_EX8,
    //registers for custom instruction EX7
    t1_sad_value_EX7, outx_EX7, outy_EX7,sad_EX7,
    foOut1,foOut2,
    //registers for custom instruction EX8
    t1_sad_value_EX8, outx_EX8, outy_EX8,sad_EX8,
    foOut1_EX8,foOut2_EX8
    );

input [31:0] ALUResult_EX7, /* rt_Register_Value_EX,*/ rs_value_EX7, rt_value_EX7;
input [4:0] RegDst1Result_EX7;
input MemWrite_EX7, MemToReg_EX7, MemRead_EX7, RegWrite_EX7, jal_EX7, Jump_EX7, JR_EX7, JumpPC_EX7;
input Clk, Reset;

output reg [31:0] ALUResult_EX8, /* rt_Register_Value_EX2,*/ rs_value_EX8, rt_value_EX8;
output reg [4:0] RegDst1Result_EX8;
output reg MemWrite_EX8, MemToReg_EX8, MemRead_EX8, RegWrite_EX8, jal_EX8, Jump_EX8, JR_EX8, JumpPC_EX8;

// custom instruction
input [31:0] t1_sad_value_EX7, outx_EX7, outy_EX7,sad_EX7,
    foOut1,foOut2;

output reg [31:0] t1_sad_value_EX8, outx_EX8, outy_EX8,sad_EX8,
    foOut1_EX8,foOut2_EX8;

 initial begin
    ALUResult_EX8 <= 0;
//  rt_Register_Value_EX <= 0;
    rs_value_EX8 <= 0;
    rt_value_EX8 <= 0;
    RegDst1Result_EX8 <= 0;
    MemWrite_EX8 <= 0;
    MemToReg_EX8 <= 0;
    MemRead_EX8 <= 0;
    RegWrite_EX8 <= 0;
    jal_EX8 <= 0;
    Jump_EX8 <= 0;
    JR_EX8 <= 0;
    JumpPC_EX8 <= 0;

    t1_sad_value_EX8 <= 0;
    //t0_target_value_EX8 <= 0;
    outx_EX8 <= 0;
    outy_EX8 <= 0;
    sad_EX8 <= 0;

    foOut1_EX8 <= 0;
    foOut2_EX8 <= 0;
 end

always @(posedge Clk) begin
    
    if (Reset == 1)begin
    ALUResult_EX8 <= 0;
//  rt_Register_Value_EX <= 0;
    rs_value_EX8 <= 0;
    rt_value_EX8 <= 0;
    RegDst1Result_EX8 <= 0;
    MemWrite_EX8 <= 0;
    MemToReg_EX8 <= 0;
    MemRead_EX8 <= 0;
    RegWrite_EX8 <= 0;
    jal_EX8 <= 0;
    Jump_EX8 <= 0;
    JR_EX8 <= 0;
    JumpPC_EX8 <= 0;

    t1_sad_value_EX8 <= 0;
    //t0_target_value_EX8 <= 0;
    outx_EX8 <= 0;
    outy_EX8 <= 0;
    sad_EX8 <= 0;

    foOut1_EX8 <= 0;
    foOut2_EX8 <= 0;
    end
    else begin
    ALUResult_EX8 <= ALUResult_EX7;
//  rt_Register_Value_EX2 <= rt_Register_Value_EX1;
    rs_value_EX8 <= rs_value_EX7;
    rt_value_EX8 <= rt_value_EX7;
    RegDst1Result_EX8 <= RegDst1Result_EX7;
    MemWrite_EX8 <= MemWrite_EX7;
    MemToReg_EX8 <= MemToReg_EX7;
    MemRead_EX8 <= MemRead_EX7;
    RegWrite_EX8 <= RegWrite_EX7;
    jal_EX8 <= jal_EX7;
    Jump_EX8 <= Jump_EX7;
    JR_EX8 <= JR_EX7;
    JumpPC_EX8 <= JumpPC_EX7;

    t1_sad_value_EX8 <= t1_sad_value_EX7;
    //t0_target_value_EX8 <= t0_target_value_EX7;
    outx_EX8 <= outx_EX7;
    outy_EX8 <= outy_EX7;
    sad_EX8 <= sad_EX7;

    foOut1_EX8 <= foOut1;
    foOut2_EX8 <= foOut2;
    end
    
end

endmodule
