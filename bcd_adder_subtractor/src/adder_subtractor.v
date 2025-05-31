`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 
// Module: adder_subtractor
// Description: Top-level module to perform BCD addition or subtraction
//////////////////////////////////////////////////////////////////////////////////

module adder_subtractor(A, B, M, S, cout, bcd2, neg);
    input [3:0] A, B;
    input M; // 0: Add, 1: Subtract
    output [3:0] S, cout;
    output [6:0] bcd2, neg;

    wire [3:0] comp, Bin, Z, cz, out;
    wire con;

    tescomp com(B, comp);

    assign Bin = M ? comp : B;

    add A1(A, Bin, out, Z);

    tescomp com2(out, cz);
    assign con = ~Z[0] & M;
    assign cout = Z;

    assign S = con ? cz : out;

    wire [6:0] bcd1;
    decode firstdis(Z, bcd1);
    decode seconddis(S, bcd2);

    assign neg = con ? 7'b1111110 : bcd1;
endmodule

// Testbench
module sim();
    reg [3:0] A, B;
    reg cin;
    wire [3:0] S, cout;
    wire [6:0] first, second;

    adder_subtractor uut(A, B, cin, S, cout, second, first);

    initial begin
        A = 4'd6; B = 4'd9; cin = 0;
        #10 cin = 1;
        #10 $finish;
    end
endmodule
