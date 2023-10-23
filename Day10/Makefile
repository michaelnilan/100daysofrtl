TOP_CMD = iverilog -o debounce.vvp -Wall -Winfloop -Wno-timescale

compile : clean
	$(TOP_CMD) -s debounce  debounce.v
simulate : clean
	$(TOP_CMD) -s debounce_tb debounce.v debounce_tb.v
	vvp debounce.vvp -o debounce_sim.vcd
	gtkwave debounce_sim.vcd
build : clean
	touch debounce_synth.ys
	echo "read_verilog debounce.v" >> debounce_synth.ys
	echo "hierarchy  -check -top debounce" >> debounce_synth.ys
	echo "proc; opt; fsm; opt; memory; opt techmap; opt" >> debounce_synth.ys
	echo "write_verilog debounce_synth.v" >> debounce_synth.ys
synth : build
	yosys debounce_synth.ys
clean :
	rm -rf *.vvp *_sim.vcd *_synth.ys *_synth.v


