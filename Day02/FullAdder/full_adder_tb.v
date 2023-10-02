module full_adder_tb;
reg A,B,Cin;
wire Sum,Carry;

full_adder INST0 (.Sum(Sum),.Carry(Carry),.A(A),.B(B),.Cin(Cin));

initial begin
   A = 0; B = 0; Cin = 0;
#1 A = 0; B = 0; Cin = 1;
#1 A = 0; B = 1; Cin = 0;
#1 A = 0; B = 1; Cin = 1;
#1 A = 1; B = 0; Cin = 0;
#1 A = 1; B = 0; Cin = 1;
#1 A = 1; B = 1; Cin = 0;
#1 A = 1; B = 1; Cin = 1;
#1 A = 0; B = 0; Cin = 0;
end

initial begin
  $monitor("%t | A = %d| B = %d|Cin = %d| Sum = %d| Carry = %d", $time, A, B, Cin, Sum, Carry);
  $dumpfile("fa_sim_tb.vcd");
  $dumpvars(0,full_adder_tb);
end
endmodule