`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members: Malcolm Hayes, Sam Kerns, Jaeden Carpenter
// Overall percent effort of each team meber: 33% each 
// 
// ECE369A - Computer Architecture
//  THIS SHOULD NOT BE SET AS TOP FILE, SET Top_Board AS TOP FILE!!!!!!!!!!!!!!!!!!
//  THIS SHOULD NOT BE SET AS TOP FILE, SET Top_Board AS TOP FILE!!!!!!!!!!!!!!!!!!

module Wiring(Clk, Reset, v0_Out, v1_Out);
    
    //OLD WIRES
    output wire [31:0] v0_Out, v1_Out;
    // reg [31:0] v0, v1;
(* mark_debug = "true" *) input Clk, Reset;
    // To PCSrc mux
   (* mark_debug = "true" *) wire PCSrc;  // output of Branch AndGate
    // To EX Adder of PC+ShiftLeft2 Immediate
   (* mark_debug = "true" *) wire [31:0] ShiftLeft2Out_ID;

   (* mark_debug = "true" *) wire jal_EX, jal_MEM, jal_WB, Jump_EX, Jump_MEM, Jump_WB, JR_EX, JR_MEM, JR_WB, jal_Control; // pipeline jal to prevent errors
   (* mark_debug = "true" *) wire [31:0] JumpPC_EX, JumpPC_MEM, rs_value_MEM;
   (* mark_debug = "true" *) wire rsgz, tes, rsez;
// InstructionFetch and PC
   (* mark_debug = "true" *) wire [31:0] PCAddResult;
   (* mark_debug = "true" *) wire [31:0] PCResult; //output
   (* mark_debug = "true" *) wire [31:0] Instruction;
   (* mark_debug = "true" *) wire PC_Write;
// PCPlusOffset
   (* mark_debug = "true" *) wire [31:0] PCPlusOffset_ID;
// Control Signals
   (* mark_debug = "true" *) wire RegWrite, RegDst, ALUSrc, Branch, MemToReg;
   (* mark_debug = "true" *) wire [3:0] ALUOp;
   (* mark_debug = "true" *) wire [1:0] MemWrite, MemRead;
   (* mark_debug = "true" *) wire jal_RA;
   (* mark_debug = "true" *) wire RegWrite_WB;
   (* mark_debug = "true" *) wire rs_MUX, rt_MUX; //controls MUX for branch check unit inputs
   (* mark_debug = "true" *) wire isBranch; //hazard detection for branch
//   (* mark_debug = "true" *) wire Zero;
   (* mark_debug = "true" *) wire jump, jr;  
// Mux output Wires
   (* mark_debug = "true" *) wire [31:0] PCSrc_Result_MUX;
   (* mark_debug = "true" *) wire [31:0] jump_Result_MUX;
   (* mark_debug = "true" *) wire [31:0] jr_Result_MUX;
   (* mark_debug = "true" *) wire [4:0] WriteReg_MUX;
   (* mark_debug = "true" *) wire [31:0] WriteData_MUX; //output
   (* mark_debug = "true" *) wire [31:0] ALUSrc_MUX;
   (* mark_debug = "true" *) wire [4:0] RegDst_MUX;
   (* mark_debug = "true" *) wire [31:0] MemToReg_WB_MUX;
   (* mark_debug = "true" *) wire [31:0] BranchCheckMUX_rs, BranchCheckMUX_rt; //output of mux, input of branch check unit

// Pipeline Register Wires:
    // IF_ID output
        //To RegisterFile
   (* mark_debug = "true" *) wire [31:0] rs_value_ID, rt_value_ID;
   (* mark_debug = "true" *) wire RegWrite_ORGate;
    // IF_ID output
   (* mark_debug = "true" *) wire [31:0] Immediate_ID;
   (* mark_debug = "true" *) wire [31:0] PCAddResult_ID;
   (* mark_debug = "true" *) wire [31:0] Instruction_ID;
   (* mark_debug = "true" *) wire [31:0] JumpPC;
    // ID_EX output
   (* mark_debug = "true" *) wire RegWrite_EX, RegDst_EX, ALUSrc_EX;
   (* mark_debug = "true" *) wire MemToReg_EX/*, Branch_EX*/;
   (* mark_debug = "true" *) wire [31:0] PCAddResult_EX;
   (* mark_debug = "true" *) wire [1:0] MemWrite_EX, MemRead_EX;
   (* mark_debug = "true" *) wire [31:0] rt_value_EX;
   (* mark_debug = "true" *) wire [4:0] rs_address_EX;
        //To ALUControl
   (* mark_debug = "true" *) wire [31:0] Immediate_EX;
   (* mark_debug = "true" *) wire [3:0] ALUOp_EX;
   (* mark_debug = "true" *) wire [5:0] ALUControl, ALUControl_EX2;
    
        //To ALU
   (* mark_debug = "true" *) wire [31:0] rs_value_EX;
   (* mark_debug = "true" *) wire [31:0] ALUResult_EX;
        //To RegDst_Mux
   (* mark_debug = "true" *) wire [4:0] rt_address_EX, rd_address_EX;
   // ForwardingUnit and HazardDetection
        //To 3x1 ALU_Mux's
   (* mark_debug = "true" *) wire [3:0] ALU_input_rs;
   (* mark_debug = "true" *) wire [3:0] ALU_input_rt;
   (* mark_debug = "true" *) wire IF_ID_Write, ControlMuxSig;
   (* mark_debug = "true" *) wire [31:0] forward_rs_value, forward_rt_value,forward_rs_value_EX2, forward_rt_value_EX2; // output
   (* mark_debug = "true" *) wire IF_Flush;
   (* mark_debug = "true" *) wire [31:0] WriteMEMData_MUX,WriteMEMData_MUXRS; //mux data that goes into the mem register then into the WriteData for memory unit
   (* mark_debug = "true" *) wire [1:0] WriteMEMData_SignalRS,WriteMEMData_SignalRT;
     // EX_MEM output
   (* mark_debug = "true" *) wire [4:0] RegDst1Result_MEM;
   (* mark_debug = "true" *) wire [31:0] PCPlusOffset_MEM;
   (* mark_debug = "true" *) wire MemToReg_MEM;
   (* mark_debug = "true" *) wire RegWrite_MEM;
        //To DataMemory
   //(* mark_debug = "true" *) wire [31:0] sadMUX_regwrite_value;
   (* mark_debug = "true" *) wire [31:0] rt_value_MEM;
   (* mark_debug = "true" *) wire [1:0] MemWrite_MEM, MemRead_MEM;
   (* mark_debug = "true" *) wire [31:0] ReadData_MEM;
        //To ANDGATE
  (* mark_debug = "true" *)  wire Branch_MEM;
  (* mark_debug = "true" *)  wire Zero_MEM;
    // MEM_WB output
  (* mark_debug = "true" *)  wire [4:0] RegDst1Result_WB;
        //To MemToReg_Mux
   (* mark_debug = "true" *) wire [31:0] ReadData_WB;
   //(* mark_debug = "true" *) wire [31:0] ALUResult_WB;
   (* mark_debug = "true" *) wire MemToReg_WB;

    //NEW WIRES
    
    wire [31:0] ALUResult_EX2, ALUResult_EX3, ALUResult_EX4, ALUResult_EX5, ALUResult_EX6, ALUResult_EX7, ALUResult_EX8,
        rs_value_EX2, rs_value_EX3, rs_value_EX4, rs_value_EX5, rs_value_EX6, rs_value_EX7, rs_value_EX8, 
        rt_value_EX2, rt_value_EX3, rt_value_EX4, rt_value_EX5, rt_value_EX6, rt_value_EX7, rt_value_EX8,ALU_Input_value_rs,ALU_Input_value_rt,WriteMEMData_MUX_MEM;
    wire [4:0] RegDst1Result_EX, RegDst1Result_EX2, RegDst1Result_EX3, RegDst1Result_EX4, RegDst1Result_EX5, RegDst1Result_EX6, RegDst1Result_EX7, RegDst1Result_EX8,
        rs_address_EX2,rt_address_EX2,rs_address_EX3,rs_address_EX4,rs_address_EX5,rs_address_EX6,rs_address_EX7,rs_address_EX8;


    wire [1:0] MemWrite_EX2, MemWrite_EX3, MemWrite_EX4, MemWrite_EX5, MemWrite_EX6, MemWrite_EX7, MemWrite_EX8,
        MemRead_EX2, MemRead_EX3, MemRead_EX4, MemRead_EX5, MemRead_EX6, MemRead_EX7, MemRead_EX8;
    
    wire MemToReg_EX2, MemToReg_EX3, MemToReg_EX4, MemToReg_EX5, MemToReg_EX6, MemToReg_EX7, MemToReg_EX8,
        RegWrite_EX2, RegWrite_EX3, RegWrite_EX4, RegWrite_EX5, RegWrite_EX6, RegWrite_EX7, RegWrite_EX8,
        jal_EX2, jal_EX3, jal_EX4, jal_EX5, jal_EX6, jal_EX7, jal_EX8, 
        Jump_EX2, Jump_EX3, Jump_EX4, Jump_EX5, Jump_EX6, Jump_EX7, Jump_EX8,
        JR_EX2, JR_EX3, JR_EX4, JR_EX5, JR_EX6, JR_EX7, JR_EX8,ALU_input_rs_MUX_EX2,ALU_input_rt_MUX_EX2;
        
    wire sad, sad_EX, sad_EX2, sad_EX3, sad_EX4, sad_EX5, sad_EX6, sad_EX7, sad_EX8,
         move, move_EX,move_EX2,ORGate_movecheck_out_EX1;
    
    wire [31:0] s5_wcol_value_ID,s0_numrow_value_ID,s1_cdif_value_ID,s2_it_value_ID, 
        t1_sad_value_ID, s4_frow_value_ID,s6_x_value_ID, s7_y_value_ID,t0_target_value_ID, a1_frame_value_ID,
        JumpPC_EX2, JumpPC_EX3, JumpPC_EX4, JumpPC_EX5, JumpPC_EX6, JumpPC_EX7, JumpPC_EX8,itxnumrow_out,itxnumrow_out_EX3,add7_out_1,
        add7_out_2,add7_out_3,add7_out_4,add_frame_out,ALUResult_EX2_MOVEMUX,sadMUX_regwrite_value,sadMUX_regwrite_value_MEM,
        sadMUX_regwrite_value_WB,add_y_itxnumrow,FinalOut, SAD_Out, thOut1,thOut2,thOut3,thOut4,
        fOut1,fOut2,fOut3,fOut4,fOut5,fOut6,fOut7,fOut8,fOut9,fOut10,fOut11,fOut12,fOut13,fOut14,fOut15,fOut16,
        Immediate_EX2;
        

    wire [31:0] s0_numrow_value_EX1, s0_numrow_value_EX2,
        s1_cdif_value_EX1, s1_cdif_value_EX2,
        s2_it_value_EX1, s2_it_value_EX2,
        t1_sad_value_EX1, t1_sad_value_EX2, t1_sad_value_EX3, t1_sad_value_EX4, t1_sad_value_EX5, t1_sad_value_EX6, t1_sad_value_EX7, t1_sad_value_EX8, t1_sad_value_MEM,
        s4_frow_value_EX1, s4_frow_value_EX2, s4_frow_value_EX3,
        s5_wcol_value_EX1, moveCheck_outValue, moveCheck_outValue_EX2,
        s6_x_value_EX1, s6_x_value_EX2, s6_x_value_EX3,
        s7_y_value_EX1, s7_y_value_EX2, s7_y_value_EX3,
        
        t0_target_value_EX1, t0_target_value_EX2, t0_target_value_EX3, t0_target_value_EX4, t0_target_value_EX5,
        outx, outx_EX2, outx_EX3, outx_EX4, outx_EX5, outx_EX6, outx_EX7, outx_EX8, outx_MEM,
        outy, outy_EX2, outy_EX3, outy_EX4, outy_EX5, outy_EX6, outy_EX7, outy_EX8, outy_MEM,
        a1_frame_value_EX1, a1_frame_value_EX2, a1_frame_value_EX3, a1_frame_value_EX4,
        
        In1, In2, In3, In4, In5, In6, In7, In8, In9, In10, In11, In12, In13, In14, In15, In16,
        In1_EX4, In2_EX4, In3_EX4, In4_EX4, In5_EX4, In6_EX4, In7_EX4, In8_EX4, In9_EX4, In10_EX4, In11_EX4, In12_EX4, In13_EX4, In14_EX4, In15_EX4, In16_EX4,
        Out1, Out2, Out3, Out4, Out5, Out6, Out7, Out8, Out9, Out10, Out11, Out12, Out13, Out14, Out15, Out16,
        tOut1, tOut2, tOut3, tOut4, tOut5, tOut6, tOut7, tOut8, tOut9, tOut10, tOut11, tOut12, tOut13, tOut14, tOut15, tOut16,
        Out1_EX5, Out2_EX5, Out3_EX5, Out4_EX5, Out5_EX5, Out6_EX5, Out7_EX5, Out8_EX5, Out9_EX5, Out10_EX5, Out11_EX5, Out12_EX5, Out13_EX5, Out14_EX5, Out15_EX5, Out16_EX5,
        tOut1_EX5, tOut2_EX5, tOut3_EX5, tOut4_EX5, tOut5_EX5, tOut6_EX5, tOut7_EX5, tOut8_EX5, tOut9_EX5, tOut10_EX5, tOut11_EX5, tOut12_EX5, tOut13_EX5, tOut14_EX5, tOut15_EX5, tOut16_EX5,
        
        ReadData1, ReadData2, ReadData3, ReadData4, ReadData5, ReadData6, ReadData7, ReadData8, ReadData9, ReadData10, ReadData11, ReadData12, ReadData13, ReadData14, ReadData15, ReadData16,
        tReadData1, tReadData2, tReadData3, tReadData4, tReadData5, tReadData6, tReadData7, tReadData8, tReadData9, tReadData10, tReadData11, tReadData12, tReadData13, tReadData14, tReadData15, tReadData16,
        ReadData1_EX6,ReadData2_EX6,ReadData3_EX6,ReadData4_EX6,ReadData5_EX6,ReadData6_EX6,ReadData7_EX6,ReadData8_EX6,ReadData9_EX6,
        ReadData10_EX6,ReadData11_EX6,ReadData12_EX6,ReadData13_EX6,ReadData14_EX6,ReadData15_EX6,ReadData16_EX6,
        tReadData1_EX6,tReadData2_EX6,tReadData3_EX6,tReadData4_EX6,tReadData5_EX6,tReadData6_EX6,tReadData7_EX6,tReadData8_EX6,
        tReadData9_EX6,tReadData10_EX6, tReadData11_EX6,tReadData12_EX6,tReadData13_EX6,tReadData14_EX6,tReadData15_EX6,tReadData16_EX6,

        sOut1, sOut2, sOut3, sOut4, sOut5, sOut6, sOut7, sOut8,
        sOut1_EX7,sOut2_EX7,sOut3_EX7,sOut4_EX7,sOut5_EX7,sOut6_EX7,sOut7_EX7,sOut8_EX7,

        foOut1, foOut2,
        foOut1_EX8, foOut2_EX8,
        
        mul6_out_1, mul6_out_1_EX3, mul6_out_2, mul6_out_2_EX3, mul6_out_3, mul6_out_3_EX3, mul6_out_4, mul6_out_4_EX3,
        mul_frow_out, mul_frow_out_EX4;
    wire [1:0] check_wcol_out, check_wcol_out_EX1, check_wcol_out_EX2, check_wcol_out_EX3;

    // DATAPATH START

// INSTRUCTION FETCH STAGE
    PCAdder PCAdder_1(PCResult, PCAddResult);   // PCAddResult --> 2x1Mux --> 2x1Mux --> 2x1Mux --> PC
 
    Mux32Bit2To1 Mux32Bit2To1_PCSrc(PCSrc_Result_MUX, PCAddResult, PCPlusOffset_ID, Branch); 
    Mux32Bit2To1 Mux32Bit2To1_jump(jump_Result_MUX, PCSrc_Result_MUX, JumpPC, jump); // debug these
    Mux32Bit2To1 Mux32Bit2To1_jr(jr_Result_MUX, jump_Result_MUX, rs_value_ID, jr);

    ProgramCounter ProgramCounter_1(jr_Result_MUX, PCResult, PC_Write, Reset, Clk);
    InstructionMemory InstructionMemory_1(PCResult, Instruction);
// END of IF
    // PIPELINE
    IF_ID_Reg IF_ID_Reg_1(PCAddResult, Instruction, PCAddResult_ID, Instruction_ID, IF_Flush, IF_ID_Write, Clk, Reset);
// DECODE STAGE
    Controller Controller_1(rsgz, tes, rsez, Instruction_ID, RegWrite, RegDst, ALUSrc, ALUOp, 
                            MemWrite, MemRead, MemToReg, Branch, jump, jal_RA, jr, isBranch, move, sad); // new controller signals needed (jump instruction, etc.)

    Mux5Bit2To1 Mux5Bit2To1_WriteReg(WriteReg_MUX, RegDst1Result_WB, 5'b11111, jal_Control);
    Mux32Bit2To1 Mux32Bit2To1_WriteData(WriteData_MUX, MemToReg_WB_MUX, PCAddResult_ID, jal_Control);

    ShiftLeft2 ShiftLeft2__1(Immediate_ID, ShiftLeft2Out_ID); // debug this

    Adder32Bit Adder32Bit_1(PCAddResult_ID, ShiftLeft2Out_ID, PCPlusOffset_ID); // debug this

    ORGate ORGate_RegWrite(RegWrite_WB, jal_RA, RegWrite_ORGate);

    //RegisterFile_ID RegisterFile_1(Instruction_ID[25:21], Instruction_ID[20:16], WriteReg_MUX, WriteData_MUX, RegWrite_ORGate, Clk, rs_value_ID, rt_value_ID);
                              //ReadRegister1     , ReadRegister2     , WriteRegister   , WriteData     , RegWrite, Clk, ReadData1  , ReadData2
    RegisterFile_ID RegisterFile_ID_1(Instruction_ID[25:21], Instruction_ID[20:16], WriteReg_MUX, WriteData_MUX, RegWrite_ORGate, Clk, 
						rs_value_ID, rt_value_ID,s0_numrow_value_ID,s1_cdif_value_ID,s2_it_value_ID, t1_sad_value_ID, s4_frow_value_ID, 
						s5_wcol_value_ID,s6_x_value_ID, s7_y_value_ID,t0_target_value_ID, a1_frame_value_ID);

    BranchCheck BranchCheck_1(BranchCheckMUX_rs, BranchCheckMUX_rt, rsgz, tes, rsez);
    SignExtension SignExtension_1(Instruction_ID[15:0], Immediate_ID[31:0]);
    JumpConcatenate JumpConcatenate_1(Instruction_ID[25:0], PCAddResult_ID[31:28], JumpPC);

// FORWARDING UNIT AND HAZARD DETECTION (AND MUXES)
//   ForwardingUnit ForwardingUnit_1(RegWrite_MEM, RegDst1Result_MEM, RegWrite_WB, RegDst1Result_WB, rs_address_EX, rt_address_EX, ALU_input_rs, ALU_input_rt, WriteMEMData_Signal);
//                                 EX_MEM_RegWrite,  EX_MEM_rd,   MEM_WB_RegWrite,   MEM_WB_rd,        ID_EX_rs,      ID_EX_rt, ALU_input_rs, ALU_input_rt, WriteMEMData_Signal
ForwardingUnit Forward_RT(RegWrite_MEM, RegDst1Result_MEM, RegWrite_WB, RegDst1Result_WB, rt_address_EX, ALU_input_rt, 
                    RegWrite_EX3,RegWrite_EX4,RegWrite_EX5,RegWrite_EX6,RegWrite_EX7,RegWrite_EX8,
                    RegDst1Result_EX3,RegDst1Result_EX4,RegDst1Result_EX5,RegDst1Result_EX6,RegDst1Result_EX7,RegDst1Result_EX8);

ForwardingUnit Forward_RS(RegWrite_MEM, RegDst1Result_MEM, RegWrite_WB, RegDst1Result_WB, rs_address_EX, ALU_input_rs, 
                    RegWrite_EX3,RegWrite_EX4,RegWrite_EX5,RegWrite_EX6,RegWrite_EX7,RegWrite_EX8,
                    RegDst1Result_EX3,RegDst1Result_EX4,RegDst1Result_EX5,RegDst1Result_EX6,RegDst1Result_EX7,RegDst1Result_EX8);

ForwardingUnitMEM Forward_MEMRT(RegWrite_MEM, RegDst1Result_MEM, RegWrite_WB, RegDst1Result_WB, RegDst1Result_EX8, WriteMEMData_SignalRT);
ForwardingUnitMEM Forward_MEMRS(RegWrite_MEM, RegDst1Result_MEM, RegWrite_WB, RegDst1Result_WB, rs_address_EX8, WriteMEMData_SignalRS);

ForwardingUnit_EX2 ForwardingUnit_EX2_1RS(rs_address_EX2,RegDst1Result_EX3, RegWrite_EX3, ALU_input_rs_MUX_EX2);
ForwardingUnit_EX2 ForwardingUnit_EX2_1RT(rt_address_EX2,RegDst1Result_EX3, RegWrite_EX3, ALU_input_rt_MUX_EX2);

    Mux32Bit9To1 Mux32Bit9To1_rs(rs_value_EX,ALUResult_EX3,ALUResult_EX4,ALUResult_EX5,ALUResult_EX6,ALUResult_EX7,
             sadMUX_regwrite_value, sadMUX_regwrite_value_MEM, MemToReg_WB_MUX, forward_rs_value, ALU_input_rs);
    Mux32Bit9To1 Mux32Bit9To1_rt(rt_value_EX,ALUResult_EX3,ALUResult_EX4,ALUResult_EX5,ALUResult_EX6,ALUResult_EX7,
             sadMUX_regwrite_value, sadMUX_regwrite_value_MEM, MemToReg_WB_MUX, forward_rt_value, ALU_input_rt);
//                              (A,B,C,out,sel)
    HazardDetection HazardDetection_1(RegDst_MUX, RegDst1Result_MEM, MemRead_EX,MemRead_MEM, Branch, jump, IF_Flush, Instruction_ID[25:21], Instruction_ID[20:16], PC_Write, IF_ID_Write, 
                                        ControlMuxSig, isBranch, RegWrite_EX, RegWrite_WB, RegDst1Result_WB, jal_RA/*, RegWrite_MEM */, jal_Control);
//FORWARDING UNIT FOR BRANCHING AND MUXES
    ForwardBranch ForwardBranch_1(Instruction_ID[25:21], Instruction_ID[20:16], RegDst1Result_MEM, RegWrite_MEM, rs_MUX, rt_MUX);
//                                  rs_ID,                      rt_ID,            EX_MEM_rd,      EX_MEM_RegWrite, rs_MUX, rt_MUX
    Mux32Bit2To1 Mux32Bit2To1_BRANCHrs(BranchCheckMUX_rs, rs_value_ID, sadMUX_regwrite_value_MEM, rs_MUX); 
    Mux32Bit2To1 Mux32Bit2To1_BRANCHrt(BranchCheckMUX_rt, rt_value_ID, sadMUX_regwrite_value_MEM, rt_MUX);
//                                      out, A, B, sel
// END of ID
    //PIPELINE
    ID_EX1_Reg ID_EX1_Reg_1(RegWrite, RegDst, ALUOp, ALUSrc, /*Branch,*/ MemWrite, MemToReg, MemRead, 
    rs_value_ID, rt_value_ID, Immediate_ID, Instruction_ID[25:21], Instruction_ID[20:16], Instruction_ID[15:11], /*PCAddResult_ID,*/ jal_RA, jump, jr, JumpPC,
    //                                          rs_address_ID  ^      rt_address_ID   ^    , rd_address_ID   ^
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
// EXECUTE 1 Stage
    ALUControl ALUControl_1(Immediate_EX[5:0], ALUOp_EX, rt_address_EX[0], ALUControl);
    Mux32Bit2To1 Mux32Bit2To1_ALUSrc(ALUSrc_MUX, rt_value_EX, Immediate_EX, ALUSrc_EX);



    
                                //out, A, B, sel
    Mux5Bit2To1 Mux5Bit2To1_RegDst(RegDst1Result_EX, rt_address_EX, rd_address_EX, ORGate_movecheck_out_EX1); //important for bit code for move

    //CUSTOM INSTRUCTION UNITS
    ORGate ORGate_movecheck(outRegister, RegDst_EX, ORGate_movecheck_out_EX1);
    MoveCheck MoveCheck_1(s6_x_value_EX1, s7_y_value_EX1, s1_cdif_value_EX1,move_EX, moveCheck_outValue, outRegister);
    CheckWindowColumns CheckWindowColums_1(s5_wcol_value_EX1, check_wcol_out);


// END of EX1
    // PIPELINE
    EX1_EX2_Reg EX1_EX2_Reg_1(/*PCPlusOffset_EX,*/ /* rt_Register_Value_EX,*/
    RegDst1Result_EX, /*Zero_EX,*/ MemWrite_EX, MemToReg_EX, MemRead_EX, /*Branch_EX,*/ RegWrite_EX, 
    jal_EX, Jump_EX, JR_EX, JumpPC_EX, rs_value_EX, rt_value_EX,/*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX2,*/
    RegDst1Result_EX2, /*Zero_MEM,*/ MemWrite_EX2, MemToReg_EX2, MemRead_EX2, /*Branch_MEM,*/ RegWrite_EX2, 
    jal_EX2, Jump_EX2, JR_EX2, JumpPC_EX2, rs_value_EX2, rt_value_EX2, Clk, Reset,    
    //registers for custom instruction EX1
    s0_numrow_value_EX1,s1_cdif_value_EX1, s2_it_value_EX1, t1_sad_value_EX1, s4_frow_value_EX1, sad_EX,moveCheck_outValue,
	s6_x_value_EX1, s7_y_value_EX1, t0_target_value_EX1, outx, outy, check_wcol_out, a1_frame_value_EX1,move_EX, 
    //registers for custom instruction EX2
    s0_numrow_value_EX2,s1_cdif_value_EX2,s2_it_value_EX2, t1_sad_value_EX2, s4_frow_value_EX2, sad_EX2,move_EX2,moveCheck_outValue_EX2,
	s6_x_value_EX2, s7_y_value_EX2,t0_target_value_EX2, outx_EX2, outy_EX2, check_wcol_out_EX2,a1_frame_value_EX2,
    //Registers for moving ALU
    ALUControl, Immediate_EX, forward_rs_value, forward_rt_value, rs_address_EX, rt_address_EX,
    ALUControl_EX2, Immediate_EX2,forward_rs_value_EX2, forward_rt_value_EX2,rs_address_EX2, rt_address_EX2
    ); 


//EX2 stage
    Mux32Bit2To1 Mux32Bit2To1_ALUINPUT_ForwardRS(ALU_Input_value_rs, forward_rs_value_EX2, ALUResult_EX3, ALU_input_rs_MUX_EX2);
    Mux32Bit2To1 Mux32Bit2To1_ALUINPUT_ForwardRT(ALU_Input_value_rt, forward_rt_value_EX2, ALUResult_EX3, ALU_input_rt_MUX_EX2);
    ALU32Bit ALU32Bit_1(ALUControl_EX2, ALU_Input_value_rs, ALU_Input_value_rt, Immediate_EX2, ALUResult_EX2 /*, Zero*/);

    Mux32Bit2To1 Mux32Bit2To1_Move_Value(ALUResult_EX2_MOVEMUX, ALUResult_EX2,moveCheck_outValue_EX2 , move_EX2);
    Multiplier32Bit Mul_it_numrow(s2_it_value_EX2, s0_numrow_value_EX2, itxnumrow_out); //multiplies the iterator and the initialized numrow value
    Gen_Mul_6 Gen_Mul_6_1(check_wcol_out_EX2, s4_frow_value_EX2, mul6_out_1,mul6_out_2,mul6_out_3,mul6_out_4);

//END EX2 stage
    //PIPELINE
    EX2_EX3_Reg EX2_EX3_Reg_1(ALUResult_EX2_MOVEMUX, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX2,*/
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
    mul6_out_1_EX3,mul6_out_2_EX3,mul6_out_3_EX3,mul6_out_4_EX3, itxnumrow_out_EX3,a1_frame_value_EX3,
    //EXTRA ADDITIONS
    rs_address_EX2,rs_address_EX3
    ); 
//EX3 stage
    Adder32Bit Add_y_itxnumrow_1(s7_y_value_EX3, itxnumrow_out_EX3, add_y_itxnumrow); //adds the iterator and numrow to the y coord  
    Gen_Add_16_7 Gen_Add_16_7_1(s6_x_value_EX3, mul6_out_1_EX3,mul6_out_2_EX3,mul6_out_3_EX3,mul6_out_4_EX3, 
        add7_out_1, add7_out_2, add7_out_3, add7_out_4);
    Gen_Add_16_8 Gen_Add_16_8_1(check_wcol_out_EX3, add7_out_1,add7_out_2, add7_out_3, add7_out_4, 
                In1,In2,In3,In4,In5,In6,In7,In8,In9,In10,In11,In12,In13,In14,In15,In16);
    Multiplier32Bit Mul_frow_result(add_y_itxnumrow, s4_frow_value_EX3, mul_frow_out); //multiplies the number of rows in the frame and the result from Add_y_itxnumrow
//END EX3 stage
    //PIPELINE
    EX3_EX4_Reg EX3_EX4_Reg_1(ALUResult_EX3, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX3,*/
    RegDst1Result_EX3, /*Zero_MEM,*/ MemWrite_EX3, MemToReg_EX3, MemRead_EX3, /*Branch_MEM,*/ RegWrite_EX3, 
    jal_EX3, Jump_EX3, JR_EX3, JumpPC_EX3, rs_value_EX3, rt_value_EX3, Clk, Reset,
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
    In14_EX4,In15_EX4,In16_EX4, mul_frow_out_EX4,
    //EXTRA ADDITIONS
    rs_address_EX3,rs_address_EX4
    ); 
//EX4 stage
    Adder32Bit Add_frame_result(mul_frow_out_EX4,a1_frame_value_EX4, add_frame_out); //adds frame base address to the result of Add_y_itxnumrow*frow
    Gen_Add_16_Final Gen_Add_16_Final_1(add_frame_out,
				In1_EX4,In2_EX4,In3_EX4,In4_EX4,In5_EX4,In6_EX4,In7_EX4,In8_EX4,In9_EX4,In10_EX4,In11_EX4,In12_EX4,In13_EX4,
                In14_EX4,In15_EX4,In16_EX4,
                Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9,Out10,Out11,Out12,Out13,Out14,Out15,Out16);
    Target_Add_16 Target_Add_16_1(t0_target_value_EX4,
                tOut1,tOut2,tOut3,tOut4,tOut5,tOut6,tOut7,tOut8,tOut9,tOut10,tOut11,tOut12,tOut13,tOut14,tOut15,tOut16);            
//END EX4 stage
    //PIPELINE
    EX4_EX5_Reg EX4_EX5_Reg_1(ALUResult_EX4, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX4, */
    RegDst1Result_EX4, /*Zero_MEM,*/ MemWrite_EX4, MemToReg_EX4, MemRead_EX4, /*Branch_MEM,*/ RegWrite_EX4, 
    jal_EX4, Jump_EX4, JR_EX4, JumpPC_EX4, rs_value_EX4,rt_value_EX4, Clk, Reset,
    //EX5
    ALUResult_EX5, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX5, */
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
    tOut13_EX5,tOut14_EX5,tOut15_EX5,tOut16_EX5,
    //EXTRA ADDITIONS
    rs_address_EX4,rs_address_EX5 
    ); 
//EX5 stage
    Memmory_16 Memory_16_Generate(Clk, Out1_EX5,Out2_EX5,Out3_EX5,Out4_EX5,Out5_EX5,Out6_EX5,Out7_EX5,Out8_EX5,Out9_EX5,Out10_EX5,
                Out11_EX5,Out12_EX5,Out13_EX5,Out14_EX5,Out15_EX5,Out16_EX5,
                ReadData1,ReadData2,ReadData3,ReadData4,ReadData5,ReadData6,ReadData7,ReadData8,ReadData9,ReadData10,
                ReadData11,ReadData12,ReadData13,ReadData14,ReadData15,ReadData16,
                sadMUX_regwrite_value_MEM, MemWrite_MEM, MemRead_EX5);
    Memmory_16 Memory_16_Target(Clk, tOut1_EX5,tOut2_EX5,tOut3_EX5,tOut4_EX5,tOut5_EX5,tOut6_EX5,tOut7_EX5,tOut8_EX5,tOut9_EX5,
                tOut10_EX5,tOut11_EX5,tOut12_EX5,tOut13_EX5,tOut14_EX5,tOut15_EX5,tOut16_EX5, 
                tReadData1,tReadData2,tReadData3,tReadData4,tReadData5,tReadData6,tReadData7,tReadData8,tReadData9,tReadData10,
                tReadData11,tReadData12,tReadData13,tReadData14,tReadData15,tReadData16,
                sadMUX_regwrite_value_MEM, MemWrite_MEM, MemRead_EX5);
    
//END EX5 stage
    //PIPELINE
    EX5_EX6_Reg EX5_EX6_Reg_1(ALUResult_EX5, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX5,*/
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
//EX6 stage
    Adder32bit_16 Adder_first_round(ReadData1_EX6,ReadData2_EX6,ReadData3_EX6,ReadData4_EX6,ReadData5_EX6,ReadData6_EX6,ReadData7_EX6,
        ReadData8_EX6,ReadData9_EX6,ReadData10_EX6,ReadData11_EX6,ReadData12_EX6,ReadData13_EX6,ReadData14_EX6,ReadData15_EX6,
        ReadData16_EX6,tReadData1_EX6,tReadData2_EX6,tReadData3_EX6,tReadData4_EX6,tReadData5_EX6,tReadData6_EX6,tReadData7_EX6,tReadData8_EX6,
        tReadData9_EX6,tReadData10_EX6, tReadData11_EX6,tReadData12_EX6,tReadData13_EX6,tReadData14_EX6,tReadData15_EX6,tReadData16_EX6,
                	fOut1,fOut2,fOut3,fOut4,fOut5,fOut6,fOut7,fOut8,fOut9,fOut10,fOut11,fOut12,fOut13,fOut14,fOut15,fOut16);
    Adder32bit_8 Adder_second_round(fOut1,fOut2,fOut3,fOut4,fOut5,fOut6,fOut7,fOut8,fOut9,fOut10,fOut11,fOut12,fOut13,fOut14,fOut15,fOut16,
                	sOut1,sOut2,sOut3,sOut4,sOut5,sOut6,sOut7,sOut8);
//END EX6 stage
    //PIPELINE
    EX6_EX7_Reg EX6_EX7_Reg_1(ALUResult_EX6, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX6,*/
    RegDst1Result_EX6, /*Zero_MEM,*/ MemWrite_EX6, MemToReg_EX6, MemRead_EX6, /*Branch_MEM,*/ RegWrite_EX6, 
    jal_EX6, Jump_EX6, JR_EX6, JumpPC_EX6, rs_value_EX6, rt_value_EX6,Clk, Reset,
    //EX7
    ALUResult_EX7, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX7,*/
    RegDst1Result_EX7, /*Zero_MEM,*/ MemWrite_EX7, MemToReg_EX7, MemRead_EX7, /*Branch_MEM,*/ RegWrite_EX7, 
    jal_EX7, Jump_EX7, JR_EX7, JumpPC_EX7, rs_value_EX7,rt_value_EX7,
    //registers for custom instruction EX6
    t1_sad_value_EX6, outx_EX6, outy_EX6,sad_EX6,
    sOut1,sOut2,sOut3,sOut4,sOut5,sOut6,sOut7,sOut8,
    //registers for custom instruction EX7
    t1_sad_value_EX7, outx_EX7, outy_EX7,sad_EX7,
    sOut1_EX7,sOut2_EX7,sOut3_EX7,sOut4_EX7,sOut5_EX7,sOut6_EX7,sOut7_EX7,sOut8_EX7,
    //EXTRA ADDITIONS
    rs_address_EX6,rs_address_EX7
    );
//EX7 stage
    Adder32bit_4 Adder_third_round(sOut1_EX7,sOut2_EX7,sOut3_EX7,sOut4_EX7,sOut5_EX7,sOut6_EX7,sOut7_EX7,sOut8_EX7,
                	thOut1,thOut2,thOut3,thOut4);
    Adder32bit_2 Adder_fourth_round(thOut1,thOut2,thOut3,thOut4,
                	foOut1,foOut2);
//END EX7 stage
    //PIPELINE
    EX7_EX8_Reg EX7_EX8_Reg_1(ALUResult_EX7, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX7,*/
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
    foOut1_EX8,foOut2_EX8,
    //EXTRA ADDITIONS
    rs_address_EX7,rs_address_EX8
    );
//EX8 stage
    Adder32Bit Adder_fifth_round(foOut1_EX8,foOut2_EX8, FinalOut);
    Adder32Bit Adder_incrementSAD(FinalOut, t1_sad_value_EX8, SAD_Out);
    Mux32Bit2To1 Mux32Bit2To1_SADorNot(sadMUX_regwrite_value, ALUResult_EX8,SAD_Out, sad_EX8);

    Mux32Bit3To1 Mux32Bit3To1_WriteMEMDataRT(ALUResult_EX8, sadMUX_regwrite_value_MEM, MemToReg_WB_MUX, WriteMEMData_MUXRS, WriteMEMData_SignalRT); //forward mux for datamemory
    Mux32Bit3To1 Mux32Bit3To1_WriteMEMDataRS(rs_value_EX8, sadMUX_regwrite_value_MEM, MemToReg_WB_MUX, WriteMEMData_MUX, WriteMEMData_SignalRS); //forward mux for datamemory
//END EX8 stage
    //PIPELINE
    EX8_MEM_Reg EX8_MEM_Reg_1(sadMUX_regwrite_value, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_EX8,*/
    RegDst1Result_EX8, /*Zero_MEM,*/ MemWrite_EX8, MemToReg_EX8, MemRead_EX8, /*Branch_MEM,*/ RegWrite_EX8, 
    jal_EX8, Jump_EX8, JR_EX8, JumpPC_EX8, rs_value_EX8,rt_value_EX8, Clk, Reset,
    //MEM
    sadMUX_regwrite_value_MEM, /*PCPlusOffset_MEM,*/ /* rt_Register_Value_MEM,*/
    RegDst1Result_MEM, /*Zero_MEM,*/ MemWrite_MEM, MemToReg_MEM, MemRead_MEM, /*Branch_MEM,*/ RegWrite_MEM, 
    jal_MEM, Jump_MEM, JR_MEM, JumpPC_MEM, rs_value_MEM,rt_value_MEM,WriteMEMData_MUX,WriteMEMData_MUX_MEM,WriteMEMData_MUXRS,WriteMEMData_MUXRS_MEM,
    //registers for custom instruction EX8
    t1_sad_value_EX8, outx_EX8, outy_EX8,
    //registers for custom instruction MEM
    t1_sad_value_MEM, outx_MEM, outy_MEM
    );
// MEMORY STAGE
    
    DataMemory DataMemory_1(WriteMEMData_MUX_MEMRS,WriteMEMData_MUX_MEM, MemWrite_MEM, MemRead_MEM, ReadData_MEM);

// END OF MEM
    // PIPELINE
    MEM_WB_Reg MEM_WB_Reg_1(ReadData_MEM, ReadData_WB,  
                  MemToReg_MEM, MemToReg_WB, RegWrite_MEM, RegWrite_WB,
                  RegDst1Result_MEM, RegDst1Result_WB, jal_MEM, jal_WB, Jump_MEM, Jump_WB, JR_MEM, JR_WB, Clk, Reset,
                  sadMUX_regwrite_value_MEM, sadMUX_regwrite_value_WB);

// BEGIN WB
    Mux32Bit2To1 Mux32Bit2To1_MemToReg(MemToReg_WB_MUX, sadMUX_regwrite_value_WB, ReadData_WB, MemToReg_WB);



endmodule