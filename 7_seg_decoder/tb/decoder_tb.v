`timescale 1ns / 1ps

module decoder_tb();
    reg [3:0] A;
    wire [6:0] out;

    decode uut (
        .A(A),
        .out(out)
    );

    initial begin
        $monitor("Time = %0t | A = %b (%d) -> out = %b", $time, A, A, out);
        for (A = 0; A < 16; A = A + 1) begin
            #10;
        end
        $finish;
    end
endmodule
