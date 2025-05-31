`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2023 16:47:52
// Design Name: 
// Module Name: bitadder
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

module fulladder(A,B,C,s,c);
input A,B,C;
output s,c;

assign s = A^B^C;
assign c = A&B|B&C|C&A;
endmodule

module bitadder(A,B,CIN,S,COUT,C3);
input [3:0]A,B;
input CIN;
output [3:0] S;
output COUT,C3;
fulladder F1(A[0],B[0],CIN,S[0],C1);
fulladder F2(A[1],B[1],C1,S[1],C2);
fulladder F3(A[2],B[2],C2,S[2],C3);
fulladder F4(A[3],B[3],C3,S[3],COUT);

endmodule