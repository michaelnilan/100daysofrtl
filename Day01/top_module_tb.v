module top_module_tb;
reg A, B;
wire Y;
top_module Indtance0 (Y, A, B);
initial begin
    A = 0; B = 0;
 #1 A = 0; B = 1;
 #1 A = 1; B = 0;
 #1 A = 1; B = 1;
 #1 A = 0; B = 0;
end
initial begin
    $monitor ("%t | A = %d| B = %d| Y = %d", $time, A, B, Y);
    $dumpfile("sim_tb.vcd");
    $dumpvars(0,top_module_tb);
end
endmodule
