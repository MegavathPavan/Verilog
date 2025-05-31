# 4-bit ALU

A simple 4-bit Arithmetic Logic Unit (ALU) in Verilog that performs basic arithmetic and logic operations, controlled via a 3-bit select input. Testbench included for simulation.

---

## Files

- [`src/Alu.v`](https://github.com/MegavathPavan/Verilog/blob/main/ALU/src/Alu.v): ALU module (Verilog source)
- [`tb/Alu_tb.v`](https://github.com/MegavathPavan/Verilog/blob/main/ALU/tb/Alu_tb.v): Testbench for ALU

---

## 1. ALU Module Description

- **File:** [`src/Alu.v`](https://github.com/MegavathPavan/Verilog/blob/main/ALU/src/Alu.v)
- **Module Name:** `alu`

### Ports

| Name    | Direction | Width  | Description      |
|---------|-----------|--------|------------------|
| A       | input     | [3:0]  | Operand A        |
| B       | input     | [3:0]  | Operand B        |
| S       | input     | [2:0]  | Operation select |
| out     | output reg| [3:0]  | ALU output       |

### Function Table

| S (bin) | Operation      | Description                | out            |
|---------|---------------|----------------------------|----------------|
| 000     | Clear         | out = 0                    | 0000           |
| 001     | Addition      | out = A + B                | (A + B)        |
| 010     | Subtraction   | out = A - B                | (A - B)        |
| 011     | AND           | out = A & B                | (A & B)        |
| 100     | OR            | out = A \| B               | (A \| B)       |
| 101     | XOR           | out = A ^ B                | (A ^ B)        |
| 110     | XNOR          | out = ~(A ^ B)             | ~(A ^ B)       |
| 111     | Set           | out = 4'b1111              | 1111           |

---

## 2. Testbench

- **File:** [`tb/Alu_tb.v`](https://github.com/MegavathPavan/Verilog/blob/main/ALU/tb/Alu_tb.v)
- Instantiates the `alu` module.
- Sets A = 3 (4'b0011), B = 1 (4'b0001).
- Loops S from 000 to 111, printing results.

**How to simulate (Icarus Verilog example):**
```sh
iverilog -o Alu_tb ALU/tb/Alu_tb.v ALU/src/Alu.v
vvp Alu_tb
```

**Expected output:**
```
Time	A	B	S	OUT
0	0011	0001	000	0000
10	0011	0001	001	0100
...
```

---

## 3. Directory Structure

```
ALU/
├── src/
│   └── Alu.v
├── tb/
│   └── Alu_tb.v
└── README.md
```

---

## 4. License

This project is open-source under the MIT License.

---

**Author:** LinkedIn: [Megavath Pavan](https://www.linkedin.com/in/megavath-pavan-1a4724262/)
