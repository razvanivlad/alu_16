module xor_wordgate_tb;
  reg [16 : 0] in;
  reg bit;
  wire [16 : 0] out;
  
  xor_wordgate uut (
    .in(in),
    .bit(bit),
    .out(out)
  );
  
  integer i;
  initial begin
    in = $random;
    bit = $urandom_range(0, 1);
    $display("Time\tin\tbit\tout");
    $monitor("%0t\t%b\t%b\t%b", $time, in, bit, out);
    for(i = 1 ; i < 10 ; i = i + 1) begin
      #10
      in = $random;
      bit = $urandom_range(0, 1);
    end
  end
  
endmodule