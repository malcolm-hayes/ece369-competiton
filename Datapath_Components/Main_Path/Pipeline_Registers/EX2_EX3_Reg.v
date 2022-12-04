`timescale 1ns / 1ps

module EX2_EX3_Reg(ALUResult_EX2, /*PCPlusOffset_MEM,*/ /*rt_Register_Value_EX2, */
    RegDst1Result_EX2, /*Zero_MEM,*/ MemWrite_EX2, MemToReg_EX2, MemRead_EX2, /*Branch_MEM,*/ RegWrite_EX2, 
    jal_EX2, Jump_EX2, JR_EX2, JumpPC_EX2, rs_value_EX2, rt_value_EX2, Clk, Reset,
    //EX3
    ALUResult_EX3, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX3,*/
    RegDst1Result_EX3, /*Zero_MEM,*/ MemWrite_EX3, MemToReg_EX3, MemRead_EX3, /*Branch_MEM,*/ RegWrite_EX3, 
    jal_EX3, Jump_EX3, JR_EX3, JumpPC_EX3, rs_value_EX3, rt_value_EX3,
    //registers for custom instruction EX2
    t1_sad_value_EX2, s4_frow_value_EX2, sad_EX2,
	s6_x_value_EX2, s7_y_value_EX2,t0_target_value_EX2, outx_EX2, outy_EX2, check_wcol_out_EX2,
    mul6_out_1,mul6_out_2,mul6_out_3,mul6_out_4, itxnumrow_out,a1_frame_value_EX2,
    //registers for custom instruction EX3
    t1_sad_value_EX3, s4_frow_value_EX3, sad_EX3,
	s6_x_value_EX3, s7_y_value_EX3, t0_target_value_EX3, outx_EX3, outy_EX3, check_wcol_out_EX3,
    mul6_out_1_EX3,mul6_out_2_EX3,mul6_out_3_EX3,mul6_out_4_EX3, itxnumrow_out_EX3,a1_frame_value_EX3
    );

input [31:0] ALUResult_EX2, /* rt_Register_Value_EX,*/ rs_value_EX2, rt_value_EX2, JumpPC_EX2;
input [4:0] RegDst1Result_EX2;
input [1:0] MemWrite_EX2, MemRead_EX2;
input MemToReg_EX2, RegWrite_EX2, jal_EX2, Jump_EX2, JR_EX2;
input Clk, Reset;

output reg [31:0] ALUResult_EX3, /* rt_Register_Value_EX2,*/ rs_value_EX3, rt_value_EX3, JumpPC_EX3;
output reg [4:0] RegDst1Result_EX3;
output reg [1:0] MemWrite_EX3, MemRead_EX3;
output reg MemToReg_EX3, RegWrite_EX3, jal_EX3, Jump_EX3, JR_EX3;

//custom instruction
input [31:0] t1_sad_value_EX2, s4_frow_value_EX2,
             s6_x_value_EX2, s7_y_value_EX2, t0_target_value_EX2, outx_EX2, outy_EX2, a1_frame_value_EX2;
input sad_EX2;
input [1:0] check_wcol_out_EX2;
input [31:0] mul6_out_1, mul6_out_2, mul6_out_3, mul6_out_4,
    itxnumrow_out;

output reg [31:0] t1_sad_value_EX3, s4_frow_value_EX3,
             s6_x_value_EX3, s7_y_value_EX3, t0_target_value_EX3, outx_EX3, outy_EX3, a1_frame_value_EX3;
output reg sad_EX3;
output reg [1:0] check_wcol_out_EX3;
output reg [31:0] mul6_out_1_EX3, mul6_out_2_EX3, mul6_out_3_EX3, mul6_out_4_EX3,
    itxnumrow_out_EX3;

 initial begin
    ALUResult_EX3 <= 0;
//  rt_Register_Value_EX <= 0;
    rs_value_EX3 <= 0;
    rt_value_EX3 <= 0;
    RegDst1Result_EX3 <= 0;
    MemWrite_EX3 <= 0;
    MemToReg_EX3 <= 0;
    MemRead_EX3 <= 0;
    RegWrite_EX3 <= 0;
    jal_EX3 <= 0;
    Jump_EX3 <= 0;
    JR_EX3 <= 0;
    JumpPC_EX3 <= 0;

    t1_sad_value_EX3 <= 0;
    s4_frow_value_EX3 <= 0;
    sad_EX3 <= 0;
    s6_x_value_EX3 <= 0;
    s7_y_value_EX3 <= 0;
    t0_target_value_EX3 <= 0;
    outx_EX3 <= 0;
    outy_EX3 <= 0;
    check_wcol_out_EX3 <= 0;
    a1_frame_value_EX3 <= 0;

    mul6_out_1_EX3 <= 0;
    mul6_out_2_EX3 <= 0;
    mul6_out_3_EX3 <= 0;
    mul6_out_4_EX3 <= 0;
    itxnumrow_out_EX3 <= 0;
 end

always @(posedge Clk) begin
    
    if (Reset == 1)begin
        ALUResult_EX3 <= 0;
//      rt_Register_Value_EX2 <= 0;
        rs_value_EX3 <= 0;
        rt_value_EX3 <= 0;
        RegDst1Result_EX3 <= 0;
        MemWrite_EX3 <= 0;
        MemToReg_EX3 <= 0;
        MemRead_EX3 <= 0;
        RegWrite_EX3 <= 0;
        jal_EX3 <= 0;
        Jump_EX3 <= 0;
        JR_EX3 <= 0;
        JumpPC_EX3 <= 0;

        t1_sad_value_EX3 <= 0;
        s4_frow_value_EX3 <= 0;
        sad_EX3 <= 0;
        s6_x_value_EX3 <= 0;
        s7_y_value_EX3 <= 0;
        t0_target_value_EX3 <= 0;
        outx_EX3 <= 0;
        outy_EX3 <= 0;
        check_wcol_out_EX3 <= 0;
        a1_frame_value_EX3 <= 0;

        mul6_out_1_EX3 <= 0;
        mul6_out_2_EX3 <= 0;
        mul6_out_3_EX3 <= 0;
        mul6_out_4_EX3 <= 0;
        itxnumrow_out_EX3 <= 0;
    end
    else begin
        ALUResult_EX3 <= ALUResult_EX2;
//      rt_Register_Value_EX2 <= rt_Register_Value_EX1;
        rs_value_EX3 <= rs_value_EX2;
        rt_value_EX3 <= rt_value_EX2;
        RegDst1Result_EX3 <= RegDst1Result_EX2;
        MemWrite_EX3 <= MemWrite_EX2;
        MemToReg_EX3 <= MemToReg_EX2;
        MemRead_EX3 <= MemRead_EX2;
        RegWrite_EX3 <= RegWrite_EX2;
        jal_EX3 <= jal_EX2;
        Jump_EX3 <= Jump_EX2;
        JR_EX3 <= JR_EX2;
        JumpPC_EX3 <= JumpPC_EX2;

        t1_sad_value_EX3 <= t1_sad_value_EX2;
        s4_frow_value_EX3 <= s4_frow_value_EX2;
        sad_EX3 <= sad_EX2;
        s6_x_value_EX3 <= s6_x_value_EX2;
        s7_y_value_EX3 <= s7_y_value_EX2;
        t0_target_value_EX3 <= t0_target_value_EX2;
        outx_EX3 <= outx_EX2;
        outy_EX3 <= outy_EX2;
        check_wcol_out_EX3 <= check_wcol_out_EX2;
        a1_frame_value_EX3 <= a1_frame_value_EX2;

        mul6_out_1_EX3 <= mul6_out_1;
        mul6_out_2_EX3 <= mul6_out_2;
        mul6_out_3_EX3 <= mul6_out_3;
        mul6_out_4_EX3 <= mul6_out_4;
        itxnumrow_out_EX3 <= itxnumrow_out;
    end
    
end

endmodule
