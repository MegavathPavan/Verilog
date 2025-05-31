`timescale 1ns / 1ps
module multiplier_tb();

reg [3:0] In;
reg loadB, loadC, start, reset, clk;
wire [3:0] A, B, C;
wire clkout;

multip UUT (
    .In(In),
    .loadB(loadB),
    .loadC(loadC),
    .start(start),
    .reset(reset),
    .clk(clk),
    .A(A),
    .B(B),
    .C(C),
    .clkout(clkout)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 100MHz clock
end

initial begin
    // Initialize signals
    In = 0; loadB = 0; loadC = 0; start = 0; reset = 1;
    #20;
    reset = 0;

    // Load B = 3
    In = 4'd3;
    loadB = 1; loadC = 0;
    #10;
    loadB = 0;

    // Load C = 5
    In = 4'd5;
    loadC = 1;
    #10;
    loadC = 0;

    // Start multiplication
    start = 1;
    #100;
    start = 0;

    #100 $finish;
end

endmodule
