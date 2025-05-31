# BCD Adder/Subtractor

A Verilog project for a Binary Coded Decimal (BCD) Adder/Subtractor system. This project provides modules for BCD addition, subtraction, and supporting logic, suitable for implementation and simulation.

---

## Files

### Source Files

- [`src/adder_subtractor.v`](https://github.com/MegavathPavan/Verilog/blob/main/bcd_adder_subtractor/src/adder_subtractor.v): Top-level adder/subtractor logic.
- [`src/bcd_adder.v`](https://github.com/MegavathPavan/Verilog/blob/main/bcd_adder_subtractor/src/bcd_adder.v): BCD adder module.
- [`src/tescomp.v`](https://github.com/MegavathPavan/Verilog/blob/main/bcd_adder_subtractor/src/tescomp.v): a supporting or test component.

### (Optional) Testbench

- If you have a testbench, place it in a `tb/` directory for simulation.

---

## 1. Overview

This system allows for:
- Addition and subtraction of BCD digits.
- Modular and reusable Verilog code.
- Easy simulation and extension for FPGA or ASIC design.

---

## 2. Directory Structure

```
bcd_adder_subtractor/
├── src/
│   ├── adder_subtractor.v
│   ├── bcd_adder.v
│   └── tescomp.v
└── README.md
```

---

## 3. Module Descriptions

### `adder_subtractor.v`
- Top-level module for selecting between BCD addition and subtraction.
- Handles input selection, operation mode, and output multiplexing.

### `bcd_adder.v`
- Performs BCD addition of two 4-bit inputs (digits 0-9).
- Provides correctly formatted BCD output and carry.

### `tescomp.v`
- Supporting logic (helper functions for the main module).

---

## 4. Usage

### Simulation

To simulate the design using Icarus Verilog, use:
```sh
iverilog -o adder_subtractor_tb bcd_adder_subtractor/tb/adder_subtractor_tb.v bcd_adder_subtractor/src/*.v
vvp adder_subtractor_tb
```
Replace `adder_subtractor_tb.v` with your actual testbench filename.

### Synthesis

You can synthesize the design on FPGA by writing appropriate constraints and connecting inputs/outputs as needed.

---

## 5. License

This project is open-source under the MIT License.

---

**Author:** LinkedIn: [Megavath Pavan](https://www.linkedin.com/in/megavath-pavan-1a4724262/)
