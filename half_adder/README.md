# Half Adder in Verilog

This directory contains Verilog HDL code for a single-bit half adder, along with a testbench for simulating and verifying its operation.

---

## Directory Structure

```
half_adder/
├── src/
│   └── half_adder.v      # Verilog source: half adder module
├── tb/
│   └── half_adder_tb.v   # Testbench for the half adder
└── README.md
```

---

## File Analysis

### `src/half_adder.v`

```verilog
module half_adder(a, b, s, c);
  input a, b;
  output s, c;

  and A(c, a, b);       // Carry output: c = a & b
  xor X(s, a, b);       // Sum output:   s = a ^ b
endmodule
```

- **Purpose:** Implements a single-bit half adder.
- **Inputs:** `a`, `b` — the two binary digits to be added.
- **Outputs:** `s` — the sum, `c` — the carry out.
- **Implementation:** Uses basic logic gates (`and` for carry, `xor` for sum).

---

### `tb/half_adder_tb.v`

```verilog
module tb_half_adder;

  reg a, b;
  wire s, c;

  half_adder uut (
    .a(a),
    .b(b),
    .s(s),
    .c(c)
  );

  initial begin
    $dumpfile("half_adder.vcd");
    $dumpvars(0, tb_half_adder);

    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;

    $finish;
  end

  initial begin
    $monitor("Time=%0t | a=%b b=%b => s=%b c=%b", $time, a, b, s, c);
  end

endmodule
```

- **Purpose:** Testbench for the half adder.
- **Features:**
  - Applies all possible input combinations for a single-bit half adder (`a` and `b`).
  - Generates a VCD file for waveform analysis.
  - Prints simulation results in real time.

---

## How It Works

- The half adder adds two single-bit binary numbers.
  - Sum (`s`) is the XOR of the inputs.
  - Carry (`c`) is the AND of the inputs.
- The testbench verifies correct operation for all input combinations and logs both console and waveform results.

---

## Simulation

To simulate using Icarus Verilog and view the waveform:

```sh
iverilog -o half_adder_tb half_adder/tb/half_adder_tb.v half_adder/src/half_adder.v
vvp half_adder_tb
# View the waveform:
gtkwave half_adder.vcd
```

---

## Author

LinkedIn: [**Megavath Pavan**](https://www.linkedin.com/in/megavath-pavan-1a4724262/)

---

## License

This project is open-source under the MIT License.
