module mux2_1_tb;
reg A,B,sel;
wire out;

mux2_1 INST0 (.A(A),.B(B),.sel(sel),.out(out));

initial begin
    A = 0; B = 0; sel = 0; // Initialize the values
#100 $finish; 
end

always #10 sel = ~sel; // Toggle the select pin every 10 sec
always #40 A = ~A;
always #20 B = ~B;


initial begin
  $dumpfile("mux2_1_sim.vcd");
  $dumpvars(0,mux2_1_tb);
end
endmodule