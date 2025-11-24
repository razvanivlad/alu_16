module arithmetic_unit (arith_in, arith_lines, arith_out);
  input [31 : 0] arith_in;
  wire [31 : 0] arith_in;
  input [2 : 0] arith_lines;
  wire [2 : 0] arith_lines;
  output [31 : 0] arith_out;
  wire [31 : 0] arith_out;
  
  wire signed [15 : 0] op1;
  wire signed [15 : 0] op2;
  
  bit_split component1 (
    .in(arith_in),
    .out1(op1),
    .out2(op2)
  );
  
  wire signed [31 : 0] sum_or_difference;
  
  adder_substractor component2 (
    .op1(op1),
    .op2(op2),
    .mode(arith_lines[2]),
    .result(sum_or_difference)
  );
  
  wire signed [31 : 0] product;
  
  booth_radix4_multiplier component3 (
    .op1(op1),
    .op2(op2),
    .result(product)
  );
  
  wire signed [15 : 0] quotient;
  wire signed [15 : 0] remainder;
  
  non_restoring_division component4 (
    .divident(op1),
    .divisor(op2),
    .quotient(quotient),
    .remainder(remainder)
  );
  
  wire [31 : 0] packed_q_r;
  
  bit_concat component5 (
    .in1(quotient),
    .in2(remainder),
    .out(packed_q_r)
  );
  
  wire [31 : 0] neg_operands;
  
  operands_negator component6 (
    .op1(op1),
    .op2(op2),
    .result(neg_operands)
  );
  
  mux4to1 component7 (
    .in0(sum_or_difference),
    .in1(product),
    .in2(packed_q_r),
    .in3(neg_operands),
    .sel(arith_lines[1 : 0]),
    .out(arith_out)
  );
  
endmodule