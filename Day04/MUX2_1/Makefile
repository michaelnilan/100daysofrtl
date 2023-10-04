TOP_CMD = iverilog -o mux2_1_sim.vvp -Wall -Winfloop -Wno-timescale

compile : clean
	$(TOP_CMD) -s mux2_1 mux2_1.v
simulate : clean
	$(TOP_CMD) -s mux2_1_tb mux2_1.v mux2_1_tb.v
	vvp mux2_1_sim.vvp -o mux2_1_sim.vcd
	gtkwave mux2_1_sim.vcd
build : clean
	touch mux2_1_synth.ys
	echo "read_verilog mux2_1.v" >> mux2_1_synth.ys
	echo "hierarchy  -check -top mux2_1" >> mux2_1_synth.ys
	echo "proc; opt; fsm; opt; memory; opt techmap; opt" >> mux2_1_synth.ys
	echo "write_verilog mux2_1_synth.v" >> mux2_1_synth.ys
synth : build
	yosys mux2_1_synth.ys
clean :
	rm -rf mux2_1_sim.vvp mux2_1_sim.vcd mux2_1_synth.ys mux2_1_synth.v