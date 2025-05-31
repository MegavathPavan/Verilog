`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2023 13:06:35
// Design Name: 
// Module Name: bintog
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


module bintog(In,Out);
input [3:0]In;
output [3:0]Out;
assign Out[3]=In[3];
assign Out[2] = In[3]^In[2];
assign Out[1] = In[2]^In[1];
assign Out[0] =In[1]^In[0];

endmodule
