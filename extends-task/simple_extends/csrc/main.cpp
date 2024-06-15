#include <nvboard.h>
#include <Vtop.h>
#include <chrono>

static TOP_NAME dut;

void nvboard_bind_all_pins(TOP_NAME* top);

static void single_cycle() {
  dut.clk = 0; dut.eval();
  std::this_thread::sleep_for(std::chrono::milliseconds(1)); 
  dut.clk = 1; dut.eval();
  std::this_thread::sleep_for(std::chrono::milliseconds(1)); // 2ms per cycle, 500Hz
}

static void reset(int n) {
  dut.rst = 1;
  while (n -- > 0) single_cycle();
  dut.rst = 0;
}

int main() {
  nvboard_bind_all_pins(&dut);
  nvboard_init();

  reset(10);

  while(1) {
    nvboard_update();
    single_cycle();
  }
}
