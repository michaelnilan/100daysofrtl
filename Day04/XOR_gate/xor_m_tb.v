module xor_m_tb;
reg A,B;
wire out;

xor_m INST0 (.A(A),.B(B),.out(out));

initial begin
   A = 0; B = 0;
#1 A = 0; B = 1;
#1 A = 1; B = 0;
#1 A = 1; B = 1;
#1 A = 0; B = 0;
end

initial begin
$monitor("Input: A =%d | B = %d,Output: out=%d",A,B,out);
$dumpfile("xor_m_sim.vcd");
$dumpvars(0,xor_m_tb);
end

endmodule