module logic_unit (logic_in, logic_lines, logic_out);
  input [31 : 0] logic_in;
  wire [31 : 0] logic_in;
  input [1 : 0] logic_lines;
  wire [1 : 0] logic_lines;
  output [31 : 0] logic_out;
  wire [31 : 0] logic_out;
  
  wire [15 : 0] op1;
  wire [15 : 0] op2;
  
  bit_split component1 (
    .in(logic_in),
    .out1(op1),
    .out2(op2)
  );
  
  wire [15 : 0] and_out;
  wire [15 : 0] nand_out;
  
  and_gate component2 (
    .in1(op1),
    .in2(op2),
    .out(and_out)
  );
  
  nand_gate component3 (
    .in1(op1),
    .in2(op2),
    .out(nand_out)
  );
  
  wire [31 : 0] packed_and_nand;
  
  bit_concat component4 (
    .in1(and_out),
    .in2(nand_out),
    .out(packed_and_nand)
  );
  
  wire [15 : 0] or_out;
  wire [15 : 0] nor_out;
  
  or_gate component5 (
    .in1(op1),
    .in2(op2),
    .out(or_out)
  );
  
  nor_gate component6 (
    .in1(op1),
    .in2(op2),
    .out(nor_out)
  );
  
  wire [31 : 0] packed_or_nor;
  
  bit_concat component7 (
    .in1(or_out),
    .in2(nor_out),
    .out(packed_or_nor)
  );
  
  wire [15 : 0] xor_out;
  wire [15 : 0] xnor_out;
  
  xor_gate component8 (
    .in1(op1),
    .in2(op2),
    .out(xor_out)
  );
  
  xnor_gate component9 (
    .in1(op1),
    .in2(op2),
    .out(xnor_out)
  );
  
  wire [31 : 0] packed_xor_xnor;
  
  bit_concat component10 (
    .in1(xor_out),
    .in2(xnor_out),
    .out(packed_xor_xnor)
  );
  
  wire [15 : 0] not_op1;
  wire [15 : 0] not_op2;
  
  not_gate component11 (
    .in(op1),
    .out(not_op1)
  );
  
  not_gate component12 (
    .in(op2),
    .out(not_op2)
  );
  
  wire [31 : 0] packed_not;
  
  bit_concat component13 (
    .in1(not_op1),
    .in2(not_op2),
    .out(packed_not)
  );
  
  mux4to1 component14 (
    .in0(packed_and_nand),
    .in1(packed_or_nor),
    .in2(packed_xor_xnor),
    .in3(packed_not),
    .sel(logic_lines),
    .out(logic_out)
  );
  
endmodule