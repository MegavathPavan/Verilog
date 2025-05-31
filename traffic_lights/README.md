# Traffic Lights Controller in Verilog

This directory contains a complete Verilog implementation of a traffic lights controller, including clock division and BCD (7-segment) display encoding for counters. The design is modular and suitable for FPGA demonstration projects, digital labs, or as a learning resource for sequential logic and state machine design.

---

## Directory Structure

```
traffic_lights/
├── src/
│   └── lights.v         # Main traffic lights controller and supporting modules
├── constraints/
│   └── lights.xdc       # FPGA constraints file
│   └── addon.xdc        # FPGA constraints file
└── README.md
```

---

## File Analysis

### `src/lights.v`

#### 1. Clock Divider Module (`ClockDividerc`)
```verilog
module ClockDividerc(input CLK_IN, output reg CLK_OUT);
    reg [27:0] counter = 28'd0;
    parameter DIVISOR = 28'd125000000; // 200Hz
    always @(posedge CLK_IN) begin
        counter <= counter + 1;
        if (counter >= (DIVISOR - 1))
            counter <= 0;
        CLK_OUT <= (counter < (DIVISOR >> 1)) ? 1'b1 : 1'b0;
    end
endmodule
```
- **Purpose:** Divides the input clock down to a lower frequency for human-visible timing of lights.
- **Parameter:** `DIVISOR` sets the output frequency.

#### 2. BCD to 7-Segment Display Encoder (`BCD`)
```verilog
module BCD(input [3:0] In, output reg [6:0] out);
    always @(In) begin
        case(In)
            4'd0: out = 7'b1111110;
            ... // standard 7-segment encodings for digits 1-9
            4'd9: out = 7'b1111011;
        endcase
    end
endmodule
```
- **Purpose:** Converts a 4-bit binary counter value to a 7-segment display output.

#### 3. Traffic Light Controller (`tli`)
```verilog
module tli(R, Y, G, clkin, C, En);
    output reg [3:0] R, G, Y; // Red, Green, Yellow for 4 directions
    output [6:0] C;           // 7-segment display (via BCD)
    reg [3:0] counter;
    reg [1:0] s = 2'd0;       // State for FSM
    input clkin;
    output reg [3:0] En = 4'b0111; // Enable lines

    BCD B1(counter, C);
    ClockDividerc C1(clkin, clkout);

    always @(posedge clkout) begin
        case (s)
            2'd0: ... // State 0: one direction green, others red/yellow transitions
            2'd1: ... // State 1: next direction, similar logic
            2'd2: ...
            2'd3: ...
        endcase
        // Counter cycles 0-7 for timing transitions
        case (counter)
            4'd0: counter = 1;
            ...
            4'd7: counter = 0;
        endcase
    end
endmodule
```
- **Purpose:** Implements a finite state machine (FSM) to control the sequence and timing of traffic lights in four directions.
- **Outputs:**
    - `R`, `Y`, `G`: 4-bit signals to control Red, Yellow, and Green LEDs in four directions.
    - `C`: 7-segment display output for a counter.
    - `En`: Enable signal (default 4'b0111).
- **Operation:**
    - Each FSM state (`s`) controls which direction gets the green light, with timed transitions to yellow, then red.
    - `counter` controls the duration of each light.
    - The counter value is shown on a 7-segment display.

---

## How It Works

- The controller cycles through four states, each corresponding to one direction receiving a green light while the others are red.
- After a set time (controlled by `counter` and the clock divider), the current direction transitions from green to yellow, then to red as the next direction turns green.
- The 7-segment display shows the countdown or current count for each phase.
- All timing is handled by the clock divider to slow down the input clock for observable light changes.

---

## Usage and Simulation

- Instantiate the `tli` module in your Verilog testbench or top-level design.
- Provide a clock signal (`clkin`), and observe the outputs `R`, `Y`, `G` for each traffic light direction.
- Connect `C` to a 7-segment display for real-time phase/counter display.
- Adjust the `DIVISOR` parameter in `ClockDividerc` for faster or slower cycle times as needed for your hardware.

---

## Author

LinkedIn: [**Megavath Pavan**](https://www.linkedin.com/in/megavath-pavan-1a4724262/)

---

## License

This project is open-source under the MIT License.
