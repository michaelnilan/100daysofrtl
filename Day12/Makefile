TOP_CMD = iverilog -o sram.vvp -Wall -Winfloop -Wno-timescale

compile : clean
	$(TOP_CMD) -s sram  sram.v
simulate : clean
	$(TOP_CMD) -s sram_tb sram.v sram_tb.v
	vvp sram.vvp -o sram_sim.vcd
	gtkwave sram_sim.vcd
build : clean
	touch sram_synth.ys
	echo "read_verilog sram.v" >> sram_synth.ys
	echo "hierarchy  -check -top sram" >> sram_synth.ys
	echo "proc; opt; fsm; opt; memory; opt techmap; opt" >> sram_synth.ys
	echo "write_verilog sram_synth.v" >> sram_synth.ys
synth : build
	yosys sram_synth.ys
clean :
	rm -rf *.vvp *_sim.vcd *_synth.ys *_synth.v


