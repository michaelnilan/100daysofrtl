`include "half_adder.v"
module full_adder (output Sum,Carry,input A,B,Cin);
// Data flow modeling of Full Adder
// assign Sum = Cin ^ (A ^ B);
// assign Carry = A & Cin | B & Cin | A & B;

// Structural modeling of Full Adder using Half-adders and an OR gate
wire X1,X2,X3;
half_adder HA1(.Sum(X1),.Carry(X2),.A(A),.B(B));
half_adder HA2(.Sum(Sum),.Carry(X3),.A(X1),.B(Cin));
or OR1(Carry,X3,X2);

endmodule