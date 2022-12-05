`timescale 1ns / 1ps

// input ALUResult, Zero flag, output of RegDst Mux, Rt_register_value from readdata2, PCPlusOffset
// need branch, MemWrite, MemToReg, MemRead, PCSrc(?)

module EX8_MEM_Reg(sadMUX_regwrite_value, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX8,*/
    RegDst1Result_EX8, /*Zero_MEM,*/ MemWrite_EX8, MemToReg_EX8, MemRead_EX8, /*Branch_MEM,*/ RegWrite_EX8, 
    jal_EX8, Jump_EX8, JR_EX8, JumpPC_EX8, rs_value_EX8,rt_value_EX8, Clk, Reset,
    //MEM
    sadMUX_regwrite_value_MEM, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_MEM,*/
    RegDst1Result_MEM, /*Zero_MEM,*/ MemWrite_MEM, MemToReg_MEM, MemRead_MEM, /*Branch_MEM,*/ RegWrite_MEM, 
    jal_MEM, Jump_MEM, JR_MEM, JumpPC_MEM, rs_value_MEM,rt_value_MEM,WriteMEMData_MUX,WriteMEMData_MUX_MEM,
    //registers for custom instruction EX8
    t1_sad_value_EX8, outx_EX8, outy_EX8,
    //registers for custom instruction MEM
    t1_sad_value_MEM, outx_MEM, outy_MEM
    );

input [31:0]  /* rt_Register_Value_EX,*/ rs_value_EX8, rt_value_EX8, JumpPC_EX8,WriteMEMData_MUX;
input [4:0] RegDst1Result_EX8;
input [1:0] MemWrite_EX8, MemRead_EX8;
input MemToReg_EX8, RegWrite_EX8, jal_EX8, Jump_EX8, JR_EX8;
input Clk, Reset;

output reg [31:0]  /* rt_Register_Value_EX2,*/ rs_value_MEM, rt_value_MEM, JumpPC_MEM,WriteMEMData_MUX_MEM;
output reg [4:0] RegDst1Result_MEM;
output reg [1:0] MemWrite_MEM, MemRead_MEM;
output reg MemToReg_MEM,RegWrite_MEM, jal_MEM, Jump_MEM, JR_MEM;

// custom instruction
input [31:0] t1_sad_value_EX8, outx_EX8, outy_EX8,
    sadMUX_regwrite_value;

output reg [31:0] t1_sad_value_MEM, outx_MEM, outy_MEM,
    sadMUX_regwrite_value_MEM;

initial begin
//  rt_Register_Value_EX <= 0;
    rs_value_MEM <= 0;
    rt_value_MEM <= 0;
    RegDst1Result_MEM <= 0;
    MemWrite_MEM <= 0;
    MemToReg_MEM <= 0;
    MemRead_MEM <= 0;
    RegWrite_MEM <= 0;
    jal_MEM <= 0;
    Jump_MEM <= 0;
    JR_MEM <= 0;
    JumpPC_MEM <= 0;

    t1_sad_value_MEM <= 0;
    outx_MEM <= 0;
    outy_MEM <= 0;
    sadMUX_regwrite_value_MEM <= 0;
    WriteMEMData_MUX_MEM <= 0;
end

always @(posedge Clk) begin
    if (Reset == 1)begin
//  rt_Register_Value_EX <= 0;
    rs_value_MEM <= 0;
    rt_value_MEM <= 0;
    RegDst1Result_MEM <= 0;
    MemWrite_MEM <= 0;
    MemToReg_MEM <= 0;
    MemRead_MEM <= 0;
    RegWrite_MEM <= 0;
    jal_MEM <= 0;
    Jump_MEM <= 0;
    JR_MEM <= 0;
    JumpPC_MEM <= 0;

    t1_sad_value_MEM <= 0;
    outx_MEM <= 0;
    outy_MEM <= 0;
    sadMUX_regwrite_value_MEM <= 0;
    WriteMEMData_MUX_MEM <= 0;
 end
 else begin
//  rt_Register_Value_EX2 <= rt_Register_Value_EX1;
    rs_value_MEM <= rs_value_EX8;
    rt_value_MEM <= rt_value_EX8;
    RegDst1Result_MEM <= RegDst1Result_EX8;
    MemWrite_MEM <= MemWrite_EX8;
    MemToReg_MEM <= MemToReg_EX8;
    MemRead_MEM <= MemRead_EX8;
    RegWrite_MEM <= RegWrite_EX8;
    jal_MEM <= jal_EX8;
    Jump_MEM <= Jump_EX8;
    JR_MEM <= JR_EX8;
    JumpPC_MEM <= JumpPC_EX8;

    t1_sad_value_MEM <= t1_sad_value_EX8;
    //t0_target_value_MEM <= t0_target_value_EX8;
    outx_MEM <= outx_EX8;
    outy_MEM <= outy_EX8;
    sadMUX_regwrite_value_MEM <= sadMUX_regwrite_value;
    WriteMEMData_MUX_MEM <= WriteMEMData_MUX;
 end

end

endmodule
