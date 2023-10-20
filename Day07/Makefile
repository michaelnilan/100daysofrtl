TOP_CMD = iverilog -o updownc.vvp -Wall -Winfloop -Wno-timescale

compile : clean
	$(TOP_CMD) -s updownc updownc.v
simulate : clean
	$(TOP_CMD) -s updownc_tb updownc.v updownc_tb.v
	vvp updownc.vvp -o updownc_sim.vcd
	gtkwave updownc_sim.vcd
build : clean
	touch updownc_synth.ys
	echo "read_verilog updownc.v" >> updownc_synth.ys
	echo "hierarchy  -check -top updownc" >> updownc_synth.ys
	echo "proc; opt; fsm; opt; memory; opt techmap; opt" >> updownc_synth.ys
	echo "write_verilog updownc_synth.v" >> updownc_synth.ys
synth : build
	yosys updownc_synth.ys
clean :
	rm -rf updownc.vvp updownc_sim.vcd updownc_synth.ys updownc_synth.v
