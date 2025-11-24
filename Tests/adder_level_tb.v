module adder_level_tb;
  reg signed [3 : 0] op1;
  reg signed [3 : 0] op2;
  reg c_in;
  wire signed [3 : 0] result;
  wire c_out;
  
  adder_level uut (
    .op1(op1),
    .op2(op2),
    .c_in(c_in),
    .result(result),
    .c_out(c_out)
  );
  
  integer i;
  initial begin
    op1 = $random;
    op2 = $random;
    c_in = $urandom_range(0, 1);
    $display("Time\top1\top2\tc_in\tresult\tc_out");
    $monitor("%0t\t%d\t%d\t%b\t%d\t%b", $time, op1, op2, c_in, result, c_out);
    for(i = 1 ; i < 50 ; i = i + 1) begin
      #10
      op1 = $random;
      op2 = $random;
      c_in = $urandom_range(0, 1);
    end
  end
  
endmodule