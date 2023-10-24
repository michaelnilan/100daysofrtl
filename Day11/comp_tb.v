module comp_tb;
reg [1:0] A,B;
wire A_eq_B,A_ls_B,A_gr_B;

comp INST (.A(A),.B(B),.A_eq_B(A_eq_B),.A_ls_B(A_ls_B),.A_gr_B(A_gr_B));

initial begin
  A = 2'b00;
  B = 2'b00;
    
  #10 A = 2'b00; B = 2'b01;  
  #10 A = 2'b01; B = 2'b01;  
  #10 A = 2'b10; B = 2'b01;  
  #10 A = 2'b11; B = 2'b10;  
  #10 A = 2'b10; B = 2'b11;  
  #10 A = 2'b11; B = 2'b11;  
  #10 $finish;
end

initial begin
  $dumpfile("comp_sim.vcd");
  $dumpvars(0,comp_tb);
end

endmodule