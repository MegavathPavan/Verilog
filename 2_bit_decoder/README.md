# 2-bit Decoder (PYNQ-Z2 FPGA Ready)

This project implements a simple 2-to-4 line decoder in Verilog. It includes an enable signal and is designed for FPGA use, with constraint files tailored for the PYNQ-Z2 board. A testbench is provided for simulation.

## Overview

- **Source module:** [`src/two_bit_decoder.v`](src/two_bit_decoder.v)
- **Testbench:** [`tb/two_bit_decoder_tb.v`](tb/two_bit_decoder_tb.v)
- **Constraints:** [`constraints/two_bit_decoder.xdc`](constraints/two_bit_decoder.xdc) (for PYNQ-Z2)
- **Features:**
  - 2-bit binary input to 4-line output decoder
  - Enable (`e`) input for output activation
  - Outputs are mutually exclusive and active-high
  - Ready for synthesis and implementation on PYNQ-Z2 FPGA

## Module Details

### `dec` (2-to-4 Decoder)
- **Inputs:**
  - `s` (2-bit select input)
  - `e` (enable)
- **Outputs:**
  - `y` (4-bit output, only one bit high depending on `s` when enabled)

#### Truth Table

| e | s  | y    |
|---|----|------|
| 0 | xx | 0000 |
| 1 | 00 | 0001 |
| 1 | 01 | 0010 |
| 1 | 10 | 0100 |
| 1 | 11 | 1000 |

## Simulation/Testbench

See [`tb/two_bit_decoder_tb.v`](tb/two_bit_decoder_tb.v):

- Instantiates the `dec` module.
- Tests all select (`s`) input values, both when enable (`e`) is low and high.
- Generates a VCD waveform file for viewing in GTKWave or similar tools.
- Prints test results to the console.

### Example Simulation Procedure

1. Compile and run using Icarus Verilog:
   ```
   iverilog -o dec_tb tb/two_bit_decoder_tb.v src/two_bit_decoder.v
   vvp dec_tb
   ```
2. To view the waveform:
   ```
   gtkwave dec_tb.vcd
   ```

## FPGA Usage (PYNQ-Z2)

The provided `.xdc` constraint file is tailored for the PYNQ-Z2 board and maps the module I/Os to the appropriate physical pins for direct use of buttons and LEDs:

- **Inputs:**
  - `s[0]` → BTN0 (`D19`)
  - `s[1]` → BTN1 (`D20`)
  - `e`   → BTN2 (`L20`)
- **Outputs:**
  - `y[0]` → LED0 (`R14`)
  - `y[1]` → LED1 (`P14`)
  - `y[2]` → LED2 (`N16`)
  - `y[3]` → LED3 (`M14`)

To use on PYNQ-Z2:

1. Create a Vivado project targeting the PYNQ-Z2 board.
2. Add `src/two_bit_decoder.v` as a design source.
3. Add `constraints/two_bit_decoder.xdc` as the constraint file.
4. The decoder's select lines and enable will be controlled by the onboard buttons.
5. The outputs will be displayed on the onboard LEDs.
6. Synthesize, implement, generate bitstream, and program the board.

## File Structure

```
2_bit_decoder/
├── src/
│   └── two_bit_decoder.v      # 2-to-4 decoder module
├── tb/
│   └── two_bit_decoder_tb.v   # Testbench for simulation
├── constraints/
│   └── two_bit_decoder.xdc    # XDC constraints for PYNQ-Z2 FPGA
└── README.md
```

## License

This project is open-source under the MIT License.

---

**Author:** LinkedIn: [Megavath Pavan](https://www.linkedin.com/in/megavath-pavan-1a4724262/)
