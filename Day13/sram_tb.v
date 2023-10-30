module sram_tb;

reg clk,rstn;
reg CS_b, WE_b, OE_b;
reg [10:0] addr;
wire [15:0] data_read;
reg [15:0] data_write;

wire [15:0] data;

assign data = ((CS_b == 0) && (WE_b == 0) && (OE_b == 1)) ? data_write : 'bz;
assign data_read = ((CS_b == 0) && (WE_b == 1) && (OE_b == 0)) ? data : 'bz;



sram INST0 (.clk(clk),.rstn(rstn),.CS_b(CS_b),.WE_b(WE_b),.OE_b(OE_b),
            .addr(addr),.data(data_read));

always begin
		#1 clk = ~clk;
	end
	
	initial begin
		$dumpfile("sram_sim.vcd");
		$dumpvars(0,sram_tb);
		CS_b = 1;
		WE_b = 0;
		data_write =0;
		OE_b =0;
		addr=0;
		
		clk = 0;
		rstn = 0;
		#1
		rstn = 1;
		
		// TestCase: Writing to SRAM. 
		#1
		OE_b = 1;
		CS_b = 0;
		WE_b = 0; 
		data_write = 24;
		addr = 28;

		// // TestCase: Reading the sram.
		#2 
		OE_b = 0;
		CS_b = 0;
		WE_b = 1; 
		data_write = 26; 
		addr = 28;

		// TestCase: Writing to memory location 28;
		#1
		OE_b = 1;
		CS_b = 0;
		WE_b = 0;
		data_write = 30;
		addr = 28;

		// TestCase: Memory location 28 should be the same as before.
		#1
		OE_b = 0;
		CS_b = 0;
		WE_b = 1;
		data_write = 40;
		addr = 28;

		// TestCase: Memory location 28 should be the same as before.
		#1
		OE_b = 0;
		CS_b = 0;
		WE_b = 1;
		data_write = 40;
		addr = 28;
		
		#5
		$finish;
	end
endmodule


