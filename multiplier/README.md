# 4-Bit Multiplier in Verilog

This directory contains a structural and behavioral implementation of a sequential 4-bit multiplier in Verilog, including a testbench for simulation and verification.

---

## Directory Structure

```
multiplier/
├── src/
│   └── multiplier.v       # Main Verilog module for multiplication (with supporting modules)
├── tb/
│   └── multiplier_tb.v    # Testbench for the multiplier
├── constraints/
│   └── multiplier_pynq.xdc  # FPGA constraint file
│   └── addon.xdc          # FPGA constraint file
└── README.md
```

---

## File Analysis

### `src/multiplier.v`

This file contains several modules to support multiplication logic:

#### 1. `full_adder`
```verilog
module full_adder(A, B, Cin, S, Cout);
  input A, B, Cin;
  output S, Cout;
  assign S = A ^ B ^ Cin;
  assign Cout = (A & B) | (B & Cin) | (Cin & A);
endmodule
```
- **Purpose:** Single-bit full adder used in the 4-bit adder.

#### 2. `four_bit_adder`
```verilog
module four_bit_adder(A, B, S, Cout, Cin);
  input Cin;
  input [3:0] A, B;
  output [3:0] S;
  output Cout;
  full_adder F1(A[0], B[0], Cin, S[0], C1);
  full_adder F2(A[1], B[1], C1, S[1], C2);
  full_adder F3(A[2], B[2], C2, S[2], C3);
  full_adder F4(A[3], B[3], C3, S[3], Cout);
endmodule
```
- **Purpose:** Chains four full adders to add two 4-bit numbers, with optional carry-in.

#### 3. `clock_divider`
```verilog
module clock_divider(input clkin, output clkout);
  reg [27:0] counter = 28'd0;
  always @(posedge clkin)
    counter <= counter + 28'd1;
  assign clkout = counter[27];
endmodule
```
- **Purpose:** Reduces the input clock frequency for slower sequential logic.

#### 4. `multip` (Main Multiplier Logic)
- **Inputs:** 4-bit operand `In`, control signals (`loadB`, `loadC`, `start`, `reset`, `clk`)
- **Outputs:** 4-bit registers `A`, `B`, `C`, and divided clock `clkout`
- **Highlights:**
  - Supports loading of operands into internal registers.
  - Uses custom clock division for sequential operation.
  - Implements partial product accumulation and shifting (sequential multiplication).

---

### `tb/multiplier_tb.v`

```verilog
module multiplier_tb();
  reg [3:0] In;
  reg loadB, loadC, start, reset, clk;
  wire [3:0] A, B, C;
  wire clkout;

  multip UUT (
    .In(In), .loadB(loadB), .loadC(loadC), .start(start),
    .reset(reset), .clk(clk), .A(A), .B(B), .C(C), .clkout(clkout)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 100MHz clock
  end

  initial begin
    // Initialize signals
    In = 0; loadB = 0; loadC = 0; start = 0; reset = 1;
    #20; reset = 0;
    // Load B = 3
    In = 4'd3; loadB = 1; loadC = 0; #10; loadB = 0;
    // Load C = 5
    In = 4'd5; loadC = 1; #10; loadC = 0;
    // Start multiplication
    start = 1; #100; start = 0;
    #100 $finish;
  end
endmodule
```

- **Purpose:** 
  - Exercises the multiplier by loading two 4-bit values (3 and 5), starting the multiplication, and observing the output.
  - Generates a clock signal and applies control signals to simulate real hardware operation.

---

## How the Multiplier Works

- Two 4-bit operands are loaded into registers via control signals.
- The main `multip` module performs sequential multiplication using adders and shift logic, updating the output registers on each clock cycle.
- The design is modular, using explicit `full_adder` and `four_bit_adder` modules for clarity and reusability.

---

## Simulation

To simulate using Icarus Verilog and view the waveform:

```sh
iverilog -o multiplier_tb multiplier/tb/multiplier_tb.v multiplier/src/multiplier.v
vvp multiplier_tb
# To view waveforms (if VCD is generated in the testbench):
gtkwave multiplier.vcd
```

---

## Author

LinkedIn: [**Megavath Pavan**](https://www.linkedin.com/in/megavath-pavan-1a4724262/)

---

## License

This project is open-source under the MIT License.
