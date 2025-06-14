`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2023 13:33:08
// Design Name: 
// Module Name: comp
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

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2023 12:41:34
// Design Name: 
// Module Name: tescomp
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


module comp(A,out);
input [3:0]A;
output reg [3:0]out;

always@(A)
    case(A)
        4'd0 : out = 4'd9;
        4'd1 : out = 4'd8;
        4'd2 : out = 4'd7;
        4'd3 : out = 4'd6;
        4'd4 : out = 4'd5;
        4'd5 : out = 4'd4;
        4'd6 : out = 4'd3;
        4'd7 : out = 4'd2;
        4'd8 : out = 4'd1;
        4'd9 : out = 4'd0;
    endcase
endmodule


