TOP_CMD = iverilog -o sim_tb.vvp -Wall -Winfloop -Wno-timescale 

compile: clean
	$(TOP_CMD) -s top_module top_module.v 
simulate: clean
	$(TOP_CMD) -s top_module_tb top_module.v top_module_tb.v
	vvp sim_tb.vvp -o sim_tb.vcd
	gtkwave sim_tb.vcd

build: clean
	touch synth.ys
	echo "read_verilog top_module.v" >> synth.ys
	echo "hierarchy -check -top top_module" >> synth.ys
	echo "proc; opt; fsm; opt; memory; opt techmap; opt" >> synth.ys
	echo "write_verilog synth.v" >> synth.ys

synth: build
	yosys synth.ys

clean:
	rm -rf sim_tb.vvp sim_tb.vcd synth.ys synth.v
