module PC(PC_in, clk,PC_out);
    input [31:0] PC_in;
    input clk;
    output reg [31:0] PC_out;
    //reg PC_out;
    
    always @(posedge clk)
    begin 
        PC_out <= PC_in;
    end
endmodule
