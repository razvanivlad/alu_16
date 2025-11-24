module adder_level (op1, op2, c_in, result, c_out);
  input [3 : 0] op1;
  wire signed [3 : 0] op1;
  input [3 : 0] op2;
  wire signed [3 : 0] op2;
  input c_in;
  wire c_in;
  output [3 : 0] result;
  wire signed [3 : 0] result;
  output c_out;
  wire c_out;
  
  wire [3 : 0] carry_0_result;
  wire [3 : 0] carry_1_result;
  wire carry_0_c_out;
  wire carry_1_c_out;
  
  ripple_carry_adder carry_0_adder (
    .op1(op1),
    .op2(op2),
    .c_in(1'b0),
    .result(carry_0_result),
    .c_out(carry_0_c_out)
  );
  
  ripple_carry_adder carry_1_adder (
    .op1(op1),
    .op2(op2),
    .c_in(1'b1),
    .result(carry_1_result),
    .c_out(carry_1_c_out)
  );
  
  mux2to1 result_selector (
    .in0(carry_0_result),
    .in1(carry_1_result),
    .sel(c_in),
    .out(result)
  );
  
  mux2to1 #(.w(1)) carry_selector (
    .in0(carry_0_c_out),
    .in1(carry_1_c_out),
    .sel(c_in),
    .out(c_out)
  );
  
endmodule