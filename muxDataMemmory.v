  `timescale 1ns / 1ps
module muxDataMemmory(
    input [7:0] ALU_Out,
    input memory_to_register,
    input [7:0] dmout,
    output reg [7:0] muxDataMemmoryop
    );
    
    always @(*)
        muxDataMemmoryop=(memory_to_register == 1) ? dmout : ALU_Out;
    always @*
        $display("%b %b whitewine",muxDataMemmoryop,memory_to_register);

endmodule
