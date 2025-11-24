module not_gate #(parameter w = 16) (in, out);
  input [w-1 : 0] in;
  wire [w-1 : 0] in;
  output [w-1 : 0] out;
  wire [w-1 : 0] out;
  
  genvar i;
  generate
    for(i = 0 ; i < w ; i = i + 1) begin: bit_gates
      bit_not bit_gate (.in(in[i]), .out(out[i]));
    end
  endgenerate
  
endmodule