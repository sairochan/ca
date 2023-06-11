`timescale 1ns / 1ps
module adder(
    input [7:0] in,
    output [7:0] out   
    );
        assign out = in + 8'b00000001;        
endmodule
   