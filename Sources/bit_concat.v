module bit_concat #(parameter w = 16) (in1, in2, out);
  input [w-1 : 0] in1;
  wire [w-1 : 0] in1;
  input [w-1 : 0] in2;
  wire [w-1 : 0] in2;
  output [2*w-1 : 0] out;
  wire [2*w-1 : 0] out;
  
  assign out = {in1, in2};
  
endmodule