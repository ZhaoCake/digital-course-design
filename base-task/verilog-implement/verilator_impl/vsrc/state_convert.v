module state_convert (
  input clk,
  input CR,
  input M,

  output reg[2:0] data 
);
// 没有晶振，无法按秒数来，仿真里面按照2s一个周期来的。

always @(posedge CR or posedge clk) begin 
    if (CR) begin
        data <= 3'b111;
    end else begin
        if (M == 1) begin
            case (data)
                3'b000: data <= 3'b110;
                3'b001: data <= 3'b011;
                3'b010: data <= 3'b110;
                3'b011: data <= 3'b010;
                3'b100: data <= 3'b101;
                3'b101: data <= 3'b001;
                3'b110: data <= 3'b100;
                3'b111: data <= 3'b000;
            endcase
        end else if (M == 0) begin
            case (data)
                3'b000: data <= 3'b110;
                3'b001: data <= 3'b101;
                3'b010: data <= 3'b011;
                3'b011: data <= 3'b001;
                3'b100: data <= 3'b110;
                3'b101: data <= 3'b100;
                3'b110: data <= 3'b010;
                3'b111: data <= 3'b000;
            endcase
        end
    end
end

endmodule


