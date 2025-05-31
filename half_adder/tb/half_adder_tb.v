`timescale 1ns / 1ps

module tb_half_adder;

    reg a, b;
    wire s, c;

    half_adder uut (
        .a(a),
        .b(b),
        .s(s),
        .c(c)
    );

    initial begin
        $dumpfile("half_adder.vcd");
        $dumpvars(0, tb_half_adder);
        
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | a=%b b=%b => s=%b c=%b", $time, a, b, s, c);
    end

endmodule
