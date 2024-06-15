module state_convert (
  input clk,
  input CR,
  input M,
  input mode,
  input trigger,
  input [2:0] speed,

  output reg [2:0] data
);
// nvboard加了2ms延时，相当于500Hz

reg [8:0] CLOCK;

always @(posedge clk) begin
    // 根据speed的值，设置CLOCK的值
    case (speed)
        3'b000: CLOCK = 9'd0;
        3'b001: CLOCK = 9'd500;
        3'b010: CLOCK = 9'd250;
        3'b011: CLOCK = 9'd167;
        3'b100: CLOCK = 9'd125;
        3'b101: CLOCK = 9'd100;
        3'b110: CLOCK = 9'd83;
        3'b111: CLOCK = 9'd71;
    endcase 
end

reg [8:0] timer;
reg signal;
reg last_trigger;

always @(posedge clk) begin
    last_trigger <= trigger;
end

always @(posedge clk or posedge CR) begin
    if (CR) begin
        timer <= 0;
        signal <= 0;
    end else if (!mode && !(CLOCK==0)) begin  // 自动模式
        if (timer >= CLOCK - 1) begin
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

always @(posedge CR or posedge signal) begin 
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


