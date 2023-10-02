TOP_CMD = iverilog -o fs_sim_tb.vvp -Wall -Winfloop -Wno-timescale

compile : clean
	$(TOP_CMD) -s fs-sub fs_sub.v
simulate : clean
	$(TOP_CMD) -s fs_sub_tb fs_sub.v fs_sub_tb.v
	vvp fs_sim_tb.vvp -o fs_sim_tb.vcd
	gtkwave fs_sim_tb.vcd
build : clean
	touch fs_synth.ys
	echo "read_verilog fs_sub.v" >> fs_synth.ys
	echo "hierarchy  -check -top fs_sub" >> fs_synth.ys
	echo "proc; opt; fsm; opt; memory; opt techmap; opt" >> fs_synth.ys
	echo "write_verilog fs_synth.v" >> fs_synth.ys
synth : build
	yosys fs_synth.ys
clean :
	rm -rf fs_sim_tb.vvp fs_sim_tb.vcd fs_synth.ys fs_synth.v