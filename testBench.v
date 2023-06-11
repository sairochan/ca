`timescale 1ns / 1ps

 module testbench;

    // Inputs
    reg [7:0] pcip;
    
    // Outputs
    wire [7:0] im_out1;
    wire [7:0] instr_ip;
    wire  memory_read, memory_to_register, memoryWrite, register_write, sourceALU;
    wire [2:0] alu_opcode;
    wire [7:0] ext_out,ReadData1,ReadData2,muxop,alu_out1,memory_read_data1,muxDataMemmoryop;

    // Instantiate the Unit Under Test (UUT)
    mainp uut (
        .pcip(pcip), 
        .im_out1(im_out1), 
        .instr_ip(instr_ip),  
        .memory_read(memory_read), 
        .memory_to_register(memory_to_register), 
        .alu_opcode(alu_opcode), 
        .memoryWrite(memoryWrite), 
        .register_write(register_write), 
        .sourceALU(sourceALU),
        .ext_out(ext_out),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2),
        .muxop(muxop),
        .alu_out1(alu_out1),
        .memory_read_data1(memory_read_data1),
        .writeregip(muxDataMemmoryop)
    );
    

    initial begin
        // Initialize Inputs FOR REFERENCE
    //   memory[0] = 8'b11010010; // lw
    //   memory[1] = 8'b00010001; // add
    //   memory[2] = 8'b01110010; //addi
    //   memory[3] = 8'b10110010; //store
    //   memory[4] = 8'b11100101; //sll
        pcip = 8'b00000001;
        //UNCOMENT THESE TO CHCEK FOR EACH INSTURCTION
//        pcip = 8'b00000000;
//          pcip = 8'b00000011;
//           pcip = 8'b00000100;
//            pcip = 8'b00000010;
        
        
        // Wait for 100 ns for global reset to finish
        #100;
        // Check outputs for Test Case 1
        if (im_out1 === 8'b11100101 && memory_read === 1'b0  && sourceALU == 1'b1   && ext_out == 8'b11111101 ) begin
        
            $display("Test Case 1 Passed %b",alu_out1);
        end else begin
            $display("Test Case 1 Failed %b %b",alu_out1,ReadData1);
        end
         
        
        end
        
        
        
endmodule
