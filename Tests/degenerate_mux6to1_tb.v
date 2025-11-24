module degenerate_mux6to1_tb;
  reg [31 : 0] in0;
  reg [31 : 0] in1;
  reg [31 : 0] in2;
  reg [31 : 0] in3;
  reg [31 : 0] in4;
  reg [31 : 0] in5;
  reg [2 : 0] sel;
  wire [31 : 0] out;
  
  degenerate_mux6to1 uut (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .sel(sel),
    .out(out)
  );
  
  integer i;
  initial begin
    in0 = $random;
    in1 = $random;
    in2 = $random;
    in3 = $random;
    in4 = $random;
    in5 = $random;
    sel = $urandom_range(0, 7);
    $display("Time\tin0\tin1\tin2\tin3\tin4\tin5\tsel\tout");
    $monitor("%0t\t%x\t%x\t%x\t%x\t%x\t%x\t%b\t%x", $time, in0, in1, in2, in3, in4, in5, sel, out);
    for(i = 1 ; i < 20 ; i = i + 1) begin
      #10
      in0 = $random;
      in1 = $random;
      in2 = $random;
      in3 = $random;
      in4 = $random;
      in5 = $random;
      sel = $urandom_range(0, 7);
    end
  end
  
endmodule