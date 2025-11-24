module mux2to1 #(parameter w = 4) (in0, in1, sel, out);
  input [w-1 : 0] in0;
  wire [w-1 : 0] in0;
  input [w-1 : 0] in1;
  wire [w-1 : 0] in1;
  input sel;
  wire sel;
  output [w-1 : 0] out;
  wire [w-1 : 0] out;
  
  assign out = (sel == 1'b0 ? in0 : {w{1'bz}});
  assign out = (sel == 1'b1 ? in1 : {w{1'bz}});
  
endmodule