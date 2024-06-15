#include <nvboard.h>
#include <Vtop.h>
#include <chrono>

static TOP_NAME dut;

void nvboard_bind_all_pins(TOP_NAME* top);

static void single_cycle() {
  dut.clk = 0; dut.eval();
  // 1/24Mhz = 41.67ns
  // std::this_thread::sleep_for(std::chrono::nanoseconds(42));
  dut.clk = 1; dut.eval();
  // std::this_thread::sleep_for(std::chrono::nanoseconds(42));
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
