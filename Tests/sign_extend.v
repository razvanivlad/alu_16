module sign_extend #(parameter w = 16, parameter n = 1) (in, out);
  input [w-1 : 0] in;
  wire signed [w-1 : 0] in;
  output [w-1+n : 0] out;
  wire signed [w-1+n : 0] out;
  
  assign out = {{n{in[w-1]}}, in};
  
endmodule