module sign_extend_tb;
  reg signed [15 : 0] in;
  wire signed [16 : 0] out;
  
  sign_extend uut (
    .in(in),
    .out(out)
  );
  
  integer i;
  initial begin
    in = $random;
    $display("Time\tin\tout");
    $monitor("%0t\t%b(%d)\t%b(%d)", $time, in, in, out, out);
    for(i = 1 ; i < 10 ; i = i + 1) begin
      #10 in = $random;
    end
  end
  
endmodule