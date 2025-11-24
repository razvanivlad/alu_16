module degenerate_mux3to1 #(parameter w = 32) (in0, in1, in2, sel, out);
  input [w-1 : 0] in0;
  wire [w-1 : 0] in0;
  input [w-1 : 0] in1;
  wire [w-1 : 0] in1;
  input [w-1 : 0] in2;
  wire [w-1 : 0] in2;
  input [1 : 0] sel;
  wire [1 : 0] sel;
  output [w-1 : 0] out;
  wire [w-1 : 0] out;
  
  assign out = (sel == 2'b00 ? in0 : {w{1'bz}});
  assign out = (sel == 2'b01 ? in1 : {w{1'bz}});
  assign out = (sel == 2'b10 ? in2 : {w{1'bz}});
  
endmodule