# Verilog Digital Design Collection

This repository contains a rich collection of digital logic and system design modules written in Verilog HDL. The modules span from fundamental gates to complex arithmetic circuits, controllers and advanced digital building blocks, suitable for FPGA/ASIC prototyping.

---

## Overview

- **Purpose:**  
  This repo aggregates a variety of classic and practical digital design building blocks, each in its own subdirectory with source code ready for simulation or synthesis.
- **Scope:**  
  The collection covers combinational and sequential logic, binary and BCD arithmetic, encoders/decoders, adders, multipliers, shifters, code converters, counters, and controllers.
- **Usage:**  
  Suitable for lab assignments, FPGA prototyping, reference implementations, or as learning aids for digital design concepts.

---

## Sub Parts / Implementations

Below are the subdirectories (**sub parts**) and their typical contents:

- [`2_bit_decoder`](https://github.com/MegavathPavan/Verilog/tree/main/2_bit_decoder) – 2-to-4 line decoder
- [`4_bit_Subtractor`](https://github.com/MegavathPavan/Verilog/tree/main/4_bit_Subtractor) – 4-bit binary subtractor
- [`7_seg_decoder`](https://github.com/MegavathPavan/Verilog/tree/main/7_seg_decoder) – 7-segment display decoder
- [`ALU`](https://github.com/MegavathPavan/Verilog/tree/main/ALU) – 4-bit Arithmetic Logic Unit
- [`And_gate`](https://github.com/MegavathPavan/Verilog/tree/main/And_gate) – Basic AND gate implementation
- [`bcd_adder`](https://github.com/MegavathPavan/Verilog/tree/main/bcd_adder) – BCD adder for decimal arithmetic
- [`bcd_adder_subtractor`](https://github.com/MegavathPavan/Verilog/tree/main/bcd_adder_subtractor) – BCD adder/subtractor
- [`binary_to_gray`](https://github.com/MegavathPavan/Verilog/tree/main/binary_to_gray) – Binary to Gray code converter
- [`compliment`](https://github.com/MegavathPavan/Verilog/tree/main/compliment) – 9's compliment calculator
- [`d_flip_flop`](https://github.com/MegavathPavan/Verilog/tree/main/d_flip_flop) – D-type flip-flop
- [`delay`](https://github.com/MegavathPavan/Verilog/tree/main/delay) – Gate-level delay circuit
- [`full_adder`](https://github.com/MegavathPavan/Verilog/tree/main/full_adder) – Full Adder
- [`gray_to_binary`](https://github.com/MegavathPavan/Verilog/tree/main/gray_to_binary) – Gray to Binary code converter
- [`half_adder`](https://github.com/MegavathPavan/Verilog/tree/main/half_adder) – Half Adder
- [`multiplier`](https://github.com/MegavathPavan/Verilog/tree/main/multiplier) – Binary multiplier
- [`n6_multiplier`](https://github.com/MegavathPavan/Verilog/tree/main/n6_multiplier) – 4-bit multiplier using shifter and adder stages
- [`number_of_ones`](https://github.com/MegavathPavan/Verilog/tree/main/number_of_ones) – Circuit to count the number of ones in a binary word
- [`priority_encoder`](https://github.com/MegavathPavan/Verilog/tree/main/priority_encoder) – 4-to-2 line priority encoder
- [`serial_adder`](https://github.com/MegavathPavan/Verilog/tree/main/serial_adder) – Serial adder with control logic
- [`shifter`](https://github.com/MegavathPavan/Verilog/tree/main/shifter) – 4-bit shifter (left/right/rotate)
- [`traffic_lights`](https://github.com/MegavathPavan/Verilog/tree/main/traffic_lights) – Traffic light controller FSM with display



---

## How to Use

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/MegavathPavan/Verilog.git
   ```
2. **Explore Subdirectories:**
   - Each module is self-contained in its own subdirectory under `/src`.
   - Constraints for FPGA may be found under `constraints/` in each project if available.
3. **Simulation & Synthesis:**
   - Use your favorite Verilog simulator (ModelSim, Vivado, Icarus Verilog, etc.) to simulate the modules.
   - Top-level modules are generally named after the directory (e.g., `alu`, `shifter`, `serial_adde`, `tli`).
   - For FPGA, add constraint files as needed.
4. **Testbenches:**
   - Some files include example/testbench code as comments at the end.

---

---

## Implemented Modules

### 1. ALU (Arithmetic Logic Unit)

- **File:** `ALU/src/Alu.v`
- **Description:** 4-bit ALU supporting operations like addition, subtraction, AND, OR, XOR, XNOR, clear, and set, based on a 3-bit select input.

---

### 2. Serial Adder

- **File:** `serial_adder/src/serial_adder.v`
- **Description:** Implements a serial 4-bit adder using a full adder, clock divider, and shift registers for iterative bitwise addition. Includes control for loading inputs, starting, resetting, and outputting the result serially.

---

### 3. Shifter

- **File:** `shifter/src/shifter.v`
- **Description:** 4-bit shifter module with a 2-bit select for various shift operations, outputting a 7-bit result. Useful for logical left/right and possibly rotate operations.

---

### 4. Priority Encoder

- **File:** `priority_encoder/src/priority_encoder.v`
- **Description:** 4-to-2 priority encoder; outputs the binary code of the highest-priority active input and a valid flag.

---

### 5. 2-bit Decoder

- **File:** `2_bit_decoder/src/two_bit_decoder.v`
- **Description:** 2-to-4 decoder with enable. Outputs one-hot code based on input and enable signal.

---

### 6. Gray to Binary Converter

- **File:** `gray_to_binary/src/gray_to_bin.v`
- **Description:** 4-bit Gray code to binary code converter using combinational logic.

---

### 7. Half Adder

- **File:** `half_adder/src/half_adder.v`
- **Description:** Classic half-adder circuit for single-bit addition, outputting sum and carry.

---

### 8. Delay Circuit

- **File:** `delay/src/delay.v`
- **Description:** Logic circuit with intentional gate delays for timing analysis and demonstration, using NOT, AND, and OR gates.

---

### 9. 9’s Compliment

- **File:** `compliment/src/compliment.v`
- **Description:** Computes the 9's compliment for a single-digit decimal input (4 bits), outputting the compliment.

---

### 10. n6 Multiplier

- **File:** `n6_multiplier/src/multiplier.v`
- **Description:** Implements a 4-bit multiplier using shifters and combinational logic, producing a 7-bit product.

---

### 11. Traffic Lights Controller

- **File:** `traffic_lights/src/lights.v`
- **Description:** A full traffic lights controller state machine for a four-way junction, with clock division, BCD to 7-segment display encoder, and sequencing logic for red, yellow, and green lights.

---


## Author

LinkedIn: [**Megavath Pavan**](https://www.linkedin.com/in/megavath-pavan-1a4724262/)

---

## License

This project is open-source under the MIT License.

---

> **Note:**  
> This README provides a summary based on the code and modules currently present in the repository. For more details or updates, browse the latest code and subdirectory READMEs or visit the [GitHub repository directory view](https://github.com/MegavathPavan/Verilog/tree/main/).
