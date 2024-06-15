module check_clock(
  input clk,
  output reg clk_led
);
parameter [23:0] ONE_SECOND = 24'd12000000;

reg [23:0] timer;

always @(posedge clk) begin
  if (timer == ONE_SECOND - 1) begin
    timer <= 0;
    clk_led <= ~clk_led;
  end else begin
    timer <= timer + 1;
  end
end

endmodule


module top (
  input clk,  // 时钟信号
  input rst,  // 复位信号
  input M,  // 模式选择信号
  input mode, // 切换手动/自动模式
  input trig, // 触发信号 
  input spd_up, 
  input spd_down,
  output wire [6:0] seg7_out,    // 7段数码管输出
  output wire [6:0] speed_disp,  // 速度显示
  output reg mode_led,
  output [1:0] seg_en,
  output [2:0] state_led,
  output [5:0] btn_led, // 
  output wire clk_led
);

wire [2:0] state;  // 状态
reg [3:0] speed;  // 速度

reg last_spd_up;
reg last_spd_down;

assign state_led = ~state;
assign seg_en = 2'b00;
assign btn_led = {M, mode, rst, spd_down, spd_up, trig};

always @(posedge clk) begin
  last_spd_up <= spd_up;
  last_spd_down <= spd_down;
end

always @(posedge clk or negedge rst) begin
  if (!rst) begin
    speed <= 4'b0001;
  end else if (!mode) begin
    mode_led <= 0;
    if (spd_up && !last_spd_up) begin
      speed <= speed + 1;
    end else if (spd_down && !last_spd_down) begin
      speed <= speed - 1;
    end
  end else if (mode) begin 
    mode_led <= 1;
  end
end

// 状态转换模块
state_convert state_convert_inst (
  .clk(clk),
  .CR(rst),
  .M(M),
  .mode(mode),
  .trigger(trig),
  .speed(speed),
  .data(state)
);

// 3位二进制数到7段数码管模块
bit_4_to_seg7 bit_3_to_seg7_inst (
  .binary_in({1'b0, state}),
  .seg7_out(seg7_out)
);

// 3位二进制数到速度显示模块
bit_4_to_seg7 speed_disp_inst (
  .binary_in(speed),
  .seg7_out(speed_disp)
);

check_clock check_clock_inst (
  .clk(clk),
  .clk_led(clk_led)
);

endmodule
