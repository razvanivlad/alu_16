module and_gate #(parameter w = 16) (in1, in2, out);
  input [w-1 : 0] in1;
  wire [w-1 : 0] in1;
  input [w-1 : 0] in2;
  wire [w-1 : 0] in2;
  output [w-1 : 0] out;
  wire [w-1 : 0] out;
  
  genvar i;
  generate
    for(i = 0 ; i < w ; i = i + 1) begin: bit_gates
      bit_and bit_gate (.in1(in1[i]), .in2(in2[i]), .out(out[i]));
    end
  endgenerate
  
endmodule
  