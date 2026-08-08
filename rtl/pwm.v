`timescale 1ns / 1ps

module pwm(
    input clk,
    input rst,
    output reg pwm_out
);

parameter PERIOD = 100;
parameter STEP = 5;
reg [6:0] count = 0;
reg [6:0] ton = 0;

always @(posedge clk)
begin
    if (rst)
    begin
        count <= 0;
        ton <= 0;
        pwm_out <= 1'b0;
    end
    else
    begin
        // PWM signal generation
        if (count < ton)
            pwm_out <= 1'b1;
        else
            pwm_out <= 1'b0;

        // Counter
        if (count == PERIOD - 1)
        begin
            count <= 0;
            if (ton + STEP <= PERIOD)
            ton <= ton + STEP;
            else
            ton <= 0;
        end
else
    count <= count + 1;
    end
end

endmodule