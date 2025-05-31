`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: fulladder
// Description: 1-bit Full Adder used inside 4-bit Subtractor
//////////////////////////////////////////////////////////////////////////////////
module fulladder (
    input A, B, C,
    output s, cout
);
    assign s = A ^ B ^ C;
    assign cout = (A & B) | (B & C) | (C & A);
endmodule

//////////////////////////////////////////////////////////////////////////////////
// Module Name: sub
// Description: 4-bit Adder/Subtractor with comparison outputs (A==B, A<B, A>B)
// Inputs: 
//   A, B: 4-bit inputs
//   M: Mode (0 for addition, 1 for subtraction)
//   C: Comparison mode selector (1 = comparison output on OUT[1:0])
// Outputs:
//   OUT: 4-bit result or comparison
//   ov: Overflow flag
//   cout: Final carry-out
//////////////////////////////////////////////////////////////////////////////////
module sub (
    input [3:0] A, B,
    input M, C,
    output [3:0] OUT,
    output ov, cout
);
    wire [3:0] BO;
    wire [3:0] S;
    wire C1, C2, C3;
    wire AeB, AgB, AlB;

    // Invert B bits if subtraction mode
    assign BO = B ^ {4{M}};

    // Chain full adders
    fulladder F1(A[0], BO[0], M,   S[0], C1);
    fulladder F2(A[1], BO[1], C1, S[1], C2);
    fulladder F3(A[2], BO[2], C2, S[2], C3);
    fulladder F4(A[3], BO[3], C3, S[3], cout);

    // Overflow detection
    assign ov = C3 ^ cout;

    // Comparison logic
    nor (AeB, S[0], S[1], S[2], S[3]); 
    assign AgB = ~(ov ^ S[3]) & (S[0] | S[1] | S[2]);
    assign AlB = ov ^ S[3];

    // Output MUX between arithmetic result and comparison
    assign OUT[0] = C ? AeB : S[0];
    assign OUT[1] = C ? AlB : S[1];
    assign OUT[2] = C ? AgB : S[2];
    assign OUT[3] = C ? 0    : S[3];
endmodule
