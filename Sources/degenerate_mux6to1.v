module degenerate_mux6to1 #(parameter w = 32) (in0, in1, in2, in3, in4, in5, sel, out);
  input [w-1 : 0] in0;
  wire [w-1 : 0] in0;
  input [w-1 : 0] in1;
  wire [w-1 : 0] in1;
  input [w-1 : 0] in2;
  wire [w-1 : 0] in2;
  input [w-1 : 0] in3;
  wire [w-1 : 0] in3;
  input [w-1 : 0] in4;
  wire [w-1 : 0] in4;
  input [w-1 : 0] in5;
  wire [w-1 : 0] in5;
  input [2 : 0] sel;
  wire [2 : 0] sel;
  output [w-1 : 0] out;
  wire [w-1 : 0] out;
  
  assign out = (sel == 3'b000 ? in0 : {w{1'bz}});
  assign out = (sel == 3'b001 ? in1 : {w{1'bz}});
  assign out = (sel == 3'b010 ? in2 : {w{1'bz}});
  assign out = (sel == 3'b011 ? in3 : {w{1'bz}});
  assign out = (sel == 3'b100 ? in4 : {w{1'bz}});
  assign out = (sel == 3'b101 ? in5 : {w{1'bz}});
  
endmodule