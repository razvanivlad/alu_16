module logic_unit_tb;
  reg [31 : 0] logic_in;
  reg [1 : 0] logic_lines;
  wire [31 : 0] logic_out;
  
  logic_unit uut (
    .logic_in(logic_in),
    .logic_lines(logic_lines),
    .logic_out(logic_out)
  );
  
  integer i;
  initial begin
    logic_in = $random;
    logic_lines = $urandom_range(0, 3);
    $display("Time\tpacked_in\top1\top2\tsel\tpacked_out");
    $monitor("%0t\t%x\t%b\t%b\t%b\t%b", $time, logic_in, logic_in[31 : 16], logic_in[15 : 0], logic_lines, logic_out);
    for(i = 1 ; i < 20 ; i = i + 1) begin
      #10
      logic_in = $random;
      logic_lines = $urandom_range(0, 3);
    end
  end
  
endmodule