module fs_sub_tb;
reg A,B,Bin;
wire Diff,Borr;

fs_sub INST0 (.Diff(Diff),.Borr(Borr),.A(A),.B(B),.Bin(Bin));

initial begin
   A = 0; B = 0; Bin = 0;
#1 A = 0; B = 0; Bin = 1;
#1 A = 0; B = 1; Bin = 0;
#1 A = 0; B = 1; Bin = 1;
#1 A = 1; B = 0; Bin = 0;
#1 A = 1; B = 0; Bin = 1;
#1 A = 1; B = 1; Bin = 0;
#1 A = 1; B = 1; Bin = 1;
#1 A = 0; B = 0; Bin = 0;
end

initial begin
  $monitor("%t | A = %d| B = %d|Bin = %d| Diff = %d| Borr = %d", $time, A, B, Bin, Diff, Borr);
  $dumpfile("fs_sim_tb.vcd");
  $dumpvars(0,fs_sub_tb);
end
endmodule