`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: bcd_adder
// Description: Adds two BCD digits and outputs BCD result
//////////////////////////////////////////////////////////////////////////////////

module bcd_adder (
    input [3:0] A,
    input [3:0] B,
    output reg [3:0] S1,  // Units
    output reg [3:0] S2   // Tens (carry)
);

reg [7:0] Z;

always @(A, B) begin
    Z = A + B;
    if (Z > 9)
        {S2, S1} = Z + 6;
    else
        {S2, S1} = Z;
end

endmodule
