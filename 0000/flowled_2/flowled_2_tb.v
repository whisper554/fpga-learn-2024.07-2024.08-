`timescale 1ns / 1ns 

module tb_flow_led();

//parameter define
parameter  CLK_PERIOD = 20;

//reg define
reg           sys_clk;
reg           sys_rst_n;

//wire define
wire  [1:0]   led;

initial begin
    sys_clk <= 1'b0;
    sys_rst_n <= 1'b0;
    #200
    sys_rst_n <= 1'b1;
end

always #(CLK_PERIOD/2) sys_clk = ~sys_clk;

flow_led  u_flow_led(
    .sys_clk      (sys_clk),
    .sys_rst_n    (sys_rst_n),
    .led          (led)
    );

endmodule