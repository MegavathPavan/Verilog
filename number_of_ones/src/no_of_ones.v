`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2023 13:58:29
// Design Name: 
// Module Name: new
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


module new(In , out);
input [3:0]In;
output [2:0]out;
assign out[0] = In[3]^In[2]^In[1]^In[0];
assign out[2] = In[3]&In[2]&In[1]&In[0];
assign out[1] = (~In[3]&In[1]&In[0])|(In[2]&In[1]&~In[0])|(In[3]&~In[2]&In[1])|((In[3]|In[2])&(~In[1]&In[0]))|(In[3]&In[2]&~In[1]);

endmodule

