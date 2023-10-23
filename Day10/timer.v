// Timer Module
module timer(output reg done, input clk,rstn,start);
// 'done' is used to signal that the timer has counted for
// 'start' is used to enable the timer 
parameter TIMER_COUNT = 250000; // To hold a 5 ms of debounce time for signal at 50MHz freq
reg [17:0] counter;

always @(posedge clk or negedge rstn) begin
  if(!rstn)begin
    counter <= 1'b0;
    done <= 1'b0;
  end
 else if(start) begin
   if(counter < TIMER_COUNT) begin
     counter <= counter + 1;
   end
   else begin
     done <= 1'b1;
     counter <= 1'b0;
   end
 end
 else
    done <= 1'b0;
    counter <= 1'b0;
end
endmodule