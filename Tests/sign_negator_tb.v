module sign_negator_tb;
  reg signed [15 : 0] in;
  wire signed [15 : 0] out;
  
  sign_negator uut (
    .in(in),
    .out(out)
  );
  
  integer i;
  initial begin
    in = {1'b1, {15{1'b0}}};
    if(in == 16'h8000) begin
      $warning("WARNING: MIN_INT_16 not supported for this module. Unexpected behaviour.");
    end
    $display("Time\tin\tout");
    $monitor("%0t\t%d\t%d", $time, in, out);
    for(i = 1 ; i < 10 ; i = i + 1) begin
      #10 in = $random;
      if(in == 16'h8000) begin
        $warning("WARNING: MIN_INT_16 not supported for this module. Unexpected behaviour.");
      end
    end
  end
  
endmodule