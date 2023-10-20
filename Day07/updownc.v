`timescale 1 ms/1ns
module updownc(output [2:0] count,input clk,rst,up_down);
reg [2:0] acount;

always@(posedge(clk) or posedge(rst))
begin
  if(rst == 1'b1)
    acount <= 3'b000;
  else
    if(up_down == 1'b1) // Up count mode is selected
    begin
        if(acount == 3'b111)
            acount <= 3'b000;
        else    
            acount <= acount + 1;
    end
    else   // Down count mode is selected  
    begin
        if(acount == 3'b000)
            acount <= 3'b111;
        else
            acount <= acount - 1;
    end
end

assign count = acount;

endmodule