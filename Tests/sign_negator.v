module sign_negator (in, out);
  input [15 : 0] in;
  wire signed [15 : 0] in;
  output [15 : 0] out;
  wire signed [15 : 0] out;
  
  wire [15 : 0] not_in;
  
  not_gate gate (
    .in(in),
    .out(not_in)
  );
  
  plus_1_adder adder (
    .in(not_in),
    .out(out)
  );
  
endmodule