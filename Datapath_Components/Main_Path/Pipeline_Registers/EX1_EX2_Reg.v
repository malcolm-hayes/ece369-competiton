`timescale 1ns / 1ps

module EX1_EX2_Reg(/*PCPlusOffset_EX,*/ /* rt_Register_Value_EX,*/
    RegDst1Result_EX, /*Zero_EX,*/ MemWrite_EX, MemToReg_EX, MemRead_EX, /*Branch_EX,*/ RegWrite_EX, 
    jal_EX, Jump_EX, JR_EX, JumpPC_EX, rs_value_EX, rt_value_EX,/*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX2,*/
    RegDst1Result_EX2, /*Zero_MEM,*/ MemWrite_EX2, MemToReg_EX2, MemRead_EX2, /*Branch_MEM,*/ RegWrite_EX2, 
    jal_EX2, Jump_EX2, JR_EX2, JumpPC_EX2, rs_value_EX2, rt_value_EX2, Clk, Reset,    
    //registers for custom instruction EX1
    s0_numrow_value_EX1,s1_cdif_value_EX1,s2_it_value_EX1, t1_sad_value_EX1, s4_frow_value_EX1, sad_EX,moveCheck_outValue,
	s6_x_value_EX1, s7_y_value_EX1,t0_target_value_EX1, outx, outy, check_wcol_out,a1_frame_value_EX1,move_EX,
    //registers for custom instruction EX2
    s0_numrow_value_EX2,s1_cdif_value_EX2,s2_it_value_EX2, t1_sad_value_EX2, s4_frow_value_EX2, sad_EX2,move_EX2,moveCheck_outValue_EX2,
	s6_x_value_EX2, s7_y_value_EX2,t0_target_value_EX2, outx_EX2, outy_EX2, check_wcol_out_EX2, a1_frame_value_EX2,
    //Registers for moving ALU
    ALUControl, Immediate_EX,forward_rs_value, forward_rt_value,
    ALUControl_EX2, Immediate_EX2,forward_rs_value_EX2, forward_rt_value_EX2
    ); 

input [31:0] /* rt_Register_Value_EX,*/ rs_value_EX, rt_value_EX, JumpPC_EX,Immediate_EX,forward_rs_value, forward_rt_value;
input [4:0] RegDst1Result_EX;
input [5:0] ALUControl;
input [1:0] MemWrite_EX, MemRead_EX;
input MemToReg_EX,  RegWrite_EX, jal_EX, Jump_EX, JR_EX,sad_EX,move_EX;
input Clk, Reset;

output reg [31:0] /* rt_Register_Value_EX2,*/ rs_value_EX2, rt_value_EX2, JumpPC_EX2,Immediate_EX2,forward_rs_value_EX2, forward_rt_value_EX2;
output reg [4:0] RegDst1Result_EX2;
output reg [1:0] MemWrite_EX2, MemRead_EX2;
output reg MemToReg_EX2, RegWrite_EX2, jal_EX2, Jump_EX2, JR_EX2,move_EX2,sad_EX2;

//custom instruction
input [31:0] s0_numrow_value_EX1, s1_cdif_value_EX1, s2_it_value_EX1, t1_sad_value_EX1, s4_frow_value_EX1,
            s6_x_value_EX1, s7_y_value_EX1, t0_target_value_EX1, outx, outy, a1_frame_value_EX1,moveCheck_outValue;
input [1:0] check_wcol_out;

output reg [31:0] s0_numrow_value_EX2, s1_cdif_value_EX2, s2_it_value_EX2, t1_sad_value_EX2, s4_frow_value_EX2,
             s6_x_value_EX2, s7_y_value_EX2, t0_target_value_EX2, outx_EX2, outy_EX2, a1_frame_value_EX2,moveCheck_outValue_EX2;
output reg [1:0] check_wcol_out_EX2;
output reg [5:0] ALUControl_EX2;

 initial begin
//    ALUResult_EX2 <= 0;
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
    a1_frame_value_EX2 <= 0;
    move_EX2 <= 0;
    moveCheck_outValue_EX2 <= 0;

    ALUControl_EX2 <= 0;
    Immediate_EX2 <= 0;
    forward_rs_value_EX2 <= 0;
    forward_rt_value_EX2 <= 0;
 end

always @(posedge Clk) begin
    
    if (Reset == 1)begin
//        ALUResult_EX2 <= 0;
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
        a1_frame_value_EX2 <= 0;
        move_EX2 <= 0;
        moveCheck_outValue_EX2 <= 0;

        ALUControl_EX2 <= 0;
        Immediate_EX2 <= 0;
        forward_rs_value_EX2 <= 0;
        forward_rt_value_EX2 <= 0;
    end
    else begin
//        ALUResult_EX2 <= ALUResult_EX;
//      rt_Register_Value_EX2 <= rt_Register_Value_EX1;
        rs_value_EX2 <= rs_value_EX;
        rt_value_EX2 <= rt_value_EX;
        RegDst1Result_EX2 <= RegDst1Result_EX;
        MemWrite_EX2 <= MemWrite_EX;
        MemToReg_EX2 <= MemToReg_EX;
        MemRead_EX2 <= MemRead_EX;
        RegWrite_EX2 <= RegWrite_EX;
        jal_EX2 <= jal_EX;
        Jump_EX2 <= Jump_EX;
        JR_EX2 <= JR_EX;
        JumpPC_EX2 <= JumpPC_EX;

        s0_numrow_value_EX2 <= s0_numrow_value_EX1;
        s1_cdif_value_EX2 <= s1_cdif_value_EX1;
        s2_it_value_EX2 <= s2_it_value_EX1;
        t1_sad_value_EX2 <= t1_sad_value_EX1;
        s4_frow_value_EX2 <= s4_frow_value_EX1;
        sad_EX2 <= sad_EX;
        s6_x_value_EX2 <= s6_x_value_EX1;
        s7_y_value_EX2 <= s7_y_value_EX1;
        t0_target_value_EX2 <= t0_target_value_EX1;
        outx_EX2 <= outx;
        outy_EX2 <= outy;
        check_wcol_out_EX2 <= check_wcol_out;
        a1_frame_value_EX2 <= a1_frame_value_EX1;
        move_EX2 <= move_EX;
        moveCheck_outValue_EX2 <= moveCheck_outValue;

        ALUControl_EX2 <= ALUControl;
        Immediate_EX2 <= Immediate_EX;
        forward_rs_value_EX2 <= forward_rs_value;
        forward_rt_value_EX2 <= forward_rt_value;
    end
    
end

endmodule
