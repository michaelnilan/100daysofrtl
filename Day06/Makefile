TOP_CMD = iverilog -o clk_div.vvp -Wall -Winfloop -Wno-timescale

compile : clean
	$(TOP_CMD) -s clk_div clk_div.v
simulate : clean
	$(TOP_CMD) -s clk_div_tb seg7.v clk_div_tb.v
	vvp seg7_sim.vvp -o clk_div.vcd
	gtkwave clk_div.vcd
build : clean
	touch clk_div_synth.ys
	echo "read_verilog clk_div.v" >> clk_div_synth.ys
	echo "hierarchy  -check -top clk_div" >> clk_div_synth.ys
	echo "proc; opt; fsm; opt; memory; opt techmap; opt" >> clk_div_synth.ys
	echo "write_verilog clk_div_synth.v" >> seg7_synth.ys
synth : build
	yosys clk_div_synth.ys
clean :
	rm -rf clk_div.vvp clk_div.vcd clk_div_synth.ys clk_div_synth.v
