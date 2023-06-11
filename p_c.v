`timescale 1ns / 1ps
module p_c(
    input [7:0] pcip,
    output reg [7:0] inip
    
    );
    always @ (*)
        inip = pcip;        
endmodule
