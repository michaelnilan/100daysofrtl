module half_adder_tb;

reg A,B;
wire Sum,Carry;

half_adder INST0 (.A(A),.B(B),.Sum(Sum),.Carry(Carry));

initial begin
    A = 0; B = 0;
 #1 A = 0; B = 1;
 #1 A = 1; B = 0;
 #1 A = 1; B = 1;
 #1 A = 0; B = 0;
end

initial begin
  $monitor ("%t | A = %d| B = %d| Sum = %d| Carry = %d", $time, A, B, Sum, Carry);
  $dumpfile("ha_sim_tb.vcd");
  $dumpvars(0,half_adder_tb);
end
endmodule