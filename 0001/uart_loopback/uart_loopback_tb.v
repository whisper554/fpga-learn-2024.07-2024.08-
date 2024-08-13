`timescale 1ns/1ns

module uart_loopback_tb();

// wire
wire uart_txd;

// parameter
parameter  CLK_PERIOD = 20;

// reg
reg     sys_clk;
reg     sys_rst_n;
reg     uart_rxd;

// initial
initial begin
    sys_clk <= 1'b0;
    sys_rst_n <= 1'b0;
    uart_rxd <= 1'b1;
    #200
    sys_rst_n <= 1'b1;
    
    #1000
    uart_rxd <= 1'b0;   // start
    #8680
    uart_rxd <= 1'b1;   // D0
    #8680
    uart_rxd <= 1'b0;   // D1
    #8680
    uart_rxd <= 1'b1;   // D2
    #8680
    uart_rxd <= 1'b0;   // D3
    #8680
    uart_rxd <= 1'b1;   // D4
    #8680
    uart_rxd <= 1'b0;   // D5
    #8680
    uart_rxd <= 1'b1;   // D6
    #8680
    uart_rxd <= 1'b0;   // D7
    #8680
    uart_rxd <= 1'b1;   // stop
    #8680
    uart_rxd <= 1'b1;   // null
    
end

// clk
always #(CLK_PERIOD/2) sys_clk = ~sys_clk;

// u_uart_loopback
uart_loopback u_uart_loopback(
.sys_clk        (sys_clk),
.sys_rst_n      (sys_rst_n),
.uart_rxd       (uart_rxd),
.uart_txd       (uart_txd)
);

        endmodule