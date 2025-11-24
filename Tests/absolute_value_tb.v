module absolute_value_tb;
  reg signed [15 : 0] in;
  wire [15 : 0] out;
  
  absolute_value uut (
    .in(in),
    .out(out)
  );
  
  integer i;
  initial begin
    in = $random;
    if(in == 16'h8000) begin
      $warning("WARNING: MIN_INT_16 is not supported for this module. Unexpected behaviour.");
    end
    $display("Time\tin\tout");
    $monitor("%0t\t%d\t%d", $time, in, out);
    for(i = 1 ; i < 10 ; i = i + 1) begin
      #10 in = $random;
      if(in == 16'h8000) begin
        $warning("WARNING: MIN_INT_16 is not supported for this module. Unexpected behaviour.");
      end
    end
  end
  
endmodule