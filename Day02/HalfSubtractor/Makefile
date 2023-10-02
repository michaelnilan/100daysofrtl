TOP_CMD = iverilog -o hs_sim_tb.vvp -Wall -Winfloop -Wno-timescale

compile : clean
	$(TOP_CMD) -s sub sub.v
simulate : clean
	$(TOP_CMD) -s sub_tb sub.v sub_tb.v
	vvp hs_sim_tb.vvp -o hs_sim_tb.vcd
	gtkwave hs_sim_tb.vcd
build : clean
	touch hs_synth.ys
	echo "read_verilog sub.v" >> ha_synth.ys
	echo "hierarchy  -check -top sub" >> hs_synth.ys
	echo "proc; opt; fsm; opt; memory; opt techmap; opt" >> hs_synth.ys
	echo "write_verilog hs_synth.v" >> hs_synth.ys
synth : build
	yosys hs_synth.ys
clean :
	rm -rf hs_sim_tb.vvp hs_sim_tb.vcd hs_synth.ys hs_synth.v