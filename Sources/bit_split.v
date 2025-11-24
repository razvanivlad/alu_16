module bit_split #(parameter w = 16) (in, out1, out2);
  input [2*w-1 : 0] in;
  wire [2*w-1 : 0] in;
  output [w-1 : 0] out1;
  wire [w-1 : 0] out1;
  output [w-1 : 0] out2;
  wire [w-1 : 0] out2;
  
  assign {out1, out2} = in;
  
endmodule