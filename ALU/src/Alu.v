module alu (
    input [3:0] A, B,
    input [2:0] S,
    output reg [3:0] out
);

    always @(*) begin
        case (S)
            3'b000: out = 4'b0000;          // Clear
            3'b001: out = A + B;            // Addition
            3'b010: out = A - B;            // Subtraction
            3'b011: out = A & B;            // AND
            3'b100: out = A | B;            // OR
            3'b101: out = A ^ B;            // XOR
            3'b110: out = ~(A ^ B);         // XNOR
            3'b111: out = 4'b1111;          // Set
            default: out = 4'bxxxx;         // Undefined
        endcase
    end

endmodule
