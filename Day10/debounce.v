// Top Module
`include "timer.v"
`include "debounce_fsm.v"
module debounce(output out, input in, clk, rstn);

wire timer_done_w, timer_rst_w;

// Instantiate the timer
timer TIMER(.clk(clk),.rstn(rstn),.done(timer_done_w),.start(timer_rst_w));

// Instantiate the FSM
debounce_fsm DEBOUNCE(.clk(clk),.rstn(rstn),.out(out),.in(in),.timer_done(timer_done_w),.timer_rst(timer_rst_w));

endmodule



