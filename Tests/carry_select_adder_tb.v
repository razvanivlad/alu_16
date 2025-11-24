module carry_select_adder_tb;
  reg signed [16 : 0] op1;
  reg signed [16 : 0] op2;
  wire signed [31 : 0] result;
  
  carry_select_adder uut (
    .op1(op1),
    .op2(op2),
    .c_in(1'b0),
    .result(result)
  );
  
  integer i;
  initial begin
    op1 = $urandom_range(0, 65535) - 32768;
    op2 = $urandom_range(0, 65535) - 32768;
    $display("Time\top1\top2\tresult");
    $monitor("%0t\t%d\t%d\t%d", $time, op1, op2, result);
    for(i = 1 ; i < 50 ; i = i + 1) begin
      #10
      op1 = $urandom_range(0, 65535) - 32768;
      op2 = $urandom_range(0, 65535) - 32768;
    end
  end
  
endmodule