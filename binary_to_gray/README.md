# Binary to Gray Code Converter

A simple Verilog project for converting a binary number to its corresponding Gray code representation. This repository provides the source code, testbench, and FPGA constraints.

---

## Directory Structure

```
binary_to_gray/
├── constraints/
│   └── bin_to_gray.xdc
├── src/
│   └── bin_to_gray.v
├── tb/
│   └── bin_to_gray_tb.v
└── README.md
```

---

## Files

- [`src/bin_to_gray.v`](https://github.com/MegavathPavan/Verilog/blob/main/binary_to_gray/src/bin_to_gray.v):  
  Verilog module for converting binary input to Gray code output.

- [`tb/bin_to_gray_tb.v`](https://github.com/MegavathPavan/Verilog/blob/main/binary_to_gray/tb/bin_to_gray_tb.v):  
  Testbench for the Binary to Gray code converter.

- [`constraints/bin_to_gray.xdc`](https://github.com/MegavathPavan/Verilog/blob/main/binary_to_gray/constraints/bin_to_gray.xdc):  
  Xilinx Design Constraints file for FPGA pin mapping.

---

## 1. Module Overview

### `bin_to_gray.v`

- Converts a multi-bit binary number to Gray code.
- Typical port definition:

  | Port Name | Direction | Width | Description                |
  |-----------|-----------|-------|----------------------------|
  | bin_in    | input     | N     | Binary input (N bits)      |
  | gray_out  | output    | N     | Gray code output (N bits)  |

- The Gray code output changes only one bit at a time for consecutive binary numbers, minimizing switching noise in hardware.

---

## 2. Testbench

### `bin_to_gray_tb.v`

- Provides various test vectors to verify the correctness of the converter.
- Displays inputs and outputs for easy simulation verification.

---

## 3. Synthesis & Simulation

### Simulation Example (Icarus Verilog)

```sh
iverilog -o bin_to_gray_tb binary_to_gray/tb/bin_to_gray_tb.v binary_to_gray/src/bin_to_gray.v
vvp bin_to_gray_tb
```

### Synthesis

- Use the provided `bin_to_gray.xdc` constraint file to map the module's pins for FPGA implementation.

---

## 4. License

This project is open-source under the MIT License.

---

**Author:** LinkedIn: [Megavath Pavan](https://www.linkedin.com/in/megavath-pavan-1a4724262/)
