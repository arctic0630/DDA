/2-1 Multiplexer - Source file ----
//----------------------------------------
module MUX_2 (d0, d1, s, y);
parameter WIDTH = 8;
input [WIDTH-1:0] d0, d1;
input s;
output [WIDTH-1:0] y;

assign y = s ? d1 : d0;

endmodule
