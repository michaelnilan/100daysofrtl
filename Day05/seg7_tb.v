module seg7_tb;

reg [3:0] bcd;
wire [6:0] num;
integer i;

seg7 INST0 (.bcd(bcd),.num(num));

//Apply inputs
initial begin
    for(i = 0;i < 10;i = i+1) 
    begin
        bcd = i; 
        #10; 
    end     
end

initial begin
  $dumpfile("seg7_sim.vcd");
  $dumpvars(0,seg7_tb);
end
      
endmodule