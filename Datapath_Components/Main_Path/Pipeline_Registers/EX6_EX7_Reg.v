`timescale 1ns / 1ps

module EX6_EX7_Reg(ALUResult_EX6, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX6,*/
    RegDst1Result_EX6, /*Zero_MEM,*/ MemWrite_EX6, MemToReg_EX6, MemRead_EX6, /*Branch_MEM,*/ RegWrite_EX6, 
    jal_EX6, Jump_EX6, JR_EX6, JumpPC_EX6, rs_value_EX6, rt_value_EX6,Clk, Reset
    //EX7
    ALUResult_EX7, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX7,*/
    RegDst1Result_EX7, /*Zero_MEM,*/ MemWrite_EX7, MemToReg_EX7, MemRead_EX7, /*Branch_MEM,*/ RegWrite_EX7, 
    jal_EX7, Jump_EX7, JR_EX7, JumpPC_EX7, rs_value_EX7,rt_value_EX7,
    //registers for custom instruction EX6
    t1_sad_value_EX6, outx_EX6, outy_EX6,sad_EX6
    sOut1,sOut2,sOut3,sOut4,sOut5,sOut6,sOut7,sOut8,
    //registers for custom instruction EX7
    t1_sad_value_EX7, outx_EX7, outy_EX7,sad_EX7
    sOut1_EX7,sOut2_EX7,sOut3_EX7,sOut4_EX7,sOut5_EX7,sOut6_EX7,sOut7_EX7,sOut8_EX7
    );

input [31:0] ALUResult_EX6, /* rt_Register_Value_EX,*/ rs_value_EX6, rt_value_EX6;
input [4:0] RegDst1Result_EX6;
input MemWrite_EX6, MemToReg_EX6, MemRead_EX6, RegWrite_EX6, jal_EX6, Jump_EX6, JR_EX6, JumpPC_EX6;
input Clk, Reset;

output reg [31:0] ALUResult_EX7, /* rt_Register_Value_EX2,*/ rs_value_EX7, rt_value_EX7;
output reg [4:0] RegDst1Result_EX7;
output reg MemWrite_EX7, MemToReg_EX7, MemRead_EX7, RegWrite_EX7, jal_EX7, Jump_EX7, JR_EX7, JumpPC_EX7;

// custom instruction
input [31:0] t1_sad_value_EX6, outx_EX6, outy_EX6,sad_EX6
    sOut1,sOut2,sOut3,sOut4,sOut5,sOut6,sOut7,sOut8;

output reg [31:0] t1_sad_value_EX7, outx_EX7, outy_EX7,sad_EX7
    sOut1_EX7,sOut2_EX7,sOut3_EX7,sOut4_EX7,sOut5_EX7,sOut6_EX7,sOut7_EX7,sOut8_EX7;

initial begin
    ALUResult_EX7 <= 0;
//  rt_Register_Value_EX <= 0;
    rs_value_EX7 <= 0;
    rt_value_EX7 <= 0;
    RegDst1Result_EX7 <= 0;
    MemWrite_EX7 <= 0;
    MemToReg_EX7 <= 0;
    MemRead_EX7 <= 0;
    RegWrite_EX7 <= 0;
    jal_EX7 <= 0;
    Jump_EX7 <= 0;
    JR_EX7 <= 0;
    JumpPC_EX7 <= 0;

    t1_sad_value_EX7 <= 0;
    t0_target_value_EX7 <= 0;
    outx_EX7 <= 0;
    outy_EX7 <= 0;
    sad_EX7 <= 0;

    sOut1_EX7 <= 0;
    sOut2_EX7 <= 0;
    sOut3_EX7 <= 0;
    sOut4_EX7 <= 0;
    sOut5_EX7 <= 0;
    sOut6_EX7 <= 0;
    sOut7_EX7 <= 0;
    sOut8_EX7 <= 0;
end

always @(posedge Clk) begin
    
    if (Reset == 1)begin
    ALUResult_EX7 <= 0;
//  rt_Register_Value_EX <= 0;
    rs_value_EX7 <= 0;
    rt_value_EX7 <= 0;
    RegDst1Result_EX7 <= 0;
    MemWrite_EX7 <= 0;
    MemToReg_EX7 <= 0;
    MemRead_EX7 <= 0;
    RegWrite_EX7 <= 0;
    jal_EX7 <= 0;
    Jump_EX7 <= 0;
    JR_EX7 <= 0;
    JumpPC_EX7 <= 0;

    t1_sad_value_EX7 <= 0;
    t0_target_value_EX7 <= 0;
    outx_EX7 <= 0;
    outy_EX7 <= 0;
    sad_EX7 <= 0;

    sOut1_EX7 <= 0;
    sOut2_EX7 <= 0;
    sOut3_EX7 <= 0;
    sOut4_EX7 <= 0;
    sOut5_EX7 <= 0;
    sOut6_EX7 <= 0;
    sOut7_EX7 <= 0;
    sOut8_EX7 <= 0;
    end
    else begin
    ALUResult_EX7 <= ALUResult_EX6;
//  rt_Register_Value_EX2 <= rt_Register_Value_EX1;
    rs_value_EX7 <= rs_value_EX6;
    rt_value_EX7 <= rt_value_EX6;
    RegDst1Result_EX7 <= RegDst1Result_EX6;
    MemWrite_EX7 <= MemWrite_EX6;
    MemToReg_EX7 <= MemToReg_EX6;
    MemRead_EX7 <= MemRead_EX6;
    RegWrite_EX7 <= RegWrite_EX6;
    jal_EX7 <= jal_EX6;
    Jump_EX7 <= Jump_EX6;
    JR_EX7 <= JR_EX6;
    JumpPC_EX7 <= JumpPC_EX6;

    t1_sad_value_EX7 <= t1_sad_value_EX6;
    t0_target_value_EX7 <= t0_target_value_EX6;
    outx_EX7 <= outx_EX6;
    outy_EX7 <= outy_EX6;
    sad_EX7 <= sad_EX6;

    sOut1_EX7 <= sOut1;
    sOut2_EX7 <= sOut2;
    sOut3_EX7 <= sOut3;
    sOut4_EX7 <= sOut4;
    sOut5_EX7 <= sOut5;
    sOut6_EX7 <= sOut6;
    sOut7_EX7 <= sOut7;
    sOut8_EX7 <= sOut8;
    end
    
end

endmodule
