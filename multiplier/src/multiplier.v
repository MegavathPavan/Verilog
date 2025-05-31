`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2023 13:29:24
// Design Name: 
// Module Name: multip
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
module full_adder(A,B,Cin,S,Cout);
input A,B,Cin;
output S,Cout;
assign S = A^B^Cin;
assign Cout = (A&B)|(B&Cin)|(Cin&A);
endmodule

module four_bit_adder(A,B,S,Cout,Cin);
input Cin;
input [3:0]A,B;
output [3:0]S;
output Cout;
full_adder F1(A[0],B[0],Cin,S[0],C1);
full_adder F2(A[1],B[1],C1,S[1],C2);
full_adder F3(A[2],B[2],C2,S[2],C3);
full_adder F4(A[3],B[3],C3,S[3],Cout);

endmodule

module clock_divider(input clkin, output clkout);
reg[27:0] counter=28'd0;
always @(posedge clkin)
    counter <= counter + 28'd1;
    assign clkout = counter[27];
endmodule

module multip(loadB,loadC,In,A,B,C,start,reset,clk,clkout);
input [3:0]In;
input loadB,loadC,start,reset,clk;
output reg [3:0]A,B;
output clkout;
output reg [3:0]C = 4'b0000;
clock_divider cl(clk,clkout);
wire [3:0]af_and,sout;
assign af_and[0] = C[0]&B[0];
assign af_and[1] = C[1]&B[0];
assign af_and[2] = C[2]&B[0];
assign af_and[3] = C[3]&B[0];



wire Cout;
four_bit_adder F1(A,af_and,sout,Cout,1'b0);

always@(posedge clkout)
begin
    if(start == 1)
        begin
        A[0] = sout[1];
        A[1] = sout[2];
        A[2] = sout[3];
        A[3] = Cout;
        
        B[3] <= sout[0];
        B[2] <= B[3];
        B[1] <= B[2];
        B[0] <= B[1];
        end
    else 
    begin
    if (loadC == 1)
        C = In;
    if(loadB == 1)
        B = In;
    if (reset == 1)
        begin
        B = 4'b0000;
        C = 4'b0000;
        A = 4'b0000;
        end
    end
end

endmodule
