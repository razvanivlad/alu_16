module bit_xnor_tb;
  reg in1;
  reg in2;
  wire out;
  
  bit_xnor uut (
    .in1(in1),
    .in2(in2),
    .out(out)
  );
  
  integer i;
  initial begin
    {in1, in2} = 2'b00;
    $display("Time\tin1\tin2\tout");
    $monitor("%0t\t%b\t%b\t%b", $time, in1, in2, out);
    for(i = 1 ; i < 4 ; i = i + 1) begin
      #10 {in1, in2} = i;
    end
  end
  
endmodule