module arith_shift_right_tb;
  reg [15 : 0] in;
  wire [15 : 0] out;
  
  arith_shift_right uut (
    .in(in),
    .out(out)
  );
  
  integer i;
  initial begin
    in = $random;
    $display("Time\tin\tout");
    $monitor("%0t\t%b\t%b", $time, in, out);
    for(i = 1 ; i < 10 ; i = i + 1) begin
      #10 in = $random;
    end
  end
  
endmodule