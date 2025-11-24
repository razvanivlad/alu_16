module operands_negator_tb;
  reg signed [15 : 0] op1;
  reg signed [15 : 0] op2;
  wire [31 : 0] result;
  
  operands_negator uut (
    .op1(op1),
    .op2(op2),
    .result(result)
  );
  
  wire signed [15 : 0] neg_op1;
  wire signed [15 : 0] neg_op2;
  
  assign neg_op1 = result[31 : 16];
  assign neg_op2 = result[15 : 0];
  
  integer i;
  initial begin
    op1 = $random;
    op2 = $random;
    if(op1 == 16'h8000 || op2 == 16'h8000) begin
      $warning("WARNING: MIN_INT_16 not supported for this module. Unexpected behaviour.");
    end
    $display("Time\top1\top2\tpacked_result\t-op1\t-op2");
    $monitor("%0t\t%d\t%d\t%b\t%d\t%d", $time, op1, op2, result, neg_op1, neg_op2);
    for(i = 1 ; i < 10 ; i = i + 1) begin
      #10
      op1 = $random;
      op2 = $random;
      if(op1 == 16'h8000 || op2 == 16'h8000) begin
        $warning("WARNING: MIN_INT_16 not supported for this module. Unexpected behaviour.");
      end
    end
  end
  
endmodule