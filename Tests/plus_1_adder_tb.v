module plus_1_adder_tb;
  reg signed [15 : 0] in;
  wire signed [15 : 0] out;
  
  plus_1_adder uut (
    .in(in),
    .out(out)
  );
  
  integer i;
  initial begin
    in = {1'b0, {15{1'b1}}};
    $display("Time\tin\tout");
    if(in == 16'h7fff) begin
      $warning("WARNING: MAX_INT_16 not supported for this module. Unexpected behaviour");
    end
    $monitor("%0t\t%d\t%d", $time, in, out);
    for(i = 1 ; i < 10 ; i = i + 1) begin
      #10 in = $random;
      if(in == 16'h7fff) begin
        $warning("WARNING: MAX_INT_16 not supported for this module. Unexpected behaviour");
      end
    end
  end
  
endmodule
