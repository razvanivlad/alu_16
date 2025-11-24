module carry_select_adder (op1, op2, c_in, result);
  input [16 : 0] op1;
  wire signed [16 : 0] op1;
  input [16 : 0] op2;
  wire signed [16 : 0] op2;
  input c_in;
  wire c_in;
  output [31 : 0] result;
  wire signed [31 : 0] result;
  // ignore end around carry
  
  wire [2 : 0] inter_level_carry;
  wire signed [16 : 0] partial_result;
  
  genvar i;
  generate
    for(i = 0 ; i < 4 ; i = i + 1) begin: adder_levels
      if(i == 0) begin
        ripple_carry_adder #(.w(5)) first_level (.op1(op1[4 : 0]), .op2(op2[4 : 0]), .c_in(c_in), .result(partial_result[4 : 0]), .c_out(inter_level_carry[0]));
      end else if(i == 3) begin
        adder_level last_level (.op1(op1[16 : 13]), .op2(op2[16 : 13]), .c_in(inter_level_carry[2]), .result(partial_result[16 : 13]), .c_out());
      end else begin
        adder_level inter_level (.op1(op1[4*i+4 -: 4]), .op2(op2[4*i+4 -: 4]), .c_in(inter_level_carry[i-1]), .result(partial_result[4*i+4 -: 4]), .c_out(inter_level_carry[i]));
      end
    end
  endgenerate
  
  sign_extend #(.w(17), .n(15)) extend_to_32 (
    .in(partial_result),
    .out(result)
  );
  
endmodule
  