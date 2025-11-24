module non_restoring_division_tb;
  reg signed [15 : 0] divident;
  reg signed [15 : 0] divisor;
  wire signed [15 : 0] quotient;
  wire signed [15 : 0] remainder;
  
  non_restoring_division uut (
    .divident(divident),
    .divisor(divisor),
    .quotient(quotient),
    .remainder(remainder)
  );
  
  integer i;
  initial begin
    divident = $urandom_range(0, 400) - 200;
    divisor = $urandom_range(0, 400) - 200;
    $display("Time\tdivident\tdivisor\tq\tr");
    $monitor("%0t\t%d\t%d\t%d\t%d", $time, divident, divisor, quotient, remainder);
    for(i = 1 ; i < 50 ; i = i + 1) begin
      #10
      divident = $urandom_range(0, 400) - 200;
      divisor = $urandom_range(0, 400) - 200;
    end
  end
  
endmodule