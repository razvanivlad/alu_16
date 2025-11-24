module bit_concat_tb;
  reg [15 : 0] in1;
  reg [15 : 0] in2;
  wire [31 : 0] out;
  
  bit_concat uut (
    .in1(in1),
    .in2(in2),
    .out(out)
  );
  
  integer i;
  initial begin
    {in1, in2} = {$random, $random};
    $display("Time\tin1\tin2\tout");
    $monitor("%0t\t%x\t%x\t%x", $time, in1, in2, out);
    for(i = 1 ; i < 20 ; i = i + 1) begin
      #10 {in1, in2} = {$random, $random};
    end
  end
  
endmodule