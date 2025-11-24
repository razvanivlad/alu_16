module booth_radix4_multiplier_tb;
  reg signed [15 : 0] op1;
  reg signed [15 : 0] op2;
  wire signed [31 : 0] result;
  
  booth_radix4_multiplier uut (
    .op1(op1),
    .op2(op2),
    .result(result)
  );
  
  integer i;
  initial begin
    op1 = $urandom_range(0, 1000) - 500;
    op2 = $urandom_range(0, 1000) - 500;
    $display("Time\top1\top2\tresult");
    $monitor("%0t\t%d\t%d\t%d", $time, op1, op2, result);
    for(i = 1 ; i < 20 ; i = i + 1) begin
      #10
      op1 = $urandom_range(0, 1000) - 500;
      op2 = $urandom_range(0, 1000) - 500;
    end
  end
  
endmodule