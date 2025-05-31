# 4-bit Shifter in Verilog

This directory contains a Verilog implementation of a 4-bit shifter, capable of shifting the input in various directions and magnitudes based on a control signal. The design is suitable for use in digital systems where bitwise shifting operations are required.

---

## Directory Structure

```
shifter/
├── src/
│   └── shifter.v           # Main shifter module
├── constraints/
│   └── shifter.xdc         # (FPGA constraints file
└── README.md
```

---

## File Overview

### `src/shifter.v`

```verilog
module shifter(I, Out, S);
  input [3:0] I;        // 4-bit input value to be shifted
  input [1:0] S;        // 2-bit control input selects shift type/amount
  output [6:0] Out;     // 7-bit output for shifted result

  assign Out[0] = S[1] ? (S[0] ? 0   : 0   ) : (S[0] ? 0   : I[0]);
  assign Out[1] = S[1] ? (S[0] ? 0   : 0   ) : (S[0] ? I[0]: I[1]);
  assign Out[2] = S[1] ? (S[0] ? 0   : I[0]) : (S[0] ? I[1]: I[2]);
  assign Out[3] = S[1] ? (S[0] ? I[0]: I[1]) : (S[0] ? I[2]: I[3]);
  assign Out[4] = S[1] ? (S[0] ? I[1]: I[2]) : (S[0] ? I[3]: 0   );
  assign Out[5] = S[1] ? (S[0] ? I[2]: I[3]) : (S[0] ? 0   : 0   );
  assign Out[6] = S[1] ? (S[0] ? I[3]: 0   ) : (S[0] ? 0   : 0   );
endmodule
```

- **Inputs:**
  - `I [3:0]`: 4-bit data input.
  - `S [1:0]`: 2-bit select input controlling the shift operation.
- **Outputs:**
  - `Out [6:0]`: 7-bit output vector containing the shifted result.

---

## How It Works

- The shifter takes a 4-bit input and produces a 7-bit output, where the input bits are shifted according to the value of the 2-bit select line `S`.
- The control lines (`S[1]` and `S[0]`) determine the direction and amount of shift. The module is combinational and uses conditional assignments to realize various shift operations.
- Typical shift operations that can be implemented with this structure include logical left shift, logical right shift, and possibly more complex shifts based on `S`.

---

## Usage

- **Instantiation:** Include and instantiate the `shifter` module in your Verilog project.
- **Inputs:** Apply a 4-bit value to `I` and select the shift operation via `S`.
- **Output:** Read the result from `Out`.

---

## Example

```verilog
wire [6:0] shifted;
shifter uut (
  .I(4'b1011),    // input value
  .S(2'b01),      // select shift operation
  .Out(shifted)   // shifted output
);
```

---

## Author

LinkedIn: [**Megavath Pavan**](https://www.linkedin.com/in/megavath-pavan-1a4724262/)

---

## License

This project is open-source under the MIT License.
