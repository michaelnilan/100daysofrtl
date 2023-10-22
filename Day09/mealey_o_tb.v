module mealey_o_tb;

reg in,clk,rst;

wire out;

mealey_o INST0 (.clk(clk),.rst(rst),.in(in),.out(out));

always #4 clk = ~clk;

initial begin
  clk = 0;
  rst = 1;
  in = 0;

  #4 rst = 0;

  @(posedge clk) in = 1;
  @(posedge clk) in = 0;
  @(posedge clk) in = 1;
  @(posedge clk) in = 1; // Pattern is detected
  @(posedge clk) in = 0;
  @(posedge clk) in = 1;
  @(posedge clk) in = 1; // Pattern is detected
  @(posedge clk) in = 0;
  @(posedge clk) in = 1;
  @(posedge clk) in = 0;
  @(posedge clk) in = 1;
  @(posedge clk) in = 1; // Pattern is detected
  @(posedge clk) in = 1; 

  #20 $finish;
end

initial begin
  $dumpfile("mealey_o_sim.vcd");
  $dumpvars(0,mealey_o_tb);
end


endmodule