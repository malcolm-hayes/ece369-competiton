`timescale 1ns / 1ps

module ForwardingUnit(RegWrite_MEM, RegDst1Result_MEM, RegWrite_WB, RegDst1Result_WB, rs_address_EX1, ALU_input_rs, 
                    RegWrite_EX3,RegWrite_EX4,RegWrite_EX5,RegWrite_EX6,RegWrite_EX7,RegWrite_EX8,
                    RegDst1Result_EX3,RegDst1Result_EX4,RegDst1Result_EX5,RegDst1Result_EX6,RegDst1Result_EX7,RegDst1Result_EX8);

    input RegWrite_MEM, RegWrite_WB,RegWrite_EX3,RegWrite_EX4,RegWrite_EX5,RegWrite_EX6,RegWrite_EX7,RegWrite_EX8;
    input [4:0] RegDst1Result_MEM, RegDst1Result_WB,RegDst1Result_EX3,RegDst1Result_EX4,RegDst1Result_EX5,RegDst1Result_EX6,RegDst1Result_EX7,RegDst1Result_EX8;
    input [4:0] rs_address_EX1;
    output reg [3:0] ALU_input_rs;
    // MUX SIGNAL KEY:
    // 0 --> default
    // 1 --> EX3
    // 2 --> EX4
    // 3 --> EX5
    // 4 --> EX6
    // 5 --> EX7
    // 6 --> EX8
    // 7 --> forwarding from Memory
    // 8 --> forwarding from WriteBack

    initial begin
            ALU_input_rs <= 0;

    end
        always @(*)begin
        
        if ((rs_address_EX1 == RegDst1Result_EX3) && RegWrite_EX3)begin
                ALU_input_rs <= 1;
        end
        else if ((rs_address_EX1 == RegDst1Result_EX4) && RegWrite_EX4)begin
                ALU_input_rs <= 2;
        end
        else if ((rs_address_EX1 == RegDst1Result_EX5) && RegWrite_EX5)begin
                ALU_input_rs <= 3;
        end
        else if ((rs_address_EX1 == RegDst1Result_EX6) && RegWrite_EX6)begin
                ALU_input_rs <= 4;
        end
        else if ((rs_address_EX1 == RegDst1Result_EX7) && RegWrite_EX7)begin
                ALU_input_rs <= 5;
        end
        else if ((rs_address_EX1 == RegDst1Result_EX8) && RegWrite_EX8)begin
                ALU_input_rs <= 6;
        end
        else if ((rs_address_EX1 == RegDst1Result_MEM) && RegWrite_MEM)begin
                ALU_input_rs <= 7;
        end
        else if ((rs_address_EX1 == RegDst1Result_WB) && RegWrite_WB)begin
                ALU_input_rs <= 8;
        end
        else
            ALU_input_rs <= 0;
        
    end



endmodule