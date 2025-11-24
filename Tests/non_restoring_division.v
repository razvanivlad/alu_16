module non_restoring_division (divident, divisor, quotient, remainder);
  input [15 : 0] divident;
  wire signed [15 : 0] divident;
  input [15 : 0] divisor;
  wire signed [15 : 0] divisor;
  output [15 : 0] quotient;
  wire signed [15 : 0] quotient;
  output [15 : 0] remainder;
  wire signed [15 : 0] remainder;
  
  wire [15 : 0] abs_divident;
  wire [15 : 0] abs_divisor;
  
  reg [15 : 0] abs_quotient;
  reg signed [16 : 0] inter_remainder;
  
  absolute_value abs1 (
    .in(divident),
    .out(abs_divident)
  );
  
  absolute_value abs2 (
    .in(divisor),
    .out(abs_divisor)
  );
  
  reg signed [15 : 0] quotient_reg;
  reg signed [15 : 0] remainder_reg;
  
  integer i;
  always @* begin
    
    quotient_reg  = 16'd0;
    remainder_reg = 16'd0;
    inter_remainder = 17'd0;
    abs_quotient = 16'd0;
    
    if(divisor == 0) begin
      
      $warning("WARNING: Division by 0 encountered at %0t", $time);
      quotient_reg = 16'd0;
      remainder_reg = 16'd0;
      
    end else begin
      
      inter_remainder = 17'd0;
      abs_quotient = 16'd0;
      
      for(i = 15 ; i >= 0 ; i = i - 1) begin
        
        inter_remainder = {inter_remainder[15 : 0], abs_divident[i]};
        
        if(inter_remainder[16] == 1'b0) begin
          inter_remainder = inter_remainder - {1'b0, abs_divisor};
        end else begin
          inter_remainder = inter_remainder + {1'b0, abs_divisor};
        end
        
        if(inter_remainder[16] == 1'b0) begin
          abs_quotient[i] = 1'b1;
        end else begin
          abs_quotient[i] = 1'b0;
        end
        
      end
      
      if(inter_remainder[16] == 1'b1) begin
        inter_remainder = inter_remainder + {1'b0, abs_divisor};
      end
      
      if(divident[15] ^ divisor[15]) begin
        quotient_reg = -($signed(abs_quotient));
      end else begin
        quotient_reg = $signed(abs_quotient);
      end
      
      if(divident[15] == 1'b1) begin
        remainder_reg = -($signed(inter_remainder[15 : 0]));
      end else begin
        remainder_reg = $signed(inter_remainder[15 : 0]);
      end
      
    end
    
  end
  
  assign remainder = remainder_reg;
  assign quotient = quotient_reg;
  
endmodule