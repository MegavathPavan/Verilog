# D Flip-Flop (Master-Slave) in Verilog

This project implements a master-slave edge-triggered D flip-flop in Verilog. It demonstrates the construction of a D flip-flop using two transparent latches (latch-based design) and provides a testbench for simulation and verification.

---

## Directory Structure

```
d_flip_flop/
├── src/
│   └── d_flip_flop.v         # D flip-flop implementation (latch-based)
├── tb/
│   └── d_flip_flop_tb.v      # Testbench for the D flip-flop
├── constraints/
│   └── d_flip_flop.xdc       # FPGA constraint files)
└── README.md
```

---

## File Analysis

### `src/d_flip_flop.v`

```verilog
module latch(D, E, Q);
  input D, E;
  output reg Q;

  always @(D, E)
    if (E == 1)
      Q = D;
endmodule

module d_flip_flop(D, E, Q);
  input D, E;
  output Q;
  wire Q1;

  latch L1(D, E, Q1);    // Master latch (enabled when E=1)
  latch L2(Q1, ~E, Q);   // Slave latch (enabled when E=0)
endmodule
```

- **Modules:**
  - `latch`: Transparent latch. When enable `E` is high, output `Q` follows input `D`.
  - `d_flip_flop`: Composed of two latches in master-slave configuration.
    - When `E` is high: Master latch is enabled, slave is disabled.
    - When `E` transitions low: State transfers to output, achieving edge-triggered behavior.

---

### `tb/d_flip_flop_tb.v`

```verilog
module tb_d_flip_flop;
  reg D, E;
  wire Q;

  d_flip_flop uut (
    .D(D),
    .E(E),
    .Q(Q)
  );

  initial begin
    $monitor("Time: %0t, D=%b, E=%b, Q=%b", $time, D, E, Q);

    D = 0; E = 0;
    #10 D = 1; E = 1;
    #10 E = 0;
    #10 D = 0; E = 1;
    #10 E = 0;
    #10 D = 1; E = 1;
    #10 E = 0;
    #10 $finish;
  end
endmodule
```

- **Purpose:** Simulates various input sequences to the D flip-flop.
- **Behavior:** Shows how Q updates only on the edge of E, verifying proper master-slave operation.

---

## How It Works

- **Master-Slave D Flip-Flop:** This is a classic edge-triggered flip-flop constructed by connecting two latches in series:
  - **Master (L1):** Open when E (Enable/Clock) is high.
  - **Slave (L2):** Open when E is low.
  - This design samples D on the rising edge of E and holds Q stable otherwise.

---

## Simulation

To run the testbench using Icarus Verilog:

```sh
iverilog -o dff_tb d_flip_flop/tb/d_flip_flop_tb.v d_flip_flop/src/d_flip_flop.v
vvp dff_tb
```

---

## Author

LinkedIn: [**Megavath Pavan**](https://www.linkedin.com/in/megavath-pavan-1a4724262/)

---

## License

This project is open-source under the MIT License.
