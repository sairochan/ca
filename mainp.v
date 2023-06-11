
`timescale 1ns / 1ps;

module mainp(
    input [7:0] pcip,
    output wire [7:0]  im_out1,
    output wire [7:0] instr_ip,
    output wire regDestination,memory_read,memory_to_register,memoryWrite,register_write,sourceALU,
    output wire [2:0]  alu_opcode,
    output wire [7:0] ext_out,
    output wire [7:0] ReadData1,
    output wire [7:0] ReadData2,
    output wire [7:0] muxop,
    output wire [7:0] alu_out1,
    output wire [7:0] memory_read_data1,
     output wire [7:0] writeregip
    );
    p_c pc(.pcip(pcip),.inip(instr_ip));
    ins_memory im (.pcop(instr_ip),.imout(im_out1));
    ctrl_unit cu (.opco(im_out1 [7:5]),.regDestination(regDestination),.memory_read(memory_read),.memory_to_register(memory_to_register),.alu_opcode(alu_opcode),.memoryWrite(memoryWrite),.register_write(register_write),.sourceALU(sourceALU));
    always @*
        $display(" %b alu_opcode",alu_opcode);
    sign_extension se (.ext_ip(im_out1 [2:0]),.ext_out(ext_out));
    adder ad (.in(pcip),.out(out));
    RegisterFile rf (.pro_ip(pcip),.ReadRegister(im_out1 [4:4]),.WriteRegister(im_out1 [3:3]),.WriteData(writeregip),.register_write(register_write),.ReadData1(ReadData1),.ReadData2(ReadData2));
    always @*
        $display(" %b alu_opcode",alu_opcode);
    muxforalu ma ( .ReadData2(ReadData2),.ext_out(ext_out),.sourceALU(sourceALU),.muxop(muxop));
    alu al ( .ReadData1(ReadData1),.muxop(muxop),.ALU_Sel(alu_opcode),.ALU_Out(alu_out1));

    data_memory dm(.memoryWrite(memoryWrite),.memory_read(memory_read),.memory_datawrite(ReadData2),.memory_address(alu_out1),.memory_read_data(memory_read_data1));
    muxDataMemmory mdm (.ALU_Out(alu_out1),.memory_to_register(memory_to_register),.dmout(memory_read_data1),.muxDataMemmoryop(writeregip));
    
    always @*
        $display("%b %b hkmn km",writeregip,ReadData2);
endmodule
