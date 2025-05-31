`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.04.2023 13:44:27
// Design Name: 
// Module Name: tli
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module ClockDividerc(input CLK_IN,output reg CLK_OUT);
    
    // For everyone rising edge, we will increment the counter variable
    reg[27:0] counter=28'd0;
    
    // parameters: They can be dynamically configured in the RTL diagram
    // Ideally: If you use DIVISOR=2, it will generate a frequency of CLK_IN/2 as the output
    // Use a divisor value that is perfectly divisble by 2. OTherwise you will have unexpected results
    parameter DIVISOR = 28'd125000000; //200hz
    
    //posedge: Perfoms some computation when the rising edge occurs at the CLK_IN
    always @(posedge CLK_IN)

    begin
        counter <= counter + 28'd1;   // At every rising edge, we increment counter variable by 1
        if(counter >= ( DIVISOR-1 ) ) // If the counter is equal or greater than DIVISOR - 1
            counter <= 28'd0;         // then reset the counter variable to 0.
        
        // For first half of the clock period, Set CLK_OUT to 1
        // For second half of the clock period, Set CLK_OUT to 0 
        // Use a divisor that can always be perfectly divided by 2

        CLK_OUT <= ( counter < DIVISOR >> 1 )? 1'b1 : 1'b0;  
    end
endmodule


module BCD(input [3:0]In,output reg[6:0]out);

always@(In)
begin
case(In)
4'd0: out = 7'b1111110;
4'd1: out = 7'b0110000;
4'd2: out = 7'b1101101;
4'd3: out = 7'b1111001;
4'd4: out = 7'b0110011;
4'd5: out = 7'b1011011;
4'd6: out = 7'b1011111;
4'd7: out = 7'b1110000;
4'd8: out = 7'b1111111;
4'd9: out = 7'b1111011;
endcase
end
endmodule


module tli(R,Y,G,clkin,C,En);
output reg [3:0]R,G,Y;
output [6:0]C;
reg [3:0]counter;
reg [1:0]s = 2'd0;
input clkin;

output reg [3:0]En = 4'b0111;

BCD B1(counter,C);
ClockDividerc C1(clkin,clkout);
always @(posedge clkout)

begin

case(s)
    2'd0 :
        begin
            R <= 4'b0111;
            if(counter >= 5)
            begin
            Y <= 4'b1000;
            G <= 4'b0000;
            if(counter == 7)
            begin
            s <= 1;
         
            end
            
            end
            else
            begin
            G <= 4'b1000;
            Y <= 4'b0000;
            end
        end
    2'd1 :
        begin
            R <= 4'b1011;
            if(counter >= 5)
            begin
            Y <= 4'b0100;
            G <= 4'b0000;
            if(counter == 7)
            begin
            s <= 2;
           
            end
            
            end
            else
            begin
            G <= 4'b0100;
            Y <= 4'b0000;
            end
        end
        
            2'd2 :
        begin
            R <= 4'b1101;
            if(counter >= 5)
            begin
            Y <= 4'b0010;
            G <= 4'b0000;
            if(counter == 7)
            begin
            s <= 3;
           
            end
            
            end
            else
            begin
            G <= 4'b0010;
            Y <= 4'b0000;
            end
        end
        
         2'd3 :
        begin
            R <= 4'b1110;
            if(counter >= 5)
            begin
            Y <= 4'b0001;
            G <= 4'b0000;
            if(counter == 7)
            begin
            s <= 0;
           
            end
            
            end
            else
            begin
            G <= 4'b0001;
            Y <= 4'b0000;
            end
        end
endcase

case(counter)
4'd0 : counter = 1;
4'd1 : counter = 2;
4'd2 : counter = 3;
4'd3 : counter = 4;
4'd4 : counter = 5;
4'd5 : counter = 6;
4'd6 : counter = 7;
4'd7 : counter = 0;
endcase
end
endmodule
