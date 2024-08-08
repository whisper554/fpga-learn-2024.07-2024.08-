`timescale 1ns / 1ns 

module key_led_2_tb();

//parameter define
parameter  CLK_PERIOD = 20;

//reg define
reg sys_clk;
reg sys_rst_n;
reg [1:0] key;

//wire define
wire [1:0] led;

//initial
initial begin
    sys_clk <= 1'b0;
    sys_rst_n <= 1'b0;
    key <= 2'b00;
    #200
    sys_rst_n <= 1'b1;
    
    //key
        #200
        key <= 2'b11;
        #1000
        key <= 2'b10;
        #1000
        key <= 2'b11;
        #1000
        key <= 2'b01;
end

//clk
always #(CLK_PERIOD/2) sys_clk = ~sys_clk;

key_led_2  u_key_led_2(
    .sys_clk      (sys_clk),
    .sys_rst_n    (sys_rst_n),
    .key          (key),
    .led          (led)
);

 endmodule