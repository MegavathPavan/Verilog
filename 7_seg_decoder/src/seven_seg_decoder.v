`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module: decode
// Description: 4-bit to 7-segment display decoder
// Inputs: A[3:0] - 4-bit input
// Outputs: out[6:0] - 7-segment display output (a-g)
// Note: Assumes common cathode display (active-high segments)
//        Modify logic for common-anode if required.
//////////////////////////////////////////////////////////////////////////////////

module decode (
    input [3:0] A,
    output [6:0] out
);

    assign out[6] = ~((~A[2] & ~A[0]) | (A[2] & A[0]) | A[3] | A[1]); // Segment a
    assign out[5] = ~((~A[2]) | (~A[1] & ~A[0]) | (A[1] & A[0]));     // Segment b
    assign out[4] = ~((~A[1]) | A[0] | A[2]);                         // Segment c
    assign out[3] = ~((~A[2] & ~A[0]) | (~A[2] & A[1]) | 
                      (A[2] & ~A[1] & A[0]) | (A[1] & ~A[0]) | A[3]); // Segment d
    assign out[2] = ~((~A[2] & ~A[0]) | (A[1] & ~A[0]));              // Segment e
    assign out[1] = ~((~A[1] & ~A[0]) | (A[2] & ~A[1]) | 
                      (A[2] & ~A[0]) | A[3]);                         // Segment f
    assign out[0] = ~((~A[2] & A[1]) | (A[2] & ~A[1]) | 
                      A[3] | (A[2] & ~A[0]));                         // Segment g

endmodule
