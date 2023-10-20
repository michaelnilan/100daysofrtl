`timescale 1 ms/1ns
module updownc_tb;

reg clk,rst,up_down;

wire [2:0] count;

updownc INST0 (.clk(clk),.rst(rst),.up_down(up_down),.count(count));

// Define the clock
initial clk = 1'b0;
always #5 clk = ~clk;

initial begin
  rst = 0;
  up_down = 0;
  #100;
  up_down = 1;
  #100;
end

initial begin
$dumpfile("updownc_sim.vcd");
$dumpvars(0,updownc_tb);
end

endmodule