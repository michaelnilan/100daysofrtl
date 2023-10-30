TOP_CMD = iverilog -o sram.vvp -Wall -Winfloop -Wno-timescale

compile : clean
	$(TOP_CMD) -s sram  sram.v
simulate : clean
	$(TOP_CMD) -s sram_tb sram.v sram_tb.v
	vvp sram.vvp -o sram_sim.vcd
	gtkwave sram_sim.vcd
clean :
	rm -rf *.vvp *_sim.vcd 


