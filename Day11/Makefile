TOP_CMD = iverilog -o comp.vvp -Wall -Winfloop -Wno-timescale

compile : clean
	$(TOP_CMD) -s comp  comp.v
simulate : clean
	$(TOP_CMD) -s comp_tb comp.v comp_tb.v
	vvp comp.vvp -o comp_sim.vcd
	gtkwave comp_sim.vcd
build : clean
	touch comp_synth.ys
	echo "read_verilog comp.v" >> comp_synth.ys
	echo "hierarchy  -check -top comp" >> comp_synth.ys
	echo "proc; opt; fsm; opt; memory; opt techmap; opt" >> comp_synth.ys
	echo "write_verilog comp_synth.v" >> comp_synth.ys
synth : build
	yosys comp_synth.ys
clean :
	rm -rf *.vvp *_sim.vcd *_synth.ys *_synth.v


