`timescale 1ns / 1ps

module ForwardingUnitMEM(RegWrite_MEM, RegDst1Result_MEM, RegWrite_WB, RegDst1Result_WB, rt_address_EX8, WriteMEMData_Signal);

    input RegWrite_MEM, RegWrite_WB;
    input [4:0] RegDst1Result_MEM, RegDst1Result_WB;
    input [4:0] rt_address_EX8;
    output reg [1:0] WriteMEMData_Signal;
    // MUX SIGNAL KEY:
    // 0 --> Default
    // 1 --> forwarding from Memory
    // 2 --> forwarding from WriteBack

    initial begin
            WriteMEMData_Signal <= 0;
    end
        always @(*)begin
        if ((rt_address_EX8 == RegDst1Result_WB) && RegWrite_WB)begin
            WriteMEMData_Signal <= 2;
        end
        else if ((rt_address_EX8 == RegDst1Result_MEM)&& RegWrite_MEM)begin
            WriteMEMData_Signal <= 1;
        end
        else
        WriteMEMData_Signal <= 0;
        
    end



endmodule