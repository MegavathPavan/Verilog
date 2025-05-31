`timescale 1ns / 1ps

module sim();
    reg [3:0] A, B;
    reg M, C;
    wire [3:0] OUT;
    wire cout, ov;

    sub uut(
        .A(A), .B(B), .M(M), .C(C),
        .OUT(OUT), .ov(ov), .cout(cout)
    );

    initial begin
        $monitor("Time=%0t A=%d B=%d M=%b C=%b -> OUT=%b cout=%b ov=%b", $time, A, B, M, C, OUT, cout, ov);

        A = 4'd5; B = 4'd2; M = 0; C = 0; // Addition
        #20;
        M = 1; // Subtraction
        #20;
        C = 1; // Comparison
        #20;

        $finish;
    end
endmodule
