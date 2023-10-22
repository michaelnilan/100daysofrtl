TOP_MODULE ?= mealey_o 
TOP_CMD = iverilog -o $(TOP_MODULE).vvp -Wall -Winfloop -Wno-timescale

compile : clean
	$(TOP_CMD) -s $(TOP_MODULE)  $(TOP_MODULE).v
simulate : clean
	$(TOP_CMD) -s $(TOP_MODULE)_tb $(TOP_MODULE).v $(TOP_MODULE)_tb.v
	vvp $(TOP_MODULE).vvp -o $(TOP_MODULE)_sim.vcd
	gtkwave $(TOP_MODULE)_sim.vcd
build : clean
	touch $(TOP_MODULE)_synth.ys
	echo "read_verilog $(TOP_MODULE).v" >> $(TOP_MODULE)_synth.ys
	echo "hierarchy  -check -top $(TOP_MODULE)" >> $(TOP_MODULE)_synth.ys
	echo "proc; opt; fsm; opt; memory; opt techmap; opt" >> $(TOP_MODULE)_synth.ys
	echo "write_verilog $(TOP_MODULE)_synth.v" >> $(TOP_MODULE)_synth.ys
synth : build
	yosys $(TOP_MODULE)_synth.ys
clean :
	rm -rf *.vvp *_sim.vcd *_synth.ys *_synth.v


