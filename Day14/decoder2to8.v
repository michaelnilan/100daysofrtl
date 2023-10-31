module decoder2to8(out,in,en);
input en;
input [2:0] in;
output reg [7:0] out;

always@(*) begin
  if(en) begin
    case(in)
        2'b000: out[0] = 1'b1;
        2'b001: out[1] = 1'b1;
        2'b010: out[2] = 1'b1;
        2'b011: out[3] = 1'b1;
        2'b100: out[4] = 1'b1;
        2'b101: out[5] = 1'b1;
        2'b110: out[6] = 1'b1;
        2'b111: out[7] = 1'b1;
        default: out = 8'bz;
  end
  else
    out = 8'bz;
end
endmodule