module rom16_4(output reg [3:0] data_out,input [3:0] data_addr);

reg [3:0] mem [15:0]; // Memory to hold 4 bit wide 16 memory addresses

initial begin
  $readmemb("mem.txt",mem);
end

always@(*) begin
  data_out = mem[data_addr];
end


endmodule