`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: decoder
// Description: Converts 4-bit input to 7-segment display encoding
//////////////////////////////////////////////////////////////////////////////////

module decoder (
    input [3:0] A,
    output [6:0] out
);

assign out[6] = ~((~A[2] & ~A[0]) | (A[2] & A[0]) | A[3] | A[1]);
assign out[5] = ~((~A[2]) | (~A[1] & ~A[0]) | (A[1] & A[0]));
assign out[4] = ~((~A[1]) | A[0] | A[2]);
assign out[3] = ~((~A[2] & ~A[0]) | (~A[2] & A[1]) | (A[2] & ~A[1] & A[0]) | (A[1] & ~A[0]) | A[3]);
assign out[2] = ~((~A[2] & ~A[0]) | (A[1] & ~A[0]));
assign out[1] = ~((~A[1] & ~A[0]) | (A[2] & ~A[1]) | (A[2] & ~A[0]) | A[3]);
assign out[0] = ~((~A[2] & A[1]) | (A[2] & ~A[1]) | A[3] | (A[2] & ~A[0]));

endmodule
