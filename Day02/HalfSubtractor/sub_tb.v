module sub_tb;
reg A,B;
wire Diff,Borr;

sub INST0 (.Diff(Diff),.Borr(Borr),.A(A),.B(B));

initial begin
    A = 0; B = 0;
 #1 A = 0; B = 1;
 #1 A = 1; B = 0;
 #1 A = 1; B = 1;
 #1 A = 0; B = 0;
end

initial begin
  $monitor ("%t | A = %d| B = %d| Diff = %d| Borr = %d", $time, A, B, Diff, Borr);
  $dumpfile("hs_sim_tb.vcd");
  $dumpvars(0,sub_tb);
end
endmodule