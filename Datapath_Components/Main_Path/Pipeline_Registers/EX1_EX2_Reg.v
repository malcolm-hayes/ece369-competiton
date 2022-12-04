`timescale 1ns / 1ps

module EX1_EX2_Reg(ALUResult_EX, /*PCPlusOffset_EX,*/ /* rt_Register_Value_EX,*/
    RegDst1Result_EX, /*Zero_EX,*/ MemWrite_EX, MemToReg_EX, MemRead_EX, /*Branch_EX,*/ RegWrite_EX, 
    jal_EX, Jump_EX, JR_EX, JumpPC_EX, rs_value_EX, rt_value_EX,
    ALUResult_EX2, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX2,*/
    RegDst1Result_EX2, /*Zero_MEM,*/ MemWrite_EX2, MemToReg_EX2, MemRead_EX2, /*Branch_MEM,*/ RegWrite_EX2, 
    jal_EX2, Jump_EX2, JR_EX2, JumpPC_EX2, rs_value_EX2, rt_value_EX2 Clk, Reset    
    //registers for custom instruction EX1
    s0_numrow_value_EX1,s1_cdif_value_EX1,s2_it_value_EX1, t1_sad_value_EX1, s4_frow_value_EX1, sad_EX,
	s6_x_value_EX1, s7_y_value_EX1,t0_target_value_EX1, outx, outy, check_wcol_out,a1_frame_value_EX1,
    //registers for custom instruction EX2
    s0_numrow_value_EX2,s1_cdif_value_EX2,s2_it_value_EX2, t1_sad_value_EX2, s4_frow_value_EX2, sad_EX2,
	s6_x_value_EX2, s7_y_value_EX2,t0_target_value_EX2, outx_EX2, outy_EX2, check_wcol_out_EX2, a1_frame_value_EX2
    ); 

input [31:0] ALUResult_EX, /* rt_Register_Value_EX,*/ rs_value_EX, rt_value_EX;
input [4:0] RegDst1Result_EX;
input MemWrite_EX, MemToReg_EX, MemRead_EX, RegWrite_EX, jal_EX, Jump_EX, JR_EX, JumpPC_EX;
input Clk, Reset;

output reg [31:0] ALUResult_EX2, /* rt_Register_Value_EX2,*/ rs_value_EX2, rt_value_EX2;
output reg [4:0] RegDst1Result_EX2;
output reg MemWrite_EX2, MemToReg_EX2, MemRead_EX2, RegWrite_EX2, jal_EX2, Jump_EX2, JR_EX2, JumpPC_EX2;

//custom instruction
input [31:0] s0_numrow_value_EX1, s1_cdif_value_EX1, s2_it_value_EX1, t1_sad_value_EX1, s4_frow_value_EX1,
             sad_EX, s6_x_value_EX1, s7_y_value_EX1, t0_target_value_EX1, outx, outy, a1_frame_value_EX1;
input [1:0] check_wcol_out;

output reg [31:0] s0_numrow_value_EX2, s1_cdif_value_EX2, s2_it_value_EX2, t1_sad_value_EX2, s4_frow_value_EX1,
             sad_EX2, s6_x_value_EX2, s7_y_value_EX2, t0_target_value_EX2, outx_EX2, outy_EX2, a1_frame_value_EX2;
output reg [1:0] check_wcol_out_EX2;

 initial begin
    ALUResult_EX2 <= 0;
//  rt_Register_Value_EX <= 0;
    rs_value_EX2 <= 0;
    rt_value_EX2 <= 0;
    RegDst1Result_EX2 <= 0;
    MemWrite_EX2 <= 0;
    MemToReg_EX2 <= 0;
    MemRead_EX2 <= 0;
    RegWrite_EX2 <= 0;
    jal_EX2 <= 0;
    Jump_EX2 <= 0;
    JR_EX2 <= 0;
    JumpPC_EX2 <= 0;

    s0_numrow_value_EX2 <= 0;
    s1_cdif_value_EX2 <= 0;
    s2_it_value_EX2 <= 0;
    t1_sad_value_EX2 <= 0;
    s4_frow_value_EX2 <= 0;
    sad_EX2 <= 0;
    s6_x_value_EX2 <= 0;
    s7_y_value_EX2 <= 0;
    t0_target_value_EX2 <= 0;
    outx_EX2 <= 0;
    outy_EX2 <= 0;
    check_wcol_out_EX2 <= 0;
    a1_frame_EX2 <= 0;
 end

always @(posedge Clk) begin
    
    if (Reset == 1)begin
        ALUResult_EX2 <= 0;
//      rt_Register_Value_EX2 <= 0;
        rs_value_EX2 <= 0;
        rt_value_EX2 <= 0;
        RegDst1Result_EX2 <= 0;
        MemWrite_EX2 <= 0;
        MemToReg_EX2 <= 0;
        MemRead_EX2 <= 0;
        RegWrite_EX2 <= 0;
        jal_EX2 <= 0;
        Jump_EX2 <= 0;
        JR_EX2 <= 0;
        JumpPC_EX2 <= 0;

        s0_numrow_value_EX2 <= 0;
        s1_cdif_value_EX2 <= 0;
        s2_it_value_EX2 <= 0;
        t1_sad_value_EX2 <= 0;
        s4_frow_value_EX2 <= 0;
        sad_EX2 <= 0;
        s6_x_value_EX2 <= 0;
        s7_y_value_EX2 <= 0;
        t0_target_value_EX2 <= 0;
        outx_EX2 <= 0;
        outy_EX2 <= 0;
        check_wcol_out_EX2 <= 0;
        a1_frame_EX2 <= 0;
    end
    else begin
        ALUResult_EX2 <= ALUResult_EX1;
//      rt_Register_Value_EX2 <= rt_Register_Value_EX1;
        rs_value_EX2 <= rs_value_EX1;
        rt_value_EX2 <= rt_value_EX1;
        RegDst1Result_EX2 <= RegDst1Result_EX1;
        MemWrite_EX2 <= MemWrite_EX1;
        MemToReg_EX2 <= MemToReg_EX1;
        MemRead_EX2 <= MemRead_EX1;
        RegWrite_EX2 <= RegWrite_EX1;
        jal_EX2 <= jal_EX1;
        Jump_EX2 <= Jump_EX1;
        JR_EX2 <= JR_EX1;
        JumpPC_EX2 <= JumpPC_EX1;

        s0_numrow_value_EX2 <= s0_numrow_value_EX1;
        s1_cdif_value_EX2 <= s1_cdif_value_EX1;
        s2_it_value_EX2 <= s2_it_value_EX1;
        t1_sad_value_EX2 <= t1_sad_value_EX1;
        s4_frow_value_EX2 <= s4_frow_value_EX1;
        sad_EX2 <= sad_EX1;
        s6_x_value_EX2 <= s6_x_value_EX1;
        s7_y_value_EX2 <= s7_y_value_EX1;
        t0_target_value_EX2 <= t0_target_value_EX1;
        outx_EX2 <= outx;
        outy_EX2 <= outy;
        check_wcol_out_EX2 <= check_wcol_out_EX1;
        a1_frame_EX2 <= a1_frame_EX1;
    end
    
end

endmodule
