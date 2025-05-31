# 4-bit Adder/Subtractor with Verilog

This project implements a 4-bit adder/subtractor in Verilog, capable of both arithmetic and comparison operations. It is designed and tested for the PYNQ-Z2 FPGA board, with constraint files provided in `.xdc` format for this platform. A simulation testbench is included.

## Overview

- **Source module:** [`src/sub.v`](src/sub.v)
- **Testbench:** [`tb/sim.v`](tb/sim.v)
- **Constraints:** [`constraints/`](constraints/) (`.xdc` files for PYNQ-Z2)
- **Features:**
  - 4-bit addition and subtraction
  - Overflow and carry-out detection
  - Comparison outputs: A == B, A < B, A > B (via OUT pins in comparison mode)
  - Parameterized design using a 1-bit full adder module
  - Ready for direct synthesis and implementation on PYNQ-Z2 FPGA

## Module Details

### `fulladder` (1-bit Full Adder)
- Used internally to build the 4-bit arithmetic.
- Inputs: `A`, `B`, `C` (carry-in)
- Outputs: `s` (sum), `cout` (carry-out)

### `sub` (4-bit Adder/Subtractor)
- **Inputs:**
  - `A`, `B` (4-bit operands)
  - `M` (Mode: `0` = add, `1` = subtract)
  - `C` (Comparison: `1` = output comparison, `0` = output arithmetic result)
- **Outputs:**
  - `OUT` (4-bit result or comparison)
  - `ov` (Overflow flag)
  - `cout` (Carry-out)

#### Arithmetic Operation:
- When `M=0`, perform A + B.
- When `M=1`, perform A - B using two’s complement.
- Overflow (`ov`) and carry-out (`cout`) are provided.

#### Comparison Operation:
- When `C=1`, outputs on `OUT`:
  - `OUT[0]`: `A == B`
  - `OUT[1]`: `A < B`
  - `OUT[2]`: `A > B`
  - `OUT[3]`: Always `0`

## FPGA Usage (PYNQ-Z2)

- The provided `.xdc` constraint files in the `constraints` directory are tailored for the PYNQ-Z2 board.
- The `.xdc` files map the module I/Os to the appropriate physical pins on the FPGA.
- To use this project on your PYNQ-Z2:
  1. Add the appropriate `.xdc` file from the `constraints` folder when creating your project in Vivado.
  2. Ensure the pin assignments reflect your physical setup (switches, buttons, LEDs, etc. on the PYNQ-Z2).
  3. Synthesize and implement the design as usual in Vivado.

## Simulation/Testbench

See [`tb/sim.v`](tb/sim.v):

- Instantiates the `sub` module.
- Applies test vectors for:
  - Addition (`M=0`)
  - Subtraction (`M=1`)
  - Comparison (`C=1`)
- Monitors and displays results using `$monitor`.

## Example Usage

```verilog
reg [3:0] A, B;
reg M, C;
wire [3:0] OUT;
wire cout, ov;

sub uut(
    .A(A), .B(B), .M(M), .C(C),
    .OUT(OUT), .ov(ov), .cout(cout)
);
```

Set `A`, `B`, `M`, and `C` as needed for your operation.

## File Structure

```
4_bit_Subtractor/
├── src/
│   └── sub.v       # Main 4-bit adder/subtractor module
├── tb/
│   └── sim.v       # Testbench for simulation
├── constraints/    # XDC constraints for PYNQ-Z2 FPGA
└── README.md
```

## How to Simulate

1. Use any Verilog simulator (e.g., Icarus Verilog, ModelSim, Vivado).
2. Compile both source and testbench:
   ```
   iverilog -o sim tb/sim.v src/sub.v
   vvp sim
   ```
3. Observe outputs for addition, subtraction, and comparison.

## How to Use with PYNQ-Z2 FPGA

1. Create a new Vivado project for the PYNQ-Z2 board.
2. Add `src/sub.v` as the design source.
3. Add the relevant `.xdc` file from `constraints/` as the constraint file.
4. Connect the module ports (`A`, `B`, `M`, `C`, `OUT`, `cout`, `ov`) to the appropriate board interfaces (switches, buttons, LEDs) as per the `.xdc` mapping.
5. Synthesize, implement, generate bitstream, and program the board.

## License

This project is open-source under the MIT License.

---

**Author:** LinkedIn: [Megavath Pavan](https://www.linkedin.com/in/megavath-pavan-1a4724262/)
