module half_adder_cell (x, y, z, c_out);
  input x;
  wire x;
  input y;
  wire y;
  output z;
  wire z;
  output c_out;
  wire c_out;
  
  assign z = x ^ y;
  assign c_out = x & y;
  
endmodule