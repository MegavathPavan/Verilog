# Full Adder in Verilog

This directory contains Verilog HDL code for a single-bit full adder and a 4-bit ripple-carry adder constructed from full adder modules. It also includes a testbench to simulate and verify their functionality.

---

## Directory Structure

```
full_adder/
├── src/
│   └── full_adder.v      # Verilog source: full adder & 4-bit adder modules
├── tb/
│   └── full_adder_tb.v   # Testbench for the adder modules
└── README.md
```

---

## File Analysis

### `src/full_adder.v`

```verilog
module fulladder(A, B, C, s, c);
  input A, B, C;
  output s, c;

  assign s = A ^ B ^ C;          // Sum bit (XOR logic)
  assign c = (A & B) | (B & C) | (C & A); // Carry out
endmodule

module bitadder(A, B, CIN, S, COUT, C3);
  input [3:0] A, B;
  input CIN;
  output [3:0] S;
  output COUT, C3;

  wire C1, C2;

  fulladder F1(A[0], B[0], CIN,  S[0], C1);    // LSB adder
  fulladder F2(A[1], B[1], C1,   S[1], C2);
  fulladder F3(A[2], B[2], C2,   S[2], C3);
  fulladder F4(A[3], B[3], C3,   S[3], COUT);  // MSB adder
endmodule
```

- **`fulladder` module:** Implements a single-bit full adder. Takes three single-bit inputs (`A`, `B`, `C`), outputs sum (`s`) and carry (`c`).
- **`bitadder` module:** Implements a 4-bit ripple-carry adder using four `fulladder` instances. Accepts two 4-bit numbers (`A`, `B`), a carry-in (`CIN`), generates a 4-bit sum (`S`), carry-out (`COUT`), and an intermediate carry (`C3`).

---

### `tb/full_adder_tb.v`

```verilog
module tb_full_adder;

  reg [3:0] A, B;
  reg cin;
  wire [3:0] S;
  wire Cout, dummy_C3;

  bitadder uut (
    .A(A),
    .B(B),
    .CIN(cin),
    .S(S),
    .COUT(Cout),
    .C3(dummy_C3)
  );

  initial begin
    $dumpfile("fulladder.vcd");    // Enable waveform generation for GTKWave
    $dumpvars(0, tb_full_adder);

    A = 4'd4; B = 4'd2; cin = 0;   // Test vector 1
    #10;
    A = 4'd9; B = 4'd7; cin = 1;   // Test vector 2
    #10;

    $finish;
  end

  initial begin
    $monitor("Time=%0t | A=%d, B=%d, Cin=%b => Sum=%d, Cout=%b", 
             $time, A, B, cin, S, Cout);
  end

endmodule
```

- **Purpose:** Simulates the 4-bit adder for two input combinations, prints and logs the results, and generates a VCD file for waveform viewing.

---

## How It Works

- The design demonstrates hierarchical digital design:
  - A single-bit `fulladder` is used as a building block.
  - Four full adders are connected in series to create a 4-bit ripple-carry adder (`bitadder`).
- The testbench applies specific test cases and allows the user to visualize the result either via console output or waveform viewers.

---

## Simulation

To simulate using Icarus Verilog and view the waveform:

```sh
iverilog -o fulladder_tb full_adder/tb/full_adder_tb.v full_adder/src/full_adder.v
vvp fulladder_tb
# View the waveform:
gtkwave fulladder.vcd
```

---

## Author

LinkedIn: [**Megavath Pavan**](https://www.linkedin.com/in/megavath-pavan-1a4724262/)

---

## License

This project is open-source under the MIT License.
