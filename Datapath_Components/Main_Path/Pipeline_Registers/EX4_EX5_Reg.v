`timescale 1ns / 1ps

module EX4_EX5_Reg(ALUResult_EX4, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX4,*/
    RegDst1Result_EX4, /*Zero_MEM,*/ MemWrite_EX4, MemToReg_EX4, MemRead_EX4, /*Branch_MEM,*/ RegWrite_EX4, 
    jal_EX4, Jump_EX4, JR_EX4, JumpPC_EX4, rs_value_EX4,rt_value_EX4, Clk, Reset,
    //EX5
    ALUResult_EX5, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX5,*/
    RegDst1Result_EX5, /*Zero_MEM,*/ MemWrite_EX5, MemToReg_EX5, MemRead_EX5, /*Branch_MEM,*/ RegWrite_EX5, 
    jal_EX5, Jump_EX5, JR_EX5, JumpPC_EX5, rs_value_EX5,rt_value_EX5,
    //registers for custom instruction EX4
    t1_sad_value_EX4, t0_target_value_EX4, outx_EX4, outy_EX4,sad_EX4,
    Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9,Out10,Out11,Out12,Out13,Out14,Out15,Out16,
    tOut1,tOut2,tOut3,tOut4,tOut5,tOut6,tOut7,tOut8,tOut9,tOut10,tOut11,tOut12,tOut13,tOut14,tOut15,tOut16, 
    //registers for custom instruction EX5
    t1_sad_value_EX5, t0_target_value_EX5, outx_EX5, outy_EX5,sad_EX5,
    Out1_EX5,Out2_EX5,Out3_EX5,Out4_EX5,Out5_EX5,Out6_EX5,Out7_EX5,Out8_EX5,Out9_EX5,Out10_EX5,Out11_EX5,Out12_EX5,
    Out13_EX5,Out14_EX5,Out15_EX5,Out16_EX5,
    tOut1_EX5,tOut2_EX5,tOut3_EX5,tOut4_EX5,tOut5_EX5,tOut6_EX5,tOut7_EX5,tOut8_EX5,tOut9_EX5,tOut10_EX5,tOut11_EX5,tOut12_EX5,
    tOut13_EX5,tOut14_EX5,tOut15_EX5,tOut16_EX5 
    ); 

input [31:0] ALUResult_EX4, /* rt_Register_Value_EX,*/ rs_value_EX4, rt_value_EX4, JumpPC_EX4;
input [4:0] RegDst1Result_EX4;
input [1:0] MemWrite_EX4, MemRead_EX4;
input MemToReg_EX4, RegWrite_EX4, jal_EX4, Jump_EX4, JR_EX4,sad_EX4;
input Clk, Reset;

output reg [31:0] ALUResult_EX5, /* rt_Register_Value_EX2,*/ rs_value_EX5, rt_value_EX5, JumpPC_EX5;
output reg [4:0] RegDst1Result_EX5;
output reg [1:0] MemWrite_EX5, MemRead_EX5;
output reg MemToReg_EX5, RegWrite_EX5, jal_EX5, Jump_EX5, JR_EX5,sad_EX5;

//custom instruction
input [31:0] t1_sad_value_EX4, t0_target_value_EX4, outx_EX4, outy_EX4, 
    Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9,Out10,Out11,Out12,Out13,Out14,Out15,Out16,
    tOut1,tOut2,tOut3,tOut4,tOut5,tOut6,tOut7,tOut8,tOut9,tOut10,tOut11,tOut12,tOut13,tOut14,tOut15,tOut16;  

output reg [31:0] t1_sad_value_EX5, t0_target_value_EX5, outx_EX5, outy_EX5,
    Out1_EX5,Out2_EX5,Out3_EX5,Out4_EX5,Out5_EX5,Out6_EX5,Out7_EX5,Out8_EX5,
    Out9_EX5,Out10_EX5,Out11_EX5,Out12_EX5, Out13_EX5,Out14_EX5,Out15_EX5,Out16_EX5,
    tOut1_EX5,tOut2_EX5,tOut3_EX5,tOut4_EX5,tOut5_EX5,tOut6_EX5,tOut7_EX5,tOut8_EX5,
    tOut9_EX5,tOut10_EX5,tOut11_EX5,tOut12_EX5,tOut13_EX5,tOut14_EX5,tOut15_EX5,tOut16_EX5;

 initial begin
    ALUResult_EX5 <= 0;
//  rt_Register_Value_EX <= 0;
    rs_value_EX5 <= 0;
    rt_value_EX5 <= 0;
    RegDst1Result_EX5 <= 0;
    MemWrite_EX5 <= 0;
    MemToReg_EX5 <= 0;
    MemRead_EX5 <= 0;
    RegWrite_EX5 <= 0;
    jal_EX5 <= 0;
    Jump_EX5 <= 0;
    JR_EX5 <= 0;
    JumpPC_EX5 <= 0;

    t1_sad_value_EX5 <= 0;
    t0_target_value_EX5 <= 0;
    outx_EX5 <= 0;
    outy_EX5 <= 0;
    sad_EX5 <= 0;

    Out1_EX5 <= 0;
    Out2_EX5 <= 0;
    Out3_EX5 <= 0;
    Out4_EX5 <= 0;
    Out5_EX5 <= 0;
    Out6_EX5 <= 0;
    Out7_EX5 <= 0;
    Out8_EX5 <= 0;
    Out9_EX5 <= 0;
    Out10_EX5 <= 0;
    Out11_EX5 <= 0;
    Out12_EX5 <= 0;
    Out13_EX5 <= 0;
    Out14_EX5 <= 0;
    Out15_EX5 <= 0;
    Out16_EX5 <= 0;

    tOut1_EX5 <= 0;
    tOut2_EX5 <= 0;
    tOut3_EX5 <= 0;
    tOut4_EX5 <= 0;
    tOut5_EX5 <= 0;
    tOut6_EX5 <= 0;
    tOut7_EX5 <= 0;
    tOut8_EX5 <= 0;
    tOut9_EX5 <= 0;
    tOut10_EX5 <= 0;
    tOut11_EX5 <= 0;
    tOut12_EX5 <= 0;
    tOut13_EX5 <= 0;
    tOut14_EX5 <= 0;
    tOut15_EX5 <= 0;
    tOut16_EX5 <= 0;
 end

always @(posedge Clk) begin
    
    if (Reset == 1)begin
        ALUResult_EX5 <= 0;
//      rt_Register_Value_EX2 <= 0;
        rs_value_EX5 <= 0;
        rt_value_EX5 <= 0;
        RegDst1Result_EX5 <= 0;
        MemWrite_EX5 <= 0;
        MemToReg_EX5 <= 0;
        MemRead_EX5 <= 0;
        RegWrite_EX5 <= 0;
        jal_EX5 <= 0;
        Jump_EX5 <= 0;
        JR_EX5 <= 0;
        JumpPC_EX5 <= 0;

        t1_sad_value_EX5 <= 0;
        t0_target_value_EX5 <= 0;
        outx_EX5 <= 0;
        outy_EX5 <= 0;
        sad_EX5 <= 0;

        Out1_EX5 <= 0;
        Out2_EX5 <= 0;
        Out3_EX5 <= 0;
        Out4_EX5 <= 0;
        Out5_EX5 <= 0;
        Out6_EX5 <= 0;
        Out7_EX5 <= 0;
        Out8_EX5 <= 0;
        Out9_EX5 <= 0;
        Out10_EX5 <= 0;
        Out11_EX5 <= 0;
        Out12_EX5 <= 0;
        Out13_EX5 <= 0;
        Out14_EX5 <= 0;
        Out15_EX5 <= 0;
        Out16_EX5 <= 0;

        tOut1_EX5 <= 0;
        tOut2_EX5 <= 0;
        tOut3_EX5 <= 0;
        tOut4_EX5 <= 0;
        tOut5_EX5 <= 0;
        tOut6_EX5 <= 0;
        tOut7_EX5 <= 0;
        tOut8_EX5 <= 0;
        tOut9_EX5 <= 0;
        tOut10_EX5 <= 0;
        tOut11_EX5 <= 0;
        tOut12_EX5 <= 0;
        tOut13_EX5 <= 0;
        tOut14_EX5 <= 0;
        tOut15_EX5 <= 0;
        tOut16_EX5 <= 0;
    end
    else begin
        ALUResult_EX5 <= ALUResult_EX4;
//      rt_Register_Value_EX2 <= rt_Register_Value_EX1;
        rs_value_EX5 <= rs_value_EX4;
        rt_value_EX5 <= rt_value_EX4;
        RegDst1Result_EX5 <= RegDst1Result_EX4;
        MemWrite_EX5 <= MemWrite_EX4;
        MemToReg_EX5 <= MemToReg_EX4;
        MemRead_EX5 <= MemRead_EX4;
        RegWrite_EX5 <= RegWrite_EX4;
        jal_EX5 <= jal_EX4;
        Jump_EX5 <= Jump_EX4;
        JR_EX5 <= JR_EX4;
        JumpPC_EX5 <= JumpPC_EX4;

        t1_sad_value_EX5 <= t1_sad_value_EX4;
        t0_target_value_EX5 <= t0_target_value_EX4;
        outx_EX5 <= outx_EX4;
        outy_EX5 <= outy_EX4;
        sad_EX5 <= sad_EX4;

        Out1_EX5 <= Out1;
        Out2_EX5 <= Out2;
        Out3_EX5 <= Out3;
        Out4_EX5 <= Out4;
        Out5_EX5 <= Out5;
        Out6_EX5 <= Out6;
        Out7_EX5 <= Out7;
        Out8_EX5 <= Out8;
        Out9_EX5 <= Out9;
        Out10_EX5 <= Out10;
        Out11_EX5 <= Out11;
        Out12_EX5 <= Out12;
        Out13_EX5 <= Out13;
        Out14_EX5 <= Out14;
        Out15_EX5 <= Out15;
        Out16_EX5 <= Out16;

        tOut1_EX5 <= tOut1;
        tOut2_EX5 <= tOut2;
        tOut3_EX5 <= tOut3;
        tOut4_EX5 <= tOut4;
        tOut5_EX5 <= tOut5;
        tOut6_EX5 <= tOut6;
        tOut7_EX5 <= tOut7;
        tOut8_EX5 <= tOut8;
        tOut9_EX5 <= tOut9;
        tOut10_EX5 <= tOut10;
        tOut11_EX5 <= tOut11;
        tOut12_EX5 <= tOut12;
        tOut13_EX5 <= tOut13;
        tOut14_EX5 <= tOut14;
        tOut15_EX5 <= tOut15;
        tOut16_EX5 <= tOut16;
    end
    
end

endmodule
