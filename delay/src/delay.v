`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2023 13:05:27
// Design Name: 
// Module Name: delay
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


module delay(A,B,C,Y);

input A,B,C;
output Y;
wire w1,w2,k;
not #(10) N(k,A);
and #(10) A1(w1,k,B);
and #(10) A2(w2,A,C);
or #(10) O(Y,w1,w2);

endmodule