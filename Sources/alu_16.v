module alu_16 (clk, rst_n, packed_in, selection_lines, packed_out);
  input clk;
  input rst_n;
  input [31 : 0] packed_in;
  wire [31 : 0] packed_in;
  input [4 : 0] selection_lines;
  wire [4 : 0] selection_lines;
  output [31 : 0] packed_out;
  reg [31 : 0] packed_out;
  
  wire [1 : 0] class_code;
  wire [2 : 0] opcode;
  
  assign class_code = selection_lines[4 : 3];
  assign opcode = selection_lines[2 : 0];
  
  wire [31 : 0] comb_out;
  
  wire [31 : 0] arith_out;
  wire [31 : 0] logic_out;
  wire [31 : 0] shift_out;
  
  arithmetic_unit component1 (
    .arith_in(packed_in),
    .arith_lines(opcode),
    .arith_out(arith_out)
  );
  
  logic_unit component2 (
    .logic_in(packed_in),
    .logic_lines(opcode[1 : 0]),
    .logic_out(logic_out)
  );
  
  shift_unit component3 (
    .shift_in(packed_in),
    .shift_lines(opcode),
    .shift_out(shift_out)
  );
  
  degenerate_mux3to1 component4 (
    .in0(arith_out),
    .in1(logic_out),
    .in2(shift_out),
    .sel(class_code),
    .out(comb_out)
  );
  
  initial begin
    packed_out <= 32'bz;
  end
  
  always @(negedge rst_n) begin
    packed_out <= 32'b0;
  end
  
  always @(posedge clk) begin
    if(rst_n == 1'b1) begin
      packed_out <= comb_out;
    end
  end
  
endmodule
