`timescale 1ns / 1ps

module ForwardingUnit_EX2(rs_address_EX2,RegDst1Result_EX3, RegWrite_EX3, ALU_input_rs_MUXEX2);

    input RegWrite_MEM, RegWrite_WB,RegWrite_EX3,RegWrite_EX4,RegWrite_EX5,RegWrite_EX6,RegWrite_EX7,RegWrite_EX8;
    input [4:0] RegDst1Result_MEM, RegDst1Result_WB,RegDst1Result_EX3,RegDst1Result_EX4,RegDst1Result_EX5,RegDst1Result_EX6,RegDst1Result_EX7,RegDst1Result_EX8;
    input [4:0] rs_address_EX2;
    output reg ALU_input_rs;
    // MUX SIGNAL KEY:
    // 0 --> default
    // 1 --> EX3
    

    initial begin
            ALU_input_rs <= 0;

    end
        always @(*)begin
        
        if ((rs_address_EX2 == RegDst1Result_EX3) && RegWrite_EX3)begin
                ALU_input_rs <= 1;
        end
        else
            ALU_input_rs <= 0;
        
    end



endmodule