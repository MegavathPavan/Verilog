`timescale 1ns / 1ps

module tb_d_flip_flop;
  reg D, E;
  wire Q;

  d_flip_flop uut (
    .D(D),
    .E(E),
    .Q(Q)
  );

  initial begin
    $monitor("Time: %0t, D=%b, E=%b, Q=%b", $time, D, E, Q);
    
    D = 0; E = 0;
    #10 D = 1; E = 1;
    #10 E = 0;
    #10 D = 0; E = 1;
    #10 E = 0;
    #10 D = 1; E = 1;
    #10 E = 0;
    #10 $finish;
  end
endmodule
