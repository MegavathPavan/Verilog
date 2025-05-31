`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module: tescomp
// Description: Computes 9's complement of a 4-bit BCD digit
//////////////////////////////////////////////////////////////////////////////////

module tescomp(A, out);
    input [3:0] A;
    output reg [3:0] out;

    always @(A)
        case (A)
            4'd0: out = 4'd0;
            4'd1: out = 4'd9;
            4'd2: out = 4'd8;
            4'd3: out = 4'd7;
            4'd4: out = 4'd6;
            4'd5: out = 4'd5;
            4'd6: out = 4'd4;
            4'd7: out = 4'd3;
            4'd8: out = 4'd2;
            4'd9: out = 4'd1;
            default: out = 4'd0;
        endcase
endmodule
