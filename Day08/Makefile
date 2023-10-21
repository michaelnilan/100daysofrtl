TOP_CMD = iverilog -o jhncounter.vvp -Wall -Winfloop -Wno-timescale

compile : clean
	$(TOP_CMD) -s jhncounter.v
simulate : clean
	$(TOP_CMD) -s jhncounter_tb jhncounter.v jhncounter_tb.v
	vvp jhncounter.vvp -o jhncounter_sim.vcd
	gtkwave jhncounter_sim.vcd
build : clean
	touch jhncounter_synth.ys
	echo "read_verilog jhncounter.v" >> jhncounter_synth.ys
	echo "hierarchy  -check -top jhncounter" >> jhncounter_synth.ys
	echo "proc; opt; fsm; opt; memory; opt techmap; opt" >> jhncounter_synth.ys
	echo "write_verilog jhncounter_synth.v" >> jhncounter_synth.ys
synth : build
	yosys jhncounter_synth.ys
clean :
	rm -rf jhncounter.vvp jhncounter_sim.vcd jhncounter_synth.ys jhncounter_synth.v
