module mealey_n(output reg out,input clk,rst,in);

parameter S0 = 2'b00, // Idle state
          S1 = 2'b01, // Detected '1'
          S2 = 2'b10, // Detected '10'
          S3 = 2'b11; // Detected '101'

reg [1:0] current_state, next_state;

// State register logic
always @ (posedge clk or posedge rst) begin
  if(rst)
    current_state <= S0;
  else
    current_state <= next_state;
end

// State transition logic
always @ (*) begin
  case(current_state)
    S0: 
        if (in) 
            next_state = S1;
        else 
            next_state = S0;
    S1: 
        if (in) 
            next_state = S0;
        else 
            next_state = S2;
    S2: 
        if (in) 
            next_state = S3;
        else 
            next_state = S0;
    S3: 
        if (in) 
            next_state = S0;
        else 
            next_state = S2;
    default: 
        next_state = S0;
  endcase
end

// Output logic
always @(*) begin
  if(current_state == S3 && in)
    out <= 1'b1;
  else
    out <= 1'b0;
end


endmodule