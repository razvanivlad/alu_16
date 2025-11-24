module ripple_carry_adder #(parameter w = 4) (op1, op2, c_in, result, c_out);
  input [w-1 : 0] op1;
  wire signed [w-1 : 0] op1;
  input [w-1 : 0] op2;
  wire signed [w-1 : 0] op2;
  input c_in;
  wire c_in;
  output [w-1 : 0] result;
  wire signed [w-1 : 0] result;
  output c_out;
  wire c_out;
  
  wire [w-2 : 0] internal_carry;
  
  genvar i;
  generate
    for(i = 0 ; i < w ; i = i + 1) begin: full_adder_cells
      if(i == 0) begin
        full_adder_cell first_cell (.x(op1[0]), .y(op2[0]), .c_in(c_in), .z(result[0]), .c_out(internal_carry[0]));
      end else if(i == w - 1) begin
        full_adder_cell last_cell (.x(op1[w-1]), .y(op2[w-1]), .c_in(internal_carry[w-2]), .z(result[w-1]), .c_out(c_out));
      end else begin
        full_adder_cell internal_cell (.x(op1[i]), .y(op2[i]), .c_in(internal_carry[i-1]), .z(result[i]), .c_out(internal_carry[i]));
      end
    end
  endgenerate
  
endmodule