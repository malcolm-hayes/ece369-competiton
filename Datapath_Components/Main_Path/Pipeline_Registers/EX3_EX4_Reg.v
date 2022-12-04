`timescale 1ns / 1ps

module EX3_EX4_Reg(ALUResult_EX3, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX3,*/
    RegDst1Result_EX3, /*Zero_MEM,*/ MemWrite_EX3, MemToReg_EX3, MemRead_EX3, /*Branch_MEM,*/ RegWrite_EX3, 
    jal_EX3, Jump_EX3, JR_EX3, JumpPC_EX3, rs_value_EX3, rt_value_EX3, Clk, Reset
    //EX4
    ALUResult_EX4, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX4,*/
    RegDst1Result_EX4, /*Zero_MEM,*/ MemWrite_EX4, MemToReg_EX4, MemRead_EX4, /*Branch_MEM,*/ RegWrite_EX4, 
    jal_EX4, Jump_EX4, JR_EX4, JumpPC_EX4, rs_value_EX4, rt_value_EX4,
    //registers for custom instruction EX3
    t1_sad_value_EX3,  
	t0_target_value_EX3, outx_EX3, outy_EX3, sad_EX3,
    a1_frame_value_EX3, In1,In2,In3,In4,In5,In6,In7,In8,In9,In10,In11,In12,In13,
    In14,In15,In16, mul_frow_out,
    //registers for custom instruction EX4
    t1_sad_value_EX4, 
	t0_target_value_EX4, outx_EX4, outy_EX4,sad_EX4,
    a1_frame_value_EX4, In1_EX4,In2_EX4,In3_EX4,In4_EX4,In5_EX4,In6_EX4,In7_EX4,In8_EX4,In9_EX4,In10_EX4,In11_EX4,In12_EX4,In13_EX4,
    In14_EX4,In15_EX4,In16_EX4, mul_frow_out_EX4
    ); 
input [31:0] ALUResult_EX3, /* rt_Register_Value_EX,*/ rs_value_EX3, rt_value_EX3;
input [4:0] RegDst1Result_EX3;
input MemWrite_EX3, MemToReg_EX3, MemRead_EX3, RegWrite_EX3, jal_EX3, Jump_EX3, JR_EX3, JumpPC_EX3;
input Clk, Reset;

output reg [31:0] ALUResult_EX4, /* rt_Register_Value_EX2,*/ rs_value_EX4, rt_value_EX4;
output reg [4:0] RegDst1Result_EX4;
output reg MemWrite_EX4, MemToReg_EX4, MemRead_EX4, RegWrite_EX4, jal_EX4, Jump_EX4, JR_EX4, JumpPC_EX4;

//custom instruction
input [31:0] s0_numrow_value_EX3, s1_cdif_value_EX3, s2_it_value_EX3, t1_sad_value_EX3, s4_frow_value_EX3,
             sad_EX3, s6_x_value_EX3, s7_y_value_EX3, t0_target_value_EX3, outx_EX3, outy_EX3, a1_frame_value_EX3;
input [1:0] check_wcol_out_EX3;

output reg [31:0] s0_numrow_value_EX4, s1_cdif_value_EX4, s2_it_value_EX4, t1_sad_value_EX4, s4_frow_value_EX4,
             sad_EX4, s6_x_value_EX4, s7_y_value_EX4, t0_target_value_EX4, outx_EX4, outy_EX4, a1_frame_value_EX4;
output reg [1:0] check_wcol_out_EX4;

 initial begin
    ALUResult_EX4 <= 0;
//  rt_Register_Value_EX <= 0;
    rs_value_EX4 <= 0;
    rt_value_EX4 <= 0;
    RegDst1Result_EX4 <= 0;
    MemWrite_EX4 <= 0;
    MemToReg_EX4 <= 0;
    MemRead_EX4 <= 0;
    RegWrite_EX4 <= 0;
    jal_EX4 <= 0;
    Jump_EX4 <= 0;
    JR_EX4 <= 0;
    JumpPC_EX4 <= 0;

    s0_numrow_value_EX4 <= 0;
    s1_cdif_value_EX4 <= 0;
    s2_it_value_EX4 <= 0;
    t1_sad_value_EX4 <= 0;
    s4_frow_value_EX4 <= 0;
    sad_EX4 <= 0;
    s6_x_value_EX4 <= 0;
    s7_y_value_EX4 <= 0;
    t0_target_value_EX4 <= 0;
    outx_EX4 <= 0;
    outy_EX4 <= 0;
    check_wcol_out_EX4 <= 0;
    a1_frame_EX4 <= 0;
 end

always @(posedge Clk) begin
    
    if (Reset == 1)begin
        ALUResult_EX4 <= 0;
//      rt_Register_Value_EX2 <= 0;
        rs_value_EX4 <= 0;
        rt_value_EX4 <= 0;
        RegDst1Result_EX4 <= 0;
        MemWrite_EX4 <= 0;
        MemToReg_EX4 <= 0;
        MemRead_EX4 <= 0;
        RegWrite_EX4 <= 0;
        jal_EX4 <= 0;
        Jump_EX4 <= 0;
        JR_EX4 <= 0;
        JumpPC_EX4 <= 0;

        s0_numrow_value_EX4 <= 0;
        s1_cdif_value_EX4 <= 0;
        s2_it_value_EX4 <= 0;
        t1_sad_value_EX4 <= 0;
        s4_frow_value_EX4 <= 0;
        sad_EX4 <= 0;
        s6_x_value_EX4 <= 0;
        s7_y_value_EX4 <= 0;
        t0_target_value_EX4 <= 0;
        outx_EX4 <= 0;
        outy_EX4 <= 0;
        check_wcol_out_EX4 <= 0;
        a1_frame_EX4 <= 0;
    end
    else begin
        ALUResult_EX4 <= ALUResult_EX2;
//      rt_Register_Value_EX2 <= rt_Register_Value_EX1;
        rs_value_EX4 <= rs_value_EX3;
        rt_value_EX4 <= rt_value_EX3;
        RegDst1Result_EX4 <= RegDst1Result_EX3;
        MemWrite_EX4 <= MemWrite_EX3;
        MemToReg_EX4 <= MemToReg_EX3;
        MemRead_EX4 <= MemRead_EX3;
        RegWrite_EX4 <= RegWrite_EX3;
        jal_EX4 <= jal_EX3;
        Jump_EX4 <= Jump_EX3;
        JR_EX4 <= JR_EX3;
        JumpPC_EX4 <= JumpPC_EX3;

        s0_numrow_value_EX4 <= s0_numrow_value_EX3;
        s1_cdif_value_EX4 <= s1_cdif_value_EX3;
        s2_it_value_EX4 <= s2_it_value_EX3;
        t1_sad_value_EX4 <= t1_sad_value_EX3;
        s4_frow_value_EX4 <= s4_frow_value_EX3;
        sad_EX4 <= sad_EX3;
        s6_x_value_EX4 <= s6_x_value_EX3;
        s7_y_value_EX4 <= s7_y_value_EX3;
        t0_target_value_EX4 <= t0_target_value_EX3;
        outx_EX4 <= outx_EX3;
        outy_EX4 <= outy_EX3;
        check_wcol_out_EX4 <= check_wcol_out_EX3;
        a1_frame_EX4 <= a1_frame_EX3;
    end
    
end

endmodule
