module shift_unit (shift_in, shift_lines, shift_out);
  input [31 : 0] shift_in;
  wire [31 : 0] shift_in;
  input [2 : 0] shift_lines;
  wire [2 : 0] shift_lines;
  output [31 : 0] shift_out;
  wire [31 : 0] shift_out;
  
  wire [15 : 0] op1;
  wire [15 : 0] op2;
  
  bit_split component1 (
    .in(shift_in),
    .out1(op1),
    .out2(op2)
  );
  
  wire [15 : 0] lsl_op1;
  wire [15 : 0] lsl_op2;
  
  logic_shift_left component2 (
    .in(op1),
    .out(lsl_op1)
  );
  
  logic_shift_left component3 (
    .in(op2),
    .out(lsl_op2)
  );
  
  wire [31 : 0] packed_lsl;
  
  bit_concat component4 (
    .in1(lsl_op1),
    .in2(lsl_op2),
    .out(packed_lsl)
  );
  
  wire [15 : 0] asl_op1;
  wire [15 : 0] asl_op2;
  
  arith_shift_left component5 (
    .in(op1),
    .out(asl_op1)
  );
  
  arith_shift_left component6 (
    .in(op2),
    .out(asl_op2)
  );
  
  wire [31 : 0] packed_asl;
  
  bit_concat component7 (
    .in1(asl_op1),
    .in2(asl_op2),
    .out(packed_asl)
  );
  
  wire [15 : 0] lsr_op1;
  wire [15 : 0] lsr_op2;
  
  logic_shift_right component8 (
    .in(op1),
    .out(lsr_op1)
  );
  
  logic_shift_right component9 (
    .in(op2),
    .out(lsr_op2)
  );
  
  wire [31 : 0] packed_lsr;
  
  bit_concat component10 (
    .in1(lsr_op1),
    .in2(lsr_op2),
    .out(packed_lsr)
  );
  
  wire [15 : 0] asr_op1;
  wire [15 : 0] asr_op2;
  
  arith_shift_right component11 (
    .in(op1),
    .out(asr_op1)
  );
  
  arith_shift_right component12 (
    .in(op2),
    .out(asr_op2)
  );
  
  wire [31 : 0] packed_asr;
  
  bit_concat component13 (
    .in1(asr_op1),
    .in2(asr_op2),
    .out(packed_asr)
  );
  
  wire [15 : 0] rotl_op1;
  wire [15 : 0] rotl_op2;
  
  rotate_left component14 (
    .in(op1),
    .out(rotl_op1)
  );
  
  rotate_left component15 (
    .in(op2),
    .out(rotl_op2)
  );
  
  wire [31 : 0] packed_rotl;
  
  bit_concat component16 (
    .in1(rotl_op1),
    .in2(rotl_op2),
    .out(packed_rotl)
  );
  
  wire [15 : 0] rotr_op1;
  wire [15 : 0] rotr_op2;
  
  rotate_right component17 (
    .in(op1),
    .out(rotr_op1)
  );
  
  rotate_right component18 (
    .in(op2),
    .out(rotr_op2)
  );
  
  wire [31 : 0] packed_rotr;
  
  bit_concat component19 (
    .in1(rotr_op1),
    .in2(rotr_op2),
    .out(packed_rotr)
  );
  
  degenerate_mux6to1 component20 (
    .in0(packed_lsl),
    .in1(packed_asl),
    .in2(packed_lsr),
    .in3(packed_asr),
    .in4(packed_rotl),
    .in5(packed_rotr),
    .sel(shift_lines),
    .out(shift_out)
  );
  
endmodule
  