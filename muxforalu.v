`timescale 1ns / 1ps

module muxforalu(
    input [7:0] ReadData2,
    input [7:0] ext_out,
    input sourceALU,
    output reg [7:0] muxop
);

  always @ (*)
   muxop = (sourceALU == 1) ? ReadData2 : ext_out;
   
  always @*
        $display("%b from muxfroalu",muxop);

   
endmodule

