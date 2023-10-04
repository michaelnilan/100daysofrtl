module mux2_1(output out,input A,B,sel);
assign out = (sel) ? A : B;

endmodule