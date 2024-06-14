module state_convert (
  input clk,
  input CR,
  input M,

  output reg [2:0] data 
);
// 晶振12MHz

parameter [23:0] CLOCK = 24'd12000000;
reg [23:0] timer;
reg signal;

always @(posedge clk or posedge CR) begin
    if (CR) begin
        timer <= 0;
        signal <= 0;
    end else if (timer >= CLOCK - 1) begin
        timer <= 0;
        signal <= 1; 
    end else begin
        timer <= timer + 1;
        signal <= 0;
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


