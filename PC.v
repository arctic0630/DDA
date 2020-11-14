module PC(PC_in, clk, rst,PC_out);
    input [31:0] PC_in;
    input clk, rst;
    output reg [31:0] PC_out;
    //reg PC_out;
    
    always @(posedge clk)
    begin 
    if(rst == 1'b1)
        PC_out <= 32'b00000000000000000000000000000000;
    else
        PC_out <= PC_in;
    end
endmodule
