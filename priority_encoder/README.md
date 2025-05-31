# 4-to-2 Priority Encoder in Verilog

This directory implements a 4-to-2 priority encoder in Verilog, which encodes a 4-bit input into a 2-bit output based on the highest-priority asserted input. The encoder also provides a valid output signal.

---

## Directory Structure

```
priority_encoder/
├── src/
│   └── priority_encoder.v    # Main priority encoder module
├── constraints/
│   └── priority_encoder.xdc  # PYNQ-Z2 FPGA constraints file
└── README.md
```

---

## File Analysis

### `src/priority_encoder.v`

```verilog
module priority_encoder(I, v, y);
  input [3:0] I;
  output reg v;
  output reg [1:0] y;

  always @(I)
    casex (I)
      4'b0001 : {v, y} = 3'b100; // I[0] is highest, output y=00, v=1
      4'b001x : {v, y} = 3'b101; // I[1] is highest, output y=01, v=1
      4'b01xx : {v, y} = 3'b110; // I[2] is highest, output y=10, v=1
      4'b1xxx : {v, y} = 3'b111; // I[3] is highest, output y=11, v=1
      default : {v, y} = 3'b000; // No inputs active, output y=00, v=0
    endcase
endmodule
```

- **Purpose:** Encodes a 4-bit input to a 2-bit binary output representing the position of the highest-priority '1' (with I[3] as the highest).
- **Inputs:** `I[3:0]` — 4-bit input vector.
- **Outputs:**
  - `y[1:0]` — 2-bit encoded output (position of highest '1')
  - `v` — "valid" indicator: 1 if any input is high, 0 if all inputs are low.
- **Logic:** Uses a `casex` statement for efficient priority encoding.

---

## How It Works

- The encoder checks the 4-bit input from highest (`I[3]`) to lowest (`I[0]`) priority.
- The output `y` represents the position of the highest-priority '1' (00 for `I[0]`, 01 for `I[1]`, 10 for `I[2]`, 11 for `I[3]`).
- The valid output `v` is set to 1 if any bit in `I` is high, otherwise 0.

---

## Usage

- **Simulation:** Instantiate the `priority_encoder` module in your testbench or design.
- **Inputs:** Apply a 4-bit value to `I`.
- **Outputs:** Read `y` for the encoded value and `v` to check if any input is asserted.

---

## Author

LinkedIn: [**Megavath Pavan**](https://www.linkedin.com/in/megavath-pavan-1a4724262/)

---

## License

This project is open-source under the MIT License.
