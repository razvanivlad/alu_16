module plus_1_adder (in, out);
  input [15 : 0] in;
  wire signed [15 : 0] in;
  output [15 : 0] out;
  wire signed [15 : 0] out;
  
  bit_not first_bit (
    .in(in[0]),
    .out(out[0])
  );
  
  wire [13 : 0] inter_carry;
  
  genvar i;
  generate
    for(i = 1 ; i < 16 ; i = i + 1) begin: cells
      if(i == 1) begin
        half_adder_cell hac (.x(in[1]), .y(in[0]), .z(out[1]), .c_out(inter_carry[0]));
      end else if(i == 15) begin
        half_adder_cell hac (.x(in[15]), .y(inter_carry[13]), .z(out[15]), .c_out());
      end else begin
        half_adder_cell hac (.x(in[i]), .y(inter_carry[i-2]), .z(out[i]), .c_out(inter_carry[i-1]));
      end
    end
  endgenerate
  
endmodule