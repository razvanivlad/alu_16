module booth_radix4_multiplier (op1, op2, result);
  input [15 : 0] op1;
  wire signed [15 : 0] op1;
  input [15 : 0] op2;
  wire signed [15 : 0] op2;
  output [31 : 0] result;
  wire signed [31 : 0] result;
  
  wire signed [17 : 0] extended_op1;
  wire signed [17 : 0] extended_op2;
  
  sign_extend #(.w(16), .n(2)) sgn (
    .in(op1),
    .out(extended_op1)
  );
  
  assign extended_op2 = {op2[15], op2, 1'b0};
  
  reg signed [33 : 0] product;
  reg signed [17 : 0] partial_product;
  reg [2 : 0] booth_bits;
  
  reg signed [33 : 0] extended_partial_product;
  reg signed [33 : 0] shifted_partial_product;
  
  integer i;
  always @* begin
    
    product = 34'd0;
    
    for(i = 0 ; i < 8 ; i = i + 1) begin
      
      booth_bits = extended_op2[2*i+2 -: 3];
      
      partial_product = 18'd0;
      
      case(booth_bits)
        3'b000:
        begin
          partial_product = 18'd0;
        end
        3'b001:
        begin
          partial_product = extended_op1;
        end
        3'b010:
        begin
          partial_product = extended_op1;
        end
        3'b011:
        begin
          partial_product = extended_op1 <<< 1;
        end
        3'b100:
        begin
          partial_product = extended_op1 <<< 1;
          partial_product = -partial_product;
        end
        3'b101:
        begin
          partial_product = -extended_op1;
        end
        3'b110:
        begin
          partial_product = -extended_op1;
        end
        3'b111:
        begin
          partial_product = 18'd0;
        end
      endcase
      
      extended_partial_product = {{16{partial_product[17]}}, partial_product};
      shifted_partial_product = extended_partial_product <<< (2*i);
      
      product = product + shifted_partial_product;
      
    end
    
  end
  
  assign result = product[31 : 0];
   
endmodule