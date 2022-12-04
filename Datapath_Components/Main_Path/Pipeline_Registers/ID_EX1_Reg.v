`timescale 1ns / 1ps

// we need to save all control signals in here, as well as bits 15-0(sign extended), 20-16,
// and 15-11 of the instruction
// also need read_data1, read_data2 (rs and rt value)
// rs[25:21], rt[20-16], rd[15-11]

// RegWrite, PCSrc, RegDst, ALUOp, ALUSrc, Branch, MemWrite, MemToReg, MemRead

module ID_EX1_Reg (RegWrite_ID, RegDst_ID, ALUOp_ID,
 ALUSrc_ID, /*Branch_ID,*/ MemWrite_ID, MemToReg_ID, MemRead_ID, 
 rs_value_ID, rt_value_ID, Immediate_ID, rs_address_ID, rt_address_ID, rd_address_ID, /*PCAddresult_ID,*/ jal_ID, Jump_ID, JR_ID, JumpPC_ID,
 RegWrite_EX, RegDst_EX, ALUOp_EX, ALUSrc_EX, /*Branch_EX,*/ MemWrite_EX, MemToReg_EX, MemRead_EX, 
      rs_value_EX, rt_value_EX, Immediate_EX, rs_address_EX, rt_address_EX, rd_address_EX, /*PCAddResult_EX,*/ jal_EX, Jump_EX, JR_EX, JumpPC_EX, ControlMuxSig, Clk, Reset,
    move, sad, move_EX, sad_EX,
    //registers for custom instruction ID
    s0_numrow_value_ID,s1_cdif_value_ID,s2_it_value_ID, t1_sad_value_ID, s4_frow_value_ID, 
	s5_wcol_value_ID,s6_x_value_ID, s7_y_value_ID,t0_target_value_ID, a1_frame_value_ID,
    //registers for custom instruction EX1
    s0_numrow_value_EX1,s1_cdif_value_EX1,s2_it_value_EX1, t1_sad_value_EX1, s4_frow_value_EX1, 
	s5_wcol_value_EX1, s6_x_value_EX1, s7_y_value_EX1,t0_target_value_EX1, a1_frame_value_EX1
    );

input Reset;
input Clk;
input RegWrite_ID, RegDst_ID, 
 ALUSrc_ID, /*Branch_ID,*/ MemToReg_ID, jal_ID, Jump_ID, JR_ID, move, sad;
input [3:0] ALUOp_ID;
input [1:0] MemWrite_ID, MemRead_ID;
input [31:0] rs_value_ID, rt_value_ID /*,PCAddresult_ID*/;
input [31:0] Immediate_ID;
input [4:0] rs_address_ID, rt_address_ID, rd_address_ID;
input [31:0] JumpPC_ID;

input ControlMuxSig;

output reg [1:0] MemWrite_EX, MemRead_EX;
output reg [3:0] ALUOp_EX;
output reg [4:0] rs_address_EX, rt_address_EX, rd_address_EX;
output reg [31:0] rs_value_EX, rt_value_EX /*,PCAddresult_EX*/;
output reg [31:0] Immediate_EX;
output reg RegWrite_EX, RegDst_EX, 
 ALUSrc_EX, /*Branch_EX,*/ MemToReg_EX, jal_EX, Jump_EX, JR_EX, move_EX, sad_EX;
output reg [31:0] JumpPC_EX;

input [31:0] s0_numrow_value_ID,s1_cdif_value_ID,s2_it_value_ID, t1_sad_value_ID, s4_frow_value_ID, 
	s5_wcol_value_ID,s6_x_value_ID, s7_y_value_ID,t0_target_value_ID, a1_frame_value_ID;
    //registers for custom instruction EX1
output reg [31:0] s0_numrow_value_EX1,s1_cdif_value_EX1,s2_it_value_EX1, t1_sad_value_EX1, s4_frow_value_EX1, 
	s5_wcol_value_EX1, s6_x_value_EX1, s7_y_value_EX1,t0_target_value_EX1, a1_frame_value_EX1;

initial begin

RegWrite_EX <= 0;
// PCSrc_EX <= 0;
RegDst_EX <= 0;
ALUOp_EX <= 0;
ALUSrc_EX <= 0;
//Branch_EX <= 0;
MemWrite_EX <= 0;
MemToReg_EX <= 0;
MemRead_EX <= 0;
rs_value_EX <= 0;
rt_value_EX <= 0;
Immediate_EX <= 0;
rt_address_EX <= 0;
rd_address_EX <= 0;
//PCAddresult_EX <= 0;
s0_numrow_value_EX1 <= 0;
s1_cdif_value_EX1 <= 0;
s2_it_value_EX1 <= 0;
t1_sad_value_EX1 <= 0;
s4_frow_value_EX1 <= 0; 
s5_wcol_value_EX1 <= 0;
s6_x_value_EX1 <= 0;
s7_y_value_EX1 <= 0;
t0_target_value_EX1 <= 0;
a1_frame_value_EX1 <= 0;
move_EX <= 0;
sad_EX <= 0;

end

always @(posedge Clk) begin

if (Reset == 1)begin
RegWrite_EX <= 0;
// PCSrc_EX <= 0;
RegDst_EX <= 0;
ALUOp_EX <= 0;
ALUSrc_EX <= 0;
// Branch_EX <= 0;
MemWrite_EX <= 0;
MemToReg_EX <= 0;
MemRead_EX <= 0;
rs_value_EX <= 0;
rt_value_EX <= 0;
Immediate_EX <= 0;
rs_address_EX <= 0;
rt_address_EX <= 0;
rd_address_EX <= 0;
//PCAddresult_EX <= 0;
jal_EX <= 0;
Jump_EX <= 0;
JR_EX <= 0;
JumpPC_EX <= 0;

s0_numrow_value_EX1 <= 0;
s1_cdif_value_EX1 <= 0;
s2_it_value_EX1 <= 0;
t1_sad_value_EX1 <= 0;
s4_frow_value_EX1 <= 0; 
s5_wcol_value_EX1 <= 0;
s6_x_value_EX1 <= 0;
s7_y_value_EX1 <= 0;
t0_target_value_EX1 <= 0;
a1_frame_value_EX1 <= 0;
end
else if(ControlMuxSig == 1) begin
RegWrite_EX <= RegWrite_ID;
// PCSrc_EX <= PCSrc_ID;
RegDst_EX <= RegDst_ID;
ALUOp_EX <= ALUOp_ID;
ALUSrc_EX <= ALUSrc_ID;
// Branch_EX <= Branch_ID;
MemWrite_EX <= MemWrite_ID;
MemToReg_EX <= MemToReg_ID;
MemRead_EX <= MemRead_ID;
rs_value_EX <= rs_value_ID;
rt_value_EX <= rt_value_ID;
Immediate_EX <= Immediate_ID;
rs_address_EX <= rs_address_ID;
rt_address_EX <= rt_address_ID;
rd_address_EX <= rd_address_ID;
//PCAddresult_EX <= PCAddresult_ID;
jal_EX <= jal_ID;
Jump_EX <= Jump_ID;
JR_EX <= JR_ID;
JumpPC_EX <= JumpPC_ID;

s0_numrow_value_EX1 <= s0_numrow_value_ID;
s1_cdif_value_EX1 <= s1_cdif_value_ID;
s2_it_value_EX1 <= s2_it_value_ID;
t1_sad_value_EX1 <= t1_sad_value_ID;
s4_frow_value_EX1 <=  s4_frow_value_ID;
s5_wcol_value_EX1 <= s5_wcol_value_ID;
s6_x_value_EX1 <= s6_x_value_ID;
s7_y_value_EX1 <= s7_y_value_ID;
t0_target_value_EX1 <= t0_target_value_ID;
a1_frame_value_EX1 <= a1_frame_value_ID;

move_EX <= move;
sad_EX <= sad;
end
else begin
RegWrite_EX <= 0;
RegDst_EX <= 0;
ALUOp_EX <= 0;
ALUSrc_EX <= 0;
MemWrite_EX <= 0;
MemToReg_EX <= 0;
MemRead_EX <= 0;
//rs_value_EX <= 0;
//rt_value_EX <= 0;
//Immediate_EX <= 0;
//rs_address_EX <= 0;
//rt_address_EX <= 0;
//rd_address_EX <= 0;
jal_EX <= 0;
Jump_EX <= 0;
JR_EX <= 0;
JumpPC_EX <= 0;

s0_numrow_value_EX1 <= 0;
s1_cdif_value_EX1 <= 0;
s2_it_value_EX1 <= 0;
t1_sad_value_EX1 <= 0;
s4_frow_value_EX1 <= 0; 
s5_wcol_value_EX1 <= 0;
s6_x_value_EX1 <= 0;
s7_y_value_EX1 <= 0;
t0_target_value_EX1 <= 0;
a1_frame_value_EX1 <= 0;
move_EX <= 0;
sad_EX <= 0;
end

end
endmodule