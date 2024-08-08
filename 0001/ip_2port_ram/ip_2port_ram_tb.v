`timescale 1ns / 1ns

module ip_2port_ram_tb();

//parameter define
parameter  CLK_PERIOD = 20;

//reg define
reg     sys_clk;
reg     sys_rst_n;

initial begin
    sys_clk = 1'b0;
    sys_rst_n = 1'b0;
    #200
    sys_rst_n = 1'b1;
end

always #(CLK_PERIOD/2) sys_clk = ~sys_clk;

ip_2port_ram u_ip_2port_ram(
    .sys_clk          (sys_clk        ),
    .sys_rst_n        (sys_rst_n      ) 
    );

        endmodule