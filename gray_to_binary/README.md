# Gray Code to Binary Converter in Verilog

This directory contains Verilog code for converting 4-bit Gray code to 4-bit binary code. It includes the main conversion module and a testbench for simulation and verification.

---

## Directory Structure

```
gray_to_binary/
├── src/
│   └── gray_to_bin.v        # Verilog module for Gray-to-binary conversion
├── tb/
│   └── gray_to_bin_tb.v     # Testbench for the converter
├── constraints/
│   └── gray_to_bin.xdc      # FPGA constraint file
└── README.md
```

---

## File Analysis

### `src/gray_to_bin.v`

```verilog
module gtob(In, Out);
  input [3:0] In;
  output [3:0] Out;

  assign Out[3] = In[3];
  assign Out[2] = In[2] ^ Out[3];
  assign Out[1] = In[1] ^ Out[2];
  assign Out[0] = In[0] ^ Out[1];
endmodule
```

- **Purpose:** Converts a 4-bit Gray code input (`In`) into its equivalent 4-bit binary output (`Out`).
- **Logic:** The conversion uses the recursive property:
  - MSB is the same: `Out[3] = In[3]`
  - Each lower bit is the XOR of the corresponding Gray bit and the previous binary bit.

---

### `tb/gray_to_bin_tb.v`

```verilog
module tb_gray_to_binary;

  reg [3:0] In;
  wire [3:0] Out;

  gtob uut (
    .In(In),
    .Out(Out)
  );

  initial begin
    $dumpfile("gray_to_binary.vcd");
    $dumpvars(0, tb_gray_to_binary);

    In = 4'b0101; #10;  // Gray: 0101 → Binary: 0111
    In = 4'b1100; #10;  // Gray: 1100 → Binary: 1010
    In = 4'b0000; #10;  // Gray: 0000 → Binary: 0000
    In = 4'b1111; #10;  // Gray: 1111 → Binary: 1000

    $finish;
  end

  initial begin
    $monitor("Time=%0t | Gray=%b => Binary=%b", $time, In, Out);
  end

endmodule
```

- **Purpose:** Applies several 4-bit Gray code inputs to the converter and verifies the outputs via console and waveform.
- **Features:**
  - Generates a VCD file (`gray_to_binary.vcd`) for waveform analysis.
  - Demonstrates expected Gray to binary mappings in comments.

---

## How It Works

- The design demonstrates a practical method for Gray-to-binary conversion—commonly needed in digital systems for minimizing bit errors during transitions.
- The testbench provides example conversions to verify correctness.

---

## Simulation

To simulate using Icarus Verilog and view the waveform:

```sh
iverilog -o gray_to_bin_tb gray_to_binary/tb/gray_to_bin_tb.v gray_to_binary/src/gray_to_bin.v
vvp gray_to_bin_tb
# Then, open gray_to_binary.vcd in a waveform viewer like GTKWave:
gtkwave gray_to_binary.vcd
```

---

## Author

LinkedIn: [**Megavath Pavan**](https://www.linkedin.com/in/megavath-pavan-1a4724262/)

---

## License

This project is open-source under the MIT License.
