# N6 Multiplier in Verilog

This directory provides a parameterized 7-bit (n=6, 0-indexed) multiplier using structural Verilog. The design leverages custom shifter modules and a chain of full adders for computation.

---

## Directory Structure

```
n6_multiplier/
├── src/
│   ├── multiplier.v   # Main multiplier module (parameterized, uses shifter)
│   └── shifter.v      # Shifter module for input manipulation
├── constraints/
│   └── n6_multiplier.xdc # FPGA constraints file
└── README.md
```

---

## File Analysis

### `src/multiplier.v`

```verilog
module multiplier(In, Out);
  input [3:0] In;
  output [6:0] Out;

  wire [6:0] C;
  parameter n = 4'd7;
  assign C[0] = 0;
  wire [6:0] A, B;

  shifter sh1(In, A, 4'b01);
  shifter sh2(In, B, 4'b10);

  genvar k;
  generate
    for (k = 0; k < n; k = k + 1) begin: full_adder_stages
      assign Out[k] = A[k] ^ B[k] ^ C[k];
      assign C[k+1] = (A[k] & B[k]) | (A[k] & C[k]) | (B[k] & C[k]);
    end
  endgenerate
endmodule
```

- **Purpose:** Implements a 7-bit ripple-carry adder-based multiplier using shifted versions of the 4-bit input.
- **Key Features:**
  - Uses two shifted versions of the input (via shifter modules).
  - Computes the product using full-adder logic over 7 bits.
  - Parameterizable for different bit-widths.

---

### `src/shifter.v`

```verilog
module shifter(I, Out, S);
  input [3:0] I;
  input [1:0] S;
  output [6:0] Out;

  assign Out[0] = S[1] ? (S[0] ? 0 : 0) : (S[0] ? 0 : I[0]);
  assign Out[1] = S[1] ? (S[0] ? 0 : 0) : (S[0] ? I[0] : I[1]);
  assign Out[2] = S[1] ? (S[0] ? 0 : I[0]) : (S[0] ? I[1] : I[2]);
  assign Out[3] = S[1] ? (S[0] ? I[0] : I[1]) : (S[0] ? I[2] : I[3]);
  assign Out[4] = S[1] ? (S[0] ? I[1] : I[2]) : (S[0] ? I[3] : 0);
  assign Out[5] = S[1] ? (S[0] ? I[2] : I[3]) : (S[0] ? 0 : 0);
  assign Out[6] = S[1] ? (S[0] ? I[3] : 0) : (S[0] ? 0 : 0);
endmodule
```

- **Purpose:** Shifts a 4-bit input in various ways to generate partial products for multiplication.
- **Key Features:** 
  - Generates a 7-bit shifted output based on the shift select input.
  - Used to prepare partial operand vectors for the multiplier module.

---

## How the Multiplier Works

- The input `In` (4 bits) is shifted by two different amounts to create two 7-bit wide operands (`A` and `B`).
- These are then added using a chain of full adder stages (implemented via assign statements in a generate loop), accumulating carry bits.
- The result is a 7-bit product output in `Out`.

---

## Simulation & Usage

- Integrate a testbench (not included in this directory) to verify functionality.
- Synthesize and simulate on FPGA or in simulation tools like Icarus Verilog, ModelSim, etc.
- The design is ready for parameter extension to larger bit-widths by adjusting the parameter `n`.

---

## Author

LinkedIn: [**Megavath Pavan**](https://www.linkedin.com/in/megavath-pavan-1a4724262/)

---

## License

This project is open-source under the MIT License.
