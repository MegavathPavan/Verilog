# 7-Segment Decoder

This project implements a 4-bit binary to 7-segment display decoder in Verilog. The design is written for a common cathode 7-segment display, where segment outputs are active-high. A simulation testbench is provided for functional verification.

## Files

- [`src/seven_seg_decoder.v`](src/seven_seg_decoder.v): Verilog source code for the 4-bit to 7-segment decoder module (`decode`).
- [`tb/decoder_tb.v`](tb/decoder_tb.v): Testbench for simulating the decoder.

## Module: `decode`

**Description:**  
Converts a 4-bit binary input (`A[3:0]`) into 7 outputs (`out[6:0]`) that directly drive the segments (`a` through `g`) of a common cathode 7-segment display.

**Ports:**
- `input  [3:0] A` - 4-bit binary input (values 0 to 15)
- `output [6:0] out` - 7 bits for segments a (out[6]) to g (out[0])

**Segment Output Mapping:**
- `out[6]`: Segment a
- `out[5]`: Segment b
- `out[4]`: Segment c
- `out[3]`: Segment d
- `out[2]`: Segment e
- `out[1]`: Segment f
- `out[0]`: Segment g

**Note:** This implementation assumes a common cathode display (segments are ON when output is HIGH). For a common anode display, modify the logic to invert the outputs.

### Logic Equations (from [`seven_seg_decoder.v`](src/seven_seg_decoder.v))

```verilog
assign out[6] = ~((~A[2] & ~A[0]) | (A[2] & A[0]) | A[3] | A[1]); // a
assign out[5] = ~((~A[2]) | (~A[1] & ~A[0]) | (A[1] & A[0]));     // b
assign out[4] = ~((~A[1]) | A[0] | A[2]);                         // c
assign out[3] = ~((~A[2] & ~A[0]) | (~A[2] & A[1]) | 
                  (A[2] & ~A[1] & A[0]) | (A[1] & ~A[0]) | A[3]); // d
assign out[2] = ~((~A[2] & ~A[0]) | (A[1] & ~A[0]));              // e
assign out[1] = ~((~A[1] & ~A[0]) | (A[2] & ~A[1]) | 
                  (A[2] & ~A[0]) | A[3]);                         // f
assign out[0] = ~((~A[2] & A[1]) | (A[2] & ~A[1]) | 
                  A[3] | (A[2] & ~A[0]));                         // g
```

## Testbench: `decoder_tb`

- Instantiates the `decode` module.
- Drives the input `A` from 0 to 15 in a loop.
- Prints the time, input value (both binary and decimal), and the corresponding 7-segment output pattern.
- Can be simulated with any Verilog simulator.

**See:** [`tb/decoder_tb.v`](tb/decoder_tb.v)

### Example simulation command (Icarus Verilog):

```sh
iverilog -o decoder_tb tb/decoder_tb.v src/seven_seg_decoder.v
vvp decoder_tb
```

**Expected output format:**
```
Time =    0 | A = 0000 ( 0) -> out = XXXXXXX
Time =   10 | A = 0001 ( 1) -> out = XXXXXXX
...
Time =  150 | A = 1111 (15) -> out = XXXXXXX
```

## Directory Structure

```
7_seg_decoder/
├── src/
│   └── seven_seg_decoder.v   # 4-bit to 7-segment decoder module
├── tb/
│   └── decoder_tb.v          # Testbench for simulation
└── README.md
```

## License

This project is open-source under the MIT License.

---

**Author:** [Megavath Pavan](https://www.linkedin.com/in/megavath-pavan-1a4724262/)
