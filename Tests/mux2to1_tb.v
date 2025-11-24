module mux2to1_tb;
  reg [3 : 0] in0;
  reg [3 : 0] in1;
  reg sel;
  wire [3 : 0] out;
  
  mux2to1 uut (
    .in0(in0),
    .in1(in1),
    .sel(sel),
    .out(out)
  );
  
  integer i;
  initial begin
    in0 = $urandom_range(0, 15);
    in1 = $urandom_range(0, 15);
    sel = $urandom_range(0, 1);
    $display("Time\tin0\tin1\tsel\tout");
    $monitor("%0t\t%x\t%x\t%b\t%x", $time, in0, in1, sel, out);
    for(i = 1 ; i < 5 ; i = i + 1) begin
      #10
      in0 = $urandom_range(0, 15);
      in1 = $urandom_range(0, 15);
      sel = $urandom_range(0, 1);
    end
  end
  
endmodule