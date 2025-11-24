module arithmetic_unit_tb;
  reg [31 : 0] arith_in;
  reg [2 : 0] arith_lines;
  wire [31 : 0] arith_out;
  
  arithmetic_unit uut (
    .arith_in(arith_in),
    .arith_lines(arith_lines),
    .arith_out(arith_out)
  );
    
  /*initial begin
    arith_in = {16'sd50, -16'sd100};
    arith_lines = 3'b000;
    $display("Time\tpacked_in\top1\top2\tsel\tresult");
    $monitor("%0t\t%h\t%d\t%d\t%b\t%d", $time, arith_in, $signed(arith_in[31 : 16]), $signed(arith_in[15 : 0]), arith_lines, $signed(arith_out));
    #10 arith_in = {-16'sd13, 16'sd14};
    #10 arith_in = {16'sd20, 16'sd40};
    #10 arith_in = {-16'sd30, -16'sd0};
    
    #10
    arith_in = {16'sd50, -16'sd100};
    arith_lines = 3'b100;
    #10 arith_in = {-16'sd13, 16'sd14};
    #10 arith_in = {16'sd20, 16'sd40};
    #10 arith_in = {-16'sd30, -16'sd0};
    
    #10
    arith_in = {16'sd50, -16'sd100};
    arith_lines = 3'b101;
    #10 arith_in = {-16'sd13, 16'sd14};
    #10 arith_in = {16'sd20, 16'sd40};
    #10 arith_in = {-16'sd30, -16'sd0};
    
    #10
    arith_in = {16'sd50, -16'sd100};
    arith_lines = 3'b001;
    #10 arith_in = {-16'sd13, 16'sd14};
    #10 arith_in = {16'sd20, 16'sd40};
    #10 arith_in = {-16'sd30, -16'sd0};
  end*/
  
  initial begin
    arith_in = {16'sd44, -16'sd12};
    arith_lines = 3'b010;
    $display("Time\tpacked_in\top1\top2\tsel\tresults");
    $monitor("%0t\t%h\t%d\t%d\t%b\t%d\t%d", $time, arith_in, $signed(arith_in[31 : 16]), $signed(arith_in[15 : 0]), arith_lines, $signed(arith_out[31 : 16]), $signed(arith_out[15 : 0]));
    #10 arith_in = {-16'sd25, 16'sd8};
    #10 arith_in = {16'sd20, 16'sd2};
    #10 arith_in = {-16'sd30, -16'sd9};
    
    #10
    arith_in = {16'sd44, -16'sd12};
    arith_lines = 3'b110;
    #10 arith_in = {-16'sd25, 16'sd8};
    #10 arith_in = {16'sd20, 16'sd2};
    #10 arith_in = {-16'sd30, -16'sd9};
    
    #10
    arith_in = {16'sd44, -16'sd12};
    arith_lines = 3'b111;
    #10 arith_in = {-16'sd25, 16'sd8};
    #10 arith_in = {16'sd20, 16'sd2};
    #10 arith_in = {-16'sd30, -16'sd9};
    
    #10
    arith_in = {16'sd44, -16'sd12};
    arith_lines = 3'b011;
    #10 arith_in = {-16'sd25, 16'sd8};
    #10 arith_in = {16'sd20, 16'sd2};
    #10 arith_in = {-16'sd30, -16'sd9};
  end
  
endmodule