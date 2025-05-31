`timescale 1ns / 1ps

module tb_full_adder;

    reg [3:0] A, B;
    reg cin;
    wire [3:0] S;
    wire Cout, dummy_C3;

    bitadder uut (
        .A(A),
        .B(B),
        .CIN(cin),
        .S(S),
        .COUT(Cout),
        .C3(dummy_C3)
    );

    initial begin
        $dumpfile("fulladder.vcd");
        $dumpvars(0, tb_full_adder);

        A = 4'd4; B = 4'd2; cin = 0;
        #10;
        A = 4'd9; B = 4'd7; cin = 1;
        #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | A=%d, B=%d, Cin=%b => Sum=%d, Cout=%b", 
                 $time, A, B, cin, S, Cout);
    end

endmodule
