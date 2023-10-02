TOP_CMD = iverilog -o fa_sim_tb.vvp -Wall -Winfloop -Wno-timescale

compile : clean
	$(TOP_CMD) -s full_adder full_adder.v
simulate : clean
	$(TOP_CMD) -s full_adder_tb full_adder.v full_adder_tb.v
	vvp fa_sim_tb.vvp -o fa_sim_tb.vcd
	gtkwave fa_sim_tb.vcd
build : clean
	touch fa_synth.ys
	echo "read_verilog full_adder.v" >> fa_synth.ys
	echo "hierarchy  -check -top full_adder" >> fa_synth.ys
	echo "proc; opt; fsm; opt; memory; opt techmap; opt" >> fa_synth.ys
	echo "write_verilog fa_synth.v" >> fa_synth.ys
synth : build
	yosys fa_synth.ys
clean :
	rm -rf fa_sim_tb.vvp fa_sim_tb.vcd fa_synth.ys fa_synth.v