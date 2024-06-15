module state_convert (
  input clk,
  input CR,
  input M,
  input mode,
  input trigger,
  input [3:0] speed,

  output reg [2:0] data
);

reg [23:0] clock;

parameter [23:0] ONE_SECOND = 24'd12000000;

always @(posedge clk) begin
    // 根据speed的值，设置CLOCK的值
    case (speed)
        4'b0000: clock = 24'd0;
        4'b0001: clock = ONE_SECOND;
        4'b0010: clock = ONE_SECOND / 2;
        4'b0011: clock = ONE_SECOND / 3;
        4'b0100: clock = ONE_SECOND / 4;
        4'b0101: clock = ONE_SECOND / 5;
        4'b0110: clock = ONE_SECOND / 6;
        4'b0111: clock = ONE_SECOND / 7;
        4'b1000: clock = ONE_SECOND / 8;
        4'b1001: clock = ONE_SECOND / 9;
        4'b1010: clock = ONE_SECOND / 10;
        4'b1011: clock = ONE_SECOND / 11;
        4'b1100: clock = ONE_SECOND / 12;
        4'b1101: clock = ONE_SECOND / 13;
        4'b1110: clock = ONE_SECOND / 14;
        4'b1111: clock = ONE_SECOND / 15;
    endcase 
end

reg [23:0] timer;
reg signal;
reg last_trigger;

always @(posedge clk) begin
    last_trigger <= trigger;
end

always @(posedge clk or negedge CR) begin
    if (!CR) begin
        timer <= 0;
        signal <= 0;
    end else if (!mode && !(clock==0)) begin  // 自动模式
        if (timer >= clock - 1) begin
            timer <= 0;
            signal <= 1; 
        end else begin
            timer <= timer + 1;
            signal <= 0;
        end 
    end else if (mode) begin  // 手动模式
        if (trigger && !last_trigger) begin
            signal <= 1;
        end else begin
            signal <= 0;
        end
    end
end

always @(negedge CR or posedge signal) begin 
    if (!CR) begin
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


