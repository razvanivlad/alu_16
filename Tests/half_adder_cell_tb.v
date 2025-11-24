module half_adder_cell_tb;
  reg x;
  reg y;
  wire z;
  wire c_out;
  
  half_adder_cell uut (
    .x(x),
    .y(y),
    .z(z),
    .c_out(c_out)
  );
  
  integer i;
  initial begin
    {x, y} = 0;
    $display("Time\tx\ty\tz\tc_out");
    $monitor("%0t\t%b\t%b\t%b\t%b", $time, x, y, z, c_out);
    for(i = 1 ; i < 4 ; i = i + 1) begin
      #10 {x, y} = i;
    end
  end
  
endmodule