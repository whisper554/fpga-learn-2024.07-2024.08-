`timescale 1ns/1ns

module ip_fifo_tb();

//parameter
parameter  CLK_PERIOD = 20;

//reg
reg     sys_clk;
reg     sys_rst_n;

//initial
initial begin
    sys_clk = 1'b0;
    sys_rst_n = 1'b0;
    #200
    sys_rst_n = 1'b1;
end

//clk
always #(CLK_PERIOD/2) sys_clk = ~sys_clk;

//u_ip_fifo
ip_fifo u_ip_fifo(
.sys_clk          (sys_clk),
.sys_rst_n        (sys_rst_n) 
);

        endmodule