`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2023 14:36:20
// Design Name: 
// Module Name: flip_flop
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module latch(D,E,Q);
input D,E;
output reg Q;

always@(D,E)
    begin
        if(E==1)
            Q=D;
    end
endmodule

module d_flip_flop(D,E,Q);
input D,E;
output Q;
wire Q1;
latch L1(D,E,Q1);
latch L2(Q1,~E,Q);
endmodule