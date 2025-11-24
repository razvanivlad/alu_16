module shift_unit_tb;
  reg [31 : 0] shift_in;
  reg [2 : 0] shift_lines;
  wire [31 : 0] shift_out;
  
  shift_unit uut (
    .shift_in(shift_in),
    .shift_lines(shift_lines),
    .shift_out(shift_out)
  );
  
  integer i;
  initial begin
    shift_in = $random;
    shift_lines = $urandom_range(0, 7);
    $display("Time\tpacked_in\top1\top2\tsel\tpacked_out");
    $monitor("%0t\t%x\t%b\t%b\t%b\t%b", $time, shift_in, shift_in[31 : 16], shift_in[15 : 0], shift_lines, shift_out);
    for(i = 1 ; i < 20 ; i = i + 1) begin
      #10
      shift_in = $random;
      shift_lines = $urandom_range(0, 7);
    end
  end
  
endmodule