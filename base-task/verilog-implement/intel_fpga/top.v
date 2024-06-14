module top (
  input clk,  // 时钟信号
  input rst,  // 复位信号
  input M,  // 模式选择信号
  output wire [6:0] seg7_out    // 7段数码管输出
);

wire [2:0] state;  // 状态寄存器

// 状态转换模块
state_convert state_convert_inst (
  .clk(clk),
  .CR(rst),
  .M(M),
  .data(state)
);

// 3位二进制数到7段数码管模块
bit_3_to_seg7 bit_3_to_seg7_inst (
  .binary_in(state),
  .seg7_out(seg7_out)
);

endmodule
