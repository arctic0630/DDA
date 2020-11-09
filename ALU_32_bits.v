module ALU(
    input [31:0] in1,
    input [31:0] in2,
    input [2:0] sel,
    output reg [31:0] ans
    );
    
    always @(*)begin
        case(sel)
            3'b000 : ans = in1 + in2;
            3'b001 : ans = (in2>in1)?(in2-in1):(in1-in2);
            3'b010 : ans = in1 | in2;
            3'b011 : ans = in1 & in2;
            3'b100 : ans = in1 ^ in2;
            3'b101 : ans = in1 * in2;
            3'b111 : ans = (in1==in2)?32'b11111111111111111111111111111111:32'b00000000000000000000000000000000; 
        endcase
    end
        
endmodule
