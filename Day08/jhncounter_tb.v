module jhncounter_tb;

reg clk,rst;
wire [3:0] q;

jhncounter INST0 (.clk(clk),.rst(rst),.q(q));

initial clk = 0;


always #1 clk = ~clk;

initial begin
  clk = 0;
  rst = 1;
  #10 rst = 0;
  #40
  $finish;
end

initial begin
  $dumpfile("jhncounter_sim.vcd");
  $dumpvars(0,jhncounter_tb);
end

endmodule