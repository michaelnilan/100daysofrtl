TOP_CMD = iverilog -o xor_m_sim.vvp -Wall -Winfloop -Wno-timescale

compile : clean
	$(TOP_CMD) -s xor_m xor_m.v
simulate : clean
	$(TOP_CMD) -s xor_m_tb xor_m.v xor_m_tb.v
	vvp xor_m_sim.vvp -o xor_m_sim.vcd
	gtkwave xor_m_sim.vcd
build : clean
	touch xor_m_synth.ys
	echo "read_verilog xor_m.v" >> xor_m_synth.ys
	echo "hierarchy  -check -top xor_m" >> xor_m_synth.ys
	echo "proc; opt; fsm; opt; memory; opt techmap; opt" >> xor_m_synth.ys
	echo "write_verilog xor_m_synth.v" >> xor_m_synth.ys
synth : build
	yosys xor_m_synth.ys
clean :
	rm -rf xor_m_sim.vvp xor_m_sim.vcd xor_m_synth.ys xor_m_synth.v