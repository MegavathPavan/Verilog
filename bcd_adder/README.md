# BCD Adder

A Binary Coded Decimal (BCD) adder project in Verilog. This project includes a BCD adder, a BCD-to-7-segment decoder, a testbench, and XDC constraints for FPGA synthesis.

---

## Files

### Top-level & Source Files

- [`src/bcd_adder.v`](https://github.com/MegavathPavan/Verilog/blob/main/bcd_adder/src/bcd_adder.v): BCD adder module (adds two BCD digits and outputs the BCD result)
- [`src/decoder.v`](https://github.com/MegavathPavan/Verilog/blob/main/bcd_adder/src/decoder.v): BCD-to-7-segment display decoder

### Testbench

- [`tb/bcd_adder_tb.v`](https://github.com/MegavathPavan/Verilog/blob/main/bcd_adder/tb/bcd_adder_tb.v): Testbench for BCD adder

### Constraints

- [`constraints/bcd_adder.xdc`](https://github.com/MegavathPavan/Verilog/blob/main/bcd_adder/constraints/bcd_adder.xdc): Xilinx Design Constraints (pin mapping, etc.)

---

## 1. BCD Adder Module Description

- **File:** [`src/bcd_adder.v`](https://github.com/MegavathPavan/Verilog/blob/main/bcd_adder/src/bcd_adder.v)
- **Module Name:** `bcd_adder`

### Ports

| Name | Direction | Width | Description         |
|------|-----------|-------|---------------------|
| A    | input     | [3:0] | 1st BCD digit (0-9) |
| B    | input     | [3:0] | 2nd BCD digit (0-9) |
| S1   | output reg| [3:0] | Units place (BCD)   |
| S2   | output reg| [3:0] | Tens place (BCD)    |

**Function:**  
Adds A and B as BCD digits. If the sum is greater than 9, output is corrected by adding 6 and carry is provided in S2.

---

## 2. BCD-to-7-Segment Decoder

- **File:** [`src/decoder.v`](https://github.com/MegavathPavan/Verilog/blob/main/bcd_adder/src/decoder.v)
- Decodes a 4-bit BCD digit to display on a 7-segment display (see file for logic).

---

## 3. Testbench

- **File:** [`tb/bcd_adder_tb.v`](https://github.com/MegavathPavan/Verilog/blob/main/bcd_adder/tb/bcd_adder_tb.v)
- Instantiates the `bcd_adder` and tests various input combinations.

**Simulation (Icarus Verilog example):**
```sh
iverilog -o bcd_adder_tb bcd_adder/tb/bcd_adder_tb.v bcd_adder/src/bcd_adder.v
vvp bcd_adder_tb
```

**Expected output:**
```
Time	A B | S2 S1
0	0 0 | 0 0
10	5 3 | 0 8
20	6 7 | 1 3
30	9 9 | 1 8
40	4 6 | 1 0
```

---

## 4. Constraints

- **File:** [`constraints/bcd_adder.xdc`](https://github.com/MegavathPavan/Verilog/blob/main/bcd_adder/constraints/bcd_adder.xdc)
- Xilinx constraints for mapping pins when synthesizing to an FPGA.

---

## 5. Directory Structure

```
bcd_adder/
├── constraints/
│   └── bcd_adder.xdc
├── src/
│   ├── bcd_adder.v
│   └── decoder.v
├── tb/
│   └── bcd_adder_tb.v
└── README.md
```

---

## 6. License

This project is open-source under the MIT License.

---

**Author:** LinkedIn: [Megavath Pavan](https://www.linkedin.com/in/megavath-pavan-1a4724262/)
