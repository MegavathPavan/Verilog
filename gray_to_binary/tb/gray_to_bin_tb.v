`timescale 1ns / 1ps

module tb_gray_to_binary;

    reg [3:0] In;
    wire [3:0] Out;

    gtob uut (
        .In(In),
        .Out(Out)
    );

    initial begin
        $dumpfile("gray_to_binary.vcd");
        $dumpvars(0, tb_gray_to_binary);

        In = 4'b0101; #10;  // Gray: 0101 → Binary: 0111
        In = 4'b1100; #10;  // Gray: 1100 → Binary: 1010
        In = 4'b0000; #10;  // Gray: 0000 → Binary: 0000
        In = 4'b1111; #10;  // Gray: 1111 → Binary: 1000

        $finish;
    end

    initial begin
        $monitor("Time=%0t | Gray=%b => Binary=%b", $time, In, Out);
    end

endmodule
