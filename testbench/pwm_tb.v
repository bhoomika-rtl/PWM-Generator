`timescale 1ns / 1ps

module pwm_tb();
    reg clk;
    reg rst;
    wire pwm_out;

    pwm uut (
        .clk(clk),
        .rst(rst),
        .pwm_out(pwm_out)
    );

    initial
    begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial
    begin
        rst = 1;
        #20;
        rst = 0;
        #35000;
        $finish;
    end

endmodule