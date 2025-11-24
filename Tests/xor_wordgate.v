module xor_wordgate #(parameter w = 17) (in, bit, out);
  input [w-1 : 0] in;
  wire [w-1 : 0] in;
  input bit;
  wire bit;
  output [w-1 : 0] out;
  wire [w-1 : 0] out;
  
  genvar i;
  generate
    for(i = 0 ; i < w ; i = i + 1) begin: bit_gates
      bit_xor bit_gate (.in1(in[i]), .in2(bit), .out(out[i]));
    end
  endgenerate
  
endmodule