`timescale 1ns / 1ps
module ins_memory (
   input [7:0] pcop,
  output reg [7:0] imout,
   output reg [7:0] memory_out
);


	integer i;
	reg [7:0] memory[7:0];

   initial begin
       for (i = 0; i < 8; i = i + 1) begin
           memory[i] = 8'b00000000; // initialize memory to all zeroes
       end
       memory[0] = 8'b11010010; // lw
       memory[1] = 8'b00010001; // add
       memory[2] = 8'b01110010; //addi
       memory[3] = 8'b10110010; //store
       memory[4] = 8'b11100101; //sll
       
   end
    //   reg [7:0] mem[0:5] = {8'h51, 8'h92, 8'h72, 8'h12, 8'h32, 8'h12};
   always @(*) begin
       if (pcop[7:0] < 5) begin
            imout = memory[pcop[7:0]];
			memory_out = memory[pcop[7:0]];
       end else begin
            imout = memory[(pcop[7:0] - 6) % 6];
			memory_out = memory[(pcop[7:0] - 6) % 6];
       end
   end
endmodule

