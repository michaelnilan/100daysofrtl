module sub(output Diff,Borr,input A,B);
assign Diff = A ^ B;
assign Borr = B & ~A;

endmodule