`timescale 1ns / 1ps
module sign_extension( input [2:0] ext_ip,output reg [7:0] ext_out);

always @(*) begin
 ext_out = {{5{ext_ip[2]}},ext_ip};
end

endmodule
