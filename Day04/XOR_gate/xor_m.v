`include "../MUX2_1/mux2_1.v"

module xor_m(output out,input A,B);

mux2_1 MUX1 (.out(out),.A(A),.B(~A),.sel(B));


endmodule