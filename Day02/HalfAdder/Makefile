TOP_CMD = iverilog -o ha_sim_tb.vvp -Wall -Winfloop -Wno-timescale

compile : clean
	$(TOP_CMD) -s half_adder half_adder.v
simulate : clean
	$(TOP_CMD) -s half_adder_tb half_adder.v half_adder_tb.v
	vvp ha_sim_tb.vvp -o ha_sim_tb.vcd
	gtkwave ha_sim_tb.vcd
build : clean
	touch ha_synth.ys
	echo "read_verilog half_adder.v" >> ha_synth.ys
	echo "hierarchy  -check -top half_adder" >> ha_synth.ys
	echo "proc; opt; fsm; opt; memory; opt techmap; opt" >> ha_synth.ys
	echo "write_verilog ha_synth.v" >> ha_synth.ys
synth : build
	yosys ha_synth.ys
clean :
	rm -rf ha_sim_tb.vvp ha_sim_tb.vcd ha_synth.ys ha_synth.v