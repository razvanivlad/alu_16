module bit_split_tb;
  reg [31 : 0] in;
  wire [15 : 0] out1;
  wire [15 : 0] out2;
  
  bit_split uut (
    .in(in),
    .out1(out1),
    .out2(out2)
  );
  
  integer i;
  initial begin
    in = $random;
    $display("Time\tin\tout1\tout2");
    $monitor("%0t\t%x\t%x\t%x", $time, in, out1, out2);
    for(i = 1 ; i < 5 ; i = i + 1) begin
      #10 in = $random;
    end
  end
  
endmodule