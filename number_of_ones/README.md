# 4-Bit Number of Ones Counter in Verilog

This directory contains a Verilog design to count the number of '1's in a 4-bit input vector, along with a testbench to verify its functionality.

---

## Directory Structure

```
number_of_ones/
├── src/
│   └── no_of_ones.v        # 4-bit ones counter module
├── tb/
│   └── no_of_ones_tb.v     # Testbench for ones counter
├── constraints/
│   └── no_of_ones.xdc      # FPGA constraints file
└── README.md
```

---

## File Analysis

### `src/no_of_ones.v`

```verilog
module new(In, out);
  input [3:0] In;
  output [2:0] out;

  assign out[0] = In[3] ^ In[2] ^ In[1] ^ In[0];
  assign out[2] = In[3] & In[2] & In[1] & In[0];
  assign out[1] = (~In[3]&In[1]&In[0])|(In[2]&In[1]&~In[0])|(In[3]&~In[2]&In[1])|((In[3]|In[2])&(~In[1]&In[0]))|(In[3]&In[2]&~In[1]);
endmodule
```

- **Purpose:** Counts the number of '1's in a 4-bit input and outputs the result as a 3-bit binary value.
- **Inputs:** `In[3:0]` — the 4-bit vector.
- **Outputs:** `out[2:0]` — the 3-bit binary count (0 to 4).
- **Logic:** Implements combinational logic to efficiently calculate the Hamming weight (number of ones).

---

### `tb/no_of_ones_tb.v`

```verilog
module tb_bitwise_ones_counter;

  reg [3:0] In;
  wire [2:0] out;

  bitwise_ones_counter uut (
    .In(In),
    .out(out)
  );

  initial begin
    $dumpfile("bitwise_ones_counter.vcd");
    $dumpvars(0, tb_bitwise_ones_counter);
    $monitor("Time=%0t | In=%b => Out=%b (Count = %d)", $time, In, out, out);

    // Test all inputs 0 to 15 (all possible 4-bit combinations)
    for (integer i = 0; i < 16; i = i + 1) begin
      In = i;
      #10;
    end

    $finish;
  end

endmodule
```

- **Purpose:** Testbench to exhaustively verify the ones counter for all possible 4-bit inputs.
- **Features:**
  - Cycles through all 16 possible 4-bit values.
  - Outputs both binary and decimal representations of the count.
  - Generates a VCD file for waveform analysis.

---

## How It Works

- The main module (`new`) implements combinational logic to count the number of '1's in the 4-bit input.
- The testbench (`tb_bitwise_ones_counter`) tests all possible input combinations and displays/records the results for verification.

---

## Simulation

To simulate using Icarus Verilog and view the waveform:

```sh
iverilog -o no_of_ones_tb number_of_ones/tb/no_of_ones_tb.v number_of_ones/src/no_of_ones.v
vvp no_of_ones_tb
# To view the waveform:
gtkwave bitwise_ones_counter.vcd
```

> **Note:** The module in `src/no_of_ones.v` is named `new`, but the testbench instantiates `bitwise_ones_counter`. Adjust the instance/module names for consistency before simulation.

---

## Author

LinkedIn: [**Megavath Pavan**](https://www.linkedin.com/in/megavath-pavan-1a4724262/)

---

## License

This project is open-source under the MIT License.
