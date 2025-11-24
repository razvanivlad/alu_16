module bit_not_tb;
  reg in;
  wire out;
  
  bit_not uut (
    .in(in),
    .out(out)
  );
  
  initial begin
    in = 1'b0;
    $display("Time\tin\tout");
    $monitor("%0t\t%b\t%b", $time, in, out);
    #10 in = 1'b1;
  end
  
endmodule