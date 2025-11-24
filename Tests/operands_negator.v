module operands_negator (op1, op2, result);
  input [15 : 0] op1;
  wire signed [15 : 0] op1;
  input [15 : 0] op2;
  wire signed [15 : 0] op2;
  output [31 : 0] result;
  wire [31 : 0] result;
  
  wire [15 : 0] neg_op1;
  wire [15 : 0] neg_op2;
  
  sign_negator sign_1 (
    .in(op1),
    .out(neg_op1)
  );
  
  sign_negator sign_2 (
    .in(op2),
    .out(neg_op2)
  );
  
  bit_concat pack (
    .in1(neg_op1),
    .in2(neg_op2),
    .out(result)
  );
  
endmodule