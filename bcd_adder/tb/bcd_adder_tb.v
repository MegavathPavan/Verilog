`timescale 1ns / 1ps

module bcd_adder_tb;

    reg [3:0] A, B;
    wire [3:0] S1, S2;

    bcd_adder uut (
        .A(A),
        .B(B),
        .S1(S1),
        .S2(S2)
    );

    initial begin
        $display("Time\tA B | S2 S1");
        $monitor("%g\t%0d %0d | %0d %0d", $time, A, B, S2, S1);

        A = 4'd0; B = 4'd0; #10;
        A = 4'd5; B = 4'd3; #10;
        A = 4'd6; B = 4'd7; #10;
        A = 4'd9; B = 4'd9; #10;
        A = 4'd4; B = 4'd6; #10;

        #10 $finish;
    end

endmodule
