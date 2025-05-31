`timescale 1ns / 1ps

module tb_delay;

  reg A, B, C;
  wire Y;

  delay uut (
    .A(A),
    .B(B),
    .C(C),
    .Y(Y)
  );

  initial begin
    $dumpfile("delay.vcd");  // For waveform generation (optional)
    $dumpvars(0, tb_delay);

    A = 1; B = 1; C = 1;
    #40;

    A = 0; B = 1; C = 0;
    #40;

    A = 1; B = 0; C = 1;
    #40;

    $finish;
  end

  initial begin
    $monitor("Time: %0t | A=%b B=%b C=%b => Y=%b", $time, A, B, C, Y);
  end

endmodule
