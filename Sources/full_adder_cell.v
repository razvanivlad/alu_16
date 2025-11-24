module full_adder_cell (x, y, c_in, z, c_out);
  input x;
  wire x;
  input y;
  wire y;
  input c_in;
  wire c_in;
  output z;
  wire z;
  output c_out;
  wire c_out;
  
  assign z = x ^ y ^ c_in;
  assign c_out = (x & y) | (y & c_in) | (x & c_in);
  
endmodule