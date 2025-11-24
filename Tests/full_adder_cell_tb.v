module full_adder_cell_tb;
  reg x;
  reg y;
  reg c_in;
  wire z;
  wire c_out;
  
  full_adder_cell uut (
    .x(x),
    .y(y),
    .c_in(c_in),
    .z(z),
    .c_out(c_out)
  );
  
  integer i;
  initial begin
    {x, y, c_in} = 3'b000;
    $display("Time\tx\ty\tc_in\tz\tc_out");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, x, y, c_in, z, c_out);
    for(i = 1 ; i < 8 ; i = i + 1) begin
      #10 {x, y, c_in} = i;
    end
  end
  
endmodule