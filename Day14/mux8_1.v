module mux8_1(out,in1,in2,in3,in4,in5,in6,in7,in8,sel);
input [2:0] sel;
input [15:0] in1,in2,in3,in4,in5,in6,in7,in8;
output reg [15:0] out;


always@(*) begin
  case(sel)
    3'b000: out = in1;
    3'b001: out = in2;
    3'b010: out = in3;
    3'b011: out = in4;
    3'b100: out = in5;
    3'b101: out = in6;
    3'b110: out = in7;
    3'b111: out = in8;
    default: out = 16'bz;
end

endmodule