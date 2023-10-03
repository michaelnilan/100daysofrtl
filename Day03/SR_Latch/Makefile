TOP_CMD = iverilog -o sr_latch_sim.vvp -Wall -Winfloop -Wno-timescale

compile : clean
	$(TOP_CMD) -s sr_latch sr_latch.v
simulate : clean
	$(TOP_CMD) -s sr_latch_tb sr_latch.v sr_latch_tb.v
	vvp sr_latch_sim.vvp -o sr_latch_sim.vcd
	gtkwave sr_latch_sim.vcd
build : clean
	touch sr_latch_synth.ys
	echo "read_verilog sr_latch.v" >> sr_latch_synth.ys
	echo "hierarchy  -check -top sr_latch" >> sr_latch_synth.ys
	echo "proc; opt; fsm; opt; memory; opt techmap; opt" >> sr_latch_synth.ys
	echo "write_verilog sr_latch_synth.v" >> sr_latch_synth.ys
synth : build
	yosys sr_latch_synth.ys
clean :
	rm -rf rs_sim_tb.vvp rs_sim_tb.vcd sr_latch_synth.ys sr_latch_synth.v
