module logic_shift_right #(parameter w = 16) (in, out);
  input [w-1 : 0] in;
  wire [w-1 : 0] in;
  output [w-1 : 0] out;
  wire [w-1 : 0] out;
  
  assign out = {1'b0, in[w-1 : 1]};
  
endmodule