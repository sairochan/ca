
`timescale 1ns / 1ps
module alu(
  input [7:0] ReadData1,muxop, 
  input [2:0] ALU_Sel, // ALU Selection alu_opcode
  output reg [7:0] ALU_Out // ALU 8-bit Output
);
  reg [7:0] ALU_Result;

  always @(ReadData1,muxop,ALU_Sel)
  begin
    if (ALU_Sel == 3'b000) begin
      ALU_Out = ReadData1 + muxop; 
    end 
    else if (ALU_Sel == 3'b111) begin
      ALU_Out = ReadData1 << muxop[2:0];
    end
    else begin
      ALU_Out = ReadData1 + muxop ;
    end
 end
endmodule
