module jhncounter(output [3:0] q,input clk,rst);
reg [3:0] count;

always @(posedge clk or posedge rst) begin
  if(rst == 1'b1)
    count <= 1;
  else
  begin
    count <= {~count[0],count[2:1]};
  end
end

assign q = count;
endmodule