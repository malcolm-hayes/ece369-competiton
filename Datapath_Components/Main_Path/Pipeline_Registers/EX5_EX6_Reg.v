`timescale 1ns / 1ps

module EX5_EX6_Reg(ALUResult_EX5, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX5,*/
    RegDst1Result_EX5, /*Zero_MEM,*/ MemWrite_EX5, MemToReg_EX5, MemRead_EX5, /*Branch_MEM,*/ RegWrite_EX5, 
    jal_EX5, Jump_EX5, JR_EX5, JumpPC_EX5, rs_value_EX5, rt_value_EX5,Clk, Reset,
    //EX6
    ALUResult_EX6, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX6,*/
    RegDst1Result_EX6, /*Zero_MEM,*/ MemWrite_EX6, MemToReg_EX6, MemRead_EX6, /*Branch_MEM,*/ RegWrite_EX6, 
    jal_EX6, Jump_EX6, JR_EX6, JumpPC_EX6, rs_value_EX6,rt_value_EX6,
    //registers for custom instruction EX5
    t1_sad_value_EX5, outx_EX5, outy_EX5,sad_EX5,
    ReadData1,ReadData2,ReadData3,ReadData4,ReadData5,ReadData6,ReadData7,ReadData8,ReadData9,ReadData10,
    ReadData11,ReadData12,ReadData13,ReadData14,ReadData15,ReadData16,
    tReadData1,tReadData2,tReadData3,tReadData4,tReadData5,tReadData6,tReadData7,tReadData8,tReadData9,tReadData10,
    tReadData11,tReadData12,tReadData13,tReadData14,tReadData15,tReadData16,
    //registers for custom instruction EX6
    t1_sad_value_EX6, outx_EX6, outy_EX6,sad_EX6,
    ReadData1_EX6,ReadData2_EX6,ReadData3_EX6,ReadData4_EX6,ReadData5_EX6,ReadData6_EX6,ReadData7_EX6,ReadData8_EX6,ReadData9_EX6,
    ReadData10_EX6,ReadData11_EX6,ReadData12_EX6,ReadData13_EX6,ReadData14_EX6,ReadData15_EX6,ReadData16_EX6,
    tReadData1_EX6,tReadData2_EX6,tReadData3_EX6,tReadData4_EX6,tReadData5_EX6,tReadData6_EX6,tReadData7_EX6,tReadData8_EX6,
    tReadData9_EX6,tReadData10_EX6, tReadData11_EX6,tReadData12_EX6,tReadData13_EX6,tReadData14_EX6,tReadData15_EX6,tReadData16_EX6,
    //EXTRA ADDITIONS
    rs_address_EX5,rs_address_EX6
    );

input [31:0] ALUResult_EX5, /* rt_Register_Value_EX,*/ rs_value_EX5, rt_value_EX5, JumpPC_EX5;
input [4:0] RegDst1Result_EX5,rs_address_EX5;
input [1:0] MemWrite_EX5, MemRead_EX5;
input MemToReg_EX5, RegWrite_EX5, jal_EX5, Jump_EX5, JR_EX5,sad_EX5;
input Clk, Reset;

output reg [31:0] ALUResult_EX6, /* rt_Register_Value_EX2,*/ rs_value_EX6, rt_value_EX6, JumpPC_EX6;
output reg [4:0] RegDst1Result_EX6,rs_address_EX6;
output reg [1:0] MemWrite_EX6, MemRead_EX6;
output reg MemToReg_EX6, RegWrite_EX6, jal_EX6, Jump_EX6, JR_EX6,sad_EX6;

// custom instruction
input [31:0] t1_sad_value_EX5, outx_EX5, outy_EX5,
    ReadData1,ReadData2,ReadData3,ReadData4,ReadData5,ReadData6,ReadData7,ReadData8,ReadData9,ReadData10,
    ReadData11,ReadData12,ReadData13,ReadData14,ReadData15,ReadData16,
    tReadData1,tReadData2,tReadData3,tReadData4,tReadData5,tReadData6,tReadData7,tReadData8,tReadData9,tReadData10,
    tReadData11,tReadData12,tReadData13,tReadData14,tReadData15,tReadData16;

output reg [31:0] t1_sad_value_EX6, outx_EX6, outy_EX6,
    ReadData1_EX6,ReadData2_EX6,ReadData3_EX6,ReadData4_EX6,ReadData5_EX6,ReadData6_EX6,ReadData7_EX6,ReadData8_EX6,ReadData9_EX6,
    ReadData10_EX6,ReadData11_EX6,ReadData12_EX6,ReadData13_EX6,ReadData14_EX6,ReadData15_EX6,ReadData16_EX6,
    tReadData1_EX6,tReadData2_EX6,tReadData3_EX6,tReadData4_EX6,tReadData5_EX6,tReadData6_EX6,tReadData7_EX6,tReadData8_EX6,
    tReadData9_EX6,tReadData10_EX6, tReadData11_EX6,tReadData12_EX6,tReadData13_EX6,tReadData14_EX6,tReadData15_EX6,tReadData16_EX6;

initial begin
    ALUResult_EX6 <= 0;
//  rt_Register_Value_EX <= 0;
    rs_value_EX6 <= 0;
    rt_value_EX6 <= 0;
    RegDst1Result_EX6 <= 0;
    MemWrite_EX6 <= 0;
    MemToReg_EX6 <= 0;
    MemRead_EX6 <= 0;
    RegWrite_EX6 <= 0;
    jal_EX6 <= 0;
    Jump_EX6 <= 0;
    JR_EX6 <= 0;
    JumpPC_EX6 <= 0;

    t1_sad_value_EX6 <= 0;
    //t0_target_value_EX6 <= 0;
    outx_EX6 <= 0;
    outy_EX6 <= 0;
    sad_EX6 <= 0;

    ReadData1_EX6 <= 0;
    ReadData2_EX6 <= 0;
    ReadData3_EX6 <= 0;
    ReadData4_EX6 <= 0;
    ReadData5_EX6 <= 0;
    ReadData6_EX6 <= 0;
    ReadData7_EX6 <= 0;
    ReadData8_EX6 <= 0;
    ReadData9_EX6 <= 0;
    ReadData10_EX6 <= 0;
    ReadData11_EX6 <= 0;
    ReadData12_EX6 <= 0;
    ReadData13_EX6 <= 0;
    ReadData14_EX6 <= 0;
    ReadData15_EX6 <= 0;
    ReadData16_EX6 <= 0;

    tReadData1_EX6 <= 0;
    tReadData2_EX6 <= 0;
    tReadData3_EX6 <= 0;
    tReadData4_EX6 <= 0;
    tReadData5_EX6 <= 0;
    tReadData6_EX6 <= 0;
    tReadData7_EX6 <= 0;
    tReadData8_EX6 <= 0;
    tReadData9_EX6 <= 0;
    tReadData10_EX6 <= 0;
    tReadData11_EX6 <= 0;
    tReadData12_EX6 <= 0;
    tReadData13_EX6 <= 0;
    tReadData14_EX6 <= 0;
    tReadData15_EX6 <= 0;
    tReadData16_EX6 <= 0;

    rs_address_EX6 <= 0;
end

always @(posedge Clk) begin
    
    if (Reset == 1)begin
    ALUResult_EX6 <= 0;
//  rt_Register_Value_EX <= 0;
    rs_value_EX6 <= 0;
    rt_value_EX6 <= 0;
    RegDst1Result_EX6 <= 0;
    MemWrite_EX6 <= 0;
    MemToReg_EX6 <= 0;
    MemRead_EX6 <= 0;
    RegWrite_EX6 <= 0;
    jal_EX6 <= 0;
    Jump_EX6 <= 0;
    JR_EX6 <= 0;
    JumpPC_EX6 <= 0;

    t1_sad_value_EX6 <= 0;
    //t0_target_value_EX6 <= 0;
    outx_EX6 <= 0;
    outy_EX6 <= 0;
    sad_EX6 <= 0;

    ReadData1_EX6 <= 0;
    ReadData2_EX6 <= 0;
    ReadData3_EX6 <= 0;
    ReadData4_EX6 <= 0;
    ReadData5_EX6 <= 0;
    ReadData6_EX6 <= 0;
    ReadData7_EX6 <= 0;
    ReadData8_EX6 <= 0;
    ReadData9_EX6 <= 0;
    ReadData10_EX6 <= 0;
    ReadData11_EX6 <= 0;
    ReadData12_EX6 <= 0;
    ReadData13_EX6 <= 0;
    ReadData14_EX6 <= 0;
    ReadData15_EX6 <= 0;
    ReadData16_EX6 <= 0;

    tReadData1_EX6 <= 0;
    tReadData2_EX6 <= 0;
    tReadData3_EX6 <= 0;
    tReadData4_EX6 <= 0;
    tReadData5_EX6 <= 0;
    tReadData6_EX6 <= 0;
    tReadData7_EX6 <= 0;
    tReadData8_EX6 <= 0;
    tReadData9_EX6 <= 0;
    tReadData10_EX6 <= 0;
    tReadData11_EX6 <= 0;
    tReadData12_EX6 <= 0;
    tReadData13_EX6 <= 0;
    tReadData14_EX6 <= 0;
    tReadData15_EX6 <= 0;
    tReadData16_EX6 <= 0;

    rs_address_EX6 <= 0;
    end
    else begin
    ALUResult_EX6 <= ALUResult_EX5;
//  rt_Register_Value_EX2 <= rt_Register_Value_EX1;
    rs_value_EX6 <= rs_value_EX5;
    rt_value_EX6 <= rt_value_EX5;
    RegDst1Result_EX6 <= RegDst1Result_EX5;
    MemWrite_EX6 <= MemWrite_EX5;
    MemToReg_EX6 <= MemToReg_EX5;
    MemRead_EX6 <= MemRead_EX5;
    RegWrite_EX6 <= RegWrite_EX5;
    jal_EX6 <= jal_EX5;
    Jump_EX6 <= Jump_EX5;
    JR_EX6 <= JR_EX5;
    JumpPC_EX6 <= JumpPC_EX5;

    t1_sad_value_EX6 <= t1_sad_value_EX5;
   //t0_target_value_EX6 <= t0_target_value_EX5;
    outx_EX6 <= outx_EX5;
    outy_EX6 <= outy_EX5;
    sad_EX6 <= sad_EX5;

    ReadData1_EX6 <= ReadData1;
    ReadData2_EX6 <= ReadData2;
    ReadData3_EX6 <= ReadData3;
    ReadData4_EX6 <= ReadData4;
    ReadData5_EX6 <= ReadData5;
    ReadData6_EX6 <= ReadData6;
    ReadData7_EX6 <= ReadData7;
    ReadData8_EX6 <= ReadData8;
    ReadData9_EX6 <= ReadData9;
    ReadData10_EX6 <= ReadData10;
    ReadData11_EX6 <= ReadData11;
    ReadData12_EX6 <= ReadData12;
    ReadData13_EX6 <= ReadData13;
    ReadData14_EX6 <= ReadData14;
    ReadData15_EX6 <= ReadData15;
    ReadData16_EX6 <= ReadData16;

    tReadData1_EX6 <= tReadData1;
    tReadData2_EX6 <= tReadData2;
    tReadData3_EX6 <= tReadData3;
    tReadData4_EX6 <= tReadData4;
    tReadData5_EX6 <= tReadData5;
    tReadData6_EX6 <= tReadData6;
    tReadData7_EX6 <= tReadData7;
    tReadData8_EX6 <= tReadData8;
    tReadData9_EX6 <= tReadData9;
    tReadData10_EX6 <= tReadData10;
    tReadData11_EX6 <= tReadData11;
    tReadData12_EX6 <= tReadData12;
    tReadData13_EX6 <= tReadData13;
    tReadData14_EX6 <= tReadData14;
    tReadData15_EX6 <= tReadData15;
    tReadData16_EX6 <= tReadData16;

    rs_address_EX6 <= rs_address_EX5;
    end
    
end

endmodule
