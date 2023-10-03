module sr_latch(output Q,Qbar, input S,R);
wire Q1,Q1bar;

assign #1 Q1bar = ~(R & Q1);
assign #1 Q1 = ~(S & Q1bar);
assign Q = Q1;
assign Qbar = Q1bar;

endmodule