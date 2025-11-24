module alu_16_tb;
  reg clk;
  reg rst_n;
  reg [31 : 0] packed_in;
  reg [4 : 0] selection_lines;
  wire [31 : 0] packed_out;
  
  alu_16 uut (
    .clk(clk),
    .rst_n(rst_n),
    .packed_in(packed_in),
    .selection_lines(selection_lines),
    .packed_out(packed_out)
  );
  
  localparam CLOCK_CYCLES = 100;
  localparam CLOCK_PERIOD = 100;
  localparam RESET_PULSE = 20;
  
  initial begin
    clk = 1'b0;
    repeat (2 * CLOCK_CYCLES) begin
      #(CLOCK_PERIOD / 2) 
      clk = ~clk;
    end
  end
  
  initial begin
    rst_n = 1'b0;
    #(RESET_PULSE) 
    rst_n = 1'b1;
  end
  
  initial begin
    packed_in = $random;
    #(CLOCK_PERIOD / 2)
    repeat (CLOCK_CYCLES - 1) begin
      #(CLOCK_PERIOD)
      packed_in = $random;
    end
  end
  
  initial begin
    selection_lines = $urandom_range(0, 31);
    #(CLOCK_PERIOD / 2)
    repeat (CLOCK_CYCLES - 1) begin
      #(CLOCK_PERIOD) 
      selection_lines = $urandom_range(0, 31);
    end
  end
  
endmodule
