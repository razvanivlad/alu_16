module adder_substractor_tb;
  reg signed [15 : 0] op1;
  reg signed [15 : 0] op2;
  reg mode;
  wire signed [31 : 0] result;
  
  adder_substractor uut (
    .op1(op1),
    .op2(op2),
    .mode(mode),
    .result(result)
  );
  
  integer i;
  initial begin
    op1 = $random;
    op2 = $random;
    mode = $urandom_range(0, 1);
    $display("Time\top1\top2\tmode\tresult");
    $monitor("%0t\t%d\t%d\t%b\t%d", $time, op1, op2, mode, result);
    for(i = 1 ; i < 50 ; i = i + 1) begin
      #10;
      op1 = $random;
      op2 = $random;
      mode = $urandom_range(0, 1);
    end
  end
  
endmodule