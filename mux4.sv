module mux4 #(parameter N = 64) 
(input logic [N-1:0] d0, d1, d2, d3,
input logic [1:0] s,
output logic [N-1:0] y);
logic [N-1:0] low, high; 

mux2 #(N)lowmux(.d0(d0), .d1(d1), .s(s[0]), .y(low)); 

mux2 #(N)highmux(.s(s[0]), .y(high), .d0(d2), .d1(d3));
 
mux2 #(N)finalmux(.y(y), .d1(high), .d0(low), .s(s[1]));

endmodule