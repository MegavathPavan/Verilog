`timescale 1ns / 1ps

module tb_bitwise_ones_counter;

    reg [3:0] In;
    wire [2:0] out;

    bitwise_ones_counter uut (
        .In(In),
        .out(out)
    );

    initial begin
        $dumpfile("bitwise_ones_counter.vcd");
        $dumpvars(0, tb_bitwise_ones_counter);
        $monitor("Time=%0t | In=%b => Out=%b (Count = %d)", $time, In, out, out);

        // Test all inputs 0 to 15 (all possible 4-bit combinations)
        for (integer i = 0; i < 16; i = i + 1) begin
            In = i;
            #10;
        end

        $finish;
    end

endmodule
