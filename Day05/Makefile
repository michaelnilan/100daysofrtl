TOP_CMD = iverilog -o seg7_sim.vvp -Wall -Winfloop -Wno-timescale

compile : clean
	$(TOP_CMD) -s seg7 seg7.v
simulate : clean
	$(TOP_CMD) -s seg7_tb seg7.v seg7_tb.v
	vvp seg7_sim.vvp -o seg7_sim.vcd
	gtkwave seg7_sim.vcd
build : clean
	touch seg7_synth.ys
	echo "read_verilog seg7.v" >> seg7_synth.ys
	echo "hierarchy  -check -top seg7" >> seg7_synth.ys
	echo "proc; opt; fsm; opt; memory; opt techmap; opt" >> seg7_synth.ys
	echo "write_verilog seg7_synth.v" >> seg7_synth.ys
synth : build
	yosys seg7_synth.ys
clean :
	rm -rf seg7_sim.vvp seg7_sim.vcd seg7_synth.ys seg7_synth.v
