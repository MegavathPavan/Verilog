`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2023 13:28:56
// Design Name: 
// Module Name: multiplier
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



module multiplier(In,Out);
input [3:0]In;
output [6:0]Out;

wire [6:0]C;
parameter n =4'd7;
assign C[0] = 0;
wire[6:0]A,B;
shifter sh1(In,A,4'b01);
shifter sh2(In,B,4'b10);
genvar k;

generate
    for(k=0;k<n;k=k+1)
    begin:full_adder_stages
        assign Out[k] = A[k]^B[k]^C[k];
        assign C[k+1] = (A[k]&B[k])|(A[k]&C[k])|(B[k]&C[k]);
     end
endgenerate
        
endmodule
