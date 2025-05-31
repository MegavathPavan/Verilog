# Serial Adder in Verilog

This directory contains a 4-bit serial adder design in Verilog, which performs bit-by-bit addition of two numbers using a single full adder over several clock cycles. The design includes a clock divider and a reusable full adder module.

---

## Directory Structure

```
serial_adder/
├── src/
│   ├── serial_adder.v      # Main serial adder module
│   ├── full_adder.v        # 1-bit full adder module
│   └── clock_divider.v     # Clock divider for slow serial operation
├── constraints/
│   └── serial_adder.xdc    # FPGA constraints file for PYNQ-Z2 board
│   └── addon.xdc           # FPGA constraints file for addon board
└── README.md
```

---

## File Analysis

### `src/serial_adder.v`

```verilog
module serial_adde(In, load1, load2, reset, start, clk, A, B, clkout);
  input [3:0] In;
  input load1, load2, reset, start, clk;
  output reg [3:0] A, B;
  output clkout;

  reg c = 0;
  reg [2:0] counter;
  ClockDivider cl(clk, clkout);

  wire sl, c_l;
  full_adder F1(A[0], B[0], c, sl, c_l);

  always @(posedge clkout) begin
    if (start == 1) begin
      if (counter == 4'd0)
        c = 0;
      counter = counter + 1;

      // Shift registers for serial addition
      A[3] <= sl;
      A[2] <= A[3];
      A[1] <= A[2];
      A[0] <= A[1];
      B[3] <= 0;
      B[2] <= B[3];
      B[1] <= B[2];
      B[0] <= B[1];
      c = c_l;

      if (counter == 4'd4)
        counter = 4'd0;
    end
    else begin
      if (load2 == 1)
        B = In;
      if (load1 == 1)
        A = In;
      if (reset == 1) begin
        A = 4'b0000;
        B = 4'b0000;
        c = 0;
      end
    end
  end
endmodule
```
- **Purpose:** Adds two 4-bit numbers serially, one bit per clock cycle.
- **Inputs:** 
  - `In`: 4-bit input for loading A or B
  - `load1`, `load2`: Load enables for A and B
  - `reset`: Synchronous reset
  - `start`: Start serial addition
  - `clk`: Clock input
- **Outputs:** 
  - `A`: Result (sum register, updated serially)
  - `B`: Shift register for operand B
  - `clkout`: Divided clock for serial operation
- **Operation:** Loads operands, then serially adds them bit by bit using a full adder and shift registers.

---

### `src/full_adder.v`

```verilog
module full_adder(A, B, C, s, c);
  input A, B, C;
  output s, c;

  assign s = A ^ B ^ C;
  assign c = (A & B) | (B & C) | (C & A);
endmodule
```
- **Purpose:** 1-bit full adder
- **Inputs:** Single bits from operands and carry-in
- **Outputs:** Sum and carry-out

---

### `src/clock_divider.v`

```verilog
module ClockDivider(input CLK_IN, output CLK_OUT);
  reg[27:0] counter = 28'd0;
  parameter DIVISOR = 28'd2;

  always @(posedge CLK_IN)
    counter <= counter + 28'd1;

  assign CLK_OUT = counter[1];
endmodule
```
- **Purpose:** Divides incoming clock for slower serial operation.
- **Parameter:** `DIVISOR` can be adjusted for different clock speeds.

---

## How the Serial Adder Works

1. **Load Phase:** Load operands A and B using `load1` and `load2` signals.
2. **Addition Phase:** Assert `start` to begin bit-serial addition. On each clock cycle:
   - The least significant bits are added with the carry.
   - Result and carry propagate through shift registers.
   - After 4 cycles, the result (sum) is available in register A.

---

## Usage & Simulation

- Instantiate the `serial_adde` module in your testbench.
- Use control signals to load operands and trigger addition.
- Observe outputs `A` (sum), `B`, and `clkout`.
- Simulate with your favorite tool (Icarus Verilog, ModelSim, Vivado, etc.).

---

## Author

LinkedIn: [**Megavath Pavan**](https://www.linkedin.com/in/megavath-pavan-1a4724262/)

---

## License

This project is open-source under the MIT License.
