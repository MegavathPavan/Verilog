# Delay Circuit in Verilog

This project demonstrates the implementation of a combinational logic circuit with explicit gate delays using Verilog HDL. It is useful for understanding digital circuit timing and gate-level modeling in simulation environments.

---

## Directory Structure

```
delay/
├── src/
│   └── delay.v          # Main Verilog module implementing the delay circuit
├── tb/
│   └── delay_tb.v       # Testbench for simulation and waveform generation
├── constraints/
│   └── delay.xdc        # FPGA constraint file
└── README.md
```

---

## File Analysis

### `src/delay.v`

```verilog
module delay(A, B, C, Y);

  input A, B, C;
  output Y;
  wire w1, w2, k;

  not #(10) N(k, A);          // NOT gate with 10ns delay
  and #(10) A1(w1, k, B);     // AND gate with 10ns delay
  and #(10) A2(w2, A, C);     // AND gate with 10ns delay
  or  #(10) O(Y, w1, w2);     // OR gate with 10ns delay

endmodule
```

- **Purpose:** Implements a logic function `Y = (~A & B) | (A & C)` with each gate incurring a 10ns delay.
- **Details:**
  - The use of `#(10)` models real-world gate delays in simulations.
  - The design helps visualize propagation delays and timing in a waveform viewer.

---

### `tb/delay_tb.v`

```verilog
module tb_delay;

  reg A, B, C;
  wire Y;

  delay uut (
    .A(A),
    .B(B),
    .C(C),
    .Y(Y)
  );

  initial begin
    $dumpfile("delay.vcd");   // Generates VCD waveform file
    $dumpvars(0, tb_delay);

    A = 1; B = 1; C = 1;
    #40;

    A = 0; B = 1; C = 0;
    #40;

    A = 1; B = 0; C = 1;
    #40;

    $finish;
  end

  initial begin
    $monitor("Time: %0t | A=%b B=%b C=%b => Y=%b", $time, A, B, C, Y);
  end

endmodule
```

- **Purpose:** Testbench to verify the delay circuit and demonstrate the effect of gate delays.
- **Features:**
  - Generates a VCD (Value Change Dump) file for waveform viewing.
  - Applies several input combinations, each held for 40ns.
  - Monitors and prints the input/output values and simulation time.

---

## How It Works

- The design demonstrates how delays specified in Verilog (`#(delay)`) affect output timing.
- Useful for:
  - Learning about combinational logic timing.
  - Visualizing how logic changes propagate over time in simulation tools.
  - Demonstrating the importance of propagation delay in digital systems.

---

## Simulation

To run the testbench using Icarus Verilog and view the waveform:

```sh
iverilog -o delay_tb delay/tb/delay_tb.v delay/src/delay.v
vvp delay_tb
# Then, open delay.vcd in a waveform viewer like GTKWave:
gtkwave delay.vcd
```

---

## Author

LinkedIn: [**Megavath Pavan**](https://www.linkedin.com/in/megavath-pavan-1a4724262/)

---

## License

This project is open-source under the MIT License.
