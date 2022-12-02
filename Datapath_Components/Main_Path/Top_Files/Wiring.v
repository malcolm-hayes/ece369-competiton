`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members: Malcolm Hayes, Sam Kerns, Jaeden Carpenter
// Overall percent effort of each team meber: 33% each 
// 
// ECE369A - Computer Architecture
//  THIS SHOULD NOT BE SET AS TOP FILE, SET Top_Board AS TOP FILE!!!!!!!!!!!!!!!!!!
//  THIS SHOULD NOT BE SET AS TOP FILE, SET Top_Board AS TOP FILE!!!!!!!!!!!!!!!!!!

module Top(Clk, Reset, v0_Out, v1_Out);

    output wire [31:0] v0_Out, v1_Out;
    
    IFU:
    Controller:

    //SAD16

    CheckWindowColumns CheckWindowColums_1(window_columns, check_wcol_out);
    //Arithmetic and memmory for generated window
    Gen_Mul_6 Gen_Mul_6_1(check_wcol_out, frow, mul_out_1,mul_out_2,mul_out_3,mul_out_4);
    Gen_Add_16_7 Gen_Add_16_7_1(x, mul_out_1,mul_out_2,mul_out_3,mul_out_4, add7_out_1, add7_out_2, add7_out_3, add7_out_4);
    Gen_Add_16_8 Gen_Add_16_8_1(check_wcol_out, add7_out_1,add7_out_2, add7_out_3, add7_out_4, 
                In1,In2,In3,In4,In5,In6,In7,In8,In9,In10,In11,In12,In13,In14,In15,In16);
    Gen_Add_16_Final Gen_Add_16_Final_1(add4_out,
				In1,In2,In3,In4,In5,In6,In7,In8,In9,In10,In11,In12,In13,In14,In15,In16,
                Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9,Out10,Out11,Out12,Out13,Out14,Out15,Out16);
    Memmory_16_Generate Memmory_16_Generate(Clk, Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9,Out10,Out11,Out12,Out13,Out14,Out15,Out16);
    
    //Arithmetic and Memmory for target window
    Target_Add_16 Target_Add_16_1(target_window, Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9,Out10,Out11,Out12,Out13,Out14,Out15,Out16);
    Memmory_16_Generate Memmory_16_Target(Clk, Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9,Out10,Out11,Out12,Out13,Out14,Out15,Out16);
    
    //Pipelines for SAD function
    IF_ID_Reg:
    ID_EX1_Reg:
    EX1_EX2_Reg:
    EX2_EX3_Reg:
    EX3_EX4_Reg:
    EX4_EX5_Reg:
    EX5_EX6_Reg:
    EX6_MEM_Reg:
    MEM_WB_Reg:
    //

    


endmodule