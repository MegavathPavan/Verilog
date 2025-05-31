`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2023 13:55:00
// Design Name: 
// Module Name: dec
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


module dec(s,e,y );
input [1:0]s;
input e;
output reg [3:0]y;

always@(e,s)
    begin y = 4'b0000;
        if(e)
            begin
                if(s==2'b00)
                    y = 4'b0001;
                else if(s==2'b01)
                    y= 4'b0010;
                else if(s==2'b10)
                    y=4'b0100;
                else 
                    y=4'b1000;
            end
       end
                    
endmodule
