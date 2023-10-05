module seg7(output reg [6:0] num, input [3:0] bcd);

always@(bcd) begin
    case(bcd)
  0 : num = 7'b1000000; // Digit 0
  1 : num = 7'b1111001; // Digit 1
  2:  num = 7'b0100100; // Digit 2
  3:  num = 7'b0110000; // Digit 3
  4:  num = 7'b0011001; // Digit 4
  5:  num = 7'b0010010; // Digit 5
  6:  num = 7'b0000010; // Digit 6
  7:  num = 7'b1111000; // Digit 7
  8:  num = 7'b0000000; // Digit 8
  9:  num = 7'b0000100; // Digit 9
  default: num = 7'b1111111;   
  endcase
end

endmodule