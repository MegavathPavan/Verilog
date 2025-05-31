`timescale 1ns / 1ps

module and_tb;

    reg A, B;
    wire C;

    and_gate uut (
        .A(A), .B(B), .C(C)
    );

    initial begin
        $display("Time\tA B | C");
        $monitor("%g\t%b %b | %b", $time, A, B, C);

        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;

        #10 $finish;
    end

endmodule
