TOPNAME = state_convert

V_SRC = $(shell find $(./vsrc) -name "*.v")
C_SRC = $(shell find $(./csrc) -name "*.cpp")

all:
	@echo "Compile the design."
	
	verilator --top-module $(TOPNAME) --trace --cc --exe --build -j 0 -Wall $(C_SRC) $(V_SRC)

sim:
	@echo "Simulation the design."
	make all
	./obj_dir/V$(TOPNAME)
	gtkwave $(TOPNAME).vcd

visual:
	@echo "Visualization the .vcd file."
	gtkwave $(TOPNAME).vcd

clean:
	@echo "Clean the project."
	rm -rf obj_dir

# include ../Makefile
