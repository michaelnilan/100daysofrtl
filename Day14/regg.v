module regg(in,out,clk,load);
input load;
input clk;
input [15:0] in;
output reg [15:0] out;

always@(posedge clk) begin
  if(load) begin
    out <= in;
  end
end

endmodule