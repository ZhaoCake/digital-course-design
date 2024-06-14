module bit_3_to_seg7 (
	input [2:0] binary_in,  // 3位二进制输入
	output reg [6:0] seg7_out    // 7段数码管输出
);

always @(*) begin
	// 根据输入的3位二进制数设置7段数码管输出
	case (binary_in)
		3'b000: seg7_out = 7'b1000000;  // 0
		3'b001: seg7_out = 7'b1111001;  // 1
		3'b010: seg7_out = 7'b0100100;  // 2
		3'b011: seg7_out = 7'b0110000;  // 3
		3'b100: seg7_out = 7'b0011001;  // 4
		3'b101: seg7_out = 7'b0010010;  // 5
		3'b110: seg7_out = 7'b0000010;  // 6
		3'b111: seg7_out = 7'b1111000;  // 7
	endcase
end

endmodule