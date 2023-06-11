`timescale 1ns / 1ps

module ctrl_unit(
    inout [2:0]opco,
    output reg regDestination,memory_read,memory_to_register,memoryWrite,register_write,sourceALU,
    output reg [2:0] alu_opcode
 ); 
//add

 always @ (opco)
  begin 
        
        case (opco)
         3'b000:begin    //add        
            memory_read = 1'b0;
            memory_to_register = 1'b0;
            alu_opcode= opco;
            memoryWrite = 1'b0;
            sourceALU = 1'b1;
            register_write = 1'b1;
       
       
         end 
        3'b101:begin // sw
           
            memory_read = 1'b1;
            memory_to_register = 1'b1;
            alu_opcode = opco;
            memoryWrite = 1'b1;
            sourceALU = 1'b0;
            register_write = 1'b0; 
       
        end
         	 3'b110:begin //lw
            memory_read = 1'b1;
            memory_to_register = 1'b1;
            alu_opcode = opco;
            memoryWrite = 1'b0;
            sourceALU = 1'b0;
            register_write = 1'b1;
        end 
         	3'b111:begin // sll
          
            memory_read = 1'b0;
            memory_to_register = 1'b0;
            alu_opcode = opco ;
            memoryWrite = 1'b0;
            sourceALU = 1'b0;
            register_write = 1'b1;
       
        
        end 
         default:begin// addi 
            memory_read = 1'b0;
            memory_to_register = 1'b0;
            alu_opcode = opco;
            memoryWrite = 1'b0;
            sourceALU = 1'b0;
            register_write = 1'b1;     
                 

        end 
        endcase
      // $display(shift);
  end
endmodule
