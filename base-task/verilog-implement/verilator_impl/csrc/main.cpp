#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vstate_convert.h"

VerilatedContext* contextp = NULL;
VerilatedVcdC* tfp = NULL;

static Vstate_convert* top;

void step_and_dump_wave(){
  top->eval();
  contextp->timeInc(1); 
  tfp->dump(contextp->time());
}
void sim_init(){
  contextp = new VerilatedContext;
  tfp = new VerilatedVcdC;
  top = new Vstate_convert;
  contextp->traceEverOn(true);
  top->trace(tfp, 0);
  tfp->open("state_convert.vcd");
}

void sim_exit(){
  step_and_dump_wave();
  tfp->close();
}

int main() {
  sim_init();

// module state_convert (
//   input clk,
//   input CR,
//   input M,
//   output reg[2:0] data 
// );

  top -> data = 0b111;
  top -> clk = 1; top -> CR = 0; top -> M = 0; step_and_dump_wave();
  top -> clk = 0; top -> CR = 0; top -> M = 0; step_and_dump_wave();
  top -> clk = 1; top -> CR = 0; top -> M = 0; step_and_dump_wave();
  top -> clk = 0; top -> CR = 0; top -> M = 0; step_and_dump_wave();
  top -> clk = 1; top -> CR = 0; top -> M = 0; step_and_dump_wave();
  top -> clk = 0; top -> CR = 0; top -> M = 0; step_and_dump_wave();
  top -> clk = 1; top -> CR = 0; top -> M = 0; step_and_dump_wave();
  top -> clk = 0; top -> CR = 0; top -> M = 0; step_and_dump_wave();
  top -> clk = 1; top -> CR = 0; top -> M = 0; step_and_dump_wave();
  top -> clk = 0; top -> CR = 0; top -> M = 0; step_and_dump_wave();
  top -> clk = 1; top -> CR = 0; top -> M = 0; step_and_dump_wave();
  top -> clk = 0; top -> CR = 0; top -> M = 0; step_and_dump_wave();
  top -> clk = 1; top -> CR = 0; top -> M = 0; step_and_dump_wave();
  top -> clk = 0; top -> CR = 0; top -> M = 0; step_and_dump_wave();
  top -> clk = 1; top -> CR = 0; top -> M = 0; step_and_dump_wave();
  top -> clk = 0; top -> CR = 0; top -> M = 0; step_and_dump_wave();
  top -> clk = 1; top -> CR = 0; top -> M = 0; step_and_dump_wave();
  top -> clk = 0; top -> CR = 0; top -> M = 0; step_and_dump_wave();
  top -> clk = 1; top -> CR = 0; top -> M = 0; step_and_dump_wave();
  top -> clk = 0; top -> CR = 0; top -> M = 0; step_and_dump_wave();
  top -> clk = 1; top -> CR = 1; top -> M = 0; step_and_dump_wave();
  top -> clk = 0; top -> CR = 0; top -> M = 1; step_and_dump_wave();
  top -> clk = 1; top -> CR = 0; top -> M = 1; step_and_dump_wave();
  top -> clk = 0; top -> CR = 0; top -> M = 1; step_and_dump_wave();
  top -> clk = 1; top -> CR = 0; top -> M = 1; step_and_dump_wave();
  top -> clk = 0; top -> CR = 0; top -> M = 1; step_and_dump_wave();
  top -> clk = 1; top -> CR = 0; top -> M = 1; step_and_dump_wave();
  top -> clk = 0; top -> CR = 0; top -> M = 1; step_and_dump_wave();
  top -> clk = 1; top -> CR = 0; top -> M = 1; step_and_dump_wave();
  top -> clk = 0; top -> CR = 0; top -> M = 1; step_and_dump_wave();
  top -> clk = 1; top -> CR = 0; top -> M = 1; step_and_dump_wave();
  top -> clk = 0; top -> CR = 0; top -> M = 1; step_and_dump_wave();
  top -> clk = 1; top -> CR = 0; top -> M = 1; step_and_dump_wave();
  top -> clk = 0; top -> CR = 0; top -> M = 1; step_and_dump_wave();
  top -> clk = 1; top -> CR = 0; top -> M = 1; step_and_dump_wave();
  top -> clk = 0; top -> CR = 0; top -> M = 1; step_and_dump_wave();
  top -> clk = 1; top -> CR = 0; top -> M = 1; step_and_dump_wave();
  top -> clk = 0; top -> CR = 0; top -> M = 1; step_and_dump_wave();
  top -> clk = 1; top -> CR = 0; top -> M = 1; step_and_dump_wave();
  top -> clk = 0; top -> CR = 0; top -> M = 1; step_and_dump_wave();



  sim_exit();
}