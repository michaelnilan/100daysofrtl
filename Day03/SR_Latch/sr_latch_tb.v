module sr_latch_tb;
reg S,R;
wire Q,Qbar;

sr_latch INST0 (.S(S),.R(R),.Q(Q),.Qbar(Qbar));

initial begin
    S = 1; R = 1; // Initial stage
#10 S = 0;
#10 S = 1;
#10 R = 0;
#10 R = 1;
#10 S = 0; R = 0; // Hold state
#10 S = 1; R = 1;
#10 S = 0; R = 0;
end

initial begin
  $dumpfile("sr_latch_sim.vcd");
  $dumpvars(0,sr_latch_tb);
end

endmodule