`timescale 1ns / 1ps

module Alu_tb;

    reg [3:0] A, B;
    reg [2:0] S;
    wire [3:0] out;

    alu uut (
        .A(A), .B(B), .S(S), .out(out)
    );

    initial begin
        $display("Time\tA\tB\tS\tOUT");
        $monitor("%g\t%b\t%b\t%b\t%b", $time, A, B, S, out);

        A = 4'b0011; B = 4'b0001;
        for (S = 0; S < 8; S = S + 1)
            #10;

        #10 $finish;
    end

endmodule
