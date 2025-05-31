`timescale 1ns / 1ps

module tb_bin_to_gray;
  reg [3:0] bin;
  wire [3:0] gray;

  bintog uut (
    .In(bin),
    .Out(gray)
  );

  initial begin
    $display("Binary\tGray");
    for (bin = 0; bin < 16; bin = bin + 1) begin
      #10;
      $display("%b\t%b", bin, gray);
    end
    $finish;
  end
endmodule
