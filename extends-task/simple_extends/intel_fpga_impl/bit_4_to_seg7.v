module bit_4_to_seg7 (
	input [3:0] binary_in,  // 3位二进制输入
	output reg [6:0] seg7_out    // 7段数码管输出
);

always @(*) begin
	// 根据输入的3位二进制数设置7段数码管输出
	case (binary_in)
		4'b0000: seg7_out = ~7'b1000000;  // 0
		4'b0001: seg7_out = ~7'b1111001;  // 1
		4'b0010: seg7_out = ~7'b0100100;  // 2
		4'b0011: seg7_out = ~7'b0110000;  // 3
		4'b0100: seg7_out = ~7'b0011001;  // 4
		4'b0101: seg7_out = ~7'b0010010;  // 5
		4'b0110: seg7_out = ~7'b0000010;  // 6
		4'b0111: seg7_out = ~7'b1111000;  // 7
		4'b1000: seg7_out = ~7'b0000000;  // 8
		4'b1001: seg7_out = ~7'b0010000;  // 9
		4'b1010: seg7_out = ~7'b0001000;  // A
		4'b1011: seg7_out = ~7'b0000011;  // B
		4'b1100: seg7_out = ~7'b1000110;  // C
		4'b1101: seg7_out = ~7'b0100001;  // D
		4'b1110: seg7_out = ~7'b0000110;  // E
		4'b1111: seg7_out = ~7'b0001110;  // F
	endcase
end

endmodule