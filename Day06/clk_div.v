module clkdivclk_div(output reg out_clk,input clk,reset,[2:0] N);
reg next_out_clk;
reg [2:0] count;
reg [2:0] next_count;

always @ (posedge clk or negedge reset)
begin
  if(!reset)
  begin
    out_clk <= 1'b0;
count     <= 1'b0;
  end
  else
  begin
    out_clk <= next_out_clk;
count     <= next_count;
  end
end

always @ (*)
begin
  ifcount==(N>>1))
  begin
    next_out_clk = ~out_clk;
    next_count     = 1'b1;
  end
  else
  begin
    next_out_clk = out_clk;
    next_count     =count+1;
  end
end

endmodule