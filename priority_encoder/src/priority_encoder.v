`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2023 13:37:49
// Design Name: 
// Module Name: priority_encoder
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


module priority_encoder(I,v,y);
input [3:0]I;
output reg v;
output reg [1:0]y;

always@(I)
    casex(I)
        4'b0001 : {v,y} = 3'b100;
        4'b001x : {v,y} = 3'b101;
        4'b01xx : {v,y} = 3'b110;
        4'b1xxx : {v,y} = 3'b111;
        
        
        
        default : {v,y} = 3'b000;
    endcase
endmodule
