module moore_o(output reg out,input clk,rst,in);

parameter S0 = 3'b000, // Idle state
          S1 = 3'b001, // Detected '1'
          S2 = 3'b010, // Detected '10'
          S3 = 3'b011, // Detected '101'
          S4 = 3'b100; // Detected '1011'

reg [2:0] current_state, next_state;

// State register logic
always @ (posedge clk or posedge rst) begin
  if(rst)
    current_state <= S0;
  else
    current_state <= next_state;
end

// State transition logic
always @ (current_state,in) begin
  case(current_state)
    S0: 
        if (in) 
            next_state = S1;
        else 
            next_state = S0;
    S1: 
        if (in) 
            next_state = S1;
        else 
            next_state = S2;
    S2: 
        if (in) 
            next_state = S3;
        else 
            next_state = S0;
    S3: 
        if (in) 
            next_state = S4;
        else 
            next_state = S2;
    S4: 
        if (in) 
            next_state = S1;
        else 
            next_state = S2;
    default: 
        next_state = S0;
  endcase
end

// Output logic
always @(current_state) begin
  if(current_state == S4)
    out <= 1'b1;
  else
    out <= 1'b0;
end


endmodule