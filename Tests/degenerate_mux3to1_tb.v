module degenerate_mux3to1_tb;
  reg [31 : 0] in0;
  reg [31 : 0] in1;
  reg [31 : 0] in2;
  reg [1 : 0] sel;
  wire [31 : 0] out;
  
  degenerate_mux3to1 uut (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .sel(sel),
    .out(out)
  );
  
  integer i;
  initial begin
    in0 = $random;
    in1 = $random;
    in2 = $random;
    sel = $urandom_range(0, 3);
    $display("Time\tin0\tin1\tin2\tsel\tout");
    $monitor("%0t\t%x\t%x\t%x\t%b\t%x", $time, in0, in1, in2, sel, out);
    for(i = 1 ; i < 10 ; i = i + 1) begin
      #10
      in0 = $random;
      in1 = $random;
      in2 = $random;
      sel = $urandom_range(0, 3);
    end
  end
  
endmodule