`timescale 1ns / 1ps

module ForwardingUnit_EX2(rs_address_EX2,RegDst1Result_EX3, RegWrite_EX3, ALU_input_rs_MUXEX2);

    input RegWrite_EX3;
    input [4:0] RegDst1Result_EX3;
    input [4:0] rs_address_EX2;
    output reg ALU_input_rs_MUXEX2;
    // MUX SIGNAL KEY:
    // 0 --> default
    // 1 --> EX3
    

    initial begin
            ALU_input_rs_MUXEX2 <= 0;

    end
        always @(*)begin
        
        if ((rs_address_EX2 == RegDst1Result_EX3) && RegWrite_EX3)begin
                ALU_input_rs_MUXEX2 <= 1;
        end
        else
            ALU_input_rs_MUXEX2 <= 0;
        
    end



endmodule