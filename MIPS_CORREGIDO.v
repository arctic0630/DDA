module MIPS(
   //INPUTS & OUTPUTS
   //REG_FILE
   input clk,
   input rst,
   //PC
   
   //output reg [31:0] PC_out,
   
   //MUX
    input [31:0] datard,

    
    //Controlpath
    input RegDest,
    input SaltoIncond,
    input SaltoCond,
   // input LeerMem,
    input MemaReg,
    input [2:0] ALUOp,
   // input EscrMem,
    input FuenteALU,
    input EscrReg,
    input FuentePC
    
    );
    
    //Señales Memins
    wire [31:0] ins;
    
    //Reg_file
    wire [31:0] Op1;
    wire [31:0] data2;
    wire [31:0] Op2;
    
    //UES
    wire [31:0] out_UES;
    wire [31:0] fPC;
    
    integer AddIn = 1;
    
    wire [31:0] add1;
    
    wire [31:0] add2;
    
    wire [31:0] PC_in;    
    
    wire [31:0] ALU_out; 
    
    
    wire [4:0] mux_Reg_Regwr;
    
    wire [31:0] mux_Reg_Datawr;
    
    
    memins memins1(.fPC(fPC), .ins(ins));
    
    REG_FILE Register_1(.clk(clk), .we3(EscrReg), .ra1(ins[25:21]), .ra2(ins[20:16]), .wa3(mux_Reg_Regwr) , .wd3(mux_Reg_Datawr) , .rd1(Op1), .rd2(data2));  
    
    
    MUX #( .WIDTH(5) )MUX_regwr (.d0(ins[20:16]),.d1(ins[15:11]),.s(RegDest), .y(mux_Reg_Regwr));
    
    sign_extend UES(.in(ins[15:0]),.out(out_UES));
    
    MUX #( .WIDTH(32) )MUX_ALUOP2 (.d0(data2),.d1(out_UES),.s(FuenteALU), .y(Op2));
    
    ALU ALU1(.in1(Op1), .in2(Op2) , .sel(ALUOp), .ans(ALU_Out) );
    
    MUX #( .WIDTH(32) )MUX_MEMDATOUT (.d0(ALU_Out),.d1(datard),.s(MemaReg), .y(mux_Reg_Datawr));
    
    PC PC1(.PC_in(PC_in) , .clk(clk), .rst(rst), .PC_out(fPC));
    
    adder ADD1(.a(fPC), .b(AddIn) , .y(add1));
    
    adder ADD2(.a(add1), .b(out_UES), .y(add2)); 
    
    MUX #( .WIDTH(32) )MUX_PCin (.d0(add1),.d1(add2),.s(FuentePC), .y(PC_in));
    
         
endmodule
