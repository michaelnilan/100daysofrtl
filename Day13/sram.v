module sram#(parameter DATA_WIDTH=16,ADDR_WIDTH=11,MEM_DEPTH=2048)
// ADDR_WIDTH = 11 = log2(2^(1))
(inout [DATA_WIDTH-1:0] data,input WE_b,OE_b,CS_b,clk,rstn, input [ADDR_WIDTH-1:0] addr);

// Define the memory register
reg [DATA_WIDTH-1] ram [0:MEM_DEPTH-1];
reg [DATA_WIDTH-1:0] temp; // Temporary internal register


always@(posedge clk or negedge rstn) begin
  if(!rstn) begin
    temp <= 16'b0;
  end
  else if((CS_b == 0) && (WE_b == 0) && (OE_b == 1)) // Write operation
      ram[addr] <= data; 
  else if((CS_b == 0) && (WE_b == 1) && (OE_b == 0)) // Read operation
      temp <= ram[addr];
end

assign data = ((CS_b == 0) && (WE_b == 1) && (OE_b == 0)) ? temp : 16'bz;

endmodule
