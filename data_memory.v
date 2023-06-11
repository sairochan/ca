`timescale 1ns / 1ps
module data_memory(
  input wire memoryWrite, memory_read,
  input wire [7:0] memory_datawrite,memory_address,
  output reg [7:0] memory_read_data
);
  integer max_mem_index=31;
  integer min_mem_index=0;
  reg [7:0] mem [31:0];
  integer curr_index=0;

  initial begin
    for (curr_index=0;curr_index<=max_mem_index;curr_index=curr_index+1) begin
      mem[curr_index] = 8'b0;
    end
  end

  always @(*) begin
    if (memoryWrite) begin
      mem[memory_address] <= memory_datawrite;
      $display("%b store",memory_address);
    end
    if (memory_read) begin
      memory_read_data = mem[memory_address];
    end
  end

endmodule

