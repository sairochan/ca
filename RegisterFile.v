`timescale 1ns / 1ps
module RegisterFile(
    input [7:0] pro_ip,
	input ReadRegister, WriteRegister,register_write,
	input [7:0] WriteData,
	
	output reg [7:0] ReadData1, ReadData2
	
	);
	reg [7:0] Registers [0:1];
	    
	initial begin
	   if(1==1) begin
		Registers[0] = 8'b00000010 ; // 10
		Registers[1] = 8'b00000100 ; // 5
		end
	end
	
	
	always @( WriteData)
	begin
		
		if (register_write == 1) 
		begin
			Registers[WriteRegister] = WriteData;
		end
	end
	
		always @(ReadRegister or pro_ip)
		begin
		ReadData1 = Registers[WriteRegister];
        ReadData2 = Registers[ReadRegister];
	   end
	   

	
endmodule