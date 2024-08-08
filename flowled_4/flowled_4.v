module flowled_4(
    input sys_clk,
    input sys_rst_n,
    
    output reg [3:0] led
);

reg [24:0] cnt;

//计数
always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        cnt <= 25'd0;
    else if(cnt < (25'd1000_0000 - 25'd1))
        cnt <= cnt + 25'd1;
    else
        cnt <= 25'd0;
end

//led移位控制
always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        led <= 4'b0001;
    else if(cnt < (25'd1000_0000 - 25'd1))
        if(led === 4'b1000)
            led <= 4'b0001;
        else 
            led <= led << 1;
    else
        led <= led;
end
        
        endmodule