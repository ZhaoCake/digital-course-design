package state_convert

import chisel3._
import chisel3.util._

class StateConvert extends Module {
  val io = IO(new Bundle {
    val clk  = Input(Clock())
    val CR   = Input(Bool())
    val M    = Input(Bool())
    val data = Output(UInt(3.W))
  })

  // 定义寄存器来存储状态
  val dataReg = RegInit(3.U(3.W))

  // 异步复位的实现
  when(io.CR) {
    dataReg := 3.U // 复位为 3'b111
  }.elsewhen(io.M) {
    // M == 1 时的状态转换
    dataReg := MuxLookup(dataReg, 0.U)(
      Seq(
        0.U -> 6.U, // 3'b000 -> 3'b110
        1.U -> 3.U, // 3'b001 -> 3'b011
        2.U -> 6.U, // 3'b010 -> 3'b110
        3.U -> 2.U, // 3'b011 -> 3'b010
        4.U -> 5.U, // 3'b100 -> 3'b101
        5.U -> 1.U, // 3'b101 -> 3'b001
        6.U -> 4.U, // 3'b110 -> 3'b100
        7.U -> 0.U  // 3'b111 -> 3'b000
      )
    )
  }.otherwise {
    // M == 0 时的状态转换
    dataReg := MuxLookup(dataReg, 0.U)(
      Seq(
        0.U -> 6.U, // 3'b000 -> 3'b110
        1.U -> 5.U, // 3'b001 -> 3'b101
        2.U -> 3.U, // 3'b010 -> 3'b011
        3.U -> 1.U, // 3'b011 -> 3'b001
        4.U -> 6.U, // 3'b100 -> 3'b110
        5.U -> 4.U, // 3'b101 -> 3'b100
        6.U -> 2.U, // 3'b110 -> 3'b010
        7.U -> 0.U  // 3'b111 -> 3'b000
      )
    )
  }

  // 输出连接
  io.data := dataReg
}
