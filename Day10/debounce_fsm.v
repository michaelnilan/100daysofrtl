// FSM Module
module debounce_fsm(output out,timer_rst,input in, clk, rstn,timer_done);
reg[3:0] current_state,next_state;

parameter S0 = 3'b000,
          S1 = 3'b001,
          S2 = 3'b010,
          S3 = 3'b011;

// State register logic
always@(posedge clk or negedge rstn) begin
  if(!rstn)
   current_state <= S0;
 else
   current_state <= next_state;
end

// State transition logic
always@(*)begin
  case(current_state)
    S0: 
        if (in) 
            next_state = S1;
        else 
            next_state = S0;
    S1:
        if (~in) 
            next_state = S0;
        else if(in & ~timer_done)
            next_state = S1;
        else if(in & timer_done)
            next_state = S2;
    S2:
        if(in)
            next_state = S2;
        else if(~in)
            next_state = S3;
    S3:
        if(~in & ~timer_done)
            next_state = S3;
        else if(~in & timer_done)
            next_state = S0;
        else if(in)
            next_state = S2;
    endcase
end
// Assigning the outputs
assign timer_rst = (current_state == S0) | (current_state == S2);
assign out = (current_state == S2) | (current_state == S3);
endmodule