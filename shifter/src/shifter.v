`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2023 13:31:53
// Design Name: 
// Module Name: shifter
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


module shifter(I,Out,S );
input [3:0]I;
input [1:0]S;
output [6:0]Out;

assign Out[0] = S[1]?(S[0]?0:0):(S[0]?0:I[0]);
assign Out[1] = S[1]?(S[0]?0:0):(S[0]?I[0]:I[1]);
assign Out[2] = S[1]?(S[0]?0:I[0]):(S[0]?I[1]:I[2]);
assign Out[3] = S[1]?(S[0]?I[0]:I[1]):(S[0]?I[2]:I[3]);
assign Out[4] = S[1]?(S[0]?I[1]:I[2]):(S[0]?I[3]:0);
assign Out[5] = S[1]?(S[0]?I[2]:I[3]):(S[0]?0:0);
assign Out[6] = S[1]?(S[0]?I[3]:0):(S[0]?0:0);

endmodule
