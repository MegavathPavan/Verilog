# Decimal 9's Complement Calculator (Verilog)

This project implements a 9's complement calculator for decimal digits (0–9) using Verilog HDL. It provides a simple module for computing the 9's complement of a 4-bit input and a testbench for simulation. This is useful for digital design students learning about complement systems and basic arithmetic operations.

---

## Directory Structure

```
compliment/
├── src/
│   └── compliment.v         # Main Verilog module for 9's complement calculation
├── tb/
│   └── compliment_tb.v      # Testbench for simulation
├── constraints/
│   └── compliment.xdc       # constraints for FPGA implementation
└── README.md
```

---

## File Analysis

### `src/compliment.v`
```verilog
module comp(A, out);
  input [3:0] A;
  output reg [3:0] out;

  always @(A)
    case(A)
      4'd0 : out = 4'd9;
      4'd1 : out = 4'd8;
      4'd2 : out = 4'd7;
      4'd3 : out = 4'd6;
      4'd4 : out = 4'd5;
      4'd5 : out = 4'd4;
      4'd6 : out = 4'd3;
      4'd7 : out = 4'd2;
      4'd8 : out = 4'd1;
      4'd9 : out = 4'd0;
    endcase
endmodule
```
- **Purpose:** Computes the 9's complement of a 4-bit binary input representing a decimal digit (0–9).
- **Details:** Uses a `case` statement to map each decimal digit to its 9's complement.
- **Note:** Input values outside 0–9 are not handled.

---

### `tb/compliment_tb.v`
```verilog
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
```
- **Purpose:** Testbench for the `comp` module.
- **Details:** Loops through all decimal digits 0–9, applies each to the module, and displays the input and its 9's complement in binary.
- **Output:** Prints a table of all decimal digits and their 9's complements.

---

## Simulation

You can simulate the design using Icarus Verilog:

```sh
iverilog -o compliment_tb compliment/tb/compliment_tb.v compliment/src/compliment.v
vvp compliment_tb
```

---

## Summary

- **Functionality:** Calculates 9's complement for decimal digits (0–9).
- **Design:** Simple, with explicit case mapping.
- **Use Case:** Educational, basic arithmetic modules.

---

## Author

LinkedIn: [**Megavath Pavan**](https://www.linkedin.com/in/megavath-pavan-1a4724262/)

---

## License

This project is open-source under the MIT License.
