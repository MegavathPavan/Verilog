`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module: BCD Adder and 7-segment Decoder
//////////////////////////////////////////////////////////////////////////////////

module decode(A, out);
    input [3:0] A;
    output [6:0] out;
    assign out[6] = ~((~A[2]&~A[0]) | (A[2]&A[0]) | A[3] | A[1]);
    assign out[5] = ~((~A[2]) | (~A[1]&~A[0]) | (A[1]&A[0]));
    assign out[4] = ~((~A[1]) | A[0] | A[2]);
    assign out[3] = ~((~A[2]&~A[0]) | (~A[2]&A[1]) | (A[2]&~A[1]&A[0]) | (A[1]&~A[0]) | A[3]);
    assign out[2] = ~((~A[2]&~A[0]) | (A[1]&~A[0]));
    assign out[1] = ~((~A[1]&~A[0]) | (A[2]&~A[1]) | (A[2]&~A[0]) | A[3]);
    assign out[0] = ~((~A[2]&A[1]) | (A[2]&~A[1]) | A[3] | (A[2]&~A[0]));
endmodule

module add(A, B, S1, S2);
    input [3:0] A, B;
    output reg [3:0] S1, S2;
    reg [7:0] Z;

    always @ (A, B) begin
        Z = A + B;
        if (Z > 9)
            {S2, S1} = Z + 6; // BCD correction
        else
            {S2, S1} = Z;
    end
endmodule
