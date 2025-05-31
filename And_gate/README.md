# 2-input AND Gate

A simple 2-input AND gate implemented in Verilog. This module outputs the logical AND of two single-bit inputs. The project also includes a testbench for simulation and verification.

---

## Files

- [`src/and.v`](https://github.com/MegavathPavan/Verilog/blob/main/And_gate/src/and.v): AND gate module (Verilog source)
- [`tb/and_tb.v`](https://github.com/MegavathPavan/Verilog/blob/main/And_gate/tb/and_tb.v): Testbench for AND gate

---

## 1. AND Gate Module Description

- **File:** [`src/and.v`](https://github.com/MegavathPavan/Verilog/blob/main/And_gate/src/and.v)
- **Module Name:** `and_gate`

### Ports

| Name | Direction | Width | Description   |
|------|-----------|-------|---------------|
| A    | input     | 1     | Input A       |
| B    | input     | 1     | Input B       |
| C    | output    | 1     | Output (A & B)|

### Function Table

| A | B | C (A & B) |
|---|---|-----------|
| 0 | 0 |     0     |
| 0 | 1 |     0     |
| 1 | 0 |     0     |
| 1 | 1 |     1     |

---

## 2. Testbench

- **File:** [`tb/and_tb.v`](https://github.com/MegavathPavan/Verilog/blob/main/And_gate/tb/and_tb.v)
- Instantiates the `and_gate` module.
- Applies all possible combinations of inputs A and B and displays the output C.

**How to simulate (Icarus Verilog example):**
```sh
iverilog -o and_tb And_gate/tb/and_tb.v And_gate/src/and.v
vvp and_tb
```

**Expected output:**
```
Time	A B | C
0	0 0 | 0
10	0 1 | 0
20	1 0 | 0
30	1 1 | 1
```

---

## 3. Directory Structure

```
And_gate/
├── src/
│   └── and.v
├── tb/
│   └── and_tb.v
└── README.md
```

---

## 4. License

This project is open-source under the MIT License.

---

**Author:** LinkedIn: [Megavath Pavan](https://www.linkedin.com/in/megavath-pavan-1a4724262/)
