module regfile(Din,A_out,A_addr,B_out,B_addr,W_addr,Wen,clk);
input Wen,clk;
input [2:0] A_addr,B_addr,W_addr;
input [15:0] Din;
output reg [15:0] A_out,B_out;

reg [15:0] r1,r2,r3,r4,r5,r6,r7,r8;
reg [7:0] d_addr;

decoder2to8 DECO(.en(Wen),.in(W_addr),.out(d_addr));

regg R0(.clk(clk),.load(d_addr[0]),.in(Din),.out(r1));
regg R1(.clk(clk),.load(d_addr[1]),.in(Din),.out(r2));
regg R2(.clk(clk),.load(d_addr[2]),.in(Din),.out(r3));
regg R3(.clk(clk),.load(d_addr[3]),.in(Din),.out(r4));
regg R4(.clk(clk),.load(d_addr[4]),.in(Din),.out(r5));
regg R5(.clk(clk),.load(d_addr[5]),.in(Din),.out(r6));
regg R6(.clk(clk),.load(d_addr[6]),.in(Din),.out(r7));
regg R7(.clk(clk),.load(d_addr[7]),.in(Din),.out(r8));

mux8_1 MUX_A(.in1(r1),.in2(r2),.in3(r3),.in4(r4)
            ,.in5(r5),.in6(r6),.in7(r7),.in8(r8)
            ,.sel(A_addr)
            ,.out(A_out));
mux8_1 MUX_B(.in1(r1),.in2(r2),.in3(r3),.in4(r4)
            ,.in5(r5),.in6(r6),.in7(r7),.in8(r8)
            ,.sel(B_addr)
            ,.out(B_out));

endmodule