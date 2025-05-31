`timescale 1ns / 1ps

module dec_tb;

reg [1:0] s;
reg e;
wire [3:0] y;

dec uut (
    .s(s),
    .e(e),
    .y(y)
);

initial begin
    $dumpfile("dec_tb.vcd");
    $dumpvars(0, dec_tb);

    // Case: Enable low
    e = 0; s = 2'b00; #10;
    $display("e=%b, s=%b => y=%b", e, s, y);

    // Enable high, all s values
    e = 1; s = 2'b00; #10;
    $display("e=%b, s=%b => y=%b", e, s, y);

    s = 2'b01; #10;
    $display("e=%b, s=%b => y=%b", e, s, y);

    s = 2'b10; #10;
    $display("e=%b, s=%b => y=%b", e, s, y);

    s = 2'b11; #10;
    $display("e=%b, s=%b => y=%b", e, s, y);

    $finish;
end

endmodule
