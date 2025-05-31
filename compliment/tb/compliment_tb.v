`timescale 1ns / 1ps

module tb_compliment;
  reg [3:0] A;
  wire [3:0] out;

  comp uut (
    .A(A),
    .out(out)
  );

  initial begin
    $display(" A  | 9's Complement");
    $display("----|----------------");
    for (A = 0; A <= 9; A = A + 1) begin
      #10;
      $display("%b | %b", A, out);
    end
    $finish;
  end
endmodule
