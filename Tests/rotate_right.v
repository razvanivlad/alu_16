module rotate_right #(parameter w = 16) (in, out);
  input [w-1 : 0] in;
  wire [w-1 : 0] in;
  output [w-1 : 0] out;
  wire [w-1 : 0] out;
  
  assign out = {in[0], in[w-1 : 1]};
  
endmodule