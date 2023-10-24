`include "rom16_4.v"
module comp(output A_eq_B,A_ls_B,A_gr_B,input [1:0] A,B);

// Define the address
wire [3:0] addr;
// Define the data_out
wire [3:0] out;

assign addr = {A,B};

// Instantiate the ROM
rom16_4 ROM(.data_addr(addr),.data_out(out));

// Assign the outputs
assign A_eq_B = out[2];
assign A_ls_B = out[1];
assign A_gr_B = out[3];

endmodule