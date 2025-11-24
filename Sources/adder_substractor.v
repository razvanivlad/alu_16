module adder_substractor (op1, op2, mode, result);
  input [15 : 0] op1;
  wire signed [15 : 0] op1;
  input [15 : 0] op2;
  wire signed [15 : 0] op2;
  input mode;   // 0 - add: op1 + op2
  wire mode;    // 1 - sub: op1 - op2
  output [31 : 0] result;
  wire signed [31 : 0] result;
  
  wire [16 : 0] extended_op1;
  wire [16 : 0] extended_op2;
  
  sign_extend component1 (
    .in(op1),
    .out(extended_op1)
  );
  
  sign_extend component2 (
    .in(op2),
    .out(extended_op2)
  );
  
  wire [16 : 0] op2_xor_mode;
  
  xor_wordgate component3 (
    .in(extended_op2),
    .bit(mode),
    .out(op2_xor_mode)
  );
  
  carry_select_adder component4 (
    .op1(extended_op1),
    .op2(op2_xor_mode),
    .c_in(mode),
    .result(result)
  );
  
endmodule