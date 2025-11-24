module absolute_value #(parameter w = 16) (in, out);
  input [w-1 : 0]  in;
  wire signed [w-1 : 0] in;
  output [w-1 : 0] out;
  wire [w-1 : 0] out;
  
  wire [15 : 0] neg_in;
  
  sign_negator sgn (
    .in(in),
    .out(neg_in)
  );
  
  wire is_negative;
  
  assign is_negative = in[w-1];
  
  mux2to1 #(.w(16)) mux (
    .in0(in),
    .in1(neg_in),
    .sel(is_negative),
    .out(out)
  );
  
endmodule