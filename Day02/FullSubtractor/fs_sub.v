`include "sub.v"
module fs_sub(output Diff,Borr,input A,B,Bin);
wire W1,W2,W3;
sub SUB1(.Diff(W1),.Borr(W2),.A(A),.B(B));
sub SUB2(.Diff(Diff),.Borr(W3),.A(W1),.B(Bin));
or OR1(Borr,W2,W3);

endmodule